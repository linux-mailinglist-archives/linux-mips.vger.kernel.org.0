Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE338161509
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 15:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbgBQOs6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 09:48:58 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:50978 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbgBQOs6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 09:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581950934; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eoNNgWgo3WVNHG7xoWPh0LFHIvV7GrZkBj3FxGNgdHI=;
        b=MsEvO0IrW8TmNL4hGafMj/GBY++D8feTaN8CSGX68JcJNM6mCOumhaWPp5JSqHJg/89V/X
        i+ZwQcLcuIEbuJpMmxE1dBA3nEpG9O5HgDepw88ThWOTSrZCo3oQDr2CpLHIeerwhMJoke
        wo1UZNaADp7A/H/5wQJhmlXlzy1wAaI=
Date:   Mon, 17 Feb 2020 11:48:31 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v3 1/9] nvmem: add driver for JZ4780 efuse
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Mathieu Malaterre <malat@debian.org>,
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Message-Id: <1581950911.3.3@crapouillou.net>
In-Reply-To: <34C46ABD-29A1-4E23-9045-6B9D4BF9141A@goldelico.com>
References: <cover.1581880851.git.hns@goldelico.com>
        <40134efb901b83bb1b6bc64af0b312756459c31c.1581880851.git.hns@goldelico.com>
        <49fa7c7a-59c2-688e-6c6d-cfdd8bc3fd32@linaro.org>
        <34C46ABD-29A1-4E23-9045-6B9D4BF9141A@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le lun., f=E9vr. 17, 2020 at 13:26, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Srinivas Kandagatla,
>=20
>>  Am 17.02.2020 um 12:36 schrieb Srinivas Kandagatla=20
>> <srinivas.kandagatla@linaro.org>:
>>=20
>>=20
>>=20
>>  On 16/02/2020 19:20, H. Nikolaus Schaller wrote:
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
>>>  (Signed-off-by: Paul Cercueil <paul@crapouillou.net>)
>=20
> @Paul: may I assume your signed off after squashing the patch 2/9?

Yes. As the Ingenic SoCs maintainer I'll still need to review though.

>=20
>>>  ---
>>>   drivers/nvmem/Kconfig        |  10 ++
>>>   drivers/nvmem/Makefile       |   2 +
>>>   drivers/nvmem/jz4780-efuse.c | 249=20
>>> +++++++++++++++++++++++++++++++++++
>>>   3 files changed, 261 insertions(+)
>>>   create mode 100644 drivers/nvmem/jz4780-efuse.c
>>=20
>>  This patch along with 2/9 should be merged into single patch.
>>  Also please make sure you run checkpatch.pl before sending!
>=20
> Sure. I had noted that in the [0/9].
>=20
>>=20
>>>  diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>>>  index 35efab1ba8d9..10f8e08f5e31 100644
>>>  --- a/drivers/nvmem/Kconfig
>>>  +++ b/drivers/nvmem/Kconfig
>>>  @@ -55,6 +55,16 @@ config NVMEM_IMX_OCOTP_SCU
>>>   	  This is a driver for the SCU On-Chip OTP Controller (OCOTP)
>>>   	  available on i.MX8 SoCs.
>>>   +config JZ4780_EFUSE
>>>  +	tristate "JZ4780 EFUSE Memory Support"
>>>  +	depends on MACH_JZ4780 || COMPILE_TEST
>>=20
>>  what is that this driver depends on MACH_JZ4780 board?
>=20
> Hm. Good question. Well, it is only useful for the jz4780 SoC
> but since we match drivers through DTS there is probably no reason
> to make it depend on. And depend on COMPILE_TEST is also not
> needed if I understand correctly.
>=20
> On the other hand this makes the option disappear for non-jz4780 SoC.
>=20
> So I leave it for the moment but keep in mind.

Make it MACH_INGENIC || COMPILE_TEST.

* You want COMPILE_TEST so that the driver can be compile-tested. It=20
should always be there unless the driver really isn't buildable if=20
MACH_JZ4780 is not set.
* If you depend on MACH_JZ4780, then you cannot create a kernel that=20
will work on anything else than a JZ4780. Depend on MACH_INGENIC=20
instead.

