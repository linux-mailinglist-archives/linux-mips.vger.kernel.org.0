Return-Path: <linux-mips+bounces-4511-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0593DBCD
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D513D2859F2
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EF3181CE4;
	Fri, 26 Jul 2024 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EtumUVXI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C11181B8D
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038044; cv=none; b=Ttnvyf0/wvgKxD3htgJpyQ2tDqBs7guH/HjKY1aCKhfNqaQ0k/IkW8iDAABRgV2Bsgf1BAJlBAxk5jvXxyaJXf8YGLxfsvfKx1YZ0+N7oAadK7FjGc3S5062NYEfEIXHbXnvCd8W9jmAHffIQI6cVqtlXQ+9ofM82V+8Jpf4ilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038044; c=relaxed/simple;
	bh=ekyGgwJW5KCFeLGIovEA7dKaEjIwCbNp1pdHY6eLnUg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iyUsPWPiRgKgKZ78aBqJ8nFoUfgarOH9aEl7HPyNdXg8PPAIoWVNTuTDaD67MzMCVsmD5coemoNSbGcKOKaIPwG0GTdtf7TsGo7s+gY2szpl8n/9A54YvnnPFe5SxqHsA1Ibc1FsQtRTQ5n8Vi4marERGOYvxBD69O5f99eqQbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EtumUVXI; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-70ec1039600so1046612b3a.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038042; x=1722642842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9zY2YEu1HUtjdcDr5plCoNlYuLGLbh4OhGnITp611eA=;
        b=EtumUVXI2jZeJVyXIOtCdc3ms6GfSXVKBvnpKwFMdWnOBYLK2R789/b+Hhq0JC5U5s
         eaktal8sdZdpzMU5ovrg2yMMyyeKlrS/xlRUfYQppWYAq69mi/k1X5QWseXP3Jepi1YQ
         XULdeW2trQHNILSouEZYBDOGBqQRqWQQ4v/EvxlUruo/xDYxKBcJTEU5ZH+JEKTai/Tz
         R3wg7aGnSY67KdY6DKx/mrKiWcSgqqpsHtOCyETPgjORhwvxk+VFQKRakqlpdS0MVWB7
         HY2GS2iaWvMsxkCBLBixHsrHudit0DfsH5SjPsONZIBjyoYc3e4PjOdgfyFExEj24A5z
         wxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038042; x=1722642842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zY2YEu1HUtjdcDr5plCoNlYuLGLbh4OhGnITp611eA=;
        b=IhOOFog+19h4yiGYSgLnrstXjz2izQBikkdNHwm/XrdZ9/lWPK+C0rFT3iXQ7Iegse
         ec8rZ+HseTvIod798oWfZkML6ipYKsWh33bCWMPLCsQWJAuPCBqfj6SO4wghod+l827v
         5mOsZX2uFdCmmRaE3tRIo4bkLmfaEBI79BemsCHWNkD/VVRPs4RNsH8A5/AtX9HrpwA+
         /8n4BGnwGM9dhALRpP7DgkLjQv0/d2SUUN0dh+qfLe4kh+9Nx3oARGn/76pgfx46Ny1o
         dDq4wLc4Z6s9u96Ct7r5dEiPDXfqRiQ6+8c4r3pkHxvF/suo6TiHSgUcqHnPPglaPUXs
         S48A==
X-Forwarded-Encrypted: i=1; AJvYcCXSXCoy2voL2G3e0PXuBEBMmT92x3cZ0gIAScN13otdFW9UO8ukr2cxSPoBNiH+4tcPC9v+ljoQjbqjMjpbThP5P6QAaFVmgdpCnQ==
X-Gm-Message-State: AOJu0Yx6q6cIPm8b2EYze7qoWdkwN5mqYOt6CqdLjZLKp2+QdPEhQ88+
	M6aikJyE8wx+FG2BZmX2z7eSFnyjNpwCdYyBTjc27Nk6OXcfxdlludJzM7gb70ZLbThkLPXzCC/
	Qyw==
X-Google-Smtp-Source: AGHT+IFj2ro53tB8A9NyZ1GYVrgqdx/ajbf6jMsbjIk3q7R62qDhpHqlToArJZlcHrNz2kHOoBaEKLt0+7c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:66e5:b0:70d:27ca:96b8 with SMTP id
 d2e1a72fcca58-70ece926ad1mr25418b3a.0.1722038041966; Fri, 26 Jul 2024
 16:54:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:50 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-42-seanjc@google.com>
Subject: [PATCH v12 41/84] KVM: x86/mmu: Mark pages/folios dirty at the origin
 of make_spte()
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

Move the marking of folios dirty from make_spte() out to its callers,
which have access to the _struct page_, not just the underlying pfn.
Once all architectures follow suit, this will allow removing KVM's ugly
hack where KVM elevates the refcount of VM_MIXEDMAP pfns that happen to
be struct page memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 29 +++++++++++++++++++++++++++--
 arch/x86/kvm/mmu/paging_tmpl.h |  5 +++++
 arch/x86/kvm/mmu/spte.c        | 11 -----------
 3 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1cdd67707461..7e7b855ce1e1 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2918,7 +2918,16 @@ static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *vcpu, gfn_t gfn, u64 *sptep,
 	for (i = 0; i < nr_pages; i++, gfn++, sptep++) {
 		mmu_set_spte(vcpu, slot, sptep, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
-		kvm_release_page_clean(pages[i]);
+
+		/*
+		 * KVM always prefetches writable pages from the primary MMU,
+		 * and KVM can make its SPTE writable in the fast page, without
+		 * notifying the primary MMU.  Mark pages/folios dirty now to
+		 * ensure file data is written back if it ends up being written
+		 * by the guest.  Because KVM's prefetching GUPs writable PTEs,
+		 * the probability of unnecessary writeback is extremely low.
+		 */
+		kvm_release_page_dirty(pages[i]);
 	}
 
 	return true;
@@ -4314,7 +4323,23 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-	kvm_release_pfn_clean(fault->pfn);
+	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
+			    r == RET_PF_RETRY);
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
+	if (!fault->map_writable || r == RET_PF_RETRY)
+		kvm_release_pfn_clean(fault->pfn);
+	else
+		kvm_release_pfn_dirty(fault->pfn);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index b6897916c76b..2e2d87a925ac 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -953,6 +953,11 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int
 		  spte_to_pfn(spte), spte, true, false,
 		  host_writable, &spte);
 
+	/*
+	 * There is no need to mark the pfn dirty, as the new protections must
+	 * be a subset of the old protections, i.e. synchronizing a SPTE cannot
+	 * change the SPTE from read-only to writable.
+	 */
 	return mmu_spte_update(sptep, spte);
 }
 
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 9b8795bd2f04..2c5650390d3b 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -277,17 +277,6 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
 	}
 
-	/*
-	 * If the page that KVM got from the primary MMU is writable, i.e. if
-	 * it's host-writable, mark the page/folio dirty.  As alluded to above,
-	 * folios can't be safely marked dirty in the fast page fault handler,
-	 * and so KVM must (somewhat) speculatively mark the folio dirty even
-	 * though it isn't guaranteed to be written as KVM won't mark the folio
-	 * dirty if/when the SPTE is made writable.
-	 */
-	if (host_writable)
-		kvm_set_pfn_dirty(pfn);
-
 	*new_spte = spte;
 	return wrprot;
 }
-- 
2.46.0.rc1.232.g9752f9e123-goog


