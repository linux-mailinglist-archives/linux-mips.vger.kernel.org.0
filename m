Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06AB2A3D54
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 08:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgKCHM1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 02:12:27 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37312 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727960AbgKCHMT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 02:12:19 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79PGAqFfIKEEAA--.12977S8;
        Tue, 03 Nov 2020 15:12:14 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 6/6] MIPS: Loongson64: Move decode_cpucfg() to loongson_regs.h
Date:   Tue,  3 Nov 2020 15:12:05 +0800
Message-Id: <1604387525-23400-7-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx79PGAqFfIKEEAA--.12977S8
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWfWF45Cw47WrW7Ar1xGrg_yoW5ZF4kpr
        n7Zay3Kr4IkFyI9a4DJr4qgr4rAr9xCrs3ZFWfXw45ZasxJ3W5X3s7urykAr12yryIqa4x
        uFZakrWayFsruw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_JrI_JrylYx0Ec7CjxVAajcxG14v26r1j6r4UMcIj6I8E87Iv67AKxVW8
        JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5c
        I20VAGYxC7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
        JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
        kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x0JUasjbUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since decode_cpucfg() is only used for Loongson64, just move
it to loongson_regs.h to avoid the pollution of common code
with #ifdef CONFIG_CPU_LOONGSON64.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: No changes
v3: No changes

 .../include/asm/mach-loongson64/loongson_regs.h    | 24 +++++++++++++++++
 arch/mips/kernel/cpu-probe.c                       | 31 +---------------------
 2 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
index 1659935..2d469d6 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
@@ -129,6 +129,30 @@ static inline u32 read_cpucfg(u32 reg)
 #define LOONGSON_CFG7_GCCAEQRP	BIT(0)
 #define LOONGSON_CFG7_UCAWINP	BIT(1)
 
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
+	if (cfg2 & LOONGSON_CFG2_LSPW) {
+		c->options |= MIPS_CPU_LDPTE;
+		c->guest.options |= MIPS_CPU_LDPTE;
+	}
+
+	if (cfg3 & LOONGSON_CFG3_LCAMP)
+		c->ases |= MIPS_ASE_LOONGSON_CAM;
+}
+
 static inline bool cpu_has_csr(void)
 {
 	if (cpu_has_cfg())
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e685369..1fa2c8b 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -31,6 +31,7 @@
 #include "fpu-probe.h"
 
 #include <asm/mach-loongson64/cpucfg-emul.h>
+#include <asm/mach-loongson64/loongson_regs.h>
 
 /* Hardware capabilities */
 unsigned int elf_hwcap __read_mostly;
@@ -1692,33 +1693,6 @@ static inline void cpu_probe_cavium(struct cpuinfo_mips *c, unsigned int cpu)
 	}
 }
 
-#ifdef CONFIG_CPU_LOONGSON64
-#include <loongson_regs.h>
-
-static inline void decode_cpucfg(struct cpuinfo_mips *c)
-{
-	u32 cfg1 = read_cpucfg(LOONGSON_CFG1);
-	u32 cfg2 = read_cpucfg(LOONGSON_CFG2);
-	u32 cfg3 = read_cpucfg(LOONGSON_CFG3);
-
-	if (cfg1 & LOONGSON_CFG1_MMI)
-		c->ases |= MIPS_ASE_LOONGSON_MMI;
-
-	if (cfg2 & LOONGSON_CFG2_LEXT1)
-		c->ases |= MIPS_ASE_LOONGSON_EXT;
-
-	if (cfg2 & LOONGSON_CFG2_LEXT2)
-		c->ases |= MIPS_ASE_LOONGSON_EXT2;
-
-	if (cfg2 & LOONGSON_CFG2_LSPW) {
-		c->options |= MIPS_CPU_LDPTE;
-		c->guest.options |= MIPS_CPU_LDPTE;
-	}
-
-	if (cfg3 & LOONGSON_CFG3_LCAMP)
-		c->ases |= MIPS_ASE_LOONGSON_CAM;
-}
-
 static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 {
 	decode_configs(c);
@@ -1787,9 +1761,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		break;
 	}
 }
-#else
-static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu) { }
-#endif
 
 static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 {
-- 
2.1.0

