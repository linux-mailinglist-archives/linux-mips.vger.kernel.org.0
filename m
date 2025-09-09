Return-Path: <linux-mips+bounces-11142-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C64B4A88F
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6011C1B24C76
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A60230CDA7;
	Tue,  9 Sep 2025 09:40:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC10309DC4;
	Tue,  9 Sep 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410809; cv=none; b=fpwj3m87SArCokiRrT/DtpBMHvufX7JhaTj0gY9GqF2Jm76jsRKfgQf06m2GbYumIJeTmWKAGEOte7o50uvoXSHQHyV41jCZ8K5noQ4X5lj7WbpP1/d1xi8EkXZ1EsN44IFOaWKjLD6gJhr6uxoNVx0MGsswZ6eRAhJp3+7F9vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410809; c=relaxed/simple;
	bh=1BLxtqNy/iOf9XPghIOmJi8qyxLBt+poztV5tfMoCPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFTR7LtbRZM5fiK7k6P12iwOyBtms1SDVW9YAkwvKN8eE+ql0oCQ1wBVg/fe2EQViU3ZNm848O9rWD9bu/+fbUM1yNrjU2t7oxDl3TXea7dc8bVeq26Jq2rPT4soaoz0yEzIcg1cyCQWR6+ZCvDcEIqnSCbOrTs7jdIFIdkuHMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DECA3340EC3;
	Tue, 09 Sep 2025 09:40:03 +0000 (UTC)
Date: Tue, 9 Sep 2025 17:39:58 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 12/15] gpio: spacemit-k1: use new generic GPIO chip API
Message-ID: <20250909093958-GYA1207638@gentoo.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-12-9f723dc3524a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-12-9f723dc3524a@linaro.org>


On 11:15 Tue 09 Sep     , Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Thanks for converting this

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
>  drivers/gpio/gpio-spacemit-k1.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> index 3cc75c701ec40194e602b80d3f96f23204ce3b4d..9e57f43d3d13ad28fcd3327ecdc3f359691a44c9 100644
> --- a/drivers/gpio/gpio-spacemit-k1.c
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -38,7 +39,7 @@
>  struct spacemit_gpio;
>  
>  struct spacemit_gpio_bank {
> -	struct gpio_chip gc;
> +	struct gpio_generic_chip chip;
>  	struct spacemit_gpio *sg;
>  	void __iomem *base;
>  	u32 irq_mask;
> @@ -72,7 +73,7 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
>  		return IRQ_NONE;
>  
>  	for_each_set_bit(n, &pending, BITS_PER_LONG)
> -		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
> +		handle_nested_irq(irq_find_mapping(gb->chip.gc.irq.domain, n));
>  
>  	return IRQ_HANDLED;
>  }
> @@ -143,7 +144,7 @@ static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file
>  {
>  	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
>  
> -	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), spacemit_gpio_bank_index(gb));
> +	seq_printf(p, "%s-%d", dev_name(gb->chip.gc.parent), spacemit_gpio_bank_index(gb));
>  }
>  
>  static struct irq_chip spacemit_gpio_chip = {
> @@ -165,7 +166,7 @@ static bool spacemit_of_node_instance_match(struct gpio_chip *gc, unsigned int i
>  	if (i >= SPACEMIT_NR_BANKS)
>  		return false;
>  
> -	return (gc == &sg->sgb[i].gc);
> +	return (gc == &sg->sgb[i].chip.gc);
>  }
>  
>  static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
> @@ -173,7 +174,8 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  				  int index, int irq)
>  {
>  	struct spacemit_gpio_bank *gb = &sg->sgb[index];
> -	struct gpio_chip *gc = &gb->gc;
> +	struct gpio_generic_chip_config config;
> +	struct gpio_chip *gc = &gb->chip.gc;
>  	struct device *dev = sg->dev;
>  	struct gpio_irq_chip *girq;
>  	void __iomem *dat, *set, *clr, *dirin, *dirout;
> @@ -187,9 +189,19 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	dirin	= gb->base + SPACEMIT_GCDR;
>  	dirout	= gb->base + SPACEMIT_GSDR;
>  
> +	config = (typeof(config)){
> +		.dev = dev,
> +		.sz = 4,
> +		.dat = dat,
> +		.set = set,
> +		.clr = clr,
> +		.dirout = dirout,
> +		.dirin = dirin,
> +		.flags = BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
> +	};
> +
>  	/* This registers 32 GPIO lines per bank */
> -	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
> -			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
> +	ret = gpio_generic_chip_init(&gb->chip, &config);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
>  
> @@ -221,7 +233,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
>  	ret = devm_request_threaded_irq(dev, irq, NULL,
>  					spacemit_gpio_irq_handler,
>  					IRQF_ONESHOT | IRQF_SHARED,
> -					gb->gc.label, gb);
> +					gb->chip.gc.label, gb);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to register IRQ\n");
>  
> 
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)

