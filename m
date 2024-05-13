Return-Path: <linux-mips+bounces-3254-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6933A8C3CDD
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 10:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2D10B21698
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 08:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84C9146D7D;
	Mon, 13 May 2024 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f3DMme5d"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDABE146D51;
	Mon, 13 May 2024 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715587539; cv=none; b=r6n5vlhy5y79TV3WXPAoJaqhA1ieIGFKl0QtNvBDcLyuc2ttvPr71wtblFtFChAQLXZP9yzseVdWMkmX8Vkwwn4QXZBHsp0axb10Jiol/TJAKX3KEGN9VZBXH9ml4joq0eae/5TBDAgwz/3aFDMjHPVGMacga40XcQB9tb4bQ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715587539; c=relaxed/simple;
	bh=QjIzxQ8TAmkDr4YCdHB7dm8/MlbtW8LqG4Iu2oj6sHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLugZrSxtmjQHKFMwEA2zTM0TJ81FSWNRvrW1mPY3fFUyTrH/19wom9RBrgK9nTMv5tZVK69eD8Hzpc+mKz7Upg73Fiajaaxwx/LhDXEZsEURvIB350c38hg093AqlihcUv/61oGw4ep6yI3sEwpRjvWJBj1oITpe1p/3c0pgsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f3DMme5d; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C90EC0005;
	Mon, 13 May 2024 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715587529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iyoZN19SXhcNpowY087583lyuLXsiKEVgwfckAcf1+w=;
	b=f3DMme5dxtAT4mt5HSyw2dTwDS4cj1aQP7DTsF7JEASt6rAPey2MD6dQjtqCv/f//7ygwr
	80tVcE3yboCLUBnrFQNlSPQbNERb3wwFmlBAzZULm6qLGkekBcWFHmAR+nso3/P5/3xKUi
	jeo8olmnvjtndE9Z8cObUyAS+2gNhW5Uv3rCLkHEncVjQ2OFRVXHs1lDRzno4Td6rkDMdf
	XX3MudMxRzLYEKTNr8IbYiINhlFGkBVlnKNAg19ttCrWo7nXUqBsYV3UhNtI8o0A55+6oO
	9WX0VTKscxls9YA1fYGNpPorXUQ22t0JENtl1Og8jDDN/lrQznxUw6FTyswgOA==
Date: Mon, 13 May 2024 10:05:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 UNGLinuxDriver@microchip.com, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240513100523.4a23d58c@xps-13>
In-Reply-To: <20240513-timing-snippet-38983a6b3e2f@spud>
References: <20240510123018.3902184-1-robh@kernel.org>
	<20240513095504.37776289@xps-13>
	<20240513-timing-snippet-38983a6b3e2f@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Conor,

conor@kernel.org wrote on Mon, 13 May 2024 08:59:34 +0100:

> On Mon, May 13, 2024 at 09:55:04AM +0200, Miquel Raynal wrote:
> > Hi Rob,
> >=20
> > robh@kernel.org wrote on Fri, 10 May 2024 07:30:14 -0500:
> >  =20
> > > Add another batch of various "simple" syscon compatibles which were
> > > undocumented or still documented with old text bindings. Remove the o=
ld
> > > text binding docs for the ones which were documented. =20
> >=20
> > ...
> >  =20
> > >  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------ =20
> >=20
> > I don't know how useful are these compatibles, but if I take the case
> > of atmel,sama5d3-nfc-io, it is only described in this file, while
> > several DTSI reference it. After this change they will no longer be
> > referenced at all but still in use. Is this intended? Shall these
> > compatibles be totally dropped from the device trees as well?
> >=20
> > $ git grep -c atmel,sama5d3-nfc-io arch/
> > arch/arm/boot/dts/microchip/sama5d2.dtsi:1
> > arch/arm/boot/dts/microchip/sama5d3.dtsi:1
> > arch/arm/boot/dts/microchip/sama5d4.dtsi:1
> > arch/arm/boot/dts/microchip/sama7g5.dtsi:1 =20
>=20
> atmel,sama5d3-nfc-io is added to the syscon yaml binding in this patch,
> so it's a move not a removal, no?

Ah sorry, I missed the additions in this file, fine then, sorry for the
misunderstanding.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com> # mtd

Thanks,
Miqu=C3=A8l

