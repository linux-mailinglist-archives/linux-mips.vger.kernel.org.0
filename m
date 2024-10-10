Return-Path: <linux-mips+bounces-5947-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 650E89990F5
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA880B276AC
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E043207A19;
	Thu, 10 Oct 2024 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WnVYZ++e"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB6207A03
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584810; cv=none; b=g9kjVeoAtLGOcPBaj1HxN3eNb//WmaDef1wAAswWsK8PIwx+j28oQr/f0CZ1XM2OnunOoBque6R0Py3/pgwi3ta4HjKtjfSN66fWKAPTkcZLlgtQ7Po0ME1TMez5sZ/S3hYkwFVCDMEyjkKlKwe7PCMICy0sbtuaMe0pqYlQUYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584810; c=relaxed/simple;
	bh=ZWIlv2h6Cx1yrF7GGy3UqCKI1dfxdLpdeKJSlsj4QNk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gnsa+35qelRudkHPnPBch6YqQ8pZjMF8Ww6MZH0V0BAEhHUzAQIAmM8AB0TGYVkys8fz/Kx6LAKu1nlcdfv/drJMOOR8jY36zwlFhymJt+zA+u6dbv2DkXZzSzr8LBeb8HGWmCrrTFPM8CBsl73gQrs1pwXX0sXN8+6UmDWoKKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WnVYZ++e; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e28fdb4f35fso2111617276.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584807; x=1729189607; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nHP38EtPz8K1+ebGaPqvgAKvgaQP36cKGSrn8JpxRdw=;
        b=WnVYZ++eloUHmaNH+PMyPBVaTNNQV7PpyzwKfQNf8E0TWCFXkHdgRSE8m9QZdbFqgl
         LUO9GmnO14pJlNUz/a9YQDP4sRdsmqE0I77QJPEJQLiNtELH3T55kxgvZXX+ZS04dduF
         HOubAFdITv4Os+cf8tlrjsJ28Wj+yEbPvdLMEALhRVl3zs/sWfw9mSXKeFLyukSkfF0t
         s159ZU6SoLfXQ7k/TJ51qYCX6bhgSQvRTMspjJT5LynWuHOAFbYEj7AgiVCpYczdtFzC
         uNelGCXQnKo8zvzdO7U5pHqlDSTPwijrS7Od2lq6i7bZd6sgWjEtE+f9igLiaozAMB78
         DGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584807; x=1729189607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHP38EtPz8K1+ebGaPqvgAKvgaQP36cKGSrn8JpxRdw=;
        b=mrWdRtwNBUQF2Yr+aEVc22+8go8vpz6kToeELxawW3SKGqevMh+BAD9yIpS+Yywp+J
         6KxXq09GfsB753nKod7ZAfWG2fQBHkSkmD4q8sjEU9DK7x4rZsvuR7Pdm/GmXiGp3Utc
         7fLkEft16zt+lLF3sf5XNeNG1i6gJlkMRw2A682iq6sSeye4dByvRSS81i8J9esEl19Q
         LMmlipRmzAnkGaUByPTqQfDf+vry4VSj+VMMMLgo7ivDJ8qBYQa/5KXL82tQVL8VkNaV
         he2HoL8jSJXJvPcUnvmvfEXPLrIKU4rfuoFdaOMH4gv0xxam3loZg6iqh8CFc4+Sa3lT
         G+hg==
X-Forwarded-Encrypted: i=1; AJvYcCXV1MG0fdu3EOXfaivT37Mwns5cbTakOur+hweV61mvEIKUzcYM2Ppmopgp/p/eSghvCQpnrlzej1pl@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUIYljype0lkC2+uR1i0ggcQjCDmarHdTLohdFtbMqXTC31k+
	LYlCDFzg0tm8FzryR+hN1gG7o7HIk2nQV8KargSLjOydcgjf4ujSukb/ySNbxu8O6E81zxT3dcm
	KMg==
X-Google-Smtp-Source: AGHT+IHQvsj0FcPHwm2v4Ks73fb0XY1uO3QmFFCKoUyfp7OKRYByAKtc8uXQ4anZ8QaSR/IH5oavOTtruEI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:b86:0:b0:e0e:8b26:484e with SMTP id
 3f1490d57ef6-e28fe516b5amr5188276.8.1728584807403; Thu, 10 Oct 2024 11:26:47
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:56 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-55-seanjc@google.com>
Subject: [PATCH v13 54/85] KVM: PPC: e500: Use __kvm_faultin_pfn() to handle
 page faults
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"

Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
and continue the inexorable march towards the demise of
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 334dd96f8081..e5a145b578a4 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -322,6 +322,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 {
 	struct kvm_memory_slot *slot;
 	unsigned long pfn = 0; /* silence GCC warning */
+	struct page *page = NULL;
 	unsigned long hva;
 	int pfnmap = 0;
 	int tsize = BOOK3E_PAGESZ_4K;
@@ -443,7 +444,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = gfn_to_pfn_memslot(slot, gfn);
+		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
@@ -488,8 +489,6 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
-	if (writable)
-		kvm_set_pfn_dirty(pfn);
 
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
@@ -498,8 +497,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	kvmppc_mmu_flush_icache(pfn);
 
 out:
-	/* Drop refcount on page, so that mmu notifiers can clear it */
-	kvm_release_pfn_clean(pfn);
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


