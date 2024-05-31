Return-Path: <linux-mips+bounces-3440-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85438D603A
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 13:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBE85B23314
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 11:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28BD156F46;
	Fri, 31 May 2024 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpZOJktQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA8153BC1;
	Fri, 31 May 2024 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717153558; cv=none; b=TbmCYq84Uf6cKdauquTU2tuVElCSlr0ODIHUu37JCkxjSFM0Pj6QV7O5x+80YYD6T6O7UXHdKSYjDqNoKQKOile1OSh7iITvZIUCpSyApD1Q52Oi6b3T5wXEyru9udi6O3AZsUR7VI/35mahmkcBwHUPUe9aj1S7WUvbs8IkdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717153558; c=relaxed/simple;
	bh=jduYK+IkE5H/UmTDzJBdVFl6pnfSyIqLlyC96vaz1kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUP3DPLTwO8gjIKdzB8Dh5aIxYBvf6VZpQf2dAY3L6tQTnjWwZ6i5SV6vvv6epql/O6c0IAgosozUVdRUhM1df8i5XqqcOBcA65h4FekgI810R2/+IxxPzaC3nJN2W8AFSK2FcnDahPgwzFNqklzEPlTVR1Qxz5h4SK0XxzXo2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpZOJktQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A46C116B1;
	Fri, 31 May 2024 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717153558;
	bh=jduYK+IkE5H/UmTDzJBdVFl6pnfSyIqLlyC96vaz1kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gpZOJktQL3e+5T6Ai787a8gkJ9B+HxqmeGnrR5gBb8fBHn2nOLXoKLaUtjm83vT4n
	 Sg1y2FGUkUhKIT7h1pNhs7d1FfoCXZ9XUVXJ0I2jcFHNpLRXXFsqb68q23ojptccjp
	 fvrDJUrg5NDqfJuWPTTcTrahRmic3zU1ONdBrLVWIKciZ49NcTiOou0NchWB1FMETf
	 SFM78RRUlrwHAerco41jqW6PzzFvVG70zy6X3r0VVqXdhhIpFIsMFT+ZR701GxiHCw
	 5PI0k2OgnD2VFQIr6G0glzib6q9YG/SB2Jkbv5GuvhQOxOE54HFEZdlCVLzv09UfkX
	 juCRgqwfJdeog==
Date: Fri, 31 May 2024 12:05:50 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 06/11] mfd: olb: Add support for Mobileye OLB
 system-controller
Message-ID: <20240531110550.GE1005600@google.com>
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <20240503-mbly-olb-v2-6-95ce5a1e18fe@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503-mbly-olb-v2-6-95ce5a1e18fe@bootlin.com>

On Fri, 03 May 2024, Théo Lebrun wrote:

> Mobileye OLB system-controller gets used in EyeQ5, EyeQ6L and EyeQ6H
> platforms. It hosts clock, reset and pinctrl functionality.
> 
> Tiny iomem resources are declared for all cells. Some features are
> spread apart. Pinctrl is only used on EyeQ5.
> 
> EyeQ6H is special: it hosts seven OLB controllers, each with a
> compatible. That means many clock and reset cells. Use cell->devname
> for explicit device names rather than clk-eyeq.ID or clk-eyeq.ID.auto.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/mfd/Kconfig        |  10 +++
>  drivers/mfd/Makefile       |   2 +
>  drivers/mfd/mobileye-olb.c | 180 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 192 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 4b023ee229cf..d004a3f4d493 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1030,6 +1030,16 @@ config MFD_OCELOT
>  
>  	  If unsure, say N.
>  
> +config MFD_OLB
> +	bool "Mobileye EyeQ OLB System Controller Support"
> +	select MFD_CORE
> +	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
> +	default MACH_EYEQ5 || MACH_EYEQ6H
> +	help
> +	  Say yes here to add support for EyeQ platforms (EyeQ5, EyeQ6L and
> +	  EyeQ6H). This core MFD platform driver provides clock, reset and
> +	  pinctrl (only EyeQ5) support.
> +
>  config EZX_PCAP
>  	bool "Motorola EZXPCAP Support"
>  	depends on SPI_MASTER
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c66f07edcd0e..d872833966a8 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -120,6 +120,8 @@ obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
>  ocelot-soc-objs			:= ocelot-core.o ocelot-spi.o
>  obj-$(CONFIG_MFD_OCELOT)	+= ocelot-soc.o
>  
> +obj-$(CONFIG_MFD_OLB)		+= mobileye-olb.o
> +
>  obj-$(CONFIG_EZX_PCAP)		+= ezx-pcap.o
>  obj-$(CONFIG_MFD_CPCAP)		+= motorola-cpcap.o
>  
> diff --git a/drivers/mfd/mobileye-olb.c b/drivers/mfd/mobileye-olb.c
> new file mode 100644
> index 000000000000..1640d63a3ddd
> --- /dev/null
> +++ b/drivers/mfd/mobileye-olb.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * System controller multi-function device for EyeQ platforms.
> + *
> + * Mobileye EyeQ5, EyeQ6L and EyeQ6H platforms have MMIO mapped registers
> + * controlling core platform clocks, resets and pin control. Many other
> + * features are present and not yet exposed.
> + *
> + * Declare cells for each compatible. Only EyeQ5 has pinctrl.
> + * EyeQ6H has seven OLB instances; each has a name which we propagate to
> + * sub-devices using cell->devname.
> + *
> + * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/ioport.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +#define OLB_MFD_CELL(_name, _res, _devname) \
> +	MFD_CELL_ALL(_name, _res, NULL, 0, 0, NULL, 0, false, NULL, _devname)

