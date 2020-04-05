Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 433D219E8A3
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 04:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgDECvv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 22:51:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:44900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbgDECv2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 4 Apr 2020 22:51:28 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 270B72071C;
        Sun,  5 Apr 2020 02:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586055087;
        bh=7/mk5nhbYlK2lV6RqDXeYilUo/FagBsJpE8ZMcUmcnc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xkNzLNNtjg6WJY1qbDb0lU0swwYJeJwqLOZt6FP534QQTgwLkk1sVnaINND7RP3ZI
         aF8FbfB9gYTTou7NAXQgpUNZiXrF3Jra3jADkerzKLjhci8tnZXkc1i1KaDBVXS6yY
         63165fNYAFlYEeP9Ll8MJRoGq91epkk4eHl3JG6c=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
        linux-m68k@lists.linux-m68k.org,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org
Subject: [PATCH 6/9] clk: Allow the common clk framework to be selectable
Date:   Sat,  4 Apr 2020 19:51:20 -0700
Message-Id: <20200405025123.154688-7-sboyd@kernel.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200405025123.154688-1-sboyd@kernel.org>
References: <20200405025123.154688-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable build testing and configuration control of the common clk
framework so that more code coverage and testing can be done on the
common clk framework across various architectures. This also nicely
removes the requirement that architectures must select the framework
when they don't use it in architecture code.

There's one snag with doing this, and that's making sure that randconfig
builds don't select this option when some architecture or platform
implements 'struct clk' outside of the common clk framework. Introduce a
new config option 'HAVE_LEGACY_CLK' to indicate those platforms that
haven't migrated to the common clk framework and therefore shouldn't be
allowed to select this new config option. Also add a note that we hope
one day to remove this config entirely.

Based on a patch by Mark Brown <broonie@kernel.org>.

Cc: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Salter <msalter@redhat.com>
Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Guan Xuetao <gxt@pku.edu.cn>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: <linux-mips@vger.kernel.org>
Cc: <linux-c6x-dev@linux-c6x.org>
Cc: <linux-m68k@lists.linux-m68k.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-sh@vger.kernel.org>
Link: https://lore.kernel.org/r/1470915049-15249-1-git-send-email-broonie@kernel.org
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/arm/Kconfig              |  2 ++
 arch/c6x/Kconfig              |  1 +
 arch/m68k/Kconfig.cpu         |  2 +-
 arch/mips/Kconfig             |  6 ++++--
 arch/mips/loongson2ef/Kconfig |  2 +-
 arch/sh/boards/Kconfig        |  5 +++++
 arch/unicore32/Kconfig        |  2 +-
 drivers/clk/Kconfig           | 17 +++++++++++++----
 8 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index eeabdc5a3dd2..0606e1bbd7b6 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -364,6 +364,7 @@ config ARCH_EP93XX
 	select CPU_ARM920T
 	select GENERIC_CLOCKEVENTS
 	select GPIOLIB
+	select HAVE_LEGACY_CLK
 	help
 	  This enables support for the Cirrus EP93xx series of CPUs.
 
@@ -522,6 +523,7 @@ config ARCH_OMAP1
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GPIOLIB
 	select HAVE_IDE
+	select HAVE_LEGACY_CLK
 	select IRQ_DOMAIN
 	select NEED_MACH_IO_H if PCCARD
 	select NEED_MACH_MEMORY_H
diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
index e65e8d82442a..6444ebfd06a6 100644
--- a/arch/c6x/Kconfig
+++ b/arch/c6x/Kconfig
@@ -11,6 +11,7 @@ config C6X
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select CLKDEV_LOOKUP
+	select HAVE_LEGACY_CLK
 	select GENERIC_ATOMIC64
 	select GENERIC_IRQ_SHOW
 	select HAVE_ARCH_TRACEHOOK
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 60ac1cd8b96f..bd2d29c22a10 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -28,7 +28,7 @@ config COLDFIRE
 	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
 	select GPIOLIB
