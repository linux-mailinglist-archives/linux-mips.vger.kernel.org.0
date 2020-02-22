Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44DF5169128
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 19:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgBVSOM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 13:14:12 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:60394 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgBVSOM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 13:14:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582395249; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Z0kqxIpXk5My6vgmoWXHwyw+JMdHdu9VTyoTohcALI=;
        b=fPBIYJqPvqIr6BKsNMEhPl0gvvIM3Txf98VarHNQ0Q4FEpS3upYFGxaiyfrDHU0w/WFkIJ
        I5dSirjpEbaInmrqzLlvRs0u64U6tAQVNBGvYxyjRhmw1SL5hPe2S2SPJz6cUxrXUBi56E
        0qyujNVnQ2OQ4unuzQK8ANhwXSDFF0I=
Date:   Sat, 22 Feb 2020 15:13:45 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/6] nvmem: add driver for JZ4780 efuse
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1582395225.3.2@crapouillou.net>
In-Reply-To: <A195C53D-89D4-48D6-AADE-6B7E33F4C4AA@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
        <1c180f72967425a365295770e7f98426e0f7714f.1582367141.git.hns@goldelico.com>
        <1582385894.3.0@crapouillou.net>
        <A195C53D-89D4-48D6-AADE-6B7E33F4C4AA@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le sam., f=E9vr. 22, 2020 at 18:16, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 22.02.2020 um 16:38 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>=20
>>  Le sam., f=E9vr. 22, 2020 at 11:25, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>>  This patch brings support for the JZ4780 efuse. Currently it only=20
>>> exposes
>>>  a read only access to the entire 8K bits efuse memory and nvmem=20
>>> cells.
>>>  Tested-by: Mathieu Malaterre <malat@debian.org>
>>>  Signed-off-by: PrasannaKumar Muralidharan=20
>>> <prasannatsmkumar@gmail.com>
>>>  Signed-off-by: Mathieu Malaterre <malat@debian.org>
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>  ---
>>>  drivers/nvmem/Kconfig        |  10 ++
>>>  drivers/nvmem/Makefile       |   2 +
>>>  drivers/nvmem/jz4780-efuse.c | 229=20
>>> +++++++++++++++++++++++++++++++++++
>>>  3 files changed, 241 insertions(+)
>>>  create mode 100644 drivers/nvmem/jz4780-efuse.c
>>>  diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>>>  index 35efab1ba8d9..8143e6e1dd82 100644
>>>  --- a/drivers/nvmem/Kconfig
>>>  +++ b/drivers/nvmem/Kconfig
>>>  @@ -55,6 +55,16 @@ config NVMEM_IMX_OCOTP_SCU
>>>  	  This is a driver for the SCU On-Chip OTP Controller (OCOTP)
>>>  	  available on i.MX8 SoCs.
>>>  +config JZ4780_EFUSE
>>>  +	tristate "JZ4780 EFUSE Memory Support"
>>>  +	depends on MACH_INGENIC || COMPILE_TEST
>>>  +	depends on HAS_IOMEM
>>=20
>>  You're using regmap, so you need to select REGMAP_MMIO here.
>=20
> Ok.

I think you need to depend on OF too, since the driver only probes on=20
devicetree.

