Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F20A7A4A9D
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728955AbfIAQdV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:33:21 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60586 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAQdV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:33:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 686243F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:33:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RaQV-ZdkojwV for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:33:18 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id BAABE3F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:33:18 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:33:18 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 105/120] MIPS: PS2: FB: Simplified fb_tileblit() support
Message-ID: <7963a4604eb75027d7a628a34b6c963c500fb9d7.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The tile blit operation is implemented as a series of tile fill
operations. This is very simple but not particularly efficient.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 39 +++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index c00c0f6a4a49..c63215efd07d 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -1221,6 +1221,43 @@ static void ps2fb_cb_tilefill(struct fb_info *info, struct fb_tilerect *rect)
 	spin_unlock_irqrestore(&par->lock, flags);
 }
 
+/**
+ * ps2fb_cb_tileblit - tile bit block transfer operation
+ * @info: frame buffer info object
+ * @blit: tile bit block to transfer
+ */
+static void ps2fb_cb_tileblit(struct fb_info *info, struct fb_tileblit *blit)
+{
+	struct ps2fb_par *par = info->par;
+	int i = 0, dx, dy;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
+	/*
+	 * Note: This could be done faster, possibly often as a single
+	 * set of GIF packages.
+	 */
+	for (dy = 0; i < blit->length && dy < blit->height; dy++)
+	for (dx = 0; i < blit->length && dx < blit->width; dx++, i++) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&par->lock, flags);
+
+		write_tilefill(info, (struct fb_tilerect) {
+			.sx = blit->sx + dx,
+			.sy = blit->sy + dy,
+			.width = 1,
+			.height = 1,
+			.index = blit->indices[i],
+			.fg = blit->fg,
+			.bg = blit->bg
+		});
+
+		spin_unlock_irqrestore(&par->lock, flags);
+	}
+}
+
 /**
  * ps2fb_cb_get_tilemax - maximum number of tiles
  * @info: frame buffer info object
@@ -1886,6 +1923,7 @@ static int init_console_buffer(struct platform_device *pdev,
 		.fb_settile	= ps2fb_cb_settile,
 		.fb_tilecopy	= ps2fb_cb_tilecopy,
 		.fb_tilefill    = ps2fb_cb_tilefill,
+		.fb_tileblit    = ps2fb_cb_tileblit,
 		.fb_get_tilemax = ps2fb_cb_get_tilemax
 	};
 
@@ -1903,6 +1941,7 @@ static int init_console_buffer(struct platform_device *pdev,
 	info->flags = FBINFO_DEFAULT |
 		      FBINFO_HWACCEL_COPYAREA |
 		      FBINFO_HWACCEL_FILLRECT |
+		      FBINFO_HWACCEL_IMAGEBLIT |
 		      FBINFO_READS_FAST;
 
 	info->flags |= FBINFO_MISC_TILEBLITTING;
-- 
2.21.0

