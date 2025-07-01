Return-Path: <linux-mips+bounces-9597-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3009BAF0075
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 18:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 482554845D4
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 16:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1142827F73A;
	Tue,  1 Jul 2025 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wzp5qGce"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DBF27EFE2
	for <linux-mips@vger.kernel.org>; Tue,  1 Jul 2025 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388310; cv=none; b=WmnKmdl+tt50y809OpBG2/nvSJ7iEoi8mTGlNDsW9ZOZo9s+Lz9RjAL3HSFeUgsb3KX5qK0qVfLbunjUDZnmpcJCLr63e3EZtStWUgQmm2yfWsDyOD6p8dqQFMx1CSUVrdaSsBQOmtlmw1HW5YDzxED8lrH+2dSwx1T+dagSnYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388310; c=relaxed/simple;
	bh=GSh1yLctr/h7mt17iCABMV7donflOQ990q9vmjYKMeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0k7vuf63VxATJraNBHv5uaK+PhNSh8ZhLVB9GtjZqRXbQOXdU3KwudOj2ljy3qUU/gJnZZlkSiQNLC4vigytLTfcryLX5lzQ4wnUDxYBnHmYho4Xw1XaE6e0xIF88bdQIVmNq3h7uDE0f25hEGLzoJKEQmtBzkjjfnU16J6uJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wzp5qGce; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <34647b2e-3d9d-42db-9851-34ad8621af02@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751388303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdTOqogTp5JqM4b0+vAKcrKmgEFcq8WvFyC5EnR/3bg=;
	b=Wzp5qGceGGl95r7D/0lKItVPsPO6qNrVY7lEmWjLAGnLkqaIy2i+/rkJvKWAmC7S0fs0w0
	yTIWAk7S2uKU5znFYHxgjaUy2KY+6aBQepouQEfpE4CtempkqY8gkBezWqdM0GPVlkJYWK
	sD7ARAAqL74oHVw5FGR3QlI77hxl8ig=
Date: Tue, 1 Jul 2025 12:44:55 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 13/18] net: macb: avoid double endianness swap
 in macb_set_hwaddr()
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
 <20250627-macb-v2-13-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-13-ff8207d0bb77@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/27/25 05:08, Théo Lebrun wrote:
> writel() does a CPU->LE conversion. Drop manual cpu_to_le*() calls.
> 
> On little-endian system:
>  - cpu_to_le32() is a no-op (LE->LE),
>  - writel() is a no-op (LE->LE),
>  - dev_addr will therefore not be swapped and written as-is.
> 
> On big-endian system:
>  - cpu_to_le32() is a swap (BE->LE),
>  - writel() is a swap (BE->LE),
>  - dev_addr will therefore be swapped twice and written as a BE value.
> 
> This was found using sparse:
>    ⟩ make C=2 drivers/net/ethernet/cadence/macb_main.o
>    warning: incorrect type in assignment (different base types)
>       expected unsigned int [usertype] bottom
>       got restricted __le32 [usertype]
>    warning: incorrect type in assignment (different base types)
>       expected unsigned short [usertype] top
>       got restricted __le16 [usertype]
>    ...
> 
> Fixes: 89e5785fc8a6 ("[PATCH] Atmel MACB ethernet driver")
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 578e72c7727d4f578478ff2b3d0a6316327271b1..34223dad2d01ae4bcefc0823c868a67f59435638 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -265,9 +265,9 @@ static void macb_set_hwaddr(struct macb *bp)
>  	u32 bottom;
>  	u16 top;
>  
> -	bottom = cpu_to_le32(*((u32 *)bp->dev->dev_addr));
> +	bottom = *((u32 *)bp->dev->dev_addr);
>  	macb_or_gem_writel(bp, SA1B, bottom);
> -	top = cpu_to_le16(*((u16 *)(bp->dev->dev_addr + 4)));
> +	top = *((u16 *)(bp->dev->dev_addr + 4));>  	macb_or_gem_writel(bp, SA1T, top);
>  
>  	if (gem_has_ptp(bp)) {
> 

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

