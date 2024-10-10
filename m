Return-Path: <linux-mips+bounces-5898-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC58999000
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 20:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D0D8B270CF
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 18:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8021E285E;
	Thu, 10 Oct 2024 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zZnV9RMn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8961E22F7
	for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 18:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728584703; cv=none; b=Z02ectNwIYWN+fhvGAygYE6CtffXZsTouVTvY06L4IUb/0ChNi7qcus6cl7RBucy9SoRAbXOtF2PNGiOx0MkFy3nUv2R9nEqYxERPvWqX5it6p471be1hw/lYNjqOKuqnhBdXaqr5lMLJBQtBemMFHSJasLR3kpTL2UD43ltKgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728584703; c=relaxed/simple;
	bh=uAiI5uzFAMXWntu4OPmR0EhFBczJTAI1tjFERMQUX4o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WGWG7BiKRhcE98heRO2hbluyTADLHOQsuba4CaXFTMovUGh9RX87Vfk3yowLQCAaqeK2WQcATk2SBfaAJR/mQey1C3BCL0NE61uDzCFeCfxzi6kcwrsyCRFmvtHOVG3fLJXebPeCUpfaFiCboqLtnI26uXB6xmLaP3w/1mkz1E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zZnV9RMn; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e290947f6f8so1842476276.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2024 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584701; x=1729189501; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
        b=zZnV9RMn+Omcj8cSLLQ1OO0nfSJBegsKEALf2M2ho0vTZxhMugmk84GGd9BSEy8lfi
         5bXdzgRyXEp9OOV73dHe9K+/mvumfArmQlwdAIIf098Xo0lDHqhVeyJufcDy6upSTUCg
         eJa0l/phgkxFHgmSe5dUQRSSAhpuDVME8CPxLTUOLKDPpIH8StTUDV6Gj9Aj32V4pyB7
         hUXbYov9HOCq3yRTRJegHiHEPel6bi7MvYy78Fmk4PNgStPCSNCbeQWI874/CL75Nylh
         b8mC6E7bFg+6jKx8vU6UyFAv3zFXpZ6ePXNmjV/tqGGnu0kMfhBsyo2PJWG6sUybPPoq
         1hOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584701; x=1729189501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
        b=Yio4rfCshy34Xu+Ok2MHIO0p237u4NTdXjV/Djybo7/MmnIFH4WjYX0+S+wL/i94sJ
         MffT3Oy1fERy9HWRQ5+NKb7VhN1MmPCxImaQtfGzK2U9xKnRY9gaw19auHGKnq5b9TpW
         Y8C6CR6SMEFimZX5It4ppPRuUM4BcYXnjP5saJjPoTMgXin/LXITrMF488vBu3JNNaHc
         KPnwy/3Iy3F4E6uJeg1eRW2Hvpa7qEtRHuTl/5K/Yvg8apXCgpJ/Km6yvnfckZT0hNgv
         5VXL+zKoE278+7IlKHMqBjL90tXv8y4peJKIlOAgVLQqoM/nRq5aquo7AhyKsVE7IjYK
         S+8w==
X-Forwarded-Encrypted: i=1; AJvYcCXscWoRKf/9JA4Vxsv5S80mmbrRObeZicYD6PmNjFO/4vkJm4ksRTvo2VXnTJ5/pNGIzjeKE5wAUDAc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1zhL6nKVi6cmj+6kZ3F+3XQWxXKDnBuVt2AfAY+QDGtT+hJj3
	K+l8KuZ2kaTGjNF4ybDNG/b24inpce21r+lpgUiCXbD7akAWEJKBcyTpouk4hHPfATl6u0NBhbw
	cIw==
X-Google-Smtp-Source: AGHT+IHQgMXiDY3ifHkkle2NgOnYNSR5nXtws6LnwLsJ4J6Fqip1dtdD5j5lAqBgp/4MJdCcEXFALInKEMI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:69c3:0:b0:e1a:9ed2:67f4 with SMTP id
 3f1490d57ef6-e28fe4313ffmr4949276.2.1728584700890; Thu, 10 Oct 2024 11:25:00
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:07 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-6-seanjc@google.com>
Subject: [PATCH v13 05/85] KVM: x86/mmu: Don't overwrite shadow-present MMU
 SPTEs when prefaulting
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

Treat attempts to prefetch/prefault MMU SPTEs as spurious if there's an
existing shadow-present SPTE, as overwriting a SPTE that may have been
create by a "real" fault is at best confusing, and at worst potentially
harmful.  E.g. mmu_try_to_unsync_pages() doesn't unsync when prefetching,
which creates a scenario where KVM could try to replace a Writable SPTE
with a !Writable SPTE, as sp->unsync is checked prior to acquiring
mmu_unsync_pages_lock.

Note, this applies to three of the four flavors of "prefetch" in KVM:

  - KVM_PRE_FAULT_MEMORY
  - Async #PF (host or PV)
  - Prefetching

The fourth flavor, SPTE synchronization, i.e. FNAME(sync_spte), _only_
overwrites shadow-present SPTEs when calling make_spte().  But SPTE
synchronization specifically uses mmu_spte_update(), and so naturally
avoids the @prefetch check in mmu_set_spte().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 3 +++
 arch/x86/kvm/mmu/tdp_mmu.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a9a23e058555..a8c64069aa89 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2919,6 +2919,9 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	if (is_shadow_present_pte(*sptep)) {
+		if (prefetch)
+			return RET_PF_SPURIOUS;
+
 		/*
 		 * If we overwrite a PTE page pointer with a 2MB PMD, unlink
 		 * the parent of the now unreachable PTE.
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3b996c1fdaab..3c6583468742 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1026,6 +1026,9 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 	if (WARN_ON_ONCE(sp->role.level != fault->goal_level))
 		return RET_PF_RETRY;
 
+	if (fault->prefetch && is_shadow_present_pte(iter->old_spte))
+		return RET_PF_SPURIOUS;
+
 	if (unlikely(!fault->slot))
 		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
 	else
-- 
2.47.0.rc1.288.g06298d1525-goog


