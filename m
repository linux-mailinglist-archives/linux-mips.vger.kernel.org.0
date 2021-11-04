Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD97444C34
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 01:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhKDAaE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 20:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbhKDA3B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 20:29:01 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0184C061714
        for <linux-mips@vger.kernel.org>; Wed,  3 Nov 2021 17:26:24 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id w4-20020a1709029a8400b00138e222b06aso1928986plp.12
        for <linux-mips@vger.kernel.org>; Wed, 03 Nov 2021 17:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=8l7d2ySvC5D/YrAT9T6fGMeBNPy379MeMOeE3xh8Oo8=;
        b=XiqYYDck3YcORrnntegA08OaixW9ADI8oEaxX/wY4SPbXeWsD1VXDFcjm/TidROIbZ
         9Q2NVQaj9nLfdl+cqXqf4Kh6YN4XHKJ2zsb+EpNc9IyohK52aJL1q/BFk3/RE0ODcZB8
         GNyUDjWDupQznT03kgrxvb1OE31VaRVNbSDf9CUPNOEAZtkCHw4Qv4MmcZwr3dKGZAmf
         6AxtM+Gz8EmUA7J8IsoIZQr23aa7Awbo74V9XOkz2fAy2yckuLbgCL7Nci1x7Np35zGg
         7ymF90fL+rLQ1XwcldtrRea5GFF57rzNoICly8t9ERXW8JMRQyClod/qJZXUwEJYSp+y
         4VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=8l7d2ySvC5D/YrAT9T6fGMeBNPy379MeMOeE3xh8Oo8=;
        b=M8rOPk6IYeSLcAXKSGHL6HnE25Yl+z0pyFr1Abu7fRDACm3DjzCaAptEmB4gNoIyG0
         k69Z8LsyubicX0mLn958yQo6+/moh2WA6ay/SkUsJohmGB5ISdGCUkYoqpgUj4yC8rz9
         JQncZ3FKwiMkFHotRM6n48bmXFJ73F1DrL7Z+K21tpijgOxK3v9Rtc4c54r0Mu7pPrNH
         jWs79gCCwktsVdx5+9uHsTtximLKHhxsDO3DAo1q2ZUBIojMGblSrpnSZQhhPZLfVse3
         1VwRmj4QiHjv0cOlY1xfxI2dKhy2YKebPoArhlnun9LLPCEpCNWcFttWtwaOmK6DwazE
         D67A==
X-Gm-Message-State: AOAM532UOiQVUB+X6YdQq5BCwGSb5LcE4rAuBWrmUgGLFJ3Xb81t9FNJ
        zeCy0QSSSr9Nk4G93qKWYZEYKiAh0vY=
X-Google-Smtp-Source: ABdhPJySEn7xLw/vUsYntwcby5ILVgW7R0Nx0rQ81XxDarxrzPAk5ll4NJoYw2Lk2jx8oLA22ygGGCPmhvo=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4b43:: with SMTP id
 mi3mr18498246pjb.102.1635985584027; Wed, 03 Nov 2021 17:26:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Thu,  4 Nov 2021 00:25:16 +0000
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
Message-Id: <20211104002531.1176691-16-seanjc@google.com>
Mime-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v5.5 15/30] KVM: Use prepare/commit hooks to handle generic
 memslot metadata updates
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>,
        "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Handle the generic memslot metadata, a.k.a. dirty bitmap, updates at the
same time that arch handles it's own metadata updates, i.e. at memslot
prepare and commit.  This will simplify converting @new to a dynamically
allocated object, and more closely aligns common KVM with architecture
code.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 109 +++++++++++++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 43 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9c75691b98ba..6c7bbc452dae 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1534,6 +1534,69 @@ static void kvm_copy_memslots_arch(struct kvm_memslots *to,
 		to->memslots[i].arch = from->memslots[i].arch;
 }
 
