Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23AAD1A6381
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 09:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729196AbgDMHVw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 03:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbgDMHVw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 03:21:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51518C008651;
        Mon, 13 Apr 2020 00:21:51 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v23so4168394pfm.1;
        Mon, 13 Apr 2020 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=t2sALsyCMMNQl+/8FmLCPuHasRrqoSojD5dypqshy1s=;
        b=k6qWBGXUMQGdG4L801yUD0CBa9KUZWJQCLwsgGPYl/I2VJjZ4q+nrmBR9MLWNt1Gjd
         1TiOACf0dKTBjQqemktNCtQ0HdOLjV0nbkeTWg7IDclXU8YvNE2UQazw14m6AGOUROyR
         RpXuV5GJz3e6PeImUS0fjZ5XTORTAzUqKUUAsvFY6JYby8LTKcdlASVGp91STYo1v8ct
         YLGaHQfy0JJx1n35AIKm3McnOH5Tyb2Q4r+qP+Vu5utdX2QOwPy1qOjZtqEVCIqkZUja
         Z8/b8qu/BwnvUeNTxUGrhOtbhZHcLPPKvPWgaaIFfLtZdxpQyA272eP4fSG4dK9cx04y
         DE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=t2sALsyCMMNQl+/8FmLCPuHasRrqoSojD5dypqshy1s=;
        b=BooxOsO3Q3cTl3W+sp55V96DH5yYwno1X2oK/R0ndBAY28aCqC45UqgyLoPmjzxRQp
         vEixBnFzzAEL2X/ZuOxBjqzRCVIBDkHDm+SWXgLdMYIztu2wYXR5sTf93wGj+XPOleb9
         GA8C/smHuQoddJyohJdDKd1YV9K7vNYyXkcI0n3PGT6sdqBC5KrUFWo9s4aUFslOippW
         VoeuoSXHlFpGUkT7knej8yS0aoBNvSwd2IvwAuRnssVM9pV8crefq2nVy2NxtzsWOP7e
         /XiDVg3a/S0rqRhfpL6DWnGPF85tQHNFAJIt6gsY+mhU6PNqCRYOz59u+2DQPgWONCuZ
         yuGg==
X-Gm-Message-State: AGi0PuZmO7gJVVzblMWy+m5i1sRsZvUcD6bNvFMomabizsqYhjuxL9af
        eBQH9NYjLa2rbjEfvnLoozhTGUKVtDc=
X-Google-Smtp-Source: APiQypLOMSAvZAOVmdTh3/xVhGIylyDIoCT43TP1W6oweKMcx07p6DU4u4BAs3R3Egz33M4rokbdUQ==
X-Received: by 2002:a63:c20:: with SMTP id b32mr164314pgl.75.1586762510767;
        Mon, 13 Apr 2020 00:21:50 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id u8sm7241341pgl.19.2020.04.13.00.21.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Apr 2020 00:21:50 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     kvm@vger.kernel.org, qemu-devel@nongnu.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 0/15] KVM: MIPS: Add Loongson-3 support (Host Side)
Date:   Mon, 13 Apr 2020 15:30:09 +0800
Message-Id: <1586763024-12197-1-git-send-email-chenhc@lemote.com>
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

Mike Rapoport(1):
 mips: define pud_index() regardless of page table folding

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
 arch/mips/include/asm/kvm_host.h     |  50 +++-
 arch/mips/include/asm/mipsregs.h     |   7 +
 arch/mips/include/asm/pgtable-64.h   |   4 +-
 arch/mips/include/uapi/asm/inst.h    |  11 +
 arch/mips/kernel/cpu-probe.c         |   2 +
 arch/mips/kvm/Kconfig                |   1 +
 arch/mips/kvm/Makefile               |   5 +-
 arch/mips/kvm/emulate.c              | 461 ++++++++++++++++++++++++++++++++++-
 arch/mips/kvm/entry.c                |  19 +-
 arch/mips/kvm/interrupt.c            |  93 +------
 arch/mips/kvm/interrupt.h            |  14 +-
 arch/mips/kvm/loongson_ipi.c         | 215 ++++++++++++++++
 arch/mips/kvm/mips.c                 |  49 +++-
 arch/mips/kvm/tlb.c                  |  39 +++
 arch/mips/kvm/trap_emul.c            |   3 +
 arch/mips/kvm/vz.c                   | 204 +++++++++++-----
 18 files changed, 1013 insertions(+), 168 deletions(-)
 create mode 100644 arch/mips/kvm/loongson_ipi.c
--
2.7.0
