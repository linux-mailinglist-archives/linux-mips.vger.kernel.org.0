Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1456A1D657F
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2020 06:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgEQEFy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 00:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgEQEFx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 May 2020 00:05:53 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911C4C061A0C;
        Sat, 16 May 2020 21:05:53 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w19so902994ply.11;
        Sat, 16 May 2020 21:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=FSkaXx9eVHyGgue3RmVAbVAqcFfFkE3/ouPrR1AomGE=;
        b=W16h9NncBi6k1ym2uh2w/50EzwQrNLd6h2jfiCcCHzdDLuz1CLBVhgFrV4uvpuWUxZ
         Vwgi09VpvUZe8VB0GSEMPhZeJ7rzundHTTYQQHZYxcje+Hy+r984SrVgVSv6v3DClOkn
         BcymmuQruxYYOHwJZl+a9D0Go3icdCVBaJm4FE5rlAeyKU9X1tDAMyIS99GPqhHyhee+
         zfCjKJ3zH04I3LMVulS+ka48q16Bkcx5Rw30W+fo+p5CksBhaCRQZp+vG8Of/vOXNf2i
         aJGLBcurhLHLYSXxsTcuW6fC5Xg02kBIHDGhp9mtHXKGXKQXwVrqTS5yXX+zTMe206jP
         F0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=FSkaXx9eVHyGgue3RmVAbVAqcFfFkE3/ouPrR1AomGE=;
        b=asaRBHqzNm7yEffNjmR4Kv5WhUuZkC83k3kdRtxgPu0i/axkJNWqiUEy2Na0jcM3o8
         abC9VN/PdKySUaauLe02TvynI2a2oMSSTWILzC8Ul41eRMADOLhQYTrcKvzfco535zDf
         SKlT2wabqme2Vyv69+z00+Idtv7Rbil7SgKZ2ojABIKa2gPsJrN7LxVQWbig8mfvG4ro
         pNPZ4B2bjL4yyomaexSS/NJznHfAvnI+juroIngWEx2eqjWf922UDAJBnVhhI9ONwNU0
         LpUjq+QpCOsScX2UJveA41ND64FI9FfkEWym4X4TXyZW3qiKCNhJH+LvssVhiYqcdyDY
         Vrmg==
X-Gm-Message-State: AOAM533L4Ry/joWIvZWYtpNKU2PfdMHcRmhMprCCrWai8Du/28orvG/G
        iFL2VHGftYy5YEG8Oek0cUxBWdWZRvXTLg==
X-Google-Smtp-Source: ABdhPJzhBqAuxnhRQ+7S8kqmsR9P4TyRodO18egZ1DKRJxHIIFozYRCm/aEzxhWFv6JTuH/pYEOjAg==
X-Received: by 2002:a17:90a:19c9:: with SMTP id 9mr12422241pjj.77.1589688353040;
        Sat, 16 May 2020 21:05:53 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id n9sm5081630pjt.29.2020.05.16.21.05.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 May 2020 21:05:52 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V6 00/15] KVM: MIPS: Add Loongson-3 support (Host Side)
Date:   Sun, 17 May 2020 12:05:57 +0800
Message-Id: <1589688372-3098-1-git-send-email-chenhc@lemote.com>
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
