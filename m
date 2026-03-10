Return-Path: <linux-mips+bounces-13438-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEgHCI62r2lzbwIAu9opvQ
	(envelope-from <linux-mips+bounces-13438-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:13:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6CD245BB1
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3D5D30DACD8
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 06:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A073313E3D;
	Tue, 10 Mar 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URZf0K89"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29655314A77
	for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 06:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123145; cv=none; b=V/qWbVDV5navR3eFGqTKlb0L97J5YozqqJAQ9k1Owz9Ie0OsYzn9NBN1On+9au6mnmz4bBLgw2AG9wOx1oQupZ9B78S8ll8U5xSU3LuvUeyNBAnpOYn7XHU6kOtEcSfvtkygImbkS3HVqKtM9RISg/OJrJXoySkyvxloyLXbqJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123145; c=relaxed/simple;
	bh=Ww1uOxXj4zg02OyEIEQ6zxV8fvva8dIE3hzD0F9KZUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MwWoUv4LLDYI4ZuN4cjKz/a1NtlIJAHFtR9eOE2bYbvmgXs9L1IE6rwegs+TYRxbS34OHjO251GTB+/i4NXZsJ2gaa1ST/0TQbQn8qjG9aEPfSE8BoOrHDNmxqhm4dcyVMuW9eIpJFKb/BT2+TwIhaCSZL1i86Q1Q9a1AObvBZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URZf0K89; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso8270486eec.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2026 23:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123143; x=1773727943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oc9kvg6kj8oQJRsEf7n0ivGSmV5Oi+rLWC/z8Agp6PI=;
        b=URZf0K8967jBKMk4w+eO2P4ugKK6QvJuqipL8/XvSJu3gTsZb+vTi5wZObfYzcd0m5
         tw8QuGFxlSBE/+m5hSl9kFOq2WRZdI5DG7KDfSXoVPKL7Aj0jM4T5sgFddBmDSwvCLYD
         ys5Jsb5Whqwy/dLs1WRzapGoTlCoVUen93TV7H3dLZOHbzS3+qEBvLCMzK0d1XVkEZ8m
         NLRHhjs861evkZ4/oHq/+D6VYFjBHI6yXleYM4oKmC0rq6N+PFFVIfCS/sfgd0rIH04R
         H+DzDmDQ+c5MJzLJVBJR4bO0POAJQ8a60/eGNmIcbPwAhXraWwBJDMRzO9cCECeyc8Tl
         2F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123143; x=1773727943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oc9kvg6kj8oQJRsEf7n0ivGSmV5Oi+rLWC/z8Agp6PI=;
        b=ECjGPGRDK40yhb/hs2Av8Jzg6sYF1mB9PfWhbIunG3+aH4WizzwWdK3XQ6Wu+P68RQ
         0CdXTs6AmcI7hvHPa0CQh6X1fGYGal8UQVgZPwvoCmMhwfeDDn/R9PSKx+Emv8gHvrwg
         /sAhBfAy3vT3oQjX3kXIh/gHu8F1+I1KqpoGLc9qq16rl3SypRSRgIHf+Zq7t1YTROAO
         KMX9chbMWNCnDv50/Tt0QUv42afVfYfRDMUXxbQJBXvNJt3jtqtekLy1F4epb15yzWwq
         J8hvIsWzZaByFvvk5tnmTbLxQcaXDuNGm+dLCK6sN/uz08+yf9FkgabyTS6LBgQOoTLw
         QbHQ==
X-Gm-Message-State: AOJu0YzV4wki0UxMCsaOwtt44Ft5Luogs5GYzV76YtBxaY2fF7us13KI
	buTyGkhANMYyxtXSAi0Bju6f4ZNi2qcB/9YHyx6kGfmK3ANFp7GkOF78cB+t1A==
X-Gm-Gg: ATEYQzyW5MaG8d/rzDl+/Yj6crESF6CwnKH6ty3m1W8h2tMVF7SZQxcMKmjEa/y0j+C
	KG0aQwUDAAfqGgdANw+F853EO98jRDldSvfx4tGxYcG8LBr0Vtgvpd+3eewbDL7tEFa3wuNAFIE
	eTw7q34hVLgqFNbPITwHOevdele4kqUl44pJDLoOXTC4yvJJRxf0wAT4w3ffF/RcCcJONG+Xy0X
	7RTnfmwgHQywsR78CYMqwl6WnL/ZZyb1tYPkOKbSM/S0prz61KK4+vBob0TOI+X5+hydk2QMdtu
	H7CxDkGmAxSB6keGewTI55AkHPj+Q/XYhNycTVKIX0H0T9JeS0qoKXROJJKHOkOpiC9FIcm2Q4W
	bhz7CSfdPEOsYeGT7V7oaDFS5o1gHCwM3u/5GSKFmZuDzG8TUvhSMe24SfFKdLkx0PgHBcCFpg+
	U9mQdNSu0x/aB1g4H6zddqCD0vJ9KIycKputrWr7n5syeea0b4NcMrGvYj5I4CpSY9YkP5tpZSD
	R0+kvbjg+g6nJg=
X-Received: by 2002:a05:7300:3215:b0:2be:514:3697 with SMTP id 5a478bee46e88-2be7a25f162mr843406eec.13.1773123142942;
        Mon, 09 Mar 2026 23:12:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa32sm11787106eec.26.2026.03.09.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:12:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 09 Mar 2026 23:12:00 -0700
Subject: [PATCH 3/4] MIPS: alchemy: gpr: switch to static device properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-alchemy-v1-3-f55e9dc60ba1@gmail.com>
References: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
In-Reply-To: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Rspamd-Queue-Id: 8E6CD245BB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13438-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Convert I2C-gpio device and GPIO-connected LEDs on GPR board to software
nodes/properties, so that support for platform data can be removed from
gpio-leds driver (which will rely purely on generic device properties
for configuration).

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/mips/alchemy/board-gpr.c | 122 ++++++++++++++++++++++++------------------
 1 file changed, 71 insertions(+), 51 deletions(-)

diff --git a/arch/mips/alchemy/board-gpr.c b/arch/mips/alchemy/board-gpr.c
index f587c40b6d00..3e9bd179844f 100644
--- a/arch/mips/alchemy/board-gpr.c
+++ b/arch/mips/alchemy/board-gpr.c
@@ -13,11 +13,11 @@
 #include <linux/pm.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
-#include <linux/leds.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/i2c-gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <asm/bootinfo.h>
 #include <asm/idle.h>
 #include <asm/reboot.h>
@@ -161,66 +161,87 @@ static struct platform_device gpr_mtd_device = {
 /*
  * LEDs
  */
-static const struct gpio_led gpr_gpio_leds[] = {
-	{	/* green */
-		.name			= "gpr:green",
-		.gpio			= 4,
-		.active_low		= 1,
+static const struct software_node gpr_gpio_leds_node = {
+	.name = "gpr-leds",
+};
+
+static const struct software_node gpr_green_led_node = {
+	.name = "gpr:green",
+	.parent = &gpr_gpio_leds_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_GPIO("gpios",
+				    &alchemy_gpio1_node, 4, GPIO_ACTIVE_LOW),
+		{ }
 	},
-	{	/* red */
-		.name			= "gpr:red",
-		.gpio			= 5,
-		.active_low		= 1,
-	}
 };
 
-static struct gpio_led_platform_data gpr_led_data = {
-	.num_leds = ARRAY_SIZE(gpr_gpio_leds),
-	.leds = gpr_gpio_leds,
+static const struct software_node gpr_red_led_node = {
+	.name = "gpr:red",
+	.parent = &gpr_gpio_leds_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_GPIO("gpios",
+				    &alchemy_gpio1_node, 5, GPIO_ACTIVE_LOW),
+		{ }
+	},
 };
 
-static struct platform_device gpr_led_devices = {
-	.name = "leds-gpio",
-	.id = -1,
-	.dev = {
-		.platform_data = &gpr_led_data,
-	}
+static const struct software_node * const gpr_gpio_leds_swnodes[] __initconst = {
+	&gpr_gpio_leds_node,
+	&gpr_green_led_node,
+	&gpr_red_led_node,
+	NULL
 };
 
+static void __init gpr_leds_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(gpr_gpio_leds_swnodes);
+	if (err) {
+		pr_err("failed to register LED software nodes: %d\n", err);
+		return;
+	}
+
+	pd = platform_device_register_full(&(struct platform_device_info){
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+		.fwnode	= software_node_fwnode(&gpr_gpio_leds_node),
+	});
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create LED device: %d\n", err);
+}
+
 /*
  * I2C
  */
-static struct gpiod_lookup_table gpr_i2c_gpiod_table = {
-	.dev_id = "i2c-gpio",
-	.table = {
-		/*
-		 * This should be on "GPIO2" which has base at 200 so
-		 * the global numbers 209 and 210 should correspond to
-		 * local offsets 9 and 10.
-		 */
-		GPIO_LOOKUP_IDX("alchemy-gpio2", 9, NULL, 0,
-				GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("alchemy-gpio2", 10, NULL, 1,
-				GPIO_ACTIVE_HIGH),
-	},
+static const struct property_entry gpr_i2c_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("sda-gpios", &alchemy_gpio2_node, 9, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("scl-gpios", &alchemy_gpio2_node, 10, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_U32("i2c-gpio,delay-us", 2),	/* ~100 kHz */
+	PROPERTY_ENTRY_U32("i2c-gpio,timeout-ms", 1000),
+	PROPERTY_ENTRY_BOOL("i2c-gpio,sda-open-drain"),
+	PROPERTY_ENTRY_BOOL("i2c-gpio,scl-open-drain"),
+	{ }
 };
 
-static struct i2c_gpio_platform_data gpr_i2c_data = {
-	/*
-	 * The open drain mode is hardwired somewhere or an electrical
-	 * property of the alchemy GPIO controller.
-	 */
-	.sda_is_open_drain	= 1,
-	.scl_is_open_drain	= 1,
-	.udelay			= 2,		/* ~100 kHz */
-	.timeout		= HZ,
+static const struct platform_device_info gpr_i2c_pdev_info __initconst = {
+	.name		= "i2c-gpio",
+	.id		= PLATFORM_DEVID_NONE,
+	.properties	= gpr_i2c_props,
 };
 
-static struct platform_device gpr_i2c_device = {
-	.name			= "i2c-gpio",
-	.id			= -1,
-	.dev.platform_data	= &gpr_i2c_data,
-};
+static void __init gpr_i2c_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&gpr_i2c_pdev_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create I2C device: %d\n", err);
+}
 
 static struct i2c_board_info gpr_i2c_info[] __initdata = {
 	{
@@ -270,8 +291,6 @@ static struct platform_device gpr_pci_host_dev = {
 static struct platform_device *gpr_devices[] __initdata = {
 	&gpr_wdt_device,
 	&gpr_mtd_device,
-	&gpr_i2c_device,
-	&gpr_led_devices,
 };
 
 static int __init gpr_pci_init(void)
@@ -284,8 +303,9 @@ arch_initcall(gpr_pci_init);
 
 static int __init gpr_dev_init(void)
 {
-	gpiod_add_lookup_table(&gpr_i2c_gpiod_table);
 	i2c_register_board_info(0, gpr_i2c_info, ARRAY_SIZE(gpr_i2c_info));
+	gpr_i2c_init();
+	gpr_leds_init();
 
 	return platform_add_devices(gpr_devices, ARRAY_SIZE(gpr_devices));
 }

-- 
2.53.0.473.g4a7958ca14-goog


