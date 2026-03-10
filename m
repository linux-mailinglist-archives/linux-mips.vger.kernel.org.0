Return-Path: <linux-mips+bounces-13436-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEudOku2r2lzbwIAu9opvQ
	(envelope-from <linux-mips+bounces-13436-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:12:27 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA6245B86
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 082C23019FC9
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 06:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2A4314D13;
	Tue, 10 Mar 2026 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f95H87We"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB3E3148C5
	for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123142; cv=none; b=hfvOTOxfc9516p0scdh1+uhhXNy4dnQ/yRHIPkDb/eolEdnAIvVmhSTdWz5R4dnNS77UpfOu0MrHFiglrFRBuAtKDz9ecgDLE1X02eHQMrVnfUmjfXrtCGKP6n5+1f+vLtlRc8ealgN9F71n3Vvr2CYJbGttFk8t4jHY4G6timM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123142; c=relaxed/simple;
	bh=XRio9G3PpzIKf5fTbcsvkoxkVC0WokjbqLbKOkmTnjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8t0hyrPuKWAkt52oZHrk0iWbnFpmFFMIh/ygsj8J1h544fqsPrUJil0pfssxUzZamdw+xkTkDMVOcfzqVtcw+AlMLW8gsAyY2JcORLuiXj2/KV2oYkRNFSkEt0/COgQjqBKoTE5exC/IQwNG82Pr+OLymtrGVXcyPcBcHnIfpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f95H87We; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be3bdfda8eso5852642eec.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2026 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123140; x=1773727940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3lT/PTNwNOc4iufAidrAcgLB/0uuZoI/g6mDpTtk9I=;
        b=f95H87We702gnCPFjBpwZwpQiNh3nQEHi3ebfJyw/vkGPpWrOIV+oTePVIWGbcqLkA
         6c/gJhtln3TTdZWjcqXRvSaSW5hWfHkcBi8jomkNzWK7/8ieV4iF6XW2aY1avZ7d/fgF
         sD32uQxod32f/ddWYvkm97X7uUdv7rJruuGIHKfx2sMTkaBAYmuhKu40593ocKg2vOcc
         /rPx2Kmh3gY23QP06xM/Qc16bu8Xzp9YXUUWUZp7BGIHB7WKHnNMO+VNxkDxbTZ+zU/W
         QOzbgfmUzRVUMJaYzKrGCXIYn2xH5T1G6irsWCla3oddAC8rgdeYw82s67ixbm68CbJL
         m8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123140; x=1773727940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3lT/PTNwNOc4iufAidrAcgLB/0uuZoI/g6mDpTtk9I=;
        b=bK/fSjX3trns4gBdGItQ95kJxmvzegIrfKGE2t2jZ/XJSfzKuU9m0wyne4Qa0yXCM+
         Ps/2OMjkbLuzBGR1q2738TYOpDHomB2DDtT32F0PQWWkClehxcwkGjEPBPWVEeqk7K4p
         0MTqUHfeWJI4HbtQdq6OKqmNQfV3SBx40Bm5ghCBiBBkJcI0qRIrUlp/w1y7FCOyJsp5
         cAEyLILj/kBfHM/DQXDcTT4BNprr22Yd4P1wzE64006Q6j/+w2HSMdeu6JLztZAocJoq
         rvLsqc+TL7Wss4cP0dlOo1snhfOvr0rjQnO4EU9SbOsUXC/L09KWhVYkLNz4xLTuCqK6
         1jDA==
X-Gm-Message-State: AOJu0YyY/617HEZlfVsBuYexC54URqGM7JC42qnQHrYuqkiNW97chEsF
	53nBf73pomDRbmjL1B1821VvLcJbp03mn6gEU+W9DJX+P9ZfsIPdF0Bgh2uaLw==
X-Gm-Gg: ATEYQzwdFc5IIt7hbLVRQzknUCeKinJf8jAt+G9Saea6cXnVPGgJh/c/h4UkEGalPEA
	JsYrneh9/atcYjfjlGYcHQowf/IXYLWndXicioCB90Dkcp86Y/o3vvFWjpMq91tplavs4tNZCv1
	MhD9ZxxBxRievzWxcAVLQJt2baqJfVMxtUiK/ckXjg+/9S16etJJRgLwhhGqi5JdllDOYc/XqA1
	kBGGRhgFl+Y9ir0ko/Vym7P7KpM8R368zuqzIQmH1UP5XNO5v+NAj4dmSXDKh3Uwv7t2X8aREpC
	RCHYbmIDaV9b3lqKCKU0Jr82Uc74QhkNBEh2+qG6/n8isU9PU9FqzK8NM2qw4HQoK64zaiqIEQJ
	LZeoxl2hY/havjn2HAEsP1DoySAFYKdq0eJUTfnwDwgpmWk7Y/4jpYHmBNsnX18MWXOM/vr4GYQ
	WZkgfMMbGlrnC8zG/tsaRoyh2BMnBuoDaNCwJ++a18dcGGNgvP8pCWzO0wJHY1j3y0eiuN04H7V
	dbGuUhsD2Bw6aE=
X-Received: by 2002:a05:7300:f194:b0:2be:2bc5:ba05 with SMTP id 5a478bee46e88-2be4de63f5emr4444129eec.7.1773123139778;
        Mon, 09 Mar 2026 23:12:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa32sm11787106eec.26.2026.03.09.23.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:12:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 09 Mar 2026 23:11:58 -0700
Subject: [PATCH 1/4] MIPS: alchemy: mtx1: attach software nodes to GPIO
 chips
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-alchemy-v1-1-f55e9dc60ba1@gmail.com>
References: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
In-Reply-To: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Rspamd-Queue-Id: F1AA6245B86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13436-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

GPIO subsystem is switching the way it locates GPIO chip instances for
GPIO references in software nodes from matching on node names to
identity matching, which necessitates assigning firmware nodes
(software nodes) to GPIO chips.

Move the node definitions for alchemy-gpio1 and alchemy-gpio2 to
arch/misp/alchemy/common/gpiolib.c, register them there, and attach
them to gpio_chip instances. Adjust MTX1 board file to use these nodes.

Note that because nodes need to be registered before they can be used in
PROPERTY_ENTRY_GPIO() we have to do the registration at
postcore_initcall level, otherwise (due to the link order) MTX1 board
initialization code will run first.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/mips/alchemy/board-mtx1.c                  | 79 +++++++++++--------------
 arch/mips/alchemy/common/gpiolib.c              | 39 +++++++++++-
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h |  4 ++
 3 files changed, 75 insertions(+), 47 deletions(-)

diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index cb6be58808a0..740b38c0b81e 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/input.h>
@@ -78,27 +79,22 @@ void __init board_setup(void)
 
 /******************************************************************************/
 
-static const struct software_node mtx1_gpiochip_node = {
-	.name = "alchemy-gpio2",
-};
-
 static const struct software_node mtx1_gpio_keys_node = {
 	.name = "mtx1-gpio-keys",
 };
 
-static const struct property_entry mtx1_button_props[] = {
-	PROPERTY_ENTRY_U32("linux,code", BTN_0),
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 7, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_STRING("label", "System button"),
-	{ }
-};
-
 static const struct software_node mtx1_button_node = {
 	.parent = &mtx1_gpio_keys_node,
-	.properties = mtx1_button_props,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", BTN_0),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 7,
+				    GPIO_ACTIVE_HIGH),
+		PROPERTY_ENTRY_STRING("label", "System button"),
+		{ }
+	},
 };
 
