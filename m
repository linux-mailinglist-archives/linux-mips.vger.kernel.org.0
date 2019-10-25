Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F37B3E4224
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2019 05:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390056AbfJYDm3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Oct 2019 23:42:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34760 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbfJYDm3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Oct 2019 23:42:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id b128so642878pfa.1
        for <linux-mips@vger.kernel.org>; Thu, 24 Oct 2019 20:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=4u8dgDjKMpTH8ti4oxRa1RmG8a4geVpRu0Nbs2UTLNg=;
        b=db57Q8bBICz9AuRp2LNEalbw0/PngM8UoAlB7HYIFFLBN1bkQuIXyYXWplaarl9UZZ
         YUCbDLDu251bOfKv66GugnwuSFbb22xUKuuZgOqXPRIHjVdjsYZpS9o4bTntshuwgljR
         zWPThIFkUBUrw3e6ufsXbnI62CtcyO0NeXQkdI8O/RzkGb0vtWXc8u8Z5pvG2wwXsOCo
         lEAllEwE3dg1ZRPkIq2cf+Onq4uZjM3h1SRYYHm9rj+AvdtLGGtXCMWTU2qNuPXtY0OE
         dtL64ltAiOl1Md4rrskk1dv+FcKvA5Xc3VfyCoL+/TK/zVOlGgO3efd+ltP9qTYWvyNF
         QmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=4u8dgDjKMpTH8ti4oxRa1RmG8a4geVpRu0Nbs2UTLNg=;
        b=U/Xv7HjLz+cIhPp4aGyLgd482Q2RpREIu0vO7ZeAhabOfSSs6gvHtoCsvK3JRBJb4a
         EQknCz42bJgef9AdiR8R87UP2RWq8HL2KCnuiqu0ZYZvrbr7Y1OS78TNF+25Vm8x2yot
         bTk6mqeNubv5K8EXKQMu/9FA4Zl+xvvMuZ8CvCJrRDEchTIWYoshyMXc3TvHwI0V8L/y
         +YjGR87bWAxGThVkZnz30DfKrcP9F2w/4/WxaV957ZhvWtEVBper3e6TidbTgoxXYYzK
         OLLfpovBxH/6V+eXcokm/W1HIK0M5XmCvH36wkbcL5E/7VkFIamw4w5G3i1iDO2TKbJ0
         MJNQ==
X-Gm-Message-State: APjAAAWET2zVuuIjpiDk0BuWy25vLpH6F8H1BTd8gSlsFRXC+7IdEgEN
        itqZIsxUArxSKePSZPI4vPc=
X-Google-Smtp-Source: APXvYqwLplH6SySTGFO4pXVWzATJFPvdNNuyextgzDmpBL4gMI/GwZLT9RIWdiG3CM7uLJdj4Gp2Lw==
X-Received: by 2002:a17:90a:d588:: with SMTP id v8mr1221946pju.51.1571974946940;
        Thu, 24 Oct 2019 20:42:26 -0700 (PDT)
Received: from software.domain.org ([222.92.8.142])
        by smtp.gmail.com with ESMTPSA id g187sm498756pgc.12.2019.10.24.20.42.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 24 Oct 2019 20:42:26 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Loongson: Add board_ebase_setup() support
Date:   Fri, 25 Oct 2019 11:45:04 +0800
Message-Id: <1571975104-5849-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Old processors before Loongson-3A2000 have a 32bit ebase register and
have no WG bit, new processors since Loongson-3A2000 have a 64bit ebase
register and do have the WG bit. Unfortunately, Loongson processors
which have the WG bit are slightly different from MIPS R2. This makes
the generic ebase setup not suitable for every scenarios.

To make Loongson's kernel be more robust, we add a board_ebase_setup()
hook to ensure that CKSEG0 is always used for ebase. This is also useful
on platforms where BIOS doesn't initialise an appropriate ebase.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/cpu-probe.c       |  6 ++++--
 arch/mips/loongson64/common/init.c | 11 +++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 671bc6f..7312a0d 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1923,7 +1923,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		}
 
 		decode_configs(c);
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV |
+			      MIPS_CPU_LDPTE | MIPS_CPU_EBASE_WG;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
@@ -1934,7 +1935,8 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		set_elf_platform(cpu, "loongson3a");
 		set_isa(c, MIPS_CPU_ISA_M64R2);
 		decode_configs(c);
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV |
+			      MIPS_CPU_LDPTE | MIPS_CPU_EBASE_WG;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
diff --git a/arch/mips/loongson64/common/init.c b/arch/mips/loongson64/common/init.c
index 912fe61..8e2047d 100644
--- a/arch/mips/loongson64/common/init.c
+++ b/arch/mips/loongson64/common/init.c
@@ -15,6 +15,16 @@
 /* Loongson CPU address windows config space base address */
 unsigned long __maybe_unused _loongson_addrwincfg_base;
 
+static void __init mips_ebase_setup(void)
+{
+	ebase = CKSEG0;
+
+	if (cpu_has_ebase_wg)
+		write_c0_ebase(ebase | MIPS_EBASE_WG);
+
+	write_c0_ebase(ebase);
+}
+
 static void __init mips_nmi_setup(void)
 {
 	void *base;
@@ -48,6 +58,7 @@ void __init prom_init(void)
 	/*init the uart base address */
 	prom_init_uart_base();
 	register_smp_ops(&loongson3_smp_ops);
+	board_ebase_setup = mips_ebase_setup;
 	board_nmi_handler_setup = mips_nmi_setup;
 }
 
-- 
2.7.0

