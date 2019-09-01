Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 980B0A4A99
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbfIAQcT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:32:19 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:45352 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQcS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:32:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id ECC143F660
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:32:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RKwokFvBOkQ1 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:32:16 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 4511A3F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:32:16 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:32:16 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 101/120] MIPS: PS2: FB: fb_setcolreg() 256 colour pseudo
 palette support
Message-ID: <4cbbf1502c5057a573b8b74b6916eff5c3fe5d33.1567326213.git.noring@nocrew.org>
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

The Graphics Synthesizer display buffer is either 16-bit or 32-bit true
colour. The font will be represented by 4-bit palette indexed texture
tiles in a forthcoming change.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 57 +++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index e5e603db7671..c852341ec19a 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -57,6 +57,7 @@
 
 #define DEVICE_NAME "ps2fb"
 
+#define PALETTE_SIZE 256
 #define PALETTE_BLOCK_COUNT 1	/* One block is used for the indexed colors */
 
 #define GIF_PACKAGE_TAG(package) ((package)++)->gif.tag = (struct gif_tag)
@@ -122,6 +123,8 @@ struct console_buffer {
 /**
  * struct ps2fb_par - driver specific structure
  * @lock: spin lock to be taken for all structure operations
+ * @mode: frame buffer video mode
+ * @pseudo_palette: pseudo palette, used for texture colouring
  * @cb: console buffer definition
  * @package: tags and datafor the GIF
  * @package.capacity: maximum number of GIF packages in 16-byte unit
@@ -130,6 +133,9 @@ struct console_buffer {
 struct ps2fb_par {
 	spinlock_t lock;
 
+	struct fb_videomode mode;
+	struct gs_rgba32 pseudo_palette[PALETTE_SIZE];
+
 	struct console_buffer cb;
 
 	struct {
@@ -572,6 +578,44 @@ static int ps2fb_cb_get_tilemax(struct fb_info *info)
 	return blocks_available > 0 ? blocks_available * block_tile_count : 0;
 }
 
+/**
+ * invalidate_palette - set invalid palette indices to force update
+ * @par: driver specific object
+ *
+ * The background and foreground palette indices will mismatch in the next
+ * tile file, and thereby force a palette update.
+ */
+static void invalidate_palette(struct ps2fb_par *par)
+{
+	par->cb.bg = ~0;
+	par->cb.fg = ~0;
+}
+
+static int ps2fb_setcolreg(unsigned regno, unsigned red, unsigned green,
+	unsigned blue, unsigned transp, struct fb_info *info)
+{
+	const struct gs_rgba32 color = {
+		.r = red    >> 8,
+		.g = green  >> 8,
+		.b = blue   >> 8,
+		.a = transp >> 8
+	};
+	struct ps2fb_par *par = info->par;
+	unsigned long flags;
+
+	if (regno >= PALETTE_SIZE)
+		return -EINVAL;
+
+	spin_lock_irqsave(&par->lock, flags);
+
+	par->pseudo_palette[regno] = color;
+	invalidate_palette(par);
+
+	spin_unlock_irqrestore(&par->lock, flags);
+
+	return 0;
+}
+
 /**
  * clear_screen - clear the displayed buffer screen
  * @info: frame buffer info object
@@ -1076,6 +1120,7 @@ static int ps2fb_set_par(struct fb_info *info)
 	struct gs_smode1 smode1 = sp.smode1;
 
 	par->mode = vm;
+	invalidate_palette(par);
 
 	info->fix.type = FB_TYPE_PACKED_PIXELS;
 	info->fix.visual = FB_VISUAL_TRUECOLOR;
@@ -1171,6 +1216,7 @@ static int init_console_buffer(struct platform_device *pdev,
 {
 	static struct fb_ops fbops = {
 		.owner		= THIS_MODULE,
+		.fb_setcolreg	= ps2fb_setcolreg,
 		.fb_set_par	= ps2fb_cb_set_par,
 		.fb_check_var	= ps2fb_cb_check_var,
 	};
@@ -1203,6 +1249,8 @@ static int init_console_buffer(struct platform_device *pdev,
 	info->pixmap.blit_x = block_dimensions(GS_PSMT4_BLOCK_WIDTH, 4);
 	info->pixmap.blit_y = block_dimensions(GS_PSMT4_BLOCK_HEIGHT, 1);
 
+	info->pseudo_palette = par->pseudo_palette;
+
 	/* 8x8 default font tile size for fb_get_tilemax */
 	par->cb.tile = cb_tile(8, 8);
 
@@ -1256,6 +1304,13 @@ static int ps2fb_probe(struct platform_device *pdev)
 
 	info->mode = &par->mode;
 
+	if (fb_alloc_cmap(&info->cmap, PALETTE_SIZE, 0) < 0) {
+		fb_err(info, "fb_alloc_cmap failed\n");
+		err = -ENOMEM;
+		goto err_alloc_cmap;
+	}
+	fb_set_cmap(&info->cmap, info);
+
 	if (register_framebuffer(info) < 0) {
 		fb_err(info, "register_framebuffer failed\n");
 		err = -EINVAL;
@@ -1267,6 +1322,8 @@ static int ps2fb_probe(struct platform_device *pdev)
 	return 0;
 
 err_register_framebuffer:
+	fb_dealloc_cmap(&info->cmap);
+err_alloc_cmap:
 err_find_mode:
 err_init_buffer:
 	free_page((unsigned long)par->package.buffer);
-- 
2.21.0

