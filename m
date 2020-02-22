Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48A64168FCC
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 16:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgBVPip (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 10:38:45 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:42630 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbgBVPip (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 10:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582385920; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Qm2YLo7TTn+lp5h+Vo5nG5HX7+HBr+2t7y0MsDEL40=;
        b=w0ytREC6blKov2+fdQWAZn1f3BysqQ7FszxM5tbA9JZOB9Y3p1Zq7D5U6bGPtpG3pJoqEz
        yXQcXRJw23umcTgD5/Yv+b1OdZIVgUpySNURlSfuzBXgCZ7FPViD1Mtabzqs7HACVehCs8
        P6TrBjTPvSfI+si6UCxrVL/teWY03us=
Date:   Sat, 22 Feb 2020 12:38:14 -0300
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
Message-Id: <1582385894.3.0@crapouillou.net>
In-Reply-To: <1c180f72967425a365295770e7f98426e0f7714f.1582367141.git.hns@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
        <1c180f72967425a365295770e7f98426e0f7714f.1582367141.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le sam., f=E9vr. 22, 2020 at 11:25, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>=20
> This patch brings support for the JZ4780 efuse. Currently it only=20
> exposes
> a read only access to the entire 8K bits efuse memory and nvmem cells.
>=20
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/nvmem/Kconfig        |  10 ++
>  drivers/nvmem/Makefile       |   2 +
>  drivers/nvmem/jz4780-efuse.c | 229=20
> +++++++++++++++++++++++++++++++++++
>  3 files changed, 241 insertions(+)
>  create mode 100644 drivers/nvmem/jz4780-efuse.c
>=20
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 35efab1ba8d9..8143e6e1dd82 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -55,6 +55,16 @@ config NVMEM_IMX_OCOTP_SCU
>  	  This is a driver for the SCU On-Chip OTP Controller (OCOTP)
>  	  available on i.MX8 SoCs.
>=20
> +config JZ4780_EFUSE
> +	tristate "JZ4780 EFUSE Memory Support"
> +	depends on MACH_INGENIC || COMPILE_TEST
> +	depends on HAS_IOMEM

You're using regmap, so you need to select REGMAP_MMIO here.

> +	help
> +	  Say Y here to include support for JZ4780 efuse memory found on
> +	  all JZ4780 SoC based devices.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called nvmem_jz4780_efuse.
> +
>  config NVMEM_LPC18XX_EEPROM
>  	tristate "NXP LPC18XX EEPROM Memory Support"
>  	depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 6b466cd1427b..65a268d17807 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -18,6 +18,8 @@ obj-$(CONFIG_NVMEM_IMX_OCOTP)	+=3D nvmem-imx-ocotp.o
>  nvmem-imx-ocotp-y		:=3D imx-ocotp.o
>  obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+=3D nvmem-imx-ocotp-scu.o
>  nvmem-imx-ocotp-scu-y		:=3D imx-ocotp-scu.o
> +obj-$(CONFIG_JZ4780_EFUSE)		+=3D nvmem_jz4780_efuse.o
> +nvmem_jz4780_efuse-y		:=3D jz4780-efuse.o
>  obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+=3D nvmem_lpc18xx_eeprom.o
>  nvmem_lpc18xx_eeprom-y	:=3D lpc18xx_eeprom.o
>  obj-$(CONFIG_NVMEM_LPC18XX_OTP)	+=3D nvmem_lpc18xx_otp.o
> diff --git a/drivers/nvmem/jz4780-efuse.c=20
> b/drivers/nvmem/jz4780-efuse.c
> new file mode 100644
> index 000000000000..08b63de0e9cc
> --- /dev/null
> +++ b/drivers/nvmem/jz4780-efuse.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * JZ4780 EFUSE Memory Support driver
> + *
> + * Copyright (c) 2017 PrasannaKumar Muralidharan=20
> <prasannatsmkumar@gmail.com>
> + * Copyright (c) 2020 H. Nikolaus Schaller <hns@goldelico.com>
> + */
> +
> +/*
> + * Currently supports JZ4780 efuse which has 8K programmable bit.
> + * Efuse is separated into seven segments as below:
> + *
> + *=20
> -----------------------------------------------------------------------
> + * | 64 bit | 128 bit | 128 bit | 3520 bit | 8 bit | 2296 bit | 2048=20
> bit |
> + *=20
> -----------------------------------------------------------------------
> + *
> + * The rom itself is accessed using a 9 bit address line and an 8=20
> word wide bus
> + * which reads/writes based on strobes. The strobe is configured in=20
> the config
> + * register and is based on number of cycles of the bus clock.
> + *
> + * Driver supports read only as the writes are done in the Factory.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/timer.h>
> +
> +#define JZ_EFUCTRL		(0x0)	/* Control Register */
> +#define JZ_EFUCFG		(0x4)	/* Configure Register*/
> +#define JZ_EFUSTATE		(0x8)	/* Status Register */
> +#define JZ_EFUDATA(n)		(0xC + (n) * 4)
> +
> +#define EFUCTRL_ADDR_MASK	0x3FF
> +#define EFUCTRL_ADDR_SHIFT	21
> +#define EFUCTRL_LEN_MASK	0x1F
> +#define EFUCTRL_LEN_SHIFT	16
> +#define EFUCTRL_PG_EN		BIT(15)
> +#define EFUCTRL_WR_EN		BIT(1)
> +#define EFUCTRL_RD_EN		BIT(0)
> +
> +#define EFUCFG_INT_EN		BIT(31)
> +#define EFUCFG_RD_ADJ_MASK	0xF
> +#define EFUCFG_RD_ADJ_SHIFT	20
> +#define EFUCFG_RD_STR_MASK	0xF
> +#define EFUCFG_RD_STR_SHIFT	16
> +#define EFUCFG_WR_ADJ_MASK	0xF
> +#define EFUCFG_WR_ADJ_SHIFT	12
> +#define EFUCFG_WR_STR_MASK	0xFFF
> +#define EFUCFG_WR_STR_SHIFT	0
> +
> +#define EFUSTATE_WR_DONE	BIT(1)
> +#define EFUSTATE_RD_DONE	BIT(0)
> +
> +struct jz4780_efuse {
> +	struct device *dev;
> +	struct regmap *map;
> +	struct clk *clk;
> +	unsigned int rd_adj;
> +	unsigned int rd_strobe;
> +};
> +
> +/* We read 32 byte chunks to avoid complexity in the driver. */

I don't see how reading 32 byte chunks avoids complexity in the driver;=20
the 'size' variable here could very well be an argument.

> +static int jz4780_efuse_read_32bytes(struct jz4780_efuse *efuse,=20
> char *buf,
> +				     unsigned int addr)
> +{
> +	unsigned int tmp;
> +	u32 ctrl;
> +	int ret;
> +	const int size =3D 32;
> +
> +	ctrl =3D (addr << EFUCTRL_ADDR_SHIFT)
> +		| ((size - 1) << EFUCTRL_LEN_SHIFT)
> +		| EFUCTRL_RD_EN;
> +
> +	regmap_update_bits(efuse->map, JZ_EFUCTRL,
> +			   (EFUCTRL_ADDR_MASK << EFUCTRL_ADDR_SHIFT) |
> +			   (EFUCTRL_LEN_MASK << EFUCTRL_LEN_SHIFT) |
> +			   EFUCTRL_PG_EN | EFUCTRL_WR_EN | EFUCTRL_RD_EN, ctrl);
> +
> +	ret =3D regmap_read_poll_timeout(efuse->map, JZ_EFUSTATE,
> +				       tmp, tmp & EFUSTATE_RD_DONE,
> +				       1 * MSEC_PER_SEC, 50 * MSEC_PER_SEC);
> +	if (ret < 0) {
> +		dev_err(efuse->dev, "Time out while reading efuse data");
> +		return ret;
> +	}
> +
> +	return regmap_bulk_read(efuse->map, JZ_EFUDATA(0),
> +				buf, size / sizeof(u32));
> +}
> +
> +/* main entry point */
> +static int jz4780_efuse_read(void *context, unsigned int offset,
> +			     void *val, size_t bytes)
> +{
> +	struct jz4780_efuse *efuse =3D context;
> +	int ret;
> +	const int size =3D 32;
> +
> +	while (bytes > 0) {
> +		unsigned int start =3D offset & ~(size - 1);
> +		unsigned int chunk =3D min(bytes, (start + size) - offset);

Why do you need to check for the address alignment?

> +
> +		if (start =3D=3D offset && chunk =3D=3D size) {
> +			ret =3D jz4780_efuse_read_32bytes(efuse, val, start);
> +			if (ret < 0)
> +				return ret;
> +
> +		} else {
> +			char buf[32];
> +
> +			ret =3D jz4780_efuse_read_32bytes(efuse, buf, start);
> +			if (ret < 0)
> +				return ret;
> +
> +			memcpy(val, &buf[offset - start], chunk);

Why do you need this cumbersome process of reading 32 bytes if you need=20
less than that? This looks over-complex to me.

> +		}
> +
> +		val +=3D chunk;
> +		offset +=3D chunk;
> +		bytes -=3D chunk;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct nvmem_config jz4780_efuse_nvmem_config __initdata =3D {
> +	.name =3D "jz4780-efuse",
> +	.size =3D 1024,

The efuse is 8 KiB.

> +	.word_size =3D 1,
> +	.stride =3D 1,
> +	.owner =3D THIS_MODULE,
> +	.reg_read =3D jz4780_efuse_read,
> +};
> +
> +static const struct regmap_config jz4780_efuse_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.max_register =3D JZ_EFUDATA(7),
> +};
> +
> +static int jz4780_efuse_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_device *nvmem;
> +	struct jz4780_efuse *efuse;
> +	struct nvmem_config cfg;
> +	unsigned long clk_rate;
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *regs;
> +
> +	efuse =3D devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
> +	if (!efuse)
> +		return -ENOMEM;
> +
> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	efuse->map =3D devm_regmap_init_mmio(dev, regs,
> +					   &jz4780_efuse_regmap_config);
> +	if (IS_ERR(efuse->map))
> +		return PTR_ERR(efuse->map);
> +
> +	efuse->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(efuse->clk))
> +		return PTR_ERR(efuse->clk);
> +
> +	clk_rate =3D clk_get_rate(efuse->clk);

You didn't enable the clock before, so clk_get_rate can return a bogus=20
value.

> +
> +	efuse->dev =3D dev;
> +	/*
> +	 * rd_adj and rd_strobe are 4 bit values
> +	 * bus clk period * (rd_adj + 1) > 6.5ns
> +	 * bus clk period * (rd_adj + 5 + rd_strobe) > 35ns
> +	 */
> +	efuse->rd_adj =3D (((6500 * (clk_rate / 1000000)) / 1000000) + 1) - 1;

I can't get my head around this calculus. Try this:

/* 1 / 6.5ns =3D=3D 153846154 Hz */
efuse->rd_adj =3D clk_rate / 153846154;

The efuse read should be *at least* 6.5ns, so no need to bother with=20
the -1/+1.

> +	efuse->rd_strobe =3D ((((35000 * (clk_rate / 1000000)) / 1000000) + 1)
> +						- 5 - efuse->rd_adj);

/* 1 / 35ns =3D=3D 28571429 Hz */
efuse->rd_strobe =3D max(0, clk_rate / 28571429 + 1 - 5 - efuse->rd_adj);

> +
> +	if (efuse->rd_adj > 0x1F || efuse->rd_strobe > 0x1F) {
> +		dev_err(&pdev->dev, "Cannot set clock configuration\n");
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(efuse->map, JZ_EFUCFG,
> +			   (EFUCFG_RD_ADJ_MASK << EFUCFG_RD_ADJ_SHIFT) |
> +			   (EFUCFG_RD_STR_MASK << EFUCFG_RD_STR_SHIFT),
> +			   (efuse->rd_adj << EFUCFG_RD_ADJ_SHIFT) |
> +			   (efuse->rd_strobe << EFUCFG_RD_STR_SHIFT));
> +
> +	cfg =3D jz4780_efuse_nvmem_config;
> +	cfg.dev =3D &pdev->dev;
> +	cfg.priv =3D efuse;
> +
> +	nvmem =3D devm_nvmem_register(dev, &cfg);
> +	if (IS_ERR(nvmem))
> +		return PTR_ERR(nvmem);
> +
> +	platform_set_drvdata(pdev, nvmem);

This isn't used anywhere.

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id jz4780_efuse_match[] =3D {
> +	{ .compatible =3D "ingenic,jz4780-efuse" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, jz4780_efuse_match);
> +
> +static struct platform_driver jz4780_efuse_driver =3D {
> +	.probe  =3D jz4780_efuse_probe,
> +	.driver =3D {
> +		.name =3D "jz4780-efuse",
> +		.of_match_table =3D jz4780_efuse_match,
> +	},
> +};
> +module_platform_driver(jz4780_efuse_driver);
> +
> +MODULE_AUTHOR("PrasannaKumar Muralidharan=20
> <prasannatsmkumar@gmail.com>");
> +MODULE_AUTHOR("H. Nikolaus Schaller <hns@goldelico.com>");
> +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
> +MODULE_DESCRIPTION("Ingenic JZ4780 efuse driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.23.0
>=20

=

