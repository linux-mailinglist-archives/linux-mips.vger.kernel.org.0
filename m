Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D269A1CF25D
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 12:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgELKaA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 06:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbgELKaA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 May 2020 06:30:00 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8B7C061A0C;
        Tue, 12 May 2020 03:29:59 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t40so9163095pjb.3;
        Tue, 12 May 2020 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=mtUuXVwQma+6PI2bLTE3Br0qYTSiabzt8TWgTvym4EQ=;
        b=NHgvoVjEo8SsVplbPh8TTFnE09GZ0iJB9NtjF7ZDELCcKpjzEuUeseGnw5PRE1S9OV
         zeOFV+YRNkVbpHn6QzUNEXNz/We0xq9FFJgBwNTbRTeN5qU03md0dHdlirPTlJHPLxfO
         Pwo62Gn4GRKlmDVDw6tiB4xGT58hIuqpfVYm9bWieoBhJ1LpvHryXTX2/+veHN4SBKa2
         QBZWKTyxeXASl+Zwb0HbV8IZ9OIbdoUSg/GQY1h3gNGx+cy/2Z7ZSIQ2drnjJK53EL/g
         mtXbSm7Fw0RLQjTIQPikUzrqfY2jSLeyNTMac09Dr+f8FMTpmGyadMVDLNzoyGZg23OR
         xQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=mtUuXVwQma+6PI2bLTE3Br0qYTSiabzt8TWgTvym4EQ=;
        b=NQtBoWeemImgd/iFNMII7e5bITliaqN3YLEVUZevAx6BewYB8t09HwtVU5fVMDFTt7
         +fDt7YjsBxwVHczvAPMRLT6D2UKtytB8qvPKvWHtGT2WNvjEfY9hzxc7UmpRZn51ruZP
         eYUknb+BkbFD+PHO2Jsap4MBuQKWS113fGWtPv3mHjWEJDkj1ml0LBIqlOSms0lKbJVR
         wbvBipY1CJO3zur64aGP5GGeWQc+4NkqKGwE110KjFaLzRUyuiyrb9MwlxqjeDqz6C9W
         6qsuIGLYvj5EHBZlxby0TrjgqzSSwBzSAJwUGXAoN+iIkHKYA4Bc2qsoBcTLBjLoFPsk
         K5Pg==
X-Gm-Message-State: AGi0PuZjlc6Y7MLQ5wJXz11eG5dUIAMyEEcCagiVsOrkLavxr/ATIsvf
        lVYposYyiJoc6tPRc2dPFRU=
X-Google-Smtp-Source: APiQypLz17pbTJ74ITq/0VOlVlPZ0mdiDP1MRZugjfxVbtqtOWQKvDG2DwRbR4bdzYATsWb0mBarEg==
X-Received: by 2002:a17:90a:8c3:: with SMTP id 3mr27932241pjn.147.1589279399438;
        Tue, 12 May 2020 03:29:59 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id z6sm11485660pfb.87.2020.05.12.03.29.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 03:29:58 -0700 (PDT)
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
Date:   Tue, 12 May 2020 18:29:57 +0800
Message-Id: <1589279411-27643-1-git-send-email-chenhc@lemote.com>
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
