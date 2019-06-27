Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2008157EAA
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2019 10:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfF0IuA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Jun 2019 04:50:00 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:59256 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfF0IuA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Jun 2019 04:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561625395; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RSrdIJLdpHhR0sIXC1hqh8VJH0pYPCiqhfYWDDoKWiY=;
        b=vtaUbnblQ7xmW1EowGSxO58CHxsVUkoWZ4viq77I9dDr4rO+h3dwix2vXUiihodG+wU/G1
        VAP/WyKRUY/wS6veVhE/z8iMLEqZsPUUP4AfDN/Y2YYnkt+JGXodZvbwa1T6W6FSKP2DCh
        /saG6PPpBRfk6/7InsIWq9jTqPqpqPQ=
Date:   Thu, 27 Jun 2019 10:49:47 +0200
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
Message-Id: <1561625387.1745.0@crapouillou.net>
In-Reply-To: <20190627065808.GY21119@dell>
References: <20190521145141.9813-1-paul@crapouillou.net>
        <20190521145141.9813-5-paul@crapouillou.net> <20190626131850.GW21119@dell>
        <1561557350.1872.0@crapouillou.net> <20190627065808.GY21119@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 27 juin 2019 =C3=A0 8:58, Lee Jones <lee.jones@linaro.org> a =C3=A9=
crit=20
:
> On Wed, 26 Jun 2019, Paul Cercueil wrote:
>>  Le mer. 26 juin 2019 =C3=A0 15:18, Lee Jones <lee.jones@linaro.org> a=20
>> =C3=A9crit :
>>  > On Tue, 21 May 2019, Paul Cercueil wrote:
>>  >
>>  > >  This driver will provide a regmap that can be retrieved very=20
>> early
>>  > > in
>>  > >  the boot process through the API function=20
>> ingenic_tcu_get_regmap().
>>  > >
>>  > >  Additionally, it will call devm_of_platform_populate() so that=20
>> all
>>  > > the
>>  > >  children devices will be probed.
>>  > >
>>  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > >  ---
>>  > >
>>  > >  Notes:
>>  > >      v12: New patch
>>  > >
>>  > >   drivers/mfd/Kconfig             |   8 +++
>>  > >   drivers/mfd/Makefile            |   1 +
>>  > >   drivers/mfd/ingenic-tcu.c       | 113
>>  > > ++++++++++++++++++++++++++++++++
>>  > >   include/linux/mfd/ingenic-tcu.h |   8 +++
>>  > >   4 files changed, 130 insertions(+)
>>  > >   create mode 100644 drivers/mfd/ingenic-tcu.c
>=20
> [...]
>=20
>>  > >  +static struct regmap * __init ingenic_tcu_create_regmap(struct
>>  > > device_node *np)
>>  > >  +{
>>  > >  +	struct resource res;
>>  > >  +	void __iomem *base;
>>  > >  +	struct regmap *map;
>>  > >  +
>>  > >  +	if (!of_match_node(ingenic_tcu_of_match, np))
>>  > >  +		return ERR_PTR(-EINVAL);
>=20
> Drop this check.
>=20
>>  > >  +	base =3D of_io_request_and_map(np, 0, "TCU");
>>  > >  +	if (IS_ERR(base))
>>  > >  +		return ERR_PTR(PTR_ERR(base));
>>  > >  +
>>  > >  +	map =3D regmap_init_mmio(NULL, base,=20
>> &ingenic_tcu_regmap_config);
>>  > >  +	if (IS_ERR(map))
>>  > >  +		goto err_iounmap;
>=20
> Place this inside probe().
>=20
>>  > >  +	return map;
>>  > >  +
>>  > >  +err_iounmap:
>>  > >  +	iounmap(base);
>>  > >  +	of_address_to_resource(np, 0, &res);
>>  > >  +	release_mem_region(res.start, resource_size(&res));
>>  > >  +
>>  > >  +	return map;
>>  > >  +}
>>  >
>>  > Why does this need to be set-up earlier than probe()?
>>=20
>>  See the explanation below.
>=20
> I think the answer is, it doesn't.
>=20
>>  > >  +static int __init ingenic_tcu_probe(struct platform_device=20
>> *pdev)
>>  > >  +{
>>  > >  +	struct regmap *map =3D=20
>> ingenic_tcu_get_regmap(pdev->dev.of_node);
>>  > >  +
>>  > >  +	platform_set_drvdata(pdev, map);
>>  > >  +
>>  > >  +	regmap_attach_dev(&pdev->dev, map,=20
>> &ingenic_tcu_regmap_config);
>>  > >  +
>>  > >  +	return devm_of_platform_populate(&pdev->dev);
>>  > >  +}
>>  > >  +
>>  > >  +static struct platform_driver ingenic_tcu_driver =3D {
>>  > >  +	.driver =3D {
>>  > >  +		.name =3D "ingenic-tcu",
>>  > >  +		.of_match_table =3D ingenic_tcu_of_match,
>>  > >  +	},
>>  > >  +};
>>  > >  +
>>  > >  +static int __init ingenic_tcu_platform_init(void)
>>  > >  +{
>>  > >  +	return platform_driver_probe(&ingenic_tcu_driver,
>>  > >  +				     ingenic_tcu_probe);
>>  >
>>  > What?  Why?
>>=20
>>  The device driver probed here will populate the children devices,
>>  which will be able to retrieve the pointer to the regmap through
>>  device_get_regmap(dev->parent).
>=20
> I've never heard of this call.  Where is it?

dev_get_regmap, in <linux/regmap.h>.

>>  The children devices are normal platform drivers that can be probed
>>  the normal way. These are the PWM driver, the watchdog driver, and=20
>> the
>>  OST (OS Timer) clocksource driver, all part of the same hardware=20
>> block
>>  (the Timer/Counter Unit or TCU).
>=20
> If they are normal devices, then there is no need to roll your own
> regmap-getter implementation like this.
>=20
>>  > >  +}
>>  > >  +subsys_initcall(ingenic_tcu_platform_init);
>>  > >  +
>>  > >  +struct regmap * __init ingenic_tcu_get_regmap(struct=20
>> device_node
>>  > > *np)
>>  > >  +{
>>  > >  +	if (!tcu_regmap)
>>  > >  +		tcu_regmap =3D ingenic_tcu_create_regmap(np);
>>  > >  +
>>  > >  +	return tcu_regmap;
>>  > >  +}
>>  >
>>  > This makes me pretty uncomfortable.
>>  >
>>  > What calls it?
>>=20
>>  The TCU IRQ driver (patch [06/13]), clocks driver (patch [05/13]),=20
>> and the
>>  non-OST clocksource driver (patch [07/13]) all probe very early in=20
>> the boot
>>  process, and share the same devicetree node. They call this=20
>> function to get
>>  a pointer to the regmap.
>=20
> Horrible!
>=20
> Instead, you should send it through platform_set_drvdata() and collect
> it in the child drivers with platform_get_drvdata(dev->parent).

