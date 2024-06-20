Return-Path: <linux-mips+bounces-3794-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E968910F7B
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E16C5B2D6D2
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC431B3F06;
	Thu, 20 Jun 2024 17:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n7wq2mXc"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D231B0115;
	Thu, 20 Jun 2024 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718905745; cv=none; b=Sd5/Fe7b9UFTyQGKo2acqINElyBYGo+hxewGbhC1jYtZXRQqSQIu1zH+iobo5fHy4E/QWG3QUpXS/9kitnBwflleOnVXuflRkVkxZY8E09ZzSG78j0hOmQGKHrbE1KD1FCClnZLppDAX7SWcn7xGNSlQ0YOFpI+SaJe+OIasJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718905745; c=relaxed/simple;
	bh=LqukskVfosQj/PiYyIrjBOVGTtXK2/AbOHRsUZqhpDA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=AoVj7cyhf1AU3CNbz/qJPjkVGA8iJETq3ZYH1kPauUYHgpOjJcU0rHBPWkCUJ4v96nmqztEOvT8F5Fm+/IVuSDn/UiXkxCCPA7mpz3ZKW694xiT/E2Dak5M/vxuzixA6bGsLfkFG1gngDY08GkEFtNfB9cchruR8fwPwd/Oq7J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n7wq2mXc; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 593E0240002;
	Thu, 20 Jun 2024 17:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718905738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ex/Fts0vtRxrrqpdJ6d+tTUoSpyLJVH1DzwkPw6yqtM=;
	b=n7wq2mXc45hhfREFMBumX2r5QgvvgJHvyALaQdta5TcFJ+GbMKX6x/EQl+tRHggTSWyQN6
	17WGjXqPBs71oqBUey79HqwgBPd3nRGLoZkFYJvXXyBuWKjIvySLyWKNiISdoEyssFvU/u
	yiBHuf7c4nmY3LCczyt/SqU7t2gckcDtfzJfhgvWWLGkVfcciSQh6Um4kAO3qSf8eoYvrS
	gTxWSrQH5wSgOa3290d8CIJV0+Qj/suQILEqL3OYA4FsUQ9sx/jYbmCghA/jXaDj3NCIlK
	TrudObnOj/TMJpSuYkrLC18YyRMIxILk2YBRcgrdlVkP7JyILt4AxtjHSXmvpw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Jun 2024 19:48:56 +0200
Message-Id: <D2518A4HNS5R.2GQYLDGDQ82XV@bootlin.com>
Subject: Re: [PATCH v2 06/11] mfd: olb: Add support for Mobileye OLB
 system-controller
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Lee Jones" <lee@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.17.0
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <20240503-mbly-olb-v2-6-95ce5a1e18fe@bootlin.com>
 <20240531110550.GE1005600@google.com>
In-Reply-To: <20240531110550.GE1005600@google.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Lee,

The latest revision [0] has changed approach following advice from
Stephen Boyd to rather move forward with auxiliary devices.

[0]: https://lore.kernel.org/lkml/20240620-mbly-olb-v3-0-5f29f8ca289c@bootl=
in.com/

