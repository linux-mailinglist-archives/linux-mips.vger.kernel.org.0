Return-Path: <linux-mips+bounces-3958-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D739091836C
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 15:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57F6A1F2138F
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 13:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A81F1836FB;
	Wed, 26 Jun 2024 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZTSlvyvh"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA913CFBC;
	Wed, 26 Jun 2024 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410147; cv=none; b=u9TfYwJ4/zshoYCgJ91eAjVnlPqyLFrzPI/1+WHSqz2y4MpwVHHGuAfx+eTG7+4KGkyPrkh7MsNt27RD+pZ9NoZgi+CopixC4z9O8Twhia3H43i3PP9kiLWWkdHGT+sqxqPVi4e025NZeXCsz4x+RL8RJ2lxQaPfrbpfN9zUG30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410147; c=relaxed/simple;
	bh=xrcpgoNgxm8C0Kb/r4R1lvvcHBnUSjrEZGydptIEOxE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Ay/VEHRYZUrCrcz8nSc6CkfU9c+r9sec0wEXWROZLNhVo9Mv/x0YxbsXg7yBrUkZMtAA+QnfYb8IlTHIKYM7Wr0KpBEbfmOBbg0W/Hmj6fgCPmT9eta0xsrdXHE5hJXfOySs1JpYyvJ65I271dviFliXe9e+5OnOj8xR5pB5CJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZTSlvyvh; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11D77FF80B;
	Wed, 26 Jun 2024 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719410142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHHpcdUDLggegxHApua1aann/FKTPhiRh3POfuR1lgs=;
	b=ZTSlvyvh5zkjPhU7ABPitVfc+ymxhXAB+dFOn3XkM4WDiGZSZcLzos9RfubbU7R8FuuFWq
	tQWKkGpJq5veA0MQZ2DTH/tJRU6JXzBVTnWEjtbEY01A9sYvq4iy/S7VRLZ6epythFq5as
	tfHrGKvthedApjlvHBFi7jZY8en0+sZpD9v9SclEOCE2PWsi6Uv0ujDCeSeIKbzWraS3AX
	GjhNzp0RfasxejYxpUrTVPrk6I7zI9iQNnTIKT5+XaHN3OGW3QDJvT8X0XruGkO+4eqjMN
	2OhZ7wSk3Rax7C1JBvViN8Bc3iI3MuBdB5SgscoyA0IMFHYl3wrFJbofndrBWA==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Jun 2024 15:55:40 +0200
Message-Id: <D2A00Y4TJYTS.1RMR2FSNW7KQ2@bootlin.com>
Subject: Re: [PATCH v3 7/9] reset: eyeq: add platform driver
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Lee Jones" <lee@kernel.org>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.17.0
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
 <20240620-mbly-olb-v3-7-5f29f8ca289c@bootlin.com>
 <e2f129fc42d26cde50e1de0bc80ef0db51b7f693.camel@pengutronix.de>
In-Reply-To: <e2f129fc42d26cde50e1de0bc80ef0db51b7f693.camel@pengutronix.de>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Philipp,

On Tue Jun 25, 2024 at 11:17 AM CEST, Philipp Zabel wrote:
> On Do, 2024-06-20 at 19:30 +0200, Th=C3=A9o Lebrun wrote:
> > Add Mobileye EyeQ reset controller driver, for EyeQ5, EyeQ6L and EyeQ6H
> > SoCs. Instances belong to a shared register region called OLB and gets
> > spawned as auxiliary device to the platform driver for clock.
> >=20
> > There is one OLB instance for EyeQ5 and EyeQ6L. There are seven OLB
> > instances on EyeQ6H; three have a reset controller embedded:
> >  - West and east get handled by the same compatible.
> >  - Acc (accelerator) is another one.
> >=20
> > Each instance vary in the number and types of reset domains.
> > Instances with single domain expect a single cell, others two.
> >=20
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/reset/Kconfig      |  14 ++
> >  drivers/reset/Makefile     |   1 +
> >  drivers/reset/reset-eyeq.c | 563 +++++++++++++++++++++++++++++++++++++=
++++++++
>
> Should this be called reset-eyeq-olb or reset-eyeq5, in case a
> different eyeq driver will have to be added in the future?

