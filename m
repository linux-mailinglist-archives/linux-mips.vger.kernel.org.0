Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A981F396829
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 20:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhEaSv1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 14:51:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231151AbhEaSvX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 14:51:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDC246128A;
        Mon, 31 May 2021 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622486983;
        bh=CqS/REIRdXuu3G6qnyJfdGMwzUbALygTwd2BA259Hq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=swME707fstUzuduT66x57HyshN0dnn9nSoAmyV3HwUVz5+yj/+tMbYOoYdpFWwy9k
         6/0TwovT0d1NfUeSqtBFnyaV2+T4oj5b9XzTlTJE/uVoRuVD8S7qwzD0MGxrbT7jAd
         hXfUrZL7T4mJ/Fbvs9bNFBuNzxibWa2P4Bcd1xTkfTQsxnGaB7oEt43tjb4V6RE27p
         0pT2cB3iU3Vc9X4/ifUT2XJF1IVrLeCfqmkvZw3TZCiJAlxKVkhVwCOTEUpqSUqKxA
         7OjnICwbTbkdMhf8WhRxpt1R3Q3MxSwdaoDw/mf3S9mrTGZXh4X5WydsGSkVpjKZm9
         F+7EDyZRQ6qXQ==
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
Subject: [PATCH 6/7] clkdev: remove CONFIG_CLKDEV_LOOKUP
Date:   Mon, 31 May 2021 20:47:48 +0200
Message-Id: <20210531184749.2475868-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531184749.2475868-1-arnd@kernel.org>
References: <20210531184749.2475868-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This option is now synonymous with CONFIG_HAVE_CLK, so use
the latter globally. Any out-of-tree platform ports that
still use a private clk_get()/clk_put() implementation should
move to CONFIG_COMMON_CLK.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig              |  2 --
 arch/m68k/Kconfig.cpu         |  1 -
 arch/mips/Kconfig             |  3 ---
 arch/mips/pic32/Kconfig       |  1 -
 arch/sh/Kconfig               |  1 -
 drivers/clk/Kconfig           |  6 +-----
 drivers/clk/Makefile          |  3 +--
 drivers/clocksource/Kconfig   |  6 +++---
 drivers/mmc/host/Kconfig      |  4 ++--
 drivers/staging/board/Kconfig |  2 +-
 sound/soc/dwc/Kconfig         |  2 +-
 sound/soc/rockchip/Kconfig    | 14 +++++++-------
 12 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 24804f11302d..809317b5a6c6 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -353,7 +353,6 @@ config ARCH_EP93XX
 	select ARM_VIC
 	select GENERIC_IRQ_MULTI_HANDLER
 	select AUTO_ZRELADDR
-	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
 	select CPU_ARM920T
 	select GPIOLIB
@@ -504,7 +503,6 @@ config ARCH_OMAP1
 	bool "TI OMAP1"
 	depends on MMU
 	select ARCH_OMAP
-	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
 	select GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_MULTI_HANDLER
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index e54167a64cbf..f4d23977d2a5 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -29,7 +29,6 @@ config COLDFIRE
 	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
 	select GPIOLIB
-	select CLKDEV_LOOKUP
 	select HAVE_LEGACY_CLK
 
 endchoice
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8fe6b30de7dd..96ab1a2a9357 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -332,7 +332,6 @@ config BCM63XX
 	select SWAP_IO_SPACE
 	select GPIOLIB
 	select MIPS_L1_CACHE_SHIFT_4
-	select CLKDEV_LOOKUP
 	select HAVE_LEGACY_CLK
 	help
 	  Support for BCM63XX based boards
@@ -446,7 +445,6 @@ config LANTIQ
 	select GPIOLIB
 	select SWAP_IO_SPACE
 	select BOOT_RAW
-	select CLKDEV_LOOKUP
 	select HAVE_LEGACY_CLK
 	select USE_OF
 	select PINCTRL
