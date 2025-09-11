Return-Path: <linux-mips+bounces-11228-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E138B52502
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 02:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EBAA446D44
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 00:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15B619F464;
	Thu, 11 Sep 2025 00:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UrkQ6Wwb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D72288DB
	for <linux-mips@vger.kernel.org>; Thu, 11 Sep 2025 00:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757551072; cv=none; b=DIZ1vEWCB5HNt0l1JEsTtikLIqEvHcGWnlq7HaVvIfeF153Zp+Z1wdVv/jXaLcHGVUKtD1QL7A/Tkv6K73udL4dx3hhgkGFs8fv6smZmdZ+Ryh75GcknE4QMTKilC0DTmMS86WttAw5i+Y8s+39w3sFHa1MxEeW5WW1HhZIJj90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757551072; c=relaxed/simple;
	bh=Ws5BsOuLpE4UKz9Ht7ciq9DVxAOWEECz0oNR8S154a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pg5mKfZ3wWOfzdw4Y4n5lgh/lZ2RIEhMWZyVVngHJlG51rL7HP2wwdtz4hMifZyjUore3qVxsN4YpAbSIIgB4VP1Vp8WH0kRusYqpi0q2rtfLszobIddz62QA3mEb8v6dd4AyX9ZPkpN1rK5ZGndrdZ8xdsSpi2V0L9EgpaCfCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=UrkQ6Wwb; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-88432e29adcso4140839f.2
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 17:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757551069; x=1758155869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYrvQ7D9b6NhRXRDHgVqulriX5zXTRTpYH1+E3ILgrk=;
        b=UrkQ6WwbNL2vBhxasvGo4wf8gcUWJawUC2IevUFNUX7qyN+jt5010HiW2+ulMZG+k0
         nf126tUF9LQZqt9wKIHxUd/JQq4Uvhwk2YlEsi0FWJFZW3tk+eGRhtK8k9YUCRqiQhyr
         HUzswTl+6zrfyMuhMk/wcqc2+ma/B/pjrioeBrC9nQLKaISP7Y+WteiOuyO6JcyB8xS+
         uLqgWVAJ9ukLg+kp0+w5akj97LGoV94mGReXCO6CIY3roII0T/kODD775NLhPZ7e9M7n
         tQ23f3yLPNq5aBimsM7hVXf4PdF9+toqupfpy4ynrh9UZmDCmUBNYQO6B5Yc7OzbMx/w
         Sx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757551069; x=1758155869;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYrvQ7D9b6NhRXRDHgVqulriX5zXTRTpYH1+E3ILgrk=;
        b=FPPXaD19Ye/Y3GambPu2YPzWMSpVHkNLkyC5SfNMUcSjOTdV+Y+ntGkwHWrmv21yY8
         H2xJc7ZAnroqldKBdjrPu+b4xhqU4JYbele3dV9sXX06Un9oH0P0RImy/wkz6EyiOw9e
         c2cgEMhy/OQXGuL9zNqpK7dUeGesJ+tcVxDICPm9YjPqzPTXrJOibU1vTX1L2UUrygbE
         en8WHxiG9uvWs8w1OfqXOQNJKMqSmGUAB41KPJzknVhVK2PYtA47/J5kUHKy+bu5toeh
         0mH0UxZsK8cVogt+TCTK3iS19UV9whLY9xB166VYPkfDz9KGJdrFgURO1LMPGXxsA2EO
         gLgg==
X-Forwarded-Encrypted: i=1; AJvYcCU639mDDgoO3oyAMw/uU+Es5C3FAARr6DZvxkJTGfgDobpSFnyde6e2vgmC/op3jEO2W6OieqRos4CZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvvkvFrjB7Fnk/g4jnpqtRUs3neqjVxHQ4IMUmdav7crua3WLP
	GK1f7uoXuvajB3ceKU+sD3junLCBVLsSknOl11cArO8Q/lyHoF7L3yN1F9PT4aqUG9Q=
X-Gm-Gg: ASbGncvHyaOeIdHW/qCuem0oI1S3KgSk0vsYeGrNS0aFBsfKC1IetP6PfXj3dJ1Vft8
	YqyFLhqXI7d2DDMUWemjIyIMdTRmKqCi6xJRDgozBPOhv26pEbZpAjPGMEZeI4bgEfVGTWYI4Xw
	yfwv5rpp8M6Zyf8LZPQEhWrCnizBSl4N4/v2hfbhw/v+2lA9ilcVgddJJoUGy+GlOU3yOzXHhu7
	f+m8JSZG1Cu+z7JccPLliZ5pFaRNIt+ztQoZAla/YMUW2RrIycrHTortVLnd1wDqWMcUuAdRcmQ
	e0QL0ORSUBfHcenT3dPO7sCtDHl1wZcniRbxfFws3B0bUAXFyW52CgB7zCqpkGGLpcS7Uq1mWSO
	p+Uic0f44wG8v70wNFHaDO5W2Z3c=
X-Google-Smtp-Source: AGHT+IHypX0rxdgejA/TynvZgj1dNh9JG3EM022EojH8sVkAbfYd3XtSQqZeY9jgEc3I2pTdN6xPVg==
X-Received: by 2002:a05:6e02:b4c:b0:405:5e08:a3e4 with SMTP id e9e14a558f8ab-4055e17ea60mr187077025ab.1.1757551068770;
        Wed, 10 Sep 2025 17:37:48 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-511f3067eb8sm8720173.54.2025.09.10.17.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 17:37:48 -0700 (PDT)
