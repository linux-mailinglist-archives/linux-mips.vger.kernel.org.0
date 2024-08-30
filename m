Return-Path: <linux-mips+bounces-5236-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B896565A
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2024 06:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C967284FE2
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2024 04:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BA91474C3;
	Fri, 30 Aug 2024 04:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I3jTaKVv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5456E13BAF1
	for <linux-mips@vger.kernel.org>; Fri, 30 Aug 2024 04:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724992567; cv=none; b=QmJ38NL+eRFx/4Vh8iJXztjiEqw2YZV6Y4TP6kNJjL/lcZG8+8zBKWCh9ov620jKyQ0YrtIv2G+gB5OCuV38FvB3lb6ufKunm+6zwwd3zhH5GO/E7uTWIbXyXtlFh6nBXvEJAY+lelBAmomu5z36NkxlIppb175NeivCZNYl46g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724992567; c=relaxed/simple;
	bh=Led2wy/kfxWSht1BA326pNMoaxCFzvQe40FiQLSX4f0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WXlTdtmxl0FnxYazUuDd+Yn0i6g05bvGWEEyVY+s5/vxrwtKL6gSHCv2G61bh3RBEHegRTD0MAZgjcTwSFcKHUlvF1C7WGBICY6lb/ZKaCxqeJKvM0jbNX7R7ccpSykuSIH4aA9TLvUT4cNwwIw/0f8EEd5IkOU1JILJeOxUAvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I3jTaKVv; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e164ceba5ffso2476810276.3
        for <linux-mips@vger.kernel.org>; Thu, 29 Aug 2024 21:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992564; x=1725597364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RRTA1H5OtG+8qgMxGB5BU8t5Dbb6+roBouJjwlrdgk=;
        b=I3jTaKVvSwE/KtQ7Gjb5BfgeW74AbMZXdMd50OELHdNaXPqphorlBhHngKTTsDt8kH
         mfT7xURAbwQC0l4fGw/gBCnRqED/xIkkY+cFhV1sfEPn/xxNO5znQc7dcXU8yit2lNcw
         F4Wf1Zb4Lr9ICRtn+7IvQB8RbjFu2dgl2iFE3C62GJiWT/Oi+zKaPFyaJMWy1i+ZtDo5
         An/HH50oUxq9frz0zjzWRsEsGICBIf2SzJ6oSHcVM/jYu7pNVhAnvEtMn47bPwOq7iNB
         voFePML9lE8wAZxLZe+oUMFH4BoSm3AsSxs6+os+3R8rTCZui2Y+dRUAZgDge/16vrSy
         V6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992564; x=1725597364;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RRTA1H5OtG+8qgMxGB5BU8t5Dbb6+roBouJjwlrdgk=;
        b=pvxVZDsorcCZSzoql7SVkmx2/etrS2La56+nab9uIXlmhUHuRX12+v//K2suFGMa0y
         WlwRb3N48e6K1Efr3ENSRtmKW97ncwDtslVnKgPSFXMMXBdSz32an0buRIMzCtq1Ec2x
         08Om+zELhtp7qj9G011dtOBp39qRJYvpEasK1cR9rThRdJFwkoOxUA8v4aFIJUr2PlJx
         +uPLlid4huf6vFOiwqZDJhGe6Z1JJciZTUXGH4rY6qH3UHXR4/BucBUrY0odRqcHLqLm
         gMVesaq2jFonOW4AXoKecgEp5644wu5YBGgqtiS5RHyoopgeknctNhM69Sr8vvFEN1bv
         CLNA==
X-Forwarded-Encrypted: i=1; AJvYcCWTSEQryNMxk4RAfBEzG2ytz0qNuTBr+5oInxHnvnPJ+EgV1QLjAy5/0WT4n4kTR5891zcQ7bye4TPR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5J3ImIIq2hD8Ad3oWyD4luXqdATg7YRsdfQNP7nCmithad1yx
	OTjSY36CE9wGF2fjEbwxHGCsV000LrH/db+nCiAiKHOB8ZZJYsBiEO4LnhSTaVF/9+n46tPrtdg
	5IQ==
X-Google-Smtp-Source: AGHT+IG+hqynsJ7hdgdKV9gAtkROKS2qGVXayEmYSbfKtO5Jo9FgRfejcOxvLz+XMdzoh9wRJFEwtKQxRPs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:278a:0:b0:e0b:a712:2ceb with SMTP id
 3f1490d57ef6-e1a79ff35c5mr30969276.5.1724992564279; Thu, 29 Aug 2024 21:36:04
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 Aug 2024 21:35:50 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-1-seanjc@google.com>
Subject: [PATCH v4 00/10] KVM: Register cpuhp/syscore callbacks when enabling virt
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"

Register KVM's cpuhp and syscore callbacks when enabling virtualization in
hardware, as the sole purpose of said callbacks is to disable and re-enable
virtualization as needed.

