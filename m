Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19723B43C5
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 14:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhFYNBq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 09:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhFYNBk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 09:01:40 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F66C061156
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 05:59:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1476:ce84:e216:add8])
        by laurent.telenet-ops.be with bizsmtp
        id MQzD250122B1U9901QzDBu; Fri, 25 Jun 2021 14:59:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQP-003TMa-0h; Fri, 25 Jun 2021 14:59:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQN-004sS0-Qz; Fri, 25 Jun 2021 14:59:11 +0200
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
Subject: [PATCH v2 17/18] auxdisplay: ht16k33: Add support for segment displays
Date:   Fri, 25 Jun 2021 14:59:01 +0200
Message-Id: <20210625125902.1162428-18-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625125902.1162428-1-geert@linux-m68k.org>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Holtek HT16K33 LED controller is not only used for driving
dot-matrix displays, but also for driving segment displays.

Add support for 4-digit 7-segment and quad 14-segment alphanumeric
displays, like the Adafruit 7-segment and 14-segment display backpack
and FeatherWing expansion boards.  Use the character line display core
support to display a message, which will be scrolled if it doesn't fit.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
The 7-segment support is based on schematics, and untested on actual
hardware.

v2:
  - Move "select LINEDISP" to this patch,
  - Set "err = -EINVAL" in switch() case that cannot happen.
---
 drivers/auxdisplay/Kconfig   |   1 +
 drivers/auxdisplay/ht16k33.c | 199 +++++++++++++++++++++++++++++++++--
 2 files changed, 193 insertions(+), 7 deletions(-)

diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index b41fdc5f7bf72a1b..42fc7b155de09dbc 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -176,6 +176,7 @@ config HT16K33
 	select FB_SYS_IMAGEBLIT
 	select INPUT_MATRIXKMAP
 	select FB_BACKLIGHT
+	select LINEDISP
 	help
 	  Say yes here to add support for Holtek HT16K33, RAM mapping 16*8
 	  LED controller driver with keyscan.
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index af7489acfacbd409..28207517a4725250 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -5,6 +5,7 @@
  * Author: Robin van der Gracht <robin@protonic.nl>
  *
  * Copyright: (C) 2016 Protonic Holland.
+ * Copyright (C) 2021 Glider bv
  */
 
 #include <linux/kernel.h>
@@ -17,9 +18,18 @@
 #include <linux/backlight.h>
 #include <linux/input.h>
 #include <linux/input/matrix_keypad.h>
+#include <linux/leds.h>
+#include <linux/of_device.h>
 #include <linux/workqueue.h>
 #include <linux/mm.h>
 
+#include <linux/map_to_7segment.h>
+#include <linux/map_to_14segment.h>
+
+#include <asm/unaligned.h>
+
+#include "line-display.h"
+
 /* Registers */
 #define REG_SYSTEM_SETUP		0x20
 #define REG_SYSTEM_SETUP_OSC_ON		BIT(0)
@@ -47,6 +57,12 @@
 #define BYTES_PER_ROW		(HT16K33_MATRIX_LED_MAX_ROWS / 8)
 #define HT16K33_FB_SIZE		(HT16K33_MATRIX_LED_MAX_COLS * BYTES_PER_ROW)
 
