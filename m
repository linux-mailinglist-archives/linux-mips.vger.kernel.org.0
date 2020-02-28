Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60E77173A74
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgB1O5J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 09:57:09 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.124]:13652 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgB1O5I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 09:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582901826;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=x5mMUKVlx5QdmvwKuZfy8T2Z9tPIRaER3TSdpvK9hg0=;
        b=sv4muXCnkswwqHdUD4LReln3ZoTHhHWqexS3S5ukDaYuXGRikHvIwQUl7vswtya/KK
        R4/sjMgSXVkVYIQuPPNVamvDPciGtxLvADU011wEjwFUuxslfHSm0dhJvE3Enhz8Wfj/
        ijUmcWKY6HG35c4DRG2z8B7Xl2FzdYYxhUYopPt/KU35D3Gqp7UVYpKeoxcJ3I5aTb7k
        ZyF4Oi+R8gxvxsB3Q2b/XqLZVsRamRNtHiiOSZoOG5qGvx3LdItEtJupQnwvH+2Wk+iG
        feX437bRjUrNvPuYEIQN8m5INKgUgpfKbpd7bRJCCM/DN263G3vrOVDL3Nfpjctq4+ZP
        fbAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaYXAcKqg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SEv11Nr
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 15:57:01 +0100 (CET)
Subject: Re: [PATCH v7 2/7] nvmem: add driver for JZ4780 efuse
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1582901323.3.4@crapouillou.net>
Date:   Fri, 28 Feb 2020 15:57:01 +0100
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <8722F126-2032-4AAF-BB99-82B3E9642818@goldelico.com>
References: <cover.1582898302.git.hns@goldelico.com> <8ee79144a3de6aba38323f283746545e466aa85d.1582898302.git.hns@goldelico.com> <1582901323.3.4@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.02.2020 um 15:48 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le ven., f=E9vr. 28, 2020 at 14:58, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> This patch brings support for the JZ4780 efuse. Currently it only =
exposes
>> a read only access to the entire 8K bits efuse memory and nvmem =
cells.
>> To fetch for example the MAC address:
>> dd if=3D/sys/devices/platform/134100d0.efuse/jz4780-efuse0/nvmem bs=3D1=
 skip=3D34 count=3D6 status=3Dnone | xxd