On Fri May 31, 2024 at 1:05 PM CEST, Lee Jones wrote:
> On Fri, 03 May 2024, Th=C3=A9o Lebrun wrote:
>
> > Mobileye OLB system-controller gets used in EyeQ5, EyeQ6L and EyeQ6H
> > platforms. It hosts clock, reset and pinctrl functionality.
> >=20
> > Tiny iomem resources are declared for all cells. Some features are
> > spread apart. Pinctrl is only used on EyeQ5.
> >=20
> > EyeQ6H is special: it hosts seven OLB controllers, each with a
> > compatible. That means many clock and reset cells. Use cell->devname
> > for explicit device names rather than clk-eyeq.ID or clk-eyeq.ID.auto.
> >=20
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
> >  drivers/mfd/Kconfig        |  10 +++
> >  drivers/mfd/Makefile       |   2 +
> >  drivers/mfd/mobileye-olb.c | 180 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 192 insertions(+)
> >=20
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 4b023ee229cf..d004a3f4d493 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1030,6 +1030,16 @@ config MFD_OCELOT
> > =20
> >  	  If unsure, say N.
> > =20
> > +config MFD_OLB
> > +	bool "Mobileye EyeQ OLB System Controller Support"
> > +	select MFD_CORE
> > +	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
> > +	default MACH_EYEQ5 || MACH_EYEQ6H
> > +	help
> > +	  Say yes here to add support for EyeQ platforms (EyeQ5, EyeQ6L and
> > +	  EyeQ6H). This core MFD platform driver provides clock, reset and
> > +	  pinctrl (only EyeQ5) support.
> > +
> >  config EZX_PCAP
> >  	bool "Motorola EZXPCAP Support"
> >  	depends on SPI_MASTER
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index c66f07edcd0e..d872833966a8 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -120,6 +120,8 @@ obj-$(CONFIG_MFD_CORE)		+=3D mfd-core.o
> >  ocelot-soc-objs			:=3D ocelot-core.o ocelot-spi.o
> >  obj-$(CONFIG_MFD_OCELOT)	+=3D ocelot-soc.o
> > =20
> > +obj-$(CONFIG_MFD_OLB)		+=3D mobileye-olb.o
> > +
> >  obj-$(CONFIG_EZX_PCAP)		+=3D ezx-pcap.o
> >  obj-$(CONFIG_MFD_CPCAP)		+=3D motorola-cpcap.o
> > =20
> > diff --git a/drivers/mfd/mobileye-olb.c b/drivers/mfd/mobileye-olb.c
> > new file mode 100644
> > index 000000000000..1640d63a3ddd
> > --- /dev/null
> > +++ b/drivers/mfd/mobileye-olb.c
> > @@ -0,0 +1,180 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * System controller multi-function device for EyeQ platforms.
> > + *
> > + * Mobileye EyeQ5, EyeQ6L and EyeQ6H platforms have MMIO mapped regist=
ers
> > + * controlling core platform clocks, resets and pin control. Many othe=
r
> > + * features are present and not yet exposed.
> > + *
> > + * Declare cells for each compatible. Only EyeQ5 has pinctrl.
> > + * EyeQ6H has seven OLB instances; each has a name which we propagate =
to
> > + * sub-devices using cell->devname.
> > + *
> > + * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/device.h>
> > +#include <linux/errno.h>
> > +#include <linux/ioport.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +
> > +#define OLB_MFD_CELL(_name, _res, _devname) \
> > +	MFD_CELL_ALL(_name, _res, NULL, 0, 0, NULL, 0, false, NULL, _devname)
>
> The reason we provide generic MACROs is so that you don't have to define
> your own.

In this case, there was no macro that allowed setting the MFD cell
devname field, which is something that was added in the series.

I didn't know what generic macro to create so instead of creating loads
of useless ones I created a single one, targeted at my usecase.

>
> > +struct olb_match_data {
> > +	const struct mfd_cell	*cells;
> > +	int			nb_cells; /* int to match devm_mfd_add_devices() argument */
> > +};
> > +
> > +#define OLB_DATA(_cells) { .cells =3D (_cells), .nb_cells =3D ARRAY_SI=
ZE(_cells) }
> > +
> > +static int olb_probe(struct platform_device *pdev)
> > +{
> > +	const struct olb_match_data *match_data;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct resource *res;
> > +
> > +	match_data =3D device_get_match_data(dev);
> > +	if (!match_data)
> > +		return -ENODEV;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -ENODEV;
> > +
> > +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> > +				    match_data->cells, match_data->nb_cells,
> > +				    res, 0, NULL);
> > +}
> > +
> > +static const struct resource olb_eyeq5_clk_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x02C, 10 * 8, "pll"),
> > +	DEFINE_RES_MEM_NAMED(0x11C, 1 * 4, "ospi"),
> > +};
> > +
> > +static const struct resource olb_eyeq5_reset_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x004, 2 * 4, "d0"),
> > +	DEFINE_RES_MEM_NAMED(0x200, 13 * 4, "d1"),
> > +	DEFINE_RES_MEM_NAMED(0x120, 1 * 4, "d2"),
> > +};
> > +
> > +static const struct resource olb_eyeq5_pinctrl_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x0B0, 12 * 4, "pinctrl"),
> > +};
> > +
> > +static const struct mfd_cell olb_eyeq5_cells[] =3D {
> > +	OLB_MFD_CELL("clk-eyeq", olb_eyeq5_clk_resources, NULL),
> > +	OLB_MFD_CELL("reset-eyeq", olb_eyeq5_reset_resources, NULL),
> > +	OLB_MFD_CELL("eyeq5-pinctrl", olb_eyeq5_pinctrl_resources, NULL),
> > +};
> > +
> > +static const struct olb_match_data olb_eyeq5_match_data =3D OLB_DATA(o=
lb_eyeq5_cells);
> > +
> > +static const struct resource olb_eyeq6l_clk_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x02C, 4 * 8, "pll"),
> > +};
> > +
> > +static const struct resource olb_eyeq6l_reset_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x004, 2 * 4, "d0"),
> > +	DEFINE_RES_MEM_NAMED(0x200, 13 * 4, "d1"),
> > +};
> > +
> > +static const struct mfd_cell olb_eyeq6l_cells[] =3D {
> > +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6l_clk_resources, NULL),
> > +	OLB_MFD_CELL("reset-eyeq", olb_eyeq6l_reset_resources, NULL),
> > +};
> > +
> > +static const struct olb_match_data olb_eyeq6l_match_data =3D OLB_DATA(=
olb_eyeq6l_cells);
> > +
> > +static const struct resource olb_eyeq6h_acc_clk_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x040, 7 * 8, "pll"),
> > +};
> > +
> > +static const struct resource olb_eyeq6h_acc_reset_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x000, 15 * 4, "d0"),
> > +};
> > +
> > +static const struct mfd_cell olb_eyeq6h_acc_cells[] =3D {
> > +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_acc_clk_resources, "clk-eyeq-acc"=
),
>
> The point of enumerating platform device names is to identify devices
> that are identical.  We lose this with bespoke naming.
>
> If you want to identify devices either define a value to pass to .id or
> adapt the first parameter and make the clk-eyeq driver accept different
> device names.

