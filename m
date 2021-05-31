Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F11396827
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 20:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbhEaSvZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 14:51:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:40154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230351AbhEaSvT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 14:51:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 431466124B;
        Mon, 31 May 2021 18:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622486979;
        bh=btFFYY3u5orCiLCk9inxBgrXpI/VL8RywOBGiPSIwNE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f9e69/vWXiPJWAJljdpn1WHruGC9CNIHSWOiKBg2YvBuwFtJEIHJp9/0uXaQOtZPb
         GGnT3vgpxfOeuMO5m51FOtFjrcj0D2w2Dtjz03pJHqVySMfNeSSGQnrd/Wd5JhpUmR
         iyH4HbY4SIjDJgaBYh5PhCuaz07LNf4I36scOP7xz/xy8JRbKkBN7WtunpJ9UttshO
         P0StNpYz5qP2Ucha3BuXiW4OHFXsZQRcH/i7unmTPVP3CHD8bjg/pWL+V7pgwqYKoP
         YmjXwI/vVRIQqH3yqulDTL5+ypSq64v2DOSbFNPOca+n4MO6WcbIySySiiD2phGD3J
         KpitWAMQnoV1Q==
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
Subject: [PATCH 5/7] m68k: coldfire: remove private clk_get/clk_put
Date:   Mon, 31 May 2021 20:47:47 +0200
Message-Id: <20210531184749.2475868-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531184749.2475868-1-arnd@kernel.org>
References: <20210531184749.2475868-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Only three SoCs remain that use the custom clk_get/clk_put.
Move these over to clkdev_lookup tables as well. As before,
treat the "sys.0" and "pll.0" clocks as system-wide clocks,
and all the other ones as device specific.

The "name" field in 'struct clock' is now unused, so rename
that as well as a cleanup and to reduce the object code size.
The DEFINE_CLK macro could be changed the same way, but it
is less churn to just leave those in place, that can be
done as a follow-up later if someone is interested.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/Kconfig.cpu          |   5 +-
 arch/m68k/coldfire/clk.c       |  21 ------
 arch/m68k/coldfire/m520x.c     |  51 ++++++-------
 arch/m68k/coldfire/m53xx.c     |  80 ++++++++++-----------
 arch/m68k/coldfire/m5441x.c    | 126 ++++++++++++++++-----------------
 arch/m68k/include/asm/mcfclk.h |   5 --
 6 files changed, 129 insertions(+), 159 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index b3483929b313..e54167a64cbf 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -29,6 +29,7 @@ config COLDFIRE
 	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
 	select GPIOLIB
+	select CLKDEV_LOOKUP
 	select HAVE_LEGACY_CLK
 
 endchoice
@@ -328,10 +329,6 @@ config COLDFIRE_SLTIMERS
 	bool
 	select LEGACY_TIMER_TICK
 
-config COLDFIRE_CLKDEV_LOOKUP
-	def_bool !(M5206 || M5206e || M53xx || M5441x)
-	select CLKDEV_LOOKUP
-
 endif # COLDFIRE
 
 
diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
index ffe36627bab8..2ed841e94111 100644
--- a/arch/m68k/coldfire/clk.c
+++ b/arch/m68k/coldfire/clk.c
@@ -71,27 +71,6 @@ struct clk_ops clk_ops1 = {
 	.disable	= __clk_disable1,
 };
 #endif /* MCFPM_PPMCR1 */
-
-struct clk *clk_get(struct device *dev, const char *id)
-{
-	const char *clk_name = dev ? dev_name(dev) : id ? id : NULL;
-	struct clk *clk;
-	unsigned i;
-
-	for (i = 0; (clk = mcf_clks[i]) != NULL; ++i)
-		if (!strcmp(clk->name, clk_name))
-			return clk;
-	pr_warn("clk_get: didn't find clock %s\n", clk_name);
-	return ERR_PTR(-ENOENT);
-}
-EXPORT_SYMBOL(clk_get);
-
-void clk_put(struct clk *clk)
-{
-	if (clk->enabled != 0)
-		pr_warn("clk_put %s still enabled\n", clk->name);
-}
-EXPORT_SYMBOL(clk_put);
 #endif /* MCFPM_PPMCR0 */
 
 int clk_enable(struct clk *clk)
