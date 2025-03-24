Return-Path: <linux-mips+bounces-8327-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4319CA6D607
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 09:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ABC53AEF26
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 08:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D354325D208;
	Mon, 24 Mar 2025 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dVcEfcQN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3F257453
	for <linux-mips@vger.kernel.org>; Mon, 24 Mar 2025 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804417; cv=none; b=E6QxTd+Vqi+nIDjWAHciFqPboyQ47SPG/0c51um4ldPvpBEg6T/mo3I3FEpLOdLLKL8wjdBnRcpChMgOkreB/WcH3PjFDBPU8l8wJL3sMjhL/k3a9vMo1i2h1Dsp65oNDusk3DO7iATHjx7pBHUg4paTVlEeUjs6EQCOVWPcMaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804417; c=relaxed/simple;
	bh=M4+k6YD1mCXTwas5eL+hsY8I+hzUqzWAWG8iyXWAySg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQ1KD8dJcERJ33KbrUGbdohm11bkypYoKc9Rzn6ZWyt6IwBwwPBE5rEsHafszHpQ5mUpps8vWkdAx0Wdlt4asMcYZzFmzmkza7URhmICJTnJHsU/9url4iRgTLuVl+Kdm6ZRoCmLHUMeUMFWPTV31yWjU11ZNuq/txnrP0Ql9n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dVcEfcQN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3996af42857so3238004f8f.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Mar 2025 01:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742804413; x=1743409213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5KNi5vv+WwUHgiOiAE1zT6bKqb5UxIw1xZcRyktkIE=;
        b=dVcEfcQNMPXouD0q0BpB4ThpSHYpMCJhVEpJx7bGecKDgtxWyZfxVQnC10XOI2tdLK
         LlYuY/dTTHvePypS+csW3lF6uBhou/xAxSmYdmkVDcdk9S3CmW+zuORU8X0K4Eji7Tcg
         Ax8A697eKrVVzoBc+TwxOK6btMciCbOXeDnOv/A4Ucq+LdrbyvxxRCAswuH/r8a2MjMZ
         S43+imhKk1AGgVUtQyTUCmHrtWP/WXL077B8Mz414HUp25KVZ4j/IbzSw/LA/tNkVZOC
         kmiwc2GuZFguEj6qf+5M2lkEfNBl/n7NsSJQt7CQc2xjsq81njWMbK65WL1G+a5mEiYV
         KiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804413; x=1743409213;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5KNi5vv+WwUHgiOiAE1zT6bKqb5UxIw1xZcRyktkIE=;
        b=JFBjO/aIaBI/sWTGbXshwuSTy28IckJaz9HN+DWjG4VUQaRekkqCdKqb6dXO+yQaG4
         9DtVZCoL7ZEgCfUZPEAEh/wgaAI38wULDYodZf+Vb3+Luke9Fv+yonBoYJ074U7gbm4j
         kP88H6n3ia4uPjLZkce9PVzYMWOSV4LnqNSFSbxm/mbfyBXlUG/lAhpaZa7CotL8MV5d
         w9SzAEMYPihyFHAuYsZx8qZHluCCt67JWn8AUMD5wkRZCAZm93f2w0qYdBgqzag3n9ax
         x0pJMX2Be5nXULmyp91LkItV2qZYs7mXcgsg5mhIsJF9l93ZJYfcCe0ZwiO2UrtZQgo1
         wStQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEzljnZrSdMZAg4bVvCoN90t0qDjl8Gg1njiEAwQ97KPmor0bdUErUtfBDVQEAQ2xuIXdeIXp+iNFy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xD6bVoVtrrfxc1YgJxO/MfzzV8Dtt4lXj/meg7lD8k5c+tYP
	AeYGWtwAcEJI8GZJBuPXWvL/dHrExTMz/lxg0viN3Z2neBJaJZn7tfyA5euFa0s=
X-Gm-Gg: ASbGnctPguAolFIpHDICxb9JdwidUns0jSmTpTSmC7dI02pV07Qpj4tegicT+6U2dlg
	dDCBqTwsou0svV9px0QkRfqkYipkW2X19e4oy+YFhtYjdcQo3psIkp8MgyH02dbkt39aVHR/IHb
	UHngqaNlTHByEdBZ07wgBbM0WViJfHSV4Ac2iNT9Nut5bRNM31GYHZNdV8qa5n3W0vCh86CoVYF
	fK2H7t5FFo2tcXZ/+f31mEUiJczfIt/MxC4Kc0wcnOyeZsumpOOfufPFRQCbMzHdcQ4K6Ihcfc7
	rHBYdSGmDcP27igI7N8hy3queg0+b1hdHx82k2u8bH285bMzNC1qA2EGWEFXeo8=
