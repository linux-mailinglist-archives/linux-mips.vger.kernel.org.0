Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C71B7A4A9B
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbfIAQcv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:32:51 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:45418 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAQcv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:32:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id A0A523F65F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:32:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id r_GcrGYSR0c3 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:32:47 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id E4EBF3F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:32:47 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:32:47 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 103/120] MIPS: PS2: FB: Hardware accelerated fb_tilecopy()
 support
Message-ID: <be38ba087fed77b27f5e4103311c5aa87b585e2b.1567326213.git.noring@nocrew.org>
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

In local-to-local BITBLTBUF transmissions, the following restrictions
to the TRXREG register width field apply depending on the pixel storage
mode[1]:

- multiple of 2: PSMCT32, PSMZ32
- multiple of 4: PSMCT16, PSMCT16S, PSMZ16, PSMZ16S
- multiple of 8: PSMCT24, PSMZ24, PSMT8, PSMT8H, PSMT4, PSMT4HL, PSMT4HH

References:

[1] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    p. 76.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 148 ++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index 2f7477dc69c1..2123686af013 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -426,6 +426,33 @@ static struct tile_texture texture_for_tile(const u32 tile_index,
 	};
 }
 
+/**
+  * valid_bitbltbuf_width - is the BITBLTBUF width valid?
+  * @width: width in pixels to check
+  * @psm: pixel storage mode
+  *
+  * In local-to-local BITBLTBUF transmissions, the following restrictions
+  * to the TRXREG register width field apply depending on the pixel storage
+  * mode[1]:
+  *
+  * - multiple of 2: PSMCT32, PSMZ32
+  * - multiple of 4: PSMCT16, PSMCT16S, PSMZ16, PSMZ16S
+  * - multiple of 8: PSMCT24, PSMZ24, PSMT8, PSMT8H, PSMT4, PSMT4HL, PSMT4HH
+  *
+  * Return: %true if the given width is valid, otherwise %false
+  */
+static bool valid_bitbltbuf_width(int width, enum gs_psm psm)
+{
+	if (width < 1)
+		return false;
+	if (psm == gs_psm_ct32 && (width & 1) != 0)
+		return false;
+	if (psm == gs_psm_ct16 && (width & 3) != 0)
+		return false;
+
+	return true;
+}
+
 /**
  * display_buffer_size - display buffer size for a given video resolution
  *
@@ -629,6 +656,103 @@ void write_cb_environment(struct fb_info *info)
 		fb_err(info, "Failed to write GS environment, GIF is busy\n");
 }
 
+/**
+ * package_copyarea - package copy area tags and data for the GIF
+ * @package: DMA buffer to put packages in
+ * @area: area to copy
+ * @info: frame buffer info object
+ *
+ * Return: number of generated GIF packages in 16-byte unit
+ */
+static size_t package_copyarea(union package *package,
+	const struct fb_copyarea *area, const struct fb_info *info)
+{
+	const struct fb_var_screeninfo *var = &info->var;
+	union package * const base_package = package;
+	const int psm = var_to_psm(var, info);
+	const int fbw = var_to_fbw(var);
+
+	GIF_PACKAGE_TAG(package) {
+		.flg = gif_packed_mode,
+		.reg0 = gif_reg_ad,
+		.nreg = 1,
+		.nloop = 4
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_bitbltbuf,
+		.data.bitbltbuf = {
+			.spsm = psm, .sbw = fbw,
+			.dpsm = psm, .dbw = fbw
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxpos,
+		.data.trxpos = {
+			.ssax = area->sx, .ssay = area->sy,
+			.dsax = area->dx, .dsay = area->dy,
+			.dir  = area->dy < area->sy ||
+				(area->dy == area->sy && area->dx < area->sx) ?
+				gs_trxpos_dir_ul_lr : gs_trxpos_dir_lr_ul
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxreg,
+		.data.trxreg = {
+			.rrw = area->width,
+			.rrh = area->height
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxdir,
+		.data.trxdir = { .xdir = gs_trxdir_local_to_local }
+	};
+
+	return package - base_package;
+}
+
+/**
+ * ps2fb_cb_copyarea - copy console buffer area
+ * @area: area to copy
+ * @info: frame buffer info object
+ */
+void ps2fb_cb_copyarea(const struct fb_copyarea *area, struct fb_info *info)
+{
+	const enum gs_psm psm = var_to_psm(&info->var, info);
+	struct ps2fb_par *par = info->par;
+	unsigned long flags;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+	if (area->width < 1 || area->height < 1)
+		return;
+	if (!valid_bitbltbuf_width(area->width, psm)) {
+		/*
+		 * Some widths are not entirely supported with BITBLTBUF,
+		 * but there will be more graphical glitches by refusing
+		 * to proceed. Besides, info->pixmap.blit_x says that
+		 * they are unsupported so unless someone wants to have
+		 * odd fonts we will not end up here anyway. Warn once
+		 * here for the protocol.
+		 */
+		fb_warn_once(info, "%s: "
+			"Unsupported width %u for pixel storage format %u\n",
+			__func__, area->width, psm);
+	}
+
+	spin_lock_irqsave(&par->lock, flags);
+
+        if (gif_wait()) {
+		union package * const base_package = par->package.buffer;
+		union package *package = base_package;
+
+		package += package_copyarea(package, area, info);
+
+		gif_write(&base_package->gif, package - base_package);
+	}
+
+	spin_unlock_irqrestore(&par->lock, flags);
+}
+
 /**
  * pixel - background or foreground pixel palette index for given coordinates
  * @image: image to sample pixel from
@@ -844,6 +968,28 @@ static void ps2fb_cb_settile(struct fb_info *info, struct fb_tilemap *map)
 	ps2fb_cb_texflush(info);
 }
 
+/**
+ * ps2fb_cb_tilecopy - copy console buffer tiles
+ * @info: frame buffer info object
+ * @area: tile area to copy
+ */
+static void ps2fb_cb_tilecopy(struct fb_info *info, struct fb_tilearea *area)
+{
+	const struct ps2fb_par *par = info->par;
+	const u32 tw = par->cb.tile.width;
+	const u32 th = par->cb.tile.height;
+	const struct fb_copyarea a = {
+		.dx	= tw * area->dx,
+		.dy	= th * area->dy,
+		.width	= tw * area->width,
+		.height	= th * area->height,
+		.sx	= tw * area->sx,
+		.sy	= th * area->sy
+	};
+
+	ps2fb_cb_copyarea(&a, info);
+}
+
 /**
  * ps2fb_cb_get_tilemax - maximum number of tiles
  * @info: frame buffer info object
@@ -1507,6 +1653,7 @@ static int init_console_buffer(struct platform_device *pdev,
 
 	static struct fb_tile_ops tileops = {
 		.fb_settile	= ps2fb_cb_settile,
+		.fb_tilecopy	= ps2fb_cb_tilecopy,
 		.fb_get_tilemax = ps2fb_cb_get_tilemax
 	};
 
@@ -1522,6 +1669,7 @@ static int init_console_buffer(struct platform_device *pdev,
 
 	info->fbops = &fbops;
 	info->flags = FBINFO_DEFAULT |
+		      FBINFO_HWACCEL_COPYAREA |
 		      FBINFO_READS_FAST;
 
 	info->flags |= FBINFO_MISC_TILEBLITTING;
-- 
2.21.0

