Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E524338A9
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 16:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhJSOrt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 10:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhJSOrp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 10:47:45 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845F2C061746
        for <linux-mips@vger.kernel.org>; Tue, 19 Oct 2021 07:45:30 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by laurent.telenet-ops.be with bizsmtp
        id 7qlS2600V12AN0U01qlSA3; Tue, 19 Oct 2021 16:45:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMo-006B4Y-Gv; Tue, 19 Oct 2021 16:45:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMn-00FABE-OJ; Tue, 19 Oct 2021 16:45:25 +0200
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
Subject: [PATCH v8 09/21] auxdisplay: ht16k33: Connect backlight to fbdev
Date:   Tue, 19 Oct 2021 16:45:08 +0200
Message-Id: <20211019144520.3613926-10-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019144520.3613926-1-geert@linux-m68k.org>
References: <20211019144520.3613926-1-geert@linux-m68k.org>
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

