Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40878A4A96
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbfIAQba (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:31:30 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60382 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQba (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:31:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 444E53F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:31:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DtdsWtezF5Wa for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:31:28 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 74E453F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:31:28 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:31:28 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 098/120] MIPS: PS2: FB: Preconfigure standard PAL, NTSC and
 VESA display modes
Message-ID: <6b0617e9a1f60312b3a22c24549011b434ac413b.1567326213.git.noring@nocrew.org>
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

These display mode configurations are a combination of modes made by
Sony[1] and modes from the PlayStation 3 frame buffer driver (ps3fb.c).

The VESA modes are designed to work with the synch-on-green (SOG) VGA
cable that Sony distributed with the Linux kit for the PlayStation 2.
Modern computer displays typically do not support synch-on-green, so
an adapter is most likely necessary for these modes.

References:

[1] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    p. 84.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index dd8b468ab72b..a28263474665 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -156,6 +156,91 @@ struct gs_sync_param {
 	struct gs_display display;
 };
 
+static const struct fb_videomode standard_modes[] = {
+	/* PAL */
+	{ "256p", 50, 640, 256, 74074, 100, 61, 34, 22, 63, 2,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+	{ "288p", 50, 720, 288, 74074, 70, 11, 19, 3, 63, 3,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+	{ "512i", 50, 640, 512, 74074, 100, 61, 67, 41, 63, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED, FB_MODE_IS_STANDARD },
+	{ "576i", 50, 720, 576, 74074, 70, 11, 39, 5, 63, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED, FB_MODE_IS_STANDARD },
+	{ "576p", 50, 720, 576, 37037, 70, 11, 39, 5, 63, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+	{ "720p", 50, 1280, 720, 13468, 220, 400, 19, 6, 80, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+	{ "1080i", 50, 1920, 1080, 13468, 148, 484, 36, 4, 88, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED, FB_MODE_IS_STANDARD },
+	{ "1080p", 50, 1920, 1080, 6734, 148, 484, 36, 4, 88, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+
+	/* PAL with borders to ensure that the whole screen is visible */
+	{ "460i", 50, 576, 460, 74074, 142, 83, 97, 63, 63, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED },
+	{ "460p", 50, 576, 460, 37037, 142, 83, 97, 63, 63, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED },
+	{ "644p", 50, 1124, 644, 13468, 298, 478, 57, 44, 80, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED },
+	{ "964i", 50, 1688, 964, 13468, 264, 600, 94, 62, 88, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED },
+	{ "964p", 50, 1688, 964, 6734, 264, 600, 94, 62, 88, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED },
+
+	/* NTSC */
+	{ "224p", 60, 640, 224, 74074, 95, 60, 22, 14, 63, 3,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+	{ "240p", 60, 720, 240, 74074, 58, 17, 15, 5, 63, 3,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+	{ "448i", 60, 640, 448, 74074, 95, 60, 44, 27, 63, 6,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED, FB_MODE_IS_STANDARD },
+	{ "480i", 60, 720, 480, 74074, 58, 17, 30, 9, 63, 6,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED, FB_MODE_IS_STANDARD },
+	{ "480p", 60, 720, 480, 37037, 58, 17, 30, 9, 63, 6,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+	{ "720p", 60, 1280, 720, 13481, 220, 70, 19, 6, 80, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+	{ "1080i", 60, 1920, 1080, 13481, 148, 44, 36, 4, 88, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED, FB_MODE_IS_STANDARD },
+	{ "1080p", 60, 1920, 1080, 6741, 148, 44, 36, 4, 88, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED, FB_MODE_IS_STANDARD },
+
+	/* NTSC with borders to ensure that the whole screen is visible */
+	{ "384i", 60, 576, 384, 74074, 130, 89, 78, 57, 63, 6,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED },
+	{ "384p", 60, 576, 384, 37037, 130, 89, 78, 57, 63, 6,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED },
+	{ "644p", 60, 1124, 644, 13481, 298, 148, 57, 44, 80, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED },
+	{ "964i", 60, 1688, 964, 13481, 264, 160, 94, 62, 88, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_INTERLACED },
+	{ "964p", 60, 1688, 964, 6741, 264, 160, 94, 62, 88, 5,
+	  FB_SYNC_BROADCAST, FB_VMODE_NONINTERLACED },
+
+	/* VESA */
+	{ "vesa-1a", 60, 640, 480, 39682,  48, 16, 33, 10, 96, 2,
+	  0, FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA },
+	{ "vesa-1c", 75, 640, 480, 31746, 120, 16, 16, 1, 64, 3,
+	  0, FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA },
+	{ "vesa-2b", 60, 800, 600, 25000, 88, 40, 23, 1, 128, 4,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA },
+	{ "vesa-2d", 75, 800, 600, 20202, 160, 16, 21, 1, 80, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA },
+	{ "vesa-3b", 60, 1024, 768, 15384, 160, 24, 29, 3, 136, 6,
+	  0, FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA },
+	{ "vesa-3d", 75, 1024, 768, 12690, 176, 16, 28, 1, 96, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA },
+	{ "vesa-4a", 60, 1280, 1024, 9259, 248, 48, 38, 1, 112, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA },
+	{ "vesa-4b", 75, 1280, 1024, 7407, 248, 16, 38, 1, 144, 3,
+	  FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
+	  FB_VMODE_NONINTERLACED, FB_MODE_IS_VESA }
+};
+
 /**
  * var_to_fbw - frame buffer width for a given virtual x resolution
  * @var: screen info object to compute FBW for
@@ -829,6 +914,17 @@ static u32 block_dimensions(u32 dim, u32 alignment)
 	return mask;
 }
 
+static void fill_modes(struct device *dev, struct list_head *head)
+{
+	int i;
+
+	INIT_LIST_HEAD(head);
+
+	for (i = 0; i < ARRAY_SIZE(standard_modes); i++)
+		if (fb_add_videomode(&standard_modes[i], head) < 0)
+			dev_err(dev, "fb_add_videomode failed\n");
+}
+
 static int init_console_buffer(struct platform_device *pdev,
 	struct fb_info *info)
 {
@@ -897,6 +993,8 @@ static int ps2fb_probe(struct platform_device *pdev)
 	}
 	par->package.capacity = PAGE_SIZE / sizeof(union package);
 
+	fill_modes(&pdev->dev, &info->modelist);
+
 	strlcpy(info->fix.id, "PS2 GS", ARRAY_SIZE(info->fix.id));
 	info->fix.accel = FB_ACCEL_PLAYSTATION_2;
 
@@ -904,6 +1002,17 @@ static int ps2fb_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_init_buffer;
 
+	fb_info(info, "Mode option is \"%s\"\n", mode_option);
+
+	info->var = (struct fb_var_screeninfo) { };
+	if (!fb_find_mode(&info->var, info, mode_option,
+			standard_modes, ARRAY_SIZE(standard_modes), NULL, 32)) {
+		fb_err(info, "Failed to find video mode \"%s\"\n",
+			mode_option);
+		err = -EINVAL;
+		goto err_find_mode;
+	}
+
 	info->mode = &par->mode;
 
 	if (register_framebuffer(info) < 0) {
@@ -917,6 +1026,7 @@ static int ps2fb_probe(struct platform_device *pdev)
 	return 0;
 
 err_register_framebuffer:
+err_find_mode:
 err_init_buffer:
 	free_page((unsigned long)par->package.buffer);
 err_package_buffer:
-- 
2.21.0

