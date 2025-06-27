Return-Path: <linux-mips+bounces-9536-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF1AEB327
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54FFF566CF1
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6DA293C6A;
	Fri, 27 Jun 2025 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ANo4mvAp"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C9E1DE2C9;
	Fri, 27 Jun 2025 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017331; cv=none; b=E1bD9qSwfVmg4DinhCQtpQXkGlRHk5o2KI4bRaP+KHZ9ihfqmDLgxMWGKxpGR+f1C96UGjCo01QcZMKrcTcxiuued3lSbFdGnj8ScYkB06tiXnHYmcPS37Es/yoUeHhjWIa+Ec35Prf3cYNmvo1MSqj0cSLtjmDS77+XEYBW/sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017331; c=relaxed/simple;
	bh=ALB8scmnqBjrj7Lx7mrURXy49O4IYjmrSTfkDIal3lI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTE+dD7fzvved3bS2x+XF7ebqHPmSzsN2x7WwT6krkVQmt6BTneXSyyotPs+rPqhEhDZ8p6FxltGFdKm/1/bQqT0mFy9bIDcTPo/PnVW6udMb0GX6VA3BDMoCT4t9N4b6SOdDM5wDOfq0Svwz2+PTmXDCmYj4o4kJA/AQgs0Kb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ANo4mvAp; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 081091FD35;
	Fri, 27 Jun 2025 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751017321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ebkQpOy7jU/hd2ovSMuvbdUVcZ8KbjpAp3Ecuke29NM=;
	b=ANo4mvApogHPe4fMWd2QFeBCg+mWgojUEV8XaXM/25ncURaUsz9M/kEC6Nn6IVH4maVX6j
	gSeSCAUP/wlUINz90v32u/TeUsei8qUxIXQS6gDZRhsaB8zBNJmzkdZiaYtkNAavTknDsP
	dRdh+FNdH2dlKN6La4DumIswSehs0FgFn89O4Iokd0AoNO4qnLq0SpsC6O1yrdqCLW9b2k
	h9Upd+221NuY96MmaBC7ix86cApTM5GZSfo0ZV56K/KAoyKWrsuFyHBZ31W4LK69SU2LzV
	acuBc9jpT4Ril5gE8uY2KWJvi1SV/M7Wfe4OOWc+QLioRAkbvmT+bkVgu9R1Iw==
Date: Fri, 27 Jun 2025 11:41:51 +0200
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
 <gregory.clement@bootlin.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>, Rafal Ozieblo
 <rafalo@cadence.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 00/18] Support the Cadence MACB/GEM
 instances on Mobileye EyeQ5 SoCs
Message-ID: <20250627112234.1cb54133@2a02-8440-d103-6715-ef68-2a2e-b947-8885.rev.sfr.net>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeehgeeijeekteffhfelheetffeghfffhfeufeeifeffjeeftefhveduteduueeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeekgeegtdemugdutdefmeeijeduheemvghfieekmedvrgdvvgemsgelgeejmeekkeekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeeggedtmeguuddtfeemieejudehmegvfheikeemvdgrvdgvmegsleegjeemkeekkeehpdhhvghlohepvdgrtddvqdekgeegtddqugdutdefqdeijeduhedqvghfieekqddvrgdvvgdqsgelgeejqdekkeekhedrrhgvvhdrshhfrhdrnhgvthdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeffedprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Th=C3=A9o,

On Fri, 27 Jun 2025 11:08:46 +0200
Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wrote:

> Mobileye EyeQ5 SoCs provides two GEM IP blocks. The end result of this
> series is working 1G networking on the EyeQ5 eval board. It isn't just
> a new macb_config & compatible, we also provide some cleanup & fixes
> along the way.
>=20
> dt-bindings:
>   [PATCH net-next v2 01/18] dt-bindings: net: cdns,macb: sort compatibles
>   [PATCH net-next v2 02/18] dt-bindings: net: cdns,macb: add Mobileye Eye=
Q5 ethernet interface
>   [PATCH net-next v2 03/18] dt-bindings: net: cdns,macb: allow tsu_clk wi=
thout tx_clk
>   [PATCH net-next v2 04/18] dt-bindings: net: cdns,macb: allow dma-cohere=
nt
>=20
> Cleanup:
>   [PATCH net-next v2 05/18] net: macb: use BIT() macro for capability def=
initions
>   [PATCH net-next v2 06/18] net: macb: Remove local variables clk_init an=
d init in macb_probe()
>   [PATCH net-next v2 07/18] net: macb: drop macb_config NULL checking
>   [PATCH net-next v2 08/18] net: macb: introduce DMA descriptor helpers (=
is 64bit? is PTP?)
>   [PATCH net-next v2 09/18] net: macb: sort #includes
>=20
> Fixes:
>   [PATCH net-next v2 10/18] net: macb: remove illusion about TBQPH/RBQPH =
being per-queue
>   [PATCH net-next v2 11/18] net: macb: single dma_alloc_coherent() for DM=
A descriptors
>   [PATCH net-next v2 12/18] net: macb: match skb_reserve(skb, NET_IP_ALIG=
N) with HW alignment
>   [PATCH net-next v2 13/18] net: macb: avoid double endianness swap in ma=
cb_set_hwaddr()

Fixes go through the net tree, and new features through net-next :

https://docs.kernel.org/process/maintainer-netdev.html#netdev-faq

As this series is quite big, it could be nice to send the cleanups and
fixes in dedicated series, and then the eyeQ5 support in itself as a
standalone series. This would make the review work easier.


> EyeQ5 support:
>   [PATCH net-next v2 14/18] net: macb: add no LSO capability (MACB_CAPS_N=
O_LSO)
>   [PATCH net-next v2 15/18] net: macb: Add "mobileye,eyeq5-gem" compatible
>=20
> DTS:
>   [PATCH net-next v2 16/18] MIPS: mobileye: add EyeQ5 DMA IOCU support
>   [PATCH net-next v2 17/18] MIPS: mobileye: eyeq5: add two Cadence GEM Et=
hernet controllers
>   [PATCH net-next v2 18/18] MIPS: mobileye: eyeq5-epm: add two Cadence GE=
M Ethernet PHYs

Maxime

