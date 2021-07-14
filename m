Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DCE3C86CE
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jul 2021 17:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239684AbhGNPOj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jul 2021 11:14:39 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:51606 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239744AbhGNPOe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jul 2021 11:14:34 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4GQ1Ds2n8szMqnDB
        for <linux-mips@vger.kernel.org>; Wed, 14 Jul 2021 17:11:41 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
        by baptiste.telenet-ops.be with bizsmtp
        id V3Be2500a4sai0K013Bf63; Wed, 14 Jul 2021 17:11:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXy-001ARV-Ko; Wed, 14 Jul 2021 17:11:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXx-00Acgv-Nz; Wed, 14 Jul 2021 17:11:37 +0200
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
Subject: [PATCH v3 15/19] auxdisplay: ht16k33: Extract ht16k33_brightness_set()
Date:   Wed, 14 Jul 2021 17:11:26 +0200
Message-Id: <20210714151130.2531831-16-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714151130.2531831-1-geert@linux-m68k.org>
References: <20210714151130.2531831-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Extract brightness handling into a helper function, so it can be called
from multiple places.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Use "err" instead of "error" to be consistent with existing driver
    naming style,

v2:
  - No changes.
---
 drivers/auxdisplay/ht16k33.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index c7a3a0e1fbb5d03e..928ac9722c142855 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -113,6 +113,22 @@ static int ht16k33_display_off(struct ht16k33_priv *priv)
 	return i2c_smbus_write_byte(priv->client, REG_DISPLAY_SETUP);
 }
 
+static int ht16k33_brightness_set(struct ht16k33_priv *priv,
+				  unsigned int brightness)
+{
+	int err;
+
+	if (brightness == 0)
+		return ht16k33_display_off(priv);
+
+	err = ht16k33_display_on(priv);
+	if (err)
+		return err;
+
+	return i2c_smbus_write_byte(priv->client,
+				    REG_BRIGHTNESS | (brightness - 1));
+}
+
 static void ht16k33_fb_queue(struct ht16k33_priv *priv)
 {
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
@@ -197,13 +213,10 @@ static int ht16k33_bl_update_status(struct backlight_device *bl)
 
 	if (bl->props.power != FB_BLANK_UNBLANK ||
 	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & BL_CORE_FBBLANK || brightness == 0) {
-		return ht16k33_display_off(priv);
-	}
+	    bl->props.state & BL_CORE_FBBLANK)
+		brightness = 0;
 
-	ht16k33_display_on(priv);
-	return i2c_smbus_write_byte(priv->client,
-				    REG_BRIGHTNESS | (brightness - 1));
+	return ht16k33_brightness_set(priv, brightness);
 }
 
 static int ht16k33_bl_check_fb(struct backlight_device *bl, struct fb_info *fi)
-- 
2.25.1

