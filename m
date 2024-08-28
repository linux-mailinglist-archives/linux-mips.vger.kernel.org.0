Return-Path: <linux-mips+bounces-5156-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12C962A1D
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 16:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE52C1F23A91
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 14:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159A818C91A;
	Wed, 28 Aug 2024 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7pI/03D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27F5176259;
	Wed, 28 Aug 2024 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724855163; cv=none; b=ZeOPJu+z4WsCE292mgOBqCkg9b6xrKmB9hjlYaYXk7HwKgsEvh14DaEtmhQHpQsTqS+tWIYLsOjtPYzT+xWLJ4zPkxkinrQoJBH4J7HI4jEhk2XR6IebolmiXAAW2pb43dabA8AuidHRZjfe1lJGCf5lJ0HBVI82J81DcVw9bt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724855163; c=relaxed/simple;
	bh=b+YH70YKIG5Ozic9cP8h4si5TZhR2H4rU94oHvsAHFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAZGycpRlajQr0J3P3s7FbymGUTgQ8rwNyKCfzv7cY+j3xa6GUi5d79rjtlVSxPCctF6Q8LEPsWiDb02bPQ5gYPgp7482HHO6ZDu0DL4EcZYWjhxpqsaKPO17Nzn5GPakYnWxAC+amvxyO8DqAb+5FFrpFXbo5WgbB3NzXSMvug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7pI/03D; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724855161; x=1756391161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b+YH70YKIG5Ozic9cP8h4si5TZhR2H4rU94oHvsAHFQ=;
  b=T7pI/03D8yZ2s1ABL8ALj4BEhoGoTqXxDo7+iWG0QuCiCqgVyGgmxx7z
   Uh3sig4ekDc/tVDIxnB08n20TBo2pAqjwCQ7oF1F8ap/i2K53RQ4aBgZ3
   ZgKSXKYIOzfseRj2jN7b9QKadV+yLTeFSaWoI+N8ZGA8jQEc1L1QaNOGe
   Vp0VEsj1HCONEgf1PBudfGusqiJyQVsr3dWURnl7S8gnKodbvw7+MSX/p
   ohWag7VmVbMyXqp7lhoNUxhnRWmopNhpjYn8W1QYxifmXmAgR/uyP3bD2
   +EMLhRNcPnjn4U4fV9I45tRvBR97ioBm99cuK+KM8Ov6v8oRWLsqs08KI
   g==;
X-CSE-ConnectionGUID: aYfDlCx8Q2WE3y3jIpyZ9w==
X-CSE-MsgGUID: Ild6WIUMTRWvBKLMzNFbvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23274783"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23274783"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 07:26:00 -0700
X-CSE-ConnectionGUID: +tK0UVQLSImmEQhoKK8oDA==
X-CSE-MsgGUID: FVejs9rTQjmtlnD+HrsDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="68086592"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 28 Aug 2024 07:25:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 16A6A2E6; Wed, 28 Aug 2024 17:25:56 +0300 (EEST)
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
Subject: [PATCH v1 2/2] gpiolib: legacy: Kill GPIOF_DIR_* definitions
Date: Wed, 28 Aug 2024 17:23:58 +0300
Message-ID: <20240828142554.2424189-3-andriy.shevchenko@linux.intel.com>
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
GPIOF_DIR_IN instead of GPIOF_IN, shrink the legacy definitions
by killing those GPIOF_DIR_* completely.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/mach-ep93xx/vision_ep9307.c | 3 +--
 drivers/gpio/gpiolib-legacy.c        | 2 +-
 include/linux/gpio.h                 | 9 +++------
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-ep93xx/vision_ep9307.c b/arch/arm/mach-ep93xx/vision_ep9307.c
index 02c5a4724192..85f0dd7255a9 100644
--- a/arch/arm/mach-ep93xx/vision_ep9307.c
+++ b/arch/arm/mach-ep93xx/vision_ep9307.c
@@ -292,8 +292,7 @@ static void __init vision_init_machine(void)
 	 * Request the gpio expander's interrupt gpio line now to prevent
 	 * the kernel from doing a WARN in gpiolib:gpio_ensure_requested().
 	 */
-	if (gpio_request_one(EP93XX_GPIO_LINE_F(7), GPIOF_DIR_IN,
-				"pca9539:74"))
+	if (gpio_request_one(EP93XX_GPIO_LINE_F(7), GPIOF_IN, "pca9539:74"))
 		pr_warn("cannot request interrupt gpio for pca9539:74\n");
 
 	vision_i2c_info[1].irq = gpio_to_irq(EP93XX_GPIO_LINE_F(7));
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 51d5fe203111..087fe3227e35 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -43,7 +43,7 @@ int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
 	if (flags & GPIOF_ACTIVE_LOW)
 		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
 
-	if (flags & GPIOF_DIR_IN)
+	if (flags & GPIOF_IN)
 		err = gpiod_direction_input(desc);
 	else
 		err = gpiod_direction_output_raw(desc, !!(flags & GPIOF_OUT_INIT_HIGH));
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 4af8ad114557..2d105be7bbc3 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -17,12 +17,9 @@
 struct device;
 
 /* make these flag values available regardless of GPIO kconfig options */
-#define GPIOF_DIR_OUT	(0 << 0)
-#define GPIOF_DIR_IN	(1 << 0)
-
-#define GPIOF_IN		(GPIOF_DIR_IN)
-#define GPIOF_OUT_INIT_LOW	(GPIOF_DIR_OUT | (0 << 1))
-#define GPIOF_OUT_INIT_HIGH	(GPIOF_DIR_OUT | (1 << 1))
+#define GPIOF_IN		((1 << 0))
+#define GPIOF_OUT_INIT_LOW	((0 << 0) | (0 << 1))
+#define GPIOF_OUT_INIT_HIGH	((0 << 0) | (1 << 1))
 
 /* Gpio pin is active-low */
 #define GPIOF_ACTIVE_LOW        (1 << 2)
-- 
2.43.0.rc1.1336.g36b5255a03ac


