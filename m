Return-Path: <linux-mips+bounces-3441-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3208D634F
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 15:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972771C21EA9
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 13:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27524158DD3;
	Fri, 31 May 2024 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdD3x3ba"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C117440B;
	Fri, 31 May 2024 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163146; cv=none; b=CR1BZnrsGyo+uoX/1FhDiZUp6nArLTmBp3qRV1peqjHD7TDBcUjqFGe4gpmEGKCET7afIUge8sQKi6GuhmL+mC/CoMpQhOqmZyU87e8zx1u8d/G44x0nI2LBXWFzPfRnKp4cbFttxTMJhRXv+bBgEE4Wlp3QxQErB0Yv7NTLpl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163146; c=relaxed/simple;
	bh=9bHZx7MoCQbM3wc0+T6G78EbGSWMbO1srcZcLpQFe1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpQhyqsM7rDTKONdtngiMbVFJxhjwVPOXvcF/qWTygpyBZ238v3grYh7m+HduQiFCtg1Qk9b3ySWQFKlqngpyhiXmjB51/12tVzUpb15OhvvGOQOGHvEGEktX1apwg6JAoojOPWU2RdDraIOuD6koZY2LKorl1K1FKIR5pv83y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdD3x3ba; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A572BC116B1;
	Fri, 31 May 2024 13:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717163145;
	bh=9bHZx7MoCQbM3wc0+T6G78EbGSWMbO1srcZcLpQFe1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdD3x3baOEE+lLJPD4j0hSwr8gdBDEPG2WDozfakC6eUwn73jRAQv66g4pSumaXxE
	 oWV1EMVpxXj011/a3sEVJL+5xVahBkX5OWLXMQfi4JBOBAqhjVWif43KBF5rQo84Ke
	 uhCtOL/HUYFN3ePGNKE9X4RKq9xPsfnFi6cGcU9m+u50koP1DtWTRls39xB9/UII0I
	 fdSTfPrd5DzgUFJktrEFJYXK3Y9SVW5d9fYRPkpx3cqoPTnj6ge+G4hDTokRCoL6pY
	 0VMFpdkJwbqnlv3qh8BqTWi5j5w+l6SDBYuUg2TaczKCRjlnFnQfVECKEzfKD8GFzm
	 itjSp5c4ci0+w==
Date: Fri, 31 May 2024 14:45:36 +0100
From: Lee Jones <lee@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240531134536.GK1005600@google.com>
References: <20240510123018.3902184-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>

On Fri, 10 May 2024, Rob Herring (Arm) wrote:

> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This batch is mostly from arm32 platforms.
> ---
>  .../bindings/arm/amlogic/analog-top.txt       | 20 -------------
>  .../bindings/arm/amlogic/assist.txt           | 17 -----------
>  .../bindings/arm/amlogic/bootrom.txt          | 17 -----------
>  .../devicetree/bindings/arm/amlogic/pmu.txt   | 18 ------------
>  .../devicetree/bindings/arm/atmel-sysregs.txt | 29 -------------------
>  .../devicetree/bindings/arm/axis.txt          | 16 ----------
>  .../arm/cpu-enable-method/al,alpine-smp       | 10 -------
>  .../arm/freescale/fsl,vf610-mscm-cpucfg.txt   | 14 ---------
>  .../bindings/arm/marvell/marvell,dove.txt     | 15 ----------
>  .../devicetree/bindings/arm/spear-misc.txt    |  9 ------
>  .../bindings/clock/ti-keystone-pllctrl.txt    | 20 -------------
>  .../devicetree/bindings/mfd/syscon.yaml       | 29 +++++++++++++++++++
>  .../devicetree/bindings/mips/mscc.txt         | 17 -----------
>  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
>  .../bindings/net/hisilicon-hip04-net.txt      | 10 -------
>  15 files changed, 29 insertions(+), 221 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/analog-top.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/assist.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/bootrom.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/pmu.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/spear-misc.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt

No longer applies.  Please rebase and I'll promptly hoover this up.

-- 
Lee Jones [李琼斯]

