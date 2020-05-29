Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32C91E845E
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 19:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgE2RKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 13:10:54 -0400
Received: from [115.28.160.31] ([115.28.160.31]:54478 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725913AbgE2RKx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 13:10:53 -0400
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B325B60132;
        Sat, 30 May 2020 01:10:49 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590772249; bh=SFwsm5V2vjGTxpQPopgE02hxFi4zsWkuNGZ40msNDFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lhmxEk+uGVZ1K7T6KNEOV1b4ZgAE9p6Gvx6Sd1kyLjO/CQQe6A4yMJOWCIY/ouM8Q
         9bgoCpYO4mBV4dTEvv6Y6MRAYB6JLY2Yqn0S7llcnaQS2tDQ/EHbX071ZOi8X84XE6
         HRrMpnbQA1WLFkSrr5GbjIOZQqbC8Bc6NdKL13Jg=
From:   WANG Xuerui <git@xen0n.name>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: Loongson64: Guard against future cores without CPUCFG
Date:   Sat, 30 May 2020 01:09:59 +0800
Message-Id: <20200529171000.8905-2-git@xen0n.name>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529171000.8905-1-git@xen0n.name>
References: <20200529171000.8905-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Previously it was thought that all future Loongson cores would come with
native CPUCFG. From new information shared by Huacai this is definitely
not true (maybe some future 2K cores, for example), so collisions at
PRID_REV level are inevitable. The CPU model matching needs to take
PRID_IMP into consideration.

The emulation logic needs to be disabled for those future cores as well,
as we cannot possibly encode their non-discoverable features right now.

Reported-by: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 .../include/asm/mach-loongson64/cpucfg-emul.h | 11 ++++++
 arch/mips/kernel/traps.c                      |  4 ++
 arch/mips/loongson64/cpucfg-emul.c            | 37 ++++++++++---------
 3 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h b/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
index 01dc308df7b2..d64af19c210d 100644
--- a/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
+++ b/arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
@@ -12,6 +12,12 @@
 
 void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c);
 
+static inline bool loongson3_cpucfg_emulation_enabled(struct cpuinfo_mips *c)
+{
+	/* All supported cores have non-zero LOONGSON_CFG1 data. */
+	return c->loongson3_cpucfg_data[0] != 0;
+}
+
 static inline u32 loongson3_cpucfg_read_synthesized(struct cpuinfo_mips *c,
 	__u64 sel)
 {
@@ -53,6 +59,11 @@ static inline void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 {
 }
 
+static inline bool loongson3_cpucfg_emulation_enabled(struct cpuinfo_mips *c)
+{
+	return false;
+}
+
 static inline u32 loongson3_cpucfg_read_synthesized(struct cpuinfo_mips *c,
 	__u64 sel)
 {
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 2d5b16daf331..caff4c921461 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -720,6 +720,10 @@ static int simulate_loongson3_cpucfg(struct pt_regs *regs,
 		int rs = (opcode & RS) >> 21;
 		__u64 sel = regs->regs[rs];
 
+		/* Do not emulate on unsupported core models. */
+		if (!loongson3_cpucfg_emulation_enabled(&current_cpu_data))
+			return -1;
+
 		perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS, 1, regs, 0);
 
 		regs->regs[rd] = loongson3_cpucfg_read_synthesized(
diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
index fdd52b21c1df..c16023a13379 100644
--- a/arch/mips/loongson64/cpucfg-emul.c
+++ b/arch/mips/loongson64/cpucfg-emul.c
@@ -134,13 +134,9 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 	c->loongson3_cpucfg_data[1] = 0;
 	c->loongson3_cpucfg_data[2] = 0;
 
-	/* Add CPUCFG features non-discoverable otherwise.
-	 *
-	 * All Loongson processors covered by CPUCFG emulation have distinct
-	 * PRID_REV, so take advantage of this.
-	 */
-	switch (c->processor_id & PRID_REV_MASK) {
-	case PRID_REV_LOONGSON3A_R1:
+	/* Add CPUCFG features non-discoverable otherwise. */
+	switch (c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) {
+	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R1:
 		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
 			LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
 			LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
@@ -153,8 +149,8 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 			LOONGSON_CFG3_LCAMVW_REV1);
 		break;
 
-	case PRID_REV_LOONGSON3B_R1:
-	case PRID_REV_LOONGSON3B_R2:
+	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R1:
+	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3B_R2:
 		c->loongson3_cpucfg_data[0] |= (LOONGSON_CFG1_LSLDR0 |
 			LOONGSON_CFG1_LSSYNCI | LOONGSON_CFG1_LSUCA |
 			LOONGSON_CFG1_LLSYNC | LOONGSON_CFG1_TGTSYNC);
@@ -167,10 +163,10 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 			LOONGSON_CFG3_LCAMVW_REV1);
 		break;
 
-	case PRID_REV_LOONGSON2K_R1_0:
-	case PRID_REV_LOONGSON2K_R1_1:
-	case PRID_REV_LOONGSON2K_R1_2:
-	case PRID_REV_LOONGSON2K_R1_3:
+	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_0:
+	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_1:
+	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_2:
+	case PRID_IMP_LOONGSON_64R | PRID_REV_LOONGSON2K_R1_3:
 		decode_loongson_config6(c);
 		probe_uca(c);
 
@@ -183,10 +179,10 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 		c->loongson3_cpucfg_data[2] = 0;
 		break;
 
-	case PRID_REV_LOONGSON3A_R2_0:
-	case PRID_REV_LOONGSON3A_R2_1:
-	case PRID_REV_LOONGSON3A_R3_0:
-	case PRID_REV_LOONGSON3A_R3_1:
+	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0:
+	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_1:
+	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_0:
+	case PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R3_1:
 		decode_loongson_config6(c);
 		probe_uca(c);
 
@@ -203,6 +199,13 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
 			LOONGSON_CFG3_LCAMKW_REV1 |
 			LOONGSON_CFG3_LCAMVW_REV1);
 		break;
+
+	default:
+		/* It is possible that some future Loongson cores still do
+		 * not have CPUCFG, so do not emulate anything for these
+		 * cores.
+		 */
+		return;
 	}
 
 	/* This feature is set by firmware, but all known Loongson-64 systems
-- 
2.26.2

