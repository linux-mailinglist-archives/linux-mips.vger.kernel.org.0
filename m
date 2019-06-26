Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B3F56B59
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2019 15:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfFZN4B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Jun 2019 09:56:01 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:46584 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbfFZN4B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Jun 2019 09:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561557358; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yhdJpb8qFY4pN1bmwePHN5J0Vlqv/2Y1pQ5hvnLuosU=;
        b=qCmcwoT/0Aye4UItUOfH/impi67W/75PsUYWY1aJWBEzOsp+BzuTZY+vBeU31tyYnyV8TR
        4u86ez5LTMrwxizwnkaPiAE9QP7+2Fsgrh9lBQwRiiTFAwEMj8IHB8SbmxB7UzsRexIqw3
        TEnQN3vVPzCN3ouH2g+CNVEPgWWBYGU=
Date:   Wed, 26 Jun 2019 15:55:50 +0200
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
Message-Id: <1561557350.1872.0@crapouillou.net>
In-Reply-To: <20190626131850.GW21119@dell>
References: <20190521145141.9813-1-paul@crapouillou.net>
        <20190521145141.9813-5-paul@crapouillou.net> <20190626131850.GW21119@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Lee,

Le mer. 26 juin 2019 =C3=A0 15:18, Lee Jones <lee.jones@linaro.org> a=20
=C3=A9crit :
> On Tue, 21 May 2019, Paul Cercueil wrote:
>=20
>>  This driver will provide a regmap that can be retrieved very early=20
>> in
>>  the boot process through the API function ingenic_tcu_get_regmap().
>>=20
>>  Additionally, it will call devm_of_platform_populate() so that all=20
>> the
>>  children devices will be probed.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>=20
>>  Notes:
>>      v12: New patch
>>=20
>>   drivers/mfd/Kconfig             |   8 +++
>>   drivers/mfd/Makefile            |   1 +
>>   drivers/mfd/ingenic-tcu.c       | 113=20
>> ++++++++++++++++++++++++++++++++
>>   include/linux/mfd/ingenic-tcu.h |   8 +++
>>   4 files changed, 130 insertions(+)
>>   create mode 100644 drivers/mfd/ingenic-tcu.c
>>=20
>>  diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>  index 294d9567cc71..a13544474e05 100644
>>  --- a/drivers/mfd/Kconfig
>>  +++ b/drivers/mfd/Kconfig
>>  @@ -494,6 +494,14 @@ config HTC_I2CPLD
>>   	  This device provides input and output GPIOs through an I2C
>>   	  interface to one or more sub-chips.
>>=20
>>  +config INGENIC_TCU
>>  +	bool "Ingenic Timer/Counter Unit (TCU) support"
>>  +	depends on MIPS || COMPILE_TEST
>>  +	select REGMAP_MMIO
>>  +	help
>>  +	  Say yes here to support the Timer/Counter Unit (TCU) IP present
>>  +	  in the JZ47xx SoCs from Ingenic.
>>  +
>>   config MFD_INTEL_QUARK_I2C_GPIO
>>   	tristate "Intel Quark MFD I2C GPIO"
>>   	depends on PCI
>>  diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>>  index 52b1a90ff515..fb89e131ae98 100644
>>  --- a/drivers/mfd/Makefile
>>  +++ b/drivers/mfd/Makefile
>>  @@ -180,6 +180,7 @@ obj-$(CONFIG_AB8500_CORE)	+=3D ab8500-core.o=20
>> ab8500-sysctrl.o
>>   obj-$(CONFIG_MFD_TIMBERDALE)    +=3D timberdale.o
>>   obj-$(CONFIG_PMIC_ADP5520)	+=3D adp5520.o
>>   obj-$(CONFIG_MFD_KEMPLD)	+=3D kempld-core.o
>>  +obj-$(CONFIG_INGENIC_TCU)	+=3D ingenic-tcu.o
>>   obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+=3D intel_quark_i2c_gpio.o
>>   obj-$(CONFIG_LPC_SCH)		+=3D lpc_sch.o
>>   obj-$(CONFIG_LPC_ICH)		+=3D lpc_ich.o
>>  diff --git a/drivers/mfd/ingenic-tcu.c b/drivers/mfd/ingenic-tcu.c
>>  new file mode 100644
>>  index 000000000000..6c1d5e4310c1
>>  --- /dev/null
>>  +++ b/drivers/mfd/ingenic-tcu.c
>>  @@ -0,0 +1,113 @@
>>  +// SPDX-License-Identifier: GPL-2.0
>>  +/*
>>  + * JZ47xx SoCs TCU MFD driver
>=20
> Nit: Another line here please.
>=20
>>  + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
>>  + */
>>  +
>>  +#include <linux/mfd/ingenic-tcu.h>
>>  +#include <linux/of_address.h>
>>  +#include <linux/of_platform.h>
>>  +#include <linux/platform_device.h>
>>  +#include <linux/regmap.h>
>>  +
>>  +struct ingenic_soc_info {
>>  +	unsigned int num_channels;
>>  +};
>>  +
>>  +static struct regmap *tcu_regmap __initdata;
>>  +
>>  +static const struct regmap_config ingenic_tcu_regmap_config =3D {
>>  +	.reg_bits =3D 32,
>>  +	.val_bits =3D 32,
>>  +	.reg_stride =3D 4,
>>  +	.max_register =3D TCU_REG_OST_CNTHBUF,
>>  +};
>>  +
>>  +static const struct ingenic_soc_info jz4740_soc_info =3D {
>>  +	.num_channels =3D 8,
>>  +};
>>  +
>>  +static const struct ingenic_soc_info jz4725b_soc_info =3D {
>>  +	.num_channels =3D 6,
>>  +};
>>  +
>>  +static const struct of_device_id ingenic_tcu_of_match[] =3D {
>>  +	{ .compatible =3D "ingenic,jz4740-tcu", .data =3D &jz4740_soc_info, }=
,
>>  +	{ .compatible =3D "ingenic,jz4725b-tcu", .data =3D &jz4725b_soc_info,=
=20
>> },
>>  +	{ .compatible =3D "ingenic,jz4770-tcu", .data =3D &jz4740_soc_info, }=
,
>>  +	{ }
>>  +};
>>  +
>>  +static struct regmap * __init ingenic_tcu_create_regmap(struct=20
>> device_node *np)
>>  +{
>>  +	struct resource res;
>>  +	void __iomem *base;
>>  +	struct regmap *map;
>>  +
>>  +	if (!of_match_node(ingenic_tcu_of_match, np))
>>  +		return ERR_PTR(-EINVAL);
>>  +
>>  +	base =3D of_io_request_and_map(np, 0, "TCU");
>>  +	if (IS_ERR(base))
>>  +		return ERR_PTR(PTR_ERR(base));
>>  +
>>  +	map =3D regmap_init_mmio(NULL, base, &ingenic_tcu_regmap_config);
>>  +	if (IS_ERR(map))
>>  +		goto err_iounmap;
>>  +
>>  +	return map;
>>  +
>>  +err_iounmap:
>>  +	iounmap(base);
>>  +	of_address_to_resource(np, 0, &res);
>>  +	release_mem_region(res.start, resource_size(&res));
>>  +
>>  +	return map;
>>  +}
>=20
> Why does this need to be set-up earlier than probe()?

