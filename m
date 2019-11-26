Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F04310991A
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 07:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfKZGTM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 01:19:12 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25827 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfKZGTM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 01:19:12 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574749102; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Hm5zrBRbsblc/6y7NXfKYNwlzgz8tSvY7IP4G1WUs+l3Clof796pQMyX4XemRWQPYBRR0A5QE5DzSpSIVD6rOzhmLr1F2gf/i7FUjwov/RsFwoieF+hEtB3rVTcNDx+qJhPjG/RwFQbAjPfup0+UFapHMckEvdCQBt49dRmokDo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574749102; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=1Hk06eHivNvz397FtH5AhDgEadBkG/H+57GQq6VSQaA=; 
        b=H2rgA1FUeD3CT5rePyGjXDiZ3Uh9esjHV42J/grQF+XZK57nqDF2+eeBkXV/env81hKfH+5an8yVeQw9B8iSnj7nyOu43gW10CkaSvxaccYgS4tNRbSTJkv3nmeZX7X0OYFnNSM3SNxODdcSQBxhLBxiDRmXWQH7czQi78OtLGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=AFp/6bmzNBYa9fkiXBJSVVayXq+w450Y0bxbDpahp7bidvvGDRUB4HPdYXOlX5Vv3iKhLx6XhXbO
    NAVMLRVoEMDmHBn9ns9jclL7ThekVPi/Shlgos9Ut1n1JRvX/msd  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574749102;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=1Hk06eHivNvz397FtH5AhDgEadBkG/H+57GQq6VSQaA=;
        b=m+kf8OkYe/FSe/Fys2DsR3/4XTvItdXSzKTBeLIiU9w6SrojS+vHH6/7FK8rjc2Q
        BJRWNxGnwezEexR8A4xsROmlAb9+HHp0DbxgCnhZsMZwg5YW5ZJ/q9s/TN0JxFe+b33
        rGBOYd2EZoXbmHOyBxMoDVAT9gemI21e2UNVYh5A=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1574749100156205.65908448748587; Mon, 25 Nov 2019 22:18:20 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        fancer.lancer@gmail.com, syq@debian.org,
        yamada.masahiro@socionext.com, tglx@linutronix.de,
        malat@debian.org, paul@crapouillou.net, jiaxun.yang@flygoat.com,
        sernia.zhou@foxmail.com
Subject: [PATCH] MIPS: X1830: Add X1830 system type.
Date:   Tue, 26 Nov 2019 14:17:55 +0800
Message-Id: <1574749075-99329-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574749075-99329-1-git-send-email-zhouyanjie@zoho.com>
References: <1574749075-99329-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add X1830 system type for cat /proc/cpuinfo to give out X1830.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/include/asm/bootinfo.h |  1 +
 arch/mips/include/asm/cpu.h      |  5 ++--
 arch/mips/jz4740/setup.c         |  4 +++
 arch/mips/kernel/cpu-probe.c     | 65 ++++++++++++++++++++++------------------
 4 files changed, 44 insertions(+), 31 deletions(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 34d6222..07f4cfe 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -82,6 +82,7 @@ enum loongson_machine_type {
 #define  MACH_INGENIC_JZ4770	2	/* JZ4770 SOC		*/
 #define  MACH_INGENIC_JZ4780	3	/* JZ4780 SOC		*/
 #define  MACH_INGENIC_X1000		4	/* X1000 SOC		*/
+#define  MACH_INGENIC_X1830		5	/* X1830 SOC		*/
 
 extern char *system_type;
 const char *get_system_type(void);
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 7fddcb8..fa7c1e8 100644
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
 
@@ -183,7 +183,8 @@
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
index 8abadfe..94b3cc5 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1948,10 +1948,8 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
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
@@ -1959,34 +1957,43 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
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
+
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


