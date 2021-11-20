Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E6A457CEC
	for <lists+linux-mips@lfdr.de>; Sat, 20 Nov 2021 11:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233655AbhKTKbo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Nov 2021 05:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhKTKbg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Nov 2021 05:31:36 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A86C06174A;
        Sat, 20 Nov 2021 02:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Reply-To:Content-ID:Content-Description;
        bh=n8HBfWTu5bw0VUA5DxZAxr1KwmgBFzh4k/s7aD89EFg=; b=k7Q83HP6YZuTClV8WeAFlsoLNg
        HV8ASY99qfCDPu5N1IjN0z7wybRC7qEFOoaR09TsGb+zq61fg+hRQ7DLRVVxS3+gq++iUstp7AME6
        YBHoAlke5i6gQ6WMLH4gDHKKW6lZbf6IClWYNrFoNnF6Lkh4tqRZ1bjj9uNC+zWjInQis+o4Ow/D/
        /dKp4wJt/0LFVc23P/e4IgX1jE9mOL7MwzECjtG1BYXGLSIMek173W7C+c+PjcpZnbAMOHWLsvd7F
        OsKFcSnwEUUh7O2jDQi8yvdwGa+p/ic9bKxHlufMFJf4K+NxobPguwhnJUODAHK8/fQfvsMnSMoFc
        zr2crqRA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1moNbQ-00AUNI-Vg; Sat, 20 Nov 2021 10:28:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1moNbQ-0002KQ-P7; Sat, 20 Nov 2021 10:28:12 +0000
From:   David Woodhouse <dwmw2@infradead.org>
To:     Paolo Bonzini <pbonzini@redhat.com>, kvm <kvm@vger.kernel.org>
Cc:     Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        "jmattson @ google . com" <jmattson@google.com>,
        "wanpengli @ tencent . com" <wanpengli@tencent.com>,
        "seanjc @ google . com" <seanjc@google.com>,
        "vkuznets @ redhat . com" <vkuznets@redhat.com>,
        "mtosatti @ redhat . com" <mtosatti@redhat.com>,
        "joro @ 8bytes . org" <joro@8bytes.org>, karahmed@amazon.com,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Anup Patel <anup.patel@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: [PATCH v4 08/11] KVM: Reinstate gfn_to_pfn_cache with invalidation support
Date:   Sat, 20 Nov 2021 10:28:07 +0000
Message-Id: <20211120102810.8858-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211120102810.8858-1-dwmw2@infradead.org>
References: <20211120102810.8858-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: David Woodhouse <dwmw@amazon.co.uk>

This can be used in two modes. There is an atomic mode where the cached
mapping is accessed while holding the rwlock, and a mode where the
physical address is used by a vCPU in guest mode.

For the latter case, an invalidation will wake the vCPU with the new
KVM_REQ_GPC_INVALIDATE, and the architecture will need to refresh any
caches it still needs to access before entering guest mode again.

Only one vCPU can be targeted by the wake requests; it's simple enough
to make it wake all vCPUs or even a mask but I don't see a use case for
that additional complexity right now.

Invalidation happens from the invalidate_range_start MMU notifier, which
needs to be able to sleep in order to wake the vCPU and wait for it.

This means that revalidation potentially needs to "wait" for the MMU
operation to complete and the invalidate_range_end notifier to be
invoked. Like the vCPU when it takes a page fault in that period, we
just spin — fixing that in a future patch by implementing an actual
*wait* may be another part of shaving this particularly hirsute yak.

As noted in the comments in the function itself, the only case where
the invalidate_range_start notifier is expected to be called *without*
being able to sleep is when the OOM reaper is killing the process. In
that case, we expect the vCPU threads already to have exited, and thus
there will be nothing to wake, and no reason to wait. So we clear the
KVM_REQUEST_WAIT bit and send the request anyway, then complain loudly
if there actually *was* anything to wake up.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/Kconfig              |   1 +
 include/linux/kvm_host.h          | 103 ++++++++++
 include/linux/kvm_types.h         |  18 ++
 virt/kvm/Kconfig                  |   3 +
 virt/kvm/Makefile.kvm             |   1 +
 virt/kvm/dirty_ring.c             |   2 +-
 virt/kvm/kvm_main.c               |  12 +-
 virt/kvm/{mmu_lock.h => kvm_mm.h} |  23 ++-
 virt/kvm/pfncache.c               | 318 ++++++++++++++++++++++++++++++
 9 files changed, 474 insertions(+), 7 deletions(-)
 rename virt/kvm/{mmu_lock.h => kvm_mm.h} (55%)
 create mode 100644 virt/kvm/pfncache.c

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index d7fa0a42ac25..af351107d47f 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -26,6 +26,7 @@ config KVM
 	select PREEMPT_NOTIFIERS
 	select MMU_NOTIFIER
 	select HAVE_KVM_IRQCHIP
