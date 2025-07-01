Return-Path: <linux-mips+bounces-9590-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F769AEFE8F
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 17:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54922188C54C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 15:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9536279DD8;
	Tue,  1 Jul 2025 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ENigJ1dn"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B2E27814F
	for <linux-mips@vger.kernel.org>; Tue,  1 Jul 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384254; cv=none; b=uzcAVVg43YnoXCcI0H4Htn7O365YoIqUL+L7BxgT4tl98l3hVQLJj8qq3LvEcoihYRiQRSNENezjvVfMB08LuDnI10YaoVEJOQqvdx/SgmJaexdcKEySR8M6Tt1ugGVK3wo+JoIZw74ySmArLShOpp4qEmOZvWas65M/2PrIF3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384254; c=relaxed/simple;
	bh=ovi6ehXHRg2OXhTGZqfDtxC1wNJZkJuNbs9Djf+CFco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BrLpK+2774SrijxqQjYmFixA34cFg27qsqsLRS2vAaf1z3AspTCnPpLAT0Wh74JbXCYr+PDJzZsQBR96PYU+qg2hnJuEGfa52busW9aWgrFPhoamtEK0kTy4GUwRtmB4E+yIASjnkqy4yaBW7D4k/pjctTcP3J1THUYc5gqRT/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ENigJ1dn; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <62111125-c1f5-41ff-ba32-75ec41508906@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751384250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E82KrJwgWkOW+NmsBbXPBqs/aYg5/5kQ8qZzeEJKY/I=;
	b=ENigJ1dn2PFqbh4WbpieVYCLw8kAqUSRORgmHFVwvcLzQUCmm37tmyM9RCqNIwY3042XND
	lRqt4HEbDBXfxS0seaC8MGUTWpORbZ8HArRvGGuENOgfaMmJHs9hx9XFlaHZIAXJFXEMqQ
	mcU+JKqCuk7RbxuM6eF/9c9xBvWQikM=
Date: Tue, 1 Jul 2025 11:37:21 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 07/18] net: macb: drop macb_config NULL
 checking
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-7-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-7-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/27/25 05:08, Théo Lebrun wrote:
> Remove NULL checks on macb_config as it is always valid:
>  - either it is its default value &default_gem_config,
>  - or it got overridden using match data.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 6c8a34e40b77ea37ed25c2b0414440cd3f6962c3..6926ea11d71adae7a25d5ee329c148f5882d4184 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -5227,15 +5227,13 @@ static int macb_probe(struct platform_device *pdev)
>  	}
>  	bp->num_queues = num_queues;
>  	bp->queue_mask = queue_mask;
> -	if (macb_config)
> -		bp->dma_burst_length = macb_config->dma_burst_length;
> +	bp->dma_burst_length = macb_config->dma_burst_length;
>  	bp->pclk = pclk;
>  	bp->hclk = hclk;
>  	bp->tx_clk = tx_clk;
>  	bp->rx_clk = rx_clk;
>  	bp->tsu_clk = tsu_clk;
> -	if (macb_config)
> -		bp->jumbo_max_len = macb_config->jumbo_max_len;
> +	bp->jumbo_max_len = macb_config->jumbo_max_len;
>  
>  	if (!hw_is_gem(bp->regs, bp->native_io))
>  		bp->max_tx_length = MACB_MAX_TX_LEN;
> 

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

