Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA0756A3E
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2019 15:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfFZNS4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Jun 2019 09:18:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43535 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbfFZNS4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Jun 2019 09:18:56 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so2688083wru.10
        for <linux-mips@vger.kernel.org>; Wed, 26 Jun 2019 06:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=oABEezfN1nTsjGlHAHlBaTiMmQz4aDhMSWiIeYwjCbc=;
        b=BDIZmNOapw0wdnKowhcOVanLGYEGq8PTEJMCMEAi5Gmar5Q38mp+SuSWavLqPxHywy
         8DjOMgEcMNmJvYylzQIUqfY4ha2dJx7Ev26rvPoEUOaiZNdQvNOnjo3tPjcYd4E7gDQ1
         EB4e4f9LPZmMjeUtItGOQkI3h91OQPmAGV9v11aozKdHUDLTlDI1lkMS1W/9SXm1zbGa
         NU7pNwWbw9oJ356oHDNn5sofavNR7JNLfjx67l4zDyhIBvE1Q3IJ+ybOwMl3OXASi9s8
         9fBT+RBMD2WUvIG7gK6kpKE5AM/Fk56Bu3K0qZ/SrFStlDCHxNVvg2TTEZHxsqc6aKyR
         Fr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=oABEezfN1nTsjGlHAHlBaTiMmQz4aDhMSWiIeYwjCbc=;
        b=p+0B1eaEg5/mjCcPhPpDcvA5j/vcDR9aE9lFnwm5W4Mrho7OVMAmcDfCMXh3GoLeer
         m/cGMI/sEmW3e300U6DBX+PlWPtf7I4puUdXOw/GJcyaSdSyTb6RxRmL86mEb3Dza2kU
         McgcvHPGn5ZgbkkQ0RclLbc8HnQvsWVUdGGaX6XFUABxF/0dANqGDNCioRU9DWLoLoHs
         sFcYB8taHLsrCCkkRTAzGwhAoR6323bHJUDxagO97s54fF9vf1jYlvW/jvQHqEYOJc6H
         CwEnQFpjPm/zhodg4jWfH8pFVSINCD3m78PBBT9UJiUdIY39ly5tWCs6+6zsQ87sJ84c
         YhQA==
X-Gm-Message-State: APjAAAUyme+0fN2fTfIxQ5mWGxfaCBL++Luc4qZbxBr0y2D4KleVzb9a
        wbOYniZjhMgNNm9A/7FJQvEwxw==
X-Google-Smtp-Source: APXvYqxeT+oP2oju/Ny+91153pq74b2segQ2icEC+8amXSZq3egEC6TwFkM8vrRk+uofNHXcuWkhBQ==
X-Received: by 2002:a5d:61cd:: with SMTP id q13mr3741341wrv.114.1561555133168;
        Wed, 26 Jun 2019 06:18:53 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id z5sm15058643wrh.16.2019.06.26.06.18.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 06:18:52 -0700 (PDT)
Date:   Wed, 26 Jun 2019 14:18:50 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
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
Subject: Re: [PATCH v12 04/13] mfd: Add Ingenic TCU driver
Message-ID: <20190626131850.GW21119@dell>
References: <20190521145141.9813-1-paul@crapouillou.net>
 <20190521145141.9813-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190521145141.9813-5-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 21 May 2019, Paul Cercueil wrote:

> This driver will provide a regmap that can be retrieved very early in
> the boot process through the API function ingenic_tcu_get_regmap().
> 
> Additionally, it will call devm_of_platform_populate() so that all the
> children devices will be probed.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v12: New patch
> 
>  drivers/mfd/Kconfig             |   8 +++
>  drivers/mfd/Makefile            |   1 +
>  drivers/mfd/ingenic-tcu.c       | 113 ++++++++++++++++++++++++++++++++
>  include/linux/mfd/ingenic-tcu.h |   8 +++
>  4 files changed, 130 insertions(+)
>  create mode 100644 drivers/mfd/ingenic-tcu.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 294d9567cc71..a13544474e05 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -494,6 +494,14 @@ config HTC_I2CPLD
>  	  This device provides input and output GPIOs through an I2C
>  	  interface to one or more sub-chips.
>  
> +config INGENIC_TCU
> +	bool "Ingenic Timer/Counter Unit (TCU) support"
> +	depends on MIPS || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  Say yes here to support the Timer/Counter Unit (TCU) IP present
> +	  in the JZ47xx SoCs from Ingenic.
> +
>  config MFD_INTEL_QUARK_I2C_GPIO
>  	tristate "Intel Quark MFD I2C GPIO"
>  	depends on PCI
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 52b1a90ff515..fb89e131ae98 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -180,6 +180,7 @@ obj-$(CONFIG_AB8500_CORE)	+= ab8500-core.o ab8500-sysctrl.o
>  obj-$(CONFIG_MFD_TIMBERDALE)    += timberdale.o
>  obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
>  obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
> +obj-$(CONFIG_INGENIC_TCU)	+= ingenic-tcu.o
>  obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
>  obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
>  obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
> diff --git a/drivers/mfd/ingenic-tcu.c b/drivers/mfd/ingenic-tcu.c
> new file mode 100644
> index 000000000000..6c1d5e4310c1
> --- /dev/null
> +++ b/drivers/mfd/ingenic-tcu.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ47xx SoCs TCU MFD driver

