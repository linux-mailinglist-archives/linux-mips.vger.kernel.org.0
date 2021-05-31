Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953AF396821
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 20:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhEaSvJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 14:51:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231228AbhEaSvI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 14:51:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33BF46128A;
        Mon, 31 May 2021 18:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622486968;
        bh=mIYhxJIp0tEQnItbiI+2e4XQ9Cn2lxzgUpiDhFxG/W8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tk8GL/t+n473EOHe7gZaO9kys/5AiuY20abuQ93uGJ7M+ctmoYaGqlawxZXLs4MS/
         GyTP3LUb2f4u1aFvW4HihsjxeYFJKk10kl0TvbTfisZj1PCHTAadrqsWSCpif4WQwh
         wLoYcjdTCGIfjj2JtORfv49htmS1M3bYUunDunMrorUjIv8kgF1Owv/I6GnpGMp9MR
         s+ATmhlmxX+5c0VkUsPSFrfISlgLB7ZAi5hyFOxcglZpHc9lmfdHrIHJHZa/4nY/6p
         9oH22WWTVPn4gk2A41eN3/ypgw5dGsY0xbhqHjs8Yh+TRzLxlA+hlgA6qCYbEhzbh+
         EJGKnWTRuKwZA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Subject: [PATCH 2/7] mips: ar7: convert to CONFIG_COMMON_CLK
Date:   Mon, 31 May 2021 20:47:44 +0200
Message-Id: <20210531184749.2475868-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531184749.2475868-1-arnd@kernel.org>
References: <20210531184749.2475868-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Perform a minimal conversion of the ar7 clock implementation to the common
clock framework. While the hardware can control the rates, this is left
unchanged, and all clocks are registered as fixed-rate or fixed-divider
clocks. Similarly, the clkdev lookup information is left unchanged but
moved from the table format into individual allocations.

There is a small increase in code size:

   text	   data	    bss	    dec	    hex	filename
4757116	 596640	  91328	5445084	 5315dc	vmlinux-before
4806159	 602360	  91344	5499863	 53ebd7	vmlinux-after

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig                    |   3 +-
 arch/mips/ar7/clock.c                | 103 ++++++++-------------------
 arch/mips/include/asm/mach-ar7/ar7.h |   4 --
 3 files changed, 29 insertions(+), 81 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1cc03a7652a9..5dbc60adb2f0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -201,6 +201,7 @@ config MIPS_ALCHEMY
 config AR7
 	bool "Texas Instruments AR7"
 	select BOOT_ELF32
+	select COMMON_CLK
 	select DMA_NONCOHERENT
 	select CEVT_R4K
 	select CSRC_R4K
@@ -215,8 +216,6 @@ config AR7
 	select SYS_SUPPORTS_ZBOOT_UART16550
 	select GPIOLIB
 	select VLYNQ
-	select CLKDEV_LOOKUP
-	select HAVE_LEGACY_CLK
 	help
 	  Support for the Texas Instruments AR7 System-on-a-Chip
 	  family: TNETD7100, 7200 and 7300.
diff --git a/arch/mips/ar7/clock.c b/arch/mips/ar7/clock.c
index c614f254f370..31455180ce63 100644
--- a/arch/mips/ar7/clock.c
+++ b/arch/mips/ar7/clock.c
@@ -15,7 +15,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/clk.h>
-#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 
 #include <asm/addrspace.h>
 #include <asm/mach-ar7/ar7.h>
@@ -86,17 +86,17 @@ struct tnetd7200_clocks {
 	struct tnetd7200_clock usb;
 };
 