The IRQ, clocks and clocksource driver do NOT have a "struct device" to
begin with. They are not platform drivers, and cannot be platform=20
drivers,
as they must register so early in the boot process, before "struct=20
device"
is even a thing.

All they get is a pointer to the same devicetree node. Since all of=20
these
have to use the same registers, they need to use a shared regmap, which
they obtain by calling ingenic_tcu_get_regmap() below.

Then, when this driver's probe gets called, the regmap is retrieved and
attached to the struct device, and then the children devices will be
probed: the watchdog device, the PWM device, the OST device. These three
will retrieve the regmap by calling dev_get_regmap(dev->parent, NULL).

>>  > >  +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned=20
>> int
>>  > > channel)
>>  > >  +{
>>  > >  +	const struct ingenic_soc_info *soc =3D
>>  > > device_get_match_data(dev->parent);
>>  > >  +
>>  > >  +	/* Enable all TCU channels for PWM use by default except=20
>> channels
>>  > > 0/1 */
>>  > >  +	u32 pwm_channels_mask =3D GENMASK(soc->num_channels - 1, 2);
>>  > >  +
>>  > >  +	device_property_read_u32(dev->parent,=20
>> "ingenic,pwm-channels-mask",
>>  > >  +				 &pwm_channels_mask);
>=20
> Doesn't this call overwrite the previous assignment above?

Yes, that's intended. You have a default value, that can be overriden
by a device property.

>>  > >  +	return !!(pwm_channels_mask & BIT(channel));
>>  > >  +}
>>  > >  +EXPORT_SYMBOL_GPL(ingenic_tcu_pwm_can_use_chn);
>=20
> Where is this called from?

This is called from the PWM driver.

> I think this needs a review by the DT guys.

Rob already acked the bindings, which describe this property.

>>  > >  diff --git a/include/linux/mfd/ingenic-tcu.h
>>  > > b/include/linux/mfd/ingenic-tcu.h
>>  > >  index 2083fa20821d..21df23916cd2 100644
>>  > >  --- a/include/linux/mfd/ingenic-tcu.h
>>  > >  +++ b/include/linux/mfd/ingenic-tcu.h
>>  > >  @@ -6,6 +6,11 @@
>>  > >   #define __LINUX_MFD_INGENIC_TCU_H_
>>  > >
>>  > >   #include <linux/bitops.h>
>>  > >  +#include <linux/init.h>
>>  > >  +
>>  > >  +struct device;
>>  > >  +struct device_node;
>>  > >  +struct regmap;
>>  > >
>>  > >   #define TCU_REG_WDT_TDR		0x00
>>  > >   #define TCU_REG_WDT_TCER	0x04
>>  > >  @@ -53,4 +58,7 @@
>>  > >   #define TCU_REG_TCNTc(c)	(TCU_REG_TCNT0 + ((c) *
>>  > > TCU_CHANNEL_STRIDE))
>>  > >   #define TCU_REG_TCSRc(c)	(TCU_REG_TCSR0 + ((c) *
>>  > > TCU_CHANNEL_STRIDE))
>>  > >
>>  > >  +struct regmap * __init ingenic_tcu_get_regmap(struct=20
>> device_node
>>  > > *np);
>>  > >  +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned=20
>> int
>>  > > channel);
>>  > >  +
>>  > >   #endif /* __LINUX_MFD_INGENIC_TCU_H_ */
>>  >
>>=20
>>=20
>=20
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

=