-static const struct software_node *mtx1_gpio_keys_swnodes[] __initconst = {
+static const struct software_node * const mtx1_gpio_keys_swnodes[] __initconst = {
 	&mtx1_gpio_keys_node,
 	&mtx1_button_node,
 	NULL
@@ -127,16 +123,15 @@ static void __init mtx1_keys_init(void)
 		pr_err("failed to create gpio-keys device: %d\n", err);
 }
 
-/* Global number 215 is offset 15 on Alchemy GPIO 2 */
-static const struct property_entry mtx1_wdt_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 15, GPIO_ACTIVE_HIGH),
-	{ }
-};
-
-static struct platform_device_info mtx1_wdt_info __initconst = {
+static const struct platform_device_info mtx1_wdt_info __initconst = {
 	.name = "mtx1-wdt",
 	.id = 0,
-	.properties = mtx1_wdt_props,
+	.properties = (const struct property_entry[]){
+		/* Global number 215 is offset 15 on Alchemy GPIO 2 */
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 15,
+				    GPIO_ACTIVE_HIGH),
+		{ }
+	},
 };
 
 static void __init mtx1_wdt_init(void)
@@ -147,36 +142,34 @@ static void __init mtx1_wdt_init(void)
 	pd = platform_device_register_full(&mtx1_wdt_info);
 	err = PTR_ERR_OR_ZERO(pd);
 	if (err)
-		pr_err("failed to create gpio-keys device: %d\n", err);
+		pr_err("failed to create watchdog device: %d\n", err);
 }
 
 static const struct software_node mtx1_gpio_leds_node = {
 	.name = "mtx1-leds",
 };
 
