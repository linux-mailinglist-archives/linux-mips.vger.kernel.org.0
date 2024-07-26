Return-Path: <linux-mips+bounces-4518-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD593DBE6
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1515B2587C
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927A3184131;
	Fri, 26 Jul 2024 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LEeqY9bl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3181836E7
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038059; cv=none; b=lY9QOUQCCK0IItiVSh4HSGbm07urWvlbqasyRDxBF1VSs4Sc5706olcev11XgXeS8M5v5aH28XA+glHHkN4VT+PVDEl1/akZZJMxMavYrUpO/K7q5SSx9XQwN3cexhumo2OeC1y/zWxf3q6m/4y1g6I6z+vWTXYJXapJKnmCXPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038059; c=relaxed/simple;
	bh=hkAHN3MSFE4PtSlKJPDsUtFG5ZVNRUuBMTGsadq3yME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HZuEBBvaHDWQLusMd1qaQ5EBXj5oSh930879uuWF6Uiuy97+ukjpo49Cz+p/CGo/MoAp1Dj7fWhoERd+bUZ6s1cUD19yoawWeU0YwD/v/94hWBLimbZpI0/7bMdREGnM+CXlcuXxrgjNhPfoTF01t6jUtO8TAJJgiOqMcOlLdCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LEeqY9bl; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1fc6f3ac7beso10762465ad.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038057; x=1722642857; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=l9BW/dK5c/4ryaOpC0RxFiUBYVnD4MPO1UqGokFlyv8=;
        b=LEeqY9bltXOZWjLYoMQlFaufi9j1THXUXcixDH7CTGZDdWho8QRTPu8BDeSK93KfeM
         At5khpGNbLtc36mPK7S9WcFSO/Y0vDQuv8TM1Dlqrzh4txI0tNimo/GhV6DrS504/Yio
         oUuqKDtxGDdy6bpZMiwDq3gGcKMGS11jJBF2PWQ7oyAb+uEvXZ7a7fZLBpd9VYH8Nzh+
         Lz8Pwtmwnh8d0zLKaTItr41SldeCJDQelAfHgPBCZwwf0QY3XG5DMZ2D33dI8tQViCK6
         frW7Cs8DS57A0tq2rZwEF0bRCF34+eJAZA8ajX5dcSJlL40lDTfn07IEdMFMZ7wAl5ob
         c3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038057; x=1722642857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9BW/dK5c/4ryaOpC0RxFiUBYVnD4MPO1UqGokFlyv8=;
        b=iLCYKN5oBr3XkM9Kio/4kG1D8gE8Boj4ECsJAFYpRxp/LWuxPBj/pjTWjxEgnlptJ+
         yFITtCBp3nBjcGi0r+Amer4AqOosWYZQwBaoliKz/DKTUW/mShAqb47FZ2p6kKzTdx8+
         KnEfiDDxxEy2pPVTq8LpBBDDnKFkhgiai8+CqDnsAMhbHYSDbBZwd/gP4hqkPFIBYQjv
         O0hFCDjFILTW8AI/SVGJJhDE1oXgAas4RAWVO4APtcYgO8x6FXS8m5LXHEG7PXA33mMP
         ZOvx94B47m1HXO4tboU2Zucxd2lhZUmmJ4Wero9E4A9IMNgALcTluTG3oAZQhzCetSIu
         2qSg==
X-Forwarded-Encrypted: i=1; AJvYcCVEQAaLFfJmy8kyfgdygvkUxBzZ0p5Gh3UjsSbU4dcxx4Yx5H7sH919EMklxhh9KsF4b5v/2bNaXisk8G4/ionvD9BqcqiX3Kz0yA==
X-Gm-Message-State: AOJu0YxKKMzitU5QL+UhR+1VscRrt7G5kbB6ld0lZ3o5Qv8mb9BuJJgi
	oJ2nlqI8hfKr48XFR9n0TwEL2fCDp7SK5BFwmmxLjlaOm3ge+w2oKMzqcr+C7Ko0ufRpizvqSpO
	z1A==
X-Google-Smtp-Source: AGHT+IH3COIaUp2rXSDrmiVRXNOzjzCRiof8RV2PU1lQ3pUgA2jXVKIIsmrd9aJoYDTjtMdA3IOsVNqBhcc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea06:b0:1f9:cbe5:e422 with SMTP id
 d9443c01a7336-1ff0488dbf2mr744395ad.8.1722038056933; Fri, 26 Jul 2024
 16:54:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:57 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-49-seanjc@google.com>
Subject: [PATCH v12 48/84] KVM: Move x86's API to release a faultin page to
 common KVM
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

Move KVM x86's helper that "finishes" the faultin process to common KVM
so that the logic can be shared across all architectures.  Note, not all
architectures implement a fast page fault path, but the gist of the
comment applies to all architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
 include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 95beb50748fc..2a0cfa225c8d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4323,28 +4323,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
-			    r == RET_PF_RETRY);
-
-	if (!fault->refcounted_page)
-		return;
-
-	/*
-	 * If the page that KVM got from the *primary MMU* is writable, and KVM
-	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
-	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
-	 * the GFN is write-protected.  Folios can't be safely marked dirty
-	 * outside of mmu_lock as doing so could race with writeback on the
-	 * folio.  As a result, KVM can't mark folios dirty in the fast page
-	 * fault handler, and so KVM must (somewhat) speculatively mark the
-	 * folio dirty if KVM could locklessly make the SPTE writable.
-	 */
-	if (r == RET_PF_RETRY)
-		kvm_release_page_unused(fault->refcounted_page);
-	else if (!fault->map_writable)
-		kvm_release_page_clean(fault->refcounted_page);
-	else
-		kvm_release_page_dirty(fault->refcounted_page);
+	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
+				 r == RET_PF_RETRY, fault->map_writable);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d2a97eb30e4..91341cdc6562 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1216,6 +1216,32 @@ static inline void kvm_release_page_unused(struct page *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
+static inline void kvm_release_faultin_page(struct kvm *kvm, struct page *page,
+					    bool unused, bool dirty)
+{
+	lockdep_assert_once(lockdep_is_held(&kvm->mmu_lock) || unused);
+
+	if (!page)
+		return;
+
+	/*
+	 * If the page that KVM got from the *primary MMU* is writable, and KVM
+	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
+	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
+	 * the GFN is write-protected.  Folios can't be safely marked dirty
+	 * outside of mmu_lock as doing so could race with writeback on the
+	 * folio.  As a result, KVM can't mark folios dirty in the fast page
+	 * fault handler, and so KVM must (somewhat) speculatively mark the
+	 * folio dirty if KVM could locklessly make the SPTE writable.
+	 */
+	if (unused)
+		kvm_release_page_unused(page);
+	else if (dirty)
+		kvm_release_page_dirty(page);
+	else
+		kvm_release_page_clean(page);
+}
+
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
 			    unsigned int foll, bool *writable,
-- 
2.46.0.rc1.232.g9752f9e123-goog


