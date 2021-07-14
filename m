Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51533C86D0
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jul 2021 17:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239716AbhGNPOk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jul 2021 11:14:40 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:51608 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239743AbhGNPOe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jul 2021 11:14:34 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4GQ1Ds32HXzMqnfy
        for <linux-mips@vger.kernel.org>; Wed, 14 Jul 2021 17:11:41 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
        by baptiste.telenet-ops.be with bizsmtp
        id V3Bf250024sai0K013Bf65; Wed, 14 Jul 2021 17:11:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXy-001ARe-PW; Wed, 14 Jul 2021 17:11:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXx-00AchN-UO; Wed, 14 Jul 2021 17:11:37 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 19/19] auxdisplay: ht16k33: Add LED support
Date:   Wed, 14 Jul 2021 17:11:30 +0200
Message-Id: <20210714151130.2531831-20-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714151130.2531831-1-geert@linux-m68k.org>
References: <20210714151130.2531831-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instantiate a single LED based on the "led" subnode in DT.
This allows the user to control display brightness and blinking (backed
by hardware support) through the LED class API and triggers, and exposes
the display color.  The LED will be named
"auxdisplay:<color>:<function>".

When running in dot-matrix mode and if no "led" subnode is found, the
driver falls back to the traditional backlight mode, to preserve
backwards compatibility.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Remove unneeded C++ comment,
  - Use "err" instead of "error" to be consistent with existing driver
    naming style,
  - Make the creation of the LED device dependent on the presence of the
    "led" subnode in DT, so it can be used in dot-matrix mode too.
  - Use led_init_data() and devm_led_classdev_register_ext() to retrieve
    all LED properties from DT, instead of manual LED name construction
    based on just the "color" property,

v2:
  - Use "auxdisplay" instead of DRIVER_NAME in LED name.
---
 drivers/auxdisplay/ht16k33.c | 124 ++++++++++++++++++++++++++++++-----
 1 file changed, 107 insertions(+), 17 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 3b555e119e326cec..8c9a4a554a680ff2 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -18,6 +18,7 @@
 #include <linux/backlight.h>
 #include <linux/input.h>
 #include <linux/input/matrix_keypad.h>
+#include <linux/leds.h>
 #include <linux/workqueue.h>
 #include <linux/mm.h>
 
@@ -34,6 +35,10 @@
 
 #define REG_DISPLAY_SETUP		0x80
 #define REG_DISPLAY_SETUP_ON		BIT(0)
+#define REG_DISPLAY_SETUP_BLINK_OFF	(0 << 1)
+#define REG_DISPLAY_SETUP_BLINK_2HZ	(1 << 1)
+#define REG_DISPLAY_SETUP_BLINK_1HZ	(2 << 1)
+#define REG_DISPLAY_SETUP_BLINK_0HZ5	(3 << 1)
 
 #define REG_ROWINT_SET			0xA0
 #define REG_ROWINT_SET_INT_EN		BIT(0)