diff --git a/arch/m68k/coldfire/m520x.c b/arch/m68k/coldfire/m520x.c
index b5b2a267dada..d2f96b40aee1 100644
--- a/arch/m68k/coldfire/m520x.c
+++ b/arch/m68k/coldfire/m520x.c
@@ -12,6 +12,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -48,31 +49,29 @@ DEFINE_CLK(0, "sys.0", 40, MCF_BUSCLK);
 DEFINE_CLK(0, "gpio.0", 41, MCF_BUSCLK);
 DEFINE_CLK(0, "sdram.0", 42, MCF_CLK);
 
-struct clk *mcf_clks[] = {
-	&__clk_0_2, /* flexbus */
-	&__clk_0_12, /* fec.0 */
-	&__clk_0_17, /* edma */
-	&__clk_0_18, /* intc.0 */
-	&__clk_0_21, /* iack.0 */
-	&__clk_0_22, /* imx1-i2c.0 */
-	&__clk_0_23, /* mcfqspi.0 */
-	&__clk_0_24, /* mcfuart.0 */
-	&__clk_0_25, /* mcfuart.1 */
-	&__clk_0_26, /* mcfuart.2 */
-	&__clk_0_28, /* mcftmr.0 */
-	&__clk_0_29, /* mcftmr.1 */
-	&__clk_0_30, /* mcftmr.2 */
-	&__clk_0_31, /* mcftmr.3 */
-
-	&__clk_0_32, /* mcfpit.0 */
-	&__clk_0_33, /* mcfpit.1 */
-	&__clk_0_34, /* mcfeport.0 */
-	&__clk_0_35, /* mcfwdt.0 */
-	&__clk_0_36, /* pll.0 */
-	&__clk_0_40, /* sys.0 */
-	&__clk_0_41, /* gpio.0 */
-	&__clk_0_42, /* sdram.0 */
-	NULL,
+static struct clk_lookup m520x_clk_lookup[] = {
+	CLKDEV_INIT(NULL, "flexbus", &__clk_0_2),
+	CLKDEV_INIT("fec.0", NULL, &__clk_0_12),
+	CLKDEV_INIT("edma", NULL, &__clk_0_17),
+	CLKDEV_INIT("intc.0", NULL, &__clk_0_18),
+	CLKDEV_INIT("iack.0", NULL, &__clk_0_21),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &__clk_0_22),
+	CLKDEV_INIT("mcfqspi.0", NULL, &__clk_0_23),
+	CLKDEV_INIT("mcfuart.0", NULL, &__clk_0_24),
+	CLKDEV_INIT("mcfuart.1", NULL, &__clk_0_25),
+	CLKDEV_INIT("mcfuart.2", NULL, &__clk_0_26),
+	CLKDEV_INIT("mcftmr.0", NULL, &__clk_0_28),
+	CLKDEV_INIT("mcftmr.1", NULL, &__clk_0_29),
+	CLKDEV_INIT("mcftmr.2", NULL, &__clk_0_30),
+	CLKDEV_INIT("mcftmr.3", NULL, &__clk_0_31),
+	CLKDEV_INIT("mcfpit.0", NULL, &__clk_0_32),
+	CLKDEV_INIT("mcfpit.1", NULL, &__clk_0_33),
+	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_34),
+	CLKDEV_INIT("mcfwdt.0", NULL, &__clk_0_35),
+	CLKDEV_INIT(NULL, "pll.0", &__clk_0_36),
+	CLKDEV_INIT(NULL, "sys.0", &__clk_0_40),
+	CLKDEV_INIT("gpio.0", NULL, &__clk_0_41),
+	CLKDEV_INIT("sdram.0", NULL, &__clk_0_42),
 };
 
 static struct clk * const enable_clks[] __initconst = {
@@ -115,6 +114,8 @@ static void __init m520x_clk_init(void)
 	/* make sure these clocks are disabled */
 	for (i = 0; i < ARRAY_SIZE(disable_clks); ++i)
 		__clk_init_disabled(disable_clks[i]);
+
+	clkdev_add_table(m520x_clk_lookup, ARRAY_SIZE(m520x_clk_lookup));
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m53xx.c b/arch/m68k/coldfire/m53xx.c
index 075722c0c4f0..335095bb1d8a 100644
--- a/arch/m68k/coldfire/m53xx.c
+++ b/arch/m68k/coldfire/m53xx.c
@@ -13,6 +13,7 @@
 
 /***************************************************************************/
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -65,45 +66,42 @@ DEFINE_CLK(1, "mdha.0", 32, MCF_CLK);
 DEFINE_CLK(1, "skha.0", 33, MCF_CLK);
 DEFINE_CLK(1, "rng.0", 34, MCF_CLK);
 
-struct clk *mcf_clks[] = {
-	&__clk_0_2,	/* flexbus */
-	&__clk_0_8,	/* mcfcan.0 */
-	&__clk_0_12,	/* fec.0 */
-	&__clk_0_17,	/* edma */
-	&__clk_0_18,	/* intc.0 */
-	&__clk_0_19,	/* intc.1 */
-	&__clk_0_21,	/* iack.0 */
-	&__clk_0_22,	/* imx1-i2c.0 */
-	&__clk_0_23,	/* mcfqspi.0 */
-	&__clk_0_24,	/* mcfuart.0 */
-	&__clk_0_25,	/* mcfuart.1 */
-	&__clk_0_26,	/* mcfuart.2 */
-	&__clk_0_28,	/* mcftmr.0 */
-	&__clk_0_29,	/* mcftmr.1 */
-	&__clk_0_30,	/* mcftmr.2 */
-	&__clk_0_31,	/* mcftmr.3 */
-
-	&__clk_0_32,	/* mcfpit.0 */
-	&__clk_0_33,	/* mcfpit.1 */
-	&__clk_0_34,	/* mcfpit.2 */
-	&__clk_0_35,	/* mcfpit.3 */
-	&__clk_0_36,	/* mcfpwm.0 */
-	&__clk_0_37,	/* mcfeport.0 */
-	&__clk_0_38,	/* mcfwdt.0 */
-	&__clk_0_40,	/* sys.0 */
-	&__clk_0_41,	/* gpio.0 */
-	&__clk_0_42,	/* mcfrtc.0 */
-	&__clk_0_43,	/* mcflcd.0 */
-	&__clk_0_44,	/* mcfusb-otg.0 */
-	&__clk_0_45,	/* mcfusb-host.0 */
-	&__clk_0_46,	/* sdram.0 */
-	&__clk_0_47,	/* ssi.0 */
-	&__clk_0_48,	/* pll.0 */
-
-	&__clk_1_32,	/* mdha.0 */
-	&__clk_1_33,	/* skha.0 */
-	&__clk_1_34,	/* rng.0 */
-	NULL,
+static struct clk_lookup m53xx_clk_lookup[] = {
+	CLKDEV_INIT("flexbus", NULL, &__clk_0_2),
+	CLKDEV_INIT("mcfcan.0", NULL, &__clk_0_8),
+	CLKDEV_INIT("fec.0", NULL, &__clk_0_12),
+	CLKDEV_INIT("edma", NULL, &__clk_0_17),
+	CLKDEV_INIT("intc.0", NULL, &__clk_0_18),
+	CLKDEV_INIT("intc.1", NULL, &__clk_0_19),
+	CLKDEV_INIT("iack.0", NULL, &__clk_0_21),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &__clk_0_22),
+	CLKDEV_INIT("mcfqspi.0", NULL, &__clk_0_23),
+	CLKDEV_INIT("mcfuart.0", NULL, &__clk_0_24),
+	CLKDEV_INIT("mcfuart.1", NULL, &__clk_0_25),
+	CLKDEV_INIT("mcfuart.2", NULL, &__clk_0_26),
+	CLKDEV_INIT("mcftmr.0", NULL, &__clk_0_28),
+	CLKDEV_INIT("mcftmr.1", NULL, &__clk_0_29),
+	CLKDEV_INIT("mcftmr.2", NULL, &__clk_0_30),
+	CLKDEV_INIT("mcftmr.3", NULL, &__clk_0_31),
+	CLKDEV_INIT("mcfpit.0", NULL, &__clk_0_32),
+	CLKDEV_INIT("mcfpit.1", NULL, &__clk_0_33),
+	CLKDEV_INIT("mcfpit.2", NULL, &__clk_0_34),
+	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
+	CLKDEV_INIT("mcfpwm.0", NULL, &__clk_0_36),
+	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_37),
+	CLKDEV_INIT("mcfwdt.0", NULL, &__clk_0_38),
+	CLKDEV_INIT(NULL, "sys.0", &__clk_0_40),
+	CLKDEV_INIT("gpio.0", NULL, &__clk_0_41),
+	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
+	CLKDEV_INIT("mcflcd.0", NULL, &__clk_0_43),
+	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
+	CLKDEV_INIT("mcfusb-host.0", NULL, &__clk_0_45),
+	CLKDEV_INIT("sdram.0", NULL, &__clk_0_46),
+	CLKDEV_INIT("ssi.0", NULL, &__clk_0_47),
+	CLKDEV_INIT(NULL, "pll.0", &__clk_0_48),
+	CLKDEV_INIT("mdha.0", NULL, &__clk_1_32),
+	CLKDEV_INIT("skha.0", NULL, &__clk_1_33),
+	CLKDEV_INIT("rng.0", NULL, &__clk_1_34),
 };
 
 static struct clk * const enable_clks[] __initconst = {
@@ -158,6 +156,8 @@ static void __init m53xx_clk_init(void)
 	/* make sure these clocks are disabled */
 	for (i = 0; i < ARRAY_SIZE(disable_clks); ++i)
 		__clk_init_disabled(disable_clks[i]);
+
+	clkdev_add_table(m53xx_clk_lookup, ARRAY_SIZE(m53xx_clk_lookup));
 }
 
 /***************************************************************************/
