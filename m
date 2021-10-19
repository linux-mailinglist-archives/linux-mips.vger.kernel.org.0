Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9185D4338CA
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 16:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhJSOsJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 10:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbhJSOrv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 10:47:51 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F8FC0617A4
        for <linux-mips@vger.kernel.org>; Tue, 19 Oct 2021 07:45:32 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by xavier.telenet-ops.be with bizsmtp
        id 7qlU2600312AN0U01qlUka; Tue, 19 Oct 2021 16:45:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMp-006B4i-Iw; Tue, 19 Oct 2021 16:45:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMn-00FAC8-Tn; Tue, 19 Oct 2021 16:45:25 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v8 17/21] auxdisplay: ht16k33: Extract frame buffer probing
Date:   Tue, 19 Oct 2021 16:45:16 +0200
Message-Id: <20211019144520.3613926-18-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019144520.3613926-1-geert@linux-m68k.org>
References: <20211019144520.3613926-1-geert@linux-m68k.org>
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
Reviewed-by: Robin van der Gracht <robin@protonic.nl>
---
v8:
  - No changes,

v7:
  - Add Reviewed-by,

v6:
  - No changes,

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
index 60e616c0e932cd84..8993d27909109a98 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -404,33 +404,13 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
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
@@ -444,18 +424,7 @@ static int ht16k33_probe(struct i2c_client *client)
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
@@ -476,8 +445,8 @@ static int ht16k33_probe(struct i2c_client *client)
 		goto err_fbdev_buffer;
 	}
 
-	err = of_property_read_u32(node, "refresh-rate-hz",
-		&fbdev->refresh_rate);
+	err = of_property_read_u32(dev->of_node, "refresh-rate-hz",
+				   &fbdev->refresh_rate);
 	if (err) {
 		dev_err(dev, "refresh rate not specified\n");
 		goto err_fbdev_info;
@@ -499,18 +468,9 @@ static int ht16k33_probe(struct i2c_client *client)
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
@@ -519,6 +479,51 @@ static int ht16k33_probe(struct i2c_client *client)
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

