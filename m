Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AE22888A3
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 14:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733093AbgJIM0y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 08:26:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:36476 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731594AbgJIM0x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Oct 2020 08:26:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9B408AC12;
        Fri,  9 Oct 2020 12:26:51 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: cpu-probe: remove MIPS_CPU_BP_GHIST option bit
Date:   Fri,  9 Oct 2020 14:26:48 +0200
Message-Id: <20201009122649.85490-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS_CPU_BP_GHIST is only set two times and more or less immediately
used in cpu-probe.c itself. Remove this option to make room in options
word.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/cpu-features.h                      |  3 ---
 arch/mips/include/asm/cpu.h                               |  1 -
 arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h |  1 -
 arch/mips/kernel/cpu-probe.c                              | 10 ++++------
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 78cf7e300f12..f2e216eef7da 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -171,9 +171,6 @@
 #ifndef cpu_has_llsc
 #define cpu_has_llsc		__isa_ge_or_opt(1, MIPS_CPU_LLSC)
 #endif
-#ifndef cpu_has_bp_ghist
-#define cpu_has_bp_ghist	__opt(MIPS_CPU_BP_GHIST)
-#endif
 #ifndef kernel_uses_llsc
 #define kernel_uses_llsc	cpu_has_llsc
 #endif
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 388a82f28a87..c9222cc2244f 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -398,7 +398,6 @@ enum cpu_type_enum {
 #define MIPS_CPU_RW_LLB		BIT_ULL(32)	/* LLADDR/LLB writes are allowed */
 #define MIPS_CPU_LPA		BIT_ULL(33)	/* CPU supports Large Physical Addressing */
 #define MIPS_CPU_CDMM		BIT_ULL(34)	/* CPU has Common Device Memory Map */
-#define MIPS_CPU_BP_GHIST	BIT_ULL(35)	/* R12K+ Branch Prediction Global History */
 #define MIPS_CPU_SP		BIT_ULL(36)	/* Small (1KB) page support */
 #define MIPS_CPU_FTLB		BIT_ULL(37)	/* CPU has Fixed-page-size TLB */
 #define MIPS_CPU_NAN_LEGACY	BIT_ULL(38)	/* Legacy NaN implemented */
diff --git a/arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h b/arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h
index ecfbb5aeada3..e6e527224a15 100644
--- a/arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h
@@ -39,7 +39,6 @@
 #define cpu_has_guestctl2		0
 #define cpu_has_guestid			0
 #define cpu_has_drg			0
-#define cpu_has_bp_ghist		0
 #define cpu_has_mips16			0
 #define cpu_has_mips16e2		0
 #define cpu_has_mdmx			0
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b8e073772bdb..e6853697a056 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1278,8 +1278,9 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		c->options = MIPS_CPU_TLB | MIPS_CPU_4K_CACHE | MIPS_CPU_4KEX |
 			     MIPS_CPU_FPU | MIPS_CPU_32FPR |
 			     MIPS_CPU_COUNTER | MIPS_CPU_WATCH |
-			     MIPS_CPU_LLSC | MIPS_CPU_BP_GHIST;
+			     MIPS_CPU_LLSC;
 		c->tlbsize = 64;
+		write_c0_r10k_diag(read_c0_r10k_diag() | R10K_DIAG_E_GHIST);
 		break;
 	case PRID_IMP_R14000:
 		if (((c->processor_id >> 4) & 0x0f) > 2) {
@@ -1293,8 +1294,9 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		c->options = MIPS_CPU_TLB | MIPS_CPU_4K_CACHE | MIPS_CPU_4KEX |
 			     MIPS_CPU_FPU | MIPS_CPU_32FPR |
 			     MIPS_CPU_COUNTER | MIPS_CPU_WATCH |
-			     MIPS_CPU_LLSC | MIPS_CPU_BP_GHIST;
+			     MIPS_CPU_LLSC;
 		c->tlbsize = 64;
+		write_c0_r10k_diag(read_c0_r10k_diag() | R10K_DIAG_E_GHIST);
 		break;
 	case PRID_IMP_LOONGSON_64C:  /* Loongson-2/3 */
 		switch (c->processor_id & PRID_REV_MASK) {
@@ -2054,10 +2056,6 @@ void cpu_probe(void)
 	else
 		cpu_set_nofpu_opts(c);
 
-	if (cpu_has_bp_ghist)
-		write_c0_r10k_diag(read_c0_r10k_diag() |
-				   R10K_DIAG_E_GHIST);
-
 	if (cpu_has_mips_r2_r6) {
 		c->srsets = ((read_c0_srsctl() >> 26) & 0x0f) + 1;
 		/* R2 has Performance Counter Interrupt indicator */
-- 
2.16.4

