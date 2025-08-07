Return-Path: <linux-mips+bounces-10042-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC897B1DAF0
	for <lists+linux-mips@lfdr.de>; Thu,  7 Aug 2025 17:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BDD162795E
	for <lists+linux-mips@lfdr.de>; Thu,  7 Aug 2025 15:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A158426A09F;
	Thu,  7 Aug 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PTYDDxAi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F71262FE6;
	Thu,  7 Aug 2025 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754581481; cv=none; b=I+LiHAXXqixC1uaV0k2DJ6GF6ztthyAF/hq5PDAqipkjHWrCtcgY9QGF6jB/bcN6g58T8oTebAVHViyVw932kS91HHFEHLqZCndoizmLWZGcCCumvsChzlZKz23E4oO/aEHj5nrie85/KtMSmOnhNYC/aO25yTROVJYq4RxNQZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754581481; c=relaxed/simple;
	bh=THm1SoEjdEMZZ7ysWdC8VuJNdis7fSw145Sks0ZuOMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dFPBVG+1yut28bDbR9srMQStUJDjsGxWa0Uf1/NZpCDZM3s5xz69iAgCM1iOcuM0a9V69+Xfv2IUbqgnsHeJ+1uGLdO4VC7nHRmW0tTS6/kA1HjVaXvxsPCA2qYajJP6A2fvEB4eYX5fq8xJAIoUb6qZKUfV9c9uolAVffKOoRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PTYDDxAi; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id E2094580FE0;
	Thu,  7 Aug 2025 15:24:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7485D442C7;
	Thu,  7 Aug 2025 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754580256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THm1SoEjdEMZZ7ysWdC8VuJNdis7fSw145Sks0ZuOMk=;
	b=PTYDDxAiEqhcHNXakvzEAxIEHtOYnZg0O4FZmg+lsrI3Kn0+/Bup9nOQLSwIjEuQ74IbDk
	v0Y4OmGGsVrpxb7SxSr0kE8n6MHXpPx0drRvkgtC0H5+6YpNE2K4iM3W0IrCR4FqtxXe/3
	lvqGvaSsShseE/yzIXQvAsl9IpHOpc7XH+FNd7yGvE0o/UzD+sP73DN4yqsIcN598td+BA
	9wGEewScVY9ZVVHA5gXjogHYetiBg21SOGk65rONj+2d1989bg7n/32xRMm3cF1vGmDkn4
	Vn5hsAPPVdGu+daHKdj0yFYdc/je+xtTN5JrVh+Kr5l52rgKZ94cuB8XiD9z6g==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Aug 2025 17:24:13 +0200
Message-Id: <DBWASGS8U4LN.1GMHL8A61VWU8@bootlin.com>
Subject: Re: [PATCH net-next v2 12/18] net: macb: match skb_reserve(skb,
 NET_IP_ALIGN) with HW alignment
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
 <20250627-macb-v2-12-ff8207d0bb77@bootlin.com>
 <1a4fe95a-f029-43b2-aed1-594365254b6a@linux.dev>
In-Reply-To: <1a4fe95a-f029-43b2-aed1-594365254b6a@linux.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehsvggrnhdrrghnuggvrhhsohhnsehlihhnuhigrdguvghvpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnv
 ghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

On Tue Jul 1, 2025 at 6:40 PM CEST, Sean Anderson wrote:
> On 6/27/25 05:08, Th=C3=A9o Lebrun wrote:
>> If HW is RSC capable, it cannot add dummy bytes at the start of IP
>
> Receive-side coalescing? Can you add a brief description of this
> feature to your commit message?

Yes that is Receive Side Coalescing. Clearly it needs to be mentioned
out loud, and briefly described.

>> packets. Alignment (ie number of dummy bytes) is configured using the
>> RBOF field inside the NCFGR register.
>>=20
>> On the software side, the skb_reserve(skb, NET_IP_ALIGN) call must only
>> be done if those dummy bytes are added by the hardware; notice the
>> skb_reserve() is done AFTER writing the address to the device.
>>=20
>> We cannot do the skb_reserve() call BEFORE writing the address because
>> the address field ignores the low 2/3 bits. Conclusion: in some cases,
>> we risk not being able to respect the NET_IP_ALIGN value (which is
>> picked based on unaligned CPU access performance).
>>=20
>> Fixes: 4df95131ea80 ("net/macb: change RX path for GEM")
>
> Do any existing MACBs support RSC? Is this a fix?=20

I have no idea. If any MACB supports RSC, it must be those running with
NET_IP_ALIGN=3D0, so arm64/powerpc/x86.

Is it a fix? We can guess that all boards fall in either category:
 - Don't support RSC (=3D> RBOF works fine).
 - Support RSC (=3D> RBOF not working) AND NET_IP_ALIGN=3D0.

Both of those are not impacted, so we technically don't fix anything for
current users.

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


