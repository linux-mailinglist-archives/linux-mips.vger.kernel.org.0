Return-Path: <linux-mips+bounces-5957-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 630AB999115
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE4871F21928
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E1920B215;
	Thu, 10 Oct 2024 18:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1pNJedDG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF7520ADFE
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584831; cv=none; b=EDIZjpSu2sgptVsuVVm41q66Kp3toZQaUglOT87VRdBRTYfBuEVhbXulfe14iI70tXs2meZGZseO8PUV01vfl3maw3MBd7psO1RapxASgfPVO9CMAvKcMXr6T67tqCLitYBJiNfkFycadknIU6IOVGoiG5uh4e2C7UPbdxA/dX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584831; c=relaxed/simple;
	bh=2hWIRT2fMV5KiR0O+VosZUqCujtj2BkFwotH6/Eh4cU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ap/4HRrq1kZ/8dRJ61Scpi/GjnU7HglNABHvn5JnRgeW38MpNC/rms8PZVJyXOO2FXrNyzbDU7eoN+6/UCTHra836mSliDFF3K7Uj/hTkmjcnx56Bs6LV73h8aN7VgaG+60BWA1ua0Ya0+A+QIZi3kDmUyt8TZnBo+tHCRJKbFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1pNJedDG; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e29088a6942so2105912276.0
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584828; x=1729189628; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dJnHBDyCwUFZKgDYTVV2s9CsyA2Ll45yxWv/Qp8Ijpw=;
        b=1pNJedDGxXfMA3UIXvlLk9yUgFqg1Xwn3494wFqV+9i756hIyBtpQeMuDK14Oc8dJ/
         pfvqrjHQZGkwYSiQpe7VEIzjzFJBs4dSTwV/KaNCt5t+7W3SnJwkBgP8lzwASf4U8hX2
         lWHShUHfEnMJxWGPlMeM6oT39oz82YA3W4dWND4IiJI0SR7DpM7qVYgr3EacLZKX+Ght
         39PQ15sIXfArpkmZRyzDuN95/3br1T4ES3Q/qpqzwWVmjVIbR8OhZXDLtz+Q1DJ52QfE
         nOe3psdiZSnykO5KYiW4RM5eHmQ6AQ7kh4u/3+4CjkTQixhFThwX9QmI7yg626qLu3if
         LAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584828; x=1729189628;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJnHBDyCwUFZKgDYTVV2s9CsyA2Ll45yxWv/Qp8Ijpw=;
        b=C2VXEWKShvWQ+lXNG+h1c4i+QDlw8HljNPaIEN52mhWDi7QMi/zlK+kDHr87GffzEz
         rSxDe0cy+UsFuo8sjvf85+Ojq/miOFjmqK7rf9E7ZeciRqxXn4YV2tKKlbubSFoivoS1
         FYFnuRTUdt0omwZh4+PAuizI4ZrtH5bzYlHp6YmhTvMVU8rWGR7w7DlQtqsUvqjB1CO8
         Xyn/w+6lCMshTNCrZUL9ZWi1U8BqhJ/4Q60mw6a6V/12PoJMgZGA8xw6Aae3NThGPy0m
         bw42SwonlZflJ0FWbbEdzSba9UlsQ4m5VNc0pXV4GIWWRbBRXdwpSP19mDNt+y6kuMN9
         krZA==
X-Forwarded-Encrypted: i=1; AJvYcCUqUYsUwFm0kLdLnTGxqs9iN8Cb8hBs3g5F8+k+mXJZsHomXDBTeF95JTT7nJK190jTmGizeUEl4tvn@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3WXuSMU5ZpPY4a8N36ccDvjI+yqAYqk35vNA68HM2nn8Drrw
	/N4elGCSFeTimn3mkBO5gdTxBojgrYhBNM3HWSLy0tnfNOQuGdL+UpR3VybfbBOqs6Fzx1BkoKa
	LJA==
X-Google-Smtp-Source: AGHT+IE3wQG+AmAWHFVOEkWtTHcZkQX/AbMzk25RszCXWWBD0mfEZbS2aMxfU1imj+f8RQ2cZBD1mpHhlQw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:a07:0:b0:e28:ef8f:7423 with SMTP id
 3f1490d57ef6-e28fe355de0mr48920276.4.1728584827639; Thu, 10 Oct 2024 11:27:07
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:06 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-65-seanjc@google.com>
Subject: [PATCH v13 64/85] KVM: PPC: Use kvm_faultin_pfn() to handle page
 faults on Book3s PR
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

