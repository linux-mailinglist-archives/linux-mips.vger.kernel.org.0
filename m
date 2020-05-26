Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588951CF267
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 12:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbgELKbH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 06:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729349AbgELKbG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 May 2020 06:31:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CD5C061A0C;
        Tue, 12 May 2020 03:31:06 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u5so3349949pgn.5;
        Tue, 12 May 2020 03:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=mtUuXVwQma+6PI2bLTE3Br0qYTSiabzt8TWgTvym4EQ=;
        b=dgYPNXV5UokCHcJq6XaABDR4pZUQrYEeEqvN9qCio2jrP/JX9nlUHh3A6M7lCC3Hyv
         ZyWahPiqWwvCtOku8qlItu6+Z7RxOPadIft2qe1XXdf4axLQZz/niGARDls4Djw7gvfS
         eIVP8iApQPR52TzW5X23DGyCQ4mwO9IdAMC3wuaGEFUWa6DhFtI6KeKggcOFYBkBEaIn
         rVXyEuNY+x2ZvZfbpLuMglsBlrHBR8LIF+X5k/JfTE6o0/WCHlmJDSmdnm+kJlv0ORJp
         oQuRdOASDEEnUezV86h+Mep4cy1aeWZqtWeptlW1/ihd6tHYWYm5K6Ha55OODA9ewlyQ
         LE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=mtUuXVwQma+6PI2bLTE3Br0qYTSiabzt8TWgTvym4EQ=;
        b=hbq1YjPQAVKBy0W4TipVUNNjadmaSiDkBtkNd4kKwQRZPxszb/59XlEKbi/3IYRz6N
         Y4xqA23agLhs4I5Te4wTdxX0YsTdsr+QMvvwxOjiy7PF1smSfcLsauP2aisj2hBCeNEF
         IYVEWFlOJAvzc07Aw+YGUJ/RWCvjhadKq6L1JFmGm4k06r56nVtfQBR3WpWaixLZ94F/
         Y/6njZo8dafl/GIUZ28HDcnF+ddJPgjAlWI7R+e5e+Zz4JtGiuDi2rT7MWnjIslFmzva
         7lvIpufz5I53OQyDzedwGUZ5kRASyDsTP3XAdieFBloiEVgoNpY4rFelXuY14pdjtWrz
         Mpbg==
X-Gm-Message-State: AGi0Pua5iazvfMbv18ghkpUkf7yWb465nUoHWV1ek3fM7ZED5f+q2iYV
        XVNrw8K6/RNzt3QbuozbFs4=
X-Google-Smtp-Source: APiQypJ3DPnseVksq94ieBdLBq2qbkjcwRw4e+44mQCPzGPkEx2OG/PAIC/MA9Y4x/8tvMR+aXshfA==
X-Received: by 2002:a63:ed50:: with SMTP id m16mr19919796pgk.271.1589279466330;
        Tue, 12 May 2020 03:31:06 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id q11sm11617094pfl.97.2020.05.12.03.31.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 03:31:05 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V4 00/14] KVM: MIPS: Add Loongson-3 support (Host Side)
Date:   Tue, 12 May 2020 18:31:06 +0800
Message-Id: <1589279480-27722-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We are preparing to add KVM support for Loongson-3. VZ extension is
fully supported in Loongson-3A R4+, and we will not care about old CPUs
(at least now). We already have a full functional Linux kernel (based
on Linux-5.4.x LTS) and QEMU (based on 5.0.0-rc2) and their git
repositories are here:

QEMU: https://github.com/chenhuacai/qemu
Kernel: https://github.com/chenhuacai/linux

Of course these two repositories need to be rework and not suitable for
upstream (especially the commits need to be splitted). We show them here
is just to tell others what we have done, and how KVM/Loongson will look
like.

Our plan is make the KVM host side be upstream first, and after that,
we will make the KVM guest side and QEMU emulator be upstream.

V1 -> V2:
1, Remove "mips: define pud_index() regardless of page table folding"
   because it has been applied.
2, Make Loongson-specific code be guarded by CONFIG_CPU_LOONGSON64.

V2 -> V3:
1, Emulate a reduced feature list of CPUCFG.
2, Fix all possible checkpatch.pl errors and warnings.

V3 -> V4:
1, Emulate LOONGSON_CFG0/LOONGSON_CFG3 in CPUCFG correctly.
2, Update commit messages to explain Loongson-3 Virtual IPI.
3, Add Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>.

Xing Li(2):
 KVM: MIPS: Define KVM_ENTRYHI_ASID to cpu_asid_mask(&boot_cpu_data)
 KVM: MIPS: Fix VPN2_MASK definition for variable cpu_vmbits

Huacai Chen(12):
 KVM: MIPS: Increase KVM_MAX_VCPUS and KVM_USER_MEM_SLOTS to 16
 KVM: MIPS: Add EVENTFD support which is needed by VHOST
 KVM: MIPS: Use lddir/ldpte instructions to lookup gpa_mm.pgd
 KVM: MIPS: Introduce and use cpu_guest_has_ldpte
 KVM: MIPS: Use root tlb to control guest's CCA for Loongson-3
 KVM: MIPS: Let indexed cacheops cause guest exit on Loongson-3
 KVM: MIPS: Add more types of virtual interrupts
 KVM: MIPS: Add Loongson-3 Virtual IPI interrupt support
 KVM: MIPS: Add CPUCFG emulation for Loongson-3
 KVM: MIPS: Add CONFIG6 and DIAG registers emulation
 KVM: MIPS: Add more MMIO load/store instructions emulation
 KVM: MIPS: Enable KVM support for Loongson-3

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/Kconfig                    |   1 +
 arch/mips/include/asm/cpu-features.h |   3 +
 arch/mips/include/asm/kvm_host.h     |  52 +++-
 arch/mips/include/asm/mipsregs.h     |   7 +
 arch/mips/include/uapi/asm/inst.h    |  11 +
 arch/mips/kernel/cpu-probe.c         |   2 +
 arch/mips/kvm/Kconfig                |   1 +
 arch/mips/kvm/Makefile               |   5 +-
 arch/mips/kvm/emulate.c              | 503 ++++++++++++++++++++++++++++++++++-
 arch/mips/kvm/entry.c                |  19 +-
 arch/mips/kvm/interrupt.c            |  93 +------
 arch/mips/kvm/interrupt.h            |  14 +-
 arch/mips/kvm/loongson_ipi.c         | 214 +++++++++++++++
 arch/mips/kvm/mips.c                 |  49 +++-
 arch/mips/kvm/tlb.c                  |  41 +++
 arch/mips/kvm/trap_emul.c            |   3 +
 arch/mips/kvm/vz.c                   | 237 ++++++++++++-----
 17 files changed, 1089 insertions(+), 166 deletions(-)
 create mode 100644 arch/mips/kvm/loongson_ipi.c
--
2.7.0
