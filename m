Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27961DF5C5
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 09:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387498AbgEWH4N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 03:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387489AbgEWH4M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 May 2020 03:56:12 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F563C061A0E;
        Sat, 23 May 2020 00:56:12 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id s69so5990639pjb.4;
        Sat, 23 May 2020 00:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=0roxkuOLFvs3XP03ejCnMAL4pHcaibNzZ6qxSZTCf50=;
        b=Vm6wmNZhRPhoZj/g4YSCwqAu+CkLu9VAT6W42wFWfxUlc08KDk92Olkt07olfA3ebz
         g15IEJ4ZND1gCfLwQJvPLNRyCtMENFE9dhlenekK2rt46kwFdcCntSUgoENKhvl3xegq
         2fkL4ZiPfIu1m0G/k4eG8IPHHK4flVq6wGdIOvJxyqJHyE/OCpBQmDyDLm07kWa3Z0Fr
         7Yyndozzh6qlM2mVSnq+DhMmmoXEucv4T/1adIOq3kwbzFL0vQKmcUs2phPOmY6ofq9+
         Cfzcg8p46XGsLsnr7jW8KkW+gZrKeTWsuHt59I19LWuoTyGAzayGmhicBRWAcAk76Ufc
         rWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=0roxkuOLFvs3XP03ejCnMAL4pHcaibNzZ6qxSZTCf50=;
        b=cJ5jmvXkPb/XhKiZFKGBCIymMEW6E6cfHZMseel/OM23zkb9ZXPk7GpPnGNd/wKWmf
         xhuowmg11sMs6J9R9Eof8B32J0Yh4doVmOlYxnCiiuZ/tMtbJOukCGH4xMf3nq5j6AE8
         CKkOYsfcTsPbN5r4PLshQF0xojV3b0/hJ3dZP+GiIwWnc9xiTvM9k5yy61CcYJzUCKkP
         +qfbTRtVy4SMo2bJ0YwP+cB1Mz7j8ADcvwX8LeLrYv2f5Oj0cBoM6QHlj4JPZO4b0TTd
         eweCehGC9tf0zliSN48ubCIMdU8JCkdXuBU4Y+y+6bKcFOnC5TRGKfqnizEbInjjN9qI
         RLGA==
X-Gm-Message-State: AOAM531/UN84l+FLrTBvOpLEcYY+rdwx3F6B0uUXvpuJfNe4ZOmWrnSZ
        dRE5Z7xNF1K/E8tFhtYfJ+I=
X-Google-Smtp-Source: ABdhPJwMuVAm7C30eqGSsS7Ge/poym48K0RP9Fev40gIcsMb6RcotlD8ywWnyMIxlfqanCHHGqxTTQ==
X-Received: by 2002:a17:902:6b07:: with SMTP id o7mr17968039plk.74.1590220571413;
        Sat, 23 May 2020 00:56:11 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id w7sm678491pfu.117.2020.05.23.00.56.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 May 2020 00:56:10 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V7 00/15] KVM: MIPS: Add Loongson-3 support (Host Side)
Date:   Sat, 23 May 2020 15:56:27 +0800
Message-Id: <1590220602-3547-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We are preparing to add KVM support for Loongson-3. VZ extension is
fully supported in Loongson-3A R4+, and we will not care about old CPUs
(at least now). We already have a full functional Linux kernel (based
on Linux-5.4.x LTS) and QEMU (based on 5.0.0) and their git repositories
are here:

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

V4 -> V5:
1, Fix a typo.
2, Update MAINTAINERS.

V5 -> V6:
1, Fix a mismatch during rebasing.
2, Add Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>.

V6 -> V7:
1, Rebase on latest mips-next (Config6 feature bits definition updated).

Xing Li(2):
 KVM: MIPS: Define KVM_ENTRYHI_ASID to cpu_asid_mask(&boot_cpu_data)
 KVM: MIPS: Fix VPN2_MASK definition for variable cpu_vmbits

Huacai Chen(13):
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
 MAINTAINERS: Update KVM/MIPS maintainers

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 MAINTAINERS                          |   4 +-
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
 18 files changed, 1092 insertions(+), 167 deletions(-)
 create mode 100644 arch/mips/kvm/loongson_ipi.c
--
2.7.0
