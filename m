Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3B8A4A93
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfIAQap (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:30:45 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60304 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQao (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:30:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id DF2C43F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:30:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oCUJYps_ptr0 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:30:39 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E76783F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:30:39 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:30:39 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 095/120] MIPS: PS2: FB: fb_set_par() standard-definition
 television support
Message-ID: <fb309bbc324f5587b0ffed895143f1a679906346.1567326213.git.noring@nocrew.org>
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

Most of the computations for the video synchronisation registers are
based on trial an error, as their bit fields are undocumented. A small
set of standard video modes are supplied with the Graphics Synthesizer
user manual[1], and for these modes the corresponding register values
are known.

This frame buffer driver allows arbitrary top, bottom, left and right
video display margin (border) adjustments, hence registers are computed
instead of tabulated. This is useful to for example precisely center the
image for a given analogue video display.

The SDTV modes are designed to work with S-video, SCART and component
video cables, in addition to the PS2 HDMI adapter based on the Macro
Silicon MS9282 chip.

The MAGV and MAGH fields for vertical and horizontal magnification in
the DISPLAY registers could be used to support lower resolution video
modes, for example 320x200 that was popular with many 8-bit and 16-bit
computers, but that is left for a future extension.

References:

[1] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    p. 84.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 328 ++++++++++++++++++++++++++++++++++++
 1 file changed, 328 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index 7bfbc3c2aa4d..3fb31719459c 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -133,6 +133,97 @@ struct ps2fb_par {
 	} package;
 };
 
