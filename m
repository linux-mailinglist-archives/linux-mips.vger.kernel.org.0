Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA26172161
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 15:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730714AbgB0OsQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 09:48:16 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:34272 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731096AbgB0OsI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 09:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582814885; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fkGdAocaebGzSpPwyxPCbnC20ppWKkS1UV5yL4mvW+Y=;
        b=eaq04j5H7vNUTn01GqNlrCdlIipoDJNMxFh3RIY5sC+PcXKXukXvBDKJ/o1JhELn2Cb3WH
        /zPxsY3TtH6/JF/pFt7lbCcV7ajs/vzRcmdRbfkxjeSUj70PcfQ/5+wq3wlnFdcXcRw9lS
        ww4FmWljZbaVKlmoxOWcaUCGTf4+LTA=
Date:   Thu, 27 Feb 2020 11:47:41 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 1/6] nvmem: add driver for JZ4780 efuse
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
Message-Id: <1582814861.3.2@crapouillou.net>
In-Reply-To: <2a675558c6c7ba6df86669176004fe4703645793.1582715761.git.hns@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com>
        <2a675558c6c7ba6df86669176004fe4703645793.1582715761.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le mer., f=E9vr. 26, 2020 at 12:15, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>=20
> This patch brings support for the JZ4780 efuse. Currently it only=20
> exposes
> a read only access to the entire 8K bits efuse memory and nvmem cells.
>=20
> To fetch for example the MAC address:
>=20
> dd if=3D/sys/devices/platform/134100d0.efuse/jz4780-efuse0/nvmem bs=3D1=20
> skip=3D34 count=3D6 status=3Dnone | xxd
>=20
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/nvmem/Kconfig        |  12 ++
>  drivers/nvmem/Makefile       |   2 +
>  drivers/nvmem/jz4780-efuse.c | 239=20
> +++++++++++++++++++++++++++++++++++
>  3 files changed, 253 insertions(+)
>  create mode 100644 drivers/nvmem/jz4780-efuse.c
>=20
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 35efab1ba8d9..d7b7f6d688e7 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -55,6 +55,18 @@ config NVMEM_IMX_OCOTP_SCU
>  	  This is a driver for the SCU On-Chip OTP Controller (OCOTP)
>  	  available on i.MX8 SoCs.
>=20
> +config JZ4780_EFUSE
> +	tristate "JZ4780 EFUSE Memory Support"
> +	depends on MACH_INGENIC || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	depends on OF
> +	select REGMAP_MMIO
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
> index 000000000000..4b8077a8d251
> --- /dev/null
> +++ b/drivers/nvmem/jz4780-efuse.c
> @@ -0,0 +1,239 @@
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
> +/* We read 32 byte chunks to avoid complexity in the driver. */
> +#define JZ_EFU_READ_SIZE 32
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
> +};
> +
> +/* main entry point */
> +static int jz4780_efuse_read(void *context, unsigned int offset,
> +			     void *val, size_t bytes)
> +{
> +	struct jz4780_efuse *efuse =3D context;
> +
> +	while (bytes > 0) {
> +		unsigned int start =3D offset & ~(JZ_EFU_READ_SIZE - 1);
> +		unsigned int chunk =3D min(bytes, (start + JZ_EFU_READ_SIZE)
> +					 - offset);
> +		char buf[JZ_EFU_READ_SIZE];
> +		unsigned int tmp;
> +		u32 ctrl;
> +		int ret;
> +
> +		ctrl =3D (start << EFUCTRL_ADDR_SHIFT)
> +			| ((JZ_EFU_READ_SIZE - 1) << EFUCTRL_LEN_SHIFT)
> +			| EFUCTRL_RD_EN;
> +
> +		regmap_update_bits(efuse->map, JZ_EFUCTRL,
> +				   (EFUCTRL_ADDR_MASK << EFUCTRL_ADDR_SHIFT) |
> +				   (EFUCTRL_LEN_MASK << EFUCTRL_LEN_SHIFT) |
> +				   EFUCTRL_PG_EN | EFUCTRL_WR_EN |
> +				   EFUCTRL_RD_EN,
> +				   ctrl);
> +
> +		ret =3D regmap_read_poll_timeout(efuse->map, JZ_EFUSTATE,
> +					       tmp, tmp & EFUSTATE_RD_DONE,
> +					       1 * MSEC_PER_SEC,
> +					       50 * MSEC_PER_SEC);
> +		if (ret < 0) {
> +			dev_err(efuse->dev, "Time out while reading efuse data");
> +			return ret;
> +		}
> +
> +		ret =3D regmap_bulk_read(efuse->map, JZ_EFUDATA(0),
> +				       buf, JZ_EFU_READ_SIZE / sizeof(u32));
> +		if (ret < 0)
> +			return ret;
> +
> +		memcpy(val, &buf[offset - start], chunk);
> +
> +		val +=3D chunk;
> +		offset +=3D chunk;
> +		bytes -=3D chunk;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct nvmem_config jz4780_efuse_nvmem_config =3D {
> +	.name =3D "jz4780-efuse",
> +	.size =3D 1024,
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
> +	unsigned long rd_adj;
> +	unsigned long rd_strobe;
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *regs;
> +	int ret;
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
> +	ret =3D clk_prepare_enable(efuse->clk);
> +	if (ret < 0)
> +		return ret;
> +
> +	clk_rate =3D clk_get_rate(efuse->clk);
> +
> +	efuse->dev =3D dev;
> +
> +	/*
> +	 * rd_adj and rd_strobe are 4 bit values
> +	 * conditions:
> +	 *   bus clk_period * (rd_adj + 1) > 6.5ns
> +	 *   bus clk_period * (rd_adj + 5 + rd_strobe) > 35ns
> +	 *   i.e. rd_adj >=3D 6.5ns / clk_period
> +	 *   i.e. rd_strobe >=3D 35 ns / clk_period - 5 - rd_adj + 1
> +	 * constants:
> +	 *   1 / 6.5ns =3D=3D 153846154 Hz
> +	 *   1 / 35ns =3D=3D 28571429 Hz
> +	 */
> +
> +	rd_adj =3D clk_rate / 153846154;
> +	rd_strobe =3D clk_rate / 28571429 - 5 - rd_adj + 1;
> +
> +	if (rd_adj > BIT(4) - 1 || rd_strobe > BIT(4) - 1) {

Just use 0xF or GENMASK(3, 0) instead of BIT(4) - 1

> +		dev_err(&pdev->dev, "Cannot set clock configuration\n");
> +		return -EINVAL;

You need to clk_disable_unprepare() before you return now, since the=20
clock has been enabled. I'd suggest registering a cleanup function=20
(with devm_add_action_or_reset) after clk_prepare_enable() is called,=20
then you don't need extra handling in the rest of the probe, and the=20
.remove function (and platform_set_drvdata) can be dropped too.

The rest looks pretty good.

Cheers,
-Paul

> +	}
> +
> +	regmap_update_bits(efuse->map, JZ_EFUCFG,
> +			   (EFUCFG_RD_ADJ_MASK << EFUCFG_RD_ADJ_SHIFT) |
> +			   (EFUCFG_RD_STR_MASK << EFUCFG_RD_STR_SHIFT),
> +			   (rd_adj << EFUCFG_RD_ADJ_SHIFT) |
> +			   (rd_strobe << EFUCFG_RD_STR_SHIFT));
> +
> +	cfg =3D jz4780_efuse_nvmem_config;
> +	cfg.dev =3D &pdev->dev;
> +	cfg.priv =3D efuse;
> +
> +	nvmem =3D devm_nvmem_register(dev, &cfg);
> +	if (IS_ERR(nvmem))
> +		return PTR_ERR(nvmem);
> +
> +	platform_set_drvdata(pdev, efuse);
> +
> +	return 0;
> +}
> +
> +static int jz4780_efuse_remove(struct platform_device *pdev)
> +{
> +	struct jz4780_efuse *efuse =3D platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(efuse->clk);
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
> +	.remove  =3D jz4780_efuse_remove,
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

