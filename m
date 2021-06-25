Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A6B3B43D0
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 14:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhFYNBw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 09:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhFYNBl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 09:01:41 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D27C0611BE
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 05:59:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1476:ce84:e216:add8])
        by andre.telenet-ops.be with bizsmtp
        id MQzD2500F2B1U9901QzDgG; Fri, 25 Jun 2021 14:59:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQO-003TMb-OV; Fri, 25 Jun 2021 14:59:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQN-004sS7-Rm; Fri, 25 Jun 2021 14:59:11 +0200
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
Subject: [PATCH v2 18/18] auxdisplay: ht16k33: Add segment display LED support
Date:   Fri, 25 Jun 2021 14:59:02 +0200
Message-Id: <20210625125902.1162428-19-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625125902.1162428-1-geert@linux-m68k.org>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instantiate a single LED for a segment display.  This allows the user to
control display brightness and blinking through the LED class API and
triggers, and exposes the display color.
The LED will be named "auxdisplay:<color>:backlight".

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
For setting display brightness, this could use the existing backlight
support for frame buffer devices instantiated for dot-matrix displays.
However, using the leds subsystem instead has the advantage that the
driver can make use of the HT16K33's hardware blinking support, and can
expose the display color.  It can still be used with ledtrig-backlight.
Using "led-backlight", the backlight can no longer be controlled from
sysfs, precluding the use of other triggers incl. hardware blinking.

v2:
  - Use "auxdisplay" instead of DRIVER_NAME in LED name.
---
 drivers/auxdisplay/ht16k33.c | 81 ++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 28207517a4725250..cd88c7bcb1d713bf 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -29,6 +29,7 @@
 #include <asm/unaligned.h>
 
 #include "line-display.h"
+#include "../leds/leds.h"		/* for led_colors[] */
 
 /* Registers */
 #define REG_SYSTEM_SETUP		0x20
@@ -36,6 +37,10 @@
 
 #define REG_DISPLAY_SETUP		0x80
 #define REG_DISPLAY_SETUP_ON		BIT(0)
+#define REG_DISPLAY_SETUP_BLINK_OFF	(0 << 1)
+#define REG_DISPLAY_SETUP_BLINK_2HZ	(1 << 1)
+#define REG_DISPLAY_SETUP_BLINK_1HZ	(2 << 1)
+#define REG_DISPLAY_SETUP_BLINK_0HZ5	(3 << 1)
 
 #define REG_ROWINT_SET			0xA0
 #define REG_ROWINT_SET_INT_EN		BIT(0)
@@ -57,6 +62,8 @@
 #define BYTES_PER_ROW		(HT16K33_MATRIX_LED_MAX_ROWS / 8)
 #define HT16K33_FB_SIZE		(HT16K33_MATRIX_LED_MAX_COLS * BYTES_PER_ROW)
 
+#define COLOR_DEFAULT		LED_COLOR_ID_RED
+
 enum display_type {
 	DISP_MATRIX = 0,
 	DISP_QUAD_7SEG,
@@ -85,6 +92,7 @@ struct ht16k33_fbdev {
 
 struct ht16k33_seg {
 	struct linedisp linedisp;
+	struct led_classdev led;
 	union {
 		struct seg7_conversion_map seg7;
 		struct seg14_conversion_map seg14;
@@ -102,6 +110,7 @@ struct ht16k33_priv {
 		struct ht16k33_seg seg;
 	};
 	enum display_type type;
+	uint8_t blink;
 };
 
 static const struct fb_fix_screeninfo ht16k33_fb_fix = {
@@ -160,7 +169,7 @@ static DEVICE_ATTR(map_seg14, 0644, map_seg_show, map_seg_store);
 
 static int ht16k33_display_on(struct ht16k33_priv *priv)
 {
-	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON;
+	uint8_t data = REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON | priv->blink;
 
 	return i2c_smbus_write_byte(priv->client, data);
 }
@@ -175,8 +184,11 @@ static int ht16k33_brightness_set(struct ht16k33_priv *priv,
 {
 	int error;
 
-	if (brightness == 0)
+	if (brightness == 0) {
+		// Disable blink mode
+		priv->blink = REG_DISPLAY_SETUP_BLINK_OFF;
 		return ht16k33_display_off(priv);
+	}
 
 	error = ht16k33_display_on(priv);
 	if (error)
@@ -186,6 +198,49 @@ static int ht16k33_brightness_set(struct ht16k33_priv *priv,
 				    REG_BRIGHTNESS | (brightness - 1));
 }
 
+static int ht16k33_brightness_set_blocking(struct led_classdev *led_cdev,
+					   enum led_brightness brightness)
+{
+	struct ht16k33_priv *priv = container_of(led_cdev, struct ht16k33_priv,
+						 seg.led);
+
+	return ht16k33_brightness_set(priv, brightness);
+}
+
+static int ht16k33_blink_set(struct led_classdev *led_cdev,
+			     unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct ht16k33_priv *priv = container_of(led_cdev, struct ht16k33_priv,
+						 seg.led);
+	unsigned int delay;
+	uint8_t blink;
+	int error;
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
+	error = i2c_smbus_write_byte(priv->client,
+				     REG_DISPLAY_SETUP | REG_DISPLAY_SETUP_ON |
+				     blink);
+	if (error)
+		return error;
+
+	priv->blink = blink;
+	*delay_on = *delay_off = delay;
+	return 0;
+}
+
 static void ht16k33_fb_queue(struct ht16k33_priv *priv)
 {
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
@@ -576,11 +631,29 @@ static int ht16k33_fbdev_probe(struct i2c_client *client,
 static int ht16k33_seg_probe(struct i2c_client *client,
 			     struct ht16k33_priv *priv, uint32_t brightness)
 {
-	struct ht16k33_seg *seg = &priv->seg;
 	struct device *dev = &client->dev;
+	struct device_node *node = dev->of_node;
+	struct ht16k33_seg *seg = &priv->seg;
+	u32 color = COLOR_DEFAULT;
 	int err;
 
-	err = ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
+	of_property_read_u32(node, "color", &color);
+	seg->led.name = devm_kasprintf(dev, GFP_KERNEL,
+			"auxdisplay:%s:" LED_FUNCTION_BACKLIGHT,
+			color < LED_COLOR_ID_MAX ? led_colors[color] : "");
+	seg->led.brightness_set_blocking = ht16k33_brightness_set_blocking;
+	seg->led.blink_set = ht16k33_blink_set;
+	seg->led.flags = LED_CORE_SUSPENDRESUME;
+	seg->led.brightness = brightness;
+	seg->led.max_brightness = MAX_BRIGHTNESS;
+
+	err = devm_led_classdev_register(dev, &seg->led);
+	if (err) {
+		dev_err(dev, "Failed to register LED\n");
+		return err;
+	}
+
+	err = ht16k33_brightness_set(priv, seg->led.brightness);
 	if (err)
 		return err;
 
-- 
2.25.1

