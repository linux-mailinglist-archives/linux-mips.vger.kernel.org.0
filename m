Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14961DFE75
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2020 13:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgEXLNE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 May 2020 07:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgEXLNE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 May 2020 07:13:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA65C061A0E;
        Sun, 24 May 2020 04:13:04 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so7398501pgg.2;
        Sun, 24 May 2020 04:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=6JVPME15jy+nKPfBhI/94FaRU3kjn60XCwElBMMyFRE=;
        b=nOb/ilfKdhBgklaw+T/86YaKXF3F57QFlNdRh6n/ShTNUUPnVo8oUFyPm/CtKJQWGB
         Se2wzy653hxL5sv8bgv82aXIPM6QnPr5+FWhyPfvNlg1itpXquAaLCJb9AHD2+928Ni2
         Jj9BkxwNZBG+WY8kNavxUSAl1u+CpUG4zh7r6h8938YhIsA+KgkgRhM5STCzWB/mddzA
         O7tL/G65SBxORoAgh0DYWj4rOT6hdKv7NAbjw51ql3V1GPTwp7GeJzoYPTtUYRhZU19/
         CO35KA/0fR3qwRvGRlqVYiFtANAUixtzQgHkjt4deoFD9VGpBjHK1EPYDfSwq5uP12+M
         979Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=6JVPME15jy+nKPfBhI/94FaRU3kjn60XCwElBMMyFRE=;
        b=MrlB6ojiD7Y8lksv1gTfjs1I08PwxXImT8vVGCuxOWSXujsil1a3md3Vjz4GmfFU+X
         iyzz2G1ky0yy/8kGAVawlmUg4bUrOsdZoYC0Br6gkOUgrKV0E2LiTJM+vTWptsmy+B3Q
         1+fZnEtzs6ioOK37RXMdADu/45sDHHMxLqFBosxoRXiicsUVMqsal5QhMD1is7rw4k+p
         +CRSdiuFwgVNBMcV9A+Q7jzyWe1v9A4XgGN/RJCJGyOcdA3syqcYNBEF/Pidh9tCmrm2
         KD/4ZcYKP5wNNF4+10ejaYZBAm0WpK+DPy4XN0Xz55qWVaATd43hLfhdPw8pqXybUEdE
         ge4g==
X-Gm-Message-State: AOAM53396HmI7oshbLQO+FKkaoAFAfd1SZwS9ZjWY8GuiG+YNTAI1wNQ
        c0AR41orYNGJe5BlJB1/A9A/+smDX6ZTVA==
X-Google-Smtp-Source: ABdhPJy4WrvVxme+lqy0Xe8m6OMEqey700wUzpnpIaUyq3SygBzrf6N4UbYufEuNtiJo9IL68UiLaw==
X-Received: by 2002:a62:5ac2:: with SMTP id o185mr12236710pfb.148.1590318783614;
        Sun, 24 May 2020 04:13:03 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id 192sm1971719pfu.202.2020.05.24.04.13.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 May 2020 04:13:03 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V8 00/15] KVM: MIPS: Add Loongson-3 support (Host Side)
Date:   Sun, 24 May 2020 19:13:24 +0800
Message-Id: <1590318819-24520-1-git-send-email-chenhc@lemote.com>
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

V7 -> V8:
1, Rebase to be applied on kvm tree, i.e., the linux-next branch of
   https://git.kernel.org/pub/scm/virt/kvm/kvm.git/. Building KVM/MIPS
   need commit 3fbfb4585bfd4ff34e ("mips: define pud_index() regardless
   of page table folding"), which has already been in mips tree but not
   in kvm tree.

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
 arch/mips/include/uapi/asm/inst.h    |  37 +++
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
 18 files changed, 1118 insertions(+), 167 deletions(-)
 create mode 100644 arch/mips/kvm/loongson_ipi.c
--
2.7.0
