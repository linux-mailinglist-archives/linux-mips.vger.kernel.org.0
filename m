Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B05C3447D8
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 15:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhCVOta (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 10:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhCVOtB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 10:49:01 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C269FC061788
        for <linux-mips@vger.kernel.org>; Mon, 22 Mar 2021 07:48:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:250b:f16c:c5e2:505d])
        by albert.telenet-ops.be with bizsmtp
        id jSot2400m2HDxaV06Sot7n; Mon, 22 Mar 2021 15:48:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrQ-009ZWO-Qg; Mon, 22 Mar 2021 15:48:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrP-004T6U-Qo; Mon, 22 Mar 2021 15:48:51 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 12/17] auxdisplay: ht16k33: Add helper variable dev
Date:   Mon, 22 Mar 2021 15:48:43 +0100
Message-Id: <20210322144848.1065067-13-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322144848.1065067-1-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver has many users of "client->dev".  Add shorthands to simplify
the code.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/auxdisplay/ht16k33.c | 43 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 1b67f38109bddba8..37fca1d44c3e73e1 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -316,7 +316,8 @@ static void ht16k33_keypad_stop(struct input_dev *dev)
 static int ht16k33_keypad_probe(struct i2c_client *client,
 				struct ht16k33_keypad *keypad)
 {
-	struct device_node *node = client->dev.of_node;
+	struct device *dev = &client->dev;
+	struct device_node *node = dev->of_node;
 	u32 rows = HT16K33_MATRIX_KEYPAD_MAX_ROWS;
 	u32 cols = HT16K33_MATRIX_KEYPAD_MAX_COLS;
 	int err;
@@ -324,7 +325,7 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	keypad->client = client;
 	init_waitqueue_head(&keypad->wait);
 
-	keypad->dev = devm_input_allocate_device(&client->dev);
+	keypad->dev = devm_input_allocate_device(dev);
 	if (!keypad->dev)
 		return -ENOMEM;
 
@@ -341,17 +342,17 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
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
 
@@ -362,17 +363,17 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
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
 
@@ -389,14 +390,15 @@ static int ht16k33_probe(struct i2c_client *client)
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
 
@@ -414,13 +416,13 @@ static int ht16k33_probe(struct i2c_client *client)
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
@@ -429,7 +431,7 @@ static int ht16k33_probe(struct i2c_client *client)
 	err = of_property_read_u32(node, "refresh-rate-hz",
 		&fbdev->refresh_rate);
 	if (err) {
-		dev_err(&client->dev, "refresh rate not specified\n");
+		dev_err(dev, "refresh rate not specified\n");
 		goto err_fbdev_info;
 	}
 	fb_bl_default_curve(fbdev->info, 0, MIN_BRIGHTNESS, MAX_BRIGHTNESS);
@@ -460,11 +462,10 @@ static int ht16k33_probe(struct i2c_client *client)
 	bl_props.type = BACKLIGHT_RAW;
 	bl_props.max_brightness = MAX_BRIGHTNESS;
 
-	bl = devm_backlight_device_register(&client->dev, DRIVER_NAME"-bl",
-					    &client->dev, priv,
+	bl = devm_backlight_device_register(dev, DRIVER_NAME"-bl", dev, priv,
 					    &ht16k33_bl_ops, &bl_props);
 	if (IS_ERR(bl)) {
-		dev_err(&client->dev, "failed to register backlight\n");
+		dev_err(dev, "failed to register backlight\n");
 		err = PTR_ERR(bl);
 		goto err_fbdev_unregister;
 	}
@@ -474,7 +475,7 @@ static int ht16k33_probe(struct i2c_client *client)
 	if (err) {
 		dft_brightness = MAX_BRIGHTNESS;
 	} else if (dft_brightness > MAX_BRIGHTNESS) {
-		dev_warn(&client->dev,
+		dev_warn(dev,
 			 "invalid default brightness level: %u, using %u\n",
 			 dft_brightness, MAX_BRIGHTNESS);
 		dft_brightness = MAX_BRIGHTNESS;
-- 
2.25.1

