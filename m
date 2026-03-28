Return-Path: <linux-mips+bounces-13979-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wApoLEj7x2mIfwUAu9opvQ
	(envelope-from <linux-mips+bounces-13979-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 17:01:12 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7EC34F106
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 17:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF372305CABD
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 15:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7959035CB62;
	Sat, 28 Mar 2026 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpFKCaCb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566DB34751C;
	Sat, 28 Mar 2026 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713354; cv=none; b=T6g2MLf9Ad1aPsC1q11isCFyWHn2SmdD/oA+mbvMCpQp4v+vzhYgfwBOZQTtMVGQBSqvLYbqRZgDa+Wfti0Azq0B8w+MSiEI330ZPVikUIaj4JcnboBBHScKODGVHxvsxVBwnEpumA2nZUYARPQbn0OFXAlqctWKp5Oywypqnw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713354; c=relaxed/simple;
	bh=43UWjfwmGTJsvatojEzQ6a+djIbk4+udgzPTzi5vJy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L64hWrPaqxdVrERqTBby2/dyL3mzeobgavvHZEwBZjh9EVZqqodR8AIGpRZ9bGOJKwHwNjaIiM+shonlUeHIfPl/3Rzk+gg1XOnDH6YlUaRDqWS+X3keb4kbxPorqPB5+FO+v5xOVH4vRTuwZ+dMJr+vHc7d7ucB1UiiKexZRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpFKCaCb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E16C2BCB1;
	Sat, 28 Mar 2026 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774713354;
	bh=43UWjfwmGTJsvatojEzQ6a+djIbk4+udgzPTzi5vJy0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tpFKCaCbTTyDGqXi3yWG6BVj5ObYU89fGMLU9/IJtb5tNISlKPrfcj+GpsGSDNxNR
	 rT9HTpLkzPGWCydC0sCHje+KrvUXRm3fXOh1XUqmUFCMjvrHimJQzGNR8+0MZR7mdg
	 1xFEAhAC0gmMNCq8gXsccRa5Up6bZDAjyil4NKJtvrCBC2seVnlh7R1ThCTIpf6D/U
	 FsTBBuhRTlrJ+WttXdcghPWrBYJlWVLbCvvJ9iWdv7Wul2VT/j3s6WWR/DT44rjqmo
	 hgtZWEJVYsTEhZIDPHa8wM8OAh9jnxYHENmFEuKNBGJFefSXFa2aJGV+cLWCMWwDHG
	 CQkOdY0ISBqHw==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Mar 2026 16:55:47 +0100
Subject: [PATCH 1/2] MIPS/input: Move RB532 button to GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
In-Reply-To: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13979-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com,kernel.org,bootlin.com,nod.at,ti.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A7EC34F106
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the Mikrotik RouterBoard RB532 to use GPIO descriptors
by defining a software node for the GPIO chip, then register
the button platform device with full info passing the GPIO
as a device property.

This can be used as a base to move more of the RB532 devices
over to passing GPIOs using device properties.

Use the GPIO_ACTIVE_LOW flag and drop the inversion in the
rb532_button_pressed() function.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/mips/rb532/devices.c         | 47 +++++++++++++++++++++++++++++++++------
 drivers/input/misc/rb532_button.c | 35 ++++++++++++++++++++++++-----
 2 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 4f027efbf27b..3f56d9feb73a 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -16,8 +16,10 @@
 #include <linux/mtd/mtd.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/gpio_keys.h>
 #include <linux/input.h>
+#include <linux/property.h>
 #include <linux/serial_8250.h>
 
 #include <asm/bootinfo.h>
@@ -38,6 +40,10 @@ extern unsigned int idt_cpu_freq;
 
 static struct mpmc_device dev3;
 
+static const struct software_node rb532_gpio0_node = {
+	.name = "gpio0",
+};
+
 void set_latch_u5(unsigned char or_mask, unsigned char nand_mask)
 {
 	unsigned long flags;
@@ -189,11 +195,6 @@ static struct platform_device rb532_led = {
 	.id = -1,
 };
 
-static struct platform_device rb532_button = {
-	.name	= "rb532-button",
-	.id	= -1,
-};
-
 static struct resource rb532_wdt_res[] = {
 	{
 		.name = "rb532_wdt_res",
@@ -236,11 +237,23 @@ static struct platform_device *rb532_devs[] = {
 	&nand_slot0,
 	&cf_slot0,
 	&rb532_led,
-	&rb532_button,
 	&rb532_uart,
 	&rb532_wdt
 };
 
+static const struct property_entry rb532_button_properties[] = {
+	PROPERTY_ENTRY_GPIO("button-gpios", &rb532_gpio0_node,
+			    GPIO_BTN_S1, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct platform_device_info rb532_button_info  __initconst = {
+	.name		= "rb532-button",
+	.id		= PLATFORM_DEVID_NONE,
+	.properties	= rb532_button_properties,
+};
+
+
 /* NAND definitions */
 #define NAND_CHIP_DELAY 25
 
@@ -267,6 +280,9 @@ static void __init rb532_nand_setup(void)
 
 static int __init plat_setup_devices(void)
 {
+	struct platform_device *pd;
+	int ret;
+
 	/* Look for the CF card reader */
 	if (!readl(IDT434_REG_BASE + DEV1MASK))
 		rb532_devs[2] = NULL;	/* disable cf_slot0 at index 2 */
@@ -295,7 +311,24 @@ static int __init plat_setup_devices(void)
 	rb532_uart_res[0].uartclk = idt_cpu_freq;
 
 	gpiod_add_lookup_table(&cf_slot0_gpio_table);
-	return platform_add_devices(rb532_devs, ARRAY_SIZE(rb532_devs));
+	ret = platform_add_devices(rb532_devs, ARRAY_SIZE(rb532_devs));
+	if (ret)
+		return ret;
+
+	/*
+	 * Stack devices using full info and properties here, after we
+	 * register the node for the GPIO chip.
+	 */
+	software_node_register(&rb532_gpio0_node);
+
+	pd = platform_device_register_full(&rb532_button_info);
+	ret = PTR_ERR_OR_ZERO(pd);
+	if (ret) {
+		pr_err("failed to create RB532 button device: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
 }
 
 #ifdef CONFIG_NET
diff --git a/drivers/input/misc/rb532_button.c b/drivers/input/misc/rb532_button.c
index 190a80e1e2c1..40173bf7a235 100644
--- a/drivers/input/misc/rb532_button.c
+++ b/drivers/input/misc/rb532_button.c
@@ -8,7 +8,7 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <asm/mach-rc32434/gpio.h>
 #include <asm/mach-rc32434/rb.h>
@@ -18,6 +18,14 @@
 #define RB532_BTN_RATE 100 /* msec */
 #define RB532_BTN_KSYM BTN_0
 
+/**
+ * struct rb532_button - RB532 button information
+ * @gpio: GPIO connected to the button
+ */
+struct rb532_button {
+	struct gpio_desc	*gpio;
+};
+
 /* The S1 button state is provided by GPIO pin 1. But as this
  * pin is also used for uart input as alternate function, the
  * operational modes must be switched first:
@@ -31,35 +39,48 @@
  * The GPIO value occurs to be inverted, so pin high means
  * button is not pressed.
  */
-static bool rb532_button_pressed(void)
+static bool rb532_button_pressed(struct rb532_button *button)
 {
 	int val;
 
 	set_latch_u5(0, LO_FOFF);
-	gpio_direction_input(GPIO_BTN_S1);
+	gpiod_direction_input(button->gpio);
 
-	val = gpio_get_value(GPIO_BTN_S1);
+	val = gpiod_get_value(button->gpio);
 
 	rb532_gpio_set_func(GPIO_BTN_S1);
 	set_latch_u5(LO_FOFF, 0);
 
-	return !val;
+	return val;
 }
 
 static void rb532_button_poll(struct input_dev *input)
 {
-	input_report_key(input, RB532_BTN_KSYM, rb532_button_pressed());
+	struct rb532_button *button = input_get_drvdata(input);
+
+	input_report_key(input, RB532_BTN_KSYM, rb532_button_pressed(button));
 	input_sync(input);
 }
 
 static int rb532_button_probe(struct platform_device *pdev)
 {
+	struct rb532_button *button;
 	struct input_dev *input;
 	int error;
 
+	button = devm_kzalloc(&pdev->dev, sizeof(*button), GFP_KERNEL);
+	if (!button)
+		return -ENOMEM;
+
+	button->gpio = devm_gpiod_get(&pdev->dev, "button", GPIOD_IN);
+	if (IS_ERR(button->gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(button->gpio),
+				     "error getting button GPIO\n");
+
 	input = devm_input_allocate_device(&pdev->dev);
 	if (!input)
 		return -ENOMEM;
+	input_set_drvdata(input, button);
 
 	input->name = "rb532 button";
 	input->phys = "rb532/button0";
@@ -77,6 +98,8 @@ static int rb532_button_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	platform_set_drvdata(pdev, button);
+
 	return 0;
 }
 

-- 
2.53.0