The reason we provide generic MACROs is so that you don't have to define
your own.

> +struct olb_match_data {
> +	const struct mfd_cell	*cells;
> +	int			nb_cells; /* int to match devm_mfd_add_devices() argument */
> +};
> +
> +#define OLB_DATA(_cells) { .cells = (_cells), .nb_cells = ARRAY_SIZE(_cells) }
> +
> +static int olb_probe(struct platform_device *pdev)
> +{
> +	const struct olb_match_data *match_data;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +
> +	match_data = device_get_match_data(dev);
> +	if (!match_data)
> +		return -ENODEV;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +				    match_data->cells, match_data->nb_cells,
> +				    res, 0, NULL);
> +}
> +
> +static const struct resource olb_eyeq5_clk_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x02C, 10 * 8, "pll"),
> +	DEFINE_RES_MEM_NAMED(0x11C, 1 * 4, "ospi"),
> +};
> +
> +static const struct resource olb_eyeq5_reset_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x004, 2 * 4, "d0"),
> +	DEFINE_RES_MEM_NAMED(0x200, 13 * 4, "d1"),
> +	DEFINE_RES_MEM_NAMED(0x120, 1 * 4, "d2"),
> +};
> +
> +static const struct resource olb_eyeq5_pinctrl_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x0B0, 12 * 4, "pinctrl"),
> +};
> +
> +static const struct mfd_cell olb_eyeq5_cells[] = {
> +	OLB_MFD_CELL("clk-eyeq", olb_eyeq5_clk_resources, NULL),
> +	OLB_MFD_CELL("reset-eyeq", olb_eyeq5_reset_resources, NULL),
> +	OLB_MFD_CELL("eyeq5-pinctrl", olb_eyeq5_pinctrl_resources, NULL),
> +};
> +
> +static const struct olb_match_data olb_eyeq5_match_data = OLB_DATA(olb_eyeq5_cells);
> +
> +static const struct resource olb_eyeq6l_clk_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x02C, 4 * 8, "pll"),
> +};
> +
> +static const struct resource olb_eyeq6l_reset_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x004, 2 * 4, "d0"),
> +	DEFINE_RES_MEM_NAMED(0x200, 13 * 4, "d1"),
> +};
> +
> +static const struct mfd_cell olb_eyeq6l_cells[] = {
> +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6l_clk_resources, NULL),
> +	OLB_MFD_CELL("reset-eyeq", olb_eyeq6l_reset_resources, NULL),
> +};
> +
> +static const struct olb_match_data olb_eyeq6l_match_data = OLB_DATA(olb_eyeq6l_cells);
> +
> +static const struct resource olb_eyeq6h_acc_clk_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x040, 7 * 8, "pll"),
> +};
> +
> +static const struct resource olb_eyeq6h_acc_reset_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x000, 15 * 4, "d0"),
> +};
> +
> +static const struct mfd_cell olb_eyeq6h_acc_cells[] = {
> +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_acc_clk_resources, "clk-eyeq-acc"),

The point of enumerating platform device names is to identify devices
that are identical.  We lose this with bespoke naming.