-static const struct property_entry mtx1_green_led_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 11, GPIO_ACTIVE_HIGH),
-	{ }
-};
-
 static const struct software_node mtx1_green_led_node = {
 	.name = "mtx1:green",
 	.parent = &mtx1_gpio_leds_node,
-	.properties = mtx1_green_led_props,
-};
-
-static const struct property_entry mtx1_red_led_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 12, GPIO_ACTIVE_HIGH),
-	{ }
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 11,
+				    GPIO_ACTIVE_HIGH),
+		{ }
+	},
 };
 
 static const struct software_node mtx1_red_led_node = {
 	.name = "mtx1:red",
 	.parent = &mtx1_gpio_leds_node,
-	.properties = mtx1_red_led_props,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 12,
+				    GPIO_ACTIVE_HIGH),
+		{ }
+	},
 };
 
-static const struct software_node *mtx1_gpio_leds_swnodes[] = {
+static const struct software_node * const mtx1_gpio_leds_swnodes[] __initconst = {
 	&mtx1_gpio_leds_node,
 	&mtx1_green_led_node,
 	&mtx1_red_led_node,
@@ -185,10 +178,6 @@ static const struct software_node *mtx1_gpio_leds_swnodes[] = {
 
 static void __init mtx1_leds_init(void)
 {
-	struct platform_device_info led_info = {
-		.name	= "leds-gpio",
-		.id	= PLATFORM_DEVID_NONE,
-	};
 	struct platform_device *led_dev;
 	int err;
 
@@ -198,9 +187,11 @@ static void __init mtx1_leds_init(void)
 		return;
 	}
 
-	led_info.fwnode = software_node_fwnode(&mtx1_gpio_leds_node);
-
-	led_dev = platform_device_register_full(&led_info);
+	led_dev = platform_device_register_full(&(struct platform_device_info){
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+		.fwnode	= software_node_fwnode(&mtx1_gpio_leds_node),
+	});
 	err = PTR_ERR_OR_ZERO(led_dev);
 	if (err)
 		pr_err("failed to create LED device: %d\n", err);
@@ -335,10 +326,6 @@ static int __init mtx1_register_devices(void)
 
 	au1xxx_override_eth_cfg(0, &mtx1_au1000_eth0_pdata);
 
-	rc = software_node_register(&mtx1_gpiochip_node);
-	if (rc)
-		return rc;
-
 	rc = platform_add_devices(mtx1_devs, ARRAY_SIZE(mtx1_devs));
 	if (rc)
 		return rc;
diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index e79e26ffac99..2141eae5ce45 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -30,6 +30,7 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 #include <linux/types.h>
 #include <linux/gpio/driver.h>
 #include <asm/mach-au1x00/gpio-au1000.h>
@@ -95,7 +96,21 @@ static int gpio1_to_irq(struct gpio_chip *chip, unsigned offset)
 	return alchemy_gpio1_to_irq(offset + ALCHEMY_GPIO1_BASE);
 }
 
-struct gpio_chip alchemy_gpio_chip[] = {
+const struct software_node alchemy_gpio1_node = {
+	.name = "alchemy-gpio1",
+};
+
+const struct software_node alchemy_gpio2_node = {
+	.name = "alchemy-gpio2",
+};
+
+static const struct software_node *alchemy_gpio_node_group[] = {
+	&alchemy_gpio1_node,
+	&alchemy_gpio2_node,
+	NULL
+};
+
+static struct gpio_chip alchemy_gpio_chip[] = {
 	[0] = {
 		.label			= "alchemy-gpio1",
 		.direction_input	= gpio1_direction_input,
@@ -157,6 +172,28 @@ static struct gpio_chip au1300_gpiochip = {
 	.ngpio			= AU1300_GPIO_NUM,
 };
 
+/*
+ * Software nodes must be registered before board-specific code (that runs
+ * at arch_initcall level) attempts to use them as GPIO targets or as fwnodes
+ * for registered devices. We can not do registration in alchemy_gpiochip_init
+ * because it also runs as arch_initcall and runs after board-specific code
+ * because of the link order, and so we do it at postcore_initcall level.
+ */
+static int __init alchemy_gpio_nodes_init(void)
+{
+	int ret;
+
+	ret = software_node_register_node_group(alchemy_gpio_node_group);
+	if (ret)
+		return ret;
+
+	alchemy_gpio_chip[0].fwnode = software_node_fwnode(&alchemy_gpio1_node);
+	alchemy_gpio_chip[1].fwnode = software_node_fwnode(&alchemy_gpio2_node);
+
+	return 0;
+}
+postcore_initcall(alchemy_gpio_nodes_init);
+
 static int __init alchemy_gpiochip_init(void)
 {
 	int ret = 0;
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
index d820b481ac56..a0eebc24c4a8 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
@@ -41,6 +41,10 @@
 #define AU1000_GPIO2_ENABLE	0x14
 
 struct gpio;
+struct software_node;
+
+extern const struct software_node alchemy_gpio1_node;
+extern const struct software_node alchemy_gpio2_node;
 
 static inline int au1000_gpio1_to_irq(int gpio)
 {

-- 
2.53.0.473.g4a7958ca14-goog


