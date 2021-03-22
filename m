Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F705344866
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 15:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhCVO7S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 10:59:18 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:39574 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbhCVO7C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 10:59:02 -0400
X-Greylist: delayed 602 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Mar 2021 10:59:02 EDT
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4F3y795FzTzMr38k
        for <linux-mips@vger.kernel.org>; Mon, 22 Mar 2021 15:48:53 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:250b:f16c:c5e2:505d])
        by michel.telenet-ops.be with bizsmtp
        id jSot2400n2HDxaV06Sotqb; Mon, 22 Mar 2021 15:48:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrR-009ZWP-1G; Mon, 22 Mar 2021 15:48:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrP-004T6Z-S7; Mon, 22 Mar 2021 15:48:51 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 13/17] auxdisplay: ht16k33: Move delayed work
Date:   Mon, 22 Mar 2021 15:48:44 +0100
Message-Id: <20210322144848.1065067-14-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322144848.1065067-1-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move delayed_work from ht16k33_fbdev to ht16k33_priv, as it is not
specific to dot-matrix displays, but common to all display types.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/auxdisplay/ht16k33.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 37fca1d44c3e73e1..91b039702270ab10 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -65,11 +65,11 @@ struct ht16k33_fbdev {
 	uint32_t refresh_rate;
 	uint8_t *buffer;
 	uint8_t *cache;
-	struct delayed_work work;
 };
 
 struct ht16k33_priv {
 	struct i2c_client *client;
+	struct delayed_work work;
 	struct ht16k33_keypad keypad;
 	struct ht16k33_fbdev fbdev;
 };
@@ -117,7 +117,7 @@ static void ht16k33_fb_queue(struct ht16k33_priv *priv)
 {
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
 
-	schedule_delayed_work(&fbdev->work, HZ / fbdev->refresh_rate);
+	schedule_delayed_work(&priv->work, HZ / fbdev->refresh_rate);
 }
 
 /*
@@ -125,10 +125,9 @@ static void ht16k33_fb_queue(struct ht16k33_priv *priv)
  */
 static void ht16k33_fb_update(struct work_struct *work)
 {
-	struct ht16k33_fbdev *fbdev =
-		container_of(work, struct ht16k33_fbdev, work.work);
-	struct ht16k33_priv *priv =
-		container_of(fbdev, struct ht16k33_priv, fbdev);
+	struct ht16k33_priv *priv = container_of(work, struct ht16k33_priv,
+						 work.work);
+	struct ht16k33_fbdev *fbdev = &priv->fbdev;
 
 	uint8_t *p1, *p2;
 	int len, pos = 0, first = -1;
@@ -436,7 +435,7 @@ static int ht16k33_probe(struct i2c_client *client)
 	}
 	fb_bl_default_curve(fbdev->info, 0, MIN_BRIGHTNESS, MAX_BRIGHTNESS);
 
-	INIT_DELAYED_WORK(&fbdev->work, ht16k33_fb_update);
+	INIT_DELAYED_WORK(&priv->work, ht16k33_fb_update);
 	fbdev->info->fbops = &ht16k33_fb_ops;
 	fbdev->info->screen_base = (char __iomem *) fbdev->buffer;
 	fbdev->info->screen_size = HT16K33_FB_SIZE;
@@ -502,7 +501,7 @@ static int ht16k33_remove(struct i2c_client *client)
 	struct ht16k33_priv *priv = i2c_get_clientdata(client);
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
 
-	cancel_delayed_work_sync(&fbdev->work);
+	cancel_delayed_work_sync(&priv->work);
 	unregister_framebuffer(fbdev->info);
 	framebuffer_release(fbdev->info);
 	free_page((unsigned long) fbdev->buffer);
-- 
2.25.1