@@ -275,7 +275,7 @@ void __init config_BSP(char *commandp, int size)
 #define SDRAM_TRFC	7	/* in clocks */
 #define SDRAM_TREFI	7800	/* in ns */
 
-#define EXT_SRAM_ADDRESS	(0xC0000000)
+#define EXT_SRAM_ADDRESS	(0,xC0000000)
 #define FLASH_ADDRESS		(0x00000000)
 #define SDRAM_ADDRESS		(0x40000000)
 
diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 1e5259a652d1..ce14693d18b6 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -5,6 +5,7 @@
  *	(C) Copyright Steven King <sfking@fdwdc.com>
  */
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/param.h>
 #include <linux/init.h>
@@ -78,72 +79,67 @@ DEFINE_CLK(2, "ipg.0", 0, MCF_CLK);
 DEFINE_CLK(2, "ahb.0", 1, MCF_CLK);
 DEFINE_CLK(2, "per.0", 2, MCF_CLK);
 
-struct clk *mcf_clks[] = {
-	&__clk_0_2,
-	&__clk_0_8,
-	&__clk_0_9,
-	&__clk_0_14,
-	&__clk_0_15,
-	&__clk_0_17,
-	&__clk_0_18,
-	&__clk_0_19,
-	&__clk_0_20,
-	&__clk_0_22,
-	&__clk_0_23,
-	&__clk_0_24,
-	&__clk_0_25,
-	&__clk_0_26,
-	&__clk_0_27,
-	&__clk_0_28,
-	&__clk_0_29,
-	&__clk_0_30,
-	&__clk_0_31,
-	&__clk_0_32,
-	&__clk_0_33,
-	&__clk_0_34,
-	&__clk_0_35,
-	&__clk_0_37,
-	&__clk_0_38,
-	&__clk_0_39,
-	&__clk_0_42,
-	&__clk_0_43,
-	&__clk_0_44,
-	&__clk_0_45,
-	&__clk_0_46,
-	&__clk_0_47,
-	&__clk_0_48,
-	&__clk_0_49,
-	&__clk_0_50,
-	&__clk_0_51,
-	&__clk_0_53,
-	&__clk_0_54,
-	&__clk_0_55,
-	&__clk_0_56,
-	&__clk_0_63,
-
-	&__clk_1_2,
-	&__clk_1_4,
-	&__clk_1_5,
-	&__clk_1_6,
-	&__clk_1_7,
-	&__clk_1_24,
-	&__clk_1_25,
-	&__clk_1_26,
-	&__clk_1_27,
-	&__clk_1_28,
-	&__clk_1_29,
-	&__clk_1_34,
-	&__clk_1_36,
-	&__clk_1_37,
-
-	&__clk_2_0,
-	&__clk_2_1,
-	&__clk_2_2,
-
-	NULL,
+static struct clk_lookup m5411x_clk_lookup[] = {
+	CLKDEV_INIT("flexbus", NULL, &__clk_0_2),
+	CLKDEV_INIT("mcfcan.0", NULL, &__clk_0_8),
+	CLKDEV_INIT("mcfcan.1", NULL, &__clk_0_9),
+	CLKDEV_INIT("imx1-i2c.1", NULL, &__clk_0_14),
+	CLKDEV_INIT("mcfdspi.1", NULL, &__clk_0_15),
+	CLKDEV_INIT("edma", NULL, &__clk_0_17),
+	CLKDEV_INIT("intc.0", NULL, &__clk_0_18),
+	CLKDEV_INIT("intc.1", NULL, &__clk_0_19),
+	CLKDEV_INIT("intc.2", NULL, &__clk_0_20),
+	CLKDEV_INIT("imx1-i2c.0", NULL, &__clk_0_22),
+	CLKDEV_INIT("fsl-dspi.0", NULL, &__clk_0_23),
+	CLKDEV_INIT("mcfuart.0", NULL, &__clk_0_24),
+	CLKDEV_INIT("mcfuart.1", NULL, &__clk_0_25),
+	CLKDEV_INIT("mcfuart.2", NULL, &__clk_0_26),
+	CLKDEV_INIT("mcfuart.3", NULL, &__clk_0_27),
+	CLKDEV_INIT("mcftmr.0", NULL, &__clk_0_28),
+	CLKDEV_INIT("mcftmr.1", NULL, &__clk_0_29),
+	CLKDEV_INIT("mcftmr.2", NULL, &__clk_0_30),
+	CLKDEV_INIT("mcftmr.3", NULL, &__clk_0_31),
+	CLKDEV_INIT("mcfpit.0", NULL, &__clk_0_32),
+	CLKDEV_INIT("mcfpit.1", NULL, &__clk_0_33),
+	CLKDEV_INIT("mcfpit.2", NULL, &__clk_0_34),
+	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
+	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_37),
+	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
+	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
+	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
+	CLKDEV_INIT("mcfusb-host.0", NULL, &__clk_0_45),
+	CLKDEV_INIT("mcfddr-sram.0", NULL, &__clk_0_46),
+	CLKDEV_INIT("mcfssi.0", NULL, &__clk_0_47),
+	CLKDEV_INIT(NULL, "pll.0", &__clk_0_48),
+	CLKDEV_INIT("mcfrng.0", NULL, &__clk_0_49),
+	CLKDEV_INIT("mcfssi.1", NULL, &__clk_0_50),
+	CLKDEV_INIT("sdhci-esdhc-mcf.0", NULL, &__clk_0_51),
+	CLKDEV_INIT("enet-fec.0", NULL, &__clk_0_53),
+	CLKDEV_INIT("enet-fec.1", NULL, &__clk_0_54),
+	CLKDEV_INIT("switch.0", NULL, &__clk_0_55),
+	CLKDEV_INIT("switch.1", NULL, &__clk_0_56),
+	CLKDEV_INIT("nand.0", NULL, &__clk_0_63),
+	CLKDEV_INIT("mcfow.0", NULL, &__clk_1_2),
+	CLKDEV_INIT("imx1-i2c.2", NULL, &__clk_1_4),
+	CLKDEV_INIT("imx1-i2c.3", NULL, &__clk_1_5),
+	CLKDEV_INIT("imx1-i2c.4", NULL, &__clk_1_6),
+	CLKDEV_INIT("imx1-i2c.5", NULL, &__clk_1_7),
+	CLKDEV_INIT("mcfuart.4", NULL, &__clk_1_24),
+	CLKDEV_INIT("mcfuart.5", NULL, &__clk_1_25),
+	CLKDEV_INIT("mcfuart.6", NULL, &__clk_1_26),
+	CLKDEV_INIT("mcfuart.7", NULL, &__clk_1_27),
+	CLKDEV_INIT("mcfuart.8", NULL, &__clk_1_28),
+	CLKDEV_INIT("mcfuart.9", NULL, &__clk_1_29),
+	CLKDEV_INIT("mcfpwm.0", NULL, &__clk_1_34),
+	CLKDEV_INIT(NULL, "sys.0", &__clk_1_36),
+	CLKDEV_INIT("gpio.0", NULL, &__clk_1_37),
+	CLKDEV_INIT("ipg.0", NULL, &__clk_2_0),
+	CLKDEV_INIT("ahb.0", NULL, &__clk_2_1),
+	CLKDEV_INIT("per.0", NULL, &__clk_2_2),
 };
 
