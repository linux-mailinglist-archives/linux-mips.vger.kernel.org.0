Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43340161132
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 12:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgBQLgj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 06:36:39 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32829 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgBQLgi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Feb 2020 06:36:38 -0500
Received: by mail-wr1-f65.google.com with SMTP id u6so19344379wrt.0
        for <linux-mips@vger.kernel.org>; Mon, 17 Feb 2020 03:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=72MI3GiyxPjvpv3G+2OlwOS91R28pX2njBAR3t0C4Ng=;
        b=Oi+pwR3y+DHoifHtuvyRPfFMPoliChqgo0G7P6/wWX1c/xWOMB4m+LESfecbT6r1et
         850TGdR2Ee/JgMNkTvNjVfdOztk/5+gctJemx4E7VcdcWEztPTNj29uniwAWsztwIl+x
         zH4iJ9qo17LKRklgMHHZnRMD6YIamkcheld5tsYVlXzahk4iNcQ9Qf7QTgQQADCtr+eD
         RxT6g6PlfhiSS7o6io+dE95s2p/hQAxPpqlkrW14LZpyE6hyyrpUhW51204hNkDglgQ8
         3xVT2JZ3FyXt93H7n1Hr6tJ2qE3dZWOGqQ9Q5p/6Dq/OOg/DmbAeXCvUomM1aysfkx68
         65dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=72MI3GiyxPjvpv3G+2OlwOS91R28pX2njBAR3t0C4Ng=;
        b=fVy6tze65Ou0rJAH0B8zob1YkJszcSlvQGx97ObfQJLEjPuyv+7q51n97PMCiUNpyw
         phKYDrXOwOCJPBYD64KVlzkXcWyZ2xPUp1z1KMuCKAAwLdOTDrqNVJW+Vy4xX40AmqwJ
         yyZ35jBTEEed9TVgcIi3EeFICOCkaHHPn6eWx8B+vXgA0xDuqCILhzfmvfKomQu0n58t
         KHABAHlwpjm2K80dPLrSr/P4eNc+k5pViAws7ANqEqfWrPNUDRgFLnUrXZED6mapHGf7
         1Xd7s+SaX7EpSn8FdLDY60bunTCvcK55GHe0pBevq+ZZmrD35qPquNcdjGvIcfS4vijW
         fzuQ==
X-Gm-Message-State: APjAAAXEMOtky/NcDocoFyLs9FKkbvtftS4CLeKZnMy2v0a3/xoFJsZc
        4rceHbGzOUpr8NxRxnQApo4yGA==
X-Google-Smtp-Source: APXvYqxIYJjbN/FSJYH53p8e9ZTc5O4/wnBxYiU5HU0NRLGAshRcnKknxRkW5TQu44o4LkHOgq19yQ==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr21438827wrw.311.1581939395408;
        Mon, 17 Feb 2020 03:36:35 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id r1sm598056wrx.11.2020.02.17.03.36.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 03:36:34 -0800 (PST)
Subject: Re: [RFC v3 1/9] nvmem: add driver for JZ4780 efuse
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
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
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
References: <cover.1581880851.git.hns@goldelico.com>
 <40134efb901b83bb1b6bc64af0b312756459c31c.1581880851.git.hns@goldelico.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <49fa7c7a-59c2-688e-6c6d-cfdd8bc3fd32@linaro.org>
Date:   Mon, 17 Feb 2020 11:36:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <40134efb901b83bb1b6bc64af0b312756459c31c.1581880851.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 16/02/2020 19:20, H. Nikolaus Schaller wrote:
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> 
> This patch brings support for the JZ4780 efuse. Currently it only exposes
> a read only access to the entire 8K bits efuse memory and nvmem cells.
> 
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> (Signed-off-by: Paul Cercueil <paul@crapouillou.net>)
> ---
>   drivers/nvmem/Kconfig        |  10 ++
>   drivers/nvmem/Makefile       |   2 +
>   drivers/nvmem/jz4780-efuse.c | 249 +++++++++++++++++++++++++++++++++++
>   3 files changed, 261 insertions(+)
>   create mode 100644 drivers/nvmem/jz4780-efuse.c
> 

This patch along with 2/9 should be merged into single patch.
Also please make sure you run checkpatch.pl before sending!

> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 35efab1ba8d9..10f8e08f5e31 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -55,6 +55,16 @@ config NVMEM_IMX_OCOTP_SCU
>   	  This is a driver for the SCU On-Chip OTP Controller (OCOTP)
>   	  available on i.MX8 SoCs.
>   
> +config JZ4780_EFUSE
> +	tristate "JZ4780 EFUSE Memory Support"
> +	depends on MACH_JZ4780 || COMPILE_TEST

what is that this driver depends on MACH_JZ4780 board?


> +	depends on HAS_IOMEM
> +	help
> +	  Say Y here to include support for JZ4780 efuse memory found on
> +	  all JZ4780 SoC based devices.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called nvmem_jz4780_efuse.
> +
>   config NVMEM_LPC18XX_EEPROM
>   	tristate "NXP LPC18XX EEPROM Memory Support"
>   	depends on ARCH_LPC18XX || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 6b466cd1427b..65a268d17807 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -18,6 +18,8 @@ obj-$(CONFIG_NVMEM_IMX_OCOTP)	+= nvmem-imx-ocotp.o
>   nvmem-imx-ocotp-y		:= imx-ocotp.o
>   obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+= nvmem-imx-ocotp-scu.o
>   nvmem-imx-ocotp-scu-y		:= imx-ocotp-scu.o
> +obj-$(CONFIG_JZ4780_EFUSE)		+= nvmem_jz4780_efuse.o
> +nvmem_jz4780_efuse-y		:= jz4780-efuse.o
>   obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
>   nvmem_lpc18xx_eeprom-y	:= lpc18xx_eeprom.o
>   obj-$(CONFIG_NVMEM_LPC18XX_OTP)	+= nvmem_lpc18xx_otp.o
> diff --git a/drivers/nvmem/jz4780-efuse.c b/drivers/nvmem/jz4780-efuse.c
> new file mode 100644
> index 000000000000..ac03e1900ef9
> --- /dev/null
> +++ b/drivers/nvmem/jz4780-efuse.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * JZ4780 EFUSE Memory Support driver
> + *
> + * Copyright (c) 2017 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> + * Copyright (c) 2020 H. Nikolaus Schaller <hns@goldelico.com>
> + */
> +
> +/*
> + * Currently supports JZ4780 efuse which has 8K programmable bit.
> + * Efuse is separated into seven segments as below:
> + *
> + * -----------------------------------------------------------------------
> + * | 64 bit | 128 bit | 128 bit | 3520 bit | 8 bit | 2296 bit | 2048 bit |
> + * -----------------------------------------------------------------------
> + *
> + * The rom itself is accessed using a 9 bit address line and an 8 word wide bus
> + * which reads/writes based on strobes. The strobe is configured in the config
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
?? why do we need these two headers in this patch


> +
> +#define JZ_EFUCTRL			(0x0)	/* Control Register */
> +#define JZ_EFUCFG			(0x4)	/* Configure Register*/
> +#define JZ_EFUSTATE			(0x8)	/* Status Register */
> +#define JZ_EFUDATA(n)			(0xC + (n)*4)
> +
> +#define JZ_EFUSE_START_ADDR		0x200
> +
> +#define JZ_EFUSE_EFUCTRL_CS		BIT(30)
> +#define JZ_EFUSE_EFUCTRL_ADDR_MASK	0x1FF
> +#define JZ_EFUSE_EFUCTRL_ADDR_SHIFT	21
> +#define JZ_EFUSE_EFUCTRL_LEN_MASK	0x1F
> +#define JZ_EFUSE_EFUCTRL_LEN_SHIFT	16
> +#define JZ_EFUSE_EFUCTRL_PG_EN		BIT(15)
> +#define JZ_EFUSE_EFUCTRL_WR_EN		BIT(1)
> +#define JZ_EFUSE_EFUCTRL_RD_EN		BIT(0)
> +
> +#define JZ_EFUSE_EFUCFG_INT_EN		BIT(31)
> +#define JZ_EFUSE_EFUCFG_RD_ADJ_MASK	0xF

consider using GENMASK for these masks here.