+/**
+ * struct gs_sync_param - Graphics Synthesizer registers for video modes
+ * @smode1: SMODE1 register
+ * @smode2: SMODE2 register
+ * @srfsh: SRFSH register
+ * @synch1: SYNCH1 register
+ * @synch2: SYNCH2 register
+ * @syncv: SYNCV register
+ * @display: DISPLAY1 or DISPLAY2 register
+ *
+ * These are the essential Graphics Synthesizer video synchronisation register
+ * parameters.
+ */
+struct gs_sync_param {
+	struct gs_smode1 smode1;
+	struct gs_smode2 smode2;
+	struct gs_srfsh srfsh;
+	struct gs_synch1 synch1;
+	struct gs_synch2 synch2;
+	struct gs_syncv syncv;
+	struct gs_display display;
+};
+
+/**
+ * var_to_fbw - frame buffer width for a given virtual x resolution
+ * @var: screen info object to compute FBW for
+ *
+ * Return: frame buffer width (FBW) in 64-pixel unit
+ */
+static u32 var_to_fbw(const struct fb_var_screeninfo *var)
+{
+	/*
+	 * Round up to nearest GS_FB_PAGE_WIDTH (64 px) since there are
+	 * valid resolutions such as 720 px that do not divide 64 properly.
+	 */
+	return (var->xres_virtual + GS_FB_PAGE_WIDTH - 1) / GS_FB_PAGE_WIDTH;
+}
+
+/**
+ * var_to_psm - frame buffer pixel storage mode for a given bits per pixel
+ * @var: screen info object to compute PSM for
+ * @info: frame buffer info object
+ *
+ * Return: frame buffer pixel storage mode
+ */
+static enum gs_psm var_to_psm(const struct fb_var_screeninfo *var,
+	const struct fb_info *info)
+{
+	if (var->bits_per_pixel == 1)
+		return gs_psm_ct16;
+	if (var->bits_per_pixel == 16)
+		return gs_psm_ct16;
+	if (var->bits_per_pixel == 32)
+		return gs_psm_ct32;
+
+	fb_warn_once(info, "%s: Unsupported bits per pixel %u\n",
+		__func__, var->bits_per_pixel);
+	return gs_psm_ct32;
+}
+
+/**
+ * var_to_block_count - number of frame buffer blocks for a given video mode
+ * @var: screen info object to compute the number of blocks for
+ *
+ * The Graphics Synthesizer frame buffer is subdivided into rectangular pages,
+ * from left to right, top to bottom. Pages are further subdivided into blocks,
+ * with different arrangements for PSMCT16 and PSMCT32. Blocks are further
+ * subdivided into columns, which are finally subdivided into pixels.
+ *
+ * The video display buffer, textures and palettes share the same frame buffer.
+ * This function can be used to compute the first free block after the video
+ * display buffer.
+ *
+ * Return: number of blocks, or zero for unsupported pixel storage modes
+ */
+static u32 var_to_block_count(const struct fb_info *info)
+{
+	const struct fb_var_screeninfo *var = &info->var;
+	const enum gs_psm psm = var_to_psm(var, info);
+	const u32 fbw = var_to_fbw(var);
+
+	if (psm == gs_psm_ct16)
+		return gs_psm_ct16_block_count(fbw, var->yres_virtual);
+	if (psm == gs_psm_ct32)
+		return gs_psm_ct32_block_count(fbw, var->yres_virtual);
+
+	fb_warn_once(info, "%s: Unsupported pixel storage mode %u\n",
+		__func__, psm);
+	return 0;
+}
+
 /**
  * texture_least_power_of_2 - round up to a power of 2, not less than 8
  * @n: integer to round up
@@ -330,6 +421,242 @@ static int ps2fb_cb_check_var(
 	return err;
 }
 
+/**
+ * refresh_for_var - display refresh frequency for a given screen info
+ * @var: screen info object to compute the display frequency for
+ *
+ * Return: display refresh frequency in hertz
+ */
+static u32 refresh_for_var(const struct fb_var_screeninfo *var)
+{
+	const u32 htotal = var->hsync_len +
+		var->left_margin + var->xres + var->right_margin;
+	const u32 vtotal = var->vsync_len +
+		var->upper_margin + var->yres + var->lower_margin;
+	const u32 ptotal = htotal * vtotal;
+
+	return DIV_ROUND_CLOSEST_ULL(DIV_ROUND_CLOSEST_ULL(
+		1000000000000ull * ((var->vmode & FB_VMODE_INTERLACED) ? 2 : 1),
+		var->pixclock), ptotal);
+}
+
+/**
+ * vm_to_cmod - determine the CMOD field for the SMODE1 register
+ * @vm: video mode object to compute CMOD for
+ *
+ * Result: PAL, NTSC or VESA
+ */
+static enum gs_smode1_cmod vm_to_cmod(const struct fb_videomode *vm)
+{
+	const u32 htotal = vm->hsync_len +
+		vm->left_margin + vm->xres + vm->right_margin;
+	const u32 vtotal = vm->vsync_len +
+		vm->upper_margin + vm->yres + vm->lower_margin;
+	const u32 ptotal = htotal * vtotal;
+	const u32 refresh = DIV_ROUND_CLOSEST_ULL(DIV_ROUND_CLOSEST_ULL(
+		1000000000000ull * ((vm->vmode & FB_VMODE_INTERLACED) ? 2 : 1),
+		vm->pixclock), ptotal);
+
+	if (vm->sync & FB_SYNC_BROADCAST)
+		return refresh < 55 ? gs_cmod_pal :
+		       refresh < 65 ? gs_cmod_ntsc :
+				      gs_cmod_vesa;
+
+	return gs_cmod_vesa;
+}
+
+/**
+ * vm_to_sp_sdtv - standard-definition television video synch parameters
+ * @vm: video mode object to compute synchronisation parameters for
+ *
+ * The numeric register field constants come from fixed SDTV video modes made
+ * by Sony. The main complication is that these values are the basis to compute
+ * arbitrary top, bottom, left and right display margin (border) settings for
+ * both PAL and NTSC. This is useful to for example precisely center the image
+ * for a given analogue video display.
+ *
+ * The SDTV modes are designed to work with S-video, SCART and component video
+ * cables, in addition to the PS2 HDMI adapter based on the Macro Silicon
+ * MS9282 chip.
+ *
+ * The MAGV and MAGH fields for vertical and horizontal magnification in the
+ * DISPLAY registers could be used to support lower resolution video modes,
+ * for example 320x200 that was popular with many 8-bit and 16-bit computers,
+ * but that is left for a future extension.
+ *
+ * Return: Graphics Synthesizer SDTV video mode synchronisation parameters
+ */
+static struct gs_sync_param vm_to_sp_sdtv(const struct fb_videomode *vm)
+{
+	const u32 cmod = vm_to_cmod(vm);
+	const u32 intm = (vm->vmode & FB_VMODE_INTERLACED) ? 1 : 0;
+	const u32 vs   = cmod == gs_cmod_pal ? 5 : 6;
+	const u32 hb   = cmod == gs_cmod_pal ? 1680 : 1652;
+	const u32 hf   = 2892 - hb;
+	const u32 hs   = 254;
+	const u32 hbp  = cmod == gs_cmod_pal ? 262 : 222;
+	const u32 hfp  = cmod == gs_cmod_pal ? 48 : 64;
+	const u32 vdp  = cmod == gs_cmod_pal ? 576 : 480;
+	const u32 vbpe = vs;
+	const u32 vbp  = cmod == gs_cmod_pal ? 33 : 26;
+	const u32 vfpe = vs;
+	const u32 vfp  = (vm->vmode & FB_VMODE_INTERLACED) ? 1 :
+		cmod == gs_cmod_pal ? 4 : 2;
+	const u32 tw = hb + hf;
+	const u32 th = vdp;
+	const u32 dw = min_t(u32, vm->xres * 4, tw);
+	const u32 dh = min_t(u32, vm->yres * (intm ? 1 : 2), th);
+	const u32 dx = hs + hbp + (tw - dw)/2 - 1;
+	const u32 dy = (vs + vbp + vbpe + (th - dh)/2) / (intm ? 1 : 2) - 1;
+
+	return (struct gs_sync_param) {
+		.smode1 = {
+			.vhp    =    0, .vcksel = 1, .slck2 = 1, .nvck = 1,
+			.clksel =    1, .pevs   = 0, .pehs  = 0, .pvs  = 0,
+			.phs    =    0, .gcont  = 0, .spml  = 4, .pck2 = 0,
+			.xpck   =    0, .sint   = 1, .prst  = 0, .ex   = 0,
+			.cmod   = cmod, .slck   = 0, .t1248 = 1,
+			.lc     =   32, .rc     = 4
+		},
+		.smode2 = {
+			.intm = intm
+		},
+		.srfsh = {
+			.rfsh = 8
+		},
+		.synch1 = {
+			.hs   = hs,
+			.hsvs = cmod == gs_cmod_pal ? 1474 : 1462,
+			.hseq = cmod == gs_cmod_pal ? 127 : 124,
+			.hbp  = hbp,
+			.hfp  = hfp
+		},
+		.synch2 = {
+			.hb = hb,
+			.hf = hf
+		},
+		.syncv = {
+			.vs   = vs,
+			.vdp  = vdp,
+			.vbpe = vbpe,
+			.vbp  = vbp,
+			.vfpe = vfpe,
+			.vfp  = vfp
+		},
+		.display = {
+			.dh   = vm->yres - 1,
+			.dw   = vm->xres * 4 - 1,
+			.magv = 0,
+			.magh = 3,
+			.dy   = dy,
+			.dx   = dx
+		}
+	};
+}
+
+static struct gs_sync_param vm_to_sp_for_synch_gen(
+	const struct fb_videomode *vm, const struct gs_synch_gen sg)
+{
+	struct gs_sync_param sp = vm_to_sp_sdtv(vm);
+
+	sp.smode1.gcont = gs_gcont_ycrcb;
+	sp.smode1.sint = 1;
+	sp.smode1.prst = 0;
+
+	return sp;
+}
+
+static struct gs_sync_param vm_to_sp(const struct fb_videomode *vm)
+{
+	return vm_to_sp_for_synch_gen(vm, gs_synch_gen_for_vck(vm->pixclock));
+}
+
+static int ps2fb_set_par(struct fb_info *info)
+{
+	struct ps2fb_par *par = info->par;
+	const struct fb_var_screeninfo *var = &info->var;
+	const struct fb_videomode *mm = fb_match_mode(var, &info->modelist);
+	const struct fb_videomode vm = (struct fb_videomode) {
+		.refresh      = refresh_for_var(var),
+		.xres         = var->xres,
+		.yres         = var->yres,
+		.pixclock     = var->pixclock,
+		.left_margin  = var->left_margin,
+		.right_margin = var->right_margin,
+		.upper_margin = var->upper_margin,
+		.lower_margin = var->lower_margin,
+		.hsync_len    = var->hsync_len,
+		.vsync_len    = var->vsync_len,
+		.sync         = var->sync,
+		.vmode        = var->vmode,
+		.flag         = mm != NULL ? mm->flag : 0
+	};
+	const struct gs_sync_param sp = vm_to_sp(&vm);
+	struct gs_smode1 smode1 = sp.smode1;
+
+	par->mode = vm;
+
+	info->fix.type = FB_TYPE_PACKED_PIXELS;
+	info->fix.visual = FB_VISUAL_TRUECOLOR;
+	info->fix.xpanstep = 0;
+	info->fix.ypanstep = 0;
+	info->fix.ywrapstep = 1;
+	info->fix.line_length = var->xres_virtual * var->bits_per_pixel / 8;
+
+	gs_write_smode1(smode1);
+	gs_write_smode2(sp.smode2);
+	gs_write_srfsh(sp.srfsh);
+	gs_write_synch1(sp.synch1);
+	gs_write_synch2(sp.synch2);
+	gs_write_syncv(sp.syncv);
+	gs_write_display1(sp.display);
+
+	GS_WRITE_DISPFB1(
+		.fbw = var_to_fbw(var),
+		.psm = var_to_psm(var, info),
+		.dbx = var->xoffset,
+		.dby = var->yoffset,
+	);
+
+	GS_WRITE_PMODE(
+		.en1 = 1,
+		.crtmd = 1
+	);
+
+	smode1.prst = 1;
+	gs_write_smode1(smode1);
+
+	udelay(2500);
+
+	smode1.sint = 0;
+	smode1.prst = 0;
+	gs_write_smode1(smode1);
+
+	return 0;
+}
+
+static int ps2fb_cb_set_par(struct fb_info *info)
+{
+	struct ps2fb_par *par = info->par;
+	unsigned long flags;
+	int err;
+
+	spin_lock_irqsave(&par->lock, flags);
+
+	err = ps2fb_set_par(info);
+	if (!err)
+		par->cb.block_count = var_to_block_count(info);
+
+	spin_unlock_irqrestore(&par->lock, flags);
+
+	if (!err && info->tileops)
+		fb_info(info, "%d tiles maximum for %ux%u font\n",
+			info->tileops->fb_get_tilemax(info),
+			par->cb.tile.width, par->cb.tile.height);
+
+	return err;
+}
+
 static u32 block_dimensions(u32 dim, u32 alignment)
 {
 	u32 mask = 0;
@@ -347,6 +674,7 @@ static int init_console_buffer(struct platform_device *pdev,
 {
 	static struct fb_ops fbops = {
 		.owner		= THIS_MODULE,
+		.fb_set_par	= ps2fb_cb_set_par,
 		.fb_check_var	= ps2fb_cb_check_var,
 	};
 
-- 
2.21.0