X-Google-Smtp-Source: AGHT+IHieGvYY9xYsJ+hRcTxELd3WHjGIze3RgAfmcczbmeULThLVKV6pyFoFLcvCmypyhY+f3n/4w==
X-Received: by 2002:a5d:584f:0:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-399795567ebmr13722154f8f.6.1742804413383;
        Mon, 24 Mar 2025 01:20:13 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efc90sm10337434f8f.98.2025.03.24.01.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:20:12 -0700 (PDT)
Message-ID: <1f5b71d6-872f-486d-9b06-7b5e407f8482@tuxon.dev>
Date: Mon, 24 Mar 2025 10:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/13] net: macb: introduce DMA descriptor
 helpers (is 64bit? is PTP?)
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
 <20250321-macb-v1-8-537b7e37971d@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250321-macb-v1-8-537b7e37971d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I think the "(is 64bit? is PTP?)" from title could be dropped.

On 21.03.2025 21:09, Théo Lebrun wrote:
> Introduce macb_dma_is_64b() and macb_dma_is_ptp() helper functions.
> Many codepaths are made simpler by dropping conditional compilation.
> 
> This implies three changes:
>  - Always compile related structure definitions inside <macb.h>.
>  - Make the field hw_dma_cap in struct macb always present.
>  - MACB_EXT_DESC can be dropped as it is useless now.
> 
> The common case is:
> 
> 	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> 		struct macb_dma_desc_64 *desc_64;
> 		if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> 			desc_64 = macb_64b_desc(bp, desc);
> 			// ...
> 		}
> 	#endif
> 
> And replaced by:
> 
> 	struct macb_dma_desc_64 *desc_64;
> 	if (macb_dma_is_64b(bp)) {
> 		desc_64 = macb_64b_desc(bp, desc);
> 		// ...
> 	}
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb.h      |   8 ---
>  drivers/net/ethernet/cadence/macb_main.c | 110 +++++++++++--------------------
>  2 files changed, 38 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index 5bf7e7ff70490cdb068bfdbe7cfd5bb8e1db7f86..26e0af44a45926c782cf0f72184332ab3605a178 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -15,10 +15,6 @@
>  #include <linux/phy/phy.h>
>  #include <linux/workqueue.h>
>  
> -#if defined(CONFIG_ARCH_DMA_ADDR_T_64BIT) || defined(CONFIG_MACB_USE_HWSTAMP)
> -#define MACB_EXT_DESC
> -#endif
> -
>  #define MACB_GREGS_NBR 16
>  #define MACB_GREGS_VERSION 2
>  #define MACB_MAX_QUEUES 8
> @@ -824,7 +820,6 @@ struct macb_dma_desc {
>  	u32	ctrl;
>  };
>  
> -#ifdef MACB_EXT_DESC
>  #define HW_DMA_CAP_32B		0
>  #define HW_DMA_CAP_64B		(1 << 0)
>  #define HW_DMA_CAP_PTP		(1 << 1)
> @@ -839,7 +834,6 @@ struct macb_dma_desc_ptp {
>  	u32	ts_1;
>  	u32	ts_2;
>  };
> -#endif
>  
>  /* DMA descriptor bitfields */
>  #define MACB_RX_USED_OFFSET			0
> @@ -1319,9 +1313,7 @@ struct macb {
>  
>  	struct phy		*sgmii_phy;	/* for ZynqMP SGMII mode */
>  
> -#ifdef MACB_EXT_DESC
>  	uint8_t hw_dma_cap;
> -#endif
>  	spinlock_t tsu_clk_lock; /* gem tsu clock locking */
>  	unsigned int tsu_rate;
>  	struct ptp_clock *ptp_clock;
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index b32363ba1ec3be0fc42866c8585f0b465d178220..ad154cfe29106f642b32922fd4a03ca63112f4a7 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -98,6 +98,18 @@ struct sifive_fu540_macb_mgmt {
>  
>  #define MACB_MDIO_TIMEOUT	1000000 /* in usecs */
>  
> +static bool macb_dma_is_64b(struct macb *bp)
> +{
> +	return IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
> +	       bp->hw_dma_cap & HW_DMA_CAP_64B;
> +}
> +
> +static bool macb_dma_is_ptp(struct macb *bp)
> +{
> +	return IS_ENABLED(CONFIG_MACB_USE_HWSTAMP) &&
> +	       bp->hw_dma_cap & HW_DMA_CAP_PTP;
> +}
> +
>  /* DMA buffer descriptor might be different size
>   * depends on hardware configuration:
>   *
> @@ -127,56 +139,31 @@ struct sifive_fu540_macb_mgmt {
>   */
>  static unsigned int macb_dma_desc_get_size(struct macb *bp)
>  {
> -#ifdef MACB_EXT_DESC
> -	unsigned int desc_size;
> +	unsigned int desc_size = sizeof(struct macb_dma_desc);
> +
> +	if (macb_dma_is_64b(bp))
> +		desc_size += sizeof(struct macb_dma_desc_64);
> +	if (macb_dma_is_ptp(bp))
> +		desc_size += sizeof(struct macb_dma_desc_ptp);
>  
> -	switch (bp->hw_dma_cap) {
> -	case HW_DMA_CAP_64B:
> -		desc_size = sizeof(struct macb_dma_desc)
> -			+ sizeof(struct macb_dma_desc_64);
> -		break;
> -	case HW_DMA_CAP_PTP:
> -		desc_size = sizeof(struct macb_dma_desc)
> -			+ sizeof(struct macb_dma_desc_ptp);
> -		break;
> -	case HW_DMA_CAP_64B_PTP:
> -		desc_size = sizeof(struct macb_dma_desc)
> -			+ sizeof(struct macb_dma_desc_64)
> -			+ sizeof(struct macb_dma_desc_ptp);
> -		break;
> -	default:
> -		desc_size = sizeof(struct macb_dma_desc);
> -	}
>  	return desc_size;
> -#endif
> -	return sizeof(struct macb_dma_desc);
>  }
>  
>  static unsigned int macb_adj_dma_desc_idx(struct macb *bp, unsigned int desc_idx)
>  {
> -#ifdef MACB_EXT_DESC
> -	switch (bp->hw_dma_cap) {
> -	case HW_DMA_CAP_64B:
> -	case HW_DMA_CAP_PTP:
> -		desc_idx <<= 1;
> -		break;
> -	case HW_DMA_CAP_64B_PTP:
> -		desc_idx *= 3;
> -		break;
> -	default:
> -		break;
> -	}
> -#endif
> -	return desc_idx;
> +	if (macb_dma_is_64b(bp) && macb_dma_is_ptp(bp))
> +		return desc_idx * 3;
> +	else if (macb_dma_is_64b(bp) || macb_dma_is_ptp(bp))
> +		return desc_idx << 1;
> +	else
> +		return desc_idx;
>  }
>  
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>  static struct macb_dma_desc_64 *macb_64b_desc(struct macb *bp, struct macb_dma_desc *desc)
>  {
>  	return (struct macb_dma_desc_64 *)((void *)desc
>  		+ sizeof(struct macb_dma_desc));
>  }
> -#endif
>  
>  /* Ring buffer accessors */
>  static unsigned int macb_tx_ring_wrap(struct macb *bp, unsigned int index)
> @@ -500,17 +487,13 @@ static void macb_init_buffers(struct macb *bp)
>  
>  	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
>  		queue_writel(queue, RBQP, lower_32_bits(queue->rx_ring_dma));
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +		if (macb_dma_is_64b(bp))
>  			queue_writel(queue, RBQPH,
>  				     upper_32_bits(queue->rx_ring_dma));
> -#endif
>  		queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +		if (macb_dma_is_64b(bp))
>  			queue_writel(queue, TBQPH,
>  				     upper_32_bits(queue->tx_ring_dma));
> -#endif
>  	}
>  }
>  
> @@ -1038,10 +1021,9 @@ static void macb_tx_unmap(struct macb *bp, struct macb_tx_skb *tx_skb, int budge
>  
>  static void macb_set_addr(struct macb *bp, struct macb_dma_desc *desc, dma_addr_t addr)
>  {
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>  	struct macb_dma_desc_64 *desc_64;

This can be moved
>  
> -	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> +	if (macb_dma_is_64b(bp)) {

here.

>  		desc_64 = macb_64b_desc(bp, desc);
>  		desc_64->addrh = upper_32_bits(addr);
>  		/* The low bits of RX address contain the RX_USED bit, clearing
> @@ -1050,26 +1032,22 @@ static void macb_set_addr(struct macb *bp, struct macb_dma_desc *desc, dma_addr_
>  		 */
>  		dma_wmb();
>  	}
> -#endif
> +
>  	desc->addr = lower_32_bits(addr);
>  }
>  
>  static dma_addr_t macb_get_addr(struct macb *bp, struct macb_dma_desc *desc)
>  {
> -	dma_addr_t addr = 0;
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>  	struct macb_dma_desc_64 *desc_64;

Same for this one.

> +	dma_addr_t addr = 0;
>  
> -	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> +	if (macb_dma_is_64b(bp)) {
>  		desc_64 = macb_64b_desc(bp, desc);
>  		addr = ((u64)(desc_64->addrh) << 32);
>  	}
> -#endif
>  	addr |= MACB_BF(RX_WADDR, MACB_BFEXT(RX_WADDR, desc->addr));
> -#ifdef CONFIG_MACB_USE_HWSTAMP
> -	if (bp->hw_dma_cap & HW_DMA_CAP_PTP)
> +	if (macb_dma_is_ptp(bp))
>  		addr &= ~GEM_BIT(DMA_RXVALID);
> -#endif
>  	return addr;
>  }
>  
> @@ -1176,10 +1154,8 @@ static void macb_tx_error_task(struct work_struct *work)
>  
>  	/* Reinitialize the TX desc queue */
>  	queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -	if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +	if (macb_dma_is_64b(bp))
>  		queue_writel(queue, TBQPH, upper_32_bits(queue->tx_ring_dma));
> -#endif
>  	/* Make TX ring reflect state of hardware */
>  	queue->tx_head = 0;
>  	queue->tx_tail = 0;
> @@ -2349,11 +2325,9 @@ static netdev_tx_t macb_start_xmit(struct sk_buff *skb, struct net_device *dev)
>  		return ret;
>  	}
>  
> -#ifdef CONFIG_MACB_USE_HWSTAMP
> -	if ((skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) &&
> -	    (bp->hw_dma_cap & HW_DMA_CAP_PTP))
> +	if (macb_dma_is_ptp(bp) &&
> +	    (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP))
>  		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
> -#endif
>  
>  	is_lso = (skb_shinfo(skb)->gso_size != 0);
>  
> @@ -2813,14 +2787,10 @@ static void macb_configure_dma(struct macb *bp)
>  			dmacfg &= ~GEM_BIT(TXCOEN);
>  
>  		dmacfg &= ~GEM_BIT(ADDR64);
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> +		if (macb_dma_is_64b(bp))
>  			dmacfg |= GEM_BIT(ADDR64);
> -#endif
> -#ifdef CONFIG_MACB_USE_HWSTAMP
> -		if (bp->hw_dma_cap & HW_DMA_CAP_PTP)
> +		if (macb_dma_is_ptp(bp))
>  			dmacfg |= GEM_BIT(RXEXT) | GEM_BIT(TXEXT);
> -#endif
>  		netdev_dbg(bp->dev, "Cadence configure DMA with 0x%08x\n",
>  			   dmacfg);
>  		gem_writel(bp, DMACFG, dmacfg);
> @@ -4326,12 +4296,10 @@ static int macb_init(struct platform_device *pdev)
>  			queue->TBQP = GEM_TBQP(hw_q - 1);
>  			queue->RBQP = GEM_RBQP(hw_q - 1);
>  			queue->RBQS = GEM_RBQS(hw_q - 1);
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -			if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> +			if (macb_dma_is_64b(bp)) {
>  				queue->TBQPH = GEM_TBQPH(hw_q - 1);
>  				queue->RBQPH = GEM_RBQPH(hw_q - 1);
>  			}
> -#endif
>  		} else {
>  			/* queue0 uses legacy registers */
>  			queue->ISR  = MACB_ISR;
> @@ -4340,12 +4308,10 @@ static int macb_init(struct platform_device *pdev)
>  			queue->IMR  = MACB_IMR;
>  			queue->TBQP = MACB_TBQP;
>  			queue->RBQP = MACB_RBQP;
> -#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> -			if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> +			if (macb_dma_is_64b(bp)) {
>  				queue->TBQPH = MACB_TBQPH;
>  				queue->RBQPH = MACB_RBQPH;
>  			}
> -#endif
>  		}
>  
>  		/* get irq: here we use the linux queue index, not the hardware
> 