>>=20
>>>  +	help
>>>  +	  Say Y here to include support for JZ4780 efuse memory found on
>>>  +	  all JZ4780 SoC based devices.
>>>  +	  To compile this driver as a module, choose M here: the module
>>>  +	  will be called nvmem_jz4780_efuse.
>>>  +
>>>  config NVMEM_LPC18XX_EEPROM
>>>  	tristate "NXP LPC18XX EEPROM Memory Support"
>>>  	depends on ARCH_LPC18XX || COMPILE_TEST
>>>  diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
>>>  index 6b466cd1427b..65a268d17807 100644
>>>  --- a/drivers/nvmem/Makefile
>>>  +++ b/drivers/nvmem/Makefile
>>>  @@ -18,6 +18,8 @@ obj-$(CONFIG_NVMEM_IMX_OCOTP)	+=3D=20
>>> nvmem-imx-ocotp.o
>>>  nvmem-imx-ocotp-y		:=3D imx-ocotp.o
>>>  obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+=3D nvmem-imx-ocotp-scu.o
>>>  nvmem-imx-ocotp-scu-y		:=3D imx-ocotp-scu.o
>>>  +obj-$(CONFIG_JZ4780_EFUSE)		+=3D nvmem_jz4780_efuse.o
>>>  +nvmem_jz4780_efuse-y		:=3D jz4780-efuse.o
>>>  obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+=3D nvmem_lpc18xx_eeprom.o
>>>  nvmem_lpc18xx_eeprom-y	:=3D lpc18xx_eeprom.o
>>>  obj-$(CONFIG_NVMEM_LPC18XX_OTP)	+=3D nvmem_lpc18xx_otp.o
>>>  diff --git a/drivers/nvmem/jz4780-efuse.c=20
>>> b/drivers/nvmem/jz4780-efuse.c
>>>  new file mode 100644
>>>  index 000000000000..08b63de0e9cc
>>>  --- /dev/null
>>>  +++ b/drivers/nvmem/jz4780-efuse.c
>>>  @@ -0,0 +1,229 @@
>>>  +// SPDX-License-Identifier: GPL-2.0-or-later
>>>  +/*
>>>  + * JZ4780 EFUSE Memory Support driver
>>>  + *
>>>  + * Copyright (c) 2017 PrasannaKumar Muralidharan=20
>>> <prasannatsmkumar@gmail.com>
>>>  + * Copyright (c) 2020 H. Nikolaus Schaller <hns@goldelico.com>
>>>  + */
>>>  +
>>>  +/*
>>>  + * Currently supports JZ4780 efuse which has 8K programmable bit.
>>>  + * Efuse is separated into seven segments as below:
>>>  + *
>>>  + *=20
>>> -----------------------------------------------------------------------
>>>  + * | 64 bit | 128 bit | 128 bit | 3520 bit | 8 bit | 2296 bit |=20
>>> 2048 bit |
>>>  + *=20
>>> -----------------------------------------------------------------------
>>>  + *
>>>  + * The rom itself is accessed using a 9 bit address line and an 8=20
>>> word wide bus
>>>  + * which reads/writes based on strobes. The strobe is configured=20
>>> in the config
>>>  + * register and is based on number of cycles of the bus clock.
>>>  + *
>>>  + * Driver supports read only as the writes are done in the=20
>>> Factory.
>>>  + */
>>>  +
>>>  +#include <linux/bitops.h>
>>>  +#include <linux/clk.h>
>>>  +#include <linux/module.h>
>>>  +#include <linux/nvmem-provider.h>
>>>  +#include <linux/of.h>
>>>  +#include <linux/platform_device.h>
>>>  +#include <linux/regmap.h>
>>>  +#include <linux/timer.h>
>>>  +
>>>  +#define JZ_EFUCTRL		(0x0)	/* Control Register */
>>>  +#define JZ_EFUCFG		(0x4)	/* Configure Register*/
>>>  +#define JZ_EFUSTATE		(0x8)	/* Status Register */
>>>  +#define JZ_EFUDATA(n)		(0xC + (n) * 4)
>>>  +
>>>  +#define EFUCTRL_ADDR_MASK	0x3FF
>>>  +#define EFUCTRL_ADDR_SHIFT	21
>>>  +#define EFUCTRL_LEN_MASK	0x1F
>>>  +#define EFUCTRL_LEN_SHIFT	16
>>>  +#define EFUCTRL_PG_EN		BIT(15)
>>>  +#define EFUCTRL_WR_EN		BIT(1)
>>>  +#define EFUCTRL_RD_EN		BIT(0)
>>>  +
>>>  +#define EFUCFG_INT_EN		BIT(31)
>>>  +#define EFUCFG_RD_ADJ_MASK	0xF
>>>  +#define EFUCFG_RD_ADJ_SHIFT	20
>>>  +#define EFUCFG_RD_STR_MASK	0xF
>>>  +#define EFUCFG_RD_STR_SHIFT	16
>>>  +#define EFUCFG_WR_ADJ_MASK	0xF
>>>  +#define EFUCFG_WR_ADJ_SHIFT	12
>>>  +#define EFUCFG_WR_STR_MASK	0xFFF
>>>  +#define EFUCFG_WR_STR_SHIFT	0
>>>  +
>>>  +#define EFUSTATE_WR_DONE	BIT(1)
>>>  +#define EFUSTATE_RD_DONE	BIT(0)
>>>  +
>>>  +struct jz4780_efuse {
>>>  +	struct device *dev;
>>>  +	struct regmap *map;
>>>  +	struct clk *clk;
>>>  +	unsigned int rd_adj;
>>>  +	unsigned int rd_strobe;
>>>  +};
>>>  +
>>>  +/* We read 32 byte chunks to avoid complexity in the driver. */
>>=20
>>  I don't see how reading 32 byte chunks avoids complexity in the=20
>> driver; the 'size' variable here could very well be an argument.
>=20
> I mixed your, mine and the original code.
>=20
> One issue with a size argument is that regmap reads in 32bit words.
>=20
> But reading the ethernet MAC address requires to fetch 6 bytes.
> AFAIK regmap can only read in multiples of the word size.
>=20
> It must also be possible to read starting at any byte address.

