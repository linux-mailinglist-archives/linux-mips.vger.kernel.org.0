Return-Path: <linux-mips+bounces-10043-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673B9B1DB58
	for <lists+linux-mips@lfdr.de>; Thu,  7 Aug 2025 18:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F51662500A
	for <lists+linux-mips@lfdr.de>; Thu,  7 Aug 2025 16:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294B826D4C0;
	Thu,  7 Aug 2025 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="anXpfStW"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2781400C;
	Thu,  7 Aug 2025 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754583092; cv=none; b=EKyjTx/2i2b+hWelrq1DF0PMzY73BRCPslCoDvH+opItViY6fZDK3/dA2I1TgdzJMjrHSe4ot5JIFsKweKtpf48FSWr+8y/Q9pBe+ijfqPE+y0n8m6QNLZ1atCfKrKShiCGoNtKtXXOQjKETT/5s7HVw7PVqGaWmXXCT/iuwLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754583092; c=relaxed/simple;
	bh=OV71OFYnOLI46OevvCJHarY8VZ1cMrOOOvfhQ2D4QYA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=UVc7YTSA55CSu1oNfrSBU/lTbj7ZJGCO1Z4+lX9ihRoumqiU3ozIJj9o6e8voG0FqUT1dbHRat6FHw0l8bBZ6o6RvHsq8SjbCxcyxbvyi1zbyOns3a5DGMjP+zih1SqRmklDcuibu7wusTPKAFGGlPeduk8BQg94ZkTpuIQk5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=anXpfStW; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81832442F6;
	Thu,  7 Aug 2025 16:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754583087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZKIWF9npEkKZLlXfX/TxHBsvndAZLC7cFR8tTMLusA=;
	b=anXpfStWtQaVGcjeVkSrKGaRYMcwhCu6SGubJHwi676xFy+IfLlGDAxmSNpLg+ldHctrqi
	tKoZKqXmvlZ73jQrVM1mC5cjDOVuL1PAsby26oO8b/w4bRLWdosvnIu5kf7QyYmDTXaV6/
	mCa474mjGmB60FjEIirliBXL8JQNPKGTc5jL0nBrODB38VvM1wSQnmQQfn/lYZQn4l9gV0
	7kBHY91KVPIwoJsnaoRsLW2p2d7ccF+sIokmXV91DvqDPTuJYzon5I70p85K0nZ2AgR65e
	8DqgAB4w7oVVZc+wOntYAppe6xL0fnOK0QqJAkhYQ6uyLVUfvVzFK6PgrQMwtw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Aug 2025 18:11:23 +0200
Message-Id: <DBWBSL7Q35M2.2WWW5HKBHKUA5@bootlin.com>
Cc: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Jiaxun Yang" <jiaxun.yang@flygoat.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
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
Subject: Re: [PATCH net-next v2 16/18] MIPS: mobileye: add EyeQ5 DMA IOCU
 support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-16-ff8207d0bb77@bootlin.com>
 <984c1bea-7020-4121-9fea-7d657a5e8da1@app.fastmail.com>
In-Reply-To: <984c1bea-7020-4121-9fea-7d657a5e8da1@app.fastmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefvhffuofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeigfelffeuffetteetuddufffghefhudeuteeigeekteevgeeileejgfdvffelheenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnv
 ghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Jiaxun,

On Mon Jun 30, 2025 at 3:35 PM CEST, Jiaxun Yang wrote:
> =E5=9C=A82025=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=
=E5=8D=8810:09=EF=BC=8CTh=C3=A9o Lebrun=E5=86=99=E9=81=93=EF=BC=9A
>> Both Cadence GEM Ethernet controllers on EyeQ5 are hardwired through CM3
>> IO Coherency Units (IOCU). For DMA coherent accesses, BIT(36) must be
>> set in DMA addresses.
>
> Just quick question, it seems like this special driver is only applying a
> fixed offset (1 << 36) to the DMA physical address, can we achieve that w=
ith dma-ranges
> property in DeviceTree?
>
> I belive:
> ```
> dma-coherent;
>              # Bus addr       # Phys  # Size
> dma-ranges =3D <0x10 0x00000000 0x0 0x0 0x10 0>;
> ```
>
> Will do the job.

This is perfect! Can confirm it works just fine. When you are stuck in
an issue for too long you don't think about broadening your viewpoint.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


