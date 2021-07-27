Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365953D77E6
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 16:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbhG0OFU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jul 2021 10:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236852AbhG0OFP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Jul 2021 10:05:15 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D73C06136A
        for <linux-mips@vger.kernel.org>; Tue, 27 Jul 2021 07:05:12 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b0a9:7e88:5ca4:551a])
        by laurent.telenet-ops.be with bizsmtp
        id aE572500Y1fSPfK01E578M; Tue, 27 Jul 2021 16:05:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m8Nhj-001PuR-6M; Tue, 27 Jul 2021 16:05:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m8Nhh-00FoCq-Im; Tue, 27 Jul 2021 16:05:05 +0200
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
Subject: [PATCH v4 09/19] auxdisplay: ht16k33: Connect backlight to fbdev
Date:   Tue, 27 Jul 2021 16:04:49 +0200
Message-Id: <20210727140459.3767788-10-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727140459.3767788-1-geert@linux-m68k.org>
References: <20210727140459.3767788-1-geert@linux-m68k.org>
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
---
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