Right, I didn't think about byte access.

>>=20
>>>  +static int jz4780_efuse_read_32bytes(struct jz4780_efuse *efuse,=20
>>> char *buf,
>>>  +				     unsigned int addr)
>>>  +{
>>>  +	unsigned int tmp;
>>>  +	u32 ctrl;
>>>  +	int ret;
>>>  +	const int size =3D 32;
>>>  +
>>>  +	ctrl =3D (addr << EFUCTRL_ADDR_SHIFT)
>>>  +		| ((size - 1) << EFUCTRL_LEN_SHIFT)
>>>  +		| EFUCTRL_RD_EN;
>>>  +
>>>  +	regmap_update_bits(efuse->map, JZ_EFUCTRL,
>>>  +			   (EFUCTRL_ADDR_MASK << EFUCTRL_ADDR_SHIFT) |
>>>  +			   (EFUCTRL_LEN_MASK << EFUCTRL_LEN_SHIFT) |
>>>  +			   EFUCTRL_PG_EN | EFUCTRL_WR_EN | EFUCTRL_RD_EN, ctrl);
>>>  +
>>>  +	ret =3D regmap_read_poll_timeout(efuse->map, JZ_EFUSTATE,
>>>  +				       tmp, tmp & EFUSTATE_RD_DONE,
>>>  +				       1 * MSEC_PER_SEC, 50 * MSEC_PER_SEC);
>>>  +	if (ret < 0) {
>>>  +		dev_err(efuse->dev, "Time out while reading efuse data");
>>>  +		return ret;
>>>  +	}
>>>  +
>>>  +	return regmap_bulk_read(efuse->map, JZ_EFUDATA(0),
>>>  +				buf, size / sizeof(u32));
>>>  +}
>>>  +
>>>  +/* main entry point */
>>>  +static int jz4780_efuse_read(void *context, unsigned int offset,
>>>  +			     void *val, size_t bytes)
>>>  +{
>>>  +	struct jz4780_efuse *efuse =3D context;
>>>  +	int ret;
>>>  +	const int size =3D 32;
>>>  +
>>>  +	while (bytes > 0) {
>>>  +		unsigned int start =3D offset & ~(size - 1);
>>>  +		unsigned int chunk =3D min(bytes, (start + size) - offset);
>>=20
>>  Why do you need to check for the address alignment?
>=20
> This is to decide if jz4780_efuse_read_32bytes() can directly read to=20
> the
> destination buffer or if we need a temporary buffer. This avoids to=20
> always
> use a temporary buffer.

Just always use a temporary buffer. It's not like this will be called=20
very often anyway. That makes the code simpler.

>>=20
>>>  +
>>>  +		if (start =3D=3D offset && chunk =3D=3D size) {
>>>  +			ret =3D jz4780_efuse_read_32bytes(efuse, val, start);
>>>  +			if (ret < 0)
>>>  +				return ret;
>>>  +
>>>  +		} else {
>>>  +			char buf[32];
>>>  +
>>>  +			ret =3D jz4780_efuse_read_32bytes(efuse, buf, start);
>>>  +			if (ret < 0)
>>>  +				return ret;
>>>  +
>>>  +			memcpy(val, &buf[offset - start], chunk);
>>=20
>>  Why do you need this cumbersome process of reading 32 bytes if you=20
>> need less than that? This looks over-complex to me.
>=20
> MAC address must allow to read 6 Bytes. I am not sure if regmap can=20
> do that.
>=20
> According to the Programming Manual there are 8 registers with 32=20
> bits each
> so it is probably wise to read all these 32 bytes in one big read=20
> into the
> regmap. So that it is never attempted to read smaller or not 32bit=20
> aligned
> registers. This also makes sure that bank address switching is not=20
> done for
> every byte.

Honestly, it doesn't have to be fast. You could very well read byte per=20
byte. Then you wouldn't have to care about non-aligned addresses or=20
sizes, and the driver would be much simpler.

>>=20
>>>  +		}
>>>  +
>>>  +		val +=3D chunk;
>>>  +		offset +=3D chunk;
>>>  +		bytes -=3D chunk;
>>>  +	}
>>>  +
>>>  +	return 0;
>>>  +}
>>>  +
>>>  +static struct nvmem_config jz4780_efuse_nvmem_config __initdata =3D=20
>>> {
>>>  +	.name =3D "jz4780-efuse",
>>>  +	.size =3D 1024,
>>=20
>>  The efuse is 8 KiB.
>=20
> I read the Programming Manual as 8 kBit =3D 1024 Byte. See for example
> Note 1. and 2. in section "26.2.4 EFUSE Data Register (EFUDATAn)"

Right. 8 Kib, not KiB.

>>=20
>>>  +	.word_size =3D 1,
>>>  +	.stride =3D 1,
>>>  +	.owner =3D THIS_MODULE,
>>>  +	.reg_read =3D jz4780_efuse_read,
>>>  +};
>>>  +
>>>  +static const struct regmap_config jz4780_efuse_regmap_config =3D {
>>>  +	.reg_bits =3D 32,
>>>  +	.val_bits =3D 32,
>>>  +	.reg_stride =3D 4,
>>>  +	.max_register =3D JZ_EFUDATA(7),
>>>  +};
>>>  +
>>>  +static int jz4780_efuse_probe(struct platform_device *pdev)
>>>  +{
>>>  +	struct nvmem_device *nvmem;
>>>  +	struct jz4780_efuse *efuse;
>>>  +	struct nvmem_config cfg;
>>>  +	unsigned long clk_rate;
>>>  +	struct device *dev =3D &pdev->dev;
>>>  +	void __iomem *regs;
>>>  +
>>>  +	efuse =3D devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
>>>  +	if (!efuse)
>>>  +		return -ENOMEM;
>>>  +
>>>  +	regs =3D devm_platform_ioremap_resource(pdev, 0);
>>>  +	if (IS_ERR(regs))
>>>  +		return PTR_ERR(regs);
>>>  +
>>>  +	efuse->map =3D devm_regmap_init_mmio(dev, regs,
>>>  +					   &jz4780_efuse_regmap_config);
>>>  +	if (IS_ERR(efuse->map))
>>>  +		return PTR_ERR(efuse->map);
>>>  +
>>>  +	efuse->clk =3D devm_clk_get(&pdev->dev, NULL);
>>>  +	if (IS_ERR(efuse->clk))
>>>  +		return PTR_ERR(efuse->clk);
>>>  +
>>>  +	clk_rate =3D clk_get_rate(efuse->clk);
>>=20
>>  You didn't enable the clock before, so clk_get_rate can return a=20
>> bogus value.
>=20
> Well, I copied that from your proposal for jz4780_efuse_probe().
> So I don't know if that is correct or not...
> How should it be solved? clk_enable() before and clk_disable() after?
> Or is it enabled somewhere else so that we break something if
> we explicitly disable?

clk_prepare_enable() here, and clk_disable_unprepare() in the remove=20
callback or in a function passed to devm_add_action_or_reset().

>>=20
>>>  +
>>>  +	efuse->dev =3D dev;
>>>  +	/*
>>>  +	 * rd_adj and rd_strobe are 4 bit values
>>>  +	 * bus clk period * (rd_adj + 1) > 6.5ns
>>>  +	 * bus clk period * (rd_adj + 5 + rd_strobe) > 35ns
>>>  +	 */
>>>  +	efuse->rd_adj =3D (((6500 * (clk_rate / 1000000)) / 1000000) + 1)=20
>>> - 1;
>>=20
>>  I can't get my head around this calculus. Try this:
>=20
> I would read it as: multiply clk_rate (in MHz units) by 6.5 and=20
> divide by another 1000.
>=20
> So if clock rate is e.g. 500 Mhz we calculate 6.5 * 500 / 1000 =3D>=20
> 3(.25).
> 500 Mhz is equivalent to 2 ns so 2 ns * 3.25 =3D 6.5 ns.

Yes, I'm not saying that the calculus is wrong. But it multiplies=20
picoseconds with MHz, then divides by 1000000, so it's not easy to=20
understand.

> But that said: there seems to be something wrong with rounding. To=20
> fulfill the
>>  6.5 ns condition the 3.25 should be rounded up to 4.
>=20
> But since the condition is defined for rd_adj + 1 it is ok to set=20
> rd_adj to 3 in this case.
>=20
>>=20
>>  /* 1 / 6.5ns =3D=3D 153846154 Hz */
>>  efuse->rd_adj =3D clk_rate / 153846154;
>>=20
>>  The efuse read should be *at least* 6.5ns, so no need to bother=20
>> with the -1/+1.
>=20
> Well, the (X + 1) - 1 looks very redundant.
>=20
> So what about:
>=20
> #define RD_ADJ_FACTOR (unsigned long)(10 * NSEC_PER_SEC / 65)	/* 1 /=20
> 6.5ns =3D=3D 153846154 Hz */
>=20
> 	efuse->rd_adj =3D clk_rate / RD_ADJ_FACTOR;

Well, you still need the comment after the #define, so why use a=20
#define in the first place?

>>=20
>>>  +	efuse->rd_strobe =3D ((((35000 * (clk_rate / 1000000)) / 1000000)=20
>>> + 1)
>>>  +						- 5 - efuse->rd_adj);
>>=20
>>  /* 1 / 35ns =3D=3D 28571429 Hz */
>>  efuse->rd_strobe =3D max(0, clk_rate / 28571429 + 1 - 5 -=20
>> efuse->rd_adj);
>=20
> I think the original author just wanted to make the magic values a=20
> little
> more transparent. 35000 / 1000000 is easier to recognise as 35 ns in=20
> the
> programming manual than 28571429.

35000 / 1000000 is 35ms, not 35ns.

28571429 Hz is easy to recognize as 35ns when there's a comment right=20
above saying where that value comes from.

>=20
>>=20
>>>  +
>>>  +	if (efuse->rd_adj > 0x1F || efuse->rd_strobe > 0x1F) {
>>>  +		dev_err(&pdev->dev, "Cannot set clock configuration\n");
>>>  +		return -EINVAL;
>>>  +	}
>>>  +
>>>  +	regmap_update_bits(efuse->map, JZ_EFUCFG,
>>>  +			   (EFUCFG_RD_ADJ_MASK << EFUCFG_RD_ADJ_SHIFT) |
>>>  +			   (EFUCFG_RD_STR_MASK << EFUCFG_RD_STR_SHIFT),
>>>  +			   (efuse->rd_adj << EFUCFG_RD_ADJ_SHIFT) |
>>>  +			   (efuse->rd_strobe << EFUCFG_RD_STR_SHIFT));
>>>  +
>>>  +	cfg =3D jz4780_efuse_nvmem_config;
>>>  +	cfg.dev =3D &pdev->dev;
>>>  +	cfg.priv =3D efuse;
>>>  +
>>>  +	nvmem =3D devm_nvmem_register(dev, &cfg);
>>>  +	if (IS_ERR(nvmem))
>>>  +		return PTR_ERR(nvmem);
>>>  +
>>>  +	platform_set_drvdata(pdev, nvmem);
>>=20
>>  This isn't used anywhere.
>=20
> Also copied from your proposal...
> But it is indeed not used anywhere.

My code wasn't upstream-ready, and wasn't even tested on real hardware.=20
I'm reviewing the driver for mainline inclusion now.

> A big question is why we need to store rd_adj and rd_strobe in the
> struct jz4780_efuse? They are local variables inside=20
> jz4780_efuse_probe().

Maybe move the calculation of rd_adj / rd_strobe to a new function=20
that's called from the probe, and have these local variables within=20
this function.

> So the only values used are efuse->map
>=20
>>=20
>>>  +
>>>  +	return 0;
>>>  +}
>>>  +
>>>  +static const struct of_device_id jz4780_efuse_match[] =3D {
>>>  +	{ .compatible =3D "ingenic,jz4780-efuse" },
>>>  +	{ /* sentinel */ },
>>>  +};
>>>  +MODULE_DEVICE_TABLE(of, jz4780_efuse_match);
>>>  +
>>>  +static struct platform_driver jz4780_efuse_driver =3D {
>>>  +	.probe  =3D jz4780_efuse_probe,
>>>  +	.driver =3D {
>>>  +		.name =3D "jz4780-efuse",
>>>  +		.of_match_table =3D jz4780_efuse_match,
>>>  +	},
>>>  +};
>>>  +module_platform_driver(jz4780_efuse_driver);
>>>  +
>>>  +MODULE_AUTHOR("PrasannaKumar Muralidharan=20
>>> <prasannatsmkumar@gmail.com>");
>>>  +MODULE_AUTHOR("H. Nikolaus Schaller <hns@goldelico.com>");
>>>  +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
>>>  +MODULE_DESCRIPTION("Ingenic JZ4780 efuse driver");
>>>  +MODULE_LICENSE("GPL v2");
>>>  --
>>>  2.23.0
>=20
>=20
> BR and thanks,
> Nikolaus
>=20

=