+	select HAVE_KVM_PFNCACHE
 	select HAVE_KVM_IRQFD
 	select HAVE_KVM_DIRTY_RING
 	select IRQ_BYPASS_MANAGER
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c310648cc8f1..457c38d75913 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -151,6 +151,7 @@ static inline bool is_error_page(struct page *page)
 #define KVM_REQ_UNBLOCK           2
 #define KVM_REQ_UNHALT            3
 #define KVM_REQ_VM_DEAD           (4 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
+#define KVM_REQ_GPC_INVALIDATE    (5 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQUEST_ARCH_BASE     8
 
 #define KVM_ARCH_REQ_FLAGS(nr, flags) ({ \
@@ -559,6 +560,10 @@ struct kvm {
 	unsigned long mn_active_invalidate_count;
 	struct rcuwait mn_memslots_update_rcuwait;
 
+	/* For management / invalidation of gfn_to_pfn_caches */
+	spinlock_t gpc_lock;
+	struct list_head gpc_list;
+
 	/*
 	 * created_vcpus is protected by kvm->lock, and is incremented
 	 * at the beginning of KVM_CREATE_VCPU.  online_vcpus is only
@@ -966,6 +971,104 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 			 unsigned long len);
 void kvm_vcpu_mark_page_dirty(struct kvm_vcpu *vcpu, gfn_t gfn);
 
+/**
+ * kvm_gfn_to_pfn_cache_init - prepare a cached kernel mapping and HPA for a
+ *                             given guest physical address.
+ *
+ * @kvm:	   pointer to kvm instance.
+ * @gpc:	   struct gfn_to_pfn_cache object.
+ * @vcpu:	   vCPU to be used for marking pages dirty and to be woken on
+ *		   invalidation.
+ * @guest_uses_pa: indicates that the resulting host physical PFN is used while
+ *		   @vcpu is IN_GUEST_MODE so invalidations should wake it.
+ * @kernel_map:    requests a kernel virtual mapping (kmap / memremap).
+ * @gpa:	   guest physical address to map.
+ * @len:	   sanity check; the range being access must fit a single page.
+ * @dirty:         mark the cache dirty immediately.
+ *
+ * @return:	   0 for success.
+ *		   -EINVAL for a mapping which would cross a page boundary.
+ *                 -EFAULT for an untranslatable guest physical address.
+ *
+ * This primes a gfn_to_pfn_cache and links it into the @kvm's list for
+ * invalidations to be processed. Invalidation callbacks to @vcpu using
+ * %KVM_REQ_GPC_INVALIDATE will occur only for MMU notifiers, not for KVM
+ * memslot changes. Callers are required to use kvm_gfn_to_pfn_cache_check()
+ * to ensure that the cache is valid before accessing the target page.
+ */
+int kvm_gfn_to_pfn_cache_init(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
+			      struct kvm_vcpu *vcpu, bool guest_uses_pa,
+			      bool kernel_map, gpa_t gpa, unsigned long len,
+			      bool dirty);
+
+/**
+ * kvm_gfn_to_pfn_cache_check - check validity of a gfn_to_pfn_cache.
+ *
+ * @kvm:	   pointer to kvm instance.
+ * @gpc:	   struct gfn_to_pfn_cache object.
+ * @gpa:	   current guest physical address to map.
+ * @len:	   sanity check; the range being access must fit a single page.
+ * @dirty:         mark the cache dirty immediately.
+ *
+ * @return:	   %true if the cache is still valid and the address matches.
+ *		   %false if the cache is not valid.
+ *
+ * Callers outside IN_GUEST_MODE context should hold a read lock on @gpc->lock
+ * while calling this function, and then continue to hold the lock until the
+ * access is complete.
+ *
+ * Callers in IN_GUEST_MODE may do so without locking, although they should
+ * still hold a read lock on kvm->scru for the memslot checks.
+ */
+bool kvm_gfn_to_pfn_cache_check(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
+				gpa_t gpa, unsigned long len);
+
+/**
+ * kvm_gfn_to_pfn_cache_refresh - update a previously initialized cache.
+ *
+ * @kvm:	   pointer to kvm instance.
+ * @gpc:	   struct gfn_to_pfn_cache object.
+ * @gpa:	   updated guest physical address to map.
+ * @len:	   sanity check; the range being access must fit a single page.
+ * @dirty:         mark the cache dirty immediately.
+ *
+ * @return:	   0 for success.
+ *		   -EINVAL for a mapping which would cross a page boundary.
+ *                 -EFAULT for an untranslatable guest physical address.
+ *
+ * This will attempt to refresh a gfn_to_pfn_cache. Note that a successful
+ * returm from this function does not mean the page can be immediately
+ * accessed because it may have raced with an invalidation. Callers must
+ * still lock and check the cache status, as this function does not return
+ * with the lock still held to permit access.
+ */
+int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
+				 gpa_t gpa, unsigned long len, bool dirty);
+
+/**
+ * kvm_gfn_to_pfn_cache_unmap - temporarily unmap a gfn_to_pfn_cache.
+ *
+ * @kvm:	   pointer to kvm instance.
+ * @gpc:	   struct gfn_to_pfn_cache object.
+ *
+ * This unmaps the referenced page and marks it dirty, if appropriate. The
+ * cache is left in the invalid state but at least the mapping from GPA to
+ * userspace HVA will remain cached and can be reused on a subsequent
+ * refresh.
+ */
+void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc);
+
+/**
+ * kvm_gfn_to_pfn_cache_destroy - destroy and unlink a gfn_to_pfn_cache.
+ *
+ * @kvm:	   pointer to kvm instance.
+ * @gpc:	   struct gfn_to_pfn_cache object.
+ *
+ * This removes a cache from the @kvm's list to be processed on MMU notifier
+ * invocation.
+ */
+void kvm_gfn_to_pfn_cache_destroy(struct kvm *kvm, struct gfn_to_pfn_cache *gpc);
+
 void kvm_sigset_activate(struct kvm_vcpu *vcpu);
 void kvm_sigset_deactivate(struct kvm_vcpu *vcpu);
 
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 234eab059839..22a52ef12b4d 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -19,6 +19,7 @@ struct kvm_memslots;
 enum kvm_mr_change;
 
 #include <linux/types.h>
