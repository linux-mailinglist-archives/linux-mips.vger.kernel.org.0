Return-Path: <linux-mips+bounces-9217-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B09AD4738
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46D6E7AAC49
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 00:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1C4290F;
	Wed, 11 Jun 2025 00:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oR3xB8Mr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404B184E
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 00:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600647; cv=none; b=Bbua5owtf/jQ++/NombxHu8WddBMj+wdBSoICSfAor5eF2lE/eufPS/OR1vLTIAK0iErcIrhIe4q3iMqLliMkvsKFq4T/gvc0233GH3P+tk9TGJYWBecuNs9F0l/jahDa6fIZsUGxCXPQPwWxaqArPnGmTxqUeC1XIIpmoM4bjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600647; c=relaxed/simple;
	bh=JQfMhNtkMh4Eskn6e+JLGabT20zk6Rt1P/kcDLiyXww=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=W5dl8JC1gBUCIYOQKCr1AhIiqP+V6pWbS0UnHf34fD/yLl0qitVMbmwCmchhqPKv8vhK0Yc5tzKYDCYME6dQ7dciXFQE8FV7hmgN+jiITTlajJ3m8dMd8w+C9fSprNSoWL3JU7qa9IzXM+n/nbv8pQL0LRoUHmOH7ssRsRcOXDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oR3xB8Mr; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so5482395a91.1
        for <linux-mips@vger.kernel.org>; Tue, 10 Jun 2025 17:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600645; x=1750205445; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeHmPmMyMKJKT4alX9Roe+NB+CyhbaLAdm3PrWL3iJM=;
        b=oR3xB8MrGIkLYNwtuC5Ffx4GgoJtgKHh8FxOESplBsDzWl708CBAzN1anMKLx2F3nf
         XcdqZOPLPyw+jLsofgCA09loqhCWqjZ874qXH1rfX4e3EY+NstuBzcHAtzOHk7mot6zC
         BpWUwhI2gJ6pY9ZVwj3RNn+UGDCpdQ79F8Cqe4Ys+CalwlJHP05jD9ToueHyZi+/+53B
         5voMkqVERZugFxX7EQokQkMuC0ncj50AnopASPUq+snZLBkfOpe81kUVpq2UobKNwP+p
         +mH89+K0CEI3YxxEXV4scpoHvZc4uHARrrafq9njfJRREH+6oP7a1hJabSyU/tlNDDHA
         mAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600645; x=1750205445;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeHmPmMyMKJKT4alX9Roe+NB+CyhbaLAdm3PrWL3iJM=;
        b=Eopd4JQBLp3BaXhuOBE9CDykcrcJzEFC2j75oYeFmOVevvbRlx3SDVLXr0w6iCZswi
         eFQao+OKiuDZNQ/dBsgMfdQPjZTDNP2h3TQsPEGH3VNWJmnPSSV1yXpyuMphfOSMYHxf
         tyZwahDf2OB7DLcs9AvRW6tKne4MjTGRKPjvop141jnF5hVh5CysHWtiDRLFOv1WEjGC
         xHcVAxXrA9QzwDDeB5PJCupTQthpUovmPnZWrEnjWNlUEDuAGqhLm0xARwwksyFPSyc/
         kHlFsC+oY517K9yDrJhPl3yaNcQVzcBEIRsaCWpijWHpRD3dUcy4e7irQoHkUZKNXkqJ
         8wpA==
X-Forwarded-Encrypted: i=1; AJvYcCX1prv3SbVt1GJyQflIXLyRgw7Whm8eTDz2pLS4ZidsOWEZkQNt+dybAa5VkCLy6Fkatu7UJs2lk1P7@vger.kernel.org
X-Gm-Message-State: AOJu0YyWEdFnjAEM+eYzP68aRuoUZGmVOu7OLIzt7YqhN1iyTl6ncy6E
	YRd2Ib+5S70xSbSACGXFBvTDRVN1lzoW4pNxfp2HvZ3SAwmJhCrC0eamajDGfJhuuhCLq5sf26r
	Vmkj7ow==
X-Google-Smtp-Source: AGHT+IF8oABFbuTKJ9GcUMp/LE7xUGa2l9YHKCqeYYF9+w27QVhniGaieMvIcJ7joDnc4dA30O9QnXDBack=
X-Received: from pjz3.prod.google.com ([2002:a17:90b:56c3:b0:312:e914:4548])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec4:b0:311:9c9a:58d7
 with SMTP id 98e67ed59e1d1-313b1fbe6admr808960a91.19.1749600645461; Tue, 10
 Jun 2025 17:10:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:34 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-1-seanjc@google.com>
Subject: [PATCH 0/8] KVM: Remove include/kvm, standardize includes
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
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Kill off include/kvm (through file moves/renames), and standardize the set of
KVM includes across all architectures.

This conflicts with Colton's partioned PMU series[1], but this should work as
a nice prepatory cleanup for the partitioned PMU work (and hopefully can land
sooner).

Note, these patches were originally posted as part of a much larger and more
agressive RFC[1].  We've effectively abandoned upstreaming the multi-KVM idea,
but I'm trying to (slowly) upstream the bits and pieces that I think/hope are
generally beneficial.