> +#define JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT	20
> +#define JZ_EFUSE_EFUCFG_RD_STR_MASK	0xF
> +#define JZ_EFUSE_EFUCFG_RD_STR_SHIFT	16
> +#define JZ_EFUSE_EFUCFG_WR_ADJ_MASK	0xF
> +#define JZ_EFUSE_EFUCFG_WR_ADJ_SHIFT	12
> +#define JZ_EFUSE_EFUCFG_WR_STR_MASK	0xFFF
> +#define JZ_EFUSE_EFUCFG_WR_STR_SHIFT	0
> +
> +#define JZ_EFUSE_EFUSTATE_WR_DONE	BIT(1)
> +#define JZ_EFUSE_EFUSTATE_RD_DONE	BIT(0)
> +
> +struct jz4780_efuse {
> +	struct device *dev;
> +	void __iomem *iomem;
> +	struct clk *clk;
> +	unsigned int rd_adj;
> +	unsigned int rd_strobe;
> +};
> +
> +/* We read 32 byte chunks to avoid complexity in the driver. */
> +static int jz4780_efuse_read_32bytes(struct jz4780_efuse *efuse, char *buf,
> +		unsigned int addr)
> +{
> +	unsigned int tmp = 0;
> +	int i = 0;

unnecessary initialization of both variables.

> +	int timeout = 1000;
> +	int size = 32;

better to #define this STRIDE/CHUNK size. this driver seems to use this 
value in multiple places.

> +
> +	/* 1. Set config register */
> +	tmp = readl(efuse->iomem + JZ_EFUCFG);
> +	tmp &= ~((JZ_EFUSE_EFUCFG_RD_ADJ_MASK << JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT)
> +	| (JZ_EFUSE_EFUCFG_RD_STR_MASK << JZ_EFUSE_EFUCFG_RD_STR_SHIFT));
> +	tmp |= (efuse->rd_adj << JZ_EFUSE_EFUCFG_RD_ADJ_SHIFT)
> +	| (efuse->rd_strobe << JZ_EFUSE_EFUCFG_RD_STR_SHIFT);

very odd indenting.

> +	writel(tmp, efuse->iomem + JZ_EFUCFG);
> +
> +	/*
> +	 * 2. Set control register to indicate what to read data address,
> +	 * read data numbers and read enable.
> +	 */
> +	tmp = readl(efuse->iomem + JZ_EFUCTRL);
> +	tmp &= ~(JZ_EFUSE_EFUCFG_RD_STR_SHIFT
> +		| (JZ_EFUSE_EFUCTRL_ADDR_MASK << JZ_EFUSE_EFUCTRL_ADDR_SHIFT)
> +		| JZ_EFUSE_EFUCTRL_PG_EN | JZ_EFUSE_EFUCTRL_WR_EN
> +		| JZ_EFUSE_EFUCTRL_WR_EN);
> +
> +	/* Need to select CS bit if address accesses upper 4Kbits memory */
> +	if (addr >= (JZ_EFUSE_START_ADDR + 512))
> +		tmp |= JZ_EFUSE_EFUCTRL_CS;
> +
> +	tmp |= (addr << JZ_EFUSE_EFUCTRL_ADDR_SHIFT)
> +		| ((size - 1) << JZ_EFUSE_EFUCTRL_LEN_SHIFT)
> +		| JZ_EFUSE_EFUCTRL_RD_EN;
> +	writel(tmp, efuse->iomem + JZ_EFUCTRL);
> +
> +	/*
> +	 * 3. Wait status register RD_DONE set to 1 or EFUSE interrupted,
> +	 * software can read EFUSE data buffer 0 - 8 registers.
> +	 */
> +	do {
> +		tmp = readl(efuse->iomem + JZ_EFUSTATE);
> +		usleep_range(1000, 2000);
> +		if (timeout--)
> +			break;
> +	} while (!(tmp & JZ_EFUSE_EFUSTATE_RD_DONE));
> +
> +	if (timeout <= 0) {
> +		dev_err(efuse->dev, "Timed out while reading\n");
> +		return -EAGAIN;
> +	}
> +
> +	for (i = 0; i < (size / 4); i++)
> +		*((unsigned int *)(buf + i * 4))

make "unsigned int *buf32" a local variable and use it here, makes it 
much readable code.

> +			 = readl(efuse->iomem + JZ_EFUDATA(i));
> +
> +	return 0;
> +}
> +
> +/* main entry point */
> +static int jz4780_efuse_read(void *context, unsigned int offset,
> +					void *val, size_t bytes)
> +{
> +	struct jz4780_efuse *efuse = context;
> +	int ret;
> +
> +	while (bytes > 0) {
> +		unsigned int start = offset & ~(32 - 1);
> +		unsigned chunk = min(bytes, (start + 32 - offset));
> +
> +		if (start == offset && chunk == 32) {
> +			ret = jz4780_efuse_read_32bytes(efuse, val, start);
> +			if (ret < 0)
> +				return ret;
> +
> +		} else {
> +			char buf[32];
> +			ret = jz4780_efuse_read_32bytes(efuse, buf, start);
> +			if (ret < 0)
> +				return ret;
> +
> +			memcpy(val, &buf[offset - start], chunk);
> +		}
> +
> +		val += chunk;
> +		offset += chunk;
> +		bytes -= chunk;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct nvmem_config jz4780_efuse_nvmem_config = {
> +	.name = "jz4780-efuse",
> +	.read_only = true,

this value comes from device tree bindings, do we still need  to specify 
this here?


> +	.size = 1024,
> +	.word_size = 1,
> +	.stride = 1,
> +	.owner = THIS_MODULE,
> +	.reg_read = jz4780_efuse_read,
> +};
> +
> +static int jz4780_efuse_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_device *nvmem;
> +	struct jz4780_efuse *efuse;
> +	struct resource *res;
> +	unsigned long clk_rate;
> +	struct device *dev = &pdev->dev;
> +
> +	efuse = devm_kzalloc(&pdev->dev, sizeof(*efuse), GFP_KERNEL);
> +	if (!efuse)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	efuse->iomem = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	if (IS_ERR(efuse->iomem))
> +		return PTR_ERR(efuse->iomem);
> +
> +	efuse->clk = devm_clk_get(&pdev->dev, "bus_clk");
> +	if (IS_ERR(efuse->clk))
> +		return PTR_ERR(efuse->clk);

Who is enabling this clk?


> +
> +	clk_rate = clk_get_rate(efuse->clk);
> +	/*
> +	 * rd_adj and rd_strobe are 4 bit values
> +	 * bus clk period * (rd_adj + 1) > 6.5ns
> +	 * bus clk period * (rd_adj + 5 + rd_strobe) > 35ns
> +	 */
> +	efuse->rd_adj = (((6500 * (clk_rate / 1000000)) / 1000000) + 1) - 1;
> +	efuse->rd_strobe = ((((35000 * (clk_rate / 1000000)) / 1000000) + 1)
> +						- 5 - efuse->rd_adj);
> +
> +	if ((efuse->rd_adj > 0x1F) || (efuse->rd_strobe > 0x1F)) {
> +		dev_err(&pdev->dev, "Cannot set clock configuration\n");
> +		return -EINVAL;
> +	}
> +	efuse->dev = dev;
> +
> +	jz4780_efuse_nvmem_config.dev = &pdev->dev;
> +	jz4780_efuse_nvmem_config.priv = efuse;
> +
> +	nvmem = nvmem_register(&jz4780_efuse_nvmem_config);

devm variant here?


> +	if (IS_ERR(nvmem))
> +		return PTR_ERR(nvmem);
> +
> +	platform_set_drvdata(pdev, nvmem);
> +
> +	return 0;
> +}
> +
> +static int jz4780_efuse_remove(struct platform_device *pdev)
> +{
> +	struct nvmem_device *nvmem = platform_get_drvdata(pdev);
> +
> +	nvmem_unregister(nvmem);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id jz4780_efuse_match[] = {
> +	{ .compatible = "ingenic,jz4780-efuse" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, jz4780_efuse_match);
> +
> +static struct platform_driver jz4780_efuse_driver = {
> +	.probe  = jz4780_efuse_probe,
> +	.remove = jz4780_efuse_remove,
> +	.driver = {
> +		.name = "jz4780-efuse",
> +		.of_match_table = jz4780_efuse_match,
> +	},
> +};
> +module_platform_driver(jz4780_efuse_driver);
> +
> +MODULE_AUTHOR("PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>");
> +MODULE_AUTHOR("H. Nikolaus Schaller <hns@goldelico.com>");
> +MODULE_DESCRIPTION("Ingenic JZ4780 efuse driver");
> +MODULE_LICENSE("GPL v2");
> 
