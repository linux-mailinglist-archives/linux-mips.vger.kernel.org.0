Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2366F2E2BF3
	for <lists+linux-mips@lfdr.de>; Fri, 25 Dec 2020 18:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgLYRFp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Dec 2020 12:05:45 -0500
Received: from mout.gmx.net ([212.227.15.18]:39507 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbgLYRFo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Dec 2020 12:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608915850;
        bh=L3RQrOGSQQMeJpdUKYFS+8IVZLlMP5S50DxJVxCDMS0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=As0vPpO0kUAiPUS9kk8PdtZq8PvENphLt/HoZuLJpsE24ikOm9oegngRQcmuh8FCe
         qAgWgyC1xe3DdMbZmlkvTh+b7ZHLcZV3YZHcjySskCSJX8cDnzpJOY+vIqL0O7j61X
         oCmyGOHsRn39fe5qS8nUNp1bevh4OUR/dkfj/qsQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MrhUE-1kEJ6k0ClY-00nf9S; Fri, 25
 Dec 2020 18:04:10 +0100
Date:   Fri, 25 Dec 2020 19:00:48 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 3/6] fbdev: Add n64rdp driver
Message-Id: <20201225190048.776de55443fd4c953e797d8e@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZRMwGMAHQsqRuY82UxZB/VlykgMPbRnq9wccQKDEM5TgK5iEGa+
 7sCfr5R5smGyhZXlxKea3rzG3zXolFuqxSgM9tM6zQMyBkeVAxvN/Ck8m4pltJWPXnnRRRe
 XM268PgzxAK8EebA30UgmRmx25p+IYA0ePJBi6VtwLyLyJgbCRJyLtYuGMuvR60HmR/LXKI
 uksVQeQDe3eI35adN+TIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CPWejgR/RmM=:s3YXtOQtYlA+q63j5tYdtB
 6CCdVkl5Hvz9N0mpgs0Xbj4/kmYQKzUWbXXTibzoIJpsp1lytdl/G/gRWHvzd2dpTTBgAKAgQ
 0WxLV8oeRIQ4tAYSIqzs2BR063JQMANHn56IDz0T9+F11ZLu+3v4yT+iujf8IYVJ3/OPl272I
 IfLaA65YRgXECprjWm2RKVEXb9c53amB1yb4b0UMRdE+MRQHzixVu2A2R8OZmaPWOqNEnQ++3
 2/afNYPihBLX7n1XjpPLA4C8nfYD4ivDDT31+XnOKC9SptEixsrPL6iV3iSQ9htUV/SxEQr5G
 l7wtjfJUJl+gcxfdUdhBV10W8p2sNkIDvKXFH/HIqFs3p7S/vWdNRQP7fQTNewIaTdWocpWhW
 GxzG64pRv4wX/q36qIH6Yqw5dfq5HPrs6Q/J5faF2dcwgHlrl8Cz9hBkyMen1VYcr0qoJNffz
 ewaMZHFDyTIQWAFel5slVnm6HTkWghykOLa5yTojOPxVvxZah84PhZUzk1gWaJvEMQ64AEtRC
 hpz3yzvV9qm7xmYu6AzFJq7k6m3fWzRXm34OiLZ2VpBaCZWiEp9aRO1sJwepJwHQzyiNHnqb7
 6WMDkSiezbCGAy1hF5ExrvBjLLlTqTdWgGED80KAcpXDtvwbHEe4U8bBQ5vxfvbwEoUdyKKtT
 2ULJm0TqoY4bv52mFWwTpz6YH5vCsYvHuuiVfKqsGAE4y7Gs8jDaDBtg2cIcE4vGiGdfRJ1U2
 XPVLmt3PEt0GTHmmqPqntGe2hHVgcu9hcVIg8DBUCM0gW+ozD1SdYdLzBl1m6NJozxt6wM52N
 VY9aZ8HLn9eDSKZqtJn5ZZhbr4ar6CZ+pDtPkQcdGOxKgpwEVcOGl2oyqG2nIJqG7K2o+E1pU
 8aZUUfLo8nhf6v6gIJGQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I'm aware of the drm-fbdev resolution, but CONFIG_DRM adds 100kb, which
is a complete blocker on a system with 8mb RAM.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 arch/mips/n64/init.c         |  10 +++
 drivers/video/fbdev/Kconfig  |   9 ++
 drivers/video/fbdev/Makefile |   1 +
 drivers/video/fbdev/n64rdp.c | 190 ++++++++++++++++++++++++++++++++++++++=
