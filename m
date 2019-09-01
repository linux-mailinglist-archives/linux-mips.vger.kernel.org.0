Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 657EFA4AA2
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfIAQeg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:34:36 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:33412 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAQeg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:34:36 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 796033FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:34:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1PvGBYYg-fTG for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:34:34 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D5C793FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:34:34 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:34:34 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 110/120] MIPS: PS2: FB: PAL and NTSC grayscale support
Message-ID: <fc89dbf87777a4e3ac67a0fdc21a96aef5b56788.1567326213.git.noring@nocrew.org>
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

Construct luminance[1] Y' = 0.299R' + 0.587G' + 0.114B' with fixed-point
integer arithmetic, where 77 + 150 + 29 = 256.

References:

[1] "Studio encoding parameters of digital television for standard 4:3
    and wide-screen 16:9 aspect ratios", recommendation ITU-R BT.601-7,
    International Telecommunication Union - Radiocommunication sector,
    p. 2.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index d7a54108f37e..4975f9adb5d0 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -125,6 +125,7 @@ struct console_buffer {
  * @lock: spin lock to be taken for all structure operations
  * @mode: frame buffer video mode
  * @pseudo_palette: pseudo palette, used for texture colouring
+ * @grayscale: perform grayscale colour conversion if %true
  * @cb: console buffer definition
  * @package: tags and datafor the GIF
  * @package.capacity: maximum number of GIF packages in 16-byte unit
@@ -135,6 +136,7 @@ struct ps2fb_par {
 
 	struct fb_videomode mode;
 	struct gs_rgba32 pseudo_palette[PALETTE_SIZE];
+	bool grayscale;
 
 	struct console_buffer cb;
 
@@ -266,6 +268,16 @@ static struct gs_rgbaq console_pseudo_palette(const u32 regno,
 		par->pseudo_palette[regno] : (struct gs_rgba32) { };
 	const u32 a = (c.a + 1) / 2;	/* 0x80 = GS_ALPHA_ONE = 1.0 */
 
+	if (par->grayscale) {
+		/*
+		 * Construct luminance Y' = 0.299R' + 0.587G' + 0.114B' with
+		 * fixed-point integer arithmetic, where 77 + 150 + 29 = 256.
+		 */
+		const u32 y = (c.r*77 + c.g*150 + c.b*29) >> 8;
+
+		return (struct gs_rgbaq) { .r = y, .g = y, .b = y, .a = a };
+	}
+
 	return (struct gs_rgbaq) { .r = c.r, .g = c.g, .b = c.b, .a = a };
 }
 
@@ -1935,6 +1947,7 @@ static int ps2fb_set_par(struct fb_info *info)
 	struct gs_smode1 smode1 = sp.smode1;
 
 	par->mode = vm;
+	par->grayscale = (var->grayscale == 1);
 	invalidate_palette(par);
 
 	info->fix.type = FB_TYPE_PACKED_PIXELS;
-- 
2.21.0

