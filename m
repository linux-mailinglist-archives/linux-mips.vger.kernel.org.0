Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0594B3B43C8
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 14:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhFYNBr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 09:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbhFYNBk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 09:01:40 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CFFC061574
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 05:59:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1476:ce84:e216:add8])
        by andre.telenet-ops.be with bizsmtp
        id MQzD2500K2B1U9901QzDgH; Fri, 25 Jun 2021 14:59:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQO-003TMZ-PI; Fri, 25 Jun 2021 14:59:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQN-004sRh-QH; Fri, 25 Jun 2021 14:59:11 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 16/18] auxdisplay: ht16k33: Extract frame buffer probing
Date:   Fri, 25 Jun 2021 14:59:00 +0200
Message-Id: <20210625125902.1162428-17-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625125902.1162428-1-geert@linux-m68k.org>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
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
v2:
  - Rebased.
---
 drivers/auxdisplay/ht16k33.c | 98 +++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 45 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index ed5aab2627e028ed..af7489acfacbd409 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -394,33 +394,15 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	return input_register_device(keypad->dev);
 }
 
-static int ht16k33_probe(struct i2c_client *client)
+static int ht16k33_fbdev_probe(struct i2c_client *client,
+			       struct ht16k33_priv *priv, uint32_t brightness)
 {
-	int err;
-	uint32_t dft_brightness;
-	struct backlight_device *bl;
-	struct backlight_properties bl_props;
-	struct ht16k33_priv *priv;
-	struct ht16k33_fbdev *fbdev;
 	struct device *dev = &client->dev;
+	struct ht16k33_fbdev *fbdev = &priv->fbdev;
 	struct device_node *node = dev->of_node;
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
+	struct backlight_properties bl_props;
+	struct backlight_device *bl;
+	int err;
 
 	/* Backlight */
 	memset(&bl_props, 0, sizeof(struct backlight_properties));
@@ -434,18 +416,7 @@ static int ht16k33_probe(struct i2c_client *client)
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
@@ -489,18 +460,9 @@ static int ht16k33_probe(struct i2c_client *client)
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
@@ -509,6 +471,52 @@ static int ht16k33_probe(struct i2c_client *client)
 	return err;
 }
 
+static int ht16k33_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device_node *node = dev->of_node;
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
+	err = of_property_read_u32(node, "default-brightness-level",
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
+	return ht16k33_fbdev_probe(client, priv, dft_brightness);
+}
+
 static int ht16k33_remove(struct i2c_client *client)
 {
 	struct ht16k33_priv *priv = i2c_get_clientdata(client);
-- 
2.25.1

