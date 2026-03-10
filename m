Return-Path: <linux-mips+bounces-13439-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJr3E8i2r2lzbwIAu9opvQ
	(envelope-from <linux-mips+bounces-13439-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:14:32 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C2E245BD7
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 07:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6A53303FABA
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 06:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E8B3148C5;
	Tue, 10 Mar 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2qg0A4c"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247EF314A79
	for <linux-mips@vger.kernel.org>; Tue, 10 Mar 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123150; cv=none; b=Ipsi9Gy0MY/lrPYLEyDejloUEZaOITMmnYa73bqdIOZiLKzZfiVIK5I2WmWk1Nt/Z3KL83zW0ZRUTcCk0e2vS8eGx4iq63wwfa0YI0gngYrwtVB5vCVlUzWJzJA6NeJa04ViItFkUpJ08v/MnK18V3XfMXDqBASofU7UQREH+Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123150; c=relaxed/simple;
	bh=h5UVABpQZUkO05OBEUSYfy0NZP2rxkBLkvFv6He2r1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GXO0WNd7VWzDdEyjai/bds8uBqnoXP/D/WC2dkIwCsobD5Jm4kEGdMuE/P1p9Rs9vpQGp5C4juy9CLwcfzqeI8+u7mYYldUjKGHLJ0dawI+xOn4k+UDky2pD3O/T3XmijTZk9QOfML2/RgMRaCO+LCLPffq2mVMG6xuDyTHUM3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2qg0A4c; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b6b0500e06so14727290eec.1
        for <linux-mips@vger.kernel.org>; Mon, 09 Mar 2026 23:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123145; x=1773727945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=runPVszt3agTYmsgIh3va2R0o5GPxMmFccPuUgOxdtM=;
        b=X2qg0A4cvJVyC7NCiu8aGDU6YzeXyoH/Q1LuaDByCLofHgyQZxLH4NGvdna5VP51R3
         CddEKnaVlI3Vs/BtRUJwUeW76yJqtPob0M9OrffpxFCaGeXYYuDNdEyITXflvcWp7ZuY
         KxpGFtWYRRum31186moHKBtYSGNn44f4l1k80SQpvCFEQu+8dh+frPBYD6TA2u5dBJmh
         GOza3poj0qEvICzXjlM4PMYtXnNb9J1Gegwgrec5FOzY8dKU+/DrnccmKxlsuTh3MP8f
         lvNohlRBHpgLu3RIAwacoO4qd5sAuMZMMvx0SJzStZgKSKFCfyOMbYk1Q/cfh4naejjd
         Kybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123145; x=1773727945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=runPVszt3agTYmsgIh3va2R0o5GPxMmFccPuUgOxdtM=;
        b=nEg7cD3iT6dLM6wloR6dbUBK7eAZ79tNtzyFQ8KzKZIDVFZA5ScMuQVzQv7ZniHxpb
         i8XgOEZslC9QpODb5XDq7S2QUAX6DNciwcg5W/CQd5b3GMeSgLt/7m5B/eGRRx5Bb0cv
         wYFSpNrK4ZrntlRU5s9emQviPaLtRfqGrW+OlwizRMArLypMaeGZ43yvgFieC0TUE+YG
         zsL1m6nvWApqLblPL23mIsLHW0c9Hf86BicxZ48l3MTWnkB0aFFjgGoSnWOVTzZUnQxG
         rimlwPjbAeCZFHjsQpm2forllVAemuH7KVSZaKQSnJ1wLBIb34R6AQQulptuQhK++lQZ
         Si6A==
X-Gm-Message-State: AOJu0YxdZzQdML3Cm3J0ER2lJculfTxl6Wt+3ubyRXNDAQ/B9rJOZvKE
	dte8mRGverOxeVOMZ+AKMhcULje8xV03h6R6cmUxTDX1ElOY91l16hOdEQiHLg==
X-Gm-Gg: ATEYQzy9DJ507KjjvG9EC1VLdyjREadXNIV8g1alaZjb0czvULnpNc55A0u/JAnj62W
	dmrIro5LgwTzxWm49QKf2rO4zcLME5aaRqK2mxWhFTXaGFeCXxmtLmQngvz7c0p5hiS26XcDsBh
	B6Y5p6VO0NNvSLvyVQof6E4VuLahfVp6+324F4+2KxYZBbtEKZ4ZO1JWqn0qhZPMc1K/mlIE9io
	vNjT7tXmS97ctEsn46coh3bq8Nn/2GLpKnIFcdv9oYXd93UqSXk051hYV32jO3xANI9Z6lavIZp
	5Vb69h4UNu5EZi95gKOW86IoTDmP+sZTq2qFZrzSzZInsh0MyL0RZ/jnMB5kys4vD2Rw99y89QD
	BrJThnclVBhCjW9ihglF2zezv+972RDQfULyNB9BxYbftpgCNur5LTsGddqdIHExrzGYQAkmhna
	2sBSWpuUx3ENROKG++rI2MrFr6TmIv8X2uBxG4nwwisL+HCvZofwdTtc3MiVWoDiKcOp9lQk3KG
	JCsn2toyGeQgvg=
X-Received: by 2002:a05:7301:1f12:b0:2be:126c:e32d with SMTP id 5a478bee46e88-2be4e08ffabmr5303246eec.39.1773123144458;
        Mon, 09 Mar 2026 23:12:24 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa32sm11787106eec.26.2026.03.09.23.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:12:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 09 Mar 2026 23:12:01 -0700
Subject: [PATCH 4/4] MIPS: alchemy: db1300: switch to static device
 properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-alchemy-v1-4-f55e9dc60ba1@gmail.com>
References: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
In-Reply-To: <20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826
X-Rspamd-Queue-Id: C5C2E245BD7
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
	TAGGED_FROM(0.00)[bounces-13439-lists,linux-mips=lfdr.de];
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

Convert "5way switch" gpio-keys device and smsc911x ethernet controller
to use static device properties instead of bespoke platform data
structures for configuration.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/mips/alchemy/common/gpiolib.c              |   6 +
 arch/mips/alchemy/devboards/db1300.c            | 209 +++++++++++++++---------
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h |   3 +
 3 files changed, 144 insertions(+), 74 deletions(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index 2141eae5ce45..c926cc137561 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -104,9 +104,14 @@ const struct software_node alchemy_gpio2_node = {
 	.name = "alchemy-gpio2",
 };
 
+const struct software_node alchemy_gpic_node = {
+	.name = "alchemy-gpic",
+};
+
 static const struct software_node *alchemy_gpio_node_group[] = {
 	&alchemy_gpio1_node,
 	&alchemy_gpio2_node,
+	&alchemy_gpic_node,
 	NULL
 };
 
@@ -189,6 +194,7 @@ static int __init alchemy_gpio_nodes_init(void)
 
 	alchemy_gpio_chip[0].fwnode = software_node_fwnode(&alchemy_gpio1_node);
 	alchemy_gpio_chip[1].fwnode = software_node_fwnode(&alchemy_gpio2_node);
+	au1300_gpiochip.fwnode = software_node_fwnode(&alchemy_gpic_node);
 
 	return 0;
 }
diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index d377e043b49f..1c8b01e5263a 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -7,10 +7,10 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/init.h>
-#include <linux/input.h>	/* KEY_* codes */
+#include <linux/input-event-codes.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
 #include <linux/leds.h>
@@ -20,6 +20,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/platnand.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/smsc911x.h>
 #include <linux/wm97xx.h>
 
@@ -236,23 +237,36 @@ static struct resource db1300_eth_res[] = {
 	},
 };
 
