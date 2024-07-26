Return-Path: <linux-mips+bounces-4484-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5510493DB6C
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 01:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4DC1F2457A
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2024 23:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E668E16F8E6;
	Fri, 26 Jul 2024 23:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="htopK7UR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B422816DEC4
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037989; cv=none; b=Zh8vwkM93V7k7GFFn1UidRJzLc/E60TQ3+abrdUg9PMYaMPWf+eNyK/R5AGnPkN2ZWGSsy4AqgWPbMlzDZfoQrY9OQIGJOmOXN2WLC4tdkTtp0d4zrFiP1JEuWZNA7xjlZxMG5VKTRsTMBbDVPiBtM+P81G1z7sV+KBW74vIIAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037989; c=relaxed/simple;
	bh=gK+hh8kSbTGkFcbGB4gAOaOwfDaDywlzZ/8wz2JxLpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mq35Cd34aGiRvb8d3LsnOz6TVvEy/XznTF2RapFQPrLmyuUIQySSBGfmDGgfTnS5MCZykSa9iXfPGtgb6CH0ehWB3+whMwn1DqludzdjgWbw26mOcArIMtYUn0INb93CWcA195MoL4TVZCbc9xLoiSCAScBtUKmyGAhfDghq0UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=htopK7UR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2cb54eac976so1660213a91.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037986; x=1722642786; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=U9CL7WNG+bQMLxeBtbO0jb1Rey3S/NViM9NTHyPIsWo=;
        b=htopK7URM6Kjffl14PYk/lkeBkmSUIlEO5Qr9YDo0wI3szvZB+qFanzzdUqCn9enby
         0Xzw/DP4Jx07gZmBTBRfd4XE/3shHs6QGMdDAAYACAejyfP9L8YDfdLTAIyJvCVWbIjN
         FFB3meBXsiXb72aGPfZaZFXGnqMTMnO1bfE+ktyz54bG3jma0C1q+4i+J/Ix6zNy30uc
         NmewFzk64w97HMjoZ5ZNFpwP1sAZ/i4PO40C/VEQDAIk3w4jYGpzJ0EBMijMJONeTD8K
         8PGgBTe9Xcz6BvD61Ez+42ODXs8IrAQrIIPUwwN/mVpI3OfRvki1XwlIaX0+CskiBY96
         0NaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037986; x=1722642786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9CL7WNG+bQMLxeBtbO0jb1Rey3S/NViM9NTHyPIsWo=;
        b=cQklVb5lXSpqAlop6xsZvkEPS+RnqPi7gON84KtPjuhz8SVrCzH4ZRuYQqmneQBsKi
         Ld7h/In8uj8Y7yoa6Uf1ZEhunqh3uJ/H70k6BUUlPBD/y0bSBrRt3bBIIJ/Xlh0pWlCn
         E84WYDJ0h5XjHfsKQAZjQxTdY0z6AqUr0NEgw48stpd7/gcdjtNeUV3dT8TscPjqdLn+
         SRskGAlYtRmPeRK5spLZOBsYez38CFKtwmPUzwOuB7isefKwlS7HkWU8jyXuuMH2Mz0h
         Zo6S04KsxT8sguyd/PZvJhmz6V6Kuz+yUWC+ZUL/fO5fT8ucQA6rQC/5ZvzFHg+vMGDJ
         FyvA==
X-Forwarded-Encrypted: i=1; AJvYcCVgY+9EYW7K9VnpBSJYiKyz345hH9rOEqTnHQi1mgSvC4SDid1FwIiKztQqxkIldNk89LIf+w6k5lKpxCMSJiZJzrABujT078IB5g==
X-Gm-Message-State: AOJu0YxJMWiVRe3ZSy+Pu7rAs52f4lRJ5m95YD7UP4TSApxETpJ+CMy5
	0Ia58Pv5s2nOWELu0M9WTEy21QEoIv2BKy8Ut3+vspz2zaKecLbFgY87BMck1Z75mzIKJ2DYQyX
	mgQ==
X-Google-Smtp-Source: AGHT+IHnRzETq13gV9xdTjZ59JsUWCUSm1ccdx7THxn20zb30PlPil4gPX7Xa7ZvU4LkGPt7E6DUyKfDh3Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fd10:b0:2c9:26a1:3762 with SMTP id
 98e67ed59e1d1-2cf7e5b209bmr21293a91.3.1722037985956; Fri, 26 Jul 2024
 16:53:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:23 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-15-seanjc@google.com>
Subject: [PATCH v12 14/84] KVM: Replace "async" pointer in gfn=>pfn with
 "no_wait" and error code
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

From: David Stevens <stevensd@chromium.org>

Add a pfn error code to communicate that hva_to_pfn() failed because I/O
was needed and disallowed, and convert @async to a constant @no_wait
boolean.  This will allow eliminating the @no_wait param by having callers
pass in FOLL_NOWAIT along with other FOLL_* flags.

Signed-off-by: David Stevens <stevensd@chromium.org>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 18 +++++++++++-------
 include/linux/kvm_host.h |  3 ++-
 virt/kvm/kvm_main.c      | 29 +++++++++++++++--------------
 virt/kvm/kvm_mm.h        |  2 +-
 virt/kvm/pfncache.c      |  4 ++--
 5 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index d76390ef49b2..eb9ad0283fd5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4328,17 +4328,21 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
 
 static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
-	bool async;
-
 	if (fault->is_private)
 		return kvm_faultin_pfn_private(vcpu, fault);
 
-	async = false;
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, &async,
+	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable,
 					  &fault->hva);
