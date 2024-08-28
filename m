Return-Path: <linux-mips+bounces-5157-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07824962A1F
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 16:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8BB22861AA
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 14:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6A9199FB9;
	Wed, 28 Aug 2024 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4KCIPUj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2096189512;
	Wed, 28 Aug 2024 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855163; cv=none; b=TMzXH0AXVjIbwY75rzNXFJvCvOqcrgsZ5GicmFMZVZH2VmhsWivf3XkKTp8To3B5xkev7xiu0O/4BrgOOi4UhA+HI9Mjm7nT1xvS8g/3K74gb8mmfODPT6cTM5bH6YxHeGidaDczUTSGwRX69w/SxuOCfjQNr42GgUTBbv/o4Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855163; c=relaxed/simple;
	bh=yU5WIK6BIkbyOwE3GLh6HhhYOjF54mrhGpUrqhf5QJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADeGglet/67tpwZ2qjUNpJ/31a2h0CbeaLIeUvCee2VfcQK7eFlIKAqwamUmEVqjXfNj9WxJVDuih7mukwFMQ+NsNiA61SihI2dCRoyghupKRvrBNQAMr51YS26gCC3LM67/2HMR6w5RxmLW6SuLXLzDDyEz17Aq5Uo4ZZL6CLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4KCIPUj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724855162; x=1756391162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yU5WIK6BIkbyOwE3GLh6HhhYOjF54mrhGpUrqhf5QJ8=;
  b=C4KCIPUjm18haNAn1LUG9EcJ1awb5xwcxAbtWn8yfpBfjLk9wy9joFVY
   hMoVmiMgzZf2V0f+nn4cgt3V7gFoCjFdvUuyT6QpnrO3pBVgMMAcIuBLf
   JyzqY/ANVscclulhCvcpC/3/xw8sBfqINtRGkvdkfQvXgNUFjZj/cT0oI
   4kbIjytc1897RtuFNKrXbPrb+ODyNFWSNafejN8OAFvbtEFmvW6dCe/ys
   UOnOicNxT6ASTH+0XkgEDPHcx+qgpg3K72AMbJc8lSGo/FGwFwZ/Lqrsv
   A7yXjaw8hZ9lrmgagaMdqdJQl10rxuQgt5bjDIqMD0lc0FCbSxmwlnLFf
   A==;
X-CSE-ConnectionGUID: d3JVgKz3TDy5NTu+ShNPKw==
X-CSE-MsgGUID: MPoEvuSvS/m9yKzLzvegqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23575174"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23575174"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 07:26:00 -0700
X-CSE-ConnectionGUID: lBon98/0R/2TP/tuD79jbA==
X-CSE-MsgGUID: nMtBCdoiQM2p+v3YgGxGyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="94047452"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 28 Aug 2024 07:25:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0A707118; Wed, 28 Aug 2024 17:25:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/2] gpiolib: legacy: Kill GPIOF_INIT_* definitions
Date: Wed, 28 Aug 2024 17:23:57 +0300
Message-ID: <20240828142554.2424189-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
References: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Besides the fact that (old) drivers use wrong definitions, e.g.,
GPIOF_INIT_HIGH instead of GPIOF_OUT_INIT_HIGH, shrink the legacy
definitions by killing those GPIOF_INIT_* completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/mach-ep93xx/vision_ep9307.c      | 3 +--
 arch/mips/bcm63xx/boards/board_bcm963xx.c | 2 +-
 drivers/gpio/gpiolib-legacy.c             | 3 +--
 include/linux/gpio.h                      | 7 ++-----
 4 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-ep93xx/vision_ep9307.c b/arch/arm/mach-ep93xx/vision_ep9307.c
index 9471938df64c..02c5a4724192 100644
--- a/arch/arm/mach-ep93xx/vision_ep9307.c
+++ b/arch/arm/mach-ep93xx/vision_ep9307.c
@@ -76,8 +76,7 @@ static int vision_lcd_setup(struct platform_device *pdev)
 {
 	int err;
 
-	err = gpio_request_one(VISION_LCD_ENABLE, GPIOF_INIT_HIGH,
-				dev_name(&pdev->dev));
+	err = gpio_request_one(VISION_LCD_ENABLE, GPIOF_OUT_INIT_HIGH, dev_name(&pdev->dev));
 	if (err)
 		return err;
 
diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 99f321b6e417..9cc8fbf218a5 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -42,7 +42,7 @@ static struct board_info __initdata board_cvg834g = {
 	.expected_cpu_id = 0x3368,
 
 	.ephy_reset_gpio = 36,
-	.ephy_reset_gpio_flags = GPIOF_INIT_HIGH,
+	.ephy_reset_gpio_flags = GPIOF_OUT_INIT_HIGH,
 	.has_pci = 1,
 	.has_uart0 = 1,
 	.has_uart1 = 1,
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index d27142418f9f..51d5fe203111 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -46,8 +46,7 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 	if (flags & GPIOF_DIR_IN)
 		err = gpiod_direction_input(desc);
 	else
-		err = gpiod_direction_output_raw(desc,
-				(flags & GPIOF_INIT_HIGH) ? 1 : 0);
+		err = gpiod_direction_output_raw(desc, !!(flags & GPIOF_OUT_INIT_HIGH));
 
 	if (err)
 		goto free_gpio;
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 063f71b18a7c..4af8ad114557 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -20,12 +20,9 @@ struct device;
 #define GPIOF_DIR_OUT	(0 << 0)
 #define GPIOF_DIR_IN	(1 << 0)
 
-#define GPIOF_INIT_LOW	(0 << 1)
-#define GPIOF_INIT_HIGH	(1 << 1)
-
 #define GPIOF_IN		(GPIOF_DIR_IN)
-#define GPIOF_OUT_INIT_LOW	(GPIOF_DIR_OUT | GPIOF_INIT_LOW)
-#define GPIOF_OUT_INIT_HIGH	(GPIOF_DIR_OUT | GPIOF_INIT_HIGH)
+#define GPIOF_OUT_INIT_LOW	(GPIOF_DIR_OUT | (0 << 1))
+#define GPIOF_OUT_INIT_HIGH	(GPIOF_DIR_OUT | (1 << 1))
 
 /* Gpio pin is active-low */
 #define GPIOF_ACTIVE_LOW        (1 << 2)
-- 
2.43.0.rc1.1336.g36b5255a03ac


