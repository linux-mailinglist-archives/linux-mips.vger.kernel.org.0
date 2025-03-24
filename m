Return-Path: <linux-mips+bounces-8326-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61412A6D600
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 09:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F6053AD0B3
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 08:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B388125D203;
	Mon, 24 Mar 2025 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ozkfcmcL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E4525D1E8
	for <linux-mips@vger.kernel.org>; Mon, 24 Mar 2025 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804331; cv=none; b=jHzVEml4YY3GvSWR32HDPPZgV7pUV87flLCClTKBF72ZV0/FvHKHfg4yjA1IQE7x7MFSXpPzGlRrQFNskf6M8Tl1BJB6WZwneZAD3j52QT/bXPbjb8LE8WBSazoIVL2VD6cc5klcHt2ZNAtjRN/0CIYPMi0AMUxdjSDnt+KLqMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804331; c=relaxed/simple;
	bh=6/FGJEt1RK3xrrnf30jQkcciY1Tncfe7Lc4lNDrYdyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbZRHH8ai9kVwMlmQbwBfwn/oY6zZKvQMgEmXnqwzWtWHL2DdcxBw/zbDxamaLb3It8a3vwsjlht9qQCRstbgKuvVSI9gtbXP76vQORKVNji463Pf9cTZOUeJ0f6vuC7YLiu14v7mwxtXFKVsy4hqTT4wNM5eQjs24WcyZpBnrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ozkfcmcL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948021a45so32726105e9.1
        for <linux-mips@vger.kernel.org>; Mon, 24 Mar 2025 01:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742804327; x=1743409127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUV72th4YLID8Yi5m5TOOfAU6k/l5ItTBGhCs4wlkd4=;
        b=ozkfcmcLabBiV8WInbkjifw8S9L2Zi6QGtbu159iGGTj1dk7e1flwO+DjVqdbp6L8a
         AFClaxAiVkc37l0akScbEVeDUuI3j7I/VPJmH9oOCp7D2AhSsKWVk7C3Bqs4g7wbRnqS
         /QGUR5J2gvmx70juqkZK+UnsjsCMQu8kg/PmjsnOcK0RL6tB68lPPiMHN9dZG46etYcq
         xa4ypLHNRirSpL/i5sNb6L7Aja5PPgVUPgynSPsnO9oHgbCpG87bm97cSFoq1QVcEz3U
         dqzNLUIPP50q5eSOp53alb0lPiSAp504dZMQ1ddZqxRZQGXshjFVXNVlcJnrPtH+9Qn1
         uODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804327; x=1743409127;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUV72th4YLID8Yi5m5TOOfAU6k/l5ItTBGhCs4wlkd4=;
        b=MvBzD84wt5MsN375pC9aqJXDP8o9vQumy/76hCiHwnhNX6yOCog47TfiMpeoVKm49D
         /WjZSZFE3wkt0OaJF3dJNMjoHcaXPhplMC9wZFCCpuz5A3Y/3ywgNElGHadm4bryOKII
         nsgHCon6mnqcKUfhxDw+QUpnvD2jeZlapYPAz7939SZF6xrtWtBrB0asQpbCNPet4ri1
         YqfKTq2yy7a7BaGW1mdZZ/YxKRgaP6Yc28AUutA8LHwceu6SKKlDYBuYUo+IIwpYMaJa
         8RjzMbcIja29j50YBKWnRIhQnROate3F8RIPrReRPSRr7tyPqlWcHKb1wWrkSVIVkiIb
         nJvg==
X-Forwarded-Encrypted: i=1; AJvYcCW1FY6Sf75BNNOi6NEM15CsOYTjE+Itioa0Dtn3n+fOHH/S72faTwAMNxAORDG6wj9zgj8wpoK+1Dqr@vger.kernel.org
X-Gm-Message-State: AOJu0YxBNNQnU1VV6lg1Wjk1vlRmu/Tl0+1iS0WBCtwYJDvzfvg07ltk
	kIHUw72GsKUE1E043Hk06BcnGuGrXEWRhggW/wifA1x4PWU+wkh0gt0wiMl1lio=
X-Gm-Gg: ASbGncvVh+vrt7gqUKb+Ad+qlLW8QCHR75pFNOrqgGgKYWDed+7QGnMGpX4kc6OQncs
	zdLVJ3LBsaeWz73QKJg4p8fOBzJQU8OB7hx8vN/Oev8C8kYx9dDPOcRYSPZVhHpAUz1YtMxw2Yg
	c5/OO06hVm67JL74s7C7oeN9ZPrlmjY4qkKaC1Svg5Y3jU7vHDeYgeNExpC6ubqp20dUdZ5qOXn
	GeoqtPiu7YrmN2p7fYqRLeZR6/McgzbL36E/wNFBjigqm1C2xik2n3zEMAzOk7/Murfo6rYa8uk
	eQWCuBynmnCzjKzMLinkgUmnk4mtCI3fctn2Do8cZvZNm1RnKVbU
X-Google-Smtp-Source: AGHT+IGsHxYn5Ee/W35yKht21ggLacnLCdw5GuAkDQDpS+0jTcweaq4u/g3gFV75Q5DOsSvSYrtVtQ==
X-Received: by 2002:a05:600c:1d16:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-43d58db52e1mr44341605e9.21.1742804327367;
        Mon, 24 Mar 2025 01:18:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdab7asm163827855e9.29.2025.03.24.01.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:18:46 -0700 (PDT)
Message-ID: <3e6cb322-bc8d-471c-87c8-286b98f12ad9@tuxon.dev>
Date: Mon, 24 Mar 2025 10:18:44 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 05/13] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-5-537b7e37971d@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250321-macb-v1-5-537b7e37971d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Theo,

On 21.03.2025 21:09, Théo Lebrun wrote:
> LSO is runtime-detected using the PBUF_LSO field inside register
> designcfg_debug6/GEM_DCFG6. Allow disabling that feature if it is
> broken by using struct macb_config->caps.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      | 1 +
>  drivers/net/ethernet/cadence/macb_main.c | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index 3b43cb9468e3618754ff2bc6c5f360447bdeeed0..e9da6e3b869fc772613a0d6b86308917c9bff7fe 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -739,6 +739,7 @@
>  #define MACB_CAPS_MIIONRGMII			BIT(9)
>  #define MACB_CAPS_NEED_TSUCLK			BIT(10)
>  #define MACB_CAPS_QUEUE_DISABLE			BIT(11)
> +#define MACB_CAPS_NO_LSO			BIT(12)
>  #define MACB_CAPS_PCS				BIT(24)
>  #define MACB_CAPS_HIGH_SPEED			BIT(25)
>  #define MACB_CAPS_CLK_HW_CHG			BIT(26)
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index b5797c1ac0a41e9472883b013c1e44a01092f257..807f7abbd9941bf624f14a5ddead68dad1c8deb2 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4373,8 +4373,9 @@ static int macb_init(struct platform_device *pdev)
>  	/* Set features */
>  	dev->hw_features = NETIF_F_SG;
>  
> -	/* Check LSO capability */
> -	if (GEM_BFEXT(PBUF_LSO, gem_readl(bp, DCFG6)))
> +	/* Check LSO capability; capability is for buggy HW */

The comment here is a bit confusing to me.

> +	if (!(bp->caps & MACB_CAPS_NO_LSO) &&
> +	    GEM_BFEXT(PBUF_LSO, gem_readl(bp, DCFG6)))
>  		dev->hw_features |= MACB_NETIF_LSO;
>  
>  	/* Checksum offload is only available on gem with packet buffer */
> 