@@ -643,7 +641,6 @@ config RALINK
 	select SYS_SUPPORTS_MIPS16
 	select SYS_SUPPORTS_ZBOOT
 	select SYS_HAS_EARLY_PRINTK
-	select CLKDEV_LOOKUP
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 
diff --git a/arch/mips/pic32/Kconfig b/arch/mips/pic32/Kconfig
index 7acbb50c1dcd..bb6ab1f3e80d 100644
--- a/arch/mips/pic32/Kconfig
+++ b/arch/mips/pic32/Kconfig
@@ -17,7 +17,6 @@ config PIC32MZDA
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select GPIOLIB
 	select COMMON_CLK
-	select CLKDEV_LOOKUP
 	select LIBFDT
 	select USE_OF
 	select PINCTRL
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 68129537e350..45a0549421cd 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -14,7 +14,6 @@ config SUPERH
 	select ARCH_HIBERNATION_POSSIBLE if MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_WANT_IPC_PARSE_VERSION
-	select CLKDEV_LOOKUP
 	select CPU_NO_EFFICIENT_FFS
 	select DMA_DECLARE_COHERENT
 	select GENERIC_ATOMIC64
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e80918be8e9c..ed1364ac376b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -6,10 +6,6 @@ config HAVE_CLK
 	  The <linux/clk.h> calls support software clock gating and
 	  thus are a key power management tool on many systems.
 
-config CLKDEV_LOOKUP
-	bool
-	select HAVE_CLK
-
 config HAVE_CLK_PREPARE
 	bool
 
@@ -26,7 +22,7 @@ menuconfig COMMON_CLK
 	bool "Common Clock Framework"
 	depends on !HAVE_LEGACY_CLK
 	select HAVE_CLK_PREPARE
-	select CLKDEV_LOOKUP
+	select HAVE_CLK
 	select SRCU
 	select RATIONAL
 	help
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 5f06879d7fe9..5341c37b62dc 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # common clock types
-obj-$(CONFIG_HAVE_CLK)		+= clk-devres.o clk-bulk.o
-obj-$(CONFIG_CLKDEV_LOOKUP)	+= clkdev.o
+obj-$(CONFIG_HAVE_CLK)		+= clk-devres.o clk-bulk.o clkdev.o
 obj-$(CONFIG_COMMON_CLK)	+= clk.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 39aa21d01e05..938087347927 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -360,7 +360,7 @@ config ARM_GLOBAL_TIMER
 
 config ARM_TIMER_SP804
 	bool "Support for Dual Timer SP804 module" if COMPILE_TEST
-	depends on GENERIC_SCHED_CLOCK && CLKDEV_LOOKUP
+	depends on GENERIC_SCHED_CLOCK && HAVE_CLK
 	select CLKSRC_MMIO
 	select TIMER_OF if OF
 
@@ -570,12 +570,12 @@ config H8300_TPU
 
 config CLKSRC_IMX_GPT
 	bool "Clocksource using i.MX GPT" if COMPILE_TEST
-	depends on (ARM || ARM64) && CLKDEV_LOOKUP
+	depends on (ARM || ARM64) && HAVE_CLK
 	select CLKSRC_MMIO
 
 config CLKSRC_IMX_TPM
 	bool "Clocksource using i.MX TPM" if COMPILE_TEST
-	depends on (ARM || ARM64) && CLKDEV_LOOKUP
+	depends on (ARM || ARM64) && HAVE_CLK
 	select CLKSRC_MMIO
 	select TIMER_OF
 	help
diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index a4d4c757eea0..4f1468a79126 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -329,7 +329,7 @@ config MMC_SDHCI_S3C
 
 config MMC_SDHCI_PXAV3
 	tristate "Marvell MMP2 SD Host Controller support (PXAV3)"
-	depends on CLKDEV_LOOKUP
+	depends on HAVE_CLK
 	depends on MMC_SDHCI_PLTFM
 	depends on ARCH_BERLIN || ARCH_MMP || ARCH_MVEBU || COMPILE_TEST
 	default CPU_MMP2
