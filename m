Return-Path: <linux-mips+bounces-8736-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F31A9B1A1
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 17:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 514CF3B0917
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 15:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AC21946AA;
	Thu, 24 Apr 2025 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bGNZrkbg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E042701C1;
	Thu, 24 Apr 2025 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507128; cv=none; b=YNed1wQUxbFy4MYyJArjfss69djIlCIAu2vkq61pEF/LQqzmAoOkRLjyaHL1B+fVCl2cNXaZ2QCaKMFRYY7Uq5kvjXd4sZJHbY+7bMtDjgHzJG6qUY4ocbZR0tgNT2DZDT67HrzuqdT1MOGbDLfddpLs9EYJklSueE4xTzvBCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507128; c=relaxed/simple;
	bh=DZadV4dYY/zC+SdX3Ciq88DCbQxa2Avy7+9rB/BkoX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MgAgUIeqzR8MVBKcpLxYXzcgwuBhfoIBeB3XxfoyNYhBw8R0xvonUanCpOljlUGio5Er/0wRnJm93ntd4DjtoerXdcixSAAYyXRmJXVys6kAsRCE8bvpXTjrIFiPZaFn0Z6l0ZCCZCMX3vVtYHAJIVgAZ1b1e5BPFO0RvsNkFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bGNZrkbg; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBPMk1019163;
	Thu, 24 Apr 2025 17:04:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	EbzdNbMuPcQgyg/32v679V2kcITSnqgFdSJKF+onCu4=; b=bGNZrkbgM7hP0A4d
	0huWCtfENxlTtZ2hD9QWgmb98DIFXK5fBmBupMzY6axYs0FrA/0LWmfz0WhsStka
	AUXFj0pYsKuCM2wNw3Noz8aYCKXGStw8mUCIHn1PU8SS3MuLYegugGWwOdnCglQS
	so57zD+/Q1kPH+lUcNiN2fR6/+s7xU5O1AjiWYlDUID34TOZerwOJJCOsxm/73wD
	AKWfN54uWLHEgaWECt+7UHmgOfzc5a9lH3nXnAz3hT37RZh9W27f0QUDHzBg/F3h
	2H+eskpgY2tz9SOoLS7XLLDm437GAqrqDrmqZ4wiJvlEm8NsT0+VsUGPYke1l5R3
	kW1R0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjvg1q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 17:04:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7BB1040046;
	Thu, 24 Apr 2025 17:01:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4E6D9C40B5;
	Thu, 24 Apr 2025 16:59:49 +0200 (CEST)
Received: from [10.48.86.196] (10.48.86.196) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 16:59:48 +0200
Message-ID: <fe3323d0-161c-498d-92e8-7a723f8d9780@foss.st.com>
Date: Thu, 24 Apr 2025 16:59:47 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 03/12] pinctrl: stmfx: use new GPIO line
 value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
	<afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Steen Hegelund
	<Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        <UNGLinuxDriver@microchip.com>,
        Ludovic Desroches
	<ludovic.desroches@microchip.com>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar
	<alim.akhtar@samsung.com>
CC: <linux-samsung-soc@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-actions@lists.infradead.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-3-504f91120b99@linaro.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-3-504f91120b99@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01



On 4/24/25 10:35, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/pinctrl/pinctrl-stmfx.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index aae01120dc52..f4fdcaa043e6 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -115,14 +115,14 @@ static int stmfx_gpio_get(struct gpio_chip *gc, unsigned int offset)
>   	return ret ? ret : !!(value & mask);
>   }
>   
> -static void stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> +static int stmfx_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
>   {
>   	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
>   	u32 reg = value ? STMFX_REG_GPO_SET : STMFX_REG_GPO_CLR;
>   	u32 mask = get_mask(offset);
>   
> -	regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
> -			  mask, mask);
> +	return regmap_write_bits(pctl->stmfx->map, reg + get_reg(offset),
> +				 mask, mask);
>   }
>   
>   static int stmfx_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> @@ -161,8 +161,11 @@ static int stmfx_gpio_direction_output(struct gpio_chip *gc,
>   	struct stmfx_pinctrl *pctl = gpiochip_get_data(gc);
>   	u32 reg = STMFX_REG_GPIO_DIR + get_reg(offset);
>   	u32 mask = get_mask(offset);
> +	int ret;
>   
> -	stmfx_gpio_set(gc, offset, value);
> +	ret = stmfx_gpio_set(gc, offset, value);
> +	if (ret)
> +		return ret;
>   
>   	return regmap_write_bits(pctl->stmfx->map, reg, mask, mask);
>   }
> @@ -694,7 +697,7 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>   	pctl->gpio_chip.direction_input = stmfx_gpio_direction_input;
>   	pctl->gpio_chip.direction_output = stmfx_gpio_direction_output;
>   	pctl->gpio_chip.get = stmfx_gpio_get;
> -	pctl->gpio_chip.set = stmfx_gpio_set;
> +	pctl->gpio_chip.set_rv = stmfx_gpio_set;
>   	pctl->gpio_chip.set_config = gpiochip_generic_config;
>   	pctl->gpio_chip.base = -1;
>   	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
> 