-static struct clk bus_clk = {
+struct clk_rate {
+	u32 rate;
+};
+static struct clk_rate bus_clk = {
 	.rate	= 125000000,
 };
 
-static struct clk cpu_clk = {
+static struct clk_rate cpu_clk = {
 	.rate	= 150000000,
 };
 
-static struct clk dsp_clk;
-static struct clk vbus_clk;
-
 static void approximate(int base, int target, int *prediv,
 			int *postdiv, int *mul)
 {
@@ -242,6 +242,8 @@ static void __init tnetd7300_init_clocks(void)
 	struct tnetd7300_clocks *clocks =
 					ioremap(UR8_REGS_CLOCKS,
 					sizeof(struct tnetd7300_clocks));
+	u32 dsp_clk;
+	struct clk *clk;
 
 	bus_clk.rate = tnetd7300_get_clock(BUS_PLL_SOURCE_SHIFT,
 		&clocks->bus, bootcr, AR7_AFE_CLOCK);
@@ -252,12 +254,18 @@ static void __init tnetd7300_init_clocks(void)
 	else
 		cpu_clk.rate = bus_clk.rate;
 
-	if (dsp_clk.rate == 250000000)
+	dsp_clk = tnetd7300_dsp_clock();
+	if (dsp_clk == 250000000)
 		tnetd7300_set_clock(DSP_PLL_SOURCE_SHIFT, &clocks->dsp,
-			bootcr, dsp_clk.rate);
+			bootcr, dsp_clk);
 
 	iounmap(clocks);
 	iounmap(bootcr);
+
+	clk = clk_register_fixed_rate(NULL, "cpu", NULL, 0, cpu_clk.rate);
+	clkdev_create(clk, "cpu", NULL);
+	clk = clk_register_fixed_rate(NULL, "dsp", NULL, 0, dsp_clk);
+	clkdev_create(clk, "dsp", NULL);
 }
 
 static void tnetd7200_set_clock(int base, struct tnetd7200_clock *clock,
@@ -329,6 +337,7 @@ static void __init tnetd7200_init_clocks(void)
 	int cpu_base, cpu_mul, cpu_prediv, cpu_postdiv;
 	int dsp_base, dsp_mul, dsp_prediv, dsp_postdiv;
 	int usb_base, usb_mul, usb_prediv, usb_postdiv;
+	struct clk *clk;
 
 	cpu_base = tnetd7200_get_clock_base(TNETD7200_CLOCK_ID_CPU, bootcr);
 	dsp_base = tnetd7200_get_clock_base(TNETD7200_CLOCK_ID_DSP, bootcr);
@@ -397,90 +406,34 @@ static void __init tnetd7200_init_clocks(void)
 		usb_prediv, usb_postdiv, -1, usb_mul,
 		TNETD7200_DEF_USB_CLK);
 
-	dsp_clk.rate = cpu_clk.rate;
-
 	iounmap(clocks);
 	iounmap(bootcr);
-}
-
-/*
- * Linux clock API
- */
-int clk_enable(struct clk *clk)
-{
-	return 0;
-}
-EXPORT_SYMBOL(clk_enable);
-
-void clk_disable(struct clk *clk)
-{
-}
-EXPORT_SYMBOL(clk_disable);
-
-unsigned long clk_get_rate(struct clk *clk)
-{
-	if (!clk)
-		return 0;
 
-	return clk->rate;
+	clk = clk_register_fixed_rate(NULL, "cpu", NULL, 0, cpu_clk.rate);
+	clkdev_create(clk, "cpu", NULL);
+	clkdev_create(clk, "dsp", NULL);
 }
-EXPORT_SYMBOL(clk_get_rate);
-
-static struct clk_lookup ar7_clkdev_table[] = {
-	CLKDEV_INIT(NULL, "bus", &bus_clk),
-	/* cpmac and vbus share the same rate */
-	CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
-	CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
-	CLKDEV_INIT(NULL, "cpu", &cpu_clk),
-	CLKDEV_INIT(NULL, "dsp", &dsp_clk),
-	CLKDEV_INIT(NULL, "vbus", &vbus_clk),
-};
 
 void __init ar7_init_clocks(void)
 {
+	struct clk *clk;
+
 	switch (ar7_chip_id()) {
 	case AR7_CHIP_7100:
 	case AR7_CHIP_7200:
 		tnetd7200_init_clocks();
 		break;
 	case AR7_CHIP_7300:
-		dsp_clk.rate = tnetd7300_dsp_clock();
 		tnetd7300_init_clocks();
 		break;
 	default:
 		break;
 	}
+	clk = clk_register_fixed_rate(NULL, "bus", NULL, 0, bus_clk.rate);
+	clkdev_create(clk, "bus", NULL);
 	/* adjust vbus clock rate */
-	vbus_clk.rate = bus_clk.rate / 2;
-
-	clkdev_add_table(ar7_clkdev_table, ARRAY_SIZE(ar7_clkdev_table));
-}
-
-/* dummy functions, should not be called */
-long clk_round_rate(struct clk *clk, unsigned long rate)
-{
-	WARN_ON(clk);
-	return 0;
-}
-EXPORT_SYMBOL(clk_round_rate);
-
-int clk_set_rate(struct clk *clk, unsigned long rate)
-{
-	WARN_ON(clk);
-	return 0;
-}
-EXPORT_SYMBOL(clk_set_rate);
-
-int clk_set_parent(struct clk *clk, struct clk *parent)
-{
-	WARN_ON(clk);
-	return 0;
-}
-EXPORT_SYMBOL(clk_set_parent);
-
-struct clk *clk_get_parent(struct clk *clk)
-{
-	WARN_ON(clk);
-	return NULL;
+	clk = clk_register_fixed_factor(NULL, "vbus", "bus", 0, 1, 2);
+	clkdev_create(clk, "vbus", NULL);
+	clkdev_create(clk, "cpmac", "cpmac.1");
+	clkdev_create(clk, "cpmac", "cpmac.1");
 }
-EXPORT_SYMBOL(clk_get_parent);
diff --git a/arch/mips/include/asm/mach-ar7/ar7.h b/arch/mips/include/asm/mach-ar7/ar7.h
index dd09c3bf0601..cbe75ade3277 100644
--- a/arch/mips/include/asm/mach-ar7/ar7.h
+++ b/arch/mips/include/asm/mach-ar7/ar7.h
@@ -131,10 +131,6 @@ static inline u8 ar7_chip_rev(void)
 		0x14))) >> 16) & 0xff;
 }
 
-struct clk {
-	unsigned int	rate;
-};
-
 static inline int ar7_has_high_cpmac(void)
 {
 	u16 chip_id = ar7_chip_id();
-- 
2.29.2

