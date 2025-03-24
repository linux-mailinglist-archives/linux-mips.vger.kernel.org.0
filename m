Return-Path: <linux-mips+bounces-8335-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F047A6E1E0
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 18:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3F263B6EA1
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 17:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E3F264A89;
	Mon, 24 Mar 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ILdBPfBw"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F0A264A7C;
	Mon, 24 Mar 2025 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742838554; cv=none; b=FrsLiaFnQ7/6UAlyEE10ssk614KPGXYE3slrBtEL+yyz0vfPtwRzj6l+ID9cHqVQ/iCLay2PbRPejYpFyr9UYT5IZbVtX6zFs1GW3VTXBkiWnno1Bs3taL3JuD/VQIcOXg89/sOzcKZ1JvvikDZF4FWIPwYvd9/3bKuSsl2v4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742838554; c=relaxed/simple;
	bh=zehG0hVjOYg1/tDV+yvNPZobIUe5t9ArdAqwSYUqvIE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=h+gBB2xMitY8I7/dwAfPSQV1In4yvIddHxpN5CLtPZofurrz1ET7ZcAqj10efseLrrMQ1SOkSC+aVoSjRtNXUY18KPfMzzTZnDQWElwHUOWWVA6jU4VD9ndwqFk2zSjlgXVmyLTLO6QGcClfQoAqBXqYy93OfcCVgxzeT0JHdJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ILdBPfBw; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 763A944346;
	Mon, 24 Mar 2025 17:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742838549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1co+hewvkHIAplFR3edQapFDqNXgn6Qh8Bh0s6Wls8=;
	b=ILdBPfBwjDB6/i9FTF9i30HeNSmixqDNKdGblbcS4i9t2sLXeOp5FG+QgyOU32qSB1+F5F
	7G9rkeO90zADgQ+rnU1dOgtm8+YfOPYu9jpY0t+YCXHScFmZ0BH/4JrjrLQ3LmKwidjHId
	HR4OZKF6V00ajD3rHljdQxoMe5mlenxUy2lZfuefwBTKvp0fcmf1kg3ufCziKCgCnpSYGj
	8U1BbgfQ9S3DEQNsyS42/gkGUXtf8M2dsl5l8DEesVi2FDdIuJbnqVm30On3W4Yn12maU9
	L3BKaUnAld55T2YJog8v6Ui8vpsf+mfvkvXMu29AdhG8qNA4Jbz3o3Gh5QDDNw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 18:49:05 +0100
Message-Id: <D8OOPAXK16CI.3TE75O760JRSL@bootlin.com>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Samuel Holland" <samuel.holland@sifive.com>,
 "Richard Cochran" <richardcochran@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-mips@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Andrew Lunn" <andrew@lunn.ch>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 07/13] net: macb: move HW IP alignment value to
 macb_config
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-7-537b7e37971d@bootlin.com>
 <45b3e613-90c6-4499-b50b-383106172184@lunn.ch>
In-Reply-To: <45b3e613-90c6-4499-b50b-383106172184@lunn.ch>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefvhffuofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfelffeuffetteetuddufffghefhudeuteeigeekteevgeeileejgfdvffelheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpr
 ggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Andrew,

On Fri Mar 21, 2025 at 10:06 PM CET, Andrew Lunn wrote:
> On Fri, Mar 21, 2025 at 08:09:38PM +0100, Th=C3=A9o Lebrun wrote:
>> The controller does IP alignment (two bytes).
>
> I'm a bit confused here. Is this hard coded, baked into the silicon?
> It will always do IP alignment? It cannot be turned off?

Yes, the alignment is baked inside the silicon.
I looked but haven't seen any register to configure the alignment.

Sorry the commit message isn't clear, it needs improvements.

>> 	skb_reserve(skb, NET_IP_ALIGN);
>
> Why not just replace this with
>
>         skb_reserve(skb, 2);

On arm64, NET_IP_ALIGN=3D0. I don't have HW to test, but the current code
is telling us that the silicon doesn't do alignment on those:

   skb =3D netdev_alloc_skb(...);
   paddr =3D dma_map_single(..., skb->data, ...);
   macb_set_addr(..., paddr);

   // arm   =3D> NET_IP_ALIGN=3D2 =3D> silicon does alignment
   // arm64 =3D> NET_IP_ALIGN=3D0 =3D> silicon doesn't do alignment
   skb_reserve(skb, NET_IP_ALIGN);

The platform we introduce is the first one where the silicon alignment
(0 bytes) is different from the NET_IP_ALIGN value (MIPS, 2 bytes).

Does that clarify things?

