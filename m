Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAD742AC66
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 20:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235569AbhJLSur (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 14:50:47 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:46892 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbhJLSuj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 14:50:39 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4HTPTT00svzMqy4N
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 20:34:37 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by andre.telenet-ops.be with bizsmtp
        id 56ZY2600B0KW32a016ZYC1; Tue, 12 Oct 2021 20:33:36 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMai-004RUQ-03; Tue, 12 Oct 2021 20:33:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMag-002j7u-Gw; Tue, 12 Oct 2021 20:33:30 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v7 21/21] auxdisplay: ht16k33: Make use of device properties
Date:   Tue, 12 Oct 2021 20:33:27 +0200
Message-Id: <20211012183327.649865-22-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012183327.649865-1-geert@linux-m68k.org>
References: <20211012183327.649865-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The device property API allows drivers to gather device resources from
different sources, such as ACPI, and lift the dependency on Device Tree.
Convert the driver to unleash the power of the device property API.

Suggested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v7:
  - Integrate into this series,
  - Add Reviewed-by,
  - Use device_property_read_bool() as replacement for
    of_get_property(),
  - Call matrix_keypad_parse_properties() instead of
    matrix_keypad_parse_of_params().
---
 drivers/auxdisplay/Kconfig   |  2 +-
 drivers/auxdisplay/ht16k33.c | 27 ++++++++++++---------------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index e32ef7f9945d49b2..64012cda4d126707 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -169,7 +169,7 @@ config IMG_ASCII_LCD
 
 config HT16K33
 	tristate "Holtek Ht16K33 LED controller with keyscan"
-	depends on FB && OF && I2C && INPUT
+	depends on FB && I2C && INPUT
 	select FB_SYS_FOPS
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index aef3dc87dc9f5ed2..1134ae9f30de4baa 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -12,7 +12,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/fb.h>
 #include <linux/slab.h>
 #include <linux/backlight.h>
@@ -491,15 +491,13 @@ static int ht16k33_led_probe(struct device *dev, struct led_classdev *led,
 			     unsigned int brightness)
 {
 	struct led_init_data init_data = {};
-	struct device_node *node;
 	int err;
 
 	/* The LED is optional */
-	node = of_get_child_by_name(dev->of_node, "led");
-	if (!node)
+	init_data.fwnode = device_get_named_child_node(dev, "led");
+	if (!init_data.fwnode)
 		return 0;
 
-	init_data.fwnode = of_fwnode_handle(node);
 	init_data.devicename = "auxdisplay";
 	init_data.devname_mandatory = true;
 
@@ -520,7 +518,6 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 				struct ht16k33_keypad *keypad)
 {
 	struct device *dev = &client->dev;
-	struct device_node *node = dev->of_node;
 	u32 rows = HT16K33_MATRIX_KEYPAD_MAX_ROWS;
 	u32 cols = HT16K33_MATRIX_KEYPAD_MAX_COLS;
 	int err;
@@ -539,17 +536,17 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	keypad->dev->open = ht16k33_keypad_start;
 	keypad->dev->close = ht16k33_keypad_stop;
 
-	if (!of_get_property(node, "linux,no-autorepeat", NULL))
+	if (!device_property_read_bool(dev, "linux,no-autorepeat"))
 		__set_bit(EV_REP, keypad->dev->evbit);
 
-	err = of_property_read_u32(node, "debounce-delay-ms",
-				   &keypad->debounce_ms);
+	err = device_property_read_u32(dev, "debounce-delay-ms",
+				       &keypad->debounce_ms);
 	if (err) {
 		dev_err(dev, "key debounce delay not specified\n");
 		return err;
 	}
 
-	err = matrix_keypad_parse_of_params(dev, &rows, &cols);
+	err = matrix_keypad_parse_properties(dev, &rows, &cols);
 	if (err)
 		return err;
 	if (rows > HT16K33_MATRIX_KEYPAD_MAX_ROWS ||
@@ -634,8 +631,8 @@ static int ht16k33_fbdev_probe(struct device *dev, struct ht16k33_priv *priv,
 		goto err_fbdev_buffer;
 	}
 
-	err = of_property_read_u32(dev->of_node, "refresh-rate-hz",
-				   &fbdev->refresh_rate);
+	err = device_property_read_u32(dev, "refresh-rate-hz",
+				       &fbdev->refresh_rate);
 	if (err) {
 		dev_err(dev, "refresh rate not specified\n");
 		goto err_fbdev_info;
@@ -741,8 +738,8 @@ static int ht16k33_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	err = of_property_read_u32(dev->of_node, "default-brightness-level",
-				   &dft_brightness);
+	err = device_property_read_u32(dev, "default-brightness-level",
+				       &dft_brightness);
 	if (err) {
 		dft_brightness = MAX_BRIGHTNESS;
 	} else if (dft_brightness > MAX_BRIGHTNESS) {
@@ -830,7 +827,7 @@ static struct i2c_driver ht16k33_driver = {
 	.remove		= ht16k33_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
-		.of_match_table	= of_match_ptr(ht16k33_of_match),
+		.of_match_table	= ht16k33_of_match,
 	},
 	.id_table = ht16k33_i2c_match,
 };
-- 
2.25.1