+++++
 4 files changed, 210 insertions(+)
 create mode 100644 drivers/video/fbdev/n64rdp.c

diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
index 6fb622d..635e9ef 100644
=2D-- a/arch/mips/n64/init.c
+++ b/arch/mips/n64/init.c
@@ -8,6 +8,7 @@
 #include <linux/ioport.h>
 #include <linux/irq.h>
 #include <linux/memblock.h>
+#include <linux/platform_device.h>
 #include <linux/string.h>

 #include <asm/bootinfo.h>
@@ -46,6 +47,15 @@ void __init prom_free_prom_memory(void)
 {
 }

+static int __init n64_platform_init(void)
+{
+	platform_device_register_simple("n64rdp", -1, NULL, 0);
+
+	return 0;
+}
+
+arch_initcall(n64_platform_init);
+
 void __init plat_mem_setup(void)
 {
 	iomem_resource_init();
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index cfb7f56..4dde2c7 100644
=2D-- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2206,6 +2206,15 @@ config FB_SIMPLE
 	  Configuration re: surface address, size, and format must be provided
 	  through device tree, or plain old platform data.

+config FB_N64RDP
+	bool "Nintendo 64 RDP support"
+	depends on (FB =3D y) && MIPS_N64
+	select FB_CFB_FILLRECT
+	select FB_CFB_COPYAREA
+	select FB_CFB_IMAGEBLIT
+	help
+	  Driver for the N64's display.
+
 config FB_SSD1307
 	tristate "Solomon SSD1307 framebuffer support"
 	depends on FB && I2C
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index 477b962..86f1e22 100644
=2D-- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -129,6 +129,7 @@ obj-$(CONFIG_FB_MX3)		  +=3D mx3fb.o
 obj-$(CONFIG_FB_DA8XX)		  +=3D da8xx-fb.o
 obj-$(CONFIG_FB_SSD1307)	  +=3D ssd1307fb.o
 obj-$(CONFIG_FB_SIMPLE)           +=3D simplefb.o
+obj-$(CONFIG_FB_N64RDP)           +=3D n64rdp.o

 # the test framebuffer is last
 obj-$(CONFIG_FB_VIRTUAL)          +=3D vfb.o
diff --git a/drivers/video/fbdev/n64rdp.c b/drivers/video/fbdev/n64rdp.c
new file mode 100644
index 0000000..e5456b6
=2D-- /dev/null
+++ b/drivers/video/fbdev/n64rdp.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for the N64's RDP
+ *
+ * Copyright (c) 2020 Lauri Kasanen
+ *
+ * Based on simplefb.c, which was:
+ * Copyright (c) 2013, Stephen Warren
+ *
+ * Based on q40fb.c, which was:
+ * Copyright (C) 2001 Richard Zidlicky <rz@linux-m68k.org>
+ *
+ * Also based on offb.c, which was:
+ * Copyright (C) 1997 Geert Uytterhoeven
+ * Copyright (C) 1996 Paul Mackerras
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/fb.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/parser.h>
+
+#include <asm/addrspace.h>
+
+static const struct fb_fix_screeninfo n64rdp_fix =3D {
+	.id		=3D "default",
+	.type		=3D FB_TYPE_PACKED_PIXELS,
+	.visual		=3D FB_VISUAL_TRUECOLOR,
+	.accel		=3D FB_ACCEL_NONE,
+};
+
+static const struct fb_var_screeninfo n64rdp_var =3D {
+	.height		=3D -1,
+	.width		=3D -1,
+	.activate	=3D FB_ACTIVATE_NOW,
+	.vmode		=3D FB_VMODE_NONINTERLACED,
+};
+
+#define PSEUDO_PALETTE_SIZE 16
+
+static int n64rdp_setcolreg(u_int regno, u_int red, u_int green, u_int bl=
ue,
+			      u_int transp, struct fb_info *info)
+{
+	u32 *pal =3D info->pseudo_palette;
+	u32 cr =3D red >> (16 - info->var.red.length);
+	u32 cg =3D green >> (16 - info->var.green.length);
+	u32 cb =3D blue >> (16 - info->var.blue.length);
+	u32 value;
+
+	if (regno >=3D PSEUDO_PALETTE_SIZE)
+		return -EINVAL;
+
+	value =3D (cr << info->var.red.offset) |
+		(cg << info->var.green.offset) |
+		(cb << info->var.blue.offset);
+	if (info->var.transp.length > 0) {
+		u32 mask =3D (1 << info->var.transp.length) - 1;
+		mask <<=3D info->var.transp.offset;
+		value |=3D mask;
+	}
+	pal[regno] =3D value;
+
+	return 0;
+}
+
+static const struct fb_ops n64rdp_ops =3D {
+	.owner		=3D THIS_MODULE,
+	.fb_setcolreg	=3D n64rdp_setcolreg,
+	.fb_fillrect	=3D cfb_fillrect,
+	.fb_copyarea	=3D cfb_copyarea,
+	.fb_imageblit	=3D cfb_imageblit,
+};
+
+struct n64rdp_par {
+	u32 palette[PSEUDO_PALETTE_SIZE];
+	dma_addr_t physaddr;
+};
+
+#define REG_BASE ((u32 *) CKSEG1ADDR(0xA4400000))
+
+static void n64rdp_write_reg(const u8 reg, const u32 value)
+{
+	__raw_writel(value, REG_BASE + reg);
+}
+
+#define W 320
+#define H 240
+
+static const u32 ntsc_320[] __initconst =3D {
+	0x00013212, 0x00000000, 0x00000140, 0x00000200,
+	0x00000000, 0x03e52239, 0x0000020d, 0x00000c15,
+	0x0c150c15, 0x006c02ec, 0x002501ff, 0x000e0204,
+	0x00000200, 0x00000400
+};
+
+static int __init n64rdp_probe(struct platform_device *pdev)
+{
+	int ret;
+	u32 i;
+	struct fb_info *info;
+	struct n64rdp_par *par;
+	dma_addr_t addr;
+
+	info =3D framebuffer_alloc(sizeof(struct n64rdp_par), &pdev->dev);
+	if (!info)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, info);
+
+	par =3D info->par;
+
+	info->fix =3D n64rdp_fix;
+	info->screen_base =3D dma_alloc_coherent(&pdev->dev, W * H * 2, &addr,
+					       GFP_DMA | GFP_KERNEL);
+	if (!info->screen_base)
+		return -ENOMEM;
+
+	info->fix.smem_start =3D par->physaddr =3D addr;
+	info->fix.smem_len =3D W * H * 2;
+	info->fix.line_length =3D W * 2;
+
+	info->var =3D n64rdp_var;
+	info->var.xres =3D W;
+	info->var.yres =3D H;
+	info->var.xres_virtual =3D W;
+	info->var.yres_virtual =3D H;
+	info->var.bits_per_pixel =3D 16;
+	info->var.red =3D (struct fb_bitfield) {11, 5};
+	info->var.green =3D (struct fb_bitfield) {6, 5};
+	info->var.blue =3D (struct fb_bitfield) {1, 5};
+	info->var.transp =3D (struct fb_bitfield) {0, 1};
+
+	info->apertures =3D alloc_apertures(1);
+	if (!info->apertures) {
+		ret =3D -ENOMEM;
+		goto error_fb_release;
+	}
+	info->apertures->ranges[0].base =3D info->fix.smem_start;
+	info->apertures->ranges[0].size =3D info->fix.smem_len;
+
+	info->fbops =3D &n64rdp_ops;
+	info->flags =3D FBINFO_DEFAULT;
+	info->pseudo_palette =3D par->palette;
+
+	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes, mapped to 0x%p\n=
",
+			     info->fix.smem_start, info->fix.smem_len,
+			     info->screen_base);
+
+	ret =3D register_framebuffer(info);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Unable to register n64rdp: %d\n", ret);
+		goto error_fb_release;
+	}
+
+	for (i =3D 0; i < ARRAY_SIZE(ntsc_320); i++) {
+		if (i =3D=3D 1)
+			n64rdp_write_reg(i, par->physaddr);
+		else
+			n64rdp_write_reg(i, ntsc_320[i]);
+	}
+
+	return 0;
+
+error_fb_release:
+	framebuffer_release(info);
+	return ret;
+}
+
+static struct platform_driver n64rdp_driver =3D {
+	.driver =3D {
+		.name =3D "n64rdp",
+	},
+};
+
+static int __init n64rdp_init(void)
+{
+	int ret;
+
+	ret =3D platform_driver_probe(&n64rdp_driver, n64rdp_probe);
+
+	return ret;
+}
+
+fs_initcall(n64rdp_init);
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("Driver for the N64's display");
+MODULE_LICENSE("GPL v2");
=2D-
2.6.2

