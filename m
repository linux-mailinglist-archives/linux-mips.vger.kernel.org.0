Return-Path: <linux-mips+bounces-4074-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BBA91EB8E
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jul 2024 01:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75E321F22626
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2024 23:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D046172BDB;
	Mon,  1 Jul 2024 23:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcvQQSxV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74231172BD3;
	Mon,  1 Jul 2024 23:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719877727; cv=none; b=odtXYHPkmgQ2FePiY4UGu+uemuJ75SMCOuqZqJWpd6ORReX/ecN6KxkyinJq6yDzwkyAgkQtXUeJvo9RpQn+SImAsuJKnrlx+AgXUb/FIYtIQFOcf5Fo4iIpKc4a+MsbnxlpgL1yU+38g26Vj23zVIaMB8cjepnIVjKm4KnotsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719877727; c=relaxed/simple;
	bh=AUu9n3+gf/ago1XvXDJqqN0nBQklvTL5cSQeD9g1dwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TO5dDoI11PR8rEVHOSJOf4YGmSX2eMN7k77AM5jOZl/FB4jrTbuvn9SjlPHQWoLcCWaykvCqHjJQyb5R67TYmArN1HPDnVKSeCibz9iWFwtyVA0zu+FrItbiO9AdIkdiDF0oQEZ/xG18ekcqBaEOuXG9DoawCdqriHB4GoRjDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcvQQSxV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2c7dbdc83bfso2472708a91.1;
        Mon, 01 Jul 2024 16:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719877726; x=1720482526; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqEI0/qcCzLh5PgYyZw5q5cycxW8UUJmCleLEvCVlTk=;
        b=JcvQQSxVSdLJVBT2H/s+wQCOQfpf324QS3NhLKE7n8cu9azCdvapulvlTvu7KS+70p
         2DN96+GYI/bD5K6E+8dp6PlUIAnZ9hUMbfDgOd/b/Mg9euWA1pvDqh54XnjWpwwjZKhB
         lKJxlZyUhtqxJiDK+yuw4tfOT8Te7PwjomPi3GBPAcZ/qQk0pD/DCadonA9AZ70Ieefn
         JQZbjbgPHwNDmyOdqlgBaFVBnmFFvuzJADpH9OTXUMAWb7LMkAzIGxZJA4GE8Wcarg7t
         qqruWnhjLBwwL+PWhry6jR3vBo7tM2M8E4OJjybnGiNzLCBhEnhpF4fd/u1fb46j9H5e
         fKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719877726; x=1720482526;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqEI0/qcCzLh5PgYyZw5q5cycxW8UUJmCleLEvCVlTk=;
        b=ka/BhvIxxK6AgSD6chUT8tgZAAVPPIiBMka2Ch9NYRTGmeZHahOCowiJqSyMnGnO3Y
         +pXrs/EKloU8x1U3+19XR2Tt66N3/ItnmMDz52Du43P0XUXYgzFF5owCOx234xGPzrls
         qSAneDiYPhB4mmeouvB/KQc9sP3CyNuB+pYmFgH5yhaRgnHIyJUsXHQqWpDQiDzlw9bc
         LXx70YMTbthuBAxjC/LMK+UzHVmAEheDZzb8SSQ5FUkTOa2K63QiQbcWR9xwZuR+7bNw
         XUZ81ZFekzCtHtXLU3xECGM7RMupy+tih7LJxlLPpKWF5NnudJlANkzAtKwVDRJu+uWy
         tYbg==
X-Forwarded-Encrypted: i=1; AJvYcCXgSG+33b5lAwM8lftIBZq060jG3IEQh+bvfKPc52I0RUfjsWaKywg06K3O5Aki8KQCgApnuvfMDe2oHRKxlZMaw2iT/t6JnML0uTSDWewbqFQmoGwDdRPGmPmsS6eTqZYVyNX4t3kihw==
X-Gm-Message-State: AOJu0YySjN0AozXqq8OBxK0BD/BxF8kldUmmR9gIDHv/mdZtoU2uXNDs
	7h0Ix0qg6YoVpHm8OCViD8P9sigidWMmDvwnMDVjbXW+IlQeuKth
X-Google-Smtp-Source: AGHT+IEvkRsgX9vmA7/Q5sLCTHdbC/llDFxDGVa5yhKbL0ZjXFWsgDrpdrFFrEn69a2BSN8VQIkhLA==
X-Received: by 2002:a17:90a:b790:b0:2c1:a9a2:fcea with SMTP id 98e67ed59e1d1-2c93d71f7edmr5221323a91.24.1719877725560;
        Mon, 01 Jul 2024 16:48:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:97a3:bdcc:1a3b:f207])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce6ec6asm7467437a91.26.2024.07.01.16.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 16:48:45 -0700 (PDT)
Date: Mon, 1 Jul 2024 16:48:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Martin Schiller <ms@dev.tdt.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Alchemy: switch to use software nodes for GPIOs
Message-ID: <ZoNAWoJ12DyApZ1s@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Switch to use software nodes/properties to describe GPIOs for the
ADS7846 touchscreen and the SPI controller (away from using GPIO lookup
tables). This allows removing use of ADS7846 platform data, which will
be going away.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Compiled only, as I do not have access to the hardware. However I would
very much like to get rid of ads7846_platform_data from the
kernel/ads7846 driver, and this is one of the last 3 users of it.

 arch/mips/alchemy/devboards/db1000.c | 80 +++++++++++++++-------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 7b9f91db227f..6984cd5169b5 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -10,15 +10,16 @@
 #include <linux/dma-mapping.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/leds.h>
 #include <linux/mmc/host.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/pm.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi_gpio.h>
