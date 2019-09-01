Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B85A4A94
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbfIAQaz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:30:55 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:33056 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQaz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:30:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E2FAB3FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:30:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j1U68j0XK59c for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:30:52 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 313853FA2D
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:30:52 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:30:51 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 096/120] MIPS: PS2: FB: fb_set_par() high-definition
 television support
Message-ID: <95af9f78f8336db3170ae66218af33e3ccfaea50.1567326213.git.noring@nocrew.org>
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

Some of the numeric register field constants come from fixed DTV video
modes made by Sony[1]. The main complication is that these values are
the basis to compute arbitrary top, bottom, left and right display
margin (border) settings. This is useful to for example precisely
center the image for a given analogue video display.

The HDTV modes are designed to work with component video cables and the
PS2 HDMI adapter based on the Macro Silicon MS9282 chip.

The MAGV and MAGH fields for vertical and horizontal magnification in
the DISPLAY registers could be used to emulate SDTV resolution video
modes such as 320x200 that was popular with many 8-bit and 16-bit
computers, but that is left for a future extension.

References:

[1] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    p. 84.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/video/fbdev/ps2fb.c | 86 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/ps2fb.c b/drivers/video/fbdev/ps2fb.c
index 3fb31719459c..f9061ccc5755 100644
--- a/drivers/video/fbdev/ps2fb.c
+++ b/drivers/video/fbdev/ps2fb.c
@@ -554,10 +554,94 @@ static struct gs_sync_param vm_to_sp_sdtv(const struct fb_videomode *vm)
 	};
 }
 
+/**
+ * vm_to_sp_hdtv - high-definition television video synch parameters
+ * @vm: video mode object to compute synchronisation parameters for
+ * @sg: Graphics Synthesizer SMODE1 register video clock fields
+ *
+ * Some of the numeric register field constants come from fixed DTV video
+ * modes made by Sony. The main complication is that these values are the
+ * basis to compute arbitrary top, bottom, left and right display margin
+ * (border) settings. This is useful to for example precisely center the
+ * image for a given analogue video display.
+ *
+ * The HDTV modes are designed to work with component video cables and the
+ * PS2 HDMI adapter based on the Macro Silicon MS9282 chip.
+ *
+ * The MAGV and MAGH fields for vertical and horizontal magnification in the
+ * DISPLAY registers could be used to emulate SDTV resolution video modes such
+ * as 320x200 that was popular with many 8-bit and 16-bit computers, but that
+ * is left for a future extension.
+ *
+ * Return: Graphics Synthesizer HDTV video mode synchronisation parameters
+ */
+static struct gs_sync_param vm_to_sp_hdtv(
+	const struct fb_videomode *vm, const struct gs_synch_gen sg)
+{
+	const u32 spml  = sg.spml;
+	const u32 t1248 = sg.t1248;
+	const u32 lc    = sg.lc;
+	const u32 rc    = sg.rc;
+	const u32 vc    = vm->yres <= 576 ? 1 : 0;
+	const u32 hadj  = spml / 2;
+	const u32 vhp   = (vm->vmode & FB_VMODE_INTERLACED) ? 0 : 1;
+	const u32 hb    = vm->xres * spml * 3 / 5;
+
+	return (struct gs_sync_param) {
+		.smode1 = {
+			.vhp    = vhp, .vcksel = vc, .slck2 =     1, .nvck = 1,
+			.clksel =   1, .pevs   =  0, .pehs  =     0, .pvs  = 0,
+			.phs    =   0, .gcont  =  0, .spml  =  spml, .pck2 = 0,
+			.xpck   =   0, .sint   =  1, .prst  =     0, .ex   = 0,
+			.cmod   =   0, .slck   =  0, .t1248 = t1248,
+			.lc     =  lc, .rc     = rc
+		},
+		.smode2 = {
+			.intm = (vm->vmode & FB_VMODE_INTERLACED) ? 1 : 0
+		},
+		.srfsh = {
+			.rfsh = gs_rfsh_from_synch_gen(sg)
+		},
+		.synch1 = {
+			.hs   = vm->hsync_len * spml,
+			.hsvs = (vm->left_margin + vm->xres +
+				 vm->right_margin - vm->hsync_len) * spml / 2,
+			.hseq = vm->hsync_len * spml,
+			.hbp  = vm->left_margin * spml - hadj,
+			.hfp  = vm->right_margin * spml + hadj
+		},
+		.synch2 = {
+			.hb = hb,
+			.hf = vm->xres * spml - hb
+		},
+		.syncv = {
+			.vs   = vm->vsync_len,
+			.vdp  = vm->yres,
+			.vbpe = 0,
+			.vbp  = vm->upper_margin,
+			.vfpe = 0,
+			.vfp  = vm->lower_margin
+		},
+		.display = {
+			.dh   = vm->yres - 1,
+			.dw   = vm->xres * spml - 1,
+			.magv = 0,
+			.magh = spml - 1,
+			.dy   = vm->vsync_len + vm->upper_margin - 1,
+			.dx   = (vm->hsync_len + vm->left_margin) * spml - 1 - hadj
+		}
+	};
+}
+
 static struct gs_sync_param vm_to_sp_for_synch_gen(
 	const struct fb_videomode *vm, const struct gs_synch_gen sg)
 {
-	struct gs_sync_param sp = vm_to_sp_sdtv(vm);
+	const bool bc = vm->sync & FB_SYNC_BROADCAST;
+	const bool il = vm->vmode & FB_VMODE_INTERLACED;
+	struct gs_sync_param sp =
+		vm->yres <= 288 &&       bc ? vm_to_sp_sdtv(vm) :
+		vm->yres <= 576 && il && bc ? vm_to_sp_sdtv(vm) :
+					      vm_to_sp_hdtv(vm, sg);
 
 	sp.smode1.gcont = gs_gcont_ycrcb;
 	sp.smode1.sint = 1;
-- 
2.21.0

