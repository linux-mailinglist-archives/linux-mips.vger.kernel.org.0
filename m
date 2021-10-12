Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E8E42AC8C
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 20:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234412AbhJLSxN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 14:53:13 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:60568 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234071AbhJLSxI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 14:53:08 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4HTPgH3bryzMqffv
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 20:43:07 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by albert.telenet-ops.be with bizsmtp
        id 56ZX2600M0KW32a066ZXkY; Tue, 12 Oct 2021 20:33:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMah-004RU6-36; Tue, 12 Oct 2021 20:33:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMag-002j6l-5h; Tue, 12 Oct 2021 20:33:30 +0200
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
Subject: [PATCH v7 14/21] auxdisplay: ht16k33: Add helper variable dev
Date:   Tue, 12 Oct 2021 20:33:20 +0200
Message-Id: <20211012183327.649865-15-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012183327.649865-1-geert@linux-m68k.org>
References: <20211012183327.649865-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver has many users of "client->dev".  Add shorthands to simplify
the code.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Robin van der Gracht <robin@protonic.nl>
---
v7:
  - No changes,

v6:
  - No changes,

v5:
  - No changes,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Acked-by,
  - Rebased.
---
 drivers/auxdisplay/ht16k33.c | 43 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index d0d7b55059aa181e..dcf530a9390b6f9c 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -326,7 +326,8 @@ static void ht16k33_keypad_stop(struct input_dev *dev)
 static int ht16k33_keypad_probe(struct i2c_client *client,
 				struct ht16k33_keypad *keypad)
 {
-	struct device_node *node = client->dev.of_node;
+	struct device *dev = &client->dev;
+	struct device_node *node = dev->of_node;
 	u32 rows = HT16K33_MATRIX_KEYPAD_MAX_ROWS;
 	u32 cols = HT16K33_MATRIX_KEYPAD_MAX_COLS;
 	int err;
@@ -334,7 +335,7 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	keypad->client = client;
 	init_waitqueue_head(&keypad->wait);
 
-	keypad->dev = devm_input_allocate_device(&client->dev);
+	keypad->dev = devm_input_allocate_device(dev);
 	if (!keypad->dev)
 		return -ENOMEM;
 
@@ -351,17 +352,17 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	err = of_property_read_u32(node, "debounce-delay-ms",
 				   &keypad->debounce_ms);
 	if (err) {
-		dev_err(&client->dev, "key debounce delay not specified\n");
+		dev_err(dev, "key debounce delay not specified\n");
 		return err;
 	}
 
-	err = matrix_keypad_parse_of_params(&client->dev, &rows, &cols);
+	err = matrix_keypad_parse_of_params(dev, &rows, &cols);
 	if (err)
 		return err;
 	if (rows > HT16K33_MATRIX_KEYPAD_MAX_ROWS ||
 	    cols > HT16K33_MATRIX_KEYPAD_MAX_COLS) {
-		dev_err(&client->dev, "%u rows or %u cols out of range in DT\n",
-			rows, cols);
+		dev_err(dev, "%u rows or %u cols out of range in DT\n", rows,
+			cols);
 		return -ERANGE;
 	}
 
@@ -372,17 +373,17 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	err = matrix_keypad_build_keymap(NULL, NULL, rows, cols, NULL,
 					 keypad->dev);
 	if (err) {
-		dev_err(&client->dev, "failed to build keymap\n");
+		dev_err(dev, "failed to build keymap\n");
 		return err;
 	}
 
-	err = devm_request_threaded_irq(&client->dev, client->irq,
-					NULL, ht16k33_keypad_irq_thread,
+	err = devm_request_threaded_irq(dev, client->irq, NULL,
+					ht16k33_keypad_irq_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					DRIVER_NAME, keypad);
 	if (err) {
-		dev_err(&client->dev, "irq request failed %d, error %d\n",
-			client->irq, err);
+		dev_err(dev, "irq request failed %d, error %d\n", client->irq,
+			err);
 		return err;
 	}
 
@@ -399,14 +400,15 @@ static int ht16k33_probe(struct i2c_client *client)
 	struct backlight_properties bl_props;
 	struct ht16k33_priv *priv;
 	struct ht16k33_fbdev *fbdev;
-	struct device_node *node = client->dev.of_node;
+	struct device *dev = &client->dev;
+	struct device_node *node = dev->of_node;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_err(&client->dev, "i2c_check_functionality error\n");
+		dev_err(dev, "i2c_check_functionality error\n");
 		return -EIO;
 	}
 
-	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -423,11 +425,10 @@ static int ht16k33_probe(struct i2c_client *client)
 	bl_props.type = BACKLIGHT_RAW;
 	bl_props.max_brightness = MAX_BRIGHTNESS;
 
-	bl = devm_backlight_device_register(&client->dev, DRIVER_NAME"-bl",
-					    &client->dev, priv,
+	bl = devm_backlight_device_register(dev, DRIVER_NAME"-bl", dev, priv,
 					    &ht16k33_bl_ops, &bl_props);
 	if (IS_ERR(bl)) {
-		dev_err(&client->dev, "failed to register backlight\n");
+		dev_err(dev, "failed to register backlight\n");
 		return PTR_ERR(bl);
 	}
 
@@ -436,7 +437,7 @@ static int ht16k33_probe(struct i2c_client *client)
 	if (err) {
 		dft_brightness = MAX_BRIGHTNESS;
 	} else if (dft_brightness > MAX_BRIGHTNESS) {
-		dev_warn(&client->dev,
+		dev_warn(dev,
 			 "invalid default brightness level: %u, using %u\n",
 			 dft_brightness, MAX_BRIGHTNESS);
 		dft_brightness = MAX_BRIGHTNESS;
@@ -451,13 +452,13 @@ static int ht16k33_probe(struct i2c_client *client)
 	if (!fbdev->buffer)
 		return -ENOMEM;
 
-	fbdev->cache = devm_kmalloc(&client->dev, HT16K33_FB_SIZE, GFP_KERNEL);
+	fbdev->cache = devm_kmalloc(dev, HT16K33_FB_SIZE, GFP_KERNEL);
 	if (!fbdev->cache) {
 		err = -ENOMEM;
 		goto err_fbdev_buffer;
 	}
 
-	fbdev->info = framebuffer_alloc(0, &client->dev);
+	fbdev->info = framebuffer_alloc(0, dev);
 	if (!fbdev->info) {
 		err = -ENOMEM;
 		goto err_fbdev_buffer;
@@ -466,7 +467,7 @@ static int ht16k33_probe(struct i2c_client *client)
 	err = of_property_read_u32(node, "refresh-rate-hz",
 		&fbdev->refresh_rate);
 	if (err) {
-		dev_err(&client->dev, "refresh rate not specified\n");
+		dev_err(dev, "refresh rate not specified\n");
 		goto err_fbdev_info;
 	}
 	fb_bl_default_curve(fbdev->info, 0, MIN_BRIGHTNESS, MAX_BRIGHTNESS);
-- 
2.25.1