>> The NET_IP_ALIGN value is arch-dependent and picked based on unaligned
>> CPU access performance. The hardware alignment value should be
>> compatible-specific rather than arch-specific. Offer a path forward by
>> adding a hw_ip_align field inside macb_config.
>>=20
>> Values for macb_config->hw_ip_align are picked based on upstream
>> devicetrees:
>>=20
>>     Compatible             |  DTS folders              |  hw_ip_align
>>    ------------------------|---------------------------|----------------
>>    cdns,at91sam9260-macb   | arch/arm/                 | 2
>>    cdns,macb               | arch/{arm,riscv}/         | NET_IP_ALIGN
>>    cdns,np4-macb           | NULL                      | NET_IP_ALIGN
>>    cdns,pc302-gem          | NULL                      | NET_IP_ALIGN
>>    cdns,gem                | arch/{arm,arm64}/         | NET_IP_ALIGN
>>    cdns,sam9x60-macb       | arch/arm/                 | 2
>>    atmel,sama5d2-gem       | arch/arm/                 | 2
>>    atmel,sama5d29-gem      | arch/arm/                 | 2
>>    atmel,sama5d3-gem       | arch/arm/                 | 2
>>    atmel,sama5d3-macb      | arch/arm/                 | 2
>>    atmel,sama5d4-gem       | arch/arm/                 | 2
>>    cdns,at91rm9200-emac    | arch/arm/                 | 2
>>    cdns,emac               | arch/arm/                 | 2
>>    cdns,zynqmp-gem         | *same as xlnx,zynqmp-gem* | 0
>>    cdns,zynq-gem           | *same as xlnx,zynq-gem*   | 2
>>    sifive,fu540-c000-gem   | arch/riscv/               | 2
>>    microchip,mpfs-macb     | arch/riscv/               | 2
>>    microchip,sama7g5-gem   | arch/arm/                 | 2
>>    microchip,sama7g5-emac  | arch/arm/                 | 2
>>    xlnx,zynqmp-gem         | arch/arm64/               | 0
>>    xlnx,zynq-gem           | arch/arm/                 | 2
>>    xlnx,versal-gem         | NULL                      | NET_IP_ALIGN
>
> I don't remember seeing any other driver doing anything like
> this. That often means it is wrong....

Good question, let's look at skb_reserve() that follow dma_map_single():

   =E2=9F=A9 git grep -A20 dma_map_single drivers/net/ethernet/ | \
      rg skb_reserve | grep -v macb_main
   drivers/net/ethernet/sun/sunbmac.c:          skb_reserve(copy_skb, 2);
   drivers/net/ethernet/sun/sunhme.c:           skb_reserve(skb, RX_OFFSET)=
;
   drivers/net/ethernet/sun/sunhme.c:           skb_reserve(new_skb, RX_OFF=
SET);
   drivers/net/ethernet/sgi/ioc3-eth.c:         skb_reserve(new_skb, RX_OFF=
SET);
   drivers/net/ethernet/chelsio/cxgb/sge.c:     skb_reserve(skb, sge->rx_pk=
t_pad);
   drivers/net/ethernet/marvell/mv643xx_eth.c:  skb_reserve(skb, 2);
   drivers/net/ethernet/dec/tulip/de2104x.c:    skb_reserve(copy_skb, RX_OF=
FSET);
   drivers/net/ethernet/marvell/pxa168_eth.c:   skb_reserve(skb, ETH_HW_IP_=
ALIGN);
   drivers/net/ethernet/alacritech/slicoss.c:   skb_reserve(skb, offset);
   drivers/net/ethernet/toshiba/tc35815.c:      skb_reserve(skb, 2); /* mak=
e IP header 4byte aligned */
   drivers/net/ethernet/lantiq_etop.c:          skb_reserve(ch->skb[ch->dma=
.desc], NET_IP_ALIGN);

Out of those, two are using dynamic values:

   // In drivers/net/ethernet/chelsio/cxgb/sge.c
   // The value comes from [0]:
   sge->rx_pkt_pad =3D t1_is_T1B(adapter) ? 0 : 2;
   // The macro resolves to something like [1]:
   adap->params.chip_version =3D=3D CHBT_TERM_T1 && adap->params.chip_revis=
ion =3D=3D TERM_T1B

   // In drivers/net/ethernet/alacritech/slicoss.c
   // In slic_refill_rx_queue() [2]
   /* ensure head buffer descriptors are 256 byte aligned */
   offset =3D 0;
   misalign =3D paddr & ALIGN_MASK;
   if (misalign) {
      offset =3D SLIC_RX_BUFF_ALIGN - misalign;
      skb_reserve(skb, offset);
   }

Conclusion:
 - one is HW revision dependent,
 - the other knows that HW always aligns its buffer to 256.

We aren't alone, but pretty lonely.

Maybe I missed a common denominator that could be used to identify
compatibles that do or do not have hardcoded alignemnt. Without such
info, the approach taken (have alignment stored inside match data)
sounds reasonable to me.

Do you agree?

Thanks,

[0]: https://elixir.bootlin.com/linux/v6.13.7/source/drivers/net/ethernet/c=
helsio/cxgb/sge.c#L2106
[1]: https://elixir.bootlin.com/linux/v6.13.7/source/drivers/net/ethernet/c=
helsio/cxgb/common.h#L292-L299
[2]: https://elixir.bootlin.com/linux/v6.13.7/source/drivers/net/ethernet/a=
lacritech/slicoss.c#L418-L424

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