-	select HAVE_CLK
+	select HAVE_LEGACY_CLK
 
 endchoice
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e53a8dd5c19b..fa02c715ab25 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -181,7 +181,7 @@ config AR7
 	select SYS_SUPPORTS_ZBOOT_UART16550
 	select GPIOLIB
 	select VLYNQ
-	select HAVE_CLK
+	select HAVE_LEGACY_CLK
 	help
 	  Support for the Texas Instruments AR7 System-on-a-Chip
 	  family: TNETD7100, 7200 and 7300.
@@ -296,9 +296,9 @@ config BCM63XX
 	select SYS_HAS_EARLY_PRINTK
 	select SWAP_IO_SPACE
 	select GPIOLIB
-	select HAVE_CLK
 	select MIPS_L1_CACHE_SHIFT_4
 	select CLKDEV_LOOKUP
+	select HAVE_LEGACY_CLK
 	help
 	  Support for BCM63XX based boards
 
@@ -419,6 +419,7 @@ config LANTIQ
 	select SWAP_IO_SPACE
 	select BOOT_RAW
 	select CLKDEV_LOOKUP
+	select HAVE_LEGACY_CLK
 	select USE_OF
 	select PINCTRL
 	select PINCTRL_LANTIQ
@@ -656,6 +657,7 @@ config RALINK
 	select SYS_SUPPORTS_MIPS16
 	select SYS_HAS_EARLY_PRINTK
 	select CLKDEV_LOOKUP
+	select HAVE_LEGACY_CLK
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 
diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
index 595dd48e1e4d..c9ec43afde73 100644
--- a/arch/mips/loongson2ef/Kconfig
+++ b/arch/mips/loongson2ef/Kconfig
@@ -46,7 +46,7 @@ config LEMOTE_MACH2F
 	select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
 	select DMA_NONCOHERENT
 	select GENERIC_ISA_DMA_SUPPORT_BROKEN
-	select HAVE_CLK
+	select HAVE_LEGACY_CLK
 	select FORCE_PCI
 	select I8259
 	select IRQ_MIPS_CPU
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index cee24c308337..fb0ca0c1efe1 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -7,6 +7,11 @@ config SOLUTION_ENGINE
 config SH_ALPHA_BOARD
 	bool
 
+config SH_CUSTOM_CLK
+	def_bool y
+	depends on !SH_DEVICE_TREE
+	select HAVE_LEGACY_CLK
+
 config SH_DEVICE_TREE
 	bool
 	select OF
diff --git a/arch/unicore32/Kconfig b/arch/unicore32/Kconfig
index 41fe944005f8..11ba1839d198 100644
--- a/arch/unicore32/Kconfig
+++ b/arch/unicore32/Kconfig
@@ -70,7 +70,7 @@ config ARCH_PUV3
 	def_bool y
 	select CPU_UCV2
 	select GENERIC_CLOCKEVENTS
-	select HAVE_CLK
+	select HAVE_LEGACY_CLK
 	select GPIOLIB
 
 # CONFIGs for ARCH_PUV3
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index bcb257baed06..890bed62196d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -7,8 +7,18 @@ config CLKDEV_LOOKUP
 config HAVE_CLK_PREPARE
 	bool
 
-config COMMON_CLK
+config HAVE_LEGACY_CLK # TODO: Remove once all legacy users are migrated
 	bool
+	select HAVE_CLK
+	help
+	  Select this option when the clock API in <linux/clk.h> is implemented
+	  by platform/architecture code. This method is deprecated. Modern
+	  code should select COMMON_CLK instead and not define a custom
+	  'struct clk'.
+
+menuconfig COMMON_CLK
+	bool "Common Clock Framework"
+	depends on !HAVE_LEGACY_CLK
 	select HAVE_CLK_PREPARE
 	select CLKDEV_LOOKUP
 	select SRCU
@@ -20,8 +30,7 @@ config COMMON_CLK
 	  Architectures utilizing the common struct clk should select
 	  this option.
 
-menu "Common Clock Framework"
-	depends on COMMON_CLK
+if COMMON_CLK
 
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
@@ -362,4 +371,4 @@ source "drivers/clk/ti/Kconfig"
 source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
 
-endmenu
+endif
-- 
Sent by a computer, using git, on the internet

