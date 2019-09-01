Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA70A4A97
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbfIAQbz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:31:55 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:33154 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQbz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:31:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 733683FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:31:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id G2dZd_2aeDBL for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:31:52 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id A9BD03FA2D
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:31:52 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:31:52 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 099/120] MIPS: PS2: FB: Reset the Graphics Synthesizer
 drawing environment
Message-ID: <eebbc511b81bcb50cc6b25eb51b254e412e7b637.1567326213.git.noring@nocrew.org>
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

Various parameters are used to draw Graphics Synthesizer primitives, for
example texture information and drawing attributes set by the PRIM
register[1]. These parameters are called the drawing environment. The
environment remains in effect for multiple primitives until it is reset.

Some environment registers such as XYOFFSET_1 and XYOFFSET_2 represent
the same function and can be chosen with the CTXT primitive attribute.

This driver is currently only using the first drawing environment.

References:

[1] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    pp. 47-49.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 198 +++++++++++++++++++++++++++++++++++-
 1 file changed, 197 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index a28263474665..90ddcbe27d43 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -59,6 +59,11 @@
 
 #define PALETTE_BLOCK_COUNT 1	/* One block is used for the indexed colors */
 
+#define GIF_PACKAGE_TAG(package) ((package)++)->gif.tag = (struct gif_tag)
+#define GIF_PACKAGE_REG(package) ((package)++)->gif.reg = (struct gif_data_reg)
+#define GIF_PACKAGE_AD(package)  ((package)++)->gif.packed.ad = (struct gif_packed_ad)
+#define DMA_PACKAGE_TAG(package) ((package)++)->dma = (struct dma_tag)
+
 /* Module parameters */
 static char *mode_option;
 
@@ -361,6 +366,194 @@ static u32 display_buffer_size(const u32 xres_virtual, const u32 yres_virtual,
 	return (xres_virtual * yres_virtual * bits_per_pixel) / 8;
 }
 
