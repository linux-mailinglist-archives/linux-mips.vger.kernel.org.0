Return-Path: <linux-mips+bounces-10185-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9CAB21884
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 00:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3E941900A6C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 22:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6852D77E1;
	Mon, 11 Aug 2025 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tgi76vRO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A721CFF6;
	Mon, 11 Aug 2025 22:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754952093; cv=none; b=Hz0T1RjnLPvl/DqszQUxYjQ4hwl/7HJR19z+OP9I9jzV0T6ogWNeXJRwp7sArbUJ6PKX3hP71tXK8WIPDJkuKppWAkvJnLWYBCPvgmZnULPg/Bi0AgKRzGodaMsj6HkzSoJ9YaFVN6Dtf55DOMnZGwZVB0LO4Pv515fdCrugeB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754952093; c=relaxed/simple;
	bh=xqPJ/VTtLX9Cuigf+Ig3YwMvQkrcP37tZGWCCGyEH5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6BmlE0BKF7c7QUbZPGB4n5GbO1OXpjqpvi+Fnr14/Dh9QA/o1BtNv5WV8PpCdmt8/T04+GyylXxNlv/1AYA+x2zgdcAlwLJryNpPYrtNEugnFXo7ZmQOBpyZYc78fJgPPqA2pSEiZrxhCzg+3xKKOkMlcUP4iVEk1zFNIlTB/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tgi76vRO; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b3226307787so3893917a12.1;
        Mon, 11 Aug 2025 15:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754952091; x=1755556891; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+n3I1BPAT6MGT096v+1ws6JTJrXEWDdfc2ydYDb0qS0=;
        b=Tgi76vROur7pc6b0kLmQaP0Nyw8nqs6x+mzwGmdrQiK3olD2u0UB9xknFYuX0DDuRV
         Mmhq3k/0PPfLYhdZljSJeNG4OQgB/00xrR/YP5ei6AN1xN/WgJudS7YhfD7ItCy79aZl
         t+H+/P6yH1hZqGPwtIAkN86IsBEhY9nYI0+mBCwLrr6Fl4I4o+AIUOS/YBs5uZpk5sI7
         2RD/u+iuqB6qfxXmAYJOiwdDRHKg8/mOdzu9Yi9mtU7MQYx74jtIvVdRWya85bPCamJy
         dAAtxAbuGwUGEB95umT2h2/ozwp94mgme8LxAuezqxzEh1z8pRdIq1ZIlVmJEV9vweHD
         2COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754952091; x=1755556891;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+n3I1BPAT6MGT096v+1ws6JTJrXEWDdfc2ydYDb0qS0=;
        b=JQsrr+qhDAfBil6aBTE8805f8rUAi6N4a/wlTLCipEiig5Sf2Xg8FvwubTrqoSolUI
         MAP5IOc7C3uudW5l2OyjNdtQdWuqr4MDbitugGN2MqbmprQjH+Ih2mcK8bUTAnXs6vJI
         PwVAs7OgmcYYnDnc7DxfjegIdsnhG3/8epHFYEtNjyjhinutv5BsNPq3+oOdgQ5TjIrp
         xLxVlyNL01dupYr6KpAkXorOyu1v0HkS52Zd+owcdoXuwQojI8YAR56lAoiq/eO8vUtv
         sHz19Q+XY70I8BzBBvAQrSrt3b+HjCtQGM3wbX0Zy9BsmVPzlW1ivk+Nm4EMH9r95L0s
         x+jA==
X-Forwarded-Encrypted: i=1; AJvYcCVvb8J8BhkGWgp1kcCvsMvR/fQxv9T1iNhvRGJNz21bx86DtcnLC0TvR9DIgqDzgxVxjQjODgI7YRrj@vger.kernel.org, AJvYcCW9dYsBCi/AS5vhi6Yq/LrJp4YrRZjKAFvtAplqYKlI+urcA4QqJrV86wBdRb40e0QFJg5HgdEQjrj2skge@vger.kernel.org, AJvYcCXftqPsC6S8OldiR9tKF0Z1YwYdPnA1CVexoO1gBpmSVooo5juA1JWHRZsQaBS98ONSW+PAG4ahk7927A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2SzEoq2z6b5ZhMi08QwFxGAJ+kssnkIgkjWaSKObpfhSsSa+g
	aoBSv/K6a0w5oivn/Osd9/+jL6J4GK/M9swPgTJfBh+0XBu6icUZzWbt