Convert Book3S PR to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_book3s.h |  2 +-
 arch/powerpc/kvm/book3s.c             |  7 ++++---
 arch/powerpc/kvm/book3s_32_mmu_host.c |  7 ++++---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 10 +++++-----
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 3d289dbe3982..e1ff291ba891 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -235,7 +235,7 @@ extern void kvmppc_set_bat(struct kvm_vcpu *vcpu, struct kvmppc_bat *bat,
 extern void kvmppc_giveup_ext(struct kvm_vcpu *vcpu, ulong msr);
 extern int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu);
 extern kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa,
-			bool writing, bool *writable);
+			bool writing, bool *writable, struct page **page);
 extern void kvmppc_add_revmap_chain(struct kvm *kvm, struct revmap_entry *rev,
 			unsigned long *rmap, long pte_index, int realmode);
 extern void kvmppc_update_dirty_map(const struct kvm_memory_slot *memslot,
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index ff6c38373957..d79c5d1098c0 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -422,7 +422,7 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 EXPORT_SYMBOL_GPL(kvmppc_core_prepare_to_enter);
 
 kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
-			bool *writable)
+			    bool *writable, struct page **page)
 {
 	ulong mp_pa = vcpu->arch.magic_page_pa & KVM_PAM;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
@@ -437,13 +437,14 @@ kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
 		kvm_pfn_t pfn;
 
 		pfn = (kvm_pfn_t)virt_to_phys((void*)shared_page) >> PAGE_SHIFT;
-		get_page(pfn_to_page(pfn));
+		*page = pfn_to_page(pfn);
+		get_page(*page);
 		if (writable)
 			*writable = true;
 		return pfn;
 	}
 
-	return gfn_to_pfn_prot(vcpu->kvm, gfn, writing, writable);
+	return kvm_faultin_pfn(vcpu, gfn, writing, writable, page);
 }
 EXPORT_SYMBOL_GPL(kvmppc_gpa_to_pfn);
 
diff --git a/arch/powerpc/kvm/book3s_32_mmu_host.c b/arch/powerpc/kvm/book3s_32_mmu_host.c
index 4b3a8d80cfa3..5b7212edbb13 100644
--- a/arch/powerpc/kvm/book3s_32_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_32_mmu_host.c
@@ -130,6 +130,7 @@ extern char etext[];
 int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 			bool iswrite)
 {
+	struct page *page;
 	kvm_pfn_t hpaddr;
 	u64 vpn;
 	u64 vsid;
@@ -145,7 +146,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	bool writable;
 
 	/* Get host physical address for gpa */
-	hpaddr = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable);
+	hpaddr = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable, &page);
 	if (is_error_noslot_pfn(hpaddr)) {
 		printk(KERN_INFO "Couldn't get guest page for gpa %lx!\n",
 				 orig_pte->raddr);
@@ -232,7 +233,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	pte = kvmppc_mmu_hpte_cache_next(vcpu);
 	if (!pte) {
-		kvm_release_pfn_clean(hpaddr >> PAGE_SHIFT);
+		kvm_release_page_unused(page);
 		r = -EAGAIN;
 		goto out;
 	}
@@ -250,7 +251,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	kvmppc_mmu_hpte_cache_map(vcpu, pte);
 
-	kvm_release_pfn_clean(hpaddr >> PAGE_SHIFT);
+	kvm_release_page_clean(page);
 out:
 	return r;
 }
diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index d0e4f7bbdc3d..be20aee6fd7d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -88,13 +88,14 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	struct hpte_cache *cpte;
 	unsigned long gfn = orig_pte->raddr >> PAGE_SHIFT;
 	unsigned long pfn;
+	struct page *page;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
 
 	/* Get host physical address for gpa */
-	pfn = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable);
+	pfn = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		printk(KERN_INFO "Couldn't get guest page for gpa %lx!\n",
 		       orig_pte->raddr);
@@ -199,10 +200,9 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	}
 
 out_unlock:
-	if (!orig_pte->may_write || !writable)
-		kvm_release_pfn_clean(pfn);
-	else
-		kvm_release_pfn_dirty(pfn);
+	/* FIXME: Don't unconditionally pass unused=false. */
+	kvm_release_faultin_page(kvm, page, false,
+				 orig_pte->may_write && writable);
 	spin_unlock(&kvm->mmu_lock);
 	if (cpte)
 		kvmppc_mmu_hpte_cache_free(cpte);
-- 
2.47.0.rc1.288.g06298d1525-goog


