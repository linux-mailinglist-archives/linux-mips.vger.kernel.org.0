Return-Path: <linux-mips+bounces-11750-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 611C6BE5F09
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 02:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 496B818803C3
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 00:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802692882D0;
	Fri, 17 Oct 2025 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lC5orD7w"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1919D284B58
	for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 00:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661192; cv=none; b=YQwJ/mZPXU96nO7Z7DiblgHetEctfREnmffP5sLVxM7RIMWAHXfGvhepikE95F+ot39gCw5gxD0UZ0JT29ftTECKy2SJ0346cJk60/Cv0CqoEbKD5ZM12UHwAnf+d6UVGNTh+weBkl0uNk87gNVb58dU/EAfGs1olJvS27U9D6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661192; c=relaxed/simple;
	bh=T+m3BYVvUt838TFNeB0JdBMWut/8n0JmQsfeAiJxDYg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d9giA09FHZw1Ct9C96N8WgqYhIBki0di7bxUW0OkQrCXRTdRFlIgQhp/NCinc4Nuv6hqUfCEUoI2dDuii5luQghFoX24KnyVCjn181fcMbmyTC0F+PBeP27XbPff4scSHUe39P5P3PXFW9/t4dXTiLtuO4yo6YrzotV7aWOaFfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lC5orD7w; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630753cc38so2050502a12.1
        for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 17:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661189; x=1761265989; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
        b=lC5orD7w5mscrpd6JATzDFcCWOtnaM6ug7gsHILNGUreXKkVd0RT3sswpdI532lmkj
         txsneJ655rxlruFVxZxNUFEJ2ebYZZitSlpjK1yRn6ROTXWIDJE4PvTiWImoIeCADUiW
         BszffPRMU88cnUNyA9Xxr+QmVF4e1IGYmmTDBLGFlVYEqitvoNLSBQjO6Gf3pxYEmOxw
         TYRknCt7FWurtMgnIzp65n/5N34sFkfEoNWT85Z8kyRkAv1ZEb1iacvHWzLvJlxN0+mX
         NbGh4tFSAq4UxHv6XULANkETVRv+28d8ENIpXo6eXkJcWbS3uc0DRHM0nTHgfCILpjth
         FArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661189; x=1761265989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
        b=XTS7E17PWu90tZETfYQuG45auh6/6LaGape78/MDf+DbhmX9GK3LA0mza5u2iCrK4b
         6ic2PBgFu5lQm5ZL95/BmJPI29nRkoGwrg8Adm9bo/cl0Ys5Hj130+1r8JHbSkIfZqZ2
         VDkB5pyVIQZSEiWnk3v1RYprpmwviEHWLTWRpnZIT6bnHxWuEj7P/zcrv5mxuXdfCNKR
         pXDjURHypFQyVq73jbLg/vCpYYUybvKdOV7Z2xnTwT1dmhx0mJLKizdnqc0ZcNcv0Z5y
         S2CxEroKAcZPXobI+xvwcjE5ztSTRHxkPJnl/SU1aZ9WS1Nn59ABchrpxmwVq1Udw5Gf
         xB2g==
X-Forwarded-Encrypted: i=1; AJvYcCXrpeu61+i1nhC6MpdKT+08hzGuxMDM7wLDk6f2POiXu83EIV034yy02sjhWSt6JGtiNHvj5zDiItcA@vger.kernel.org
X-Gm-Message-State: AOJu0YzsQwi9tQTpZ+HCovrr5bgnTTmujiEV8SCa/U8jstJHVYlBUvew
	3as/H8jwLPM4EvnN9dLkFicoKXOiNb+jYB6+fnUGJKC/koLjR1SbcSda0H70C3qmT4YffohgD1m
	O6HI5tQ==
X-Google-Smtp-Source: AGHT+IFzwgrTUpyTLmlR4n7vLZlT3Ntvx3uZ2AlOGbeNdkR1Pz/L5L7m7JolYZt52l8hjag9eabuD/ERTOw=
X-Received: from pjbpf6.prod.google.com ([2002:a17:90b:1d86:b0:33b:5907:81cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19f0:b0:286:d3c5:4d15
 with SMTP id d9443c01a7336-290cb947798mr22501395ad.36.1760661189400; Thu, 16
 Oct 2025 17:33:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:30 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-13-seanjc@google.com>
Subject: [PATCH v3 12/25] KVM: TDX: Use atomic64_dec_return() instead of a
 poor equivalent
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Use atomic64_dec_return() when decrementing the number of "pre-mapped"
S-EPT pages to ensure that the count can't go negative without KVM
noticing.  In theory, checking for '0' and then decrementing in a separate
operation could miss a 0=>-1 transition.  In practice, such a condition is
impossible because nr_premapped is protected by slots_lock, i.e. doesn't
actually need to be an atomic (that wart will be addressed shortly).

Don't bother trying to keep the count non-negative, as the KVM_BUG_ON()
ensures the VM is dead, i.e. there's no point in trying to limp along.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 220989a1e085..6c0adc1b3bd5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1722,10 +1722,9 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		tdx_no_vcpus_enter_stop(kvm);
 	}
 	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
-		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+		if (KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm))
 			return -EIO;
 
-		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
 
@@ -3157,8 +3156,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 		goto out;
 	}
 
-	if (!KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
-		atomic64_dec(&kvm_tdx->nr_premapped);
+	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
 
 	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
 		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-- 
2.51.0.858.gf9c4a03a3a-goog