X-Gm-Gg: ASbGnctrIWPHTTJEE8RKHRY0kIzkYsQo4+p6iAYFhpy+P9IXHSsvOLNwvlsQr0zFq0w
	eZ0PvMQqqL04qL9RWz8Vgu2C1/R0nzQGKIR5TYV0KGkzttDRBlQ5O9sevKuPcg0kTy87ikY06BT
	tQbRh3HaxEtlSJ2VqS/c6wACifS5IMC+xf2PzfRzFB9B5Km6oT/0h+KpjSXnxAmyLVDQN5v7xHf
	EongtYyzEUk+QaxI8srWkoQOIfqdsCLhzzoxSjrmO/oO4KfqdCstTE7Pwg5GVQsFbZCCWAJzx76
	Dxd7bJSAJhUutYLsNCO1vwSm3Fk/5ZQ4IGZxCTLLsHixXM1dXUGZRLu7VwblalKjchGk4Tqnx9T
	Gg0WU3pO8cLfiCytIw+DyDGRNCri6+oW3tw==
X-Google-Smtp-Source: AGHT+IEdW2CPHcM2VOBzTnmRYYsEF4NSG7B7RUD3YiYsLp5VPGW27+jPm08vBlgwORSKB7DWAQ2BnQ==
X-Received: by 2002:a17:902:ea11:b0:240:3239:21c7 with SMTP id d9443c01a7336-242c21dcd0bmr211487085ad.37.1754952091138;
        Mon, 11 Aug 2025 15:41:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7933:7499:67d8:279a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm282973375ad.34.2025.08.11.15.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 15:41:30 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:41:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: [PATCH] MIPS: alchemy: mtx1: switch to static device properties
Message-ID: <retzurthfjwc6fqtkta6uhd2xje42vyugryj36yynesvxwygnv@wwmcx2yh4orm>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert GPIO-connected buttons and LEDs on MTX1 board to software
nodes/properties, so that support for platform data can be removed
from gpio-keys driver (which will rely purely on generic device
properties for configuration).

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This compiles but I have not tried it on real hardware.

 arch/mips/alchemy/board-mtx1.c | 181 ++++++++++++++++++++++-----------
 1 file changed, 124 insertions(+), 57 deletions(-)

diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index 68ea57511629..cb6be58808a0 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -9,10 +9,8 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
-#include <linux/leds.h>
-#include <linux/gpio.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/property.h>
 #include <linux/input.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
@@ -80,64 +78,134 @@ void __init board_setup(void)
 
 /******************************************************************************/
 
