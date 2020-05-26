Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9886F1D0B00
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 10:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732323AbgEMImk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 04:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgEMImk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 04:42:40 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1499CC061A0C;
        Wed, 13 May 2020 01:42:40 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n11so7474931pgl.9;
        Wed, 13 May 2020 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=fVefEu093xh7eZgov8vcbtYrPYBZHyOWLgcytUR5N6w=;
        b=BPe0yXCWZdQh00SOsRIYzYvEnqSGMWBKRRh42Sx4ThYuVO2bL3Ncpy20sIEKFeiKci
         nq2ljWW1fu7btXEDv1vJ0ojL4oBRK+3TU/JsdxQa7UlbUommg5l0wjE6F1B0Iwjt4iJe
         Lubz0EbH5qbBz/WgMef3Yjob8F9KA102D4Pmr4hetRG2jKAgXhGGTp9arGQAaKlv9iRt
         seE1+3OQjFs4KcWIVeF0c6daN0a3068XWFbfPrWXvAgLxc1hm0D4PBQWBt6WCecpFObw
         6AAbA6ujX/Zcqa4+3ccLk19kpmqrA2krGVPGL9EBt4NJYTmkVlQMiF+/syDofIas9pIc
         tuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=fVefEu093xh7eZgov8vcbtYrPYBZHyOWLgcytUR5N6w=;
        b=ImkDkvRkqg5EOl5FoBJ+nxtHWofUlef+mmXQ20KcMCHSPQac+kHd0SGExudtBVYEk6
         R7NyZIicXdekpfzXg2FA+tyeO3Zs9OVkZy9MCijxQ+nZDKOD3Yvp3kY1F5PhgIJiD6sc
         DPGSGM87HJpqthGymShVK9PR0tf5XaeZCoMWz4Ng4y7TDZMZDOSAe0YzkR98K4vi/JVy
         PM7dFm+uGiFWz+VwG3xgdzW8AQywsEWQtUTHXFHiv1Q02D+87RZ4wTr1WHhlqfuhoSy0
         gF3+JwZTeQgGjraHGM8cOmc8x+QkVsZlOcLUKydqNiGwkrOX2a+zanFEYqLVztxsE12G
         wE+Q==
X-Gm-Message-State: AGi0PuZKC3XgLx1LtU+dJV0diagSKyKhMSktQfXAnfJEIrfLF/EHYaAf
        Yw23ukYe+XPcTLFVgMrUdp4=
X-Google-Smtp-Source: APiQypJh7/gq6dGqLnTOpjc3yLkAoDsgAd3blvRoL1dAV2zBjuqp8ZGq7OTY+AF+t2C0KkPWXqgmDQ==
X-Received: by 2002:aa7:957c:: with SMTP id x28mr25165250pfq.31.1589359359627;
        Wed, 13 May 2020 01:42:39 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id o21sm14645570pjr.37.2020.05.13.01.42.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 May 2020 01:42:39 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V5 00/15] KVM: MIPS: Add Loongson-3 support (Host Side)
Date:   Wed, 13 May 2020 16:42:31 +0800
Message-Id: <1589359366-1669-1-git-send-email-chenhc@lemote.com>
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
