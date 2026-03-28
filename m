Return-Path: <linux-mips+bounces-13980-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOgZKlP7x2mIfwUAu9opvQ
	(envelope-from <linux-mips+bounces-13980-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 17:01:23 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949434F11D
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 17:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A1823064E8B
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 15:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02301367F5B;
	Sat, 28 Mar 2026 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bm7fMoYF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3923352927;
	Sat, 28 Mar 2026 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713356; cv=none; b=AYkg6vzRnyNaldCPyybmoHtPVb/KGdtDnlyfxhA244TXXw+0wuXu3gtuN3aV6s2AJyjlcqeltHEH6zbGlW4CaaW0LvGdRGOQo32L5+87exGpPaSDgR9ojvjP85NDFWyP91AaiyRL5grT5PVnVVIzPUDHVnXzO3djsFzf0IjBoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713356; c=relaxed/simple;
	bh=UD/TwSuuylvsTVk6WuLqLc/i823tJemYw2VTGjQDzOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMgKiyVhwGX4uyRyXSoWxqVEmksfTZAXyYtqr3rdWe5Ff/RS9HFerBnAgbY7e2OUQrDSAd1ytgY9iwoVKTCcC7rfuT9jcwsXHLq2YrY8XCjbMPsPF1BSyvvz37dfzfb1lfnTOmAIEfskv24c0ViRZ02+SWqbrgQs+3bXug+SljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bm7fMoYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A26C2BC86;
	Sat, 28 Mar 2026 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774713356;
	bh=UD/TwSuuylvsTVk6WuLqLc/i823tJemYw2VTGjQDzOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bm7fMoYFkUbimvOYpNbqJa1zS9jOSlu3hhkd1VIWosEKAiRFMr0AbqbdeuoXQ6za1
	 slZjp+JbOw4XGUTyGKd83DJdlyE5RLol1fN1LxQZS3Qy5C5ae/SHwu7NvyvLNl+7Kl
	 Tmy9K7uxnwDUIRiXkcR4sy4eXorE6OLiKOqpKde6NYgCh+LgD0jhwG5nfFsQoePwmZ
	 5NBVj5J41BY1UqisNpeBe79Z7tqOQ3DxRnBATawJnrhNFinStUy9sE6tcHzv/y5sVB
	 +qsZ1B1KWFzbeMgHRm8nwy9ZbvEPdthwa1FuEKJx/2bZcB7mlBXeONsodKpwPcFNS7
	 d0+YXPgPSQ2hA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Mar 2026 16:55:48 +0100
Subject: [PATCH 2/2] MIPS/mtd: Handle READY GPIO in generic NAND platform
 data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-mips-input-rb532-button-v1-2-98e201621501@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13980-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com,kernel.org,bootlin.com,nod.at,ti.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 4949434F11D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The callbacks into the MIPS RB532 platform to read the GPIO pin
indicating that the NAND chip is ready are oldschool and does
not assign GPIOs as properties to the NAND device.

Add a capability to the generic platform NAND chip driver to use
a GPIO line to detect if a NAND chip is ready and override the
platform-local drv_ready() callback with this check if the GPIO
is present.

This makes it possible to drop the legacy include header
<linux/gpio.h> from the RB532 devices.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/mips/rb532/devices.c        | 36 +++++++++++++++++++++---------------
 drivers/mtd/nand/raw/plat_nand.c | 24 +++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 3f56d9feb73a..c3d8d96d0ef5 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -14,7 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/mtd/platnand.h>
 #include <linux/mtd/mtd.h>
-#include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/gpio_keys.h>
@@ -135,12 +134,6 @@ static struct platform_device cf_slot0 = {
 	.num_resources = ARRAY_SIZE(cf_slot0_res),
 };
 
-/* Resources and device for NAND */
-static int rb532_dev_ready(struct nand_chip *chip)
-{
-	return gpio_get_value(GPIO_RDY);
-}
-
 static void rb532_cmd_ctrl(struct nand_chip *chip, int cmd, unsigned int ctrl)
 {
 	unsigned char orbits, nandbits;
@@ -166,16 +159,23 @@ static struct resource nand_slot0_res[] = {
 };
 
 static struct platform_nand_data rb532_nand_data = {
-	.ctrl.dev_ready = rb532_dev_ready,
 	.ctrl.cmd_ctrl	= rb532_cmd_ctrl,
 };
 
-static struct platform_device nand_slot0 = {
-	.name = "gen_nand",
-	.id = -1,
-	.resource = nand_slot0_res,
-	.num_resources = ARRAY_SIZE(nand_slot0_res),
-	.dev.platform_data = &rb532_nand_data,
+static const struct property_entry nand0_properties[] = {
+	PROPERTY_ENTRY_GPIO("ready-gpios", &rb532_gpio0_node,
+			    GPIO_RDY, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct platform_device_info nand0_info  __initconst = {
+	.name		= "gen_nand",
+	.id		= PLATFORM_DEVID_NONE,
+	.res		= nand_slot0_res,
+	.num_res	= ARRAY_SIZE(nand_slot0_res),
+	.data		= &rb532_nand_data,
+	.size_data	= sizeof(struct platform_nand_data),
+	.properties	= nand0_properties,
 };
 
 static struct mtd_partition rb532_partition_info[] = {
@@ -234,7 +234,6 @@ static struct platform_device rb532_uart = {
 
 static struct platform_device *rb532_devs[] = {
 	&korina_dev0,
-	&nand_slot0,
 	&cf_slot0,
 	&rb532_led,
 	&rb532_uart,
@@ -321,6 +320,13 @@ static int __init plat_setup_devices(void)
 	 */
 	software_node_register(&rb532_gpio0_node);
 
+	pd = platform_device_register_full(&nand0_info);
+	ret = PTR_ERR_OR_ZERO(pd);
+	if (ret) {
+		pr_err("failed to create NAND slot0 device: %d\n", ret);
+		return ret;
+	}
+
 	pd = platform_device_register_full(&rb532_button_info);
 	ret = PTR_ERR_OR_ZERO(pd);
 	if (ret) {
diff --git a/drivers/mtd/nand/raw/plat_nand.c b/drivers/mtd/nand/raw/plat_nand.c
index 0bcd455328ef..fe31551bcf5f 100644
--- a/drivers/mtd/nand/raw/plat_nand.c
+++ b/drivers/mtd/nand/raw/plat_nand.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -17,6 +18,7 @@ struct plat_nand_data {
 	struct nand_controller	controller;
 	struct nand_chip	chip;
 	void __iomem		*io_base;
+	struct gpio_desc	*ready_gpio;
 };
 
 static int plat_nand_attach_chip(struct nand_chip *chip)
@@ -32,6 +34,14 @@ static const struct nand_controller_ops plat_nand_ops = {
 	.attach_chip = plat_nand_attach_chip,
 };
 
+/* Resources and device for NAND */
+static int plat_nand_gpio_dev_ready(struct nand_chip *chip)
+{
+	struct plat_nand_data *data = nand_get_controller_data(chip);
+
+	return gpiod_get_value(data->ready_gpio);
+}
+
 /*
  * Probe for the NAND device.
  */
@@ -41,6 +51,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 	struct plat_nand_data *data;
 	struct mtd_info *mtd;
 	const char **part_types;
+	struct nand_chip *chip;
 	int err = 0;
 
 	if (!pdata) {
@@ -59,9 +70,17 @@ static int plat_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->ready_gpio = devm_gpiod_get_optional(&pdev->dev, "ready",
+						   GPIOD_IN);
+	if (IS_ERR(data->ready_gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->ready_gpio),
+				     "could not get READY GPIO\n");
+
 	data->controller.ops = &plat_nand_ops;
 	nand_controller_init(&data->controller);
 	data->chip.controller = &data->controller;
+	chip = &data->chip;
+	nand_set_controller_data(chip, data);
 
 	data->io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->io_base))
@@ -74,7 +93,10 @@ static int plat_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.IO_ADDR_R = data->io_base;
 	data->chip.legacy.IO_ADDR_W = data->io_base;
 	data->chip.legacy.cmd_ctrl = pdata->ctrl.cmd_ctrl;
-	data->chip.legacy.dev_ready = pdata->ctrl.dev_ready;
+	if (data->ready_gpio)
+		data->chip.legacy.dev_ready = plat_nand_gpio_dev_ready;
+	else
+		data->chip.legacy.dev_ready = pdata->ctrl.dev_ready;
 	data->chip.legacy.select_chip = pdata->ctrl.select_chip;
 	data->chip.legacy.write_buf = pdata->ctrl.write_buf;
 	data->chip.legacy.read_buf = pdata->ctrl.read_buf;

-- 
2.53.0


