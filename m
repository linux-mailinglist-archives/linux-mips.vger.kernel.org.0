Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13097A4A9A
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfIAQcc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:32:32 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60498 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAQcc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:32:32 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 72C063F7B1
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:32:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zqwrPKqWqulQ for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:32:28 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 922723F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:32:28 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:32:28 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 102/120] MIPS: PS2: FB: fb_settile() with font stored as
 palette indexed textures
Message-ID: <90396cdc31e09ab24654c428b2b25ceeeb3445d0.1567326213.git.noring@nocrew.org>
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

Storing the font map locally in Graphics Synthesizer memory is very
efficient when drawing. A 4-bit palette indexed texture is used so
that both the background and foreground colours can be updated without
reinstalling the font map.

Before using converted data from host-to-local or local-to-local
transmissions as texture or colour lookup tables for the first time,
the texture buffer must be disabled with the TEXFLUSH register.

The register write waits for the completion of the current drawing
process, and then disables the texture data read to the texture page
buffer. Any data can be written to it. A drawing process succeeding
the write to the register is started after the texture page buffer
is disabled[1].

References:

[1] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    pp. 43, 51, 55, 63, 77, 131.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 285 ++++++++++++++++++++++++++++++++++++
 1 file changed, 285 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index c852341ec19a..2f7477dc69c1 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -320,6 +320,47 @@ static u32 var_to_block_count(const struct fb_info *info)
 	return 0;
 }
 