+#include <linux/spinlock_types.h>
 
 #include <asm/kvm_types.h>
 
@@ -53,6 +54,23 @@ struct gfn_to_hva_cache {
 	struct kvm_memory_slot *memslot;
 };
 
+struct gfn_to_pfn_cache {
+	u64 generation;
+	gpa_t gpa;
+	unsigned long uhva;
+	struct kvm_memory_slot *memslot;
+	struct kvm_vcpu *vcpu;
+	struct list_head list;
+	rwlock_t lock;
+	void *khva;
+	kvm_pfn_t pfn;
+	bool active;
+	bool valid;
+	bool dirty;
+	bool kernel_map;
+	bool guest_uses_pa;
+};
+
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 /*
  * Memory caches are used to preallocate memory ahead of various MMU flows,
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 97cf5413ac25..f4834c20e4a6 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -4,6 +4,9 @@
 config HAVE_KVM
        bool
 
+config HAVE_KVM_PFNCACHE
+       bool
+
 config HAVE_KVM_IRQCHIP
        bool
 
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index ffdcad3cc97a..2c27d5d0c367 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -11,3 +11,4 @@ kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
 kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
+kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 8e9874760fb3..222ecc81d7df 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -9,7 +9,7 @@
 #include <linux/vmalloc.h>
 #include <linux/kvm_dirty_ring.h>
 #include <trace/events/kvm.h>
-#include "mmu_lock.h"
+#include "kvm_mm.h"
 
 int __weak kvm_cpu_dirty_log_size(void)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8eb8c962838d..e639481456b8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -59,7 +59,7 @@
 
 #include "coalesced_mmio.h"
 #include "async_pf.h"
-#include "mmu_lock.h"
+#include "kvm_mm.h"
 #include "vfio.h"
 
 #define CREATE_TRACE_POINTS
@@ -684,6 +684,9 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	kvm->mn_active_invalidate_count++;
 	spin_unlock(&kvm->mn_invalidate_lock);
 
+	gfn_to_pfn_cache_invalidate_start(kvm, range->start, range->end,
+					  hva_range.may_block);
+
 	__kvm_handle_hva_range(kvm, &hva_range);
 
 	return 0;
@@ -1051,6 +1054,9 @@ static struct kvm *kvm_create_vm(unsigned long type)
 	spin_lock_init(&kvm->mn_invalidate_lock);
 	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
 
+	INIT_LIST_HEAD(&kvm->gpc_list);
+	spin_lock_init(&kvm->gpc_lock);
+
 	INIT_LIST_HEAD(&kvm->devices);
 
 	BUILD_BUG_ON(KVM_MEM_SLOTS_NUM > SHRT_MAX);
@@ -2406,8 +2412,8 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * 2): @write_fault = false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
-			bool write_fault, bool *writable)
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
+		     bool write_fault, bool *writable)
 {
 	struct vm_area_struct *vma;
 	kvm_pfn_t pfn = 0;
diff --git a/virt/kvm/mmu_lock.h b/virt/kvm/kvm_mm.h
similarity index 55%
rename from virt/kvm/mmu_lock.h
rename to virt/kvm/kvm_mm.h
index 9e1308f9734c..b976e4b07e88 100644
--- a/virt/kvm/mmu_lock.h
+++ b/virt/kvm/kvm_mm.h
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#ifndef KVM_MMU_LOCK_H
-#define KVM_MMU_LOCK_H 1
+#ifndef __KVM_MM_H__
+#define __KVM_MM_H__ 1
 
 /*
  * Architectures can choose whether to use an rwlock or spinlock
@@ -20,4 +20,21 @@
 #define KVM_MMU_UNLOCK(kvm)    spin_unlock(&(kvm)->mmu_lock)
 #endif /* KVM_HAVE_MMU_RWLOCK */
 
