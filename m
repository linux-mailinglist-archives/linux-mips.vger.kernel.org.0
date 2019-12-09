Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A315811660E
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 06:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbfLIFKq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 00:10:46 -0500
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:44876 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfLIFKp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 00:10:45 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436416|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.494672-0.0111643-0.494164;DS=CONTINUE|ham_alarm|0.0698833-0.000280942-0.929836;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03305;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GDNCC0Y_1575868229;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GDNCC0Y_1575868229)
          by smtp.aliyun-inc.com(10.147.40.200);
          Mon, 09 Dec 2019 13:10:37 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com,
        tglx@linutronix.de, chenhc@lemote.com, tbogendoerfer@suse.de,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        jhogan@kernel.org, fancer.lancer@gmail.com, ralf@linux-mips.org,
        jiaxun.yang@flygoat.com
Subject: [PATCH v2] MIPS: X1830: Add X1830 system type.
Date:   Mon,  9 Dec 2019 13:10:25 +0800
Message-Id: <1575868225-57755-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575868225-57755-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1575868225-57755-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add X1830 system type for cat /proc/cpuinfo to give out X1830.
2.Change "PRID_IMP_XBURST" to "PRID_IMP_XBURST_REV1" and add a
  new "PRID_IMP_XBURST_REV2" for new Ingenic CPUs which has
  XBurst with MXU2 SIMD ISA.

Notice:
1."PRID_IMP_XBURST_REV2" is corresponds to the latest XBurst
  processor with 128bit MXU2 SIMD instruction set, not the upcoming
  XBurst2 processor. This version of the processors fixes issues
  such as BTB and HPTLB.
2.In order to simplify and reuse the code, the "c->cputype" and
  the "c->writecombine" and the "__cpu_name[cpu]" in the original
  "PRID_IMP_XBURST" (now is "PRID_IMP_XBURST_REV1") are removed,
  and the corresponding settings are abtained through fall-through
  to "PRID_IMP_XBURST_REV2", which will cause the name that was
  previously mistakenly called "JZRISC" to become to the real name
  "XBurst".

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    1.Add more detailed commit message.
    2.Add a /* fall-through */ comment to prevent GCC from issuing a
      warning when -Wimplicit-fallthrough is used.
    3.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
      to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
      the old mailbox is in an unstable state.

 arch/mips/include/asm/bootinfo.h |  1 +
 arch/mips/include/asm/cpu.h      |  5 ++--
 arch/mips/jz4740/setup.c         |  4 +++
 arch/mips/kernel/cpu-probe.c     | 65 ++++++++++++++++++++++------------------
 4 files changed, 44 insertions(+), 31 deletions(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index d41a505..6172778 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -81,6 +81,7 @@ enum loongson2ef_machine_type {
 #define  MACH_INGENIC_JZ4770	2	/* JZ4770 SOC		*/
 #define  MACH_INGENIC_JZ4780	3	/* JZ4780 SOC		*/
 #define  MACH_INGENIC_X1000		4	/* X1000 SOC		*/
+#define  MACH_INGENIC_X1830		5	/* X1830 SOC		*/
 
 extern char *system_type;
 const char *get_system_type(void);
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index ea83078..0e10ffc 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -46,7 +46,7 @@
 #define PRID_COMP_NETLOGIC	0x0c0000
 #define PRID_COMP_CAVIUM	0x0d0000
 #define PRID_COMP_LOONGSON	0x140000
-#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4740, JZ4750 */
+#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4740, JZ4750, X1830 */
 #define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
 #define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
 
@@ -185,7 +185,8 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
-#define PRID_IMP_XBURST	       0x0200
+#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst with MXU SIMD ISA		*/
+#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst with MXU2 SIMD ISA	*/
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_NETLOGIC
diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index dc8ee21..880c268 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -44,6 +44,8 @@ static void __init jz4740_detect_mem(void)
 
 static unsigned long __init get_board_mach_type(const void *fdt)
 {
+	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1830"))
+		return MACH_INGENIC_X1830;
 	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1000"))
 		return MACH_INGENIC_X1000;
 	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4780"))
@@ -86,6 +88,8 @@ void __init device_tree_init(void)
 const char *get_system_type(void)
 {
 	switch (mips_machtype) {
+	case MACH_INGENIC_X1830:
+		return "X1830";
 	case MACH_INGENIC_X1000:
 		return "X1000";
 	case MACH_INGENIC_JZ4780:
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index c543326..c063654 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1960,10 +1960,8 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
 
 	switch (c->processor_id & PRID_IMP_MASK) {
-	case PRID_IMP_XBURST:
-		c->cputype = CPU_XBURST;
-		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
-		__cpu_name[cpu] = "Ingenic JZRISC";
+	case PRID_IMP_XBURST_REV1:
+
 		/*
 		 * The XBurst core by default attempts to avoid branch target
 		 * buffer lookups by detecting & special casing loops. This
@@ -1971,34 +1969,43 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		 * Set cp0 config7 bit 4 to disable this feature.
 		 */
 		set_c0_config7(MIPS_CONF7_BTB_LOOP_EN);
-		break;
-	default:
-		panic("Unknown Ingenic Processor ID!");
-		break;
-	}
 
-	switch (c->processor_id & PRID_COMP_MASK) {
-	/*
-	 * The config0 register in the XBurst CPUs with a processor ID of
-	 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb mode, this
-	 * mode is not compatible with the MIPS standard, it will cause
-	 * tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
-	 * when starting the init process. After chip reset, the default
-	 * is HPTLB mode, Write 0xa9000000 to cp0 register 5 sel 4 to
-	 * switch back to VTLB mode to prevent getting stuck.
-	 */
-	case PRID_COMP_INGENIC_D1:
-		write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
-		break;
-	/*
-	 * The config0 register in the XBurst CPUs with a processor ID of
-	 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
-	 * but they don't actually support this ISA.
-	 */
-	case PRID_COMP_INGENIC_D0:
-		c->isa_level &= ~MIPS_CPU_ISA_M32R2;
+		switch (c->processor_id & PRID_COMP_MASK) {
+
+		/*
+		 * The config0 register in the XBurst CPUs with a processor ID of
+		 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
+		 * but they don't actually support this ISA.
+		 */
+		case PRID_COMP_INGENIC_D0:
+			c->isa_level &= ~MIPS_CPU_ISA_M32R2;
+			break;
+
+		/*
+		 * The config0 register in the XBurst CPUs with a processor ID of
+		 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb mode, this
+		 * mode is not compatible with the MIPS standard, it will cause
+		 * tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
+		 * when starting the init process. After chip reset, the default
+		 * is HPTLB mode, Write 0xa9000000 to cp0 register 5 sel 4 to
+		 * switch back to VTLB mode to prevent getting stuck.
+		 */
+		case PRID_COMP_INGENIC_D1:
+			write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
+			break;
+
+		default:
+			break;
+		}
+	/* fall-through */
+	case PRID_IMP_XBURST_REV2:
+		c->cputype = CPU_XBURST;
+		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+		__cpu_name[cpu] = "Ingenic XBurst";
 		break;
+
 	default:
+		panic("Unknown Ingenic Processor ID!");
 		break;
 	}
 }
-- 
2.7.4