+/**
+ * block_address_for_index - frame buffer block address for given block index
+ * @block_index: index of block to compute the address of
+ * @info: frame buffer info object
+ *
+ * Return: block address, or zero for unsupported pixel storage modes
+ */
+static u32 block_address_for_index(const u32 block_index,
+	const struct fb_info *info)
+{
+	const struct fb_var_screeninfo *var = &info->var;
+	const enum gs_psm psm = var_to_psm(var, info);
+	const u32 fbw = var_to_fbw(var);
+
+	if (psm == gs_psm_ct16)
+		return gs_psm_ct16_block_address(fbw, block_index);
+	if (psm == gs_psm_ct32)
+		return gs_psm_ct32_block_address(fbw, block_index);
+
+	fb_warn_once(info, "%s: Unsupported pixel storage format %u\n",
+		__func__, psm);
+	return 0;
+}
+
+/**
+ * texture_address_for_index - frame buffer texture address for given index
+ * @block_index: index of block to compute the address of
+ * @info: frame buffer info object
+ *
+ * Return: texture address, or zero for unsupported pixel storage modes
+ */
+static u32 texture_address_for_index(const u32 block_index,
+	const struct fb_info *info)
+{
+	const struct ps2fb_par *par = info->par;
+
+	return block_address_for_index(
+		par->cb.block_count + PALETTE_BLOCK_COUNT + block_index,
+		info);
+}
+
 /**
  * texture_least_power_of_2 - round up to a power of 2, not less than 8
  * @n: integer to round up
@@ -357,6 +398,34 @@ static struct cb_tile cb_tile(u32 width, u32 height)
 	};
 }
 
+/**
+ * texture_for_tile - texture base pointer and texel coordinates for tile index
+ * @tile_index: index of tile to compute the texture for
+ * @info: frame buffer info object
+ *
+ * Returns texture base pointer and texel coordinates
+ */
+static struct tile_texture texture_for_tile(const u32 tile_index,
+	const struct fb_info *info)
+{
+	const struct ps2fb_par *par = info->par;
+
+	const u32 texture_tile_count =
+		par->cb.tile.block.cols * par->cb.tile.block.rows;
+	const u32 block_tile = tile_index / texture_tile_count;
+	const u32 texture_tile = tile_index % texture_tile_count;
+	const u32 block_address = texture_address_for_index(block_tile, info);
+
+	const u32 row = texture_tile / par->cb.tile.block.cols;
+	const u32 col = texture_tile % par->cb.tile.block.cols;
+
+	return (struct tile_texture) {
+		.tbp	= block_address,
+		.u	= col * par->cb.tile.width2,
+		.v	= row * par->cb.tile.height2
+	};
+}
+
 /**
  * display_buffer_size - display buffer size for a given video resolution
  *
@@ -560,6 +629,221 @@ void write_cb_environment(struct fb_info *info)
 		fb_err(info, "Failed to write GS environment, GIF is busy\n");
 }
 
+/**
+ * pixel - background or foreground pixel palette index for given coordinates
+ * @image: image to sample pixel from
+ * @x: x coordinate, relative to the top left corner
+ * @y: y coordinate, relative to the top left corner
+ * @info: frame buffer info object
+ *
+ * The background palette index is given for coordinates outside of the image.
+ *
+ * Return: background or foreground palette index
+ */
+static u32 pixel(const struct fb_image * const image,
+	const int x, const int y, struct fb_info *info)
+{
+	if (x < 0 || x >= image->width ||
+	    y < 0 || y >= image->height)
+		return image->bg_color;
+
+	if (image->depth == 1)
+		return (image->data[y*((image->width + 7) >> 3) + (x >> 3)] &
+			(0x80 >> (x & 0x7))) ?
+			image->fg_color : image->bg_color;
+
+	fb_warn_once(info, "%s: Unsupported image depth %u\n",
+		__func__, image->depth);
+	return 0;
+}
+
+/**
+ * ps2fb_cb_texflush - flush texture buffer after palette or texture updates
+ * @info: frame buffer info object
+ *
+ * Before using converted data from host-to-local or local-to-local
+ * transmissions as texture or colour lookup tables for the first time, the
+ * texture buffer must be disabled with the TEXFLUSH register.
+ *
+ * The register write waits for the completion of the current drawing process,
+ * and then disables the texture data read to the texture page buffer. Any
+ * data can be written to it. A drawing process succeeding the write to the
+ * register is started after the texture page buffer is disabled.
+ */
+static void ps2fb_cb_texflush(struct fb_info *info)
+{
+	struct ps2fb_par *par = info->par;
+	union package * const base_package = par->package.buffer;
+	union package *package = base_package;
+	unsigned long flags;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
+	spin_lock_irqsave(&par->lock, flags);
+
+        if (!gif_wait())
+		goto timeout;
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
+	gif_write(&base_package->gif, package - base_package);
+
+timeout:
+	spin_unlock_irqrestore(&par->lock, flags);
+}
+
+/**
+ * package_psmt4_texture - package PSMT4 texture tags and data for the GIF
+ * @package: DMA buffer to put packages in
+ * @image: image to copy
+ * @info: frame buffer info object
+ *
+ * Return: number of generated GIF packages in 16-byte unit
+ */
+static size_t package_psmt4_texture(union package *package,
+	const struct fb_image *image, struct fb_info *info)
+{
+	union package * const base_package = package;
+	const u32 width2 = texture_least_power_of_2(image->width);
+	const u32 height2 = texture_least_power_of_2(image->height);
+	const u32 texels_per_quadword = 32;	/* PSMT4 are 4 bit texels */
+	const u32 nloop = (width2 * height2 + texels_per_quadword - 1) /
+		texels_per_quadword;
+	u32 x, y;
+
+	GIF_PACKAGE_TAG(package) {
+		.flg = gif_image_mode,
+		.nloop = nloop,
+		.eop = 1
+	};
+
+	for (y = 0; y < height2; y++)
+	for (x = 0; x < width2; x += 2) {
+		const int p0 = pixel(image, x + 0, y, info);
+		const int p1 = pixel(image, x + 1, y, info);
+		const int i = 4*y + x/2;
+
+		package[i/16].gif.image[i%16] =
+			(p1 ? 0x10 : 0) | (p0 ? 0x01 : 0);
+	}
+
+	package += nloop;
+
+	return package - base_package;
+}
+
+/**
+ * write_cb_tile - write console buffer tile to the GIF
+ * @tile_index: index of the tile, starting from zero for the first glyph
+ * @image: the image of the tile to write
+ * @info: frame buffer info object
+ */
+static void write_cb_tile(const int tile_index,
+	const struct fb_image *image, struct fb_info *info)
+{
+	struct ps2fb_par *par = info->par;
+	const struct tile_texture tt = texture_for_tile(tile_index, info);
+	union package * const base_package = par->package.buffer;
+	union package *package = base_package;
+
+        if (!gif_wait())
+		return;
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
+			.dpsm = gs_psm_t4,
+			.dbw = GS_PSMT4_BLOCK_WIDTH / 64,
+			.dbp = tt.tbp
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxpos,
+		.data.trxpos = {
+			.dsax = tt.u,
+			.dsay = tt.v
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxreg,
+		.data.trxreg = {
+			.rrw = texture_least_power_of_2(image->width),
+			.rrh = texture_least_power_of_2(image->height)
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_trxdir,
+		.data.trxdir = { .xdir = gs_trxdir_host_to_local }
+	};
+
+	package += package_psmt4_texture(package, image, info);
+
+	gif_write(&base_package->gif, package - base_package);
+}
+
+/**
+ * ps2fb_cb_settile - set console buffer font tiles
+ * @info: frame buffer info object
+ * @map: font map use as tiles
+*/
+static void ps2fb_cb_settile(struct fb_info *info, struct fb_tilemap *map)
+{
+	const u32 glyph_size = ALIGN(map->width, 8) * map->height / 8;
+	struct ps2fb_par *par = info->par;
+	const u8 *font = map->data;
+	int i;
+
+	if (!font)
+		return;	/* FIXME: Why is fb_settile called with a NULL font? */
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
+	if (map->width > GS_PSMT4_BLOCK_WIDTH ||
+	    map->height > GS_PSMT4_BLOCK_HEIGHT ||
+	    map->depth != 1) {
+		fb_err(info, "Unsupported font parameters: "
+			"width %d height %d depth %d length %d\n",
+			map->width, map->height, map->depth, map->length);
+		return;
+	}
+
+	par->cb.tile = cb_tile(map->width, map->height);
+
+	for (i = 0; i < map->length; i++) {
+		const struct fb_image image = {
+			.width = map->width,
+			.height = map->height,
+			.fg_color = 1,
+			.bg_color = 0,
+			.depth = 1,
+			.data = &font[i * glyph_size],
+		};
+		unsigned long flags;
+
+		spin_lock_irqsave(&par->lock, flags);
+		write_cb_tile(i, &image, info);
+		spin_unlock_irqrestore(&par->lock, flags);
+	}
+
+	ps2fb_cb_texflush(info);
+}
+
 /**
  * ps2fb_cb_get_tilemax - maximum number of tiles
  * @info: frame buffer info object
@@ -1222,6 +1506,7 @@ static int init_console_buffer(struct platform_device *pdev,
 	};
 
 	static struct fb_tile_ops tileops = {
+		.fb_settile	= ps2fb_cb_settile,
 		.fb_get_tilemax = ps2fb_cb_get_tilemax
 	};
 
-- 
2.21.0

