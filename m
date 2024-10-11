Return-Path: <linux-mips+bounces-5997-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A299ADC8
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 22:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A228528A3C2
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 20:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5BC1D12FE;
	Fri, 11 Oct 2024 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Oa+aeUFr"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C04199231;
	Fri, 11 Oct 2024 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728680082; cv=none; b=pbEMyphgzRMlHI9xV2FyXfZ9AIRbO5NCc1ynaU7GSqh8ehrrqo1n7WsBmbT2E5Q9xoWeiu8kHDNBiQMwgImpiCoE621m05RIWwFAbbSUiLY0s05hdLwUkDjFSzV+/sXi5d/jdKKSeo7yhckqWlsP8U/Q09rkJXAgZb5Rau+N1dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728680082; c=relaxed/simple;
	bh=umAubHxQ7LiDEHrygoZV6trbj1WgFdhgeo3ZrpXwbA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0uoA6fYPTMkMigFZey8xwUOPOVL90yuLjTk3GlQ4bZ4aH7lYLN62RWuxApzLKZPTJkB7keOEYPWwWODx1o4VQtyWjbmU6eJi9B4LgOe3PgAweu295nHFASieW0zF3FmZgFFRb9J+PKn1lRWZctk1b0FkoN1aVBPPF3f4cEf3Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Oa+aeUFr; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 616CC1BF203;
	Fri, 11 Oct 2024 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728680072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FMWU/wfiahlTYZKfBL4S1TuhYgvW8c68c7K0M+1aML8=;
	b=Oa+aeUFrzrtd1QR2fOxu6JWxGP116cT/7E+CZcvyPUx+m8Y7C7YDQOkLAH4dOdjKeIE8QC
	ZyzZBP+7h1v/UOJxp0l+SzzdjqCvluH3CzC1DfUqViRWwldpLzwZW1i3j1fWnYYNgc15iY
	7L6RP5pptE/Q/7JWCWrCdmwslD1EYflDrYOspQBMtw6daakFGnW1grG/Mj6zarQnO5E7hv
	CfalEgKSk5l6GlTH3bg3Vl663+fAfndUiJZNgrId5BEa2O3UZwUiFyZupzWA/CVNVouEq0
	c+SdJ8XoXwsmPUear011htZjyjkitzxpkZ0qPbWEcy5ZnLJhYZb6dbeTSJr4pg==
Date: Fri, 11 Oct 2024 22:54:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: linus.walleij@linaro.org, quentin.schulz@bootlin.com,
	lars.povlsen@microchip.com, horatiu.vultur@microchip.com,
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH 1/1] pinctrl: ocelot: fix system hang on level based
 interrupts
Message-ID: <20241011205431de827807@mail.local>
References: <20241006181310.181309-1-matsievskiysv@gmail.com>
 <20241006181310.181309-2-matsievskiysv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006181310.181309-2-matsievskiysv@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 06/10/2024 21:13:10+0300, Sergey Matsievskiy wrote:
> Fix interrupt handle loops, produced by spurious and short level based
> interrupts by unconditionally clearing the parent interrupt, even when
> no GPIO interrupts are pending.
> 
> Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/pinctrl/pinctrl-ocelot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> index be9b8c010167..d1ab8450ea93 100644
> --- a/drivers/pinctrl/pinctrl-ocelot.c
> +++ b/drivers/pinctrl/pinctrl-ocelot.c
> @@ -1955,21 +1955,21 @@ static void ocelot_irq_handler(struct irq_desc *desc)
>  	unsigned int reg = 0, irq, i;
>  	unsigned long irqs;
>  
> +	chained_irq_enter(parent_chip, desc);
> +
>  	for (i = 0; i < info->stride; i++) {
>  		regmap_read(info->map, id_reg + 4 * i, &reg);
>  		if (!reg)
>  			continue;
>  
> -		chained_irq_enter(parent_chip, desc);
> -
>  		irqs = reg;
>  
>  		for_each_set_bit(irq, &irqs,
>  				 min(32U, info->desc->npins - 32 * i))
>  			generic_handle_domain_irq(chip->irq.domain, irq + 32 * i);
> -
> -		chained_irq_exit(parent_chip, desc);
>  	}
> +
> +	chained_irq_exit(parent_chip, desc);
>  }
>  
>  static int ocelot_gpiochip_register(struct platform_device *pdev,
> -- 
> 2.39.5
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

