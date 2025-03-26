Return-Path: <linux-mips+bounces-8371-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28BBA7152E
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 11:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD8816AE80
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 10:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ACF1D8E01;
	Wed, 26 Mar 2025 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FUGEgc/7"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A971C8606;
	Wed, 26 Mar 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742986763; cv=none; b=gz4SnmCQbnBpM5jxEgWpcJoCkr7RmVpqrXIYjfMeCxlHuPCl7v0P0df5pa3Y8AhPjv0pTJzW9+W6sEd7REu8HnFGKUMPScwVkD8PAbGmiYd4g5KFIYI8in/jePa2A8FPWwNUXd+8waeBo9Z/MiMlyUe19opuzIvTwcxEJokv+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742986763; c=relaxed/simple;
	bh=xM0pKJ8sRe+w6GWU9I1Dy+FTjnKA3yceusf+jKEC0+A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=K/QrADEqdLeFh7nr9vymLCy7o0HfSkXMQzgMHwQ7fp/PxHX8jGRlgu4sG/GIlT4ixMwZ1r3O/Bs66XHVZMuJeWMukO+mpZyE5e2582yxJBwPz4sw5z3Tm+biyfyDl1tCR0LQOHA5Fof3eeU3c4LqNlrTTL0sVfY9hzPviDQgxms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FUGEgc/7; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 080264435E;
	Wed, 26 Mar 2025 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742986758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t5QSc/Inlh5P0gL04QSWLOfREn/t3CkeGZkKLYdjDE=;
	b=FUGEgc/7iedXlqTTbqAcAA02XV8B6oh9Y7Bqm+fFLGpWd49hbrCIc0l/Bom4tRDfAdpfxN
	C+mSXaVZjS8viJztlY0tp1Jmw0hvhW/1ceZPdb5wiGtYc1je6aAFI5TiHdO+P9FJKmRmfx
	eWncdS7EimoRYsZHB++4IT3E0MlwDx4w9Fe5zz49duRxQWN0qvat+MtfFrTz2J8U2Xd7HU
	Hc/jtwjqt9d5o94wNdn1lcwKBr/jAF9Kb1AcdXPCVatvLn8mKVBVsKR/p4LNlXi6/kl63Q
	qxddGv2E69HVgUqlyM1jbWK1dNqK8asjSsiq1ina4MTDSp9PAqFA/y2O6mk2EA==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Mar 2025 11:59:13 +0100
Message-Id: <D8Q58KMGV4R4.ELW8TLEK5W5V@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next 08/13] net: macb: introduce DMA descriptor
 helpers (is 64bit? is PTP?)
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
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-8-537b7e37971d@bootlin.com>
 <20250324095522.2ab1c38b@fedora.home>
In-Reply-To: <20250324095522.2ab1c38b@fedora.home>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffuvefvofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeluefgiefgtdegfeehjeetteevveejkefgiedtkeefteejgfdvkeffgeejhfduieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Maxime,

On Mon Mar 24, 2025 at 9:55 AM CET, Maxime Chevallier wrote:
> On Fri, 21 Mar 2025 20:09:39 +0100
> Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wrote:
>
>> Introduce macb_dma_is_64b() and macb_dma_is_ptp() helper functions.
>> Many codepaths are made simpler by dropping conditional compilation.
>>=20
>> This implies three changes:
>>  - Always compile related structure definitions inside <macb.h>.
>>  - Make the field hw_dma_cap in struct macb always present.
>>  - MACB_EXT_DESC can be dropped as it is useless now.
>>=20
>> The common case is:
>>=20
>> 	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
>> 		struct macb_dma_desc_64 *desc_64;
>> 		if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
>> 			desc_64 =3D macb_64b_desc(bp, desc);
>> 			// ...
>> 		}
>> 	#endif
>>=20
>> And replaced by:
>>=20
>> 	struct macb_dma_desc_64 *desc_64;
>> 	if (macb_dma_is_64b(bp)) {
>> 		desc_64 =3D macb_64b_desc(bp, desc);
>> 		// ...
>> 	}
>
> Just a thought, but this is adding some more branches in the hotpath on
> 32 bits DMA setups. Did you measure any performance changes on
> these platforms (if you have access to one :) )
>
> As the caps can't be changed dynamically, maybe these helpers could be
> replaced more efficiently with some static_key ? This would benefit
> both 32 and 64 bits systems as the following would be more efficient
>
> 	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> 		//  ...
> 	}
>
> Just a thought of course, maybe this patch doesn't really hurt perfs :)

Good question! I asked myself the same thing before posting.

We go from:

	void bar(struct macb *bp) {
	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
		if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
			foo();
		}
	#endif
	}

To:

	static bool macb_dma_is_64b(struct macb *bp)
	{
		return IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
		       bp->hw_dma_cap & HW_DMA_CAP_64B;
	}

	void bar(struct macb *bp) {
		if (macb_dma_is_64b(bp)) {
			foo();
		}
	}

In the first case, we use explicit preprocessor directives to remove
code if CONFIG_ARCH_DMA_ADDR_T_64BIT isn't defined.

In the second case, our compiler optimises away the IS_ENABLED() call.
 - If false, then the branch doesn't appear.
 - If true, then only the capability check is inlined in bar().
I checked the assembly on arm/arm64/MIPS.

Conclusion: the hotpath doesn't change.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


