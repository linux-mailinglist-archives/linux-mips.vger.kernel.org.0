Return-Path: <linux-mips+bounces-4517-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951B93DBE2
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E810DB24216
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9FA184103;
	Fri, 26 Jul 2024 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i2wuxh4O"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017191836E9
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038057; cv=none; b=pKcw8PUQOPT8315Z8dI23uVjh34ynktRV07vDZ5cIBtCBk62Z4pKcmjEQMB5UX3O/Qnc/rBvW9IJEaU2x8ORzD5giOQLDFUqCyXArLnceMi/IvG8pO31b8H4uqnDxndo9/1rFk77Ie3u8w1MGRL+/uYYGKs5YIJ+h4/9UTVq/ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038057; c=relaxed/simple;
	bh=irQbhT8vq6NMlHJubauhZeuUKNqR9u7Db5+BI1KIaQc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P/QRvHZ1Cwfp4NW9AFn7L/5Act0D8gqLWI4RMcyrrEgR9ifRe2/qtTyPsUrh/yXtiXOsYjvq6T6otQqyCX+IdvnFW+7V4cSkYhWPMdcCTCRCrF+0DlO4sKf1dzISzru17lJ4rUbYvNKJhR8zFjT73Se4lx4Wk/0PuTnOKE9Pzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i2wuxh4O; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-654d96c2bb5so6811807b3.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038055; x=1722642855; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gyzdwZRgQhOlsIfYTCemvzcmHdUAJy3wvQe/vDjl5Fg=;
        b=i2wuxh4O8bx9A2JsnlwAGN0/30VXy29eAXs6SU4rAdIjSv25BVJ7nBFsZ2JTmHUDkO
         Lu8lhdYqfUiLDwmeu5o+EONm6kH8hGlH12GxphVwVPyubgPD/37KO0jXDZhN5JR49ZFp
         FGlDoGO4NaWGZV7CRnSYbOdgWzIDikZMLxnxvVjB3nS9ZdqJ6fkSi+v/u9oh87t7MFE0
         Eh9Nna3Gi6BuxJwKPApO1KoFPy5+8F6GZwYJMScnAUSiT45OemUr/LmlhwWYn+hJQHKQ
         dtELVrILPiyJPA5jGxNTAC0mFx+j08jFUkkDpfneszUsTTre8U3T8nrSXyVLZEmdAen+
         9ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038055; x=1722642855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyzdwZRgQhOlsIfYTCemvzcmHdUAJy3wvQe/vDjl5Fg=;
        b=VTLX2Rmy8TNYmYsOdX2L9BiQRI3+tNeQB8ZyktbBMdTGDoPW3H3A9U73c/1ynbJXRS
         qhVjAqLXZ9/FhkMZYirVcOy9U65OOKfBCT2dt3x7xC4+3fHLsOFzRKQBffmGXJr95Ict
         VkyH0td2pAmcuWtfteSjPztS73NNeP3rUqzXMmzYXHTAN7zfp7f6s5gnNNvI1QqpIblN
         kmf6Wmlpx4rPtAGPgIdYXhxdfXrijqO76JP25narN8UzJ8IMWhp0iQToz/LefGJTggLB
         GUaFWWFbk9zOEiDGs2RyLE60crS3RCX3lgl576JrJRs5Gj5BsKwIe2nmEsemL1nX429J
         d8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUq5IC8Q3eXk3C/OTesv+Y/DGuohe/+zPNp/RhrL6RL57xhq0DklqVHH0QKEagiaF4bxKPGdz5KyA8FI8A675eljKzNZm94eIg+GQ==
X-Gm-Message-State: AOJu0Yy2L90t3LTJpEPjpXLdaMuOUOiT2qFKe9upWP2TIEg5hQ6w45Fr
	y6rXcNYdXnAkn2cht5wpOTS0DqAgZL5GQNbXlFCpUVMBTTZmBSAAv9yY50bXswfbtUVsEilfYBa
	7xA==
X-Google-Smtp-Source: AGHT+IFpeG9OHD4NFko0QV+s2bLKC/mOPhRZ2kdDMQUp9/Z6e7qKWnbHym6UcCLJKsXB8YuZDTrWfSN5tHI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:14:b0:66a:764f:e57f with SMTP id
 00721157ae682-67a0abd50e9mr49107b3.7.1722038055008; Fri, 26 Jul 2024 16:54:15
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:56 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-48-seanjc@google.com>
Subject: [PATCH v12 47/84] KVM: x86/mmu: Don't mark unused faultin pages as accessed
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

When finishing guest page faults, don't mark pages as accessed if KVM
is resuming the guest _without_ installing a mapping, i.e. if the page
isn't being used.  While it's possible that marking the page accessed
could avoid minor thrashing due to reclaiming a page that the guest is
about to access, it's far more likely that the gfn=>pfn mapping was
was invalidated, e.g. due a memslot change, or because the corresponding
VMA is being modified.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3cdb1bd80823..95beb50748fc 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4339,7 +4339,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * fault handler, and so KVM must (somewhat) speculatively mark the
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
-	if (!fault->map_writable || r == RET_PF_RETRY)
+	if (r == RET_PF_RETRY)
+		kvm_release_page_unused(fault->refcounted_page);
+	else if (!fault->map_writable)
 		kvm_release_page_clean(fault->refcounted_page);
 	else
 		kvm_release_page_dirty(fault->refcounted_page);
-- 
2.46.0.rc1.232.g9752f9e123-goog


