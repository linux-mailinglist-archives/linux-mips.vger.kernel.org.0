Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3DA7A4AA3
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbfIAQev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:34:51 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:45570 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAQev (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:34:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D7DD93F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:34:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Xm8D0X-kbY-w for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:34:48 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 237AC3F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:34:48 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:34:47 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 111/120] MIPS: PS2: FB: Analogue display mode adjustment
 module parameter
Message-ID: <1dec8a1cc49058ccc7d2973f6eeee0888012fc2a.1567326213.git.noring@nocrew.org>
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

Analogue devices are frequently a few pixels off. Use this mode_margin
option to make necessary device dependent adjustments to the built-in
modes.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 58 ++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index 4975f9adb5d0..121c271aa826 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -67,6 +67,7 @@
 
 /* Module parameters */
 static char *mode_option;
+static char *mode_margin = "";
 
 union package {
 	union gif_data gif;
@@ -1923,9 +1924,45 @@ static struct gs_sync_param vm_to_sp(const struct fb_videomode *vm)
 	return vm_to_sp_for_synch_gen(vm, gs_synch_gen_for_vck(vm->pixclock));
 }
 
+/**
+ * struct margin_adjustment - move display screen relative given display mode
+ * @dx: positive, negative or zero horizontal x adjustment in pixels
+ * @dy: positive, negative or zero vertical y adjustment in pixels
+ */
+struct margin_adjustment {
+	int dx;
+	int dy;
+};
+
+static struct margin_adjustment margin_adjustment(struct fb_info *info)
+{
+	char sx = '+', sy = '+';
+	int dx = 0, dy = 0;
+
+	bool valid =
+		sscanf(mode_margin, "%c%d%c%d", &sx, &dx, &sy, &dy) == 4 &&
+		(sx == '-' || sx == '+') &&
+		(sy == '-' || sy == '+');
+
+	if (sx == '-')
+		dx = -dx;
+	if (sy == '-')
+		dy = -dy;
+
+	if (mode_margin[0] != '\0')
+		fb_info(info, "Mode margin \"%s\" with %d dx %d dy is %s\n",
+			mode_margin, dx, dy, valid ? "valid" : "invalid");
+
+	if (!valid)
+		return (struct margin_adjustment) { };
+
+	return (struct margin_adjustment) { .dx = dx, .dy = dy };
+}
+
 static int ps2fb_set_par(struct fb_info *info)
 {
 	struct ps2fb_par *par = info->par;
+	const struct margin_adjustment margin_adjust = margin_adjustment(info);
 	const struct fb_var_screeninfo *var = &info->var;
 	const struct fb_videomode *mm = fb_match_mode(var, &info->modelist);
 	const struct fb_videomode vm = (struct fb_videomode) {
@@ -1933,10 +1970,10 @@ static int ps2fb_set_par(struct fb_info *info)
 		.xres         = var->xres,
 		.yres         = var->yres,
 		.pixclock     = var->pixclock,
-		.left_margin  = var->left_margin,
-		.right_margin = var->right_margin,
-		.upper_margin = var->upper_margin,
-		.lower_margin = var->lower_margin,
+		.left_margin  = var->left_margin  + margin_adjust.dx,
+		.right_margin = var->right_margin - margin_adjust.dx,
+		.upper_margin = var->upper_margin + margin_adjust.dy,
+		.lower_margin = var->lower_margin - margin_adjust.dy,
 		.hsync_len    = var->hsync_len,
 		.vsync_len    = var->vsync_len,
 		.sync         = var->sync,
@@ -2198,6 +2235,9 @@ static int ps2fb_probe(struct platform_device *pdev)
 		goto err_register_framebuffer;
 	}
 
+	/* Clear the mode adjustment after setting the initial mode. */
+	mode_margin = "";
+
 	platform_set_drvdata(pdev, info);
 
 	return 0;
@@ -2269,6 +2309,8 @@ static int __init ps2fb_init(void)
 			mode_option = &this_opt[12];
 		else if ('0' <= this_opt[0] && this_opt[0] <= '9')
 			mode_option = this_opt;
+		else if (!strncmp(this_opt, "mode_margin:", 12))
+			mode_margin = &this_opt[12];
 		else
 			pr_warn(DEVICE_NAME ": Unrecognized option \"%s\"\n",
 				this_opt);
@@ -2307,6 +2349,14 @@ module_param(mode_option, charp, 0);
 MODULE_PARM_DESC(mode_option,
 	"Specify initial video mode as \"<xres>x<yres>[-<bpp>][@<refresh>]\"");
 
+/*
+ * Analogue devices are frequently a few pixels off. Use this mode_margin
+ * option to make necessary device dependent adjustments to the built-in modes.
+ */
+module_param(mode_margin, charp, 0);
+MODULE_PARM_DESC(mode_margin,
+	"Adjust initial video mode margin as \"<-|+><dx><-|+><dy>\"");
+
 MODULE_DESCRIPTION("PlayStation 2 frame buffer driver");
 MODULE_AUTHOR("Fredrik Noring");
 MODULE_LICENSE("GPL");
-- 
2.21.0

