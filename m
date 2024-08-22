Return-Path: <linux-mips+bounces-5015-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EEE95B6A2
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 15:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A09E61C221C7
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 13:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F391CB31E;
	Thu, 22 Aug 2024 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ByZNkwYy"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A2B1CB13B;
	Thu, 22 Aug 2024 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724333331; cv=none; b=WdzWxGJnBpRrfUVjAwH1yDplbegARM2trpDQGaAWX2y+k43hQHoF94iP9dKpPyYCKl2WFhb04A4bajy9gIayj2/crlanYQyv+N7aMRcH/FZ6IwBzoIU/c8ExRPOZajKOx37ZlkQtGgdjpHHpGNM4FTbs/xf5QWcc+uIZUYVyRic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724333331; c=relaxed/simple;
	bh=nmOP7TigL4Lx6Rg75qYcaWJgEkGxlZtSC1NvnRpSduA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bzs+yv2RIbyUYPqfU1pu21+5+7TDMBYOtUYHmuSEL4z2GeN0mewt9pjuXsUGtQTy3IgFdwj4yRloHGYKjnaZuN7ahM4ScVGnytpzaLjXhvr2WmMdxrYS3BrF3GXwI0fiDbw89j64YzYoJOeUbp1+PzlqviSusL0C2hHYLeQDQbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ByZNkwYy; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE17160003;
	Thu, 22 Aug 2024 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724333326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23/UGc7HSdWd5XXoA2dH4m+DJsdQ98TBIyGL423yxJI=;
	b=ByZNkwYybdfVZ/peZeIpIbJiwwqti2s8SNgHbgXM3SfFoU2zBInDhtrTlr8bUtvte1Y1Ba
	JmJVHgL1bhDKuyIFJvsdz42Yp+lKuAlYiDUv4RAXFDqawxZ4q5vfQ+KtqA/852R9uDuwKx
	HXNkabi3i1/wtPrLVBPHe0XrY9M8DJYajGyDRsUsbmLV5Rpxg32QbUjeuLUfa5z2nePm40
	OH2ArqJQBsTeMiKEVCnYmuznHH5g2u/ssq3Vyc2F04YX3Fluq4CyAcfrI0I8crF6wXGdAB
	pXKv6Q364h0BmDU4eG8d3+pnTkfF5Ro+6TnKHlW+m1egBVdjVchPgL42VTJs+w==
Message-ID: <c54434e3-1fb8-4491-b24f-2167786fe84c@bootlin.com>
Date: Thu, 22 Aug 2024 15:28:40 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] tty: atmel_serial: Use devm_clk_get_enabled() helpers
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Liviu Dudau
 <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 John Ogness <john.ogness@linutronix.de>, Thomas Gleixner
 <tglx@linutronix.de>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Valentin Caron <valentin.caron@foss.st.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Erwan Le Ray <erwan.leray@foss.st.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 opensource.kernel@vivo.com
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-5-liulei.rjpt@vivo.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20240822033924.32397-5-liulei.rjpt@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

Le 22/08/2024 à 05:39, Lei Liu a écrit :
> The devm_clk_get_enabled() helpers:
>      - call devm_clk_get()
>      - call clk_prepare_enable() and register what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().
> 
> Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
> ---
>   drivers/tty/serial/atmel_serial.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 09b246c9e389..209f3d41a17c 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -2910,14 +2910,11 @@ static int atmel_serial_probe(struct platform_device *pdev)
>   	atomic_set(&atmel_port->tasklet_shutdown, 0);
>   	spin_lock_init(&atmel_port->lock_suspended);
>   
> -	atmel_port->clk = devm_clk_get(&pdev->dev, "usart");
> +	atmel_port->clk = devm_clk_get_enabled(&pdev->dev, "usart");
>   	if (IS_ERR(atmel_port->clk)) {
>   		ret = PTR_ERR(atmel_port->clk);
>   		goto err;
>   	}
> -	ret = clk_prepare_enable(atmel_port->clk);
> -	if (ret)
> -		goto err;
>   
>   	atmel_port->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
>   	if (IS_ERR(atmel_port->gclk)) {
> @@ -2968,15 +2965,12 @@ static int atmel_serial_probe(struct platform_device *pdev)
>   	 * The peripheral clock can now safely be disabled till the port
>   	 * is used
>   	 */
> -	clk_disable_unprepare(atmel_port->clk);
> -
Why removing this ?
This is not an error path.

>   	return 0;
>   
>   err_add_port:
>   	kfree(atmel_port->rx_ring.buf);
>   	atmel_port->rx_ring.buf = NULL;
>   err_clk_disable_unprepare:
> -	clk_disable_unprepare(atmel_port->clk);
>   	clear_bit(atmel_port->uart.line, atmel_ports_in_use);
>   err:
>   	return ret;

Thanks,
Richard.