What about keeping reset-eyeq for the simplicity of it and using
reset-eyeq7 for a theoretical future driver that gets used by EyeQ7 and
above? Or any other revision.

Else it can be reset-eyeq5. OLB might be a concept that gets reused with
different reset blocks inside (meaning reset-eyeq-olb wouldn't
distinguish). You tell me if keeping *-eyeq is fine.

> >  4 files changed, 579 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f386e9da2cd0..36f4001c7f51 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14931,6 +14931,7 @@ F:	arch/mips/boot/dts/mobileye/
> >  F:	arch/mips/configs/eyeq5_defconfig
> >  F:	arch/mips/mobileye/board-epm5.its.S
> >  F:	drivers/clk/clk-eyeq5.c
> > +F:	drivers/reset/reset-eyeq5.c
>
> See above, and this should match the actual file name.
>
> Adding the MAINTAINERS change in the driver patches makes these patches
> depend on each other. Otherwise they could be applied independently. Do
> you intend this series to be merged together in one tree?

I'd prefer splitting it indeed.

I had thought there were two reasons the patches were interdependent:
1. MAINTAINERS file entries.
2. Kconfig: "depends on COMMON_CLK_EYEQ".

About (1): what about creating a new patch that only touches
MAINTAINERS? It would be taken as part of clk maybe (it contains the
platform driver that instantiates the other auxdevs)?

About (2): Kconfig doesn't complain the symbol doesn't exist so it looks
like a non-issue.

> >  F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
> > =20
> >  MODULE SUPPORT
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 85b27c42cf65..b79c18b75674 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -66,6 +66,20 @@ config RESET_BRCMSTB_RESCAL
> >  	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 =
on
> >  	  BCM7216.
> > =20
> > +config RESET_EYEQ
> > +	bool "Mobileye EyeQ reset controller"
> > +	depends on COMMON_CLK_EYEQ
>
> Is this a real dependency? It seems to compile just fine without it.
> Please allow building under COMPILE_TEST without COMMON_CLK_EYEQ set.

Not really. This made potential users notice they want the
clk driver if they want this reset driver. I forgot
handling test builds (ie COMPILE_TEST).

Next revision will look like:

config RESET_EYEQ
	bool "Mobileye EyeQ reset controller"
	depends on AUXILIARY_BUS
	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
	default MACH_EYEQ5 || MACH_EYEQ6H
	help: ...

[...]

> > +
> > +#include <linux/array_size.h>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/bug.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/container_of.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/lockdep.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
>
> Not needed, this being an aux driver now. Please check the other
> headers as well.

Looking at the diff, <linux/platform_device.h> is the only one.

[...]

> > +static int eqr_probe(struct auxiliary_device *adev,
> > +		     const struct auxiliary_device_id *id)
> > +{
> > +	const struct of_device_id *match;
> > +	struct device *dev =3D &adev->dev;
> > +	struct eqr_private *priv;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/*
> > +	 * We are an auxiliary device of clk-eyeq. We do not have an OF node =
by
> > +	 * default; let's reuse our parent's OF node.
> > +	 */
> > +	WARN_ON(dev->of_node);
> > +	device_set_of_node_from_dev(dev, dev->parent);
> > +	if (!dev->of_node)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * Using our newfound OF node, we can get match data. We cannot use
> > +	 * device_get_match_data() because it does not match reused OF nodes.
> > +	 */
> > +	match =3D of_match_node(dev->driver->of_match_table, dev->of_node);
> > +	if (!match || !match->data)
> > +		return -ENODEV;
> > +
> > +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->data =3D match->data;
> > +	priv->base =3D dev_get_platdata(dev);
>
>   drivers/reset/reset-eyeq.c:437:20: warning: incorrect type in assignmen=
t (different address spaces)
>   drivers/reset/reset-eyeq.c:437:20:    expected void [noderef] __iomem *=
base
>   drivers/reset/reset-eyeq.c:437:20:    got void *
>
> I'd wrap this in a struct or explicitly cast to (void __iomem *) here.

I'll cast to void iomem pointer explicitely.

Thanks for the review Philipp,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


