Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EBA4468DF
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 20:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbhKETYO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 15:24:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:37958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233311AbhKETYL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Nov 2021 15:24:11 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C91E761263;
        Fri,  5 Nov 2021 19:21:31 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mj4mH-003ig2-Ut; Fri, 05 Nov 2021 19:21:30 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Sean Christopherson <seanjc@google.com>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        kernel-team@android.com
Subject: [PATCH 5/5] KVM: Convert the kvm->vcpus array to a xarray
Date:   Fri,  5 Nov 2021 19:21:01 +0000
Message-Id: <20211105192101.3862492-6-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211105192101.3862492-1-maz@kernel.org>
References: <20211105192101.3862492-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, linux-mips@vger.kernel.org, kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, anup.patel@wdc.com, atish.patra@wdc.com, borntraeger@de.ibm.com, frankja@linux.ibm.com, david@redhat.com, imbrenda@linux.ibm.com, pbonzini@redhat.com, jgross@suse.com, npiggin@gmail.com, seanjc@google.com, paulus@samba.org, mpe@ellerman.id.au, james.morse@arm.com, suzuki.poulose@arm.com, alexandru.elisei@arm.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

At least on arm64 and x86, the vcpus array is pretty huge (512 entries),
and is mostly empty in most cases (running 512 vcpu VMs is not that
common). This mean that we end-up with a 4kB block of unused memory
in the middle of the kvm structure.

Instead of wasting away this memory, let's use an xarray instead,
which gives us almost the same flexibility as a normal array, but
with a reduced memory usage with smaller VMs.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/kvm_host.h |  5 +++--
 virt/kvm/kvm_main.c      | 15 +++++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 36967291b8c6..3933d825e28b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -29,6 +29,7 @@
 #include <linux/refcount.h>
 #include <linux/nospec.h>
 #include <linux/notifier.h>
+#include <linux/xarray.h>
 #include <asm/signal.h>
 
 #include <linux/kvm.h>
@@ -552,7 +553,7 @@ struct kvm {
 	struct mutex slots_arch_lock;
 	struct mm_struct *mm; /* userspace tied to this vm */
 	struct kvm_memslots __rcu *memslots[KVM_ADDRESS_SPACE_NUM];
-	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
+	struct xarray vcpu_array;
 
 	/* Used to wait for completion of MMU notifiers.  */
 	spinlock_t mn_invalidate_lock;
@@ -693,7 +694,7 @@ static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
 
 	/* Pairs with smp_wmb() in kvm_vm_ioctl_create_vcpu.  */
 	smp_rmb();
-	return kvm->vcpus[i];
+	return xa_load(&kvm->vcpu_array, i);
 }
 
 #define kvm_for_each_vcpu(idx, vcpup, kvm) \
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d83553eeea21..4c18d7911fa5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -461,7 +461,7 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 
 	mutex_lock(&kvm->lock);
 	for (i = 0; i < atomic_read(&kvm->online_vcpus); i++)
-		kvm->vcpus[i] = NULL;
+		xa_erase(&kvm->vcpu_array, i);
 
 	atomic_set(&kvm->online_vcpus, 0);
 	mutex_unlock(&kvm->lock);
@@ -1066,6 +1066,7 @@ static struct kvm *kvm_create_vm(unsigned long type)
 	mutex_init(&kvm->slots_arch_lock);
 	spin_lock_init(&kvm->mn_invalidate_lock);
 	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
+	xa_init(&kvm->vcpu_array);
 
 	INIT_LIST_HEAD(&kvm->devices);
 
@@ -3661,7 +3662,10 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
 	}
 
 	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
-	BUG_ON(kvm->vcpus[vcpu->vcpu_idx]);
+	r = xa_insert(&kvm->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
+	BUG_ON(r == -EBUSY);
+	if (r)
+		goto unlock_vcpu_destroy;
 
 	/* Fill the stats id string for the vcpu */
 	snprintf(vcpu->stats_id, sizeof(vcpu->stats_id), "kvm-%d/vcpu-%d",
@@ -3671,15 +3675,14 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
 	kvm_get_kvm(kvm);
 	r = create_vcpu_fd(vcpu);
 	if (r < 0) {
+		xa_erase(&kvm->vcpu_array, vcpu->vcpu_idx);
 		kvm_put_kvm_no_destroy(kvm);
 		goto unlock_vcpu_destroy;
 	}
 
-	kvm->vcpus[vcpu->vcpu_idx] = vcpu;
-
 	/*
-	 * Pairs with smp_rmb() in kvm_get_vcpu.  Write kvm->vcpus
-	 * before kvm->online_vcpu's incremented value.
+	 * Pairs with smp_rmb() in kvm_get_vcpu.  Store the vcpu
+	 * pointer before kvm->online_vcpu's incremented value.
 	 */
 	smp_wmb();
 	atomic_inc(&kvm->online_vcpus);
-- 
2.30.2