@@ -94,12 +99,14 @@ struct ht16k33_seg {
 struct ht16k33_priv {
 	struct i2c_client *client;
 	struct delayed_work work;
+	struct led_classdev led;
 	struct ht16k33_keypad keypad;
 	union {
 		struct ht16k33_fbdev fbdev;
 		struct ht16k33_seg seg;
 	};
 	enum display_type type;
+	uint8_t blink;
 };
 
 static const struct fb_fix_screeninfo ht16k33_fb_fix = {
@@ -158,7 +165,7 @@ static DEVICE_ATTR(map_seg14, 0644, map_seg_show, map_seg_store);
 
 static int ht16k33_display_on(struct ht16k33_priv *priv)
 {
-	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON;
+	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON | priv->blink;
 
 	return i2c_smbus_write_byte(priv->client, data);
 }
@@ -173,8 +180,10 @@ static int ht16k33_brightness_set(struct ht16k33_priv *priv,
 {
 	int err;
 
-	if (brightness == 0)
+	if (brightness == 0) {
+		priv->blink = REG_DISPLAY_SETUP_BLINK_OFF;
 		return ht16k33_display_off(priv);
+	}
 
 	err = ht16k33_display_on(priv);
 	if (err)
@@ -184,6 +193,49 @@ static int ht16k33_brightness_set(struct ht16k33_priv *priv,
 				    REG_BRIGHTNESS | (brightness - 1));
 }
 
+static int ht16k33_brightness_set_blocking(struct led_classdev *led_cdev,
+					   enum led_brightness brightness)
+{
+	struct ht16k33_priv *priv = container_of(led_cdev, struct ht16k33_priv,
+						 led);
+
+	return ht16k33_brightness_set(priv, brightness);
+}
+
+static int ht16k33_blink_set(struct led_classdev *led_cdev,
+			     unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct ht16k33_priv *priv = container_of(led_cdev, struct ht16k33_priv,
+						 led);
+	unsigned int delay;
+	uint8_t blink;
+	int err;
+
+	if (!*delay_on && !*delay_off) {
+		blink = REG_DISPLAY_SETUP_BLINK_1HZ;
+		delay = 1000;
+	} else if (*delay_on <= 750) {
+		blink = REG_DISPLAY_SETUP_BLINK_2HZ;
+		delay = 500;
+	} else if (*delay_on <= 1500) {
+		blink = REG_DISPLAY_SETUP_BLINK_1HZ;
+		delay = 1000;
+	} else {
+		blink = REG_DISPLAY_SETUP_BLINK_0HZ5;
+		delay = 2000;
+	}
+
+	err = i2c_smbus_write_byte(priv->client,
+				   REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON |
+				   blink);
+	if (err)
+		return err;
+
+	priv->blink = blink;
+	*delay_on = *delay_off = delay;
+	return 0;
+}
+
 static void ht16k33_fb_queue(struct ht16k33_priv *priv)
 {
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
@@ -425,6 +477,35 @@ static void ht16k33_seg14_update(struct work_struct *work)
 	i2c_smbus_write_i2c_block_data(priv->client, 0, ARRAY_SIZE(buf), buf);
 }
 
+static int ht16k33_led_probe(struct device *dev, struct led_classdev *led,
+			     unsigned int brightness)
+{
+	struct led_init_data init_data = {};
+	struct device_node *node;
+	int err;
+
+	/* The LED is optional */
+	node = of_get_child_by_name(dev->of_node, "led");
+	if (!node)
+		return 0;
+
+	led->brightness_set_blocking = ht16k33_brightness_set_blocking;
+	led->blink_set = ht16k33_blink_set;
+	led->flags = LED_CORE_SUSPENDRESUME;
+	led->brightness = brightness;
+	led->max_brightness = MAX_BRIGHTNESS;
+
+	init_data.fwnode = of_fwnode_handle(node);
+	init_data.devicename = "auxdisplay";
+	init_data.devname_mandatory = true;
+
+	err = devm_led_classdev_register_ext(dev, led, &init_data);
+	if (err)
+		dev_err(dev, "Failed to register LED\n");
+
+	return err;
+}
+
 static int ht16k33_keypad_probe(struct i2c_client *client,
 				struct ht16k33_keypad *keypad)
 {
@@ -498,24 +579,28 @@ static int ht16k33_fbdev_probe(struct device *dev, struct ht16k33_priv *priv,
 			       uint32_t brightness)
 {
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
-	struct backlight_properties bl_props;
-	struct backlight_device *bl;
+	struct backlight_device *bl = NULL;
 	int err;
 
-	/* Backlight */
-	memset(&bl_props, 0, sizeof(struct backlight_properties));
-	bl_props.type = BACKLIGHT_RAW;
-	bl_props.max_brightness = MAX_BRIGHTNESS;
+	if (!priv->led.dev) {
+		/* backwards compatibility with DT lacking an led subnode */
+		struct backlight_properties bl_props;
 
-	bl = devm_backlight_device_register(dev, DRIVER_NAME"-bl", dev, priv,
-					    &ht16k33_bl_ops, &bl_props);
-	if (IS_ERR(bl)) {
-		dev_err(dev, "failed to register backlight\n");
-		return PTR_ERR(bl);
-	}
+		memset(&bl_props, 0, sizeof(struct backlight_properties));
+		bl_props.type = BACKLIGHT_RAW;
+		bl_props.max_brightness = MAX_BRIGHTNESS;
+
+		bl = devm_backlight_device_register(dev, DRIVER_NAME"-bl", dev,
+						    priv, &ht16k33_bl_ops,
+						    &bl_props);
+		if (IS_ERR(bl)) {
+			dev_err(dev, "failed to register backlight\n");
+			return PTR_ERR(bl);
+		}
 
-	bl->props.brightness = brightness;
-	ht16k33_bl_update_status(bl);
+		bl->props.brightness = brightness;
+		ht16k33_bl_update_status(bl);
+	}
 
 	/* Framebuffer (2 bytes per column) */
 	BUILD_BUG_ON(PAGE_SIZE < HT16K33_FB_SIZE);
@@ -575,7 +660,7 @@ static int ht16k33_seg_probe(struct device *dev, struct ht16k33_priv *priv,
 	struct ht16k33_seg *seg = &priv->seg;
 	int err;
 
-	err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
+	err = ht16k33_brightness_set(priv, brightness);
 	if (err)
 		return err;
 
@@ -653,6 +738,11 @@ static int ht16k33_probe(struct i2c_client *client)
 		dft_brightness = MAX_BRIGHTNESS;
 	}
 
+	/* LED */
+	err = ht16k33_led_probe(dev, &priv->led, dft_brightness);
+	if (err)
+		return err;
+
 	/* Keypad */
 	if (client->irq > 0) {
 		err = ht16k33_keypad_probe(client, &priv->keypad);
-- 
2.25.1