+enum display_type {
+	DISP_MATRIX = 0,
+	DISP_QUAD_7SEG,
+	DISP_QUAD_14SEG,
+};
+
 struct ht16k33_keypad {
 	struct i2c_client *client;
 	struct input_dev *dev;
@@ -67,11 +83,25 @@ struct ht16k33_fbdev {
 	uint8_t *cache;
 };
 
+struct ht16k33_seg {
+	struct linedisp linedisp;
+	union {
+		struct seg7_conversion_map seg7;
+		struct seg14_conversion_map seg14;
+	} map;
+	unsigned int map_size;
+	char curr[4];
+};
+
 struct ht16k33_priv {
 	struct i2c_client *client;
 	struct delayed_work work;
 	struct ht16k33_keypad keypad;
-	struct ht16k33_fbdev fbdev;
+	union {
+		struct ht16k33_fbdev fbdev;
+		struct ht16k33_seg seg;
+	};
+	enum display_type type;
 };
 
 static const struct fb_fix_screeninfo ht16k33_fb_fix = {
@@ -101,6 +131,33 @@ static const struct fb_var_screeninfo ht16k33_fb_var = {
 	.vmode = FB_VMODE_NONINTERLACED,
 };
 
+static const SEG7_DEFAULT_MAP(initial_map_seg7);
+static const SEG14_DEFAULT_MAP(initial_map_seg14);
+
+static ssize_t map_seg_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct ht16k33_priv *priv = dev_get_drvdata(dev);
+
+	memcpy(buf, &priv->seg.map, priv->seg.map_size);
+	return priv->seg.map_size;
+}
+
+static ssize_t map_seg_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t cnt)
+{
+	struct ht16k33_priv *priv = dev_get_drvdata(dev);
+
+	if (cnt != priv->seg.map_size)
+		return -EINVAL;
+
+	memcpy(&priv->seg.map, buf, cnt);
+	return cnt;
+}
+
+static DEVICE_ATTR(map_seg7, 0644, map_seg_show, map_seg_store);
+static DEVICE_ATTR(map_seg14, 0644, map_seg_show, map_seg_store);
+
 static int ht16k33_display_on(struct ht16k33_priv *priv)
 {
 	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON;
@@ -325,6 +382,51 @@ static void ht16k33_keypad_stop(struct input_dev *dev)
 	disable_irq(keypad->client->irq);
 }
 
+static void ht16k33_linedisp_update(struct linedisp *linedisp)
+{
+	struct ht16k33_priv *priv = container_of(linedisp, struct ht16k33_priv,
+						 seg.linedisp);
+
+	schedule_delayed_work(&priv->work, 0);
+}
+
+static void ht16k33_seg7_update(struct work_struct *work)
+{
+	struct ht16k33_priv *priv = container_of(work, struct ht16k33_priv,
+						 work.work);
+	struct ht16k33_seg *seg = &priv->seg;
+	char *s = seg->curr;
+	uint8_t buf[9];
+
+	buf[0] = map_to_seg7(&seg->map.seg7, *s++);
+	buf[1] = 0;
+	buf[2] = map_to_seg7(&seg->map.seg7, *s++);
+	buf[3] = 0;
+	buf[4] = 0;
+	buf[5] = 0;
+	buf[6] = map_to_seg7(&seg->map.seg7, *s++);
+	buf[7] = 0;
+	buf[8] = map_to_seg7(&seg->map.seg7, *s++);
+
+	i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
+}
+
+static void ht16k33_seg14_update(struct work_struct *work)
+{
+	struct ht16k33_priv *priv = container_of(work, struct ht16k33_priv,
+						 work.work);
+	struct ht16k33_seg *seg = &priv->seg;
+	char *s = seg->curr;
+	uint8_t buf[8];
+
+	put_unaligned_le16(map_to_seg14(&seg->map.seg14, *s++), buf);
+	put_unaligned_le16(map_to_seg14(&seg->map.seg14, *s++), buf + 2);
+	put_unaligned_le16(map_to_seg14(&seg->map.seg14, *s++), buf + 4);
+	put_unaligned_le16(map_to_seg14(&seg->map.seg14, *s++), buf + 6);
+
+	i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
+}
+
 static int ht16k33_keypad_probe(struct i2c_client *client,
 				struct ht16k33_keypad *keypad)
 {
@@ -471,10 +573,58 @@ static int ht16k33_fbdev_probe(struct i2c_client *client,
 	return err;
 }
 
+static int ht16k33_seg_probe(struct i2c_client *client,
+			     struct ht16k33_priv *priv, uint32_t brightness)
+{
+	struct ht16k33_seg *seg = &priv->seg;
+	struct device *dev = &client->dev;
+	int err;
+
+	err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
+	if (err)
+		return err;
+
+	switch (priv->type) {
+	case DISP_MATRIX:
+		/* not handled here */
+		err = -EINVAL;
+		break;
+
+	case DISP_QUAD_7SEG:
+		INIT_DELAYED_WORK(&priv->work, ht16k33_seg7_update);
+		seg->map.seg7 = initial_map_seg7;
+		seg->map_size = sizeof(seg->map.seg7);
+		err = device_create_file(dev, &dev_attr_map_seg7);
+		break;
+
+	case DISP_QUAD_14SEG:
+		INIT_DELAYED_WORK(&priv->work, ht16k33_seg14_update);
+		seg->map.seg14 = initial_map_seg14;
+		seg->map_size = sizeof(seg->map.seg14);
+		err = device_create_file(dev, &dev_attr_map_seg14);
+		break;
+	}
+	if (err)
+		return err;
+
+	err = linedisp_register(&seg->linedisp, dev, 4, seg->curr,
+				ht16k33_linedisp_update);
+	if (err)
+		goto err_remove_map_file;
+
+	return 0;
+
+err_remove_map_file:
+	device_remove_file(dev, &dev_attr_map_seg7);
+	device_remove_file(dev, &dev_attr_map_seg14);
+	return err;
+}
+
 static int ht16k33_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device_node *node = dev->of_node;
+	const struct of_device_id *id;
 	struct ht16k33_priv *priv;
 	uint32_t dft_brightness;
 	int err;
@@ -489,6 +639,9 @@ static int ht16k33_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->client = client;
+	id = i2c_of_match_device(dev->driver->of_match_table, client);
+	if (id)
+		priv->type = (uintptr_t)id->data;
 	i2c_set_clientdata(client, priv);
 
 	err = ht16k33_initialize(priv);
@@ -513,8 +666,19 @@ static int ht16k33_probe(struct i2c_client *client)
 			return err;
 	}
 