+/**
+ * struct environment - Graphics Synthesizer drawing environment context
+ * @xres: x resolution in pixels
+ * @yres: y resolution in pixels
+ * @fbw: frame buffer width in 64-pixel unit
+ * @psm: pixel storage mode
+ * @fbp: frame buffer base pointer in 2048-pixel unit
+ */
+struct environment {
+	u32 xres;
+	u32 yres;
+	u32 fbw;
+	enum gs_psm psm;
+	u32 fbp;
+};
+
+/**
+ * var_to_env - Graphics Synthesizer drawing environment for a given video mode
+ * @var: screen info object
+ * @info: frame buffer info object
+ *
+ * Return: Graphics Synthesizer drawing environment parameters
+ */
+static struct environment var_to_env(const struct fb_var_screeninfo *var,
+	const struct fb_info *info)
+{
+	return (struct environment) {
+		.xres = var->xres,
+		.yres = var->yres,
+		.fbw  = var_to_fbw(var),
+		.psm  = var_to_psm(var, info)
+	};
+}
+
+/**
+ * package_environment - package drawing environment tags and data for the GIF
+ * @package: DMA buffer to put packages in
+ * @env: drawing environment to package
+ *
+ * Various parameters are used to draw Graphics Synthesizer primitives, for
+ * example texture information and drawing attributes set by the PRIM register.
+ * These parameters are called the drawing environment. The environment remains
+ * in effect for multiple primitives until it is reset.
+ *
+ * Some environment registers such as XYOFFSET_1 and XYOFFSET_2 represent the
+ * same function and can be chosen with the CTXT primitive attribute.
+ *
+ * The following registers are available:
+ *
+ * ============ =============================================================
+ * XYOFFSET_1/2 offset value of vertex coordinates
+ * PRMODECONT   PRIM attributes enabled/disabled
+ * TEX0_1/2     attributes of texture buffer and texture mapping
+ * TEX1_1/2     attributes of texture mapping
+ * TEX2_1/2     colour lookup table entry
+ * CLAMP_1/2    wrap mode of texture mapping
+ * TEXCLUT      colour lookup table setting
+ * SCANMSK      drawing control with y coordinate of pixel
+ * MIPTBP1_1/2  base pointer for MIPMAP on each level
+ * MIPTBP2_1/2  base pointer for MIPMAP on each level
+ * TEXA         reference value when expanding alpha value of TEX16 and TEX24
+ * FOGCOL       fogging distant color
+ * SCISSOR_1/2  scissoring area
+ * ALPHA_1/2    alpha-blending attributes
+ * DIMX         dither matrix
+ * DTHE         dithering enabled/disabled
+ * COLCLAMP     color clamp/mask
+ * TEST_1/2     pixel operation
+ * PABE         alpha-blending in pixel units enabled/disabled
+ * FBA_1/2      alpha correction value
+ * FRAME_1/2    frame buffer setting
+ * ZBUF_1/2     z buffer setting
+ * ============ =============================================================
+ *
+ * Return: number of generated GIF packages in 16-byte unit
+ */
+static size_t package_environment(union package *package,
+	const struct environment env)
+{
+	union package * const base_package = package;
+
+	GIF_PACKAGE_TAG(package) {
+		.flg = gif_packed_mode,
+		.reg0 = gif_reg_ad,
+		.nreg = 1,
+		.nloop = 11
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_frame_1,
+		.data.frame_1 = {
+			.fbw = env.fbw,
+			.fbp = env.fbp,
+			.psm = env.psm
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_xyoffset_1,
+		.data.xyoffset_1 = {
+			.ofx = 0,
+			.ofy = 0,
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_scissor_1,
+		.data.scissor_1 = {
+			.scax0 = 0, .scax1 = env.xres,
+			.scay0 = 0, .scay1 = env.yres
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_scanmsk,
+		.data.scanmsk = {
+			.msk = gs_scanmsk_normal
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_prmode,
+		.data.prmode = { }	/* Reset PRMODE to a known value */
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_prmodecont,
+		.data.prmodecont = {
+			.ac = 1
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_test_1,
+		.data.test_1 = {
+			.zte  = gs_depth_test_on,	/* Must always be ON */
+			.ztst = gs_depth_pass		/* Emulate OFF */
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_texa,
+		.data.texa = {
+			.ta0 = GS_ALPHA_ONE,
+			.aem = gs_aem_normal,
+			.ta1 = GS_ALPHA_ONE
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_tex1_1,
+		.data.tex1 = {
+			.lcm = gs_lcm_fixed,
+			.mmag = gs_lod_nearest,
+			.mmin = gs_lod_nearest,
+			.k = 0
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_zbuf_1,
+		.data.zbuf = {
+			.zmsk = gs_zbuf_off
+		}
+	};
+	GIF_PACKAGE_AD(package) {
+		.addr = gs_addr_dthe,
+		.data.dthe = {
+			.dthe = gs_dthe_off
+		}
+	};
+
+	return package - base_package;
+}
+
+/**
+ * write_cb_environment - write console buffer GS drawing environment to the GIF
+ * @info: frame buffer info object
+ *
+ * Write various parameters used to draw Graphics Synthesizer primitives, for
+ * example texture information and drawing attributes set by the PRIM register.
+ * The environment remains in effect for multiple primitives until it is reset.
+ */
+void write_cb_environment(struct fb_info *info)
+{
+        if (gif_wait()) {
+		struct ps2fb_par *par = info->par;
+		union package * const base_package = par->package.buffer;
+		union package *package = base_package;
+
+		package += package_environment(package,
+			var_to_env(&info->var, info));
+
+		gif_write(&base_package->gif, package - base_package);
+	} else
+		fb_err(info, "Failed to write GS environment, GIF is busy\n");
+}
+
 /**
  * ps2fb_cb_get_tilemax - maximum number of tiles
  * @info: frame buffer info object
@@ -889,9 +1082,12 @@ static int ps2fb_cb_set_par(struct fb_info *info)
 	spin_lock_irqsave(&par->lock, flags);
 
 	err = ps2fb_set_par(info);
-	if (!err)
+	if (!err) {
 		par->cb.block_count = var_to_block_count(info);
 
+		write_cb_environment(info);
+	}
+
 	spin_unlock_irqrestore(&par->lock, flags);
 
 	if (!err && info->tileops)
-- 
2.21.0

