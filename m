Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E2E3E8DBB
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 11:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236910AbhHKJ6h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 05:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236847AbhHKJ6e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 05:58:34 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E7BC0617A1
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 02:58:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by michel.telenet-ops.be with bizsmtp
        id g9y5250021gJxCh069y5zi; Wed, 11 Aug 2021 11:58:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkzs-001zga-NT; Wed, 11 Aug 2021 11:58:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkzr-005NPu-P7; Wed, 11 Aug 2021 11:58:03 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v5 16/19] auxdisplay: ht16k33: Extract frame buffer probing
Date:   Wed, 11 Aug 2021 11:57:56 +0200
Message-Id: <20210811095759.1281480-17-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811095759.1281480-1-geert@linux-m68k.org>
References: <20210811095759.1281480-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Extract all frame buffer (including backlight) probing into
ht16k33_fbdev_probe().

Call ht16k33_fbdev_probe() after ht16k33_keypad_probe(), as the latter
does not need any manual cleanup in the probe error path.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v5:
  - No changes,

v4:
  - No changes,

v3:
  - Pass "dev" instead of "client" to ht16k33_fbdev_probe(),
  - Drop local variable "node",

v2:
  - Rebased.
---
 drivers/auxdisplay/ht16k33.c | 101 ++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 48 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 928ac9722c142855..27ac167dae74bd82 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -394,33 +394,13 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	return input_register_device(keypad->dev);
 }
 
-static int ht16k33_probe(struct i2c_client *client)
+static int ht16k33_fbdev_probe(struct device *dev, struct ht16k33_priv *priv,
+			       uint32_t brightness)
 {
-	int err;
-	uint32_t dft_brightness;
-	struct backlight_device *bl;
+	struct ht16k33_fbdev *fbdev = &priv->fbdev;
 	struct backlight_properties bl_props;
-	struct ht16k33_priv *priv;
-	struct ht16k33_fbdev *fbdev;
-	struct device *dev = &client->dev;
-	struct device_node *node = dev->of_node;
-
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_err(dev, "i2c_check_functionality error\n");
-		return -EIO;
-	}
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->client = client;
-	i2c_set_clientdata(client, priv);
-	fbdev = &priv->fbdev;
-
-	err = ht16k33_initialize(priv);
-	if (err)
-		return err;
+	struct backlight_device *bl;
+	int err;
 
 	/* Backlight */
 	memset(&bl_props, 0, sizeof(struct backlight_properties));
@@ -434,18 +414,7 @@ static int ht16k33_probe(struct i2c_client *client)
 		return PTR_ERR(bl);
 	}
 
-	err = of_property_read_u32(node, "default-brightness-level",
-				   &dft_brightness);
-	if (err) {
-		dft_brightness = MAX_BRIGHTNESS;
-	} else if (dft_brightness > MAX_BRIGHTNESS) {
-		dev_warn(dev,
-			 "invalid default brightness level: %u, using %u\n",
-			 dft_brightness, MAX_BRIGHTNESS);
-		dft_brightness = MAX_BRIGHTNESS;
-	}
-
-	bl->props.brightness = dft_brightness;
+	bl->props.brightness = brightness;
 	ht16k33_bl_update_status(bl);
 
 	/* Framebuffer (2 bytes per column) */
@@ -466,8 +435,8 @@ static int ht16k33_probe(struct i2c_client *client)
 		goto err_fbdev_buffer;
 	}
 
-	err = of_property_read_u32(node, "refresh-rate-hz",
-		&fbdev->refresh_rate);
+	err = of_property_read_u32(dev->of_node, "refresh-rate-hz",
+				   &fbdev->refresh_rate);
 	if (err) {
 		dev_err(dev, "refresh rate not specified\n");
 		goto err_fbdev_info;
@@ -489,18 +458,9 @@ static int ht16k33_probe(struct i2c_client *client)
 	if (err)
 		goto err_fbdev_info;
 
-	/* Keypad */
-	if (client->irq > 0) {
-		err = ht16k33_keypad_probe(client, &priv->keypad);
-		if (err)
-			goto err_fbdev_unregister;
-	}
-
 	ht16k33_fb_queue(priv);
 	return 0;
 
-err_fbdev_unregister:
-	unregister_framebuffer(fbdev->info);
 err_fbdev_info:
 	framebuffer_release(fbdev->info);
 err_fbdev_buffer:
@@ -509,6 +469,51 @@ static int ht16k33_probe(struct i2c_client *client)
 	return err;
 }
 
+static int ht16k33_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ht16k33_priv *priv;
+	uint32_t dft_brightness;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(dev, "i2c_check_functionality error\n");
+		return -EIO;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+	i2c_set_clientdata(client, priv);
+
+	err = ht16k33_initialize(priv);
+	if (err)
+		return err;
+
+	err = of_property_read_u32(dev->of_node, "default-brightness-level",
+				   &dft_brightness);
+	if (err) {
+		dft_brightness = MAX_BRIGHTNESS;
+	} else if (dft_brightness > MAX_BRIGHTNESS) {
+		dev_warn(dev,
+			 "invalid default brightness level: %u, using %u\n",
+			 dft_brightness, MAX_BRIGHTNESS);
+		dft_brightness = MAX_BRIGHTNESS;
+	}
+
+	/* Keypad */
+	if (client->irq > 0) {
+		err = ht16k33_keypad_probe(client, &priv->keypad);
+		if (err)
+			return err;
+	}
+
+	/* Frame Buffer Display */
+	return ht16k33_fbdev_probe(dev, priv, dft_brightness);
+}
+
 static int ht16k33_remove(struct i2c_client *client)
 {
 	struct ht16k33_priv *priv = i2c_get_clientdata(client);
-- 
2.25.1

