Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE574338C7
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 16:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhJSOsF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 10:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbhJSOrs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 10:47:48 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57895C0613EB
        for <linux-mips@vger.kernel.org>; Tue, 19 Oct 2021 07:45:31 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by michel.telenet-ops.be with bizsmtp
        id 7qlT2600D12AN0U06qlTRS; Tue, 19 Oct 2021 16:45:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMp-006B4g-9J; Tue, 19 Oct 2021 16:45:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMn-00FABs-SS; Tue, 19 Oct 2021 16:45:25 +0200
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
Subject: [PATCH v8 15/21] auxdisplay: ht16k33: Move delayed work
Date:   Tue, 19 Oct 2021 16:45:14 +0200
Message-Id: <20211019144520.3613926-16-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019144520.3613926-1-geert@linux-m68k.org>
References: <20211019144520.3613926-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move delayed_work from ht16k33_fbdev to ht16k33_priv, as it is not
specific to dot-matrix displays, but common to all display types.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Robin van der Gracht <robin@protonic.nl>
---
v8:
  - No changes,

v7:
  - Add Acked-by,

v6:
  - No changes,

v5:
  - No changes,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - No changes.
---
 drivers/auxdisplay/ht16k33.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index dcf530a9390b6f9c..b50cbf7e57ba26d7 100644
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
@@ -472,7 +471,7 @@ static int ht16k33_probe(struct i2c_client *client)
 	}
 	fb_bl_default_curve(fbdev->info, 0, MIN_BRIGHTNESS, MAX_BRIGHTNESS);
 
-	INIT_DELAYED_WORK(&fbdev->work, ht16k33_fb_update);
+	INIT_DELAYED_WORK(&priv->work, ht16k33_fb_update);
 	fbdev->info->fbops = &ht16k33_fb_ops;
 	fbdev->info->screen_base = (char __iomem *) fbdev->buffer;
 	fbdev->info->screen_size = HT16K33_FB_SIZE;
@@ -512,7 +511,7 @@ static int ht16k33_remove(struct i2c_client *client)
 	struct ht16k33_priv *priv = i2c_get_clientdata(client);
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
 
-	cancel_delayed_work_sync(&fbdev->work);
+	cancel_delayed_work_sync(&priv->work);
 	unregister_framebuffer(fbdev->info);
 	framebuffer_release(fbdev->info);
 	free_page((unsigned long) fbdev->buffer);
-- 
2.25.1