-static struct gpio_keys_button mtx1_gpio_button[] = {
-	{
-		.gpio = 207,
-		.code = BTN_0,
-		.desc = "System button",
-	}
+static const struct software_node mtx1_gpiochip_node = {
+	.name = "alchemy-gpio2",
 };
 
-static struct gpio_keys_platform_data mtx1_buttons_data = {
-	.buttons = mtx1_gpio_button,
-	.nbuttons = ARRAY_SIZE(mtx1_gpio_button),
+static const struct software_node mtx1_gpio_keys_node = {
+	.name = "mtx1-gpio-keys",
 };
 
-static struct platform_device mtx1_button = {
-	.name = "gpio-keys",
-	.id = -1,
-	.dev = {
-		.platform_data = &mtx1_buttons_data,
-	}
+static const struct property_entry mtx1_button_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", BTN_0),
+	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 7, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "System button"),
+	{ }
 };
 
-static struct gpiod_lookup_table mtx1_wdt_gpio_table = {
-	.dev_id = "mtx1-wdt.0",
-	.table = {
-		/* Global number 215 is offset 15 on Alchemy GPIO 2 */
-		GPIO_LOOKUP("alchemy-gpio2", 15, NULL, GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct software_node mtx1_button_node = {
+	.parent = &mtx1_gpio_keys_node,
+	.properties = mtx1_button_props,
+};
+
+static const struct software_node *mtx1_gpio_keys_swnodes[] __initconst = {
+	&mtx1_gpio_keys_node,
+	&mtx1_button_node,
+	NULL
 };
 
-static struct platform_device mtx1_wdt = {
+static void __init mtx1_keys_init(void)
+{
+	struct platform_device_info keys_info = {
+		.name	= "gpio-keys",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(mtx1_gpio_keys_swnodes);
+	if (err) {
+		pr_err("failed to register gpio-keys software nodes: %d\n", err);
+		return;
+	}
+
+	keys_info.fwnode = software_node_fwnode(&mtx1_gpio_keys_node);
+
+	pd = platform_device_register_full(&keys_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create gpio-keys device: %d\n", err);
+}
+
+/* Global number 215 is offset 15 on Alchemy GPIO 2 */
+static const struct property_entry mtx1_wdt_props[] = {
+	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 15, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static struct platform_device_info mtx1_wdt_info __initconst = {
 	.name = "mtx1-wdt",
 	.id = 0,
+	.properties = mtx1_wdt_props,
 };
 
-static const struct gpio_led default_leds[] = {
-	{
-		.name	= "mtx1:green",
-		.gpio = 211,
-	}, {
-		.name = "mtx1:red",
-		.gpio = 212,
-	},
+static void __init mtx1_wdt_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&mtx1_wdt_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create gpio-keys device: %d\n", err);
+}
+
+static const struct software_node mtx1_gpio_leds_node = {
+	.name = "mtx1-leds",
 };
 
-static struct gpio_led_platform_data mtx1_led_data = {
-	.num_leds = ARRAY_SIZE(default_leds),
-	.leds = default_leds,
+static const struct property_entry mtx1_green_led_props[] = {
+	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 11, GPIO_ACTIVE_HIGH),
+	{ }
 };
 
-static struct platform_device mtx1_gpio_leds = {
-	.name = "leds-gpio",
-	.id = -1,
-	.dev = {
-		.platform_data = &mtx1_led_data,
-	}
+static const struct software_node mtx1_green_led_node = {
+	.name = "mtx1:green",
+	.parent = &mtx1_gpio_leds_node,
+	.properties = mtx1_green_led_props,
 };
 
+static const struct property_entry mtx1_red_led_props[] = {
+	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 12, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node mtx1_red_led_node = {
+	.name = "mtx1:red",
+	.parent = &mtx1_gpio_leds_node,
+	.properties = mtx1_red_led_props,
+};
+
+static const struct software_node *mtx1_gpio_leds_swnodes[] = {
+	&mtx1_gpio_leds_node,
+	&mtx1_green_led_node,
+	&mtx1_red_led_node,
+	NULL
+};
+
+static void __init mtx1_leds_init(void)
+{
+	struct platform_device_info led_info = {
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *led_dev;
+	int err;
+
+	err = software_node_register_node_group(mtx1_gpio_leds_swnodes);
+	if (err) {
+		pr_err("failed to register LED software nodes: %d\n", err);
+		return;
+	}
+
+	led_info.fwnode = software_node_fwnode(&mtx1_gpio_leds_node);
+
+	led_dev = platform_device_register_full(&led_info);
+	err = PTR_ERR_OR_ZERO(led_dev);
+	if (err)
+		pr_err("failed to create LED device: %d\n", err);
+}
+
 static struct mtd_partition mtx1_mtd_partitions[] = {
 	{
 		.name	= "filesystem",
@@ -247,9 +315,6 @@ static struct platform_device mtx1_pci_host = {
 
 static struct platform_device *mtx1_devs[] __initdata = {
 	&mtx1_pci_host,
-	&mtx1_gpio_leds,
-	&mtx1_wdt,
-	&mtx1_button,
 	&mtx1_mtd,
 };
 
@@ -270,16 +335,18 @@ static int __init mtx1_register_devices(void)
 
 	au1xxx_override_eth_cfg(0, &mtx1_au1000_eth0_pdata);
 
-	rc = gpio_request(mtx1_gpio_button[0].gpio,
-					mtx1_gpio_button[0].desc);
-	if (rc < 0) {
-		printk(KERN_INFO "mtx1: failed to request %d\n",
-					mtx1_gpio_button[0].gpio);
-		goto out;
-	}
-	gpio_direction_input(mtx1_gpio_button[0].gpio);
-out:
-	gpiod_add_lookup_table(&mtx1_wdt_gpio_table);
-	return platform_add_devices(mtx1_devs, ARRAY_SIZE(mtx1_devs));
+	rc = software_node_register(&mtx1_gpiochip_node);
+	if (rc)
+		return rc;
+
+	rc = platform_add_devices(mtx1_devs, ARRAY_SIZE(mtx1_devs));
+	if (rc)
+		return rc;
+
+	mtx1_leds_init();
+	mtx1_wdt_init();
+	mtx1_keys_init();
+
+	return 0;
 }
 arch_initcall(mtx1_register_devices);
-- 
2.51.0.rc0.155.g4a0f42376b-goog


-- 
Dmitry