+static int kvm_prepare_memory_region(struct kvm *kvm,
+				     const struct kvm_memory_slot *old,
+				     struct kvm_memory_slot *new,
+				     enum kvm_mr_change change)
+{
+	int r;
+
+	/*
+	 * If dirty logging is disabled, nullify the bitmap; the old bitmap
+	 * will be freed on "commit".  If logging is enabled in both old and
+	 * new, reuse the existing bitmap.  If logging is enabled only in the
+	 * new and KVM isn't using a ring buffer, allocate and initialize a
+	 * new bitmap.
+	 */
+	if (!(new->flags & KVM_MEM_LOG_DIRTY_PAGES))
+		new->dirty_bitmap = NULL;
+	else if (old->dirty_bitmap)
+		new->dirty_bitmap = old->dirty_bitmap;
+	else if (!kvm->dirty_ring_size) {
+		r = kvm_alloc_dirty_bitmap(new);
+		if (r)
+			return r;
+
+		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
+			bitmap_set(new->dirty_bitmap, 0, new->npages);
+	}
+
+	r = kvm_arch_prepare_memory_region(kvm, old, new, change);
+
+	/* Free the bitmap on failure if it was allocated above. */
+	if (r && new->dirty_bitmap && !old->dirty_bitmap)
+		kvm_destroy_dirty_bitmap(new);
+
+	return r;
+}
+
+static void kvm_commit_memory_region(struct kvm *kvm,
+				     struct kvm_memory_slot *old,
+				     const struct kvm_memory_slot *new,
+				     enum kvm_mr_change change)
+{
+	/*
+	 * Update the total number of memslot pages before calling the arch
+	 * hook so that architectures can consume the result directly.
+	 */
+	if (change == KVM_MR_DELETE)
+		kvm->nr_memslot_pages -= old->npages;
+	else if (change == KVM_MR_CREATE)
+		kvm->nr_memslot_pages += new->npages;
+
+	kvm_arch_commit_memory_region(kvm, old, new, change);
+
+	/*
+	 * Free the old memslot's metadata.  On DELETE, free the whole thing,
+	 * otherwise free the dirty bitmap as needed (the below effectively
+	 * checks both the flags and whether a ring buffer is being used).
+	 */
+	if (change == KVM_MR_DELETE)
+		kvm_free_memslot(kvm, old);
+	else if (old->dirty_bitmap && !new->dirty_bitmap)
+		kvm_destroy_dirty_bitmap(old);
+}
+
 static int kvm_set_memslot(struct kvm *kvm,
 			   struct kvm_memory_slot *new,
 			   enum kvm_mr_change change)
@@ -1620,27 +1683,14 @@ static int kvm_set_memslot(struct kvm *kvm,
 		old.as_id = new->as_id;
 	}
 
-	r = kvm_arch_prepare_memory_region(kvm, &old, new, change);
+	r = kvm_prepare_memory_region(kvm, &old, new, change);
 	if (r)
 		goto out_slots;
 
 	update_memslots(slots, new, change);
 	slots = install_new_memslots(kvm, new->as_id, slots);
 
-	/*
-	 * Update the total number of memslot pages before calling the arch
-	 * hook so that architectures can consume the result directly.
-	 */
-	if (change == KVM_MR_DELETE)
-		kvm->nr_memslot_pages -= old.npages;
-	else if (change == KVM_MR_CREATE)
-		kvm->nr_memslot_pages += new->npages;
-
-	kvm_arch_commit_memory_region(kvm, &old, new, change);
-
-	/* Free the old memslot's metadata.  Note, this is the full copy!!! */
-	if (change == KVM_MR_DELETE)
-		kvm_free_memslot(kvm, &old);
+	kvm_commit_memory_region(kvm, &old, new, change);
 
 	kvfree(slots);
 	return 0;
@@ -1736,7 +1786,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
 
 	if (!old.npages) {
 		change = KVM_MR_CREATE;
-		new.dirty_bitmap = NULL;
 
 		/*
 		 * To simplify KVM internals, the total number of pages across
@@ -1756,9 +1805,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			change = KVM_MR_FLAGS_ONLY;
 		else /* Nothing to change. */
 			return 0;
-
-		/* Copy dirty_bitmap from the current memslot. */
-		new.dirty_bitmap = old.dirty_bitmap;
 	}
 
 	if ((change == KVM_MR_CREATE) || (change == KVM_MR_MOVE)) {
@@ -1772,30 +1818,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		}
 	}
 
-	/* Allocate/free page dirty bitmap as needed */
-	if (!(new.flags & KVM_MEM_LOG_DIRTY_PAGES))
-		new.dirty_bitmap = NULL;
-	else if (!new.dirty_bitmap && !kvm->dirty_ring_size) {
-		r = kvm_alloc_dirty_bitmap(&new);
-		if (r)
-			return r;
-
-		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-			bitmap_set(new.dirty_bitmap, 0, new.npages);
-	}
-
-	r = kvm_set_memslot(kvm, &new, change);
-	if (r)
-		goto out_bitmap;
-
-	if (old.dirty_bitmap && !new.dirty_bitmap)
-		kvm_destroy_dirty_bitmap(&old);
-	return 0;
-
-out_bitmap:
-	if (new.dirty_bitmap && !old.dirty_bitmap)
-		kvm_destroy_dirty_bitmap(&new);
-	return r;
+	return kvm_set_memslot(kvm, &new, change);
 }
 EXPORT_SYMBOL_GPL(__kvm_set_memory_region);
 
-- 
2.33.1.1089.g2158813163f-goog

