Return-Path: <linux-mips+bounces-4520-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADADA93DBEB
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 02:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D16911C20965
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2024 00:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEA8156665;
	Fri, 26 Jul 2024 23:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PvydeBsx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6867B1849D8
	for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 23:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722038062; cv=none; b=QrMpfm38HRCbfmfk15r69ooWElKVVA0AIhwp1uhMlZysRa8SVdzc8jYj7JEcEj9ElH3lFpOrU/OxNB+Rp0lR0Hfmx/Wbz1ZCFCPFi2tx8toEcILy7ICkRPNqbwdCMD//eoyluyyeSNF+USK72SM8gKtQjrZUWG8EIqbCTxDH5PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722038062; c=relaxed/simple;
	bh=+A4HyT5mPj7Uehr+zQRb98wKpKpbg1KoeNdaEKS53g8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kjJiDTfYH1wjcOU4bQI2OAYmtThFfi9N4fok41lUKUcf+4UK9rPnFt+Nbhu2rEzIqCX4b/mvcBlnP9RdjA35xm1fa3Ze45jOsRMioF0yN4Y2yIfiStLE+pDQFXlhj5Cj01yeE8FOglRk2N4otUjjJXqkczrK/1OtFy1QmuKW9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PvydeBsx; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70d1df50db2so1368341b3a.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jul 2024 16:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038061; x=1722642861; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=495sZLd3sCBTMIrtoKFKEohUXAwQ30LA4hbLQQBllaM=;
        b=PvydeBsx6Y6v7gtKxOzkkq3i7AtwdhgD2KevkRmejEmYtWZ6W6GtfA+IQH1JGO8hnn
         4xlCCXpA3DDtzMyCdCZZjhG+IjXocFl8tFZCKyscxVC0FBOeoGL9jEUpOEcvxQtz5iaZ
         zK2C4QsXiVsuEdB83RNQb9BI7jgEZXGzwLOYw/Yp65bt7H3imYToCkoMV0uZXm1OeonR
         HbdHlQN6rkXyRHXacnzzR6EulxrKgfPiyVE1VyHzxpNFXTVEA428LfUtgJtcdM9GHNxd
         zXDZi+1fsvIOb1MXbk2dQ2CW33Mj58NH03uiinTuoF5T0W3PvwUtejJRoPx2eaw4r7w+
         C6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038061; x=1722642861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=495sZLd3sCBTMIrtoKFKEohUXAwQ30LA4hbLQQBllaM=;
        b=UEK9zbThZXPlrcDq5e5cXTc1A3K0EirZnQvICsEG6TdeDVzQLjPHsRx1ULJTX52udu
         540erOF2nuWISARhDVf3i/FowHCj4oYNsrSss5kNuE8eF1WhGMBipuLGbBILco+X8NDV
         Tw5pViv2gOT73LupCP2Ei55GYF6o4J6SaiEK3K5hOK5DsBCXbhpM6e8vKWBu1dbY7Rbw
         8UJ6Uh89LX/fX8CXKakErBZmlS6j7RW/Ck3Xd/sjJsb8ihdZN/ZagRYETTwuNyADUREL
         dwELvNxdBz9j2XxLoxzH5jQvA6u5g85Ow8WaJbaVTrWkrYa04Ejy7ZoYUjENfXy+E3ka
         JsXg==
X-Forwarded-Encrypted: i=1; AJvYcCXIJqiFDZtqEAL07xZpudst/pkjPCOSc/Zdi1KSmrcAB1gqkBh7TFj0VWq0A4i7Gcc6GQQMz/9nZL6Ro6mp6wlBzoh6Lyegrz67bA==
X-Gm-Message-State: AOJu0YyvMsuU+vVCBpdNsIIblRyA9W0NeT8BMcYRs+y0UELazkd5tiCC
	BIyjDcbYxFcvObb0WsNtA6Zuf8/ymwwIbo9xq2LUEteleUgPFzCyV/2QvHqUjpcMrDlSt2LnGt1
	3mA==
X-Google-Smtp-Source: AGHT+IEX18wdLlkp+2aMf2anoWcNTpOtSr1c0ECGrHfjhmBCNZQh1f0vS16HR3FEGEctU7qtPLZbGkdGSSc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f1c:b0:70d:138a:bee8 with SMTP id
 d2e1a72fcca58-70ece533146mr8925b3a.0.1722038060383; Fri, 26 Jul 2024 16:54:20
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:59 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-51-seanjc@google.com>
Subject: [PATCH v12 50/84] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
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

Use __kvm_faultin_page() get the APIC access page so that KVM can
precisely release the refcounted page, i.e. to remove yet another user
of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
page fault, the semantics are effectively the same; KVM just happens to
be mapping the pfn into a VMCS field instead of a secondary MMU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 30032585f7dc..b109bd282a52 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6786,8 +6786,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memslots *slots = kvm_memslots(kvm);
 	struct kvm_memory_slot *slot;
+	struct page *refcounted_page;
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	bool ign;
 
 	/* Defer reload until vmcs01 is the current VMCS. */
 	if (is_guest_mode(vcpu)) {
@@ -6823,7 +6825,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	 * controls the APIC-access page memslot, and only deletes the memslot
 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
 	 */
-	pfn = gfn_to_pfn_memslot(slot, gfn);
+	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &ign, &refcounted_page);
 	if (is_error_noslot_pfn(pfn))
 		return;
 
@@ -6834,10 +6836,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
 
 	/*
-	 * Do not pin apic access page in memory, the MMU notifier
-	 * will call us again if it is migrated or swapped out.
+	 * Do not pin the APIC access page in memory so that it can be freely
+	 * migrated, the MMU notifier will call us again if it is migrated or
+	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
+	 * should always point at a refcounted page (if the pfn is valid).
 	 */
-	kvm_release_pfn_clean(pfn);
+	if (!WARN_ON_ONCE(!refcounted_page))
+		kvm_release_page_clean(refcounted_page);
 
 	/*
 	 * No need for a manual TLB flush at this point, KVM has already done a
-- 
2.46.0.rc1.232.g9752f9e123-goog


