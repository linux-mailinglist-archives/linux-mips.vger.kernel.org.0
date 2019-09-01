Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D089DA4A86
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbfIAQWq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:22:46 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:60656 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbfIAQWq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:22:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 50C253FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:22:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FEEnMLHN4IoS for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:22:43 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 678283F62D
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:22:43 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:22:43 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 086/120] MIPS: PS2: GS: Graphics Synthesizer device init and
 video clock
Message-ID: <9d51214ecd1ad41577f01f323cf14f7b917ffc5f.1567326213.git.noring@nocrew.org>
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

Several combinations of video clock register values appear to generate
equivalent frequencies. For the standard ones, the combinations used by
Sony are preferred and tabulated. For all others, a search is performed.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/gs.h |  47 +++++++
 arch/mips/ps2/Kconfig               |  16 +++
 drivers/ps2/Makefile                |   1 +
 drivers/ps2/gs.c                    | 195 ++++++++++++++++++++++++++++
 4 files changed, 259 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/gs.h
 create mode 100644 arch/mips/ps2/Kconfig
 create mode 100644 drivers/ps2/gs.c

diff --git a/arch/mips/include/asm/mach-ps2/gs.h b/arch/mips/include/asm/mach-ps2/gs.h
new file mode 100644
index 000000000000..9cb1b909ae9b
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/gs.h
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 Graphics Synthesizer (GS)
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_GS_H
+#define __ASM_MACH_PS2_GS_H
+
+#include <asm/types.h>
+
+#include <asm/mach-ps2/gs-registers.h>
+
+#define GS_REG_BASE	0x12000000
+
+/**
+ * struct gs_synch_gen - Graphics Synthesizer SMODE1 register video clock fields
+ * @rc: PLL reference divider
+ * @lc: PLL loop divider
+ * @t1248: PLL output divider
+ * @spml: FIXME
+ *
+ * These fields determine the Graphics Synthesizer video clock
+ *
+ * 	VCK = (13500000 * @lc) / ((@t1248 + 1) * @spml * @rc).
+ *
+ * See also &struct gs_smode1.
+ */
+struct gs_synch_gen {
+	u32 rc : 3;
+	u32 lc : 7;
+	u32 t1248 : 2;
+	u32 spml : 4;
+};
+
+u32 gs_video_clock(const u32 t1248, const u32 lc, const u32 rc);
+
+u32 gs_video_clock_for_smode1(const struct gs_smode1 smode1);
+
+struct gs_synch_gen gs_synch_gen_for_vck(const u32 vck);
+
+u32 gs_rfsh_from_synch_gen(const struct gs_synch_gen sg);
+
+struct device *gs_device_driver(void);	/* FIXME: Is this method appropriate? */
+
+#endif /* __ASM_MACH_PS2_GS_H */
diff --git a/arch/mips/ps2/Kconfig b/arch/mips/ps2/Kconfig
new file mode 100644
index 000000000000..f782d61cfaac
--- /dev/null
+++ b/arch/mips/ps2/Kconfig
@@ -0,0 +1,16 @@
+config PS2_GS
+	tristate "PlayStation 2 Graphics Synthesizer"
+	depends on SONY_PS2
+	default y
+	help
+	  Say yes to enable the PlayStation 2 Graphics Synthesizer. The GS
+	  draws primitives such as triangles and sprites to its 4 MiB local
+	  frame buffer. It can handle shading, texture mapping,
+	  z-buffering, alpha blending, edge antialiasing and fogging.
+
+	  PAL, NTSC and VESA video modes are supported. Interlace and
+	  noninterlaced can be switched. The resolution is variable from
+	  256x224 to 1920x1080.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called gs.
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
index 9671bbe40294..28fb55803199 100644
--- a/drivers/ps2/Makefile
+++ b/drivers/ps2/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_PS2_GS)		+= gif.o
+obj-$(CONFIG_PS2_GS)		+= gs.o
 obj-$(CONFIG_PS2_GS)		+= gs-irq.o
 obj-$(CONFIG_PS2_GS)		+= gs-registers.o
 