-
 static struct clk * const enable_clks[] __initconst = {
 	/* make sure these clocks are enabled */
 	&__clk_0_15, /* dspi.1 */
@@ -228,6 +224,8 @@ static void __init m5441x_clk_init(void)
 	/* make sure these clocks are disabled */
 	for (i = 0; i < ARRAY_SIZE(disable_clks); ++i)
 		__clk_init_disabled(disable_clks[i]);
+
+	clkdev_add_table(m5411x_clk_lookup, ARRAY_SIZE(m5411x_clk_lookup));
 }
 
 static void __init m5441x_uarts_init(void)
diff --git a/arch/m68k/include/asm/mcfclk.h b/arch/m68k/include/asm/mcfclk.h
index 722627e06d66..4e9a6b827a14 100644
--- a/arch/m68k/include/asm/mcfclk.h
+++ b/arch/m68k/include/asm/mcfclk.h
@@ -15,15 +15,12 @@ struct clk_ops {
 };
 
 struct clk {
-	const char *name;
 	struct clk_ops *clk_ops;
 	unsigned long rate;
 	unsigned long enabled;
 	u8 slot;
 };
 
-extern struct clk *mcf_clks[];
-
 #ifdef MCFPM_PPMCR0
 extern struct clk_ops clk_ops0;
 #ifdef MCFPM_PPMCR1
@@ -34,7 +31,6 @@ extern struct clk_ops clk_ops2;
 
 #define DEFINE_CLK(clk_bank, clk_name, clk_slot, clk_rate) \
 static struct clk __clk_##clk_bank##_##clk_slot = { \
-	.name = clk_name, \
 	.clk_ops = &clk_ops##clk_bank, \
 	.rate = clk_rate, \
 	.slot = clk_slot, \
@@ -45,7 +41,6 @@ void __clk_init_disabled(struct clk *);
 #else
 #define DEFINE_CLK(clk_ref, clk_name, clk_rate) \
         static struct clk clk_##clk_ref = { \
-                .name = clk_name, \
                 .rate = clk_rate, \
         }
 #endif /* MCFPM_PPMCR0 */
-- 
2.29.2

