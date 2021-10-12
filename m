Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D273942AC70
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 20:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhJLSuu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 14:50:50 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:47026 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234704AbhJLSup (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 14:50:45 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4HTPZ901gYzMqr2j
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 20:38:41 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by andre.telenet-ops.be with bizsmtp
        id 56ZX260090KW32a016ZXBs; Tue, 12 Oct 2021 20:33:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMah-004RU1-36; Tue, 12 Oct 2021 20:33:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMaf-002j6A-U1; Tue, 12 Oct 2021 20:33:29 +0200
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
Subject: [PATCH v7 09/21] auxdisplay: ht16k33: Connect backlight to fbdev
Date:   Tue, 12 Oct 2021 20:33:15 +0200
Message-Id: <20211012183327.649865-10-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012183327.649865-1-geert@linux-m68k.org>
References: <20211012183327.649865-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently /sys/class/graphics/fb0/bl_curve is not accessible (-ENODEV),
as the driver does not connect the backlight to the frame buffer device.
Fix this moving backlight initialization up, and filling in
fb_info.bl_dev.

Fixes: 8992da44c6805d53 ("auxdisplay: ht16k33: Driver for LED controller")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Robin van der Gracht <robin@protonic.nl>
---
v7:
  - Add Reviewed-by,

v6:
  - No changes,

v5:
  - No changes,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - New.
---
 drivers/auxdisplay/ht16k33.c | 56 ++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 1e69cc6d21a0dca2..2b630e194570f6e5 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -413,6 +413,33 @@ static int ht16k33_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
+	/* Backlight */
+	memset(&bl_props, 0, sizeof(struct backlight_properties));
+	bl_props.type = BACKLIGHT_RAW;
+	bl_props.max_brightness = MAX_BRIGHTNESS;
+
+	bl = devm_backlight_device_register(&client->dev, DRIVER_NAME"-bl",
+					    &client->dev, priv,
+					    &ht16k33_bl_ops, &bl_props);
+	if (IS_ERR(bl)) {
+		dev_err(&client->dev, "failed to register backlight\n");
+		return PTR_ERR(bl);
+	}
+
+	err = of_property_read_u32(node, "default-brightness-level",
+				   &dft_brightness);
+	if (err) {
+		dft_brightness = MAX_BRIGHTNESS;
+	} else if (dft_brightness > MAX_BRIGHTNESS) {
+		dev_warn(&client->dev,
+			 "invalid default brightness level: %u, using %u\n",
+			 dft_brightness, MAX_BRIGHTNESS);
+		dft_brightness = MAX_BRIGHTNESS;
+	}
+
+	bl->props.brightness = dft_brightness;
+	ht16k33_bl_update_status(bl);
+
 	/* Framebuffer (2 bytes per column) */
 	BUILD_BUG_ON(PAGE_SIZE < HT16K33_FB_SIZE);
 	fbdev->buffer = (unsigned char *) get_zeroed_page(GFP_KERNEL);
@@ -445,6 +472,7 @@ static int ht16k33_probe(struct i2c_client *client,
 	fbdev->info->screen_size = HT16K33_FB_SIZE;
 	fbdev->info->fix = ht16k33_fb_fix;
 	fbdev->info->var = ht16k33_fb_var;
+	fbdev->info->bl_dev = bl;
 	fbdev->info->pseudo_palette = NULL;
 	fbdev->info->flags = FBINFO_FLAG_DEFAULT;
 	fbdev->info->par = priv;
@@ -460,34 +488,6 @@ static int ht16k33_probe(struct i2c_client *client,
 			goto err_fbdev_unregister;
 	}
 
-	/* Backlight */
-	memset(&bl_props, 0, sizeof(struct backlight_properties));
-	bl_props.type = BACKLIGHT_RAW;
-	bl_props.max_brightness = MAX_BRIGHTNESS;
-
-	bl = devm_backlight_device_register(&client->dev, DRIVER_NAME"-bl",
-					    &client->dev, priv,
-					    &ht16k33_bl_ops, &bl_props);
-	if (IS_ERR(bl)) {
-		dev_err(&client->dev, "failed to register backlight\n");
-		err = PTR_ERR(bl);
-		goto err_fbdev_unregister;
-	}
-
-	err = of_property_read_u32(node, "default-brightness-level",
-				   &dft_brightness);
-	if (err) {
-		dft_brightness = MAX_BRIGHTNESS;
-	} else if (dft_brightness > MAX_BRIGHTNESS) {
-		dev_warn(&client->dev,
-			 "invalid default brightness level: %u, using %u\n",
-			 dft_brightness, MAX_BRIGHTNESS);
-		dft_brightness = MAX_BRIGHTNESS;
-	}
-
-	bl->props.brightness = dft_brightness;
-	ht16k33_bl_update_status(bl);
-
 	ht16k33_fb_queue(priv);
 	return 0;
 
-- 
2.25.1