If you want to identify devices either define a value to pass to .id or
adapt the first parameter and make the clk-eyeq driver accept different
device names.

> +	OLB_MFD_CELL("reset-eyeq", olb_eyeq6h_acc_reset_resources, "reset-eyeq-acc"),
> +};
> +
> +static const struct olb_match_data olb_eyeq6h_acc_match_data = OLB_DATA(olb_eyeq6h_acc_cells);
> +
> +static const struct resource olb_eyeq6h_we_clk_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x074, 1 * 8, "pll"),
> +};
> +
> +static const struct resource olb_eyeq6h_we_reset_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x004, 4 * 4, "d0"),
> +};
> +
> +static const struct mfd_cell olb_eyeq6h_west_cells[] = {
> +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_we_clk_resources, "clk-eyeq-west"),
> +	OLB_MFD_CELL("reset-eyeq", olb_eyeq6h_we_reset_resources, "reset-eyeq-west"),
> +};
> +
> +static const struct olb_match_data olb_eyeq6h_west_match_data = OLB_DATA(olb_eyeq6h_west_cells);
> +
> +static const struct mfd_cell olb_eyeq6h_east_cells[] = {
> +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_we_clk_resources, "clk-eyeq-east"),
> +	OLB_MFD_CELL("reset-eyeq", olb_eyeq6h_we_reset_resources, "reset-eyeq-east"),
> +};
> +
> +static const struct olb_match_data olb_eyeq6h_east_match_data = OLB_DATA(olb_eyeq6h_east_cells);
> +
> +static const struct resource olb_eyeq6h_south_clk_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x000, 4 * 8, "pll"),
> +	DEFINE_RES_MEM_NAMED(0x070, 1 * 4, "emmc"),
> +	DEFINE_RES_MEM_NAMED(0x090, 1 * 4, "ospi"),
> +	DEFINE_RES_MEM_NAMED(0x098, 1 * 4, "tsu"),
> +};
> +
> +static const struct mfd_cell olb_eyeq6h_south_cells[] = {
> +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_south_clk_resources, "clk-eyeq-south"),
> +};
> +
> +static const struct olb_match_data olb_eyeq6h_south_match_data = OLB_DATA(olb_eyeq6h_south_cells);
> +
> +static const struct resource olb_eyeq6h_ddr_clk_resources[] = {
> +	DEFINE_RES_MEM_NAMED(0x074, 1 * 8, "pll"),
> +};
> +
> +static const struct mfd_cell olb_eyeq6h_ddr0_cells[] = {
> +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_ddr_clk_resources, "clk-eyeq-ddr0"),
> +};
> +
> +static const struct olb_match_data olb_eyeq6h_ddr0_match_data = OLB_DATA(olb_eyeq6h_ddr0_cells);
> +
> +static const struct mfd_cell olb_eyeq6h_ddr1_cells[] = {
> +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_ddr_clk_resources, "clk-eyeq-ddr1"),
> +};
> +
> +static const struct olb_match_data olb_eyeq6h_ddr1_match_data = OLB_DATA(olb_eyeq6h_ddr1_cells);
> +
> +static const struct of_device_id olb_of_match[] = {
> +	{ .compatible = "mobileye,eyeq5-olb", .data = &olb_eyeq5_match_data },

We're not passing MFD init data through the OF API, sorry.

Pass defined identifiers through instead and match on those please.

> +	{ .compatible = "mobileye,eyeq6l-olb", .data = &olb_eyeq6l_match_data },
> +	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &olb_eyeq6h_acc_match_data },
> +	/* No central: it only has an early clock handled using CLK_OF_DECLARE_DRIVER(). */
> +	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &olb_eyeq6h_east_match_data },
> +	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &olb_eyeq6h_west_match_data },
> +	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &olb_eyeq6h_south_match_data },
> +	{ .compatible = "mobileye,eyeq6h-ddr0-olb", .data = &olb_eyeq6h_ddr0_match_data },
> +	{ .compatible = "mobileye,eyeq6h-ddr1-olb", .data = &olb_eyeq6h_ddr1_match_data },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, olb_of_match);
> +
> +static struct platform_driver olb_driver = {
> +	.probe =  olb_probe,
> +	.driver = {
> +		.name = "olb",
> +		.of_match_table = olb_of_match,
> +	},
> +};
> +builtin_platform_driver(olb_driver);
> 
> -- 
> 2.45.0
> 

-- 
Lee Jones [李琼斯]

