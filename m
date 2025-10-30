Return-Path: <linux-mips+bounces-11951-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195ADC22312
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 175E04659E3
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44893329E62;
	Thu, 30 Oct 2025 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2FBLlUZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A08329E54
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 20:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855052; cv=none; b=cWRwv1xO8JpGYu81xfGYiLtgHu69QglgWz7wK/ESxG0D+PxLPo1WZk0Ykr7JQncwrQUi1P2vuS3Hi+978HX0fQ+tVjbPg6g9V8hmrFpX19/Hgi3kgs48iA0TIVio+qe7D56YU2KBeKlLjsM38vu5ImLuYAN9SspPurfKYwIe96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855052; c=relaxed/simple;
	bh=gvzcFRbzaqGBcuZ+f2VoTMDHPgCQZ6omIrzB4Q9yffU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rgKF5ucuNgal39BbVND8j95oRvUrkE6l1VteuEhj1wQLIYlxAj+GY5j9GmXApGqjO4YoHnShMwT9BUL57Xu9XsoqrbHi3glSpH0kPXf/3PY1zkEdmGhtxLJ3VhCFlaEdc6NNAjNVaSmcnbOfkCq6/kaBYlPgR2z8eFDU3sRjMUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2FBLlUZ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2930e6e2c03so14673275ad.3
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855050; x=1762459850; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JvdyzKJX9NuDfCF42GsCtwlMI06iCRR0AAdHR5FNyUo=;
        b=u2FBLlUZ+lwWe5HPcLxb3qjhYcUbALd6FK9vUvldg72EsVY7TAA5jr3WbKkhEsA9V3
         2FrshuFmwwFimtFhlJ/aY3a45IXz+WEZUA0pr9zk2Opy0OlGfZDY/DcGuvAHWZChuoQ5
         ztQGdkcxJZdoUNcisE2kM8ppJflGHPHZjKxuTmDF9KZRXpVwh/u4Mxq9xQj0blmEF7Xv
         rHYXyaX/+dx+EEMPOaa+6kJsNwwLpzgGDNb2C8b4YtIj1hNHC0NiSHrdDFSsbT2dMnrP
         vQTwlcjmEhn2U95+0w5Au4crPHiPzoov9EukihpvbVzEd/AWpYkyiiNd98p7unvXKeLy
         01yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855050; x=1762459850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvdyzKJX9NuDfCF42GsCtwlMI06iCRR0AAdHR5FNyUo=;
        b=bUF2VibxiXfXhatJ8at2anR2D+K/ScWPH0UmBpmp3Wi0tGPnP7v2wTVL82r2t5n8SK
         VBkAaZ/ZNu6fwJDJNqeD/Hjkt5wpxEqGg28n5BcivbzOaSG7GNBsATkj0hfAFZrqrBIY
         VV2WDLqJFsy2yS4SC65r42VZyhSHfzwfSMq3E2FG9gtZ0W75JpNmXRja2xXmlJS2xWtG
         H/+ousp2C917WomhkC/KbMCSc7JK5erntdUuZSUNRZvndQXsUziX7Q2tMHaFxsadTJNP
         QTWszhvoPccr3oj/6XQ7r0Ewzh8Syv7N+mptL2/jmayAbX2V30pCGoWpAmBLA7tV0O1q
         ObiA==
X-Forwarded-Encrypted: i=1; AJvYcCUw1qby2CFKjgXPz3rLKFfB+zIHTeGiSk95nmRlmRwB9zOG/za0WoGxZrpnAvRE+qTHnoVPtJaFm1cq@vger.kernel.org
X-Gm-Message-State: AOJu0YyUpdGuITcL3XHBWbgUjDyVW1tHo31AdS2WVqu3JRaFKRQG/HYW
	bGIUI/Ihnq0AU1CI2k3BhADCGLyG0f/X5Xdp/JKL5qGzU7M03WDEviWTAV3/OLScep3ajVFJYyN
	uffIzuQ==
X-Google-Smtp-Source: AGHT+IHEVTdCFV7pO4/z6pVQDy8N1YwVBneIfEZO+ruu2Aqfbau+04/y/mG+hlEqHWjdepdrmBSAOEyDdTs=
X-Received: from plge18.prod.google.com ([2002:a17:902:cf52:b0:290:d7ff:80f8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:38c8:b0:294:fda6:4723
 with SMTP id d9443c01a7336-2951a6007f3mr12024995ad.60.1761855049987; Thu, 30
 Oct 2025 13:10:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:43 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-21-seanjc@google.com>
Subject: [PATCH v4 20/28] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
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

Unconditionally assert that mmu_lock is held for write when removing S-EPT
entries, not just when removing S-EPT entries triggers certain conditions,
e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
Conditionally asserting implies that it's safe to hold mmu_lock for read
when those paths aren't hit, which is simply not true, as KVM doesn't
support removing S-EPT entries under read-lock.

Only two paths lead to remove_external_spte(), and both paths asserts that
mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
handle_removed_pt() via KVM_BUG_ON()).

Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
that wait_for_sept_zap is guarded by holding mmu_lock for write, and keep
the conditional assert in tdx_track() as well, but with a comment to help
explain why holding mmu_lock for write matters (above and beyond why
tdx_sept_remove_private_spte()'s requirements).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 63d4609cc3bc..999b519494e9 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1715,6 +1715,11 @@ static void tdx_track(struct kvm *kvm)
 	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
 		return;
 
+	/*
+	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
+	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
+	 * tracking epoch hasn't completed.
+	 */
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	err = tdh_mem_track(&kvm_tdx->td);
@@ -1762,6 +1767,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * HKID is released after all private pages have been removed, and set
 	 * before any might be populated. Warn if zapping is attempted when
-- 
2.51.1.930.gacf6e81ea2-goog