-static struct smsc911x_platform_config db1300_eth_config = {
-	.phy_interface		= PHY_INTERFACE_MODE_MII,
-	.irq_polarity		= SMSC911X_IRQ_POLARITY_ACTIVE_LOW,
-	.irq_type		= SMSC911X_IRQ_TYPE_PUSH_PULL,
-	.flags			= SMSC911X_USE_32BIT,
-};
+static u8 db1300_eth_macaddr[6];
 
-static struct platform_device db1300_eth_dev = {
-	.name			= "smsc911x",
-	.id			= -1,
-	.num_resources		= ARRAY_SIZE(db1300_eth_res),
-	.resource		= db1300_eth_res,
-	.dev = {
-		.platform_data	= &db1300_eth_config,
+static const struct platform_device_info db1300_eth_info __initconst = {
+	.name		= "smsc911x",
+	.id		= PLATFORM_DEVID_NONE,
+	.res		= db1300_eth_res,
+	.num_res	= ARRAY_SIZE(db1300_eth_res),
+	.properties	= (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("reg-io-width", 4),
+		PROPERTY_ENTRY_U32("reg-shift", 0),
+		PROPERTY_ENTRY_BOOL("smsc,irq-push-pull"),
+		PROPERTY_ENTRY_STRING("phy-mode", "mii"),
+		PROPERTY_ENTRY_U8_ARRAY("local-mac-address", db1300_eth_macaddr),
+		{ }
 	},
 };
 
+static void __init db1300_eth_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	prom_get_ethernet_addr(db1300_eth_macaddr);
+
+	pd = platform_device_register_full(&db1300_eth_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create eth device: %d\n", err);
+}
+
 /**********************************************************************/
 
 static struct resource au1300_psc1_res[] = {
@@ -355,62 +369,110 @@ static struct platform_device db1300_i2c_dev = {
  * according to the schematics swap up with down and left with right.
  * I chose to use it to emulate the arrow keys of a keyboard.
  */
-static struct gpio_keys_button db1300_5waysw_arrowkeys[] = {
-	{
-		.code			= KEY_DOWN,
-		.gpio			= AU1300_PIN_LCDPWM0,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-down",
-	},
-	{
-		.code			= KEY_UP,
-		.gpio			= AU1300_PIN_PSC2SYNC1,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-up",
-	},
-	{
-		.code			= KEY_RIGHT,
-		.gpio			= AU1300_PIN_WAKE3,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-right",
-	},
-	{
-		.code			= KEY_LEFT,
-		.gpio			= AU1300_PIN_WAKE2,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-left",
-	},
-	{
-		.code			= KEY_ENTER,
-		.gpio			= AU1300_PIN_WAKE1,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-push",
-	},
-};
+static const struct software_node db1300_5waysw_node = {
+	.name = "db1300-5wayswitch",
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_BOOL("autorepeat"),
+		PROPERTY_ENTRY_STRING("label", "db1300-5wayswitch"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_down_node = {
+	.name = "5waysw-down",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_DOWN),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_LCDPWM0, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-down"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_up_node = {
+	.name = "5waysw-up",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_UP),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_PSC2SYNC1, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-up"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_right_node = {
+	.name = "5waysw-right",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_RIGHT),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_WAKE3, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-right"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_left_node = {
+	.name = "5waysw-left",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_LEFT),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_WAKE2, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-left"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_push_node = {
+	.name = "5waysw-push",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_WAKE1, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-push"),
+		{ }
+	},
+};
+
+static const struct software_node * const db1300_5waysw_swnodes[] __initconst = {
+	&db1300_5waysw_node,
+	&db1300_5waysw_down_node,
+	&db1300_5waysw_up_node,
+	&db1300_5waysw_right_node,
+	&db1300_5waysw_left_node,
+	&db1300_5waysw_push_node,
+	NULL
+};
+
+static void __init db1300_5waysw_init(void)
+{
+	struct platform_device *pd;
+	int err;
 
-static struct gpio_keys_platform_data db1300_5waysw_data = {
-	.buttons	= db1300_5waysw_arrowkeys,
-	.nbuttons	= ARRAY_SIZE(db1300_5waysw_arrowkeys),
-	.rep		= 1,
-	.name		= "db1300-5wayswitch",
-};
+	err = software_node_register_node_group(db1300_5waysw_swnodes);
+	if (err) {
+		pr_err("failed to register 5waysw software nodes: %d\n", err);
+		return;
+	}
 
-static struct platform_device db1300_5waysw_dev = {
-	.name		= "gpio-keys",
-	.dev	= {
-		.platform_data	= &db1300_5waysw_data,
-	},
-};
+	pd = platform_device_register_full(&(struct platform_device_info){
+		.name	= "gpio-keys",
+		.id	= PLATFORM_DEVID_NONE,
+		.fwnode	= software_node_fwnode(&db1300_5waysw_node),
+	});
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create 5waysw device: %d\n", err);
+}
 
 /**********************************************************************/
 
@@ -764,9 +826,7 @@ static struct platform_driver db1300_wm97xx_driver = {
 /**********************************************************************/
 
 static struct platform_device *db1300_dev[] __initdata = {
-	&db1300_eth_dev,
 	&db1300_i2c_dev,
-	&db1300_5waysw_dev,
 	&db1300_nand_dev,
 	&db1300_ide_dev,
 #ifdef CONFIG_MMC_AU1X
@@ -804,8 +864,6 @@ int __init db1300_dev_setup(void)
 	/*
 	 * setup board
 	 */
-	prom_get_ethernet_addr(&db1300_eth_config.mac[0]);
-
 	i2c_register_board_info(0, db1300_i2c_devs,
 				ARRAY_SIZE(db1300_i2c_devs));
 
@@ -848,6 +906,9 @@ int __init db1300_dev_setup(void)
 	swapped = bcsr_read(BCSR_STATUS) & BCSR_STATUS_DB1200_SWAPBOOT;
 	db1x_register_norflash(64 << 20, 2, swapped);
 
+	db1300_eth_init();
+	db1300_5waysw_init();
+
 	return platform_add_devices(db1300_dev, ARRAY_SIZE(db1300_dev));
 }
 
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
index 43d44f384f97..912534ecb1a4 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
@@ -14,6 +14,9 @@
 
 struct gpio;
 struct gpio_chip;
+struct software_node;
+
+extern const struct software_node alchemy_gpic_node;
 
 /* with the current GPIC design, up to 128 GPIOs are possible.
  * The only implementation so far is in the Au1300, which has 75 externally

-- 
2.53.0.473.g4a7958ca14-goog


