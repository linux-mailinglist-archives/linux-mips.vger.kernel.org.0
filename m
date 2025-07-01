Return-Path: <linux-mips+bounces-9588-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A1AEFE86
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 17:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45F191BC3495
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 15:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBC82309B0;
	Tue,  1 Jul 2025 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HZW+nI2M"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB362274B58
	for <linux-mips@vger.kernel.org>; Tue,  1 Jul 2025 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384136; cv=none; b=tM4Of71BnG35+VmQsORqDcRRo3K4Ij86WQ1hl/EXhU40djlN7TR60XvfaFd1eOq2OW8yS6+t5S+Ng9lK6ZaygQBDXwQs2bmlTiR6lzRFacXXDwlPuqxQXrzNyt2XWyZFH7F+/kc73nurdlIXq0NNJfpvEAMG3/YhdBUOj66TZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384136; c=relaxed/simple;
	bh=Dpe36OfClugyKwIMcaBC3dcK7aOGRu8qtIlgMAQ+2ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTmzU9ph3hgTsPZUR8/bP8OyAsRvoz/hpDkMP5HOScFC1RS4fugb22ekecS9paxYaNYse7m+/p3gamiFYreETr7Y6MI8s+Nt0gTqxuRiZ+gwNLG/0rxny+ap4lSWyTnK9XS99k+ADtO04lu0VaGEvt2EMrybROp4pN3RN2y70Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HZW+nI2M; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <fd88c994-c4f0-4ba1-bc8a-908cfb3b5498@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751384121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+INSP/GK6T+8bv6Vx93kwG7+YR+IlBFm0hRiAEEEXmI=;
	b=HZW+nI2MTAledHyxlbBKwh7aSa9Lm5EiIUfLAfvH9NMJgPJieoRCcoNNRHtX3e+mw71sFd
	4NOewdCxEfciPMKGTCz8e/Yg7H/3mHMEyWf20a0ZlW8cmuQ90oufqHW7gZk6d8Sw7M25gv
	TQpuKFw/O3FnJLya2Tl1WY3AHBRcnbc=
Date: Tue, 1 Jul 2025 11:35:10 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 05/18] net: macb: use BIT() macro for
 capability definitions
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
 <20250627-macb-v2-5-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-5-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/27/25 05:08, Théo Lebrun wrote:
> Replace all capabilities values by calls to the BIT() macro.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb.h | 40 ++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> index c9a5c8beb2fa8166195d1d83f187d2d0c62668a8..3b43cb9468e3618754ff2bc6c5f360447bdeeed0 100644
> --- a/drivers/net/ethernet/cadence/macb.h
> +++ b/drivers/net/ethernet/cadence/macb.h
> @@ -727,26 +727,26 @@
>  #define MACB_MAN_C45_CODE			2
>  
>  /* Capability mask bits */
> -#define MACB_CAPS_ISR_CLEAR_ON_WRITE		0x00000001
> -#define MACB_CAPS_USRIO_HAS_CLKEN		0x00000002
> -#define MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII	0x00000004
> -#define MACB_CAPS_NO_GIGABIT_HALF		0x00000008
> -#define MACB_CAPS_USRIO_DISABLED		0x00000010
> -#define MACB_CAPS_JUMBO				0x00000020
> -#define MACB_CAPS_GEM_HAS_PTP			0x00000040
> -#define MACB_CAPS_BD_RD_PREFETCH		0x00000080
> -#define MACB_CAPS_NEEDS_RSTONUBR		0x00000100
> -#define MACB_CAPS_MIIONRGMII			0x00000200
> -#define MACB_CAPS_NEED_TSUCLK			0x00000400
> -#define MACB_CAPS_QUEUE_DISABLE			0x00000800
> -#define MACB_CAPS_PCS				0x01000000
> -#define MACB_CAPS_HIGH_SPEED			0x02000000
> -#define MACB_CAPS_CLK_HW_CHG			0x04000000
> -#define MACB_CAPS_MACB_IS_EMAC			0x08000000
> -#define MACB_CAPS_FIFO_MODE			0x10000000
> -#define MACB_CAPS_GIGABIT_MODE_AVAILABLE	0x20000000
> -#define MACB_CAPS_SG_DISABLED			0x40000000
> -#define MACB_CAPS_MACB_IS_GEM			0x80000000
> +#define MACB_CAPS_ISR_CLEAR_ON_WRITE		BIT(0)
> +#define MACB_CAPS_USRIO_HAS_CLKEN		BIT(1)
> +#define MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII	BIT(2)
> +#define MACB_CAPS_NO_GIGABIT_HALF		BIT(3)
> +#define MACB_CAPS_USRIO_DISABLED		BIT(4)
> +#define MACB_CAPS_JUMBO				BIT(5)
> +#define MACB_CAPS_GEM_HAS_PTP			BIT(6)
> +#define MACB_CAPS_BD_RD_PREFETCH		BIT(7)
> +#define MACB_CAPS_NEEDS_RSTONUBR		BIT(8)
> +#define MACB_CAPS_MIIONRGMII			BIT(9)
> +#define MACB_CAPS_NEED_TSUCLK			BIT(10)
> +#define MACB_CAPS_QUEUE_DISABLE			BIT(11)
> +#define MACB_CAPS_PCS				BIT(24)
> +#define MACB_CAPS_HIGH_SPEED			BIT(25)
> +#define MACB_CAPS_CLK_HW_CHG			BIT(26)
> +#define MACB_CAPS_MACB_IS_EMAC			BIT(27)
> +#define MACB_CAPS_FIFO_MODE			BIT(28)
> +#define MACB_CAPS_GIGABIT_MODE_AVAILABLE	BIT(29)
> +#define MACB_CAPS_SG_DISABLED			BIT(30)
> +#define MACB_CAPS_MACB_IS_GEM			BIT(31)
>  
>  /* LSO settings */
>  #define MACB_LSO_UFO_ENABLE			0x01
> 

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

But since these capabilities don't correspond to hardware registers, can
you add a follow-up patch to remove the gap between QUEUE_DISABLE and
PCS?

