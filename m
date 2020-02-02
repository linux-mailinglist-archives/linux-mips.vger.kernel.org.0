Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D5714FB46
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2020 03:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgBBCi0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Feb 2020 21:38:26 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:40184 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgBBCiT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Feb 2020 21:38:19 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
        id DBC8229AEF; Sat,  1 Feb 2020 21:38:15 -0500 (EST)
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bartlomiej Zolnierkiewicz" <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-Id: <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1580610812.git.fthain@telegraphics.com.au>
References: <cover.1580610812.git.fthain@telegraphics.com.au>
From:   Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 1/3] fbdev/g364fb: Fix build failure
Date:   Sun, 02 Feb 2020 13:33:32 +1100
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch resolves these compiler errors and warnings --

  CC      drivers/video/fbdev/g364fb.o
drivers/video/fbdev/g364fb.c: In function 'g364fb_cursor':
drivers/video/fbdev/g364fb.c:137:9: error: 'x' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:137:9: note: each undeclared identifier is reported only once for each function it appears in
drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontwidth' [-Werror=implicit-function-declaration]
drivers/video/fbdev/g364fb.c:137:23: error: 'p' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:137:38: error: 'y' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontheight' [-Werror=implicit-function-declaration]
drivers/video/fbdev/g364fb.c: In function 'g364fb_init':
drivers/video/fbdev/g364fb.c:233:24: error: 'fbvar' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:234:24: error: 'xres' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:201:14: warning: unused variable 'j' [-Wunused-variable]
drivers/video/fbdev/g364fb.c:197:25: warning: unused variable 'pal_ptr' [-Wunused-variable]

The MIPS Magnum framebuffer console now works when tested in QEMU.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/video/fbdev/g364fb.c | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
index 223896cc5f7d..fb26230a3c7b 100644
--- a/drivers/video/fbdev/g364fb.c
+++ b/drivers/video/fbdev/g364fb.c
@@ -108,7 +108,6 @@ static int g364fb_pan_display(struct fb_var_screeninfo *var,
 static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
 			    u_int blue, u_int transp,
 			    struct fb_info *info);
-static int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor);
 static int g364fb_blank(int blank, struct fb_info *info);
 
 static struct fb_ops g364fb_ops = {
@@ -119,28 +118,8 @@ static struct fb_ops g364fb_ops = {
 	.fb_fillrect	= cfb_fillrect,
 	.fb_copyarea	= cfb_copyarea,
 	.fb_imageblit	= cfb_imageblit,
-	.fb_cursor	= g364fb_cursor,
 };
 
-int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor)
-{
-	
-	switch (cursor->enable) {
-	case CM_ERASE:
-		*(unsigned int *) CTLA_REG |= CURS_TOGGLE;
-		break;
-
-	case CM_MOVE:
-	case CM_DRAW:
-		*(unsigned int *) CTLA_REG &= ~CURS_TOGGLE;
-		*(unsigned int *) CURS_POS_REG =
-		    ((x * fontwidth(p)) << 12) | ((y * fontheight(p)) -
-						  info->var.yoffset);
-		break;
-	}
-	return 0;
-}
-
 /*
  *  Pan or Wrap the Display
  *
@@ -194,11 +173,9 @@ static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
  */
 int __init g364fb_init(void)
 {
-	volatile unsigned int *pal_ptr =
-	    (volatile unsigned int *) CLR_PAL_REG;
 	volatile unsigned int *curs_pal_ptr =
 	    (volatile unsigned int *) CURS_PAL_REG;
-	int mem, i, j;
+	int mem, i;
 
 	if (fb_get_options("g364fb", NULL))
 		return -ENODEV;
@@ -230,8 +207,8 @@ int __init g364fb_init(void)
 	 */
 	*(unsigned short *) (CURS_PAT_REG + 14 * 64) = 0xffff;
 	*(unsigned short *) (CURS_PAT_REG + 15 * 64) = 0xffff;
-	fb_var.xres_virtual = fbvar.xres;
-	fb_fix.line_length = (xres / 8) * fb_var.bits_per_pixel;
+	fb_var.xres_virtual = fb_var.xres;
+	fb_fix.line_length = fb_var.xres_virtual * fb_var.bits_per_pixel / 8;
 	fb_fix.smem_start = 0x40000000;	/* physical address */
 	/* get size of video memory; this is special for the JAZZ hardware */
 	mem = (r4030_read_reg32(JAZZ_R4030_CONFIG) >> 8) & 3;
-- 
2.24.1

