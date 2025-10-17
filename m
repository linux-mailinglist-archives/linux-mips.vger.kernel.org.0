Return-Path: <linux-mips+bounces-11746-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BEDBE5ECD
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 02:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FA3E4F0123
	for <lists+linux-mips@lfdr.de>; Fri, 17 Oct 2025 00:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812E2277013;
	Fri, 17 Oct 2025 00:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IBJzUfWq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563E0264634
	for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 00:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661185; cv=none; b=YfOTc5GqrAeaMJcrYwknlwaCMUFSZcvOJ9742MoTSFqYMFLVyBusgABEA2j99lLbcuAWrzsvepoEI98oXPSOoRD5vpJABb41DNpgoN56FyujsRGGWpFTncWVuYoRQ+US9L3jvRLnur3lrLAy9lX6zjynS+Z3p9JJANsWb0wgw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661185; c=relaxed/simple;
	bh=ZVrQAaDETHJOm3nZp8vCz09Pe/Wr4FeYALw+WA60dkU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Aug3uctVu4tXwo6355OsWdHrPZjrgOuCfpeOnWA7JTe/1KKaWJ5lxwNYoLDq/rz/G5U1+aYEmGKzyRToaXpVMkQtAKemeKXOmSfX72aPh9BSxae5SRw2V71999YCwkookGREVPCVLinzMn0MeAj/UWFhKBdnulX88JlaMfDH430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IBJzUfWq; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so2174268a91.2
        for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 17:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661183; x=1761265983; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EknCUbF2LHWm0fNDNjp+CKNXYZwTUTGxAjt6VludIpM=;
        b=IBJzUfWqKqgA2dZ0ncXhr7wne+qoBzaru6iwsgi8HGnOM5tJqrFKJaMxZVwObQEmcr
         TRm4paOnkNVEgamYkQkR7CWTBVlChdOCk7E+gBAAbhIc985IX3j4m/BjMGNM/qg/rj2b
         30fR007r6nw3QOMC2LuPnWoun/4+1Nkr6/8zPZh8HGIt2k/VNAeHenLomLq1MiFnkcBb
         xPIaBXuwq4MBBUBtgIi3CThwXR4lxc2Odba1pIU+IzliYWGy+kn1FNencdLP+C1w5qSi
         fjzymMuRR8AYmCyXmn8WxO2J4jechOfgSp+LM3QSg8BdZYij3QvyTl+H7NXKb6sI3Z2S
         0T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661183; x=1761265983;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EknCUbF2LHWm0fNDNjp+CKNXYZwTUTGxAjt6VludIpM=;
        b=XIMXZ1JYrOy+pVD/wy8t4f5dNXEbu22yoiBgmDPp/tL9aW3mdghrcmGNnsyJ3fHZIL
         FdHUt6UpRqULQI1SxbTU2aGmyM1GiPWCh6W9X60VZKzCp8xBvj1a1Wqkf9vnGP7CLWj1
         DIhrRm1MY63x9q1M2Kt6zsqvZL6dnxjIGnoSs38EyORPU/+/EGbCj8mJXUYaXFN+w16z
         rUREwvN9vChYaGB5quPBP7hKw+rjVkvlQsVBD9AKCEHlD8BqWGTzYR7SnAilVJEVVo02
         Tab3WG9qRcPO9gLwevOEdpbnS/SJ/A9pcVuazqaZEDIXVcf0AxYIBfpA82YFFy1hAltz
         Qulw==
X-Forwarded-Encrypted: i=1; AJvYcCWYZEXo9qzQU6KOBLBAaGUrTxVEX/fz22MysqNT/LGuwHTkHX5SgniMvFXlLlrYvc5RSsA10YZt4zEw@vger.kernel.org
X-Gm-Message-State: AOJu0YwrBcLVvqtpcwxFsGiXjSySqW1SYNuCAgKHZeLpesvMQfyXH19b
	fmYMzEaeKky5vBMIjQbBn7uwJ2MmDRwpU12yznj7yvyHi0WaD/u7Gu5LVX6BqcSXEFHrcqvphKs
	IPw8Ilw==
X-Google-Smtp-Source: AGHT+IHp0VFuMyv8iYOF0K3G5i6Db3pbnaDLGLxvBIGhE/qWOYmJanCMeHz3uAv5TWFd0pF3pAUnMoqPNCg=
X-Received: from pjuy20.prod.google.com ([2002:a17:90a:d714:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44c:b0:336:9dcf:ed14
 with SMTP id 98e67ed59e1d1-33bcf8e3b0emr1878293a91.23.1760661182616; Thu, 16
 Oct 2025 17:33:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:26 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-9-seanjc@google.com>
Subject: [PATCH v3 08/25] KVM: TDX: Return -EIO, not -EINVAL, on a
 KVM_BUG_ON() condition
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

Return -EIO when a KVM_BUG_ON() is tripped, as KVM's ABI is to return -EIO
when a VM has been killed due to a KVM bug, not -EINVAL.  Note, many (all?)
of the affected paths never propagate the error code to userspace, i.e.
this is about internal consistency more than anything else.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c3bae6b96dc4..c242d73b6a7b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1621,7 +1621,7 @@ static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
 	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/* nr_premapped will be decreased when tdh_mem_page_add() is called. */
 	atomic64_inc(&kvm_tdx->nr_premapped);
@@ -1635,7 +1635,7 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
@@ -1658,10 +1658,10 @@ static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	if (KVM_BUG_ON(!is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * When zapping private page, write lock is held. So no race condition
@@ -1846,7 +1846,7 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	 * and slot move/deletion.
 	 */
 	if (KVM_BUG_ON(is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * The HKID assigned to this TD was already freed and cache was
@@ -1867,7 +1867,7 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * there can't be anything populated in the private EPT.
 	 */
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
-- 
2.51.0.858.gf9c4a03a3a-goog


