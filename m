Return-Path: <linux-mips+bounces-3252-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 032708C3CBA
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 09:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADC491F23F7F
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 07:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4454D146D56;
	Mon, 13 May 2024 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f9ac95v6"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8248146A8E;
	Mon, 13 May 2024 07:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715586913; cv=none; b=q+bnEeOmQbDKcyZlihRPH1HsdYxA9OK4J3ExhoHeikdzJA6nloA/srzubo1BakKDxJNpcSG9+KGLlfHzL/2PEPeRVOViRNoplvyHNpAV7s3ElSQpHzqTXqKG4bsxgVkOxtpLG6SnZ216YSTkmrcBt7qKgUGrGX+GU7DkXq+xzic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715586913; c=relaxed/simple;
	bh=9+2cK1PXmxBJWUEqMxM1uY0vrLMNMV723THFoCBGhJw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHoqUENT3uurX+OK9Casvke+7e5h9mHH0c26+MzoMYSSxBn0YKE4KB8VQKr4CyyPxzGKqaX6ihDJtY94GR5GWHhiioL7h8vgJFLNk8OV8dHfHmIvEAO43wlmR7VfaB00v6MHTsnu5RZY0j8Hz9qCAizItVUzbVRsuiL1LiUaZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f9ac95v6; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 175BDE001E;
	Mon, 13 May 2024 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715586908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ih1uGOfjRAxCt+6sZss4Yfl3azQjSUpDGJBEtOH8mvE=;
	b=f9ac95v6i1XDmaygmdpkS9KIhKeyRRR3rzxuphI0Luyq5ePjJX81Na7xIwxyP9jltiorT5
	o3RQdE4J0iBlv5VwiuDCBnPjk/bdNj4DrgwUQku75ZXXHOqytN8sUi3raDKyJY2X9piWrO
	USUjdu+raME12Enpsa1gnuUglmy0oHkqtHN8/y0e60Dc6F39+3tJfrm18pfdfraCjaA0no
	wIWhvD6hR/8n67SgI2C5gTU3q2ihA6qXYu4+AHgnSzsCbeRsNJjPcWwDwF/qAiUy3BfoR0
	Ch9OAOcKjdSFVA88ufca5XaZyeLXxw6gUY9xSEYupyKwu6Jpav7BN9WR9OV68A==
Date: Mon, 13 May 2024 09:55:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
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
Message-ID: <20240513095504.37776289@xps-13>
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
References: <20240510123018.3902184-1-robh@kernel.org>
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

Hi Rob,

robh@kernel.org wrote on Fri, 10 May 2024 07:30:14 -0500:

> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.

...

>  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------

I don't know how useful are these compatibles, but if I take the case
of atmel,sama5d3-nfc-io, it is only described in this file, while
several DTSI reference it. After this change they will no longer be
referenced at all but still in use. Is this intended? Shall these
compatibles be totally dropped from the device trees as well?

$ git grep -c atmel,sama5d3-nfc-io arch/
arch/arm/boot/dts/microchip/sama5d2.dtsi:1
arch/arm/boot/dts/microchip/sama5d3.dtsi:1
arch/arm/boot/dts/microchip/sama5d4.dtsi:1
arch/arm/boot/dts/microchip/sama7g5.dtsi:1

Thanks,
Miqu=C3=A8l

