Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834CC39FA70
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 17:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhFHP0S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 11:26:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:46478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231796AbhFHP0F (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Jun 2021 11:26:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE71F6128E;
        Tue,  8 Jun 2021 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623165852;
        bh=JI2j1dnjT5tafECrq0BoZAj5GouU6dhToW2nFUxvGQw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P/iuvcRKuKl3uD/X3AvIgWpjaKOF8OXnssJcD/JJLU6giJAvdzBzYTXZHJuK75Ovq
         JvVw1eDB/8RK6kGN0N7cwnEBq0MRJUw78kb/UwtoiRZNQyzCrfNE3o+njxXJAKRywU
         AkymstBhRNZ4GbNwKa3LV7cVlXvJef2FcnBeC7o20fx6qodCMlSLdy5m07FjyFWzUY
         yj5PcWmNZOTumAyeGZ/t7hGfbPmPm/QUlAsTXKvkG48STvWB8LkaM2PxKGVf3gy8xa
         qj5IFD7B86Z/2H5A8gEJs+MW5KM+UkeZJK6VFtJB5I+k/uhimsX9+O7LywaB1+oN+k
         OKIZWyhVI9Vvw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] mips: ar7: convert to CONFIG_COMMON_CLK
Date:   Tue,  8 Jun 2021 17:22:09 +0200
Message-Id: <20210608152214.1231666-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210608152214.1231666-1-arnd@kernel.org>
References: <20210608152214.1231666-1-arnd@kernel.org>
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
 arch/mips/ar7/clock.c                | 102 ++++++++-------------------
 arch/mips/include/asm/mach-ar7/ar7.h |   4 --
 3 files changed, 29 insertions(+), 80 deletions(-)

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
index e8648e3eb27b..c717acbc5506 100644
--- a/arch/mips/ar7/clock.c
+++ b/arch/mips/ar7/clock.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/clkdev.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 
 #include <asm/addrspace.h>
 #include <asm/mach-ar7/ar7.h>
@@ -85,17 +86,17 @@ struct tnetd7200_clocks {
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
@@ -241,6 +242,8 @@ static void __init tnetd7300_init_clocks(void)
 	struct tnetd7300_clocks *clocks =
 					ioremap(UR8_REGS_CLOCKS,
 					sizeof(struct tnetd7300_clocks));
+	u32 dsp_clk;
+	struct clk *clk;
 
 	bus_clk.rate = tnetd7300_get_clock(BUS_PLL_SOURCE_SHIFT,
 		&clocks->bus, bootcr, AR7_AFE_CLOCK);
@@ -251,12 +254,18 @@ static void __init tnetd7300_init_clocks(void)
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
@@ -328,6 +337,7 @@ static void __init tnetd7200_init_clocks(void)
 	int cpu_base, cpu_mul, cpu_prediv, cpu_postdiv;
 	int dsp_base, dsp_mul, dsp_prediv, dsp_postdiv;
 	int usb_base, usb_mul, usb_prediv, usb_postdiv;
+	struct clk *clk;
 
 	cpu_base = tnetd7200_get_clock_base(TNETD7200_CLOCK_ID_CPU, bootcr);
 	dsp_base = tnetd7200_get_clock_base(TNETD7200_CLOCK_ID_DSP, bootcr);
@@ -396,90 +406,34 @@ static void __init tnetd7200_init_clocks(void)
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
 
-void clk_disable(struct clk *clk)
-{
+	clk = clk_register_fixed_rate(NULL, "cpu", NULL, 0, cpu_clk.rate);
+	clkdev_create(clk, "cpu", NULL);
+	clkdev_create(clk, "dsp", NULL);
 }
-EXPORT_SYMBOL(clk_disable);
-
-unsigned long clk_get_rate(struct clk *clk)
-{
-	if (!clk)
-		return 0;
-
-	return clk->rate;
-}
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