About int IDs: those make it unclear what device we are talking about,
when we have seven of them as it was the case in this series. Yes,
there were 7 system-controllers, each exposing clocks (and most
exposing resets). IDs from 0 thru 6 was really not clear enough when
going through dmesg, which I why I added the feature.

I wasn't able to change the first parameter as that gets used for
matching a driver. As it is driver name, there can only be a single
string per driver. Here we have multiple MFD cells that each want to
probe the same driver, so they must have the same name.

>
> > +	OLB_MFD_CELL("reset-eyeq", olb_eyeq6h_acc_reset_resources, "reset-eye=
q-acc"),
> > +};
> > +
> > +static const struct olb_match_data olb_eyeq6h_acc_match_data =3D OLB_D=
ATA(olb_eyeq6h_acc_cells);
> > +
> > +static const struct resource olb_eyeq6h_we_clk_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x074, 1 * 8, "pll"),
> > +};
> > +
> > +static const struct resource olb_eyeq6h_we_reset_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x004, 4 * 4, "d0"),
> > +};
> > +
> > +static const struct mfd_cell olb_eyeq6h_west_cells[] =3D {
> > +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_we_clk_resources, "clk-eyeq-west"=
),
> > +	OLB_MFD_CELL("reset-eyeq", olb_eyeq6h_we_reset_resources, "reset-eyeq=
-west"),
> > +};
> > +
> > +static const struct olb_match_data olb_eyeq6h_west_match_data =3D OLB_=
DATA(olb_eyeq6h_west_cells);
> > +
> > +static const struct mfd_cell olb_eyeq6h_east_cells[] =3D {
> > +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_we_clk_resources, "clk-eyeq-east"=
),
> > +	OLB_MFD_CELL("reset-eyeq", olb_eyeq6h_we_reset_resources, "reset-eyeq=
-east"),
> > +};
> > +
> > +static const struct olb_match_data olb_eyeq6h_east_match_data =3D OLB_=
DATA(olb_eyeq6h_east_cells);
> > +
> > +static const struct resource olb_eyeq6h_south_clk_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x000, 4 * 8, "pll"),
> > +	DEFINE_RES_MEM_NAMED(0x070, 1 * 4, "emmc"),
> > +	DEFINE_RES_MEM_NAMED(0x090, 1 * 4, "ospi"),
> > +	DEFINE_RES_MEM_NAMED(0x098, 1 * 4, "tsu"),
> > +};
> > +
> > +static const struct mfd_cell olb_eyeq6h_south_cells[] =3D {
> > +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_south_clk_resources, "clk-eyeq-so=
uth"),
> > +};
> > +
> > +static const struct olb_match_data olb_eyeq6h_south_match_data =3D OLB=
_DATA(olb_eyeq6h_south_cells);
> > +
> > +static const struct resource olb_eyeq6h_ddr_clk_resources[] =3D {
> > +	DEFINE_RES_MEM_NAMED(0x074, 1 * 8, "pll"),
> > +};
> > +
> > +static const struct mfd_cell olb_eyeq6h_ddr0_cells[] =3D {
> > +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_ddr_clk_resources, "clk-eyeq-ddr0=
"),
> > +};
> > +
> > +static const struct olb_match_data olb_eyeq6h_ddr0_match_data =3D OLB_=
DATA(olb_eyeq6h_ddr0_cells);
> > +
> > +static const struct mfd_cell olb_eyeq6h_ddr1_cells[] =3D {
> > +	OLB_MFD_CELL("clk-eyeq", olb_eyeq6h_ddr_clk_resources, "clk-eyeq-ddr1=
"),
> > +};
> > +
> > +static const struct olb_match_data olb_eyeq6h_ddr1_match_data =3D OLB_=
DATA(olb_eyeq6h_ddr1_cells);
> > +
> > +static const struct of_device_id olb_of_match[] =3D {
> > +	{ .compatible =3D "mobileye,eyeq5-olb", .data =3D &olb_eyeq5_match_da=
ta },
>
> We're not passing MFD init data through the OF API, sorry.
>
> Pass defined identifiers through instead and match on those please.

Ah, that makes sense. Thanks for the mention. I can't find any
reasoning, I might be missing context?

Thanks Lee,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


