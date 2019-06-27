Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68CC757F1F
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2019 11:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfF0JT7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Jun 2019 05:19:59 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:36004 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfF0JT7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Jun 2019 05:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561627196; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0A2M0LxPrGpAS+jxE9tL/0Cm4nT3Zid9/9XUbmHvEOA=;
        b=E3S6Pl3G1sZ8hIOBN3swFfLuT00hdR2jLNKnH49vDd2Dq4VM01jWTWc5gXixwZN1TmTP7O
        M5bdhZ5UlpPBcTghZF4EmLw1Ol3DwSnJnajiPww/ZDeMBomNGA4+E45ir0vuOi1pnyyyn+
        0fZ8d5iwYCP8cI3qCp4aOQ1SlveohLo=
Date:   Thu, 27 Jun 2019 11:19:48 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v12 04/13] mfd: Add Ingenic TCU driver
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mathieu Malaterre <malat@debian.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me
Message-Id: <1561627188.1745.1@crapouillou.net>
In-Reply-To: <20190627090102.GA2000@dell>
References: <20190521145141.9813-1-paul@crapouillou.net>
        <20190521145141.9813-5-paul@crapouillou.net> <20190626131850.GW21119@dell>
        <1561557350.1872.0@crapouillou.net> <20190627065808.GY21119@dell>
        <1561625387.1745.0@crapouillou.net> <20190627090102.GA2000@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 27 juin 2019 =C3=A0 11:01, Lee Jones <lee.jones@linaro.org> a=20
=C3=A9crit :
> On Thu, 27 Jun 2019, Paul Cercueil wrote:
>>  Le jeu. 27 juin 2019 =C3=A0 8:58, Lee Jones <lee.jones@linaro.org> a=20
>> =C3=A9crit :
>>  > On Wed, 26 Jun 2019, Paul Cercueil wrote:
>>  > >  Le mer. 26 juin 2019 =C3=A0 15:18, Lee Jones=20
>> <lee.jones@linaro.org> a
>>  > > =C3=A9crit :
>>  > >  > On Tue, 21 May 2019, Paul Cercueil wrote:
>>  > >  >
>>  > >  > >  This driver will provide a regmap that can be retrieved=20
>> very
>>  > > early
>>  > >  > > in
>>  > >  > >  the boot process through the API function
>>  > > ingenic_tcu_get_regmap().
>>  > >  > >
>>  > >  > >  Additionally, it will call devm_of_platform_populate() so=20
>> that
>>  > > all
>>  > >  > > the
>>  > >  > >  children devices will be probed.
>>  > >  > >
>>  > >  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > >  > >  ---
>>  > >  > >
>>  > >  > >  Notes:
>>  > >  > >      v12: New patch
>>  > >  > >
>>  > >  > >   drivers/mfd/Kconfig             |   8 +++
>>  > >  > >   drivers/mfd/Makefile            |   1 +
>>  > >  > >   drivers/mfd/ingenic-tcu.c       | 113
>>  > >  > > ++++++++++++++++++++++++++++++++
>>  > >  > >   include/linux/mfd/ingenic-tcu.h |   8 +++
>>  > >  > >   4 files changed, 130 insertions(+)
>>  > >  > >   create mode 100644 drivers/mfd/ingenic-tcu.c
>>  >
>>  > [...]
>>  >
>>  > >  > >  +static struct regmap * __init=20
>> ingenic_tcu_create_regmap(struct
>>  > >  > > device_node *np)
>>  > >  > >  +{
>>  > >  > >  +	struct resource res;
>>  > >  > >  +	void __iomem *base;
>>  > >  > >  +	struct regmap *map;
>>  > >  > >  +
>>  > >  > >  +	if (!of_match_node(ingenic_tcu_of_match, np))
>>  > >  > >  +		return ERR_PTR(-EINVAL);
>>  >
>>  > Drop this check.
>>  >
>>  > >  > >  +	base =3D of_io_request_and_map(np, 0, "TCU");
>>  > >  > >  +	if (IS_ERR(base))
>>  > >  > >  +		return ERR_PTR(PTR_ERR(base));
>>  > >  > >  +
>>  > >  > >  +	map =3D regmap_init_mmio(NULL, base,
>>  > > &ingenic_tcu_regmap_config);
>>  > >  > >  +	if (IS_ERR(map))
>>  > >  > >  +		goto err_iounmap;
>>  >
>>  > Place this inside probe().
>>  >
>>  > >  > >  +	return map;
>>  > >  > >  +
>>  > >  > >  +err_iounmap:
>>  > >  > >  +	iounmap(base);
>>  > >  > >  +	of_address_to_resource(np, 0, &res);
>>  > >  > >  +	release_mem_region(res.start, resource_size(&res));
>>  > >  > >  +
>>  > >  > >  +	return map;
>>  > >  > >  +}
>>  > >  >
>>  > >  > Why does this need to be set-up earlier than probe()?
>>  > >
>>  > >  See the explanation below.
>>  >
>>  > I think the answer is, it doesn't.
>>  >
>>  > >  > >  +static int __init ingenic_tcu_probe(struct=20
>> platform_device
>>  > > *pdev)
>>  > >  > >  +{
>>  > >  > >  +	struct regmap *map =3D
>>  > > ingenic_tcu_get_regmap(pdev->dev.of_node);
>>  > >  > >  +
>>  > >  > >  +	platform_set_drvdata(pdev, map);
>>  > >  > >  +
>>  > >  > >  +	regmap_attach_dev(&pdev->dev, map,
>>  > > &ingenic_tcu_regmap_config);
>>  > >  > >  +
>>  > >  > >  +	return devm_of_platform_populate(&pdev->dev);
>>  > >  > >  +}
>>  > >  > >  +
>>  > >  > >  +static struct platform_driver ingenic_tcu_driver =3D {
>>  > >  > >  +	.driver =3D {
>>  > >  > >  +		.name =3D "ingenic-tcu",
>>  > >  > >  +		.of_match_table =3D ingenic_tcu_of_match,
>>  > >  > >  +	},
>>  > >  > >  +};
>>  > >  > >  +
>>  > >  > >  +static int __init ingenic_tcu_platform_init(void)
>>  > >  > >  +{
>>  > >  > >  +	return platform_driver_probe(&ingenic_tcu_driver,
>>  > >  > >  +				     ingenic_tcu_probe);
>>  > >  >
>>  > >  > What?  Why?
>>  > >
>>  > >  The device driver probed here will populate the children=20
>> devices,
>>  > >  which will be able to retrieve the pointer to the regmap=20
>> through
>>  > >  device_get_regmap(dev->parent).
>>  >
>>  > I've never heard of this call.  Where is it?
>>=20
>>  dev_get_regmap, in <linux/regmap.h>.
>>=20
>>  > >  The children devices are normal platform drivers that can be=20
>> probed
>>  > >  the normal way. These are the PWM driver, the watchdog driver,=20
>> and
>>  > > the
>>  > >  OST (OS Timer) clocksource driver, all part of the same=20
>> hardware
>>  > > block
>>  > >  (the Timer/Counter Unit or TCU).
>>  >
>>  > If they are normal devices, then there is no need to roll your own
>>  > regmap-getter implementation like this.
>>  >
>>  > >  > >  +}
>>  > >  > >  +subsys_initcall(ingenic_tcu_platform_init);
>>  > >  > >  +
>>  > >  > >  +struct regmap * __init ingenic_tcu_get_regmap(struct
>>  > > device_node
>>  > >  > > *np)
>>  > >  > >  +{
>>  > >  > >  +	if (!tcu_regmap)
>>  > >  > >  +		tcu_regmap =3D ingenic_tcu_create_regmap(np);
>>  > >  > >  +
>>  > >  > >  +	return tcu_regmap;
>>  > >  > >  +}
>>  > >  >
>>  > >  > This makes me pretty uncomfortable.
>>  > >  >
>>  > >  > What calls it?
>>  > >
>>  > >  The TCU IRQ driver (patch [06/13]), clocks driver (patch=20
>> [05/13]),
>>  > > and the
>>  > >  non-OST clocksource driver (patch [07/13]) all probe very=20
>> early in
>>  > > the boot
>>  > >  process, and share the same devicetree node. They call this
>>  > > function to get
>>  > >  a pointer to the regmap.
>>  >
>>  > Horrible!
>>  >
>>  > Instead, you should send it through platform_set_drvdata() and=20
>> collect
>>  > it in the child drivers with platform_get_drvdata(dev->parent).
>>=20
>>  The IRQ, clocks and clocksource driver do NOT have a "struct=20
>> device" to
>>  begin with. They are not platform drivers, and cannot be platform=20
>> drivers,
>>  as they must register so early in the boot process, before "struct=20
>> device"
>>  is even a thing.
>>=20
>>  All they get is a pointer to the same devicetree node. Since all of=20
>> these
>>  have to use the same registers, they need to use a shared regmap,=20
>> which
>>  they obtain by calling ingenic_tcu_get_regmap() below.
>>=20
>>  Then, when this driver's probe gets called, the regmap is retrieved=20
>> and
>>  attached to the struct device, and then the children devices will be
>>  probed: the watchdog device, the PWM device, the OST device. These=20
>> three
>>  will retrieve the regmap by calling dev_get_regmap(dev->parent,=20
>> NULL).
>=20
> That makes sense.
>=20
> This explanation certainly belongs in the commit log.