@@ -342,7 +342,7 @@ config MMC_SDHCI_PXAV3
 
 config MMC_SDHCI_PXAV2
 	tristate "Marvell PXA9XX SD Host Controller support (PXAV2)"
-	depends on CLKDEV_LOOKUP
+	depends on HAVE_CLK
 	depends on MMC_SDHCI_PLTFM
 	depends on ARCH_MMP || COMPILE_TEST
 	default CPU_PXA910
diff --git a/drivers/staging/board/Kconfig b/drivers/staging/board/Kconfig
index 64c77970eee8..b49216768ef6 100644
--- a/drivers/staging/board/Kconfig
+++ b/drivers/staging/board/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config STAGING_BOARD
 	bool "Staging Board Support"
-	depends on OF_ADDRESS && OF_IRQ && CLKDEV_LOOKUP
+	depends on OF_ADDRESS && OF_IRQ && HAVE_CLK
 	help
 	  Staging board base is to support continuous upstream
 	  in-tree development and integration of platform devices.
diff --git a/sound/soc/dwc/Kconfig b/sound/soc/dwc/Kconfig
index 0cd1a15f40aa..71a58f7ac13a 100644
--- a/sound/soc/dwc/Kconfig
+++ b/sound/soc/dwc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SND_DESIGNWARE_I2S
 	tristate "Synopsys I2S Device Driver"
-	depends on CLKDEV_LOOKUP
+	depends on HAVE_CLK
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	 Say Y or M if you want to add support for I2S driver for
diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index d610b553ea3b..053097b73e28 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -9,7 +9,7 @@ config SND_SOC_ROCKCHIP
 
 config SND_SOC_ROCKCHIP_I2S
 	tristate "Rockchip I2S Device Driver"
-	depends on CLKDEV_LOOKUP && SND_SOC_ROCKCHIP
+	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S driver for
@@ -18,7 +18,7 @@ config SND_SOC_ROCKCHIP_I2S
 
 config SND_SOC_ROCKCHIP_PDM
 	tristate "Rockchip PDM Controller Driver"
-	depends on CLKDEV_LOOKUP && SND_SOC_ROCKCHIP
+	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select RATIONAL
 	help
@@ -28,7 +28,7 @@ config SND_SOC_ROCKCHIP_PDM
 
 config SND_SOC_ROCKCHIP_SPDIF
 	tristate "Rockchip SPDIF Device Driver"
-	depends on CLKDEV_LOOKUP && SND_SOC_ROCKCHIP
+	depends on HAVE_CLK && SND_SOC_ROCKCHIP
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for SPDIF driver for
@@ -36,7 +36,7 @@ config SND_SOC_ROCKCHIP_SPDIF
 
 config SND_SOC_ROCKCHIP_MAX98090
 	tristate "ASoC support for Rockchip boards using a MAX98090 codec"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && CLKDEV_LOOKUP
+	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_MAX98090
 	select SND_SOC_TS3A227E
@@ -47,7 +47,7 @@ config SND_SOC_ROCKCHIP_MAX98090
 
 config SND_SOC_ROCKCHIP_RT5645
 	tristate "ASoC support for Rockchip boards using a RT5645/RT5650 codec"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && CLKDEV_LOOKUP
+	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_RT5645
 	help
@@ -56,7 +56,7 @@ config SND_SOC_ROCKCHIP_RT5645
 
 config SND_SOC_RK3288_HDMI_ANALOG
 	tristate "ASoC support multiple codecs for Rockchip RK3288 boards"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && CLKDEV_LOOKUP
+	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_ES8328_I2C
@@ -68,7 +68,7 @@ config SND_SOC_RK3288_HDMI_ANALOG
 
 config SND_SOC_RK3399_GRU_SOUND
 	tristate "ASoC support multiple codecs for Rockchip RK3399 GRU boards"
-	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && CLKDEV_LOOKUP && SPI
+	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK && SPI
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5514
-- 
2.29.2