[1] https://lore.kernel.org/all/20250602192702.2125115-1-coltonlewis@google.com
[2] https://lore.kernel.org/all/20230916003118.2540661-1-seanjc@google.com

Anish Ghulati (1):
  KVM: arm64: Move arm_{psci,hypercalls}.h to an internal KVM path

Sean Christopherson (7):
  KVM: arm64: Include KVM headers to get forward declarations
  KVM: arm64: Move ARM specific headers in include/kvm to arch directory
  KVM: Move include/kvm/iodev.h to include/linux as kvm_iodev.h
  KVM: MIPS: Stop adding virt/kvm to the arch include path
  KVM: PPC: Stop adding virt/kvm to the arch include path
  KVM: s390: Stop adding virt/kvm to the arch include path
  KVM: Standardize include paths across all architectures

 MAINTAINERS                                                | 1 -
 .../arm64/include/asm/kvm_arch_timer.h                     | 2 ++
 arch/arm64/include/asm/kvm_host.h                          | 7 +++----
 include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h  | 2 ++
 .../kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h    | 2 +-
 arch/arm64/kvm/Makefile                                    | 2 --
 arch/arm64/kvm/arch_timer.c                                | 5 ++---
 arch/arm64/kvm/arm.c                                       | 6 +++---
 {include => arch/arm64}/kvm/arm_hypercalls.h               | 0
 {include => arch/arm64}/kvm/arm_psci.h                     | 0
 arch/arm64/kvm/guest.c                                     | 2 +-
 arch/arm64/kvm/handle_exit.c                               | 2 +-
 arch/arm64/kvm/hyp/Makefile                                | 6 +++---
 arch/arm64/kvm/hyp/include/hyp/switch.h                    | 4 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c                           | 4 ++--
 arch/arm64/kvm/hyp/vhe/switch.c                            | 4 ++--
 arch/arm64/kvm/hypercalls.c                                | 4 ++--
 arch/arm64/kvm/pmu-emul.c                                  | 4 ++--
 arch/arm64/kvm/psci.c                                      | 4 ++--
 arch/arm64/kvm/pvtime.c                                    | 2 +-
 arch/arm64/kvm/reset.c                                     | 3 +--
 arch/arm64/kvm/trace_arm.h                                 | 2 +-
 arch/arm64/kvm/trng.c                                      | 2 +-
 arch/arm64/kvm/vgic/vgic-debug.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-init.c                            | 2 +-
 arch/arm64/kvm/vgic/vgic-irqfd.c                           | 2 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c                      | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c                         | 4 ++--
 arch/arm64/kvm/vgic/vgic-mmio-v3.c                         | 4 ++--
 arch/arm64/kvm/vgic/vgic-mmio.c                            | 6 +++---
 arch/arm64/kvm/vgic/vgic-v2.c                              | 2 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c                       | 3 +--
 arch/arm64/kvm/vgic/vgic-v3.c                              | 2 +-
 arch/loongarch/include/asm/kvm_eiointc.h                   | 2 +-
 arch/loongarch/include/asm/kvm_ipi.h                       | 2 +-
 arch/loongarch/include/asm/kvm_pch_pic.h                   | 2 +-
 arch/mips/include/asm/kvm_host.h                           | 3 +--
 arch/mips/kvm/Makefile                                     | 2 --
 arch/powerpc/kvm/Makefile                                  | 2 --
 arch/powerpc/kvm/mpic.c                                    | 2 +-
 arch/riscv/kvm/Makefile                                    | 2 --
 arch/riscv/kvm/aia_aplic.c                                 | 2 +-
 arch/riscv/kvm/aia_imsic.c                                 | 2 +-
 arch/s390/kvm/Makefile                                     | 2 --
 arch/x86/kvm/Makefile                                      | 1 -
 arch/x86/kvm/i8254.h                                       | 2 +-
 arch/x86/kvm/ioapic.h                                      | 2 +-
 arch/x86/kvm/irq.h                                         | 2 +-
 arch/x86/kvm/lapic.h                                       | 2 +-
 include/{kvm/iodev.h => linux/kvm_iodev.h}                 | 0
 virt/kvm/Makefile.kvm                                      | 2 ++
 virt/kvm/coalesced_mmio.c                                  | 3 +--
 virt/kvm/eventfd.c                                         | 2 +-
 virt/kvm/kvm_main.c                                        | 3 +--
 54 files changed, 64 insertions(+), 77 deletions(-)
 rename include/kvm/arm_arch_timer.h => arch/arm64/include/asm/kvm_arch_timer.h (98%)
 rename include/kvm/arm_pmu.h => arch/arm64/include/asm/kvm_pmu.h (99%)
 rename include/kvm/arm_vgic.h => arch/arm64/include/asm/kvm_vgic.h (99%)
 rename {include => arch/arm64}/kvm/arm_hypercalls.h (100%)
 rename {include => arch/arm64}/kvm/arm_psci.h (100%)
 rename include/{kvm/iodev.h => linux/kvm_iodev.h} (100%)


base-commit: 61374cc145f4a56377eaf87c7409a97ec7a34041
-- 
2.50.0.rc0.642.g800a2b2222-goog


