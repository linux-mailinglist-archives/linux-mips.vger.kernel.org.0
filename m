Return-Path: <linux-mips+bounces-11936-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F5C22263
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9FE54EFA66
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 20:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB8E375744;
	Thu, 30 Oct 2025 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gz7K7LCI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45EB37DBF3
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855013; cv=none; b=sBJ0WZHWftacl5guwDLVHQI/XjN7ujYl9AW/ienApMrViyaRbv5C0dp/47fYEEvd2kexnhWTO5AQmhLHHajVz8+bVo45hfXH18Qy8gP/WodrMFxEEyyi7s868NENPyB+d5F5rc/SaRJukjBzb/zCQoMQ9f0FoJNF6vvkBvvIV8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855013; c=relaxed/simple;
	bh=Q2c6cNYSKoGYP4CYOI8nHGq0kI85fWBL8NZOIPZmdhU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yi45Y8xIi9qRx2JdAv/6HuyR0jYs/iEYFOTfs3FeYXp6QbV3tTfFbi7h1qcpXQSOpLvrVrTIm3w3U1Ro4bJJaAd5pQEzX8AXai1fwif1K/9qzHdA5T2FlREjk4M4X2PtslUM74eg4s21ffQAUpX2IHXmkAnle8/XCO6i5s6AWxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gz7K7LCI; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-340299fd99dso1342752a91.0
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855011; x=1762459811; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=gz7K7LCIaED4skeuMQNZUqP4NIJ3bX8PQX7dV1566hqiO8b+/xoA1fJs2faKHA5s6K
         UYNXrO8Du5eb91L7nSf/+bG0YCwXt3xfDAJGZG7rIg9tfnKBGSY+3wmDO/YTfoHgGo+8
         WZINsmqtOq8GGvfVvCf4pRALkAuA7NHbuyDsQReEVv0gW2aeKgp1xiULY3W/CSx3mnN5
         u3CShr1dkTerZL99tpypYYiKfQa/P0Xqo88tSHukNKBoMXDk2Q+goD6i4ldmD0x0ly1r
         JxiSsW92L1xw+KJjE+ukd+MSLBIBfjIFTYzt2zielD2sUYUA1fLnHn+JPcrP0TSZZDJ5
         kQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855011; x=1762459811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=XAk1g/YkLx+6dH0FS460G96M6UxFUNTXgEccJuBwnaLq3yXTlBZ1UjcKm3JTJnrJDv
         nXpLaGiUgW36LsZkGHnxKc/G/iCDWC8KqxmEX1SOS0H/rrGHHMi1SU7+8Po1ROh0NZ3s
         UYeUX0NvRQSJ1YG+ZOvdWg5HFgBe/NQo5zxXy+WmvIAH/wptRVmCPbDUxyFaIjQMWK/C
         4ojgplu3w9ml5H+gRUVEyjpUn5qorZnYaxDhf+9AKc80m1J2po67FkqSIaOs4sGq/bOD
         NL9FvFiFRFUOshcDKuzI0bSqABX5l6P1znN8n6lN5KmjoM2eAcY5mksVttGvk5JyKtb3
         DiNg==
X-Forwarded-Encrypted: i=1; AJvYcCV9VQ3+2I8t5XdHu6n4imLNPcd4AKkTgFFDzCTjxrVpBBcLQKShg/m+31nAIY/k12azW/5+dWtq3Xap@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGK3kuwtEWVox/TjbfmpYOUI3IbnWRT8eVjWwf2keXOr8QmBy
	MAvvlOMhBYitdiNYFwadok3NHuYbJ6J5zWyf6sNFUI3udBfmLGyhRdqSLygfs0DBP3rEicc+AV5
	hKOqYLg==
X-Google-Smtp-Source: AGHT+IHqKKH3jALoT7jRe2OHIQ2mXXV+pELYiJKGwKEjf4ZIM+twJ+5jG3TjV8eGRlfpIUNYgujs+bg0n4E=
X-Received: from pjji4.prod.google.com ([2002:a17:90a:6504:b0:33b:dccb:b328])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8d:b0:33f:ebc2:63a
 with SMTP id 98e67ed59e1d1-34082fc2cb0mr1192488a91.14.1761855011296; Thu, 30
 Oct 2025 13:10:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:28 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-6-seanjc@google.com>
Subject: [PATCH v4 05/28] KVM: x86/mmu: WARN if KVM attempts to map into an
 invalid TDP MMU root
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

When mapping into the TDP MMU, WARN (if KVM_PROVE_MMU=y) if the root is
invalid, e.g. if KVM is attempting to insert a mapping without checking if
the information and MMU context is fresh.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c5734ca5c17d..440fd8f80397 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	struct kvm_mmu_page *sp;
 	int ret = RET_PF_RETRY;
 
+	KVM_MMU_WARN_ON(!root || root->role.invalid);
+
 	kvm_mmu_hugepage_adjust(vcpu, fault);
 
 	trace_kvm_mmu_spte_requested(fault);
-- 
2.51.1.930.gacf6e81ea2-goog


