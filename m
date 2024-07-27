Return-Path: <linux-mips+bounces-4507-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BD993DBBF
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43441F21737
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FF9180041;
	Fri, 26 Jul 2024 23:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vOPrOR3Z"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FFD180A69
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038036; cv=none; b=n903lFFYteQW75TibeXRwDC8TiR6A9SJNPorTTgziRsPcJD9n0nTh+ifHjMvpIauHOOGX9x8Wd5Hr+uj79n67jcxsm14E0NlDFpR/AOWfW8av2mEi7I1nrsWdGed8omVMwIkx2sUwYrXz1MMlLY/HgVg0e9TUnya5s96NVKL09A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038036; c=relaxed/simple;
	bh=Qgk09DtqQ///7D2ziQIGzwRVXn6yTiUN0IJf79z4tP4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hfy7BTMZCFghnUyooh7wAgwuQWnvUHB8P6kNyDVb6f0Hs4AnIqxCqkWKoKdtJDuQaNmFlEjgvnBwMvx6N+7mg2Ljjysiyrzny9yDvGYPWS6M3EIUfCpcLLN12cs0F8cVseQU2XDine4gmEIvRkR+siqh/IUQiEYvQyjNMrUGYqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vOPrOR3Z; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d34fa1726so1503123b3a.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038034; x=1722642834; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WZrNaP2gtmwMUuypG9xN5YPW8gmxxvZG3Q4zEjuRFyk=;
        b=vOPrOR3ZCzVs9WpylwWl1TKWJHEzPH/z2Gg+XhnloANSjcNMwQa1ZmzC/2DMBGqnzo
         FlPhCi8Zcd5lxo+IG3lReaKxnKg8PVNfbzZLdFtTctN+X7qJoH0GBJt6O40GLgQ1jUyd
         EQUx2gX1sn+OijuRYvG8sb7Kk0wiyMcIIC0Q8d/jaKkoQoSExL0kczoZosaDw7TabwOR
         gvDIXqejH4DdY0bQj9VIqPpdYweXwbIA5VEWUuvMZRl+aldxLsTNTrezvtpxPhv0Zsup
         7o7hrhEwq9DpeVml5N3yRntPhBJcGrTKdzEdiShVt+D/k40D32s2lKuaPjM1Dhb964+l
         +qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038034; x=1722642834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZrNaP2gtmwMUuypG9xN5YPW8gmxxvZG3Q4zEjuRFyk=;
        b=C+PpE740E/XLkjhxLro0RZat5n9X80nBlt6kzBjsVZ9GD/DdmzD03U6+u4zZaP57lQ
         OuDB2uVZJWs5e67M4OdB6mP6BQlNvPFcQ/9g5CY57f9ZznA6JT3Ojpi6K/trsEuL/IlY
         DNEV01o6zb036h1idRfBpKEXb5jwmEoLW0A9hDiZpNb90oQmtnWT9274+CajlNQulZit
         H5a5gn7kbWuXmFOXNvvkCRhDwGqweVElF6mIX8w6+++SyxACt23NKOEcViWmrN+I6nrd
         Vew/pG6F+P6UzUw4rOrr9XYZz7BBn0UhebeB9teHjWrbmkp3bagBVEF/6Fk/0TEeYKgb
         t88w==
X-Forwarded-Encrypted: i=1; AJvYcCUI0dZEZ5pbrK079bBaRnAyBkT00ijqEz67DAfeQM+sPjRFGcvzdv0ero4HQDYP1yik3vBHniuy/6OJkTZ+eZWqMGnQ+2pcAJSltA==
X-Gm-Message-State: AOJu0Yx1Orq0aAXp9U7vgZdIfqRaYC5YtRmNKrOuOWWG5HW/IRGuYGJY
	Ioihg81nF/NVTSHVxdveYHExk36UtCgtvjCiENk1sWBgBm/zzWxXc/onDqoibqJjVw0YBwrtFwc
	PFg==
X-Google-Smtp-Source: AGHT+IGBlhv2aegJ385ep1cUBQA5c+rLA7WdLDI/xGSka7RxNxI5KP3IWpNdT5/lkHtS9+xMECoFkdebDOk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1829:b0:70d:1bf2:2878 with SMTP id
 d2e1a72fcca58-70ecee0a0ebmr24898b3a.5.1722038033787; Fri, 26 Jul 2024
 16:53:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:46 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-38-seanjc@google.com>
Subject: [PATCH v12 37/84] KVM: x86/mmu: Add "mmu" prefix fault-in helpers to
 free up generic names
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

Prefix x86's faultin_pfn helpers with "mmu" so that the mmu-less names can
be used by common KVM for similar APIs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 19 ++++++++++---------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/paging_tmpl.h  |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a201b56728ae..4d30920f653d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4301,8 +4301,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 	return req_max_level;
 }
 
-static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
-				   struct kvm_page_fault *fault)
+static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
+				       struct kvm_page_fault *fault)
 {
 	int max_order, r;
 
@@ -4325,10 +4325,11 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	return RET_PF_CONTINUE;
 }
 
-static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
+static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+				 struct kvm_page_fault *fault)
 {
 	if (fault->is_private)
-		return kvm_faultin_pfn_private(vcpu, fault);
+		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
 	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable);
@@ -4363,8 +4364,8 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	return RET_PF_CONTINUE;
 }
 
-static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
-			   unsigned int access)
+static int kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+			       struct kvm_page_fault *fault, unsigned int access)
 {
 	struct kvm_memory_slot *slot = fault->slot;
 	int ret;
@@ -4447,7 +4448,7 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault,
 	if (mmu_invalidate_retry_gfn_unsafe(vcpu->kvm, fault->mmu_seq, fault->gfn))
 		return RET_PF_RETRY;
 
-	ret = __kvm_faultin_pfn(vcpu, fault);
+	ret = __kvm_mmu_faultin_pfn(vcpu, fault);
 	if (ret != RET_PF_CONTINUE)
 		return ret;
 
@@ -4524,7 +4525,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
@@ -4617,7 +4618,7 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index f67396c435df..a5113347bb12 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -235,7 +235,7 @@ struct kvm_page_fault {
 	/* The memslot containing gfn. May be NULL. */
 	struct kvm_memory_slot *slot;
 
-	/* Outputs of kvm_faultin_pfn.  */
+	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
 	bool map_writable;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index bc801d454f41..b02d0abfca68 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -811,7 +811,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (r)
 		return r;
 
-	r = kvm_faultin_pfn(vcpu, fault, walker.pte_access);
+	r = kvm_mmu_faultin_pfn(vcpu, fault, walker.pte_access);
 	if (r != RET_PF_CONTINUE)
 		return r;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


