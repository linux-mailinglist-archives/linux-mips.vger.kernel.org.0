Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673E01C2B14
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 12:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgECKG3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 06:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727971AbgECKG3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 06:06:29 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC83EC061A0C;
        Sun,  3 May 2020 03:06:28 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f8so5595863plt.2;
        Sun, 03 May 2020 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=GG77QEUcAKOuddgrTCmvbeiQ9mXShRtLvZIFeUnKkR8=;
        b=etLE6us1LaTvyWcqblyepo0Hb2dPgI7jiUbd37dVDde3kJbiGMz1oS4h/9BXmImvul
         SgVc/LOW+YEwbpykDmjSneI8VmLmuIoLcecqZqsJDSBUVoxxV8e7PtBTdQqxqv4iOfbA
         9JGjFummyUbPCD3zboGydvR9Mscjm10Ri7qRROjSWt7a5GW9u9+6QNSIFlsW0J3ktyEQ
         CogzeGlfl/8ZiYwz0Me4ISTPXnYAeH99HnDIKdyok80LM6kXgfAbk8DkShY93esFm/0h
         ZBlkf4cdr7Pj3XGi55KLqX8bqdtTrIL74yfDyaAXY8c2icLFX/TbJMgLtREfY/1IZwqD
         l4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=GG77QEUcAKOuddgrTCmvbeiQ9mXShRtLvZIFeUnKkR8=;
        b=cG+HADntgdapCYXadsJQB/KrpX0qk98OaPsMF03bmYMr3aE/KamIW1H6WuvSilBloD
         k1DwWanKHv3g1XX0ml040q4E1aN66t9cJTAm6uNYbQc12UlZqpBiA2aGM5eyNNEkVN3J
         /c9Q6OGLLampmW/q7CsKZ38rZl+DvkMBbBW/pdTTgHYV6+9L4JdyCnNQbaldC9c59WGn
         YWJ+RZEQ3JuHRlM1T6GBzRCqU7a00Cc2PP0u/n2v5dA1wTQ4mjb48LlG13ECeceNbFpQ
         55z9tJUpCw/yPY/g7vsDbTKWr2C2DXNBx4wUFQ64IujoBVy7cGsfoPzPgAQouoYoSlEo
         uQIA==
X-Gm-Message-State: AGi0PuYbZNvLyTN9kkMpvAydpL7KoxeX2BvVAFZ+0crErGlO0Il7wcBr
        mHeDg2u3Od6YApvmVn1WLhw=
X-Google-Smtp-Source: APiQypLmG2265s7wcaePya8wVSkVaYxIxY7EeuWRRrty8pwUbY+Mh81FyfzxjBTakL8PcUEaCN0VpQ==
X-Received: by 2002:a17:90a:a893:: with SMTP id h19mr10497440pjq.138.1588500388378;
        Sun, 03 May 2020 03:06:28 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id r26sm6329902pfq.75.2020.05.03.03.06.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 May 2020 03:06:27 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     kvm@vger.kernel.org, qemu-devel@nongnu.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3 00/14] KVM: MIPS: Add Loongson-3 support (Host Side)
Date:   Sun,  3 May 2020 18:05:53 +0800
Message-Id: <1588500367-1056-1-git-send-email-chenhc@lemote.com>
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
 arch/mips/kvm/vz.c                   | 235 +++++++++++-----
 17 files changed, 1087 insertions(+), 166 deletions(-)
 create mode 100644 arch/mips/kvm/loongson_ipi.c
--
2.7.0
