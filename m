Return-Path: <linux-mips+bounces-11943-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12018C222BD
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52F7E461A06
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF5038336D;
	Thu, 30 Oct 2025 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nj+B+efx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6493A382888
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855031; cv=none; b=GeFxjnJ8Zt1VqyT8tEP67/hype988gs0dNsT7UYynYdzYZ1rzlcOJ+et03y23ZJYdbEgr5G3+doQ6Y7PmZatfGLeh9uIhlpz8mDF5ZGp/PhbwG55GsOvZZaJIBfqAuvVvivpUP6ZfLBWviIUZbtUELX0o7hZOy71ZmJrzNzQpuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855031; c=relaxed/simple;
	bh=ko0pi49hMMjXayjy5Hc2PgynQuEfPA92uCBi4fQ9ie0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VOuhvERCF/cIkxzttIn3Id0jnLLCFtH8fXCOGBBIXL6jdcEo5UGibwrZcFvVWVaXyeg+XQQgsF0DeyWCiXupzMiqsOD00Oqi8sJ3wcCv+kdy9OgZmuZ928fkNF/P/M3K9+gzrOTZTDkLB+cJc/WqtApA//HBF+kKkmnMGPv9OvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nj+B+efx; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33bc5d7c289so2693155a91.0
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855028; x=1762459828; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KH8ZMUFkaBzXjpSahKr3XCuyUdT65ecO9/HP1PAb4RI=;
        b=nj+B+efxjj+BjjpLsFBs9asAhG14bnqqJoNM5z9YofCOlxRMnFSVu3n/sY1Mt5fItP
         CsTO3RH93jnXS0R4+5Up/MU3OJ/hE5yc16bnWjmMoyvqDtelHrG7uinV/OtYrmiPpRqW
         G+/oE3ScYnxzem5B51i7E1lFke8cAGzXx+nkk+JrPfrhbAprJ/bYXlXcXZipbOUJizka
         YmtGSBTUVHJSgDMV10WoXwjgCiEGO5D6mOvCAkaoazLbR7hL7nvLax64VctyUovZeoky
         +ZgWn9RP+wSxUsFxnUlO6/qj936N3zt8ywlIltb8m7DHrZ5LUALFvXureoaiY9xAkpAU
         CAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855028; x=1762459828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KH8ZMUFkaBzXjpSahKr3XCuyUdT65ecO9/HP1PAb4RI=;
        b=AN2lU+qK9VqIcG6nK5rq0fDHzQQdPKMS6k6Az1dP+qW/KdtybLylVdSMLg2y+D2b16
         lUOvovQDmZ1uxEPdSP12RhlDxaAiyj96A9+PgUjEs3f9xraL5i13yqrixvPh0rOMo+do
         AHsAF9wrvHOO2uwqCZbgSnXFhu38vHC+ShUco3GZtYaPZziEKsUsMpqFoWEliB7ja38n
         wwI2dhCbnn+V5Hfxh13antE09nr7mifxhs+xy6tgfua9iJYwNGzzpAKaFZipAouhXjAO
         QgW1nrgeHXu7aWJJMltzegHrgr8izGQSE1mw2yarD23FMkTVNkRaKPL08fW3PSnjmA07
         SNSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlfepP0ZdWEU6/nxlsZ0gfmxJexrXTpnzmWKrLwL9Pya5LCb+5cnxiO1jZlKnSTRjKz41dIaTWbXWG@vger.kernel.org
X-Gm-Message-State: AOJu0YymuQZv2oSY1bxalEYgv5mfbdoubd88s2+kzHcgjbKO9egqlMEi
	b0SK/JpXof3FFp5GAv4PENX/eso/Kls/5On2LnrcAEUt/HQij3oY1aJRNbbrrwqYndyVUswMdWN
	u/LY7HA==
X-Google-Smtp-Source: AGHT+IGrJrKalEV3VAWt2uGzDiDeYhZVGRjeI1LK3deyE8hSeRDQF6nrnXg4JLxn0CpF+AukaegC2zqX/UE=
X-Received: from pjbgj23.prod.google.com ([2002:a17:90b:1097:b0:33b:cfaf:ce3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1801:b0:330:6d5e:f17b
 with SMTP id 98e67ed59e1d1-34083074dddmr1219299a91.21.1761855028166; Thu, 30
 Oct 2025 13:10:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:35 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-13-seanjc@google.com>
Subject: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full RWX
 when creating S-EPT mapping
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

Pass in the mirror_spte to kvm_x86_ops.set_external_spte() to provide
symmetry with .remove_external_spte(), and assert in TDX that the mirror
SPTE is shadow-present with full RWX permissions (the TDX-Module doesn't
allow the hypervisor to control protections).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      | 3 +--
 arch/x86/kvm/vmx/tdx.c          | 6 +++++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b5867f8fe6ce..87a5f5100b1d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1848,7 +1848,7 @@ struct kvm_x86_ops {
 				void *external_spt);
 	/* Update the external page table from spte getting set. */
 	int (*set_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
-				 kvm_pfn_t pfn_for_gfn);
+				 u64 mirror_spte);
 
 	/* Update external page tables for page table about to be freed. */
 	int (*free_external_spt)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index e1a96e9ea1bb..9c26038f6b77 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -515,7 +515,6 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 	bool was_present = is_shadow_present_pte(old_spte);
 	bool is_present = is_shadow_present_pte(new_spte);
 	bool is_leaf = is_present && is_last_spte(new_spte, level);
-	kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
 	int ret = 0;
 
 	KVM_BUG_ON(was_present, kvm);
@@ -534,7 +533,7 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 	 * external page table, or leaf.
 	 */
 	if (is_leaf) {
-		ret = kvm_x86_call(set_external_spte)(kvm, gfn, level, new_pfn);
+		ret = kvm_x86_call(set_external_spte)(kvm, gfn, level, new_spte);
 	} else {
 		void *external_spt = get_external_spt(gfn, new_spte, level);
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 7ab67ad83677..658e0407eb21 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1629,14 +1629,18 @@ static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
 }
 
 static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
-				     enum pg_level level, kvm_pfn_t pfn)
+				     enum pg_level level, u64 mirror_spte)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	kvm_pfn_t pfn = spte_to_pfn(mirror_spte);
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return -EIO;
 
+	WARN_ON_ONCE(!is_shadow_present_pte(mirror_spte) ||
+		     (mirror_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
+
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
 	 * barrier in tdx_td_finalize().
-- 
2.51.1.930.gacf6e81ea2-goog


