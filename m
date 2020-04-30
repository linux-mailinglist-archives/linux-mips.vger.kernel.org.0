Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2013E1BEE99
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 05:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgD3DRo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 23:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726309AbgD3DRo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 23:17:44 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010AAC035494
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 20:17:43 -0700 (PDT)
Received: from localhost.localdomain (unknown [103.125.232.133])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id B1AFE20CEF;
        Thu, 30 Apr 2020 03:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588216662; bh=TilINnJ2MMcbnY3Fs41A2Lq9IVrxTc127sCcUuEu3Qo=;
        h=From:To:Cc:Subject:Date:From;
        b=DciG8bOBYdvop4eLGAd57jpUzFxitUwn5CqTpxEo+fiE5NIGgfFjzIn4tL/ylk6Ww
         uNjR27FFD4q/LMOyIT2cJCTOEThHQ0t/BS9/DgsAHdKAfw3/Dvh9RJlUTqFuseBzv3
         9rvM4uG3RuepJUkqYglrhK1NNFN1dOqiHM6OkcBuVEHesF3IlXxVeAeT1rO8xEH1NG
         0VCSKitEsTV7GNjVJoq7N1wSMd6jilobbDlp7ZqC5zAw1N4IwayzQtXYXzfc74BX+q
         NfzEC6zKi81JcZTcgWwvah4NHWrDkhrypl7pkqN8+8BHzkVZMn88jPvaFV9gD9niWA
         r27abnOihzupQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, tsbogend@alpha.franken.de,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Loongson64: Probe CPU features via CPUCFG
Date:   Thu, 30 Apr 2020 11:13:46 +0800
Message-Id: <20200430031346.2591394-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPUCFG is a Loongson self-defined instruction used to mark CPU
features for Loongson processors started from Loongson-3A4000.

Slightly adjust cpu_probe_loongson function as well. Remove features
that already probed via decode_configs in processor's PRID case
and add a comment about TLBINV.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cpu-probe.c | 45 +++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6de14b527c68..1736c173b242 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1932,8 +1932,35 @@ static inline void cpu_probe_cavium(struct cpuinfo_mips *c, unsigned int cpu)
 	}
 }
 
+#ifdef CONFIG_CPU_LOONGSON64
+#include <loongson_regs.h>
+
+static inline void decode_cpucfg(struct cpuinfo_mips *c)
+{
+	u32 cfg1 = read_cpucfg(LOONGSON_CFG1);
+	u32 cfg2 = read_cpucfg(LOONGSON_CFG2);
+	u32 cfg3 = read_cpucfg(LOONGSON_CFG3);
+
+	if (cfg1 & LOONGSON_CFG1_MMI)
+		c->ases |= MIPS_ASE_LOONGSON_MMI;
+
+	if (cfg2 & LOONGSON_CFG2_LEXT1)
+		c->ases |= MIPS_ASE_LOONGSON_EXT;
+
+	if (cfg2 & LOONGSON_CFG2_LEXT2)
+		c->ases |= MIPS_ASE_LOONGSON_EXT2;
+
+	if (cfg2 & LOONGSON_CFG2_LSPW)
+		c->options |= MIPS_CPU_LDPTE;
+
+	if (cfg3 & LOONGSON_CFG3_LCAMP)
+		c->ases |= MIPS_ASE_LOONGSON_CAM;
+}
+
 static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 {
+	decode_configs(c);
+
 	switch (c->processor_id & PRID_IMP_MASK) {
 	case PRID_IMP_LOONGSON_64R: /* Loongson-64 Reduced */
 		switch (c->processor_id & PRID_REV_MASK) {
@@ -1947,7 +1974,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 			set_isa(c, MIPS_CPU_ISA_M64R2);
 			break;
 		}
-		decode_configs(c);
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_EXT |
 				MIPS_ASE_LOONGSON_EXT2);
@@ -1969,9 +1995,12 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 			set_isa(c, MIPS_CPU_ISA_M64R2);
 			break;
 		}
-
-		decode_configs(c);
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		/*
+		 * Loongson-3 Classic did not implement MIPS standard TLBINV
+		 * but implemented TLBINVF and EHINV. As currently we're only
+		 * using these two features, enable MIPS_CPU_TLBINV as well.
+		 */
+		c->options |= MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
@@ -1981,17 +2010,17 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		__cpu_name[cpu] = "ICT Loongson-3";
 		set_elf_platform(cpu, "loongson3a");
 		set_isa(c, MIPS_CPU_ISA_M64R2);
-		decode_configs(c);
-		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		decode_cpucfg(c);
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
-		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
-			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
 		break;
 	default:
 		panic("Unknown Loongson Processor ID!");
 		break;
 	}
 }
+#else
+static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu) { }
+#endif
 
 static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 {
-- 
2.26.0.rc2

