Return-Path: <linux-mips+bounces-11749-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DDBE5F06
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 02:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53E9D1AA0095
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 00:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B942857C6;
	Fri, 17 Oct 2025 00:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="meXA5Rbt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0327E076
	for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 00:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661190; cv=none; b=btOay9ExteRdfu9lghq7293bTAVySlfoNdZ2Nl7ZtTHs74BEWP18EpkG1uvH+YC8G3C+yOLCnpblh+KBeGBSjxmDB3gYytZhchpz+//NmKmy5acDwvzQECR7Ivq/OlrOq7rgJu5ZmRfUjhyuAf4oEHrVgTNZeZy6XmEqLVN4DWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661190; c=relaxed/simple;
	bh=wYAEXPYHa2xMErFCIfNovZ590pxCtOKCG7ZgmLDnGp4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wb/y5LH8b3Q7MGEK2ZGI4cEM568YpReqX+74VpuLgdXksmNtk+75Oe/Z2GMgHhLWInbUCvX+M9j3UeYRM25yRCXB6ODpDmstJBHYwAQ7hcqqf9MCmWhvbPG8h3ujrteaVfyTrI3vsSrLoXXMfY5d8eCyMMJlV1r4MER2+jp1rOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=meXA5Rbt; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33428befc5bso1886094a91.0
        for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 17:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661188; x=1761265988; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
        b=meXA5Rbtcn2dDXKmEbm8JEbkRlcsdIn3bhSbm4/TT6Wk9tTRL9sZ/PreDT6aGziq4s
         MdjRT4PmL+YtuWnTf1Kijw2abNvPZljInMlM5nQpenjN9mlpcOV6ZXTOTaaONyTlNv3j
         NWi1babo8bn8p9Ym74NUNfyckVpgrSLizXex2+ZuprpHw04PIkFbJErTi26CSxpbOL+a
         xDhoH4UzTFTnXRbz1Buezwbm0MgYmFjPdv+Qsf0AOatgRLT1u442D6dCjlgg0K3RoaF6
         AvZpcSCsI4MmO0Uq+Ey73ioAwoMRJ06uHNeEV7TJXQAmRE8cs2wnICGOBlwRohwwafB9
         wSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661188; x=1761265988;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ylyqozer80U4wIAhCrbCm8kORDI60jP8QTvjhJUGpZY=;
        b=HPAJ8YJBroIzJnKgtt49DL6/D0ibIg9QuHcX12tgipX0Mz04IfPtZcSf/4xJRWP4Au
         rrPh5+dG7fOT8jkBuaTuxU6+sLkD4LPPmk6frhIR0zUg2qIfLGCi2ILWZrJ5P37G3GCk
         vn/ID7N9rf+HYoLQuGI1W313pL38Ie8gGkQJG6AB52vZMxv70lpiGpVVZV6mhDh+s4NF
         XrG/0XjHo4bKzVFUtgTKyf21G8RrxIEKALcmsSRcLSUxTDPQdYCeA/L+6vnLBp5oosS0
         l/vn3n/CdwGp2sr4SIeWcspLPvnwp1XbUzkLAPPAJKZSDoe+TPlERITfGGaQ7FrVxNV1
         p2ig==
X-Forwarded-Encrypted: i=1; AJvYcCUjslorPiRLeAjiALFg45dUu0d7Vv/AR+YxIlfA992IU+loMCJf4hMOJ/h4+AbTqd9zGzv1ORdXSRvv@vger.kernel.org
X-Gm-Message-State: AOJu0YxhqHD+M/AmtbFf76j4sbUm1IPn3aqtACK5+JPwE3yBtzyXHm/P
	Pzuo/GyjitrkcQxRbERuLBs/1XJ3osq9kOSit5u6l8xUtuBAvzyywjRNFHRd5205dplmZ/nvr5o
	ib7IM2w==
X-Google-Smtp-Source: AGHT+IFv5wQBYU08VlWSJ3YEyBvWx6CUl5P/6vzeOVA3OyqdlNjTdwYkeUoBdZlGjRBJoj7p6GD6I+E30lo=
X-Received: from pjbnc11.prod.google.com ([2002:a17:90b:37cb:b0:33b:caf7:2442])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f8c:b0:32b:a2b9:b200
 with SMTP id 98e67ed59e1d1-33bcf87ab38mr1930441a91.13.1760661187797; Thu, 16
 Oct 2025 17:33:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:29 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-12-seanjc@google.com>
Subject: [PATCH v3 11/25] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
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

Return -EIO immediately from tdx_sept_zap_private_spte() if the number of
to-be-added pages underflows, so that the following "KVM_BUG_ON(err, kvm)"
isn't also triggered.  Isolating the check from the "is premap error"
if-statement will also allow adding a lockdep assertion that premap errors
are encountered if and only if slots_lock is held.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index f5cbcbf4e663..220989a1e085 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1721,8 +1721,10 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
 		tdx_no_vcpus_enter_stop(kvm);
 	}
-	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
-	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
+	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
+		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+			return -EIO;
+
 		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
-- 
2.51.0.858.gf9c4a03a3a-goog