-	/* Frame Buffer Display */
-	return ht16k33_fbdev_probe(client, priv, dft_brightness);
+	switch (priv->type) {
+	case DISP_MATRIX:
+		/* Frame Buffer Display */
+		err = ht16k33_fbdev_probe(client, priv, dft_brightness);
+		break;
+
+	case DISP_QUAD_7SEG:
+	case DISP_QUAD_14SEG:
+		/* Segment Display */
+		err = ht16k33_seg_probe(client, priv, dft_brightness);
+		break;
+	}
+	return err;
 }
 
 static int ht16k33_remove(struct i2c_client *client)
@@ -523,9 +687,21 @@ static int ht16k33_remove(struct i2c_client *client)
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
 
 	cancel_delayed_work_sync(&priv->work);
-	unregister_framebuffer(fbdev->info);
-	framebuffer_release(fbdev->info);
-	free_page((unsigned long) fbdev->buffer);
+
+	switch (priv->type) {
+	case DISP_MATRIX:
+		unregister_framebuffer(fbdev->info);
+		framebuffer_release(fbdev->info);
+		free_page((unsigned long)fbdev->buffer);
+		break;
+
+	case DISP_QUAD_7SEG:
+	case DISP_QUAD_14SEG:
+		linedisp_unregister(&priv->seg.linedisp);
+		device_remove_file(&client->dev, &dev_attr_map_seg7);
+		device_remove_file(&client->dev, &dev_attr_map_seg14);
+		break;
+	}
 
 	return 0;
 }
@@ -537,7 +713,16 @@ static const struct i2c_device_id ht16k33_i2c_match[] = {
 MODULE_DEVICE_TABLE(i2c, ht16k33_i2c_match);
 
 static const struct of_device_id ht16k33_of_match[] = {
-	{ .compatible = "holtek,ht16k33", },
+	{
+		/* 0.56" 4-Digit 7-Segment FeatherWing Display (Red) */
+		.compatible = "adafruit,3108", .data = (void *)DISP_QUAD_7SEG,
+	}, {
+		/* 0.54" Quad Alphanumeric FeatherWing Display (Red) */
+		.compatible = "adafruit,3130", .data = (void *)DISP_QUAD_14SEG,
+	}, {
+		/* Generic, assumed Dot-Matrix Display */
+		.compatible = "holtek,ht16k33", .data = (void *)DISP_MATRIX,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ht16k33_of_match);
-- 
2.25.1