diff --git a/drivers/ps2/gs.c b/drivers/ps2/gs.c
new file mode 100644
index 000000000000..00bb36304ee6
--- /dev/null
+++ b/drivers/ps2/gs.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 Graphics Synthesizer (GS)
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/ctype.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <asm/mach-ps2/gif.h>
+#include <asm/mach-ps2/gs.h>
+#include <asm/mach-ps2/irq.h>
+#include <asm/mach-ps2/rom.h>
+
+#include <uapi/asm/gs.h>
+
+static struct device *gs_dev;
+
+/**
+ * gs_video_clock - video clock (VCK) frequency given SMODE1 bit fields
+ * @t1248 - &gs_smode1.t1248 PLL output divider
+ * @lc - &gs_smode1.lc PLL loop divider
+ * @rc - &gs_smode1.rc PLL reference divider
+ *
+ * Return: video clock (VCK)
+ */
+u32 gs_video_clock(const u32 t1248, const u32 lc, const u32 rc)
+{
+	return (13500000 * lc) / ((t1248 + 1) * rc);
+}
+EXPORT_SYMBOL_GPL(gs_video_clock);
+
+/**
+ * gs_video_clock_for_smode1 - video clock (VCK) frequency given SMODE1
+ * 	register value
+ * @smode1: SMODE1 register value
+ *
+ * Return: video clock (VCK)
+ */
+u32 gs_video_clock_for_smode1(const struct gs_smode1 smode1)
+{
+	return gs_video_clock(smode1.t1248, smode1.lc, smode1.rc);
+}
+EXPORT_SYMBOL_GPL(gs_video_clock_for_smode1);
+
+static u32 div_round_ps(u32 a, u32 b)
+{
+	return DIV_ROUND_CLOSEST_ULL(a * 1000000000000ll, b);
+}
+
+static u32 vck_to_pix_clock(const u32 vck, const u32 spml)
+{
+	return div_round_ps(spml, vck);
+}
+
+/**
+ * gs_synch_gen_for_vck - determine video synchronization register fields for
+ * 	a given video clock
+ * @vck: video clock to compute video synchronization register fields for
+ *
+ * Some combinations of registers appear to generate equivalent video clock
+ * frequencies. For the standard ones, the combinations used by Sony are
+ * preferred and tabulated. For all others, a search is performed.
+ *
+ * Return: video synchronization register fields RC, LC, T1248 and SPML
+ **/
+struct gs_synch_gen gs_synch_gen_for_vck(const u32 vck)
+{
+	static const struct gs_synch_gen preferred[] = {
+		{ .spml = 2, .t1248 = 1, .lc = 15, .rc = 2 }, /*  50.625 MHz */
+		{ .spml = 2, .t1248 = 1, .lc = 32, .rc = 4 }, /*  54.000 MHz */
+		{ .spml = 4, .t1248 = 1, .lc = 32, .rc = 4 }, /*  54.000 MHz */
+		{ .spml = 2, .t1248 = 1, .lc = 28, .rc = 3 }, /*  63.000 MHz */
+		{ .spml = 1, .t1248 = 1, .lc = 22, .rc = 2 }, /*  74.250 MHz */
+		{ .spml = 1, .t1248 = 1, .lc = 35, .rc = 3 }, /*  78.750 MHz */
+		{ .spml = 2, .t1248 = 1, .lc = 71, .rc = 6 }, /*  79.875 MHz */
+		{ .spml = 2, .t1248 = 1, .lc = 44, .rc = 3 }, /*  99.000 MHz */
+		{ .spml = 1, .t1248 = 0, .lc =  8, .rc = 1 }, /* 108.000 MHz */
+		{ .spml = 2, .t1248 = 0, .lc = 58, .rc = 6 }, /* 130.500 MHz */
+		{ .spml = 1, .t1248 = 0, .lc = 10, .rc = 1 }, /* 135.000 MHz */
+		{ .spml = 1, .t1248 = 1, .lc = 22, .rc = 1 }  /* 148.500 MHz */
+	};
+
+	struct gs_synch_gen sg = { };
+	u32 spml, t1248, lc, rc;
+	int best = -1;
+	int diff, i;
+
+	for (i = 0; i < ARRAY_SIZE(preferred); i++) {
+		spml  = preferred[i].spml;
+		t1248 = preferred[i].t1248;
+		lc    = preferred[i].lc;
+		rc    = preferred[i].rc;
+
+		diff = abs(vck - vck_to_pix_clock(
+					gs_video_clock(t1248, lc, rc), spml));
+
+		if (best == -1 || diff < best) {
+			best = diff;
+			sg = (struct gs_synch_gen) {
+				.rc = rc,
+				.lc = lc,
+				.t1248 = t1248,
+				.spml = spml
+			};
+		}
+	}
+
+	for (spml  = 1; spml  <   5; spml++)
+	for (t1248 = 0; t1248 <   2; t1248++)
+	for (lc    = 1; lc    < 128; lc++)
+	for (rc    = 1; rc    <   7; rc++) {
+		diff = abs(vck - vck_to_pix_clock(
+					gs_video_clock(t1248, lc, rc), spml));
+
+		if (best == -1 || diff < best) {
+			best = diff;
+			sg = (struct gs_synch_gen) {
+				.rc = rc,
+				.lc = lc,
+				.t1248 = t1248,
+				.spml = spml
+			};
+		}
+	}
+
+	return sg;
+}
+EXPORT_SYMBOL_GPL(gs_synch_gen_for_vck);
+
+/**
+ * gs_rfsh_from_synch_gen - DRAM refresh for the given synchronization registers
+ *
+ * Return: DRAM refresh register value
+ */
+u32 gs_rfsh_from_synch_gen(const struct gs_synch_gen sg)
+{
+	const u32 pck = gs_video_clock(sg.t1248, sg.lc, sg.rc) / sg.spml;
+
+	return pck < 20000000 ? 8 :
+	       pck < 70000000 ? 4 : 2;
+}
+EXPORT_SYMBOL_GPL(gs_rfsh_from_synch_gen);
+
+struct device *gs_device_driver(void)
+{
+	return gs_dev;
+}
+EXPORT_SYMBOL_GPL(gs_device_driver);
+
+static int gs_probe(struct platform_device *pdev)
+{
+	gs_dev = &pdev->dev;
+
+	gs_irq_init();
+
+	gif_reset();
+
+	return 0;
+}
+
+static int gs_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver gs_driver = {
+	.probe		= gs_probe,
+	.remove		= gs_remove,
+	.driver = {
+		.name	= "gs",
+	},
+};
+
+static int __init gs_init(void)
+{
+	return platform_driver_register(&gs_driver);
+}
+
+static void __exit gs_exit(void)
+{
+	platform_driver_unregister(&gs_driver);
+}
+
+module_init(gs_init);
+module_exit(gs_exit);
+
+MODULE_DESCRIPTION("PlayStation 2 Graphics Synthesizer device driver");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

