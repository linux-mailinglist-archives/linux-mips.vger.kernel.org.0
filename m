Return-Path: <linux-mips+bounces-8328-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED4A6D6AD
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 09:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04C5B16E613
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C266625D915;
	Mon, 24 Mar 2025 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hyikKVyf"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62D825D554;
	Mon, 24 Mar 2025 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742806536; cv=none; b=k47sNbREwgnHrVVPcx9T8wCnD3+6YsqgEsfyXZPaKly9do+/tsT3ho4UKNa6CY5EP9Vd6nhpRXum2+K9L/Cmz+EwlBZme9y2NyGt+29qrn/55jxY+zTh5bvoMst87+6hnze6K/6jTfZayRLRdQrfQut/A9t4Qr9WVm6QGh9es3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742806536; c=relaxed/simple;
	bh=sRCWn8ZnqCVuLvaRzfRj7kCJjvMK3tiX2Pmx2zdM4W0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BA6lRCaDHCZfW0H9VhRtDgUcbo6jg6/nLxOAWASXI87uwldkV91MIdlDSZkMlBSPaJqj2gYeQ2/fy/SMtKoAHCXPCj3Y1abLJ3XkDiydtWc4pvKRFrgsmT0w1GOaBuDyL+/Bj0H3nGJaXd40MsvUfH1dKlZjqq2oZoHW8rR+lYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hyikKVyf; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BDA320489;
	Mon, 24 Mar 2025 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742806525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pG9q230YV2JmwTswVwXq9HoXcRvHfMmKuKyEAi/ub7U=;
	b=hyikKVyfkgp3VtvCVq7oMLFqgKvnzKCJp7K2wdACjjNzSsQ91gySwi2Ltt9w4CBYd6RnTO
	JR2GTENx6Axhwyd5snF5bf8HXghvJGlHSs+mf3LVk/YYSpdmbXVCCt8e/lfTSKB/x5zViO
	msHBntXgYENI1S1o6FKruXpbLwgy+WrrTHuv9N6W8LWUxdL4TnTQKvNwiyw4PmV1507g1K
	KDuDJFRFMjfhl93YD6BFEF8MrVmM29CrvM0M8NkBQMxeHJV7n7JQdas4O4dp8CcD07lJEH
	1k6rHLrDYvZxr5tjbR2PeWvmE6q7PLGPmhCn0HhvCiKmSubpYL62PG8WPIImPg==
Date: Mon, 24 Mar 2025 09:55:22 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland
 <samuel.holland@sifive.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next 08/13] net: macb: introduce DMA descriptor
 helpers (is 64bit? is PTP?)
Message-ID: <20250324095522.2ab1c38b@fedora.home>
In-Reply-To: <20250321-macb-v1-8-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
	<20250321-macb-v1-8-537b7e37971d@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhfefggfdthffghfdvhffhhfetuedtkeetgffhteevheehjeejgfduieduhedunecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdekpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhft
 hdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello Th=C3=A9o,

On Fri, 21 Mar 2025 20:09:39 +0100
Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wrote:

> Introduce macb_dma_is_64b() and macb_dma_is_ptp() helper functions.
> Many codepaths are made simpler by dropping conditional compilation.
>=20
> This implies three changes:
>  - Always compile related structure definitions inside <macb.h>.
>  - Make the field hw_dma_cap in struct macb always present.
>  - MACB_EXT_DESC can be dropped as it is useless now.
>=20
> The common case is:
>=20
> 	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> 		struct macb_dma_desc_64 *desc_64;
> 		if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
> 			desc_64 =3D macb_64b_desc(bp, desc);
> 			// ...
> 		}
> 	#endif
>=20
> And replaced by:
>=20
> 	struct macb_dma_desc_64 *desc_64;
> 	if (macb_dma_is_64b(bp)) {
> 		desc_64 =3D macb_64b_desc(bp, desc);
> 		// ...
> 	}

Just a thought, but this is adding some more branches in the hotpath on
32 bits DMA setups. Did you measure any performance changes on
these platforms (if you have access to one :) )

As the caps can't be changed dynamically, maybe these helpers could be
replaced more efficiently with some static_key ? This would benefit
both 32 and 64 bits systems as the following would be more efficient

	if (bp->hw_dma_cap & HW_DMA_CAP_64B) {
		//  ...
	}

Just a thought of course, maybe this patch doesn't really hurt perfs :)

Maxime