Right.

> Can you send your v14, as you intended.  I will re-review it with new
> eyes when you do.

Could you review v13 instead? v14 will be a v13 with tiny teeny
non-code fixes (delete some newlines, replace %i with %d, and
convert the documentation from .txt to .rst).

>>  > >  > >  +bool ingenic_tcu_pwm_can_use_chn(struct device *dev,=20
>> unsigned
>>  > > int
>>  > >  > > channel)
>>  > >  > >  +{
>>  > >  > >  +	const struct ingenic_soc_info *soc =3D
>>  > >  > > device_get_match_data(dev->parent);
>>  > >  > >  +
>>  > >  > >  +	/* Enable all TCU channels for PWM use by default except
>>  > > channels
>>  > >  > > 0/1 */
>>  > >  > >  +	u32 pwm_channels_mask =3D GENMASK(soc->num_channels - 1,=20
>> 2);
>>  > >  > >  +
>>  > >  > >  +	device_property_read_u32(dev->parent,
>>  > > "ingenic,pwm-channels-mask",
>>  > >  > >  +				 &pwm_channels_mask);
>>  >
>>  > Doesn't this call overwrite the previous assignment above?
>>=20
>>  Yes, that's intended. You have a default value, that can be=20
>> overriden
>>  by a device property.
>=20
> You should provide a comment here to make your intentions clear.

Ok.

>>  > >  > >  +	return !!(pwm_channels_mask & BIT(channel));
>>  > >  > >  +}
>>  > >  > >  +EXPORT_SYMBOL_GPL(ingenic_tcu_pwm_can_use_chn);
>>  >
>>  > Where is this called from?
>>=20
>>  This is called from the PWM driver.
>=20
> Why can't it live in the PWM driver?

It totally can. I'll move it there.

>=20
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

=

