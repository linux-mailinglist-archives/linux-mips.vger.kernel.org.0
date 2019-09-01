Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6B24A4A9F
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbfIAQd6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:33:58 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60620 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAQd6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:33:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 7F0273F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:33:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EZYa50pzo7sJ for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:33:54 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B17CB3F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:33:54 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:33:54 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 107/120] MIPS: PS2: FB: Hardware accelerated fb_pan_display()
 support
Message-ID: <51eeb04f97611833d2be487dae2da2a040d4aa13.1567326213.git.noring@nocrew.org>
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

XPAN, YPAN and YWRAP are hardware accelerated. YWRAP is implemented
using the two independent rectangular area read output circuits of the
Graphics Synthesizer[1]. The DISPLAY1 register outputs the upper part
and the DISPLAY2 register outputs the lower part.

References:

[1] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    p. 82.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 120 ++++++++++++++++++++++++++++++++++--
 1 file changed, 116 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index bbf9e1d9e3c1..73fc1fd3f4eb 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -1368,6 +1368,109 @@ static void clear_screen(struct fb_info *info)
 	gif_write(&base_package->gif, package - base_package);
 }
 
+/**
+ * write_cb_pan_display - write console buffer pan operation to the GIF
+ * @var: screen info object
+ * @info: frame buffer info object
+ *
+ * XPAN, YPAN and YWRAP are hardware accelerated. YWRAP is implemented using
+ * the two independent rectangular area read output circuits of the Graphics
+ * Synthesizer. The DISPLAY1 register outputs the upper part and the DISPLAY2
+ * register outputs the lower part.
+ */
+static void write_cb_pan_display(const struct fb_var_screeninfo *var,
+	const struct fb_info *info)
+{
+	const struct gs_display display = gs_read_display1();
+	const int psm = var_to_psm(var, info);
+	const int fbw = var_to_fbw(var);
+	const int yo = var->yoffset % var->yres_virtual;
+	const int dh1 = min_t(int, var->yres_virtual - yo, var->yres);
+	const int dh2 = var->yres - dh1;
+
+	GS_WRITE_DISPLAY1(
+		.dh = dh1 - 1,
+		.dw = display.dw,
+		.magv = display.magv,
+		.magh = display.magh,
+		.dy = display.dy,
+		.dx = display.dx,
+	);
+
+	GS_WRITE_DISPLAY2(
+		.dh = dh2 - 1,
+		.dw = display.dw,
+		.magv = display.magv,
+		.magh = display.magh,
+		.dy = display.dy + dh1,
+		.dx = display.dx,
+	);
+
+	GS_WRITE_DISPFB1(
+		.fbw = fbw,
+		.psm = psm,
+		.dbx = var->xoffset,
+		.dby = yo
+	);
+
+	GS_WRITE_DISPFB2(
+		.fbw = fbw,
+		.psm = psm,
+		.dbx = var->xoffset,
+		.dby = 0,
+	);
+
+	GS_WRITE_PMODE(
+		.en1 = 1,
+		.en2 = dh2 ? 1 : 0,
+		.crtmd = 1
+	);
+}
+
+/**
+ * changed_cb_pan_display - is display panning needed?
+ * @var: screen info object
+ *
+ * Panning is undefined until the DISPFB1 register has been set.
+ *
+ * Return: %true if the horizontal or vertical panning is needed, otherwise
+ *	%false
+ */
+static bool changed_cb_pan_display(const struct fb_var_screeninfo *var)
+{
+	if (gs_valid_dispfb1()) {
+		const struct gs_dispfb dspfb12 = gs_read_dispfb1();
+		const int yo = var->yoffset % var->yres_virtual;
+
+		return dspfb12.dbx != var->xoffset || dspfb12.dby != yo;
+	}
+
+	return false;	/* DISPFB1 is incomparable before video mode is set. */
+}
+
+/**
+ * ps2fb_cb_pan_display - pan the display
+ * @var: screen info object
+ * @info: frame buffer info object
+ *
+ * Return: 0 on success, otherwise a negative error number
+ */
+static int ps2fb_cb_pan_display(struct fb_var_screeninfo *var,
+	struct fb_info *info)
+{
+	struct ps2fb_par *par = info->par;
+	unsigned long flags;
+
+	spin_lock_irqsave(&par->lock, flags);
+
+	if (changed_cb_pan_display(var))
+		write_cb_pan_display(var, info);
+
+	spin_unlock_irqrestore(&par->lock, flags);
+
+	return 0;
+}
+
 /**
  * bits_per_pixel_fits - does the given resolution fit the given buffer size?
  * @xres_virtual: virtual x resolution in pixels
@@ -1438,8 +1541,11 @@ static int ps2fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 	    var->yres < 1 || 2048 < var->yres)
 		return -EINVAL;
 
-	var->xres_virtual = var->xres;
-	var->yres_virtual = var->yres;
+        /* Check virtual resolution. */
+        if (var->xres_virtual < var->xres)
+           var->xres_virtual = var->xres;
+        if (var->yres_virtual < var->yres)
+           var->yres_virtual = var->yres;
 	var->xoffset = 0;
 	var->yoffset = 0;
 
@@ -1833,8 +1939,8 @@ static int ps2fb_set_par(struct fb_info *info)
 
 	info->fix.type = FB_TYPE_PACKED_PIXELS;
 	info->fix.visual = FB_VISUAL_TRUECOLOR;
-	info->fix.xpanstep = 0;
-	info->fix.ypanstep = 0;
+	info->fix.xpanstep = var->xres_virtual > var->xres ? 1 : 0;
+	info->fix.ypanstep = var->yres_virtual > var->yres ? 1 : 0;
 	info->fix.ywrapstep = 1;
 	info->fix.line_length = var->xres_virtual * var->bits_per_pixel / 8;
 
@@ -1883,6 +1989,7 @@ static int ps2fb_cb_set_par(struct fb_info *info)
 		par->cb.block_count = var_to_block_count(info);
 
 		write_cb_environment(info);
+		write_cb_pan_display(&info->var, info);
 
 		clear_screen(info);
 	}
@@ -1928,6 +2035,7 @@ static int init_console_buffer(struct platform_device *pdev,
 		.fb_setcolreg	= ps2fb_setcolreg,
 		.fb_set_par	= ps2fb_cb_set_par,
 		.fb_check_var	= ps2fb_cb_check_var,
+		.fb_pan_display	= ps2fb_cb_pan_display,
 	};
 
 	static struct fb_tile_ops tileops = {
@@ -1954,6 +2062,10 @@ static int init_console_buffer(struct platform_device *pdev,
 		      FBINFO_HWACCEL_COPYAREA |
 		      FBINFO_HWACCEL_FILLRECT |
 		      FBINFO_HWACCEL_IMAGEBLIT |
+		      FBINFO_HWACCEL_XPAN |
+		      FBINFO_HWACCEL_YPAN |
+		      FBINFO_HWACCEL_YWRAP |
+		      FBINFO_PARTIAL_PAN_OK |
 		      FBINFO_READS_FAST;
 
 	info->flags |= FBINFO_MISC_TILEBLITTING;
-- 
2.21.0