-#endif
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
+		     bool write_fault, bool *writable);
+
+#ifdef CONFIG_HAVE_KVM_PFNCACHE
+void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
+				       unsigned long start,
+				       unsigned long end,
+				       bool may_block);
+#else
+static inline void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
+						     unsigned long start,
+						     unsigned long end,
+						     bool may_block)
+{
+}
+#endif /* HAVE_KVM_PFNCACHE */
+
+#endif /* __KVM_MM_H__ */
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
new file mode 100644
index 000000000000..5fcbce2a5385
--- /dev/null
+++ b/virt/kvm/pfncache.c
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Kernel-based Virtual Machine driver for Linux
+ *
+ * This module enables kernel and guest-mode vCPU access to guest physical
+ * memory with suitable invalidation mechanisms.
+ *
+ * Copyright © 2021 Amazon.com, Inc. or its affiliates.
+ *
+ * Authors:
+ *   David Woodhouse <dwmw2@infradead.org>
+ */
+
+#include <linux/kvm_host.h>
+#include <linux/kvm.h>
+#include <linux/highmem.h>
+#include <linux/module.h>
+#include <linux/errno.h>
+
+#include "kvm_mm.h"
+
+/*
+ * MMU notifier 'invalidate_range_start' hook.
+ */
+void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm, unsigned long start,
+				       unsigned long end, bool may_block)
+{
+	DECLARE_BITMAP(vcpu_bitmap, KVM_MAX_VCPUS);
+	struct gfn_to_pfn_cache *gpc;
+	bool wake_vcpus = false;
+
+	spin_lock(&kvm->gpc_lock);
+	list_for_each_entry(gpc, &kvm->gpc_list, list) {
+		write_lock_irq(&gpc->lock);
+
+		/* Only a single page so no need to care about length */
+		if (gpc->valid && !is_error_noslot_pfn(gpc->pfn) &&
+		    gpc->uhva >= start && gpc->uhva < end) {
+			gpc->valid = false;
+
+			/*
+			 * If a guest vCPU could be using the physical address,
+			 * it needs to be woken.
+			 */
+			if (gpc->guest_uses_pa) {
+				if (!wake_vcpus) {
+					wake_vcpus = true;
+					bitmap_zero(vcpu_bitmap, KVM_MAX_VCPUS);
+				}
+				__set_bit(gpc->vcpu->vcpu_idx, vcpu_bitmap);
+			}
+
+			/*
+			 * We cannot call mark_page_dirty() from here because
+			 * this physical CPU might not have an active vCPU
+			 * with which to do the KVM dirty tracking.
+			 *
+			 * Neither is there any point in telling the kernel MM
+			 * that the underlying page is dirty. A vCPU in guest
+			 * mode might still be writing to it up to the point
+			 * where we wake them a few lines further down anyway.
+			 *
+			 * So all the dirty marking happens on the unmap.
+			 */
+		}
+		write_unlock_irq(&gpc->lock);
+	}
+	spin_unlock(&kvm->gpc_lock);
+
+	if (wake_vcpus) {
+		unsigned int req = KVM_REQ_GPC_INVALIDATE;
+		bool called;
+
+		/*
+		 * If the OOM reaper is active, then all vCPUs should have
+		 * been stopped already, so perform the request without
+		 * KVM_REQUEST_WAIT and be sad if any needed to be woken.
+		 */
+		if (!may_block)
+			req &= ~KVM_REQUEST_WAIT;
+
+		called = kvm_make_vcpus_request_mask(kvm, req, vcpu_bitmap);
+
+		WARN_ON_ONCE(called && !may_block);
+	}
+}
+
+bool kvm_gfn_to_pfn_cache_check(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
+				gpa_t gpa, unsigned long len)
+{
+	struct kvm_memslots *slots = kvm_memslots(kvm);
+
+	if ((gpa & ~PAGE_MASK) + len > PAGE_SIZE)
+		return false;
+
+	if (gpc->gpa != gpa || gpc->generation != slots->generation ||
+	    kvm_is_error_hva(gpc->uhva))
+		return false;
+
+	if (!gpc->valid)
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(kvm_gfn_to_pfn_cache_check);
+
+static void __release_gpc(struct kvm *kvm, kvm_pfn_t pfn, void *khva,
+			  gpa_t gpa, bool dirty)
+{
+	/* Unmap the old page if it was mapped before */
+	if (!is_error_noslot_pfn(pfn)) {
+		if (pfn_valid(pfn)) {
+			kunmap(pfn_to_page(pfn));
+#ifdef CONFIG_HAS_IOMEM
+		} else {
+			memunmap(khva);
+#endif
+		}
+
+		kvm_release_pfn(pfn, dirty);
+		if (dirty)
+			mark_page_dirty(kvm, gpa);
+	}
+}
+
+int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
+				 gpa_t gpa, unsigned long len, bool dirty)
+{
+	struct kvm_memslots *slots = kvm_memslots(kvm);
+	unsigned long page_offset = gpa & ~PAGE_MASK;
+	kvm_pfn_t old_pfn, new_pfn;
+	unsigned long old_uhva;
+	gpa_t old_gpa;
+	void *old_khva;
+	bool old_valid, old_dirty;
+	int ret = 0;
+
+	/*
+	 * If must fit within a single page. The 'len' argument is
+	 * only to enforce that.
+	 */
+	if (page_offset + len > PAGE_SIZE)
+		return -EINVAL;
+
+	write_lock_irq(&gpc->lock);
+
+	old_gpa = gpc->gpa;
+	old_pfn = gpc->pfn;
+	old_khva = gpc->khva;
+	old_uhva = gpc->uhva;
+	old_valid = gpc->valid;
+	old_dirty = gpc->dirty;
+
+	/* If the userspace HVA is invalid, refresh that first */
+	if (gpc->gpa != gpa || gpc->generation != slots->generation ||
+	    kvm_is_error_hva(gpc->uhva)) {
+		gfn_t gfn = gpa_to_gfn(gpa);
+
+		gpc->dirty = false;
+		gpc->gpa = gpa;
+		gpc->generation = slots->generation;
+		gpc->memslot = __gfn_to_memslot(slots, gfn);
+		gpc->uhva = gfn_to_hva_memslot(gpc->memslot, gfn);
+
+		if (kvm_is_error_hva(gpc->uhva)) {
+			ret = -EFAULT;
+			goto out;
+		}
+
+		gpc->uhva += page_offset;
+	}
+
+	/*
+	 * If the userspace HVA changed or the PFN was already invalid,
+	 * drop the lock and do the HVA to PFN lookup again.
+	 */
+	if (!old_valid || old_uhva != gpc->uhva) {
+		unsigned long uhva = gpc->uhva;
+		void *new_khva = NULL;
+		unsigned long mmu_seq;
+		int retry;
+
+		/* Placeholders for "hva is valid but not yet mapped" */
+		gpc->pfn = KVM_PFN_ERR_FAULT;
+		gpc->khva = NULL;
+		gpc->valid = true;
+
+		write_unlock_irq(&gpc->lock);
+
+	retry_map:
+		mmu_seq = kvm->mmu_notifier_seq;
+		smp_rmb();
+
+		/* We always request a writeable mapping */
+		new_pfn = hva_to_pfn(uhva, false, NULL, true, NULL);
+		if (is_error_noslot_pfn(new_pfn)) {
+			ret = -EFAULT;
+			goto map_done;
+		}
+
+		read_lock(&kvm->mmu_lock);
+		retry = mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
+		read_unlock(&kvm->mmu_lock);
+		if (retry) {
+			cond_resched();
+			goto retry_map;
+		}
+
+		if (gpc->kernel_map) {
+			if (new_pfn == old_pfn) {
+				new_khva = (void *)((unsigned long)old_khva - page_offset);
+				old_pfn = KVM_PFN_ERR_FAULT;
+				old_khva = NULL;
+			} else if (pfn_valid(new_pfn)) {
+				new_khva = kmap(pfn_to_page(new_pfn));
+#ifdef CONFIG_HAS_IOMEM
+			} else {
+				new_khva = memremap(pfn_to_hpa(new_pfn), PAGE_SIZE, MEMREMAP_WB);
+#endif
+			}
+			if (!new_khva)
+				ret = -EFAULT;
+		}
+
+	map_done:
+		write_lock_irq(&gpc->lock);
+		if (ret) {
+			gpc->valid = false;
+			gpc->pfn = KVM_PFN_ERR_FAULT;
+			gpc->khva = NULL;
+		} else {
+			/* At this point, gpc->valid may already have been cleared */
+			gpc->pfn = new_pfn;
+			gpc->khva = new_khva + page_offset;
+		}
+	}
+
+ out:
+	if (ret)
+		gpc->dirty = false;
+	else
+		gpc->dirty = dirty;
+
+	write_unlock_irq(&gpc->lock);
+
+	__release_gpc(kvm, old_pfn, old_khva, old_gpa, old_dirty);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kvm_gfn_to_pfn_cache_refresh);
+
+void kvm_gfn_to_pfn_cache_unmap(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
+{
+	void *old_khva;
+	kvm_pfn_t old_pfn;
+	bool old_dirty;
+	gpa_t old_gpa;
+
+	write_lock_irq(&gpc->lock);
+
+	gpc->valid = false;
+
+	old_khva = gpc->khva;
+	old_dirty = gpc->dirty;
+	old_gpa = gpc->gpa;
+	old_pfn = gpc->pfn;
+
+	/*
+	 * We can leave the GPA → uHVA map cache intact but the PFN
+	 * lookup will need to be redone even for the same page.
+	 */
+	gpc->khva = NULL;
+	gpc->pfn = KVM_PFN_ERR_FAULT;
+
+	write_unlock_irq(&gpc->lock);
+
+	__release_gpc(kvm, old_pfn, old_khva, old_gpa, old_dirty);
+}
+EXPORT_SYMBOL_GPL(kvm_gfn_to_pfn_cache_unmap);
+
+
+int kvm_gfn_to_pfn_cache_init(struct kvm *kvm, struct gfn_to_pfn_cache *gpc,
+			      struct kvm_vcpu *vcpu, bool guest_uses_pa,
+			      bool kernel_map, gpa_t gpa, unsigned long len,
+			      bool dirty)
+{
+	if (!gpc->active) {
+		rwlock_init(&gpc->lock);
+
+		gpc->khva = NULL;
+		gpc->pfn = KVM_PFN_ERR_FAULT;
+		gpc->uhva = KVM_HVA_ERR_BAD;
+		gpc->vcpu = vcpu;
+		gpc->kernel_map = kernel_map;
+		gpc->guest_uses_pa = guest_uses_pa;
+		gpc->valid = false;
+		gpc->active = true;
+
+		spin_lock(&kvm->gpc_lock);
+		list_add(&gpc->list, &kvm->gpc_list);
+		spin_unlock(&kvm->gpc_lock);
+	}
+	return kvm_gfn_to_pfn_cache_refresh(kvm, gpc, gpa, len, dirty);
+}
+EXPORT_SYMBOL_GPL(kvm_gfn_to_pfn_cache_init);
+
+void kvm_gfn_to_pfn_cache_destroy(struct kvm *kvm, struct gfn_to_pfn_cache *gpc)
+{
+	if (gpc->active) {
+		spin_lock(&kvm->gpc_lock);
+		list_del(&gpc->list);
+		spin_unlock(&kvm->gpc_lock);
+
+		kvm_gfn_to_pfn_cache_unmap(kvm, gpc);
+		gpc->active = false;
+	}
+}
+EXPORT_SYMBOL_GPL(kvm_gfn_to_pfn_cache_destroy);
-- 
2.31.1