Nit: Another line here please.

> + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
> + */
> +
> +#include <linux/mfd/ingenic-tcu.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +struct ingenic_soc_info {
> +	unsigned int num_channels;
> +};
> +
> +static struct regmap *tcu_regmap __initdata;
> +
> +static const struct regmap_config ingenic_tcu_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = TCU_REG_OST_CNTHBUF,
> +};
> +
> +static const struct ingenic_soc_info jz4740_soc_info = {
> +	.num_channels = 8,
> +};
> +
> +static const struct ingenic_soc_info jz4725b_soc_info = {
> +	.num_channels = 6,
> +};
> +
> +static const struct of_device_id ingenic_tcu_of_match[] = {
> +	{ .compatible = "ingenic,jz4740-tcu", .data = &jz4740_soc_info, },
> +	{ .compatible = "ingenic,jz4725b-tcu", .data = &jz4725b_soc_info, },
> +	{ .compatible = "ingenic,jz4770-tcu", .data = &jz4740_soc_info, },
> +	{ }
> +};
> +
> +static struct regmap * __init ingenic_tcu_create_regmap(struct device_node *np)
> +{
> +	struct resource res;
> +	void __iomem *base;
> +	struct regmap *map;
> +
> +	if (!of_match_node(ingenic_tcu_of_match, np))
> +		return ERR_PTR(-EINVAL);
> +
> +	base = of_io_request_and_map(np, 0, "TCU");
> +	if (IS_ERR(base))
> +		return ERR_PTR(PTR_ERR(base));
> +
> +	map = regmap_init_mmio(NULL, base, &ingenic_tcu_regmap_config);
> +	if (IS_ERR(map))
> +		goto err_iounmap;
> +
> +	return map;
> +
> +err_iounmap:
> +	iounmap(base);
> +	of_address_to_resource(np, 0, &res);
> +	release_mem_region(res.start, resource_size(&res));
> +
> +	return map;
> +}

Why does this need to be set-up earlier than probe()?

> +static int __init ingenic_tcu_probe(struct platform_device *pdev)
> +{
> +	struct regmap *map = ingenic_tcu_get_regmap(pdev->dev.of_node);
> +
> +	platform_set_drvdata(pdev, map);
> +
> +	regmap_attach_dev(&pdev->dev, map, &ingenic_tcu_regmap_config);
> +
> +	return devm_of_platform_populate(&pdev->dev);
> +}
> +
> +static struct platform_driver ingenic_tcu_driver = {
> +	.driver = {
> +		.name = "ingenic-tcu",
> +		.of_match_table = ingenic_tcu_of_match,
> +	},
> +};
> +
> +static int __init ingenic_tcu_platform_init(void)
> +{
> +	return platform_driver_probe(&ingenic_tcu_driver,
> +				     ingenic_tcu_probe);

What?  Why?

> +}
> +subsys_initcall(ingenic_tcu_platform_init);
> +
> +struct regmap * __init ingenic_tcu_get_regmap(struct device_node *np)
> +{
> +	if (!tcu_regmap)
> +		tcu_regmap = ingenic_tcu_create_regmap(np);
> +
> +	return tcu_regmap;
> +}

This makes me pretty uncomfortable.

What calls it?

> +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned int channel)
> +{
> +	const struct ingenic_soc_info *soc = device_get_match_data(dev->parent);
> +
> +	/* Enable all TCU channels for PWM use by default except channels 0/1 */
> +	u32 pwm_channels_mask = GENMASK(soc->num_channels - 1, 2);
> +
> +	device_property_read_u32(dev->parent, "ingenic,pwm-channels-mask",
> +				 &pwm_channels_mask);
> +
> +	return !!(pwm_channels_mask & BIT(channel));
> +}
> +EXPORT_SYMBOL_GPL(ingenic_tcu_pwm_can_use_chn);
> diff --git a/include/linux/mfd/ingenic-tcu.h b/include/linux/mfd/ingenic-tcu.h
> index 2083fa20821d..21df23916cd2 100644
> --- a/include/linux/mfd/ingenic-tcu.h
> +++ b/include/linux/mfd/ingenic-tcu.h
> @@ -6,6 +6,11 @@
>  #define __LINUX_MFD_INGENIC_TCU_H_
>  
>  #include <linux/bitops.h>
> +#include <linux/init.h>
> +
> +struct device;
> +struct device_node;
> +struct regmap;
>  
>  #define TCU_REG_WDT_TDR		0x00
>  #define TCU_REG_WDT_TCER	0x04
> @@ -53,4 +58,7 @@
>  #define TCU_REG_TCNTc(c)	(TCU_REG_TCNT0 + ((c) * TCU_CHANNEL_STRIDE))
>  #define TCU_REG_TCSRc(c)	(TCU_REG_TCSR0 + ((c) * TCU_CHANNEL_STRIDE))
>  
> +struct regmap * __init ingenic_tcu_get_regmap(struct device_node *np);
> +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned int channel);
> +
>  #endif /* __LINUX_MFD_INGENIC_TCU_H_ */

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
