Return-Path: <linux-mips+bounces-3309-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413138CB89C
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 03:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72AB11C20DE0
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2024 01:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FE52E414;
	Wed, 22 May 2024 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HbL6e8Aa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ACA288DF
	for <linux-mips@vger.kernel.org>; Wed, 22 May 2024 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716342027; cv=none; b=UR9LIvCUjpkAA3Ma71bosgYQaLMyEjhYEg6349r376Kmc3Vza+lIn88D6Q+0yDOZcZ8wWUQqVdTalOz2Z/QLdKiCQcmueez+fnxmGK9P7UDf63c324a7vaOi97GFe9He2swJ2gmT9XO7GQKS/kj5euQC0gWLiOneHm6KhcS9DWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716342027; c=relaxed/simple;
	bh=SxCNJ06vwtbyrQkZd4xB8bnO3JXPErYFa83rg1Usdig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OqRi40h+vSs618E0VBQlxvIWDuc57rky6xkadcHjKLh8Y9p13QmFm0u2P8O8sjczmV71FM+9RrTl4yWjzMv2gBzBgj85aSoJJn7OGFp0n7hJXEY1FMlHJnrP2GSFD8N7p3CKGoYjtRfe75l2lqL8EGL+MisQiTJwYCk6DSX9nA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HbL6e8Aa; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-df4da80ce08so603542276.1
        for <linux-mips@vger.kernel.org>; Tue, 21 May 2024 18:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342025; x=1716946825; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9/Jh3NT05cAP4Dr5P4AOID5+N71m8JBqExCgFsAlL8M=;
        b=HbL6e8AaswHNLiWKgo6se20VDshzgLLaTNIEN+U7UssI6ZsuxZEDTbfUqQQxQ4UDna
         irXn3F65FnI03N9WVpnBoPJLPWr1c8SZ3nplMBWABmwV/ZZoH8jlLZEgZeNm6YthcXMl
         fzGJQEoFKEgYnbfLkFI4I/aKUe2sdxyICOAxbYCjIg4yeSxBBFnswVO3hyCX1uFI5tRQ
         zDq9moeNogQDg3+7jND+UBZA+EYM7Fq9IHVj7kKGO29sWTpwsEgLbN5X0RY5VrwbzSxf
         S9cBu/NDD9LyWrTv83wn02X0cNIxMB6xPXkZ9RLMpVxaEMOdYsFYz2qoQsZDI2AnVz/V
         jtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342025; x=1716946825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/Jh3NT05cAP4Dr5P4AOID5+N71m8JBqExCgFsAlL8M=;
        b=ooKJdAVXCfiBRpENGZeeFmVJNYb3Nl7j70acnXJcRJFchnNRJPoqPZVnztPXeNrCgx
         nGtdF94XyTIRTrjJR7dE+WWiK1TYukz+Ffmfw250NyjYDmJbDJ6Jz3sqAyuKnuKeZcmH
         iy94zWAKAhuCAINA+8+SbgrZt/QEBXyS806JsFc5zDSIvhtROgXxeX1awR8l+hs5ZWXu
         uf7eEEuPEWDjG/UWSZTuFBATWTVgsptBEzbGR1klTZfqtndkGaNeq7S3UbN3pzDXepge
         cKHal3LsAGqVMCCL7UmNUsGUNCM1Qu5Fn1qRj59GNSSz23vk5tubQGQVNjQnz192YNDp
         K+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXu/YrQIZJl7b8VRqh57DGsjKia4TKe5Fl5mqEBekX0vIBaA/QQwGNlblAL/fcWLKEntodR7DAiV6Dytldk6R7Mhy20ZZGhFoArvQ==
X-Gm-Message-State: AOJu0YyF/4Ao8NYX0afchjHwjyy0iLYqj9pd9ZPrfkjMC7x8lQq2wqnL
	F5XQY2+nRWA3ozXSCLaKz3ZIO4mwbh65q/aeofMPS7Ojcp0YWNE14X24xiACrptOnjC1GPNkJbh
	IDA==
X-Google-Smtp-Source: AGHT+IFb4ojjFIBjH/g1gqSAZtGdXjScECyPQCKxtonXS1wS1/Q6Sfuh8cMohHl5GHkfuJ7096x7AKNuxdo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:100f:b0:dda:c4ec:7db5 with SMTP id
 3f1490d57ef6-df4e10405f6mr210549276.4.1716342025422; Tue, 21 May 2024
 18:40:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 May 2024 18:40:12 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-6-seanjc@google.com>
Subject: [PATCH v2 5/6] KVM: x86: Unconditionally set l1tf_flush_l1d during
 vCPU load
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Always set l1tf_flush_l1d during kvm_arch_vcpu_load() instead of setting
it only when the vCPU is being scheduled back in.  The flag is processed
only when VM-Enter is imminent, and KVM obviously needs to load the vCPU
before VM-Enter, so attempting to precisely set l1tf_flush_l1d provides no
meaningful value.  I.e. the flag _will_ be set either way, it's simply a
matter of when.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 59aa772af755..60fea297f91f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5006,12 +5006,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
-	if (vcpu->scheduled_out) {
-		vcpu->arch.l1tf_flush_l1d = true;
-		if (pmu->version && unlikely(pmu->event_count)) {
-			pmu->need_cleanup = true;
-			kvm_make_request(KVM_REQ_PMU, vcpu);
-		}
+	vcpu->arch.l1tf_flush_l1d = true;
+
+	if (vcpu->scheduled_out && pmu->version && pmu->event_count) {
+		pmu->need_cleanup = true;
+		kvm_make_request(KVM_REQ_PMU, vcpu);
 	}
 
 	/* Address WBINVD may be executed by guest */
-- 
2.45.0.215.g3402c0e53f-goog


