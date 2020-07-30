Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B9C233670
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 18:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgG3QNI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 12:13:08 -0400
Received: from crapouillou.net ([89.234.176.41]:47478 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgG3QNH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jul 2020 12:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596125563; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xC/tAI47wFW/BIIHxeJ+n88dhg5MZw8jGzHIJhMQ+pI=;
        b=abJghoYQd4csxpb+NXHEht3ntWsP7Xd6FaZd6v73ek9SwoBnWpQyhldlotj1NlRNW5SAXN
        Sr+KcCuXpM3uCkVyENx1m0vQbZuDGTehVYrtnhyJw/HwTjGqfjjNV8PcQVY/exTcR0vTl3
        iM0q2+Lix7cf3kIBESBXQQvOBgMSIs4=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/4] MIPS: ingenic: Hardcode mem size for qi,lb60 board
Date:   Thu, 30 Jul 2020 18:12:33 +0200
Message-Id: <20200730161233.61876-4-paul@crapouillou.net>
In-Reply-To: <20200730161233.61876-1-paul@crapouillou.net>
References: <20200730161233.61876-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Old Device Tree for the qi,lb60 (aka. Ben Nanonote) did not have a
'memory' node. The kernel would then read the memory controller
registers to know how much RAM was available.

Since every other supported board has had a 'memory' node from the
beginning, we can just hardcode a RAM size of 32 MiB when running with
an old Device Tree without the 'memory' node.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/jz4740/setup.c | 37 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index d73c9b722bf3..51d906325ce6 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -14,6 +14,7 @@
 #include <linux/of_clk.h>
 #include <linux/of_fdt.h>
 #include <linux/pm.h>
+#include <linux/sizes.h>
 #include <linux/suspend.h>
 
 #include <asm/bootinfo.h>
@@ -22,31 +23,6 @@
 #include <asm/reboot.h>
 #include <asm/time.h>
 
-#define JZ4740_EMC_BASE_ADDR 0x13010000
-
-#define JZ4740_EMC_SDRAM_CTRL 0x80
-
-static void __init jz4740_detect_mem(void)
-{
-	void __iomem *jz_emc_base;
-	u32 ctrl, bus, bank, rows, cols;
-	phys_addr_t size;
-
-	jz_emc_base = ioremap(JZ4740_EMC_BASE_ADDR, 0x100);
-	ctrl = readl(jz_emc_base + JZ4740_EMC_SDRAM_CTRL);
-	bus = 2 - ((ctrl >> 31) & 1);
-	bank = 1 + ((ctrl >> 19) & 1);
-	cols = 8 + ((ctrl >> 26) & 7);
-	rows = 11 + ((ctrl >> 20) & 3);
-	printk(KERN_DEBUG
-		"SDRAM preconfigured: bus:%u bank:%u rows:%u cols:%u\n",
-		bus, bank, rows, cols);
-	iounmap(jz_emc_base);
-
-	size = 1 << (bus + bank + cols + rows);
-	add_memory_region(0, size, BOOT_MEM_RAM);
-}
-
 static unsigned long __init get_board_mach_type(const void *fdt)
 {
 	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x2000"))
@@ -68,13 +44,16 @@ static unsigned long __init get_board_mach_type(const void *fdt)
 void __init plat_mem_setup(void)
 {
 	void *dtb = (void *)fw_passed_dtb;
-	int offset;
 
 	__dt_setup_arch(dtb);
 
-	offset = fdt_path_offset(dtb, "/memory");
-	if (offset < 0)
-		jz4740_detect_mem();
+	/*
+	 * Old devicetree files for the qi,lb60 board did not have a /memory
+	 * node. Hardcode the memory info here.
+	 */
+	if (!fdt_node_check_compatible(dtb, 0, "qi,lb60") &&
+	    fdt_path_offset(dtb, "/memory") < 0)
+		early_init_dt_add_memory_arch(0, SZ_32M);
 
 	mips_machtype = get_board_mach_type(dtb);
 }
-- 
2.27.0

