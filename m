Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 383B916D91
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2019 00:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfEGWoW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 18:44:22 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58408 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfEGWoW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 18:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1557269059; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=XkYB2fIsYCVpqJPYD/hs1Z623+V9R6rxjDpxF/F1jcg=;
        b=cEcFD9pkWzstZRHmrq54CnZ2s4Ga+hFPHpnDEmPcZ9SdqDO1p2CfO1F/uQye8oIbTaQf4T
        oRH/15OfSRn4uGsk9rL5zPLMp20pvhXlt9jm/vSNJxIrc9SMSPXy73w+mU2sntItBSoOXs
        IU3easc2q6ByIoqrGn0xwEqtG3NV6pg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] MIPS: Rename JZRISC to XBURST
Date:   Wed,  8 May 2019 00:43:56 +0200
Message-Id: <20190507224357.23778-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The real name of the CPU present in the JZ line of SoCs from Ingenic is
XBurst, not JZRISC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/include/asm/cpu-type.h | 2 +-
 arch/mips/include/asm/cpu.h      | 4 ++--
 arch/mips/kernel/cpu-probe.c     | 8 ++++----
 arch/mips/kernel/idle.c          | 2 +-
 arch/mips/mm/sc-mips.c           | 2 +-
 arch/mips/mm/tlbex.c             | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index a45af3de075d..518659694112 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -38,7 +38,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 #if defined(CONFIG_SYS_HAS_CPU_MIPS32_R1) || \
     defined(CONFIG_SYS_HAS_CPU_MIPS32_R2)
 	case CPU_4KEC:
-	case CPU_JZRISC:
+	case CPU_XBURST:
 #endif
 
 #ifdef CONFIG_SYS_HAS_CPU_MIPS32_R2
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 6ad7d3cabd91..4905ce6a72a5 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -181,7 +181,7 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
-#define PRID_IMP_JZRISC	       0x0200
+#define PRID_IMP_XBURST	       0x0200
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_NETLOGIC
@@ -313,7 +313,7 @@ enum cpu_type_enum {
 	 */
 	CPU_4KC, CPU_4KEC, CPU_4KSC, CPU_24K, CPU_34K, CPU_1004K, CPU_74K,
 	CPU_ALCHEMY, CPU_PR4450, CPU_BMIPS32, CPU_BMIPS3300, CPU_BMIPS4350,
-	CPU_BMIPS4380, CPU_BMIPS5000, CPU_JZRISC, CPU_LOONGSON1, CPU_M14KC,
+	CPU_BMIPS4380, CPU_BMIPS5000, CPU_XBURST, CPU_LOONGSON1, CPU_M14KC,
 	CPU_M14KEC, CPU_INTERAPTIV, CPU_P5600, CPU_PROAPTIV, CPU_1074K,
 	CPU_M5150, CPU_I6400, CPU_P6600, CPU_M6250,
 
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index d5e335e6846a..fdb73c1b0cd7 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1960,14 +1960,14 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 {
 	decode_configs(c);
-	/* JZRISC does not implement the CP0 counter. */
+	/* XBurst does not implement the CP0 counter. */
 	c->options &= ~MIPS_CPU_COUNTER;
 	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
 	switch (c->processor_id & PRID_IMP_MASK) {
-	case PRID_IMP_JZRISC:
-		c->cputype = CPU_JZRISC;
+	case PRID_IMP_XBURST:
+		c->cputype = CPU_XBURST;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
-		__cpu_name[cpu] = "Ingenic JZRISC";
+		__cpu_name[cpu] = "Ingenic XBurst";
 		break;
 	default:
 		panic("Unknown Ingenic Processor ID!");
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 695f55477503..99b8e06f8a4b 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -177,7 +177,7 @@ void __init check_wait(void)
 	case CPU_CAVIUM_OCTEON_PLUS:
 	case CPU_CAVIUM_OCTEON2:
 	case CPU_CAVIUM_OCTEON3:
-	case CPU_JZRISC:
+	case CPU_XBURST:
 	case CPU_LOONGSON1:
 	case CPU_XLR:
 	case CPU_XLP:
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 394673991bab..9385ddbd6e47 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -225,7 +225,7 @@ static inline int __init mips_sc_probe(void)
 	 * According to config2 it would be 5-ways, but that is contradicted
 	 * by all documentation.
 	 */
-	if (current_cpu_type() == CPU_JZRISC &&
+	if (current_cpu_type() == CPU_XBURST &&
 				mips_machtype == MACH_INGENIC_JZ4770)
 		c->scache.ways = 4;
 
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 65b6e85447b1..5d07a5f45ffb 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -609,7 +609,7 @@ void build_tlb_write_entry(u32 **p, struct uasm_label **l,
 		tlbw(p);
 		break;
 
-	case CPU_JZRISC:
+	case CPU_XBURST:
 		tlbw(p);
 		uasm_i_nop(p);
 		break;
-- 
2.21.0.593.g511ec345e18