>=20
>>=20
>>=20
>>>  +	depends on HAS_IOMEM
>>>  +	help
>>>  +	  Say Y here to include support for JZ4780 efuse memory found on
>>>  +	  all JZ4780 SoC based devices.
>>>  +	  To compile this driver as a module, choose M here: the module
>>>  +	  will be called nvmem_jz4780_efuse.
>>>  +
>>>   config NVMEM_LPC18XX_EEPROM
>>>   	tristate "NXP LPC18XX EEPROM Memory Support"
>>>   	depends on ARCH_LPC18XX || COMPILE_TEST
>>>  diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
>>>  index 6b466cd1427b..65a268d17807 100644
>>>  --- a/drivers/nvmem/Makefile
>>>  +++ b/drivers/nvmem/Makefile
>>>  @@ -18,6 +18,8 @@ obj-$(CONFIG_NVMEM_IMX_OCOTP)	+=3D=20
>>> nvmem-imx-ocotp.o
>>>   nvmem-imx-ocotp-y		:=3D imx-ocotp.o
>>>   obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+=3D nvmem-imx-ocotp-scu.o
>>>   nvmem-imx-ocotp-scu-y		:=3D imx-ocotp-scu.o
>>>  +obj-$(CONFIG_JZ4780_EFUSE)		+=3D nvmem_jz4780_efuse.o
>>>  +nvmem_jz4780_efuse-y		:=3D jz4780-efuse.o
>>>   obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+=3D nvmem_lpc18xx_eeprom.o
>>>   nvmem_lpc18xx_eeprom-y	:=3D lpc18xx_eeprom.o
>>>   obj-$(CONFIG_NVMEM_LPC18XX_OTP)	+=3D nvmem_lpc18xx_otp.o
>>>  diff --git a/drivers/nvmem/jz4780-efuse.c=20
>>> b/drivers/nvmem/jz4780-efuse.c
>>>  new file mode 100644
>>>  index 000000000000..ac03e1900ef9
>>>  --- /dev/null
>>>  +++ b/drivers/nvmem/jz4780-efuse.c
>>>  @@ -0,0 +1,249 @@
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
>>=20
>>=20
>>>  +#include <linux/regmap.h>
>>>  +#include <linux/timer.h>
>>  ?? why do we need these two headers in this patch
>=20
> regmap will be used after squashing 2/9.
>=20
>>=20
>>=20
>>>  +
>>>  +#define JZ_EFUCTRL			(0x0)	/* Control Register */
>>>  +#define JZ_EFUCFG			(0x4)	/* Configure Register*/
>>>  +#define JZ_EFUSTATE			(0x8)	/* Status Register */
>>>  +#define JZ_EFUDATA(n)			(0xC + (n)*4)
>>>  +
>>>  +#define JZ_EFUSE_START_ADDR		0x200
>>>  +
>>>  +#define JZ_EFUSE_EFUCTRL_CS		BIT(30)
>>>  +#define JZ_EFUSE_EFUCTRL_ADDR_MASK	0x1FF
>>>  +#define JZ_EFUSE_EFUCTRL_ADDR_SHIFT	21
>>>  +#define JZ_EFUSE_EFUCTRL_LEN_MASK	0x1F
>>>  +#define JZ_EFUSE_EFUCTRL_LEN_SHIFT	16
>>>  +#define JZ_EFUSE_EFUCTRL_PG_EN		BIT(15)
>>>  +#define JZ_EFUSE_EFUCTRL_WR_EN		BIT(1)
>>>  +#define JZ_EFUSE_EFUCTRL_RD_EN		BIT(0)
>>>  +
>>>  +#define JZ_EFUSE_EFUCFG_INT_EN		BIT(31)
>>>  +#define JZ_EFUSE_EFUCFG_RD_ADJ_MASK	0xF
>>=20
>>  consider using GENMASK for these masks here.
>>=20
>>>  +#define JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT	20
>>>  +#define JZ_EFUSE_EFUCFG_RD_STR_MASK	0xF
>>>  +#define JZ_EFUSE_EFUCFG_RD_STR_SHIFT	16
>>>  +#define JZ_EFUSE_EFUCFG_WR_ADJ_MASK	0xF
>>>  +#define JZ_EFUSE_EFUCFG_WR_ADJ_SHIFT	12
>>>  +#define JZ_EFUSE_EFUCFG_WR_STR_MASK	0xFFF
>>>  +#define JZ_EFUSE_EFUCFG_WR_STR_SHIFT	0
>>>  +
>>>  +#define JZ_EFUSE_EFUSTATE_WR_DONE	BIT(1)
>>>  +#define JZ_EFUSE_EFUSTATE_RD_DONE	BIT(0)
>>>  +
>>>  +struct jz4780_efuse {
>>>  +	struct device *dev;
>>>  +	void __iomem *iomem;
>>>  +	struct clk *clk;
>>>  +	unsigned int rd_adj;
>>>  +	unsigned int rd_strobe;
>>>  +};
>>>  +
>>>  +/* We read 32 byte chunks to avoid complexity in the driver. */
>>>  +static int jz4780_efuse_read_32bytes(struct jz4780_efuse *efuse,=20
>>> char *buf,
>>>  +		unsigned int addr)
>>>  +{
>>>  +	unsigned int tmp =3D 0;
>>>  +	int i =3D 0;
>>=20
>>  unnecessary initialization of both variables.
>>=20
>>>  +	int timeout =3D 1000;
>>>  +	int size =3D 32;
>>=20
>>  better to #define this STRIDE/CHUNK size. this driver seems to use=20
>> this value in multiple places.
>>=20
>>>  +
>>>  +	/* 1. Set config register */
>>>  +	tmp =3D readl(efuse->iomem + JZ_EFUCFG);
>>>  +	tmp &=3D ~((JZ_EFUSE_EFUCFG_RD_ADJ_MASK <<=20
>>> JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT)
>>>  +	| (JZ_EFUSE_EFUCFG_RD_STR_MASK << JZ_EFUSE_EFUCFG_RD_STR_SHIFT));
>>>  +	tmp |=3D (efuse->rd_adj << JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT)
>>>  +	| (efuse->rd_strobe << JZ_EFUSE_EFUCFG_RD_STR_SHIFT);
>>=20
>>  very odd indenting.
>=20
> Will be replaced by 2/9.
>=20
> Sorry for having you review this old version which is replaced by 2/9.
>=20
> But it appeared more helpful to keep this as the 2018 original and=20
> then update
> in a separate patch for this RFC stage.
>=20
>>=20
>>>  +	writel(tmp, efuse->iomem + JZ_EFUCFG);
>>>  +
>>>  +	/*
>>>  +	 * 2. Set control register to indicate what to read data address,
>>>  +	 * read data numbers and read enable.
>>>  +	 */
>>>  +	tmp =3D readl(efuse->iomem + JZ_EFUCTRL);
>>>  +	tmp &=3D ~(JZ_EFUSE_EFUCFG_RD_STR_SHIFT
>>>  +		| (JZ_EFUSE_EFUCTRL_ADDR_MASK << JZ_EFUSE_EFUCTRL_ADDR_SHIFT)
>>>  +		| JZ_EFUSE_EFUCTRL_PG_EN | JZ_EFUSE_EFUCTRL_WR_EN
>>>  +		| JZ_EFUSE_EFUCTRL_WR_EN);
>>>  +
>>>  +	/* Need to select CS bit if address accesses upper 4Kbits memory=20
>>> */
>>>  +	if (addr >=3D (JZ_EFUSE_START_ADDR + 512))
>>>  +		tmp |=3D JZ_EFUSE_EFUCTRL_CS;
>>>  +
>>>  +	tmp |=3D (addr << JZ_EFUSE_EFUCTRL_ADDR_SHIFT)
>>>  +		| ((size - 1) << JZ_EFUSE_EFUCTRL_LEN_SHIFT)
>>>  +		| JZ_EFUSE_EFUCTRL_RD_EN;
>>>  +	writel(tmp, efuse->iomem + JZ_EFUCTRL);
>>>  +
>>>  +	/*
>>>  +	 * 3. Wait status register RD_DONE set to 1 or EFUSE interrupted,
>>>  +	 * software can read EFUSE data buffer 0 - 8 registers.
>>>  +	 */
>>>  +	do {
>>>  +		tmp =3D readl(efuse->iomem + JZ_EFUSTATE);
>>>  +		usleep_range(1000, 2000);
>>>  +		if (timeout--)
>>>  +			break;
>>>  +	} while (!(tmp & JZ_EFUSE_EFUSTATE_RD_DONE));
>>>  +
>>>  +	if (timeout <=3D 0) {
>>>  +		dev_err(efuse->dev, "Timed out while reading\n");
>>>  +		return -EAGAIN;
>>>  +	}
>>>  +
>>>  +	for (i =3D 0; i < (size / 4); i++)
>>>  +		*((unsigned int *)(buf + i * 4))
>>=20
>>  make "unsigned int *buf32" a local variable and use it here, makes=20
>> it much readable code.
>>=20
>>>  +			 =3D readl(efuse->iomem + JZ_EFUDATA(i));
>>>  +
>>>  +	return 0;
>>>  +}
>>>  +
>>>  +/* main entry point */
>>>  +static int jz4780_efuse_read(void *context, unsigned int offset,
>>>  +					void *val, size_t bytes)
>>>  +{
>>>  +	struct jz4780_efuse *efuse =3D context;
>>>  +	int ret;
>>>  +
>>>  +	while (bytes > 0) {
>>>  +		unsigned int start =3D offset & ~(32 - 1);
>>>  +		unsigned chunk =3D min(bytes, (start + 32 - offset));
>>>  +
>>>  +		if (start =3D=3D offset && chunk =3D=3D 32) {
>>>  +			ret =3D jz4780_efuse_read_32bytes(efuse, val, start);
>>>  +			if (ret < 0)
>>>  +				return ret;
>>>  +
>>>  +		} else {
>>>  +			char buf[32];
>>>  +			ret =3D jz4780_efuse_read_32bytes(efuse, buf, start);
>>>  +			if (ret < 0)
>>>  +				return ret;
>>>  +
>>>  +			memcpy(val, &buf[offset - start], chunk);
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
>>>  +static struct nvmem_config jz4780_efuse_nvmem_config =3D {
>>>  +	.name =3D "jz4780-efuse",
>>>  +	.read_only =3D true,
>>=20
>>  this value comes from device tree bindings, do we still need  to=20
>> specify this here?
>=20
> Ok, have to check what is automatically taken from DT.
>=20
>>=20
>>=20
>>>  +	.size =3D 1024,
>>>  +	.word_size =3D 1,
>>>  +	.stride =3D 1,
>>>  +	.owner =3D THIS_MODULE,
>>>  +	.reg_read =3D jz4780_efuse_read,
>>>  +};
>>>  +
>>>  +static int jz4780_efuse_probe(struct platform_device *pdev)
>>>  +{
>>>  +	struct nvmem_device *nvmem;
>>>  +	struct jz4780_efuse *efuse;
>>>  +	struct resource *res;
>>>  +	unsigned long clk_rate;
>>>  +	struct device *dev =3D &pdev->dev;
>>>  +
>>>  +	efuse =3D devm_kzalloc(&pdev->dev, sizeof(*efuse), GFP_KERNEL);
>>>  +	if (!efuse)
>>>  +		return -ENOMEM;
>>>  +
>>>  +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>  +	efuse->iomem =3D devm_ioremap(&pdev->dev, res->start,=20
>>> resource_size(res));
>>>  +	if (IS_ERR(efuse->iomem))
>>>  +		return PTR_ERR(efuse->iomem);
>>>  +
>>>  +	efuse->clk =3D devm_clk_get(&pdev->dev, "bus_clk");
>>>  +	if (IS_ERR(efuse->clk))
>>>  +		return PTR_ERR(efuse->clk);
>>=20
>>  Who is enabling this clk?
>>=20
>>=20
>>>  +
>>>  +	clk_rate =3D clk_get_rate(efuse->clk);
>>>  +	/*
>>>  +	 * rd_adj and rd_strobe are 4 bit values
>>>  +	 * bus clk period * (rd_adj + 1) > 6.5ns
>>>  +	 * bus clk period * (rd_adj + 5 + rd_strobe) > 35ns
>>>  +	 */
>>>  +	efuse->rd_adj =3D (((6500 * (clk_rate / 1000000)) / 1000000) + 1)=20
>>> - 1;
>>>  +	efuse->rd_strobe =3D ((((35000 * (clk_rate / 1000000)) / 1000000)=20
>>> + 1)
>>>  +						- 5 - efuse->rd_adj);
>>>  +
>>>  +	if ((efuse->rd_adj > 0x1F) || (efuse->rd_strobe > 0x1F)) {
>>>  +		dev_err(&pdev->dev, "Cannot set clock configuration\n");
>>>  +		return -EINVAL;
>>>  +	}
>>>  +	efuse->dev =3D dev;
>>>  +
>>>  +	jz4780_efuse_nvmem_config.dev =3D &pdev->dev;
>>>  +	jz4780_efuse_nvmem_config.priv =3D efuse;
>>>  +
>>>  +	nvmem =3D nvmem_register(&jz4780_efuse_nvmem_config);
>>=20
>>  devm variant here?
>=20
> Good idea! I didn't know that it exists. Allows us to remove
> jz4780_efuse_remove() below.
>=20
>>=20
>>=20
>>>  +	if (IS_ERR(nvmem))
>>>  +		return PTR_ERR(nvmem);
>>>  +
>>>  +	platform_set_drvdata(pdev, nvmem);
>>>  +
>>>  +	return 0;
>>>  +}
>>>  +
>>>  +static int jz4780_efuse_remove(struct platform_device *pdev)
>>>  +{
>>>  +	struct nvmem_device *nvmem =3D platform_get_drvdata(pdev);
>>>  +
>>>  +	nvmem_unregister(nvmem);
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
>>>  +	.remove =3D jz4780_efuse_remove,
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
>>>  +MODULE_DESCRIPTION("Ingenic JZ4780 efuse driver");
>>>  +MODULE_LICENSE("GPL v2");
>=20
> BR and thanks,
> Nikolaus Schaller
>=20
>=20

=

