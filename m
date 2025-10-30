Return-Path: <linux-mips+bounces-11948-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DE1C22363
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD1946486F
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074E0393DD6;
	Thu, 30 Oct 2025 20:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3vGosYwN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7E5385596
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 20:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855046; cv=none; b=pe+q0otOiOUtOQwwPGe0FbxewtsmcpEnR2jFSX6PpjE0k0z1yjY/3rijr3LHbioKCy5nRdm0DfVOrUnlWGiw60ZZq4Fn+4BjfPeb2F9xwr/IvBprCDeROhKsDyDY2ssMxsfGKnAEAemENsexodspA0D7YnnreJ4rG/DNKAc6cT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855046; c=relaxed/simple;
	bh=chQz73w4sDaVm3u9kl7kGYcKIA2cugXbhH5x61ROvUY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M3f2dVcSAMAMnTwe89BED5QWHQQedfUzsrtZX23QSNYXr5qyZsfRDIGRb208QAgvC11u8yqT4VIi99dgoTV52eA6UafyR7OTtuoqqCk0z5Pfihxa2a+8L2J6tACVNcBbr7XIXC/cfB+dPuMXSwvchDd/UPFy5frFyNMmjJv4Hvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3vGosYwN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2951a6cf0d2so2413225ad.0
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 13:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855044; x=1762459844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NXaPi3MoPrN4063cnb5uQMVDinJuo4gq6tPJoc7Otx0=;
        b=3vGosYwNtIHf4kmGg81+yobiepdYt4tNPl8XkLi1EyoW6nlUxO2Pv2U/rFanbI+f+B
         ZvI4g2m5uSSlwr3U1T24jvQJ9CNAiQhEgXn+zqoF219Tz1O0LG6eJL8cEhx32Oz1Mq80
         Z7Sf3mGnpGunvpyqAyl7Off+u6eeXULE4BVf0Np3SCvi5y7xtjb54tZyDr9ExjOiLxA/
         Ay5y7pVvwWtxxTOkWRW0lrkGEdvJNw47dOc9mz9rDK9IjhB+2sd1Nubl7FdRfzXilaC3
         FnRAMKND2FRkHm2I33YnbCKfdv7JXLIQ3XO8YPCxLY/buzoOeYh+xQj0hFF46ZZu3Gbu
         Nmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855044; x=1762459844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXaPi3MoPrN4063cnb5uQMVDinJuo4gq6tPJoc7Otx0=;
        b=MaiyCX/Gf9DeWvE6Js6bMCtZm12J0g0y0h75RrwjQSmdKGCcaJDigJFqcH0nhILcGu
         xi+9twILMhcIWKWbPt17id4dnBiWIce9GVQk1a+greP3R6i7AkfW7bfC1g0YsvZpmGVw
         Iv8JRh3voL8kEn99nhlYNI7sBHsY8/uI7C5pVJfHokcdfu3cwvU9L/SdceFPA6BgHXVi
         Jgife4LPflubO6uYDtPlikWQJDsEHdVOWL9AmmlofH1yZ9w9DnCbmuPDcLemmko3Wza+
         8QgHAiNwZZ4ZgKuVxtwLToD3QNNSskGTTvPvUEWWsLW0hfiOmnWIHdf4XPn2X2yPeUJD
         Q5UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2YjD+n0ln32WWYCHsgGUAVI2Y3qSZB0kethHlYPc4bqoeezcqmiGrqJ5b/4nZLBj+reXFzcnuGi4f@vger.kernel.org
X-Gm-Message-State: AOJu0YwUDPgDH+qu3aMGKiZ/bir0LJpU1OWn22yKc8VkRwu2DC2KFwW9
	jM/uej+Ix1f9xFzVWrAREiwoAmhZBPah2rT1v8WypVGsB92vxTEfi7wrd72qJ1B5MWSReB+r1Mv
	lRUHBYQ==
X-Google-Smtp-Source: AGHT+IEb/219Cf+wyRyoeh6pXELuzrJXroky0oVjoU6kkNSExiZe/MRoYQlDKXB9iGMeGWIkzSQ16EMgROI=
X-Received: from plrs24.prod.google.com ([2002:a17:902:b198:b0:269:b6ad:8899])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5cf:b0:293:b97:c30b
 with SMTP id d9443c01a7336-2951a3a6519mr12248475ad.9.1761855043356; Thu, 30
 Oct 2025 13:10:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:40 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-18-seanjc@google.com>
Subject: [PATCH v4 17/28] KVM: TDX: Fold tdx_sept_zap_private_spte() into tdx_sept_remove_private_spte()
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Do TDH_MEM_RANGE_BLOCK directly in tdx_sept_remove_private_spte() instead
of using a one-off helper now that the nr_premapped tracking is gone.

Opportunistically drop the WARN on hugepages, which was dead code (see the
KVM_BUG_ON() in tdx_sept_remove_private_spte()).

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index cfdf8d262756..260b569309cf 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1683,33 +1683,6 @@ static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
-static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
-				     enum pg_level level, struct page *page)
-{
-	int tdx_level = pg_level_to_tdx_sept_level(level);
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	gpa_t gpa = gfn_to_gpa(gfn) & KVM_HPAGE_MASK(level);
-	u64 err, entry, level_state;
-
-	/* For now large page isn't supported yet. */
-	WARN_ON_ONCE(level != PG_LEVEL_4K);
-
-	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
-	if (KVM_BUG_ON(err, kvm)) {
-		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
-		return -EIO;
-	}
-	return 1;
-}
-
 /*
  * Ensure shared and private EPTs to be flushed on all vCPUs.
  * tdh_mem_track() is the only caller that increases TD epoch. An increase in
@@ -1790,7 +1763,6 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
-	int ret;
 
 	/*
 	 * HKID is released after all private pages have been removed, and set
@@ -1804,9 +1776,18 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return;
 
-	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
-	if (ret <= 0)
+	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
+	if (unlikely(tdx_operand_busy(err))) {
+		/* After no vCPUs enter, the second retry is expected to succeed */
+		tdx_no_vcpus_enter_start(kvm);
+		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
+		tdx_no_vcpus_enter_stop(kvm);
+	}
+
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
 		return;
+	}
 
 	/*
 	 * TDX requires TLB tracking before dropping private page.  Do
-- 
2.51.1.930.gacf6e81ea2-goog