-	if (!async)
-		return RET_PF_CONTINUE; /* *pfn has correct page already */
+
+	/*
+	 * If resolving the page failed because I/O is needed to fault-in the
+	 * page, then either set up an asynchronous #PF to do the I/O, or if
+	 * doing an async #PF isn't possible, retry with I/O allowed.  All
+	 * other failures are terminal, i.e. retrying won't help.
+	 */
+	if (fault->pfn != KVM_PFN_ERR_NEEDS_IO)
+		return RET_PF_CONTINUE;
 
 	if (!fault->prefetch && kvm_can_do_async_pf(vcpu)) {
 		trace_kvm_try_async_get_page(fault->addr, fault->gfn);
@@ -4356,7 +4360,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, NULL,
+	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
 					  fault->write, &fault->map_writable,
 					  &fault->hva);
 	return RET_PF_CONTINUE;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6d4503e8eabe..92b2922e2216 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -97,6 +97,7 @@
 #define KVM_PFN_ERR_HWPOISON	(KVM_PFN_ERR_MASK + 1)
 #define KVM_PFN_ERR_RO_FAULT	(KVM_PFN_ERR_MASK + 2)
 #define KVM_PFN_ERR_SIGPENDING	(KVM_PFN_ERR_MASK + 3)
+#define KVM_PFN_ERR_NEEDS_IO	(KVM_PFN_ERR_MASK + 4)
 
 /*
  * error pfns indicate that the gfn is in slot but faild to
@@ -1218,7 +1219,7 @@ kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn);
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool *async,
+			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable, hva_t *hva);
 
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 03af1a0090b1..c2efdfe26d5b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2789,7 +2789,7 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
  * The slow path to get the pfn of the specified host virtual address,
  * 1 indicates success, -errno is returned if error is detected.
  */
-static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
+static int hva_to_pfn_slow(unsigned long addr, bool no_wait, bool write_fault,
 			   bool interruptible, bool *writable, kvm_pfn_t *pfn)
 {
 	/*
@@ -2812,7 +2812,7 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 
 	if (write_fault)
 		flags |= FOLL_WRITE;
-	if (async)
+	if (no_wait)
 		flags |= FOLL_NOWAIT;
 	if (interruptible)
 		flags |= FOLL_INTERRUPTIBLE;
@@ -2928,8 +2928,8 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * Pin guest page in memory and return its pfn.
  * @addr: host virtual address which maps memory to the guest
  * @interruptible: whether the process can be interrupted by non-fatal signals
- * @async: whether this function need to wait IO complete if the
- *         host page is not in the memory
+ * @no_wait: whether or not this function need to wait IO complete if the
+ *	     host page is not in the memory
  * @write_fault: whether we should get a writable host page
  * @writable: whether it allows to map a writable host page for !@write_fault
  *
@@ -2938,7 +2938,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * 2): @write_fault = false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 		     bool write_fault, bool *writable)
 {
 	struct vm_area_struct *vma;
@@ -2950,7 +2950,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
 
-	npages = hva_to_pfn_slow(addr, async, write_fault, interruptible,
+	npages = hva_to_pfn_slow(addr, no_wait, write_fault, interruptible,
 				 writable, &pfn);
 	if (npages == 1)
 		return pfn;
@@ -2959,7 +2959,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 
 	mmap_read_lock(current->mm);
 	if (npages == -EHWPOISON ||
-	      (!async && check_user_page_hwpoison(addr))) {
+	    (!no_wait && check_user_page_hwpoison(addr))) {
 		pfn = KVM_PFN_ERR_HWPOISON;
 		goto exit;
 	}
@@ -2976,9 +2976,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 		if (r < 0)
 			pfn = KVM_PFN_ERR_FAULT;
 	} else {
-		if (async && vma_is_valid(vma, write_fault))
-			*async = true;
-		pfn = KVM_PFN_ERR_FAULT;
+		if (no_wait && vma_is_valid(vma, write_fault))
+			pfn = KVM_PFN_ERR_NEEDS_IO;
+		else
+			pfn = KVM_PFN_ERR_FAULT;
 	}
 exit:
 	mmap_read_unlock(current->mm);
@@ -2986,7 +2987,7 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 }
 
 kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool *async,
+			       bool interruptible, bool no_wait,
 			       bool write_fault, bool *writable, hva_t *hva)
 {
 	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
@@ -3008,21 +3009,21 @@ kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
 		writable = NULL;
 	}
 
-	return hva_to_pfn(addr, interruptible, async, write_fault, writable);
+	return hva_to_pfn(addr, interruptible, no_wait, write_fault, writable);
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
 
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable)
 {
-	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, NULL,
+	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, false,
 				    write_fault, writable, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
 kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	return __gfn_to_pfn_memslot(slot, gfn, false, NULL, true, NULL, NULL);
+	return __gfn_to_pfn_memslot(slot, gfn, false, false, true, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index a3fa86f60d6c..51f3fee4ca3f 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -20,7 +20,7 @@
 #define KVM_MMU_UNLOCK(kvm)		spin_unlock(&(kvm)->mmu_lock)
 #endif /* KVM_HAVE_MMU_RWLOCK */
 
-kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
+kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool no_wait,
 		     bool write_fault, bool *writable);
 
 #ifdef CONFIG_HAVE_KVM_PFNCACHE
diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 58c706a610e5..32dc61f48c81 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -197,8 +197,8 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cache *gpc)
 			cond_resched();
 		}
 
-		/* We always request a writeable mapping */
-		new_pfn = hva_to_pfn(gpc->uhva, false, NULL, true, NULL);
+		/* We always request a writable mapping */
+		new_pfn = hva_to_pfn(gpc->uhva, false, false, true, NULL);
 		if (is_error_noslot_pfn(new_pfn))
 			goto out_error;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


