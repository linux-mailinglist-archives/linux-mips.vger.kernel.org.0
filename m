Return-Path: <linux-mips+bounces-10045-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28109B1EB7F
	for <lists+linux-mips@lfdr.de>; Fri,  8 Aug 2025 17:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D50815A15E6
	for <lists+linux-mips@lfdr.de>; Fri,  8 Aug 2025 15:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E5E28369A;
	Fri,  8 Aug 2025 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRI/MDRQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D6C283141;
	Fri,  8 Aug 2025 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666394; cv=none; b=BwWuWRAu3jeCOJLHkp4ENqZvO7HjnvX6fQBxNQOtzm6mLwHuZCWy3lmLt92zs/tB5VT9kkYhCJN53oogc856Gp+QF/MJ1L/d144mVcqAeN+RMNMcVHnHyL6y9QWpEJFkT62XUWL0wQ0r2ghwc7UqkGv7NvJOXu8boRwGup4VcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666394; c=relaxed/simple;
	bh=jrVReShttlw4WSCG9fL1fq8w/f/q4FwWTmPVMp4s4uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tXWD/jLwehkE45hNRF7FmHUtqfxtWyIjgdGoV+alc68f96CxhWSBVo0CuS4zPu+YO+UdSEFKkiRq5VbsIpV06IaM8TKCIHuj8r+xFpAhbDWMTGgDSD0xKz3lKbd/eqq5ZzWroAQduOf9CfnhY3jfq6wY8UddSFd+VZLtrA8aYVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRI/MDRQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C509EC4CEF4;
	Fri,  8 Aug 2025 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666393;
	bh=jrVReShttlw4WSCG9fL1fq8w/f/q4FwWTmPVMp4s4uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TRI/MDRQD/kmJpJT7zK8JUMsUT6WicR1LCz6OLha8IFsvJQXXxQQ/MQFNnfRxLH2B
	 DQ1GygEY6m5sjY7h3QyDwx2J+gTDn/Ztbivh/+N0ktALuqc0uCMUiwXwJtXdrFd437
	 P8Vf4HEJmo6JJM07KU25taUl7eu7f1IVH7H7dOexAPdlzMqODTgwUkvwc812VB7jIR
	 C9hGmviJJq4tr57qPYJL3ts7Mz20iegMlC9uv/FsOSiqRn6+LX2gofBrdPhda3h1HO
	 QojBpK8WyGTD569K96ma57Rc+QJM6y1FTmdrxJjA8ZeVYDRDpb8/cYdmUGbwCsqn/+
	 dS5qW/6ezOCsQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Eric Biggers <ebiggers@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Dave Vasilevsky <dave@vasilevsky.ca>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/21] mips: select legacy gpiolib interfaces where used
Date: Fri,  8 Aug 2025 17:17:47 +0200
Message-Id: <20250808151822.536879-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A few old machines have not been converted away from the old-style
gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
symbol so the code still works where it is needed but can be left
out otherwise.

This is the list of all gpio_request() calls in mips:

  arch/mips/alchemy/board-mtx1.c: rc = gpio_request(mtx1_gpio_button[0].gpio,
  arch/mips/alchemy/devboards/db1000.c:           gpio_request(19, "sd0_cd");
  arch/mips/alchemy/devboards/db1000.c:           gpio_request(20, "sd1_cd");
  arch/mips/alchemy/devboards/db1200.c:   gpio_request(215, "otg-vbus");
  arch/mips/bcm47xx/workarounds.c:        err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
  arch/mips/bcm63xx/boards/board_bcm963xx.c:              gpio_request_one(board.ephy_reset_gpio,
  arch/mips/txx9/rbtx4927/setup.c:        gpio_request(15, "sio-dtr");

Most of these should be easy enough to change to modern gpio descriptors
or remove if they are no longer in use.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig         | 5 +++++
 arch/mips/alchemy/Kconfig | 1 -
 arch/mips/txx9/Kconfig    | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index caf508f6e9ec..27f16c5b112a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -205,6 +205,8 @@ config MIPS_ALCHEMY
 	select CSRC_R4K
 	select IRQ_MIPS_CPU
 	select DMA_NONCOHERENT		# Au1000,1500,1100 aren't, rest is
+	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_FIXUP_BIGPHYS_ADDR if PCI
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_SUPPORTS_32BIT_KERNEL
@@ -306,6 +308,7 @@ config BCM47XX
 	select SYS_HAS_EARLY_PRINTK
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select LEDS_GPIO_REGISTER
 	select BCM47XX_NVRAM
 	select BCM47XX_SPROM
@@ -329,6 +332,7 @@ config BCM63XX
 	select SYS_HAS_CPU_BMIPS4380
 	select SWAP_IO_SPACE
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_L1_CACHE_SHIFT_4
 	select HAVE_LEGACY_CLK
 	help
@@ -981,6 +985,7 @@ config MIKROTIK_RB532
 	select SWAP_IO_SPACE
 	select BOOT_RAW
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_L1_CACHE_SHIFT_4
 	help
 	  Support the Mikrotik(tm) RouterBoard 532 series,
diff --git a/arch/mips/alchemy/Kconfig b/arch/mips/alchemy/Kconfig
index 6ca81e1bd35c..cf5ad52c0a0f 100644
--- a/arch/mips/alchemy/Kconfig
+++ b/arch/mips/alchemy/Kconfig
@@ -12,7 +12,6 @@ config MIPS_MTX1
 
 config MIPS_DB1XXX
 	bool "Alchemy DB1XXX / PB1XXX boards"
-	select GPIOLIB
 	select HAVE_PCI
 	select HAVE_PATA_PLATFORM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
diff --git a/arch/mips/txx9/Kconfig b/arch/mips/txx9/Kconfig
index 7335efa4d528..92b759a434c0 100644
--- a/arch/mips/txx9/Kconfig
+++ b/arch/mips/txx9/Kconfig
@@ -37,6 +37,7 @@ config SOC_TX4927
 	select IRQ_TXX9
 	select PCI_TX4927
 	select GPIO_TXX9
+	select GPIOLIB_LEGACY
 
 config SOC_TX4938
 	bool
-- 
2.39.5


