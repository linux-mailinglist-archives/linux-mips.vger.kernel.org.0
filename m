Return-Path: <linux-mips+bounces-4538-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9828A93DC29
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C96FF1C217D8
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1387918E771;
	Fri, 26 Jul 2024 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BHGeKCUl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF5A18E766
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038102; cv=none; b=jo4OesKlY4t2vXfRPoDN3B+TkLW90tXloygLnskHZAcrJsJm0VvruWhARnjldeerjl4o62c/Kxq1JgVb+GK9YkFqBM620hQrvNUOK2yUIPR8Nvo3EV6CjzAj7UEFAEhcTMuSQKRwlio6X9F1rf/gfebXxgbyVoRLCAbT6XlAZxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038102; c=relaxed/simple;
	bh=X/oocC9KK8HLcDY+BN3O4ToHUmzhhLHquCuXU7/bcMw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BoJS7oRkFNBwKX/4Kx3oCVR+wEaWg0qYfuJDulfVWwM/iLel4bZp1o46xTnazzGdzyn2TFFleLXXMuz2TIUVxqJPFklBLDj5tlqTCOVkTbGs4/yn6jzXpSBvQI9X4Twg1rl7DPtf8V+7s3r+X+jFO5hdViQDT2RtRjGiGxMNtQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BHGeKCUl; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7a1914d0936so1308767a12.3
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038100; x=1722642900; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EmsAuvL8HQXwYqsGGesvXxhYre2Gu8OeDMQE+hBNppI=;
        b=BHGeKCUl/GX9NJMFBC6bAqJ9xkP8FblCPsnhgnxpherIm5N3iCU7JFivY+HydgPxen
         v16bzTZv02jXaTFv7Gv/zl9hGdx+J+G1OkaLZx/QqrEvnuW9BSpcYhsTqghIJjinpnCI
         0KFIVstO82fgplO+iBeDtqNj16s/pVH+s+J2qoxShxGyF91NUvxek0L78Cts3+KrkuuS
         wO4B3BOZLXIP60LolSoJB0x8vd+tbV8HUzl8w/6aEFvmUFK0npsAzp/PX5gt2w6VYrnP
         D+CKK5qcUormI3mrYmr4dwQcLyJIHPx2Mw6VhkO+CKmCGNJfqqY31Wbuz/mpHc5y6uok
         ePUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038100; x=1722642900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmsAuvL8HQXwYqsGGesvXxhYre2Gu8OeDMQE+hBNppI=;
        b=Rvv8CGhA6w7h+IjUG8/NGyb37r2QuU1XdXB7KGqmhORRcUSk7uJEgO8yJrNWm53Nkx
         Bsfn5GIlrXfjQq1+/O6KuDTTl5Qe07PorVRn3vwPtixWyUY6272zufEZnjamEsNKBlk1
         Lv66X54zBfvwr0CaK0kiLR7z5ebbo6TEbX38DpFhlY4reQIWzi0+xwbPjBsADo5aCe2k
         kgUj7W3ww7bY05bASxpzFAAtjn/FspxF5DQ3HVGY9YLPYNaaPQ/KXFY0Khp2pIhM27wg
         QyLlKhaD7t7cJRRwbMHck+qZLYP7CX1+sPT0eXwDcjvds9hgbjbDgfDhag+us51Z2z+X
         zhkA==
X-Forwarded-Encrypted: i=1; AJvYcCUIWc/Br99eJobuNefcql568e3rHK04ulGWNVcBlkMJLF6tQMSAlvz/BY+doSCZuRVe1/kahfLRY38RrtJ6yYoBOZzLYQtFlINuxg==
X-Gm-Message-State: AOJu0YzOB7T1Rk9xVA5iE4huARICpHVcj5NM3bIa5yTPHXvYS3kRllb9
	gn8n469Lqf43z7G8ub/b2st18EMnpzF22+Iskqi17KHiX0CvI1d55xCL++N/Rkbkvm0NpmZE0qr
	VWw==
X-Google-Smtp-Source: AGHT+IFixvL6M1c2YXLcj1uim9WdRxJ+9f/3q289x5sMH5Ueo8TBf7rPuOmHjx69h4l0El/Ee2ditwF800M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:fca:b0:72b:5113:ec05 with SMTP id
 41be03b00d2f7-7ac8e39fc8dmr2096a12.5.1722038098497; Fri, 26 Jul 2024 16:54:58
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:17 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-69-seanjc@google.com>
Subject: [PATCH v12 68/84] KVM: MIPS: Mark "struct page" pfns dirty only in
 "slow" page fault path
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

Mark pages/folios dirty only the slow page fault path, i.e. only when
mmu_lock is held and the operation is mmu_notifier-protected, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

See the link below for details.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c17157e700c0..4da9ce4eb54d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -514,7 +514,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 		set_pte(ptep, pte_mkdirty(*ptep));
 		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
 	}
 
 	if (out_entry)
@@ -628,7 +627,6 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		if (write_fault) {
 			prot_bits |= __WRITEABLE;
 			mark_page_dirty(kvm, gfn);
-			kvm_set_pfn_dirty(pfn);
 		}
 	}
 	entry = pfn_pte(pfn, __pgprot(prot_bits));
@@ -642,6 +640,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
+	if (writeable)
+		kvm_set_pfn_dirty(pfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
 	kvm_set_pfn_accessed(pfn);
-- 
2.46.0.rc1.232.g9752f9e123-goog


