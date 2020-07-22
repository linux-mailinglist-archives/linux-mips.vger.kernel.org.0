Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22F5228F9A
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jul 2020 07:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGVFV6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jul 2020 01:21:58 -0400
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:51815 "EHLO
        out28-121.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgGVFV5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jul 2020 01:21:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436803|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0309937-0.00197279-0.967034;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03305;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.I5hMDsk_1595395304;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I5hMDsk_1595395304)
          by smtp.aliyun-inc.com(10.147.41.143);
          Wed, 22 Jul 2020 13:21:51 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     tsbogend@alpha.franken.de, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        paulburton@kernel.org, jiaxun.yang@flygoat.com,
        Sergey.Semin@baikalelectronics.ru, chenhc@lemote.com,
        Alexey.Malahov@baikalelectronics.ru, huanglllzu@gmail.com,
        prasannatsmkumar@gmail.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 1/1] MIPS: X2000: Add X2000 system type.
Date:   Wed, 22 Jul 2020 13:21:19 +0800
Message-Id: <20200722052119.60129-2-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200722052119.60129-1-zhouyanjie@wanyeetech.com>
References: <20200722052119.60129-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add "PRID_COMP_INGENIC_13" and "PRID_IMP_XBURST2" for X2000.
2.Add X2000 system type for cat /proc/cpuinfo to give out X2000.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 arch/mips/include/asm/bootinfo.h |  1 +
 arch/mips/include/asm/cpu.h      |  6 ++++--
 arch/mips/jz4740/setup.c         |  4 ++++
 arch/mips/kernel/cpu-probe.c     | 11 +++++++++++
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 26f267d5649f..147c9327ce04 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -80,6 +80,7 @@ enum ingenic_machine_type {
 	MACH_INGENIC_JZ4780,
 	MACH_INGENIC_X1000,
 	MACH_INGENIC_X1830,
+	MACH_INGENIC_X2000,
 };
 
 extern char *system_type;
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 104a509312b3..f5b04e8f6061 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -46,6 +46,7 @@
 #define PRID_COMP_NETLOGIC	0x0c0000
 #define PRID_COMP_CAVIUM	0x0d0000
 #define PRID_COMP_LOONGSON	0x140000
+#define PRID_COMP_INGENIC_13	0x130000	/* X2000 */
 #define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4740, JZ4750, X1830 */
 #define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
 #define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
@@ -185,8 +186,9 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
-#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst with MXU SIMD ISA		*/
-#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst with MXU2 SIMD ISA	*/
+#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA	*/
+#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA		*/
+#define PRID_IMP_XBURST2		0x2000	/* XBurst®2 with MXU2.1 SIMD ISA		*/
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_NETLOGIC
diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index 61468a87775c..7d6cd087c5a9 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -49,6 +49,8 @@ static void __init jz4740_detect_mem(void)
 
 static unsigned long __init get_board_mach_type(const void *fdt)
 {
+	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x2000"))
+		return MACH_INGENIC_X2000;
 	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1830"))
 		return MACH_INGENIC_X1830;
 	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1000"))
@@ -91,6 +93,8 @@ void __init device_tree_init(void)
 const char *get_system_type(void)
 {
 	switch (mips_machtype) {
+	case MACH_INGENIC_X2000:
+		return "X2000";
 	case MACH_INGENIC_X1830:
 		return "X1830";
 	case MACH_INGENIC_X1000:
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index def1659fe262..90b11bc59d97 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2110,6 +2110,8 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
 
 	switch (c->processor_id & PRID_IMP_MASK) {
+
+	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
 	case PRID_IMP_XBURST_REV1:
 
 		/*
@@ -2148,12 +2150,20 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 			break;
 		}
 		fallthrough;
+
+	/* XBurst®1 with MXU2.0 SIMD ISA */
 	case PRID_IMP_XBURST_REV2:
 		c->cputype = CPU_XBURST;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		__cpu_name[cpu] = "Ingenic XBurst";
 		break;
 
+	/* XBurst®2 with MXU2.1 SIMD ISA */
+	case PRID_IMP_XBURST2:
+		c->cputype = CPU_XBURST;
+		__cpu_name[cpu] = "Ingenic XBurst II";
+		break;
+
 	default:
 		panic("Unknown Ingenic Processor ID!");
 		break;
@@ -2299,6 +2309,7 @@ void cpu_probe(void)
 	case PRID_COMP_LOONGSON:
 		cpu_probe_loongson(c, cpu);
 		break;
+	case PRID_COMP_INGENIC_13:
 	case PRID_COMP_INGENIC_D0:
 	case PRID_COMP_INGENIC_D1:
 	case PRID_COMP_INGENIC_E1:
-- 
2.11.0

