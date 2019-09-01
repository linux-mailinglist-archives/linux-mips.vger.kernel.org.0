Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B955EA4A9C
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbfIAQdL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:33:11 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60574 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAQdK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:33:10 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 7A4543F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:33:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gQtH_eozbrRP for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:33:06 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 94EF33F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:33:06 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:33:06 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 104/120] MIPS: PS2: FB: Hardware accelerated fb_tilefill()
 support
Message-ID: <0b481fd149279130e4fa0cfbed92f74c66cd5489.1567326213.git.noring@nocrew.org>
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

The local Graphics Synthesizer palette is updated if either the
background or the foreground colour index have changed. A single
BITBLTBUF operation performs the tile fill.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 233 ++++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index 2123686af013..c00c0f6a4a49 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -252,6 +252,23 @@ static const struct fb_videomode standard_modes[] = {
 	  FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA }
 };
 
+/**
+ * console_pseudo_palette - Graphics Synthesizer RGBA for a palette index
+ * @regno: pseudo palette index number
+ * @par: driver specific object
+ *
+ * Return: RGBA colour object for the Graphics Synthesizer
+ */
+static struct gs_rgbaq console_pseudo_palette(const u32 regno,
+	const struct ps2fb_par *par)
+{
+	const struct gs_rgba32 c = regno < PALETTE_SIZE ?
+		par->pseudo_palette[regno] : (struct gs_rgba32) { };
+	const u32 a = (c.a + 1) / 2;	/* 0x80 = GS_ALPHA_ONE = 1.0 */
+
+	return (struct gs_rgbaq) { .r = c.r, .g = c.g, .b = c.b, .a = a };
+}
+
 /**
  * var_to_fbw - frame buffer width for a given virtual x resolution
  * @var: screen info object to compute FBW for
@@ -344,6 +361,19 @@ static u32 block_address_for_index(const u32 block_index,
 	return 0;
 }
 
+/**
+ * color_base_pointer - colour base pointer
+ * @info: frame buffer info object
+ *
+ * Return: block index of the colour palette, that follows the display buffer
+ */
+static u32 color_base_pointer(const struct fb_info *info)
+{
+	const struct ps2fb_par *par = info->par;
+
+	return par->cb.block_count;
+}
+
 /**
  * texture_address_for_index - frame buffer texture address for given index
  * @block_index: index of block to compute the address of
@@ -968,6 +998,187 @@ static void ps2fb_cb_settile(struct fb_info *info, struct fb_tilemap *map)
 	ps2fb_cb_texflush(info);
 }
 
+/**
+ * package_palette - package palette tags and data for the GIF
+ * @package: DMA buffer to put packages in
+ * @bg: background colour palette index
+ * @fg: foreground colour palette index
+ * @info: frame buffer info object
+ *
+ * Return: number of generated GIF packages in 16-byte unit
+ */
+static size_t package_palette(union package *package,
+	const int bg, const int fg, struct fb_info *info)
+{
+	struct ps2fb_par *par = info->par;
+	union package * const base_package = par->package.buffer;
+	const struct gs_rgbaq bg_rgbaq = console_pseudo_palette(bg, par);
+	const struct gs_rgbaq fg_rgbaq = console_pseudo_palette(fg, par);
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
+			.dpsm = gs_psm_ct32,
+			.dbw = 1,	/* Palette is one block wide */
+			.dbp = color_base_pointer(info)
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxpos,
+		.data.trxpos = {
+			.dsax = 0,
+			.dsay = 0
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxreg,
+		.data.trxreg = {
+			.rrw = 2,	/* Background and foreground color */
+			.rrh = 1
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxdir,
+		.data.trxdir = { .xdir = gs_trxdir_host_to_local }
+	};
+
+	GIF_PACKAGE_TAG(package) {
+		.flg = gif_image_mode,
+		.nloop = 1,
+		.eop = 1
+	};
+	package->gif.rgba32[0] = (struct gs_rgba32) {
+		.r = bg_rgbaq.r,
+		.g = bg_rgbaq.g,
+		.b = bg_rgbaq.b,
+		.a = bg_rgbaq.a
+	};
+	package->gif.rgba32[1] = (struct gs_rgba32) {
+		.r = fg_rgbaq.r,
+		.g = fg_rgbaq.g,
+		.b = fg_rgbaq.b,
+		.a = fg_rgbaq.a
+	};
+	package++;
+
+	GIF_PACKAGE_TAG(package) {
+		.flg = gif_packed_mode,
+		.reg0 = gif_reg_ad,
+		.nreg = 1,
+		.nloop = 1
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_texflush
+	};
+
+	return package - base_package;
+}
+
+/**
+ * write_tilefill - write console buffer tile fill operation to the GIF
+ * @info: frame buffer info object
+ * @rect: rectangle to fill with tiles
+ */
+static void write_tilefill(struct fb_info *info, const struct fb_tilerect rect)
+{
+	const struct tile_texture tt = texture_for_tile(rect.index, info);
+	struct ps2fb_par *par = info->par;
+	union package * const base_package = par->package.buffer;
+	union package *package = base_package;
+	const u32 cbp = color_base_pointer(info);
+	const u32 dsax = par->cb.tile.width * rect.sx;
+	const u32 dsay = par->cb.tile.height * rect.sy;
+	const u32 rrw = par->cb.tile.width * rect.width;
+	const u32 rrh = par->cb.tile.height * rect.height;
+	const u32 tw2 = par->cb.tile.width2;
+	const u32 th2 = par->cb.tile.height2;
+
+	/* Determine whether background or foreground color needs update. */
+	const bool cld = (par->cb.bg != rect.bg || par->cb.fg != rect.fg);
+
+        if (!gif_wait())
+		return;
+
+	if (cld) {
+		package += package_palette(package, rect.bg, rect.fg, info);
+		par->cb.bg = rect.bg;
+		par->cb.fg = rect.fg;
+	}
+
+	GIF_PACKAGE_TAG(package) {
+		.flg = gif_reglist_mode,
+		.reg0 = gif_reg_prim,
+		.reg1 = gif_reg_nop,
+		.reg2 = gif_reg_tex0_1,
+		.reg3 = gif_reg_clamp_1,
+		.reg4 = gif_reg_uv,
+		.reg5 = gif_reg_xyz2,
+		.reg6 = gif_reg_uv,
+		.reg7 = gif_reg_xyz2,
+		.nreg = 8,
+		.nloop = 1,
+		.eop = 1
+	};
+	GIF_PACKAGE_REG(package) {
+		.lo.prim = {
+			.prim = gs_sprite,
+			.tme = gs_texturing_on,
+			.fst = gs_texturing_uv
+		}
+	};
+	GIF_PACKAGE_REG(package) {
+		.lo.tex0 = {
+			.tbp0 = tt.tbp,
+			.tbw = GS_PSMT4_BLOCK_WIDTH / 64,
+			.psm = gs_psm_t4,
+			.tw = 5,	/* 2^5 = 32 texels wide PSMT4 block */
+			.th = 4,	/* 2^4 = 16 texels high PSMT4 block */
+			.tcc = gs_tcc_rgba,
+			.tfx = gs_tfx_decal,
+			.cbp = cbp,
+			.cpsm = gs_psm_ct32,
+			.csm = gs_csm1,
+			.cld = cld ? 1 : 0
+		},
+		.hi.clamp_1 = {
+			.wms = gs_clamp_region_repeat,
+			.wmt = gs_clamp_region_repeat,
+			.minu = tw2 - 1,  /* Mask, tw is always a power of 2 */
+			.maxu = tt.u,
+			.minv = th2 - 1,  /* Mask, th is always a power of 2 */
+			.maxv = tt.v
+		}
+	};
+	GIF_PACKAGE_REG(package) {
+		.lo.uv = {
+			.u = gs_pxcs_to_tcs(tt.u),
+			.v = gs_pxcs_to_tcs(tt.v)
+		},
+		.hi.xyz2 = {
+			.x = gs_fbcs_to_pcs(dsax),
+			.y = gs_fbcs_to_pcs(dsay)
+		}
+	};
+	GIF_PACKAGE_REG(package) {
+		.lo.uv = {
+			.u = gs_pxcs_to_tcs(tt.u + rrw),
+			.v = gs_pxcs_to_tcs(tt.v + rrh)
+		},
+		.hi.xyz2 = {
+			.x = gs_fbcs_to_pcs(dsax + rrw),
+			.y = gs_fbcs_to_pcs(dsay + rrh)
+		}
+	};
+
+	gif_write(&base_package->gif, package - base_package);
+}
+
 /**
  * ps2fb_cb_tilecopy - copy console buffer tiles
  * @info: frame buffer info object
@@ -990,6 +1201,26 @@ static void ps2fb_cb_tilecopy(struct fb_info *info, struct fb_tilearea *area)
 	ps2fb_cb_copyarea(&a, info);
 }
 
+/**
+ * ps2fb_cb_tilefill - tile fill operation
+ * @info: frame buffer info object
+ * @rect: rectangle to fill with tiles
+ */
+static void ps2fb_cb_tilefill(struct fb_info *info, struct fb_tilerect *rect)
+{
+	struct ps2fb_par *par = info->par;
+	unsigned long flags;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
+	spin_lock_irqsave(&par->lock, flags);
+
+	write_tilefill(info, *rect);
+
+	spin_unlock_irqrestore(&par->lock, flags);
+}
+
 /**
  * ps2fb_cb_get_tilemax - maximum number of tiles
  * @info: frame buffer info object
@@ -1654,6 +1885,7 @@ static int init_console_buffer(struct platform_device *pdev,
 	static struct fb_tile_ops tileops = {
 		.fb_settile	= ps2fb_cb_settile,
 		.fb_tilecopy	= ps2fb_cb_tilecopy,
+		.fb_tilefill    = ps2fb_cb_tilefill,
 		.fb_get_tilemax = ps2fb_cb_get_tilemax
 	};
 
@@ -1670,6 +1902,7 @@ static int init_console_buffer(struct platform_device *pdev,
 	info->fbops = &fbops;
 	info->flags = FBINFO_DEFAULT |
 		      FBINFO_HWACCEL_COPYAREA |
+		      FBINFO_HWACCEL_FILLRECT |
 		      FBINFO_READS_FAST;
 
 	info->flags |= FBINFO_MISC_TILEBLITTING;
-- 
2.21.0

