Return-Path: <linux-mips+bounces-4476-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BBE93DB4C
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 01:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC5561C233CD
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2024 23:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D68158DC1;
	Fri, 26 Jul 2024 23:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sImOLOZ+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF60215697B
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037973; cv=none; b=PVFb5Jog9A043x/VilW8meBYR7XCCeyHnwG8etFnFG4wNA0gpNFccq0JqblFe1MWr8yY7JGhpyiA79/3lzZFipJtdKRRDrJymEvdWW7w4/hsWS1m7OzZ+9qRJvkc7CCwVm/czcsgLx2w2eHdHvcuk/p3b2WukKEQyisdLp0rhX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037973; c=relaxed/simple;
	bh=W8/UyfsPYwl/cL0QQCHocRUppr1lNXJ7XLufW7qP3ig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FIwyYyIfoAIAeWo90AlgPyFxm3+xHCf5zwjs5TYUePJYebHWI71rCmfZJR2OuUCgoC8zhwm25jWCoRvcuoYRtZXnf3kaFHBl5qzAj7UCZ6X2J+olhTovUVv1GfgVBqZCtTRGpbNe1YyLDlWTwRM4tHXE5LLYCl/Iop85g8nNKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sImOLOZ+; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6688c44060fso6462437b3.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037970; x=1722642770; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VnEAHRC1zG591I39OowzIjQNXTqQsRDXyh/rUn6sicQ=;
        b=sImOLOZ+olHeeZqm/vAoWA9dUWSXr5MivwgNPZbhD2jvQLSaHvC4v3kFop25k0C3Do
         zbpjg7TRqPh/YWv/Q0Go8/X/54/KxDxJsRuGEXibYasNWaaIJX/fgAToM27lqVw1y7e2
         63BJDSkH3s3BQ+vKOnEqHxOYmqJ+m3e9V8ikZTZvD42QXfSCwJuXNoUlBDxjTPPXeB4q
         +sWEoCgQQjleOM4SxthrOIRcz93P+AxvlGvapM4t8H77VHScb5+FY3gag2DcAER/DfBm
         wy83/sFtYgSLZln1W1ibrAcWZEtAHeLSGChDEy8Dez+zRng4pmqALN2KiRTkqWxGYfLL
         8GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037970; x=1722642770;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnEAHRC1zG591I39OowzIjQNXTqQsRDXyh/rUn6sicQ=;
        b=C3cvZ722Z8oqpULpa0iVVYteulJd6pIqomPLyi/DkCkEnLhZPXQv/0xM7FR9w6vlvY
         4+lFqGIV5xFy9MOamSlKchlrlUFA+Ir0R/tXrhbuEAnTF12cgcrJOK659OdGZ6nBlgpU
         btxvqaCs7jcUfGz8/rJu5vz/VAnGS57gfKsaI6tsqL6EtS5Ggm/km6XQCVWKlgwysS0A
         GjGyiFsyFbM662fNJhyk4qv/CebiM7UvWAIzyAkt3JDfawC9lTjyBI0rpWvSGHLiu5SI
         CbwTWPk2VTmZ/RQXW41nivbS8M1f79COF+NUsPZpBRiLPAWABlqWL4NZHBx8YD3ZbFM4
         9D2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSDUZUPMWUizQIpjt43RMFbtMpcJ+/8WclT33axCJidL5V0HHFejXW7KU5W8vADD7c+Yog4Mdy9IOxr2FzN1DvzOnbvYV2KKt6DQ==
X-Gm-Message-State: AOJu0Yy1ryMkUqRYywrZPvN0NIU133tgbsQku4fg8YDb6ZT0ZPK9AhCb
	RIxqdFwxLQmd4wZfs+w2wqbU/CPqXSAi8JSrSSbtC51OSYB2sT73BnSf7AYaS5vIc3+y2k5L6KT
	moA==
X-Google-Smtp-Source: AGHT+IFPOoUYsYyJmRjA25F0UYC9yeYKs61mDA/QqS/vgTcAgpqjjzQfUfGqPl0MU2c7vZElDBuLLOtKUts=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:fc9:b0:648:afcb:a7ce with SMTP id
 00721157ae682-67a05a9d90bmr269367b3.3.1722037969718; Fri, 26 Jul 2024
 16:52:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:15 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-7-seanjc@google.com>
Subject: [PATCH v12 06/84] KVM: x86/mmu: Skip the "try unsync" path iff the
 old SPTE was a leaf SPTE
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

Apply make_spte()'s optimization to skip trying to unsync shadow pages if
and only if the old SPTE was a leaf SPTE, as non-leaf SPTEs in direct MMUs
are always writable, i.e. could trigger a false positive and incorrectly
lead to KVM creating a SPTE without write-protecting or marking shadow
pages unsync.

This bug only affects the TDP MMU, as the shadow MMU only overwrites a
shadow-present SPTE when synchronizing SPTEs (and only 4KiB SPTEs can be
unsync).  Specifically, mmu_set_spte() drops any non-leaf SPTEs *before*
calling make_spte(), whereas the TDP MMU can do a direct replacement of a
page table with the leaf SPTE.

Opportunistically update the comment to explain why skipping the unsync
stuff is safe, as opposed to simply saying "it's someone else's problem".

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index d4527965e48c..a3baf0cadbee 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -226,12 +226,20 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		spte |= PT_WRITABLE_MASK | shadow_mmu_writable_mask;
 
 		/*
-		 * Optimization: for pte sync, if spte was writable the hash
-		 * lookup is unnecessary (and expensive). Write protection
-		 * is responsibility of kvm_mmu_get_page / kvm_mmu_sync_roots.
-		 * Same reasoning can be applied to dirty page accounting.
+		 * When overwriting an existing leaf SPTE, and the old SPTE was
+		 * writable, skip trying to unsync shadow pages as any relevant
+		 * shadow pages must already be unsync, i.e. the hash lookup is
+		 * unnecessary (and expensive).
+		 *
+		 * The same reasoning applies to dirty page/folio accounting;
+		 * KVM will mark the folio dirty using the old SPTE, thus
+		 * there's no need to immediately mark the new SPTE as dirty.
+		 *
+		 * Note, both cases rely on KVM not changing PFNs without first
+		 * zapping the old SPTE, which is guaranteed by both the shadow
+		 * MMU and the TDP MMU.
 		 */
-		if (is_writable_pte(old_spte))
+		if (is_last_spte(old_spte, level) && is_writable_pte(old_spte))
 			goto out;
 
 		/*
-- 
2.46.0.rc1.232.g9752f9e123-goog