Message-ID: <01a7cc78-fdae-4a1e-bf78-961e7ec214b2@sifive.com>
Date: Wed, 10 Sep 2025 19:37:46 -0500
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] gpio: sifive: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-11-f3d1a4c57124@linaro.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-11-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 2025-09-10 2:12 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-sifive.c | 73 ++++++++++++++++++++++++----------------------
>  1 file changed, 38 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 98ef975c44d9a6c9238605cfd1d5820fd70a66ca..2ced87ffd3bbf219c11857391eb4ea808adc0527 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -7,6 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/generic.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> @@ -32,7 +33,7 @@
>  
>  struct sifive_gpio {
>  	void __iomem		*base;
> -	struct gpio_chip	gc;
> +	struct gpio_generic_chip gen_gc;
>  	struct regmap		*regs;
>  	unsigned long		irq_state;
>  	unsigned int		trigger[SIFIVE_GPIO_MAX];
> @@ -41,10 +42,10 @@ struct sifive_gpio {
>  
>  static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
>  {
> -	unsigned long flags;
>  	unsigned int trigger;
>  
> -	raw_spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
> +	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
> +
>  	trigger = (chip->irq_state & BIT(offset)) ? chip->trigger[offset] : 0;
>  	regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
>  			   (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset) : 0);
> @@ -54,7 +55,6 @@ static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
>  			   (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) : 0);
>  	regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
>  			   (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) : 0);
> -	raw_spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
>  }
>  
>  static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
> @@ -72,13 +72,12 @@ static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
>  }
>  
>  static void sifive_gpio_irq_enable(struct irq_data *d)
> -{
> +	{

This looks like an unintentional whitespace change.

>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
>  	irq_hw_number_t hwirq = irqd_to_hwirq(d);
>  	int offset = hwirq % SIFIVE_GPIO_MAX;
>  	u32 bit = BIT(offset);
> -	unsigned long flags;
>  
>  	gpiochip_enable_irq(gc, hwirq);
>  	irq_chip_enable_parent(d);
> @@ -86,13 +85,13 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
>  	/* Switch to input */
>  	gc->direction_input(gc, offset);
>  
> -	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	/* Clear any sticky pending interrupts */
> -	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> -	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
> +		/* Clear any sticky pending interrupts */
> +		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> +	}

This block (and the copy below) don't actually need any locking, since these are
R/W1C bits. From the manual: "Once the interrupt is pending, it will remain set
until a 1 is written to the *_ip register at that bit." I can send this as a
follow-up improvement if you want to keep this limited to the API conversion.

So with the minor whitespace fix:
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Regards,
Samuel

>  
>  	/* Enable interrupts */
>  	assign_bit(offset, &chip->irq_state, 1);
> @@ -118,15 +117,14 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
>  	struct sifive_gpio *chip = gpiochip_get_data(gc);
>  	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
>  	u32 bit = BIT(offset);
> -	unsigned long flags;
>  
> -	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> -	/* Clear all pending interrupts */
> -	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> -	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> -	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
> +		/* Clear all pending interrupts */
> +		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> +		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> +	}
>  
>  	irq_chip_eoi_parent(d);
>  }
> @@ -179,6 +177,7 @@ static const struct regmap_config sifive_gpio_regmap_config = {
>  
>  static int sifive_gpio_probe(struct platform_device *pdev)
>  {
> +	struct gpio_generic_chip_config config;
>  	struct device *dev = &pdev->dev;
>  	struct irq_domain *parent;
>  	struct gpio_irq_chip *girq;
> @@ -217,13 +216,17 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  	 */
>  	parent = irq_get_irq_data(chip->irq_number[0])->domain;
>  
> -	ret = bgpio_init(&chip->gc, dev, 4,
> -			 chip->base + SIFIVE_GPIO_INPUT_VAL,
> -			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> -			 NULL,
> -			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
> -			 chip->base + SIFIVE_GPIO_INPUT_EN,
> -			 BGPIOF_READ_OUTPUT_REG_SET);
> +	config = (struct gpio_generic_chip_config) {
> +		.dev = dev,
> +		.sz = 4,
> +		.dat = chip->base + SIFIVE_GPIO_INPUT_VAL,
> +		.set = chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> +		.dirout = chip->base + SIFIVE_GPIO_OUTPUT_EN,
> +		.dirin = chip->base + SIFIVE_GPIO_INPUT_EN,
> +		.flags = BGPIOF_READ_OUTPUT_REG_SET,
> +	};
> +
> +	ret = gpio_generic_chip_init(&chip->gen_gc, &config);
>  	if (ret) {
>  		dev_err(dev, "unable to init generic GPIO\n");
>  		return ret;
> @@ -236,12 +239,12 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
>  	chip->irq_state = 0;
>  
> -	chip->gc.base = -1;
> -	chip->gc.ngpio = ngpio;
> -	chip->gc.label = dev_name(dev);
> -	chip->gc.parent = dev;
> -	chip->gc.owner = THIS_MODULE;
> -	girq = &chip->gc.irq;
> +	chip->gen_gc.gc.base = -1;
> +	chip->gen_gc.gc.ngpio = ngpio;
> +	chip->gen_gc.gc.label = dev_name(dev);
> +	chip->gen_gc.gc.parent = dev;
> +	chip->gen_gc.gc.owner = THIS_MODULE;
> +	girq = &chip->gen_gc.gc.irq;
>  	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
>  	girq->fwnode = dev_fwnode(dev);
>  	girq->parent_domain = parent;
> @@ -249,7 +252,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  	girq->handler = handle_bad_irq;
>  	girq->default_type = IRQ_TYPE_NONE;
>  
> -	return gpiochip_add_data(&chip->gc, chip);
> +	return gpiochip_add_data(&chip->gen_gc.gc, chip);
>  }
>  
>  static const struct of_device_id sifive_gpio_match[] = {
> 


