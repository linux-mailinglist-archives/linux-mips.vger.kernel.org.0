Return-Path: <linux-mips+bounces-10041-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5207B1DA5E
	for <lists+linux-mips@lfdr.de>; Thu,  7 Aug 2025 16:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701B762075C
	for <lists+linux-mips@lfdr.de>; Thu,  7 Aug 2025 14:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901C8248867;
	Thu,  7 Aug 2025 14:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dc460t1D"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5D033086;
	Thu,  7 Aug 2025 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754578121; cv=none; b=bEF0EjoeqmVkFHCam5OrZe4yD9Tat9wh5x1Yt5LcBGh+6ymbVqWWLFDJt6kw0jTQTgx/Zm7MUFH0wQvATtYMzGs7NSFh/dvciAmfDW4UZOg6ECdx8ZXPzddLDooKsSnKgonbuO35sedWbZtdXINMWhJeEd3W9FHQyz6sURrlkZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754578121; c=relaxed/simple;
	bh=Fh5Ixr2mw08FiVNp1PHoL2g/L2km494MqXVDRGlCZmY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FtyrnSCe4ECJaHZE+VTxLf1SU4QERBlWwHJY0dftxLsf/QVV8TW9otDlwu8vqGE7kd/s+6FPl/cO+MaPce1VjzXG9GYu3nXYmmuDfOdlI9S9AjEGVal3dcrqrfGULJC0H8K5Uy79ftakb9XVoZyhWuXvqF4xondYqoBoO3vzPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dc460t1D; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B93CD43136;
	Thu,  7 Aug 2025 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754578111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Msx94y0SDrajFtd2r5knNPPeel3I8uSUHF21B2iumHI=;
	b=dc460t1DfGOwUj8YDJJbl4IqqZwtR9DPwyVzAEZjO1BmD4IALnt9rVUR0N8M6ffKVISYec
	VLw9G2Q1DAkfQHSMoh1CUvuTR2sJTT3eGZq/HhFXqyYLXlYdfzBrhvtt5TRMvsrW+CizNX
	6A1ITZA2AANUIfe25Maz/wa82byPK0azaXkXcocxW+RBEg/+aDUYYEhtYbcoCWE1Pmy/G4
	BYA0crnBsJSgCOL+0oPas1vB9tBGT1JcIQjizCg0FeCdWtyb1ftSl9fWo/DfQleqstIVGc
	oMnxdfWFw9ofzVmfKLJo3gvW5Qi4FiMPtQv06OkfQALcxB/9TQrIvrAbpWO7zQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Aug 2025 16:48:27 +0200
Message-Id: <DBWA12ZND9TY.2SA3R9T5UJTZR@bootlin.com>
Subject: Re: [PATCH net-next v2 11/18] net: macb: single
 dma_alloc_coherent() for DMA descriptors
Cc: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Sean Anderson" <sean.anderson@linux.dev>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Richard Cochran" <richardcochran@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Cyrille Pitchen"
 <cyrille.pitchen@atmel.com>, "Harini Katakam" <harini.katakam@xilinx.com>,
 "Rafal Ozieblo" <rafalo@cadence.com>, "Haavard Skinnemoen"
 <hskinnemoen@atmel.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-11-ff8207d0bb77@bootlin.com>
 <7752e805-0a06-46ed-b4ac-a51081a73f78@linux.dev>
In-Reply-To: <7752e805-0a06-46ed-b4ac-a51081a73f78@linux.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehsvggrnhdrrghnuggvrhhsohhnsehlihhnuhigrdguvghvpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnv
 ghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg

Hello Sean,

Thanks for the review! I'll reply only to questions (or comments about
which I have questions).

On Tue Jul 1, 2025 at 6:32 PM CEST, Sean Anderson wrote:
> On 6/27/25 05:08, Th=C3=A9o Lebrun wrote:
>> Move from two (Tx/Rx) dma_alloc_coherent() for DMA descriptor rings *per
>> queue* to two dma_alloc_coherent() overall.
>>=20
>> Issue is with how all queues share the same register for configuring the
>> upper 32-bits of Tx/Rx descriptor rings. For example, with Tx, notice
>> how TBQPH does *not* depend on the queue index:
>>=20
>> 	#define GEM_TBQP(hw_q)		(0x0440 + ((hw_q) << 2))
>> 	#define GEM_TBQPH(hw_q)		(0x04C8)
>>=20
>> 	queue_writel(queue, TBQP, lower_32_bits(queue->tx_ring_dma));
>> 	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>> 	if (bp->hw_dma_cap & HW_DMA_CAP_64B)
>> 		queue_writel(queue, TBQPH, upper_32_bits(queue->tx_ring_dma));
>> 	#endif
>>=20
>> To maxime our chances of getting valid DMA addresses, we do a single
>
> maximize
>
>> dma_alloc_coherent() across queues.
>
> Is there really any chance involved (other than avoiding ENOMEM)?

If we land in the the page allocator codepath of dma_alloc_coherent(),
then we get natural alignment guarantees, see alloc_pages() comment [0].

[0]: https://elixir.bootlin.com/linux/v6.16/source/mm/mempolicy.c#L2499-L25=
02

However, we cannot be certain we land in that path. If we have an
IOMMU, then I don't think the API provides strong enough guarantees.

Same for custom `struct dma_map_ops`, be it per-device or arch-specific.
I am not aware (is anything documented on that?) of any alignment
guarantees.

Even if those give us page-aligned allocations, that isn't enough. For
example let's say we want 256KiB. We get 0xFFFF0000 from an allocator.
That is page aligned, but:

   upper_32_bits(START)      !=3D upper_32_bits(START + SIZE - 1)
   upper_32_bits(0xFFFF0000) !=3D upper_32_bits(0xFFFF0000 + 0x40000 - 1)
   0x0                       !=3D 0x1

Thanks!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