See the explanation below.

>>  +static int __init ingenic_tcu_probe(struct platform_device *pdev)
>>  +{
>>  +	struct regmap *map =3D ingenic_tcu_get_regmap(pdev->dev.of_node);
>>  +
>>  +	platform_set_drvdata(pdev, map);
>>  +
>>  +	regmap_attach_dev(&pdev->dev, map, &ingenic_tcu_regmap_config);
>>  +
>>  +	return devm_of_platform_populate(&pdev->dev);
>>  +}
>>  +
>>  +static struct platform_driver ingenic_tcu_driver =3D {
>>  +	.driver =3D {
>>  +		.name =3D "ingenic-tcu",
>>  +		.of_match_table =3D ingenic_tcu_of_match,
>>  +	},
>>  +};
>>  +
>>  +static int __init ingenic_tcu_platform_init(void)
>>  +{
>>  +	return platform_driver_probe(&ingenic_tcu_driver,
>>  +				     ingenic_tcu_probe);
>=20
> What?  Why?

The device driver probed here will populate the children devices,
which will be able to retrieve the pointer to the regmap through
device_get_regmap(dev->parent).

The children devices are normal platform drivers that can be probed
the normal way. These are the PWM driver, the watchdog driver, and the
OST (OS Timer) clocksource driver, all part of the same hardware block
(the Timer/Counter Unit or TCU).

>>  +}
>>  +subsys_initcall(ingenic_tcu_platform_init);
>>  +
>>  +struct regmap * __init ingenic_tcu_get_regmap(struct device_node=20
>> *np)
>>  +{
>>  +	if (!tcu_regmap)
>>  +		tcu_regmap =3D ingenic_tcu_create_regmap(np);
>>  +
>>  +	return tcu_regmap;
>>  +}
>=20
> This makes me pretty uncomfortable.
>=20
> What calls it?