-#include <linux/spi/ads7846.h>
 #include <asm/mach-au1x00/au1000.h>
 #include <asm/mach-au1x00/gpio-au1000.h>
 #include <asm/mach-au1x00/au1000_dma.h>
@@ -374,22 +375,20 @@ static struct platform_device db1100_mmc1_dev = {
 
 /******************************************************************************/
 
-static struct ads7846_platform_data db1100_touch_pd = {
-	.model		= 7846,
-	.vref_mv	= 3300,
+static const struct software_node db1100_alchemy2_gpiochip = {
+	.name	= "alchemy-gpio2",
 };
 
-static struct spi_gpio_platform_data db1100_spictl_pd = {
-	.num_chipselect = 1,
+static const struct property_entry db1100_ads7846_properties[] = {
+	PROPERTY_ENTRY_U16("ti,vref_min", 3300),
+	PROPERTY_ENTRY_GPIO("pendown-gpios",
+			    &db1100_alchemy2_gpiochip, 21, GPIO_ACTIVE_LOW),
+	{ }
 };
 
-static struct gpiod_lookup_table db1100_touch_gpio_table = {
-	.dev_id = "spi0.0",
-	.table = {
-		GPIO_LOOKUP("alchemy-gpio2", 21,
-			    "pendown", GPIO_ACTIVE_LOW),
-		{ }
-	},
+static const struct software_node db1100_ads7846_swnode = {
+	.name		= "ads7846",
+	.properties	= db1100_ads7846_properties,
 };
 
 static struct spi_board_info db1100_spi_info[] __initdata = {
@@ -400,37 +399,37 @@ static struct spi_board_info db1100_spi_info[] __initdata = {
 		.chip_select	 = 0,
 		.mode		 = 0,
 		.irq		 = AU1100_GPIO21_INT,
-		.platform_data	 = &db1100_touch_pd,
+		.swnode		 = &db1100_ads7846_swnode,
 	},
 };
 
-static struct platform_device db1100_spi_dev = {
-	.name		= "spi_gpio",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &db1100_spictl_pd,
-		.dma_mask		= &au1xxx_all_dmamask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-	},
+static const struct spi_gpio_platform_data db1100_spictl_pd __initconst = {
+	.num_chipselect = 1,
 };
 
 /*
  * Alchemy GPIO 2 has its base at 200 so the GPIO lines
  * 207 thru 210 are GPIOs at offset 7 thru 10 at this chip.
  */
-static struct gpiod_lookup_table db1100_spi_gpiod_table = {
-	.dev_id         = "spi_gpio",
-	.table          = {
-		GPIO_LOOKUP("alchemy-gpio2", 9,
-			    "sck", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("alchemy-gpio2", 8,
-			    "mosi", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("alchemy-gpio2", 7,
-			    "miso", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("alchemy-gpio2", 10,
-			    "cs", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry db1100_spi_dev_properties[] __initconst = {
+	PROPERTY_ENTRY_GPIO("miso-gpios",
+			    &db1100_alchemy2_gpiochip, 7, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mosi-gpios",
+			    &db1100_alchemy2_gpiochip, 8, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("sck-gpios",
+			    &db1100_alchemy2_gpiochip, 9, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("cs-gpios",
+			    &db1100_alchemy2_gpiochip, 10, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct platform_device_info db1100_spi_dev_info __initconst = {
+	.name		= "spi_gpio",
+	.id		= 0,
+	.data		= &db1100_spictl_pd,
+	.size_data	= sizeof(db1100_spictl_pd),
+        .dma_mask	= DMA_BIT_MASK(32),
+	.properties	= db1100_spi_dev_properties,
 };
 
 static struct platform_device *db1x00_devs[] = {
@@ -452,8 +451,10 @@ int __init db1000_dev_setup(void)
 {
 	int board = BCSR_WHOAMI_BOARD(bcsr_read(BCSR_WHOAMI));
 	int c0, c1, d0, d1, s0, s1, flashsize = 32,  twosocks = 1;
+	int err;
 	unsigned long pfc;
 	struct clk *c, *p;
+	struct platform_device *spi_dev;
 
 	if (board == BCSR_WHOAMI_DB1500) {
 		c0 = AU1500_GPIO2_INT;
@@ -480,7 +481,7 @@ int __init db1000_dev_setup(void)
 		pfc |= (1 << 0);	/* SSI0 pins as GPIOs */
 		alchemy_wrsys(pfc, AU1000_SYS_PINFUNC);
 
-		gpiod_add_lookup_table(&db1100_touch_gpio_table);
+		software_node_register(&db1100_alchemy2_gpiochip);
 		spi_register_board_info(db1100_spi_info,
 					ARRAY_SIZE(db1100_spi_info));
 
@@ -497,8 +498,11 @@ int __init db1000_dev_setup(void)
 			clk_put(p);
 
 		platform_add_devices(db1100_devs, ARRAY_SIZE(db1100_devs));
-		gpiod_add_lookup_table(&db1100_spi_gpiod_table);
-		platform_device_register(&db1100_spi_dev);
+
+		spi_dev = platform_device_register_full(&db1100_spi_dev_info);
+		err = PTR_ERR_OR_ZERO(spi_dev);
+		if (err)
+			pr_err("failed to register SPI controller: %d\n", err);
 	} else if (board == BCSR_WHOAMI_DB1000) {
 		c0 = AU1000_GPIO2_INT;
 		c1 = AU1000_GPIO5_INT;
-- 
2.45.2.803.g4e1b14247a-goog


-- 
Dmitry

