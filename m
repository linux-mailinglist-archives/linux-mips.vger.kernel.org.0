Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647F71B729D
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 13:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgDXLGa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 07:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgDXLGa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Apr 2020 07:06:30 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6C7C09B045;
        Fri, 24 Apr 2020 04:06:30 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z1so2952636pfn.3;
        Fri, 24 Apr 2020 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=HSb8cTfIsUIoexVIsIcYlQ9HLgcMLPVB7mpDFIrYEi0=;
        b=XCBkhHocdvQRqaptKjiSqNbJ+4XqcZnygw1KgE/+K91vgTWkknknfAm+Ts2g3gDhVn
         ooy7oe1qYlt+wvB81zguKXEZcEmzql2JZNDxzP+8dMjhBCp59jXClgsSI6iuD/+bpqqW
         Z0hZ9HJy+Kr+LFz8DensKy4yAS55g7yUMfafEUhrAfmP0TOxmYg+fycIAFE1tSpgVlwS
         gcYoDUk+lrC+MGtGyqJ8V7nJamGJRLA0GZ+Zbq5Iytx+N++IOdYGWDTlCVACRMA/B2J1
         kPQ7vsztETHzEfCT0LxDyf8Gsx3nXE6VFA4URxkLVo2KS7ObcUljWWBTCaSRITn1YyIp
         aCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=HSb8cTfIsUIoexVIsIcYlQ9HLgcMLPVB7mpDFIrYEi0=;
        b=G7pYFnM3nh3UUmC96geFqlMskf+6YkD7mJ439VVOX76N1BPi7lKUlMbeppFbC6aXCr
         +XzqlVXM9Zr3TDMHiiRPvIat32qrAuH4IadO+q43jFhUb38zPRuaRkYmU8iQa0RLeXRZ
         ShXCfOBvvKNzE51o/jiypfRSU1rZV8RcOqakfeqW20hgWrbmjf7YpymUB51PxJy/AEEW
         xOB0xYZ+dvI2OBajl6rppC8iQKuN/bxptAiAfqktsFrlPHmOoYf8k71jCvozjN89Rj2r
         KMHPMZvoCWNBs9K3B0A09v7L6BBgn7nS+9ZANXsQXijduZQj9ndXXbgc1uK0qwB3p8GI
         mXfg==
X-Gm-Message-State: AGi0PubFl1KDMMdsNWLEP7XDHVATzy6eRtTTtXWqnMXF81QOzjxFaEFV
        4EVe8MN414QbkQbp5cKe4n8=
X-Google-Smtp-Source: APiQypILl0axEiko6pIrOWsPYgTwMFs5DyBA/xk0s8PlGWIWl7vifl6BTtilXxZwQkoIbzRjC3DGcg==
X-Received: by 2002:a63:111a:: with SMTP id g26mr8313438pgl.245.1587726389512;
        Fri, 24 Apr 2020 04:06:29 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id y10sm5470110pfb.53.2020.04.24.04.06.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2020 04:06:28 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 00/14] KVM: MIPS: Add Loongson-3 support (Host Side)
Date:   Fri, 24 Apr 2020 19:15:19 +0800
Message-Id: <1587726933-31757-1-git-send-email-chenhc@lemote.com>
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
 arch/mips/kvm/emulate.c              | 461 ++++++++++++++++++++++++++++++++++-
 arch/mips/kvm/entry.c                |  19 +-
 arch/mips/kvm/interrupt.c            |  93 +------
 arch/mips/kvm/interrupt.h            |  14 +-
 arch/mips/kvm/loongson_ipi.c         | 215 ++++++++++++++++
 arch/mips/kvm/mips.c                 |  49 +++-
 arch/mips/kvm/tlb.c                  |  41 ++++
 arch/mips/kvm/trap_emul.c            |   3 +
 arch/mips/kvm/vz.c                   | 210 +++++++++++-----
 17 files changed, 1021 insertions(+), 166 deletions(-)
 create mode 100644 arch/mips/kvm/loongson_ipi.c
--
2.7.0