The TCU IRQ driver (patch [06/13]), clocks driver (patch [05/13]), and=20
the
non-OST clocksource driver (patch [07/13]) all probe very early in the=20
boot
process, and share the same devicetree node. They call this function to=20
get
a pointer to the regmap.

>>  +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned int=20
>> channel)
>>  +{
>>  +	const struct ingenic_soc_info *soc =3D=20
>> device_get_match_data(dev->parent);
>>  +
>>  +	/* Enable all TCU channels for PWM use by default except channels=20
>> 0/1 */
>>  +	u32 pwm_channels_mask =3D GENMASK(soc->num_channels - 1, 2);
>>  +
>>  +	device_property_read_u32(dev->parent, "ingenic,pwm-channels-mask",
>>  +				 &pwm_channels_mask);
>>  +
>>  +	return !!(pwm_channels_mask & BIT(channel));
>>  +}
>>  +EXPORT_SYMBOL_GPL(ingenic_tcu_pwm_can_use_chn);
>>  diff --git a/include/linux/mfd/ingenic-tcu.h=20
>> b/include/linux/mfd/ingenic-tcu.h
>>  index 2083fa20821d..21df23916cd2 100644
>>  --- a/include/linux/mfd/ingenic-tcu.h
>>  +++ b/include/linux/mfd/ingenic-tcu.h
>>  @@ -6,6 +6,11 @@
>>   #define __LINUX_MFD_INGENIC_TCU_H_
>>=20
>>   #include <linux/bitops.h>
>>  +#include <linux/init.h>
>>  +
>>  +struct device;
>>  +struct device_node;
>>  +struct regmap;
>>=20
>>   #define TCU_REG_WDT_TDR		0x00
>>   #define TCU_REG_WDT_TCER	0x04
>>  @@ -53,4 +58,7 @@
>>   #define TCU_REG_TCNTc(c)	(TCU_REG_TCNT0 + ((c) *=20
>> TCU_CHANNEL_STRIDE))
>>   #define TCU_REG_TCSRc(c)	(TCU_REG_TCSR0 + ((c) *=20
>> TCU_CHANNEL_STRIDE))
>>=20
>>  +struct regmap * __init ingenic_tcu_get_regmap(struct device_node=20
>> *np);
>>  +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned int=20
>> channel);
>>  +
>>   #endif /* __LINUX_MFD_INGENIC_TCU_H_ */
>=20
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

=

