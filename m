Return-Path: <linux-mips+bounces-9589-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15552AEFE89
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 17:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E02961BC740A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 15:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F65F2797AC;
	Tue,  1 Jul 2025 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fwBE/RaN"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8238D27816A
	for <linux-mips@vger.kernel.org>; Tue,  1 Jul 2025 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384175; cv=none; b=SkEUs3BsdGs53jCa2tlEuue4OesgD2uGzAuz/6CcOxqGwa+WJ2uNvPf7UpVj5aqSCjcNSVISsopyHTCbQO+STuuaLFJKBkAuuPWazFYNHkH6W6XwifDDyHV7QT1sy79qWhJUasRL9DsdPrseUmRP8bzpkjahSG3E6uq/25EgCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384175; c=relaxed/simple;
	bh=JBVD1eHnNt7/17hJkw9DIm/ja1qq5YSgSfmECmYFLzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apTzpIb9irTNNXzlBzIewZVM1VUmH2s0X8p7pZRaoYZX+5GWIdbHAZdyVs4DKKNEdgzzTlwgTIZ3bi+ZpafAJ2iZoPX+3KB8w1j+j5U7B5JZV5nyRtZ1LqzVYqGzW0cX4LcrC0+Hm0/HW2blRq+CFGrfTJQuhZ+v5z1BLgtKROw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fwBE/RaN; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <1a4afc5b-4418-4dc1-8779-b9d999f8022f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751384160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCxKnSswnNtpFGvtkXVBmSxifi7UjWwGEwVedZPlbCM=;
	b=fwBE/RaNY/JxaBidGlMSzanuOo6Pzf7xVEkWcviwChwDS/G+6I+EFkG6H0+T50EDv3gjGv
	IkBa9ZzIUZJI4vL1XHDE4iLlR/Ssszp163h/q6XXdQjdU9FapdalrcSshXefzgctZRvX8d
	g2hTUfDK8UkDL7ieiT8vj5oeVYgzuk8=
Date: Tue, 1 Jul 2025 11:35:53 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 06/18] net: macb: Remove local variables
 clk_init and init in macb_probe()
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
 <20250627-macb-v2-6-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-6-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/27/25 05:08, Théo Lebrun wrote:
> Remove local variables clk_init and init. Those function pointers are
> always equivalent to macb_config->clk_init and macb_config->init.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 53aaf6b08e39a45bde5af61a05fb2b9fd653b2e7..6c8a34e40b77ea37ed25c2b0414440cd3f6962c3 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -5166,10 +5166,6 @@ static const struct macb_config default_gem_config = {
>  static int macb_probe(struct platform_device *pdev)
>  {
>  	const struct macb_config *macb_config = &default_gem_config;
> -	int (*clk_init)(struct platform_device *, struct clk **,
> -			struct clk **, struct clk **,  struct clk **,
> -			struct clk **) = macb_config->clk_init;
> -	int (*init)(struct platform_device *) = macb_config->init;
>  	struct device_node *np = pdev->dev.of_node;
>  	struct clk *pclk, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
>  	struct clk *tsu_clk = NULL;
> @@ -5191,14 +5187,11 @@ static int macb_probe(struct platform_device *pdev)
>  		const struct of_device_id *match;
>  
>  		match = of_match_node(macb_dt_ids, np);
> -		if (match && match->data) {
> +		if (match && match->data)
>  			macb_config = match->data;
> -			clk_init = macb_config->clk_init;
> -			init = macb_config->init;
> -		}
>  	}
>  
> -	err = clk_init(pdev, &pclk, &hclk, &tx_clk, &rx_clk, &tsu_clk);
> +	err = macb_config->clk_init(pdev, &pclk, &hclk, &tx_clk, &rx_clk, &tsu_clk);
>  	if (err)
>  		return err;
>  
> @@ -5336,7 +5329,7 @@ static int macb_probe(struct platform_device *pdev)
>  		bp->phy_interface = interface;
>  
>  	/* IP specific init */
> -	err = init(pdev);
> +	err = macb_config->init(pdev);
>  	if (err)
>  		goto err_out_free_netdev;
>  
> 

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

