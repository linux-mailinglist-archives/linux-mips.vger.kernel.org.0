Return-Path: <linux-mips+bounces-7925-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3AA4316C
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 00:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F39D91888E42
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 23:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE1A211719;
	Mon, 24 Feb 2025 23:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BZ27Tmm+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC66211466
	for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 23:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740441357; cv=none; b=LssFWpZbYB2ZvnBJIH106/DZdFEEmvyWZkbQiEy909FOIvKxCTM21Bfn1xGYnQj69OtFUvGa1Kugfj6kg3EoOdXsGXt39wDFynv8YyrsQjn/iDQRNT2d++T+hWWUupFy4/oOc70siFhw/BXQk92VSL6+Gw0tlvC66DhpTfH60Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740441357; c=relaxed/simple;
	bh=RyQAx7Z5zYd41S/+BHB5zwIwQj3p0JUw5qeOKaGY3V4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DamNM7ZeWM648V7Bk8n53HzS0m8xQxp6z2M58FCdsdoFwdYRnaMUhRd5wHpHOIk1s6o2GbAN56Woxg+Pl3wSkI8W2rs1ldt29p4kAfwIr+WD1NKSlBzFDX7Lda5xrxe9LjTNslNRxpAfAr8+w3+ye1Y+q5EYcByPI2m00O3EvA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BZ27Tmm+; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-220e62c4fc2so108951985ad.3
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 15:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441356; x=1741046156; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TJTgZNhYY30nXxMYJRDXX1rx/rqsWdUW6nwlsEZr+Zo=;
        b=BZ27Tmm+0QH19zZj62ZGEh+dxD7t/20Btf+JCNALcqii6YqEJSTX0ElCdk9HTL/pHI
         Qme7R9yhgjGvb5Dkb+t0yEOMAXYbwC41zTcaKD+OBdts8dhV2/Gt0pCkD6/6Ye50cAmZ
         +ZoRLnoV0vDSYZe2xiWYCtX7ff8RrANGFRoWP/4CwFqZZjqgeg0tYKDaazJPH/J5NcKL
         VHPXZ/F1o+HyFqX2fzI2bhmhwlPVW18ya00Pv4pg2DXGL9t0CatOeP0u5Igc1bk4U1VB
         hjL40TUmBPsRlmjqymJP21V/lh9UJ3q5QOn43Jm8UJhiAdzS65GXPW12SrEqP00WyjlT
         lY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441356; x=1741046156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJTgZNhYY30nXxMYJRDXX1rx/rqsWdUW6nwlsEZr+Zo=;
        b=IT74WiNz1qia3IrOhlvIDnsBeh5Os1tmaHabZTQ/JNH7CyexUeXxL/6R8yQuOR07vA
         TFbtRlrzaBjw2umgugrAna/Jn1REFPDsJwUDb7ndTQGSgctcoeLLv4C2507cn94/ZfAc
         51cl0vSBQDlQuvrScVAR2ewnQwrlD47HF3cSun65KZyeJuB4ZIW75UAoovb/pCrHT1xH
         JUjdZCCaYzsMxFBtjFoOrEjWj8bf8FRcEwypUHB1kS9hOqZKWfZ51Q4/J+qEq6mMlFZs
         kSLRdTSCTMwrX3p6jomKofQDIEm8k7PJvHJAV7+WW+hhjkGp/tFUtYDA3pgv9s1+TyEA
         lF5A==
X-Forwarded-Encrypted: i=1; AJvYcCWbE0DJPVWxrzwkHvpKmLB+vWVMRYUIKypmygZqDaJJdA3ePn/VVLxvFLZismgqeTdwfn+ygLoO4gjz@vger.kernel.org
X-Gm-Message-State: AOJu0YzKOpy0z73DEuMtGWJ/bTPHEL/AQisA5+Zl4HXaGjKXc4i+VXPT
	tV18vKwZTqSfQjB7Q8OFy4t12b5lvfWT6hFJ+S6P3AlCfrtAHPobAh/o0eHGBl5TsdVIM7UeF2f
	xiQ==
X-Google-Smtp-Source: AGHT+IHgthprmvsK7rAfh+PsqOM1pat7xQuGm72FmKpfdI+qTOt1cCxKN5aFSZszJT1EFJi9jy4pNoVXfJY=
X-Received: from pfbig2.prod.google.com ([2002:a05:6a00:8b82:b0:730:7c03:35e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1947:b0:732:623e:2bdc
 with SMTP id d2e1a72fcca58-73426c84885mr24369761b3a.2.1740441355733; Mon, 24
 Feb 2025 15:55:55 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Feb 2025 15:55:41 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-7-seanjc@google.com>
Subject: [PATCH 6/7] KVM: x86: Fold guts of kvm_arch_sync_events() into kvm_arch_pre_destroy_vm()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

Fold the guts of kvm_arch_sync_events() into kvm_arch_pre_destroy_vm(), as
the kvmclock and PIT background workers only need to be stopped before
destroying vCPUs (to avoid accessing vCPUs as they are being freed); it's
a-ok for them to be running while the VM is visible on the global vm_list.

Note, the PIT also needs to be stopped before IRQ routing is freed
(because KVM's IRQ routing is garbage and assumes there is always non-NULL
routing).

Opportunistically add comments to explain why KVM stops/frees certain
assets early.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a61dbd1f0d01..ea445e6579f1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12772,9 +12772,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 void kvm_arch_sync_events(struct kvm *kvm)
 {
-	cancel_delayed_work_sync(&kvm->arch.kvmclock_sync_work);
-	cancel_delayed_work_sync(&kvm->arch.kvmclock_update_work);
-	kvm_free_pit(kvm);
+
 }
 
 /**
@@ -12855,6 +12853,17 @@ EXPORT_SYMBOL_GPL(__x86_set_memory_region);
 
 void kvm_arch_pre_destroy_vm(struct kvm *kvm)
 {
+	/*
+	 * Stop all background workers and kthreads before destroying vCPUs, as
+	 * iterating over vCPUs in a different task while vCPUs are being freed
+	 * is unsafe, i.e. will lead to use-after-free.  The PIT also needs to
+	 * be stopped before IRQ routing is freed.
+	 */
+	cancel_delayed_work_sync(&kvm->arch.kvmclock_sync_work);
+	cancel_delayed_work_sync(&kvm->arch.kvmclock_update_work);
+
+	kvm_free_pit(kvm);
+
 	kvm_mmu_pre_destroy_vm(kvm);
 }
 
-- 
2.48.1.658.g4767266eb4-goog


