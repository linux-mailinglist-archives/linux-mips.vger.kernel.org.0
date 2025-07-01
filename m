Return-Path: <linux-mips+bounces-9599-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE3DAF00E5
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 18:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FA25523E81
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 16:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1573B280A56;
	Tue,  1 Jul 2025 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GZ81VnWH"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BE427F747;
	Tue,  1 Jul 2025 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388705; cv=none; b=a/oNkf56ZAj/Ae2wyo5ONZffJ3O2PnQnfqdf+M81ytUqu6yPzQWy+Qn2OJIlz2Sh7XJ5ipDN06FScmg5cxeK+REDbleISPq86a8lzU52uFlk9iDL/gMepHy3dLL9oDuq4KRE3dTaShSDE6Vtgt7/ZougbcPq65HBliDtA5Sw0H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388705; c=relaxed/simple;
	bh=ScYmrBs35c67NS+18BBbVeUIJoDQx7NJUj3YkrlQwRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bca3DB0wLsCUhmWZfMYjnLqxUmZEgwYdMgtNYZqT8WtRnuesymJBu/rgsttZNUJUAetDRI5fDP7KkjwJ9VUqHelkLF/gYs5wk5Uj95xasmG80B+CuJGwwDFYNWPWrq9r1NzFmsGwuHFHthWraLYnSHjSuY9WxWHtZ7dTa78YkS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GZ81VnWH; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <31c2154b-0dc2-4d5d-a10b-803e459755e8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751388700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMEWrmV13hU5wNv9/YPiVk6dF9W0HhiA72VWSabwD9E=;
	b=GZ81VnWHz5lUEtQrFYxLovydqUcBu+AYV2Hez8GFoftT8ekfk4TH59Gr2ZydlK0N8eR+MR
	PIkDHF/pJHfNm0h7hHiNLgd5aX9NtjxIC/FxNj6YULbvsWxgLQnlSlTYVVAEKeVu+nDdnT
	6YnYd8Br6FUm4YpTDAz8XbJZ5sHGnw8=
Date: Tue, 1 Jul 2025 12:51:34 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 14/18] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
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
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-14-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-14-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/27/25 05:09, Théo Lebrun wrote:
> LSO is runtime-detected using the PBUF_LSO field inside register
> designcfg_debug6/GEM_DCFG6. Allow disabling that feature if it is
> broken by using struct macb_config->caps.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      | 1 +
>  drivers/net/ethernet/cadence/macb_main.c | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index d42c81cf441ce435cad38e2dfd779b0e6a141bf3..e5de6549861965e2823044d81b6abc20d2b27ceb 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -736,6 +736,7 @@
>  #define MACB_CAPS_NEED_TSUCLK			BIT(10)
>  #define MACB_CAPS_QUEUE_DISABLE			BIT(11)
>  #define MACB_CAPS_RSC_CAPABLE			BIT(12)
> +#define MACB_CAPS_NO_LSO			BIT(13)
>  #define MACB_CAPS_PCS				BIT(24)
>  #define MACB_CAPS_HIGH_SPEED			BIT(25)
>  #define MACB_CAPS_CLK_HW_CHG			BIT(26)
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 34223dad2d01ae4bcefc0823c868a67f59435638..f9a3a5caebcafe3d9197a3bc7681b64734d7ac93 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4346,8 +4346,10 @@ static int macb_init(struct platform_device *pdev)
>  	/* Set features */
>  	dev->hw_features = NETIF_F_SG;
>  
> -	/* Check LSO capability */
> -	if (GEM_BFEXT(PBUF_LSO, gem_readl(bp, DCFG6)))
> +	/* Check LSO capability; runtime detection can be overridden by a cap
> +	 * flag if the hardware is known to be buggy */
> +	if (!(bp->caps & MACB_CAPS_NO_LSO) &&
> +	    GEM_BFEXT(PBUF_LSO, gem_readl(bp, DCFG6)))
>  		dev->hw_features |= MACB_NETIF_LSO;
>  
>  	/* Checksum offload is only available on gem with packet buffer */
> 

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