>> Tested-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: PrasannaKumar Muralidharan =
<prasannatsmkumar@gmail.com>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>> drivers/nvmem/Kconfig        |  12 ++
>> drivers/nvmem/Makefile       |   2 +
>> drivers/nvmem/jz4780-efuse.c | 234 =
+++++++++++++++++++++++++++++++++++
>> 3 files changed, 248 insertions(+)
>> create mode 100644 drivers/nvmem/jz4780-efuse.c
>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>> index 35efab1ba8d9..d7b7f6d688e7 100644
>> --- a/drivers/nvmem/Kconfig
>> +++ b/drivers/nvmem/Kconfig
>> @@ -55,6 +55,18 @@ config NVMEM_IMX_OCOTP_SCU
>> 	  This is a driver for the SCU On-Chip OTP Controller (OCOTP)
>> 	  available on i.MX8 SoCs.
>> +config JZ4780_EFUSE
>> +	tristate "JZ4780 EFUSE Memory Support"
>> +	depends on MACH_INGENIC || COMPILE_TEST
>> +	depends on HAS_IOMEM
>> +	depends on OF
>> +	select REGMAP_MMIO
>> +	help
>> +	  Say Y here to include support for JZ4780 efuse memory found on
>> +	  all JZ4780 SoC based devices.
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called nvmem_jz4780_efuse.
>> +
>> config NVMEM_LPC18XX_EEPROM
>> 	tristate "NXP LPC18XX EEPROM Memory Support"
>> 	depends on ARCH_LPC18XX || COMPILE_TEST
>> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
>> index 6b466cd1427b..65a268d17807 100644
>> --- a/drivers/nvmem/Makefile
>> +++ b/drivers/nvmem/Makefile
>> @@ -18,6 +18,8 @@ obj-$(CONFIG_NVMEM_IMX_OCOTP)	+=3D =
nvmem-imx-ocotp.o
>> nvmem-imx-ocotp-y		:=3D imx-ocotp.o
>> obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+=3D nvmem-imx-ocotp-scu.o
>> nvmem-imx-ocotp-scu-y		:=3D imx-ocotp-scu.o
>> +obj-$(CONFIG_JZ4780_EFUSE)		+=3D nvmem_jz4780_efuse.o
>> +nvmem_jz4780_efuse-y		:=3D jz4780-efuse.o
>> obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+=3D nvmem_lpc18xx_eeprom.o
>> nvmem_lpc18xx_eeprom-y	:=3D lpc18xx_eeprom.o
>> obj-$(CONFIG_NVMEM_LPC18XX_OTP)	+=3D nvmem_lpc18xx_otp.o
>> diff --git a/drivers/nvmem/jz4780-efuse.c =
b/drivers/nvmem/jz4780-efuse.c
>> new file mode 100644
>> index 000000000000..4e9dd340e33a
>> --- /dev/null
>> +++ b/drivers/nvmem/jz4780-efuse.c
>> @@ -0,0 +1,234 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * JZ4780 EFUSE Memory Support driver
>> + *
>> + * Copyright (c) 2017 PrasannaKumar Muralidharan =
<prasannatsmkumar@gmail.com>
>> + * Copyright (c) 2020 H. Nikolaus Schaller <hns@goldelico.com>
>> + */
>> +
>> +/*
>> + * Currently supports JZ4780 efuse which has 8K programmable bit.
>> + * Efuse is separated into seven segments as below:
>> + *
>> + * =
-----------------------------------------------------------------------
>> + * | 64 bit | 128 bit | 128 bit | 3520 bit | 8 bit | 2296 bit | 2048 =
bit |
>> + * =
-----------------------------------------------------------------------
>> + *
>> + * The rom itself is accessed using a 9 bit address line and an 8 =
word wide bus
>> + * which reads/writes based on strobes. The strobe is configured in =
the config
>> + * register and is based on number of cycles of the bus clock.
>> + *
>> + * Driver supports read only as the writes are done in the Factory.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/clk.h>
>> +#include <linux/module.h>
>> +#include <linux/nvmem-provider.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/timer.h>
>> +
>> +#define JZ_EFUCTRL		(0x0)	/* Control Register */
>> +#define JZ_EFUCFG		(0x4)	/* Configure Register*/
>> +#define JZ_EFUSTATE		(0x8)	/* Status Register */
>> +#define JZ_EFUDATA(n)		(0xC + (n) * 4)
>> +
>> +/* We read 32 byte chunks to avoid complexity in the driver. */
>> +#define JZ_EFU_READ_SIZE 32
>> +
>> +#define EFUCTRL_ADDR_MASK	0x3FF
>> +#define EFUCTRL_ADDR_SHIFT	21
>> +#define EFUCTRL_LEN_MASK	0x1F
>> +#define EFUCTRL_LEN_SHIFT	16
>> +#define EFUCTRL_PG_EN		BIT(15)
>> +#define EFUCTRL_WR_EN		BIT(1)
>> +#define EFUCTRL_RD_EN		BIT(0)
>> +
>> +#define EFUCFG_INT_EN		BIT(31)
>> +#define EFUCFG_RD_ADJ_MASK	0xF
>> +#define EFUCFG_RD_ADJ_SHIFT	20
>> +#define EFUCFG_RD_STR_MASK	0xF
>> +#define EFUCFG_RD_STR_SHIFT	16
>> +#define EFUCFG_WR_ADJ_MASK	0xF
>> +#define EFUCFG_WR_ADJ_SHIFT	12
>> +#define EFUCFG_WR_STR_MASK	0xFFF
>> +#define EFUCFG_WR_STR_SHIFT	0
>> +
>> +#define EFUSTATE_WR_DONE	BIT(1)
>> +#define EFUSTATE_RD_DONE	BIT(0)
>> +
>> +struct jz4780_efuse {
>> +	struct device *dev;
>> +	struct regmap *map;
>> +	struct clk *clk;
>> +};
>> +
>> +/* main entry point */
>> +static int jz4780_efuse_read(void *context, unsigned int offset,
>> +			     void *val, size_t bytes)
>> +{
>> +	struct jz4780_efuse *efuse =3D context;
>> +
>> +	while (bytes > 0) {
>> +		unsigned int start =3D offset & ~(JZ_EFU_READ_SIZE - 1);
>> +		unsigned int chunk =3D min(bytes, (start + =
JZ_EFU_READ_SIZE)
>> +					 - offset);
>> +		char buf[JZ_EFU_READ_SIZE];
>> +		unsigned int tmp;
>> +		u32 ctrl;
>> +		int ret;
>> +
>> +		ctrl =3D (start << EFUCTRL_ADDR_SHIFT)
>> +			| ((JZ_EFU_READ_SIZE - 1) << EFUCTRL_LEN_SHIFT)
>> +			| EFUCTRL_RD_EN;
>> +
>> +		regmap_update_bits(efuse->map, JZ_EFUCTRL,
>> +				   (EFUCTRL_ADDR_MASK << =
EFUCTRL_ADDR_SHIFT) |
>> +				   (EFUCTRL_LEN_MASK << =
EFUCTRL_LEN_SHIFT) |
>> +				   EFUCTRL_PG_EN | EFUCTRL_WR_EN |
>> +				   EFUCTRL_RD_EN,
>> +				   ctrl);
>> +
>> +		ret =3D regmap_read_poll_timeout(efuse->map, =
JZ_EFUSTATE,
>> +					       tmp, tmp & =
EFUSTATE_RD_DONE,
>> +					       1 * MSEC_PER_SEC,
>> +					       50 * MSEC_PER_SEC);
>> +		if (ret < 0) {
>> +			dev_err(efuse->dev, "Time out while reading =
efuse data");
>> +			return ret;
>> +		}
>> +
>> +		ret =3D regmap_bulk_read(efuse->map, JZ_EFUDATA(0),
>> +				       buf, JZ_EFU_READ_SIZE / =
sizeof(u32));
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		memcpy(val, &buf[offset - start], chunk);
>> +
>> +		val +=3D chunk;
>> +		offset +=3D chunk;
>> +		bytes -=3D chunk;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct nvmem_config jz4780_efuse_nvmem_config =3D {
>> +	.name =3D "jz4780-efuse",
>> +	.size =3D 1024,
>> +	.word_size =3D 1,
>> +	.stride =3D 1,
>> +	.owner =3D THIS_MODULE,
>> +	.reg_read =3D jz4780_efuse_read,
>> +};
>> +
>> +static const struct regmap_config jz4780_efuse_regmap_config =3D {
>> +	.reg_bits =3D 32,
>> +	.val_bits =3D 32,
>> +	.reg_stride =3D 4,
>> +	.max_register =3D JZ_EFUDATA(7),
>> +};
>> +
>> +static int jz4780_efuse_probe(struct platform_device *pdev)
>> +{
>> +	struct nvmem_device *nvmem;
>> +	struct jz4780_efuse *efuse;
>> +	struct nvmem_config cfg;
>> +	unsigned long clk_rate;
>> +	unsigned long rd_adj;
>> +	unsigned long rd_strobe;
>> +	struct device *dev =3D &pdev->dev;
>> +	void __iomem *regs;
>> +	int ret;
>> +
>> +	efuse =3D devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
>> +	if (!efuse)
>> +		return -ENOMEM;
>> +
>> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(regs))
>> +		return PTR_ERR(regs);
>> +
>> +	efuse->map =3D devm_regmap_init_mmio(dev, regs,
>> +					   &jz4780_efuse_regmap_config);
>> +	if (IS_ERR(efuse->map))
>> +		return PTR_ERR(efuse->map);
>> +
>> +	efuse->clk =3D devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(efuse->clk))
>> +		return PTR_ERR(efuse->clk);
>> +
>> +	ret =3D clk_prepare_enable(efuse->clk);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D devm_add_action_or_reset(&pdev->dev,
>> +				       &clk_disable_unprepare,
>> +				       efuse->clk);
>=20
> That's what I thought, this does not build:
>=20
> CC      drivers/nvmem/jz4780-efuse.o
> drivers/nvmem/jz4780-efuse.c: In function 'jz4780_efuse_probe':
> drivers/nvmem/jz4780-efuse.c:168:12: error: passing argument 2 of =
'devm_add_action_or_reset' from incompatible pointer type =
[-Werror=3Dincompatible-pointer-types]
> 168 |            &clk_disable_unprepare,
>     |            ^~~~~~~~~~~~~~~~~~~~~~
>     |            |
>     |            void (*)(struct clk *)
> In file included from ./include/linux/platform_device.h:13,
>                from drivers/nvmem/jz4780-efuse.c:29:
> ./include/linux/device.h:256:16: note: expected 'void (*)(void *)' but =
argument is of type 'void (*)(struct clk *)'
> 256 |         void (*action)(void *), void *data)
>     |         ~~~~~~~^~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:268: =
drivers/nvmem/jz4780-efuse.o] Error 1
> make[1]: *** [scripts/Makefile.build:505: drivers/nvmem] Error 2
> make: *** [Makefile:1681: drivers] Error 2
>=20
>=20
> You need a local function of type 'void foo(void *data)' that just =
calls clk_disable_unprepare(data) and the compiler will be happy.
> (btw - no need to deference functions pointers, since they are already =
pointers)

Well, this asks for a devm_clk_enable_prepare but it was apparently =
rejected...

https://lore.kernel.org/patchwork/patch/755667/

>=20
> With that said, I expect you to at least compile-test the patchset =
before sending it upstream...

I have compiled and tested it on real hardware. But missed the warning =
because my cross-compiler seems to emit a warning only.

Sorry, I don't have a good day and after 7 rounds one wants to get =
things through the door and with least effort as quick as possible :)

BR,
Nikolaus