The primary motivation for this series is to simplify dealing with enabling
virtualization for Intel's TDX, which needs to enable virtualization
when kvm-intel.ko is loaded, i.e. long before the first VM is created.

That said, this is a nice cleanup on its own.  By registering the callbacks
on-demand, the callbacks themselves don't need to check kvm_usage_count,
because their very existence implies a non-zero count.

Patch 1 (re)adds a dedicated lock for kvm_usage_count.  Hopefully it's a
temporary lock, as we can likely fix the cpus_read_lock() vs. kvm_lock mess
for good by switching vm_list to an (S)RCU-protected list.

v4:
 - Collect more reviews.
 - Fix documentation for kvm_usage_lock. [Kai]
 - Add a blurb in locking.rst to call out that cpus_read_lock() vs kvm_lock is
   a general problem.
 - Add a paragraph in the locking patch to suggest switching vm_list to an
   (S)RCU-protected list, so that walkers don't need to take kvm_lock.
 - Add an example call chain for the other cpus_read_lock() vs kvm_lock issues
   that are lurking.
 - Enable the module param by default from the get-go. [Paolo]
 - Rename even more APIs/symbols (all of 'em I could find). [Paolo]
 - Clarify that it's the 0=>1 VM creation that's problematic, not simply the
   creation of the very first VM. [Paolo]
 - Document enable_virt_at_load, and call out the (dis)advantages of enabling
   virtualization when KVM is loaded.
 - Drop the WARN on kvm_usage_count being elevated at the end of
   kvm_uninit_virtualization(), as it's annoyingly difficult to keep the WARN
   and still allow arch code (i.e. TDX) to enable virtualization during setup.

v3:
 - https://lore.kernel.org/all/20240608000639.3295768-1-seanjc@google.com
 - Collect reviews/acks.
 - Switch to kvm_usage_lock in a dedicated patch, Cc'd for stable@. [Chao]
 - Enable virt at load by default. [Chao]
 - Add comments to document how kvm_arch_{en,dis}able_virtualization() fit
   into the overall flow. [Kai]

v2:
 - https://lore.kernel.org/all/20240522022827.1690416-1-seanjc@google.com
 - Use a dedicated mutex to avoid lock inversion issues between kvm_lock and
   the cpuhp lock.
 - Register emergency disable callbacks on-demand. [Kai]
 - Drop an unintended s/junk/ign rename. [Kai]
 - Decrement kvm_usage_count on failure. [Chao]

v1: https://lore.kernel.org/all/20240425233951.3344485-1-seanjc@google.com

Sean Christopherson (10):
  KVM: Use dedicated mutex to protect kvm_usage_count to avoid deadlock
  KVM: Register cpuhp and syscore callbacks when enabling hardware
  KVM: Rename symbols related to enabling virtualization hardware
  KVM: Rename arch hooks related to per-CPU virtualization enabling
  KVM: MIPS: Rename virtualization {en,dis}abling APIs to match common
    KVM
  KVM: x86: Rename virtualization {en,dis}abling APIs to match common
    KVM
  KVM: Add a module param to allow enabling virtualization when KVM is
    loaded
  KVM: Add arch hooks for enabling/disabling virtualization
  x86/reboot: Unconditionally define cpu_emergency_virt_cb typedef
  KVM: x86: Register "emergency disable" callbacks when virt is enabled

 .../admin-guide/kernel-parameters.txt         |  17 ++
 Documentation/virt/kvm/locking.rst            |  31 +-
 arch/arm64/kvm/arm.c                          |   6 +-
 arch/loongarch/kvm/main.c                     |   4 +-
 arch/mips/include/asm/kvm_host.h              |   4 +-
 arch/mips/kvm/mips.c                          |   8 +-
 arch/mips/kvm/vz.c                            |   8 +-
 arch/riscv/kvm/main.c                         |   4 +-
 arch/x86/include/asm/kvm-x86-ops.h            |   4 +-
 arch/x86/include/asm/kvm_host.h               |   7 +-
 arch/x86/include/asm/reboot.h                 |   2 +-
 arch/x86/kvm/svm/svm.c                        |  19 +-
 arch/x86/kvm/vmx/main.c                       |   6 +-
 arch/x86/kvm/vmx/vmx.c                        |  10 +-
 arch/x86/kvm/vmx/x86_ops.h                    |   5 +-
 arch/x86/kvm/x86.c                            |  26 +-
 include/linux/kvm_host.h                      |  18 +-
 virt/kvm/kvm_main.c                           | 270 +++++++++---------
 18 files changed, 251 insertions(+), 198 deletions(-)


base-commit: 15e1c3d65975524c5c792fcd59f7d89f00402261
-- 
2.46.0.469.g59c65b2a67-goog


