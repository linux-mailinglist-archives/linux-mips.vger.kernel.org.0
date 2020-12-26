Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3CA2E2CEF
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 04:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgLZDVv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Dec 2020 22:21:51 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:47637 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbgLZDVu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Dec 2020 22:21:50 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id A5A3158035D;
        Fri, 25 Dec 2020 22:20:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 25 Dec 2020 22:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=d
        V0XpJqCVrzdrMfS3ULsPPhF38gk2X1fD07xmoLBgPk=; b=MfVD2DwIagcwE2MNb
        os+nqfh2Zne6AG/yWI3fdyl5Aixr5OoUr26e3BBoQXwQ9kKsWUYAvdZXt0FMZKWJ
        XRXJ5tdDXqnQ74aXmsJwKbDrX1B+4+xW4x9nL2RWkspUaF1t53+mh9B0Xqt59MaR
        GxN4P+seZf3Tam9r0PAYLxzi2XYmQ619vWsfa+Lb3DbHUc9kiGOYtCAIzRY7E+cc
        D5j3mE6OyMhHjJR6FFN4yD3sHiCfq0qhhHyWpkwN8PvT8C29/TbJFgcI4HJJvXnU
        tNYKnE/ERmRKgjrP0upLiAFgJ4zN5U0aN/80txEzLWWtRClphIqjWmjxj/IMJWny
        QeWGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=dV0XpJqCVrzdrMfS3ULsPPhF38gk2X1fD07xmoLBg
        Pk=; b=fJC4H96pxtSrR+WUPa3aiivJTWmE1jfVHxuQZar+KUclKV2D74ksxYAUX
        66aVOOnfHA4g1K0q6JGnDYUF8S0FIxNGr4zqrTmWP5dGA3F1Pa18mTpN61wdgAY3
        URBVmRDYohW3/yZCJNGuIDvj7LXP4rsWlSiKrGyQImfPH8XYK6/QpbW9he8OCeXh
        7L6aY+N/m5FTpq6G66lxe/DC6Nr9i4GSjoJldGHvejcYCPbZh+JJUOTWEbKnt0/o
        nsrXcEaqHJgmFrWXv7arTfE4xuD+noAMWBQhwM8vhs98U9BYhZuK56pQsHMoVn4t
        jZP+ySg8JTajmc+ncOILBlX6XYfsg==
X-ME-Sender: <xms:CqzmX61CSScGR8LgIGbHRQj9FFsVS8hgqEGyAm2bQMXKd3NOPfF6wA>
    <xme:CqzmX9HtilGrCEud_A9YbwUsPx1mqo89tN69TiYa02P4SarsJzA4TgBYiZyNk_C4n
    5Df6SchzOn8ML5jODE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdduvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
    fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecukfhppeeghedrfeefrdeh
    tddrvdehgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:CqzmXy5g3fulgNXamW6FwMPnzonyjBBr-_F0pHsJPzk1-SUZbWCoeQ>
    <xmx:CqzmX72z9vSr3C9IeRVt8Md6YyzlgOwDmOb7PWk5s1JDECAaWH6Yzw>
    <xmx:CqzmX9EZBseKoUFaFF4JvviX_jc9NGc0W74YknU8yOeUkL3OMFFsOQ>
    <xmx:CqzmX8yplmo3qI-fiCfGy6T6K4GRmu1Q5n4kW0uArL1UFYukk8-mZeZepMA>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id C38A51080059;
        Fri, 25 Dec 2020 22:20:40 -0500 (EST)
Subject: Re: [PATCH 3/6] fbdev: Add n64rdp driver
To:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
References: <20201225190048.776de55443fd4c953e797d8e@gmx.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <06aad685-cea3-bfd3-2cba-492e5cbf322f@flygoat.com>
Date:   Sat, 26 Dec 2020 11:20:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201225190048.776de55443fd4c953e797d8e@gmx.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2020/12/26 ÉÏÎç1:00, Lauri Kasanen Ð´µÀ:
> I'm aware of the drm-fbdev resolution, but CONFIG_DRM adds 100kb, which
> is a complete blocker on a system with 8mb RAM.

Hi Lauri,

AFAIK it's impossible to have a new fbdev driver.
However you can workaround it by setup fb memory in platform code or even
bootloader and register a simplefb platform driver.

Thanks.

- Jiaxun

