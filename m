Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD11A4A98
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbfIAQcH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:32:07 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:45322 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQcH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:32:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 0CF7E3F660
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:32:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gNEEkdc4lpn4 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:32:05 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 59CC53F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:32:05 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:32:05 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 100/120] MIPS: PS2: FB: Clear the display buffer when
 changing video modes
Message-ID: <00c26ac4e0edb65593fc7f3fce1f0cfbf3eac303.1567326213.git.noring@nocrew.org>
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

This avoids displaying leftover graphics that appear as garbage from a
previous mode.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index 90ddcbe27d43..e5e603db7671 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -572,6 +572,49 @@ static int ps2fb_cb_get_tilemax(struct fb_info *info)
 	return blocks_available > 0 ? blocks_available * block_tile_count : 0;
 }
 
+/**
+ * clear_screen - clear the displayed buffer screen
+ * @info: frame buffer info object
+ */
+static void clear_screen(struct fb_info *info)
+{
+	struct ps2fb_par *par = info->par;
+	union package * const base_package = par->package.buffer;
+	union package *package = base_package;
+
+	if (!gif_wait()) {
+		fb_err(info, "Failed to clear the screen, GIF is busy\n");
+		return;
+	}
+
+	GIF_PACKAGE_TAG(package) {
+		.flg = gif_reglist_mode,
+		.reg0 = gif_reg_prim,
+		.reg1 = gif_reg_rgbaq,
+		.reg2 = gif_reg_xyz2,
+		.reg3 = gif_reg_xyz2,
+		.nreg = 4,
+		.nloop = 1,
+		.eop = 1
+	};
+	GIF_PACKAGE_REG(package) {
+		.lo.prim = { .prim = gs_sprite },
+		.hi.rgbaq = { .a = GS_ALPHA_ONE }
+	};
+	GIF_PACKAGE_REG(package) {
+		.lo.xyz2 = {
+			.x = gs_fbcs_to_pcs(0),
+			.y = gs_fbcs_to_pcs(0)
+		},
+		.hi.xyz2 = {
+			.x = gs_fbcs_to_pcs(info->var.xres_virtual),
+			.y = gs_fbcs_to_pcs(info->var.yres_virtual)
+		}
+	};
+
+	gif_write(&base_package->gif, package - base_package);
+}
+
 /**
  * bits_per_pixel_fits - does the given resolution fit the given buffer size?
  * @xres_virtual: virtual x resolution in pixels
@@ -1086,6 +1129,8 @@ static int ps2fb_cb_set_par(struct fb_info *info)
 		par->cb.block_count = var_to_block_count(info);
 
 		write_cb_environment(info);
+
+		clear_screen(info);
 	}
 
 	spin_unlock_irqrestore(&par->lock, flags);
-- 
2.21.0