>
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>   arch/mips/n64/init.c         |  10 +++
>   drivers/video/fbdev/Kconfig  |   9 ++
>   drivers/video/fbdev/Makefile |   1 +
>   drivers/video/fbdev/n64rdp.c | 190 +++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 210 insertions(+)
>   create mode 100644 drivers/video/fbdev/n64rdp.c
>
> diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
> index 6fb622d..635e9ef 100644
> --- a/arch/mips/n64/init.c
> +++ b/arch/mips/n64/init.c
> @@ -8,6 +8,7 @@
>   #include <linux/ioport.h>
>   #include <linux/irq.h>
>   #include <linux/memblock.h>
> +#include <linux/platform_device.h>
>   #include <linux/string.h>
>
>   #include <asm/bootinfo.h>
> @@ -46,6 +47,15 @@ void __init prom_free_prom_memory(void)
>   {
>   }
>
> +static int __init n64_platform_init(void)
> +{
> +	platform_device_register_simple("n64rdp", -1, NULL, 0);
> +
> +	return 0;
> +}
> +
> +arch_initcall(n64_platform_init);
> +
>   void __init plat_mem_setup(void)
>   {
>   	iomem_resource_init();
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index cfb7f56..4dde2c7 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -2206,6 +2206,15 @@ config FB_SIMPLE
>   	  Configuration re: surface address, size, and format must be provided
>   	  through device tree, or plain old platform data.
>
> +config FB_N64RDP
> +	bool "Nintendo 64 RDP support"
> +	depends on (FB = y) && MIPS_N64
> +	select FB_CFB_FILLRECT
> +	select FB_CFB_COPYAREA
> +	select FB_CFB_IMAGEBLIT
> +	help
> +	  Driver for the N64's display.
> +
>   config FB_SSD1307
>   	tristate "Solomon SSD1307 framebuffer support"
>   	depends on FB && I2C
> diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
> index 477b962..86f1e22 100644
> --- a/drivers/video/fbdev/Makefile
> +++ b/drivers/video/fbdev/Makefile
> @@ -129,6 +129,7 @@ obj-$(CONFIG_FB_MX3)		  += mx3fb.o
>   obj-$(CONFIG_FB_DA8XX)		  += da8xx-fb.o
>   obj-$(CONFIG_FB_SSD1307)	  += ssd1307fb.o
>   obj-$(CONFIG_FB_SIMPLE)           += simplefb.o
> +obj-$(CONFIG_FB_N64RDP)           += n64rdp.o
>
>   # the test framebuffer is last
>   obj-$(CONFIG_FB_VIRTUAL)          += vfb.o
> diff --git a/drivers/video/fbdev/n64rdp.c b/drivers/video/fbdev/n64rdp.c
> new file mode 100644
> index 0000000..e5456b6
> --- /dev/null
> +++ b/drivers/video/fbdev/n64rdp.c
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for the N64's RDP
> + *
> + * Copyright (c) 2020 Lauri Kasanen
> + *
> + * Based on simplefb.c, which was:
> + * Copyright (c) 2013, Stephen Warren
> + *
> + * Based on q40fb.c, which was:
> + * Copyright (C) 2001 Richard Zidlicky <rz@linux-m68k.org>
> + *
> + * Also based on offb.c, which was:
> + * Copyright (C) 1997 Geert Uytterhoeven
> + * Copyright (C) 1996 Paul Mackerras
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/errno.h>
> +#include <linux/fb.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/parser.h>
> +
> +#include <asm/addrspace.h>
> +
> +static const struct fb_fix_screeninfo n64rdp_fix = {
> +	.id		= "default",
> +	.type		= FB_TYPE_PACKED_PIXELS,
> +	.visual		= FB_VISUAL_TRUECOLOR,
> +	.accel		= FB_ACCEL_NONE,
> +};
> +
> +static const struct fb_var_screeninfo n64rdp_var = {
> +	.height		= -1,
> +	.width		= -1,
> +	.activate	= FB_ACTIVATE_NOW,
> +	.vmode		= FB_VMODE_NONINTERLACED,
> +};
> +
> +#define PSEUDO_PALETTE_SIZE 16
> +
> +static int n64rdp_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
> +			      u_int transp, struct fb_info *info)
> +{
> +	u32 *pal = info->pseudo_palette;
> +	u32 cr = red >> (16 - info->var.red.length);
> +	u32 cg = green >> (16 - info->var.green.length);
> +	u32 cb = blue >> (16 - info->var.blue.length);
> +	u32 value;
> +
> +	if (regno >= PSEUDO_PALETTE_SIZE)
> +		return -EINVAL;
> +
> +	value = (cr << info->var.red.offset) |
> +		(cg << info->var.green.offset) |
> +		(cb << info->var.blue.offset);
> +	if (info->var.transp.length > 0) {
> +		u32 mask = (1 << info->var.transp.length) - 1;
> +		mask <<= info->var.transp.offset;
> +		value |= mask;
> +	}
> +	pal[regno] = value;
> +
> +	return 0;
> +}
> +
> +static const struct fb_ops n64rdp_ops = {
> +	.owner		= THIS_MODULE,
> +	.fb_setcolreg	= n64rdp_setcolreg,
> +	.fb_fillrect	= cfb_fillrect,
> +	.fb_copyarea	= cfb_copyarea,
> +	.fb_imageblit	= cfb_imageblit,
> +};
> +
> +struct n64rdp_par {
> +	u32 palette[PSEUDO_PALETTE_SIZE];
> +	dma_addr_t physaddr;
> +};
> +
> +#define REG_BASE ((u32 *) CKSEG1ADDR(0xA4400000))
> +
> +static void n64rdp_write_reg(const u8 reg, const u32 value)
> +{
> +	__raw_writel(value, REG_BASE + reg);
> +}
> +
> +#define W 320
> +#define H 240
> +
> +static const u32 ntsc_320[] __initconst = {
> +	0x00013212, 0x00000000, 0x00000140, 0x00000200,
> +	0x00000000, 0x03e52239, 0x0000020d, 0x00000c15,
> +	0x0c150c15, 0x006c02ec, 0x002501ff, 0x000e0204,
> +	0x00000200, 0x00000400
> +};
> +
> +static int __init n64rdp_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	u32 i;
> +	struct fb_info *info;
> +	struct n64rdp_par *par;
> +	dma_addr_t addr;
> +
> +	info = framebuffer_alloc(sizeof(struct n64rdp_par), &pdev->dev);
> +	if (!info)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, info);
> +
> +	par = info->par;
> +
> +	info->fix = n64rdp_fix;
> +	info->screen_base = dma_alloc_coherent(&pdev->dev, W * H * 2, &addr,
> +					       GFP_DMA | GFP_KERNEL);
> +	if (!info->screen_base)
> +		return -ENOMEM;
> +
> +	info->fix.smem_start = par->physaddr = addr;
> +	info->fix.smem_len = W * H * 2;
> +	info->fix.line_length = W * 2;
> +
> +	info->var = n64rdp_var;
> +	info->var.xres = W;
> +	info->var.yres = H;
> +	info->var.xres_virtual = W;
> +	info->var.yres_virtual = H;
> +	info->var.bits_per_pixel = 16;
> +	info->var.red = (struct fb_bitfield) {11, 5};
> +	info->var.green = (struct fb_bitfield) {6, 5};
> +	info->var.blue = (struct fb_bitfield) {1, 5};
> +	info->var.transp = (struct fb_bitfield) {0, 1};
> +
> +	info->apertures = alloc_apertures(1);
> +	if (!info->apertures) {
> +		ret = -ENOMEM;
> +		goto error_fb_release;
> +	}
> +	info->apertures->ranges[0].base = info->fix.smem_start;
> +	info->apertures->ranges[0].size = info->fix.smem_len;
> +
> +	info->fbops = &n64rdp_ops;
> +	info->flags = FBINFO_DEFAULT;
> +	info->pseudo_palette = par->palette;
> +
> +	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes, mapped to 0x%p\n",
> +			     info->fix.smem_start, info->fix.smem_len,
> +			     info->screen_base);
> +
> +	ret = register_framebuffer(info);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Unable to register n64rdp: %d\n", ret);
> +		goto error_fb_release;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(ntsc_320); i++) {
> +		if (i == 1)
> +			n64rdp_write_reg(i, par->physaddr);
> +		else
> +			n64rdp_write_reg(i, ntsc_320[i]);
> +	}
> +
> +	return 0;
> +
> +error_fb_release:
> +	framebuffer_release(info);
> +	return ret;
> +}
> +
> +static struct platform_driver n64rdp_driver = {
> +	.driver = {
> +		.name = "n64rdp",
> +	},
> +};
> +
> +static int __init n64rdp_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_probe(&n64rdp_driver, n64rdp_probe);
> +
> +	return ret;
> +}
> +
> +fs_initcall(n64rdp_init);
> +
> +MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
> +MODULE_DESCRIPTION("Driver for the N64's display");
> +MODULE_LICENSE("GPL v2");
> --
> 2.6.2
>

