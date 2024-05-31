Return-Path: <linux-mips+bounces-3443-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E12E38D665C
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 18:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AA1B1F2719C
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 16:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFCC158DBA;
	Fri, 31 May 2024 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmIiCxm0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8395515B975;
	Fri, 31 May 2024 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717171661; cv=none; b=APmPY90k9fpzxHeHN+2dVWkadtM1t7vEEEwYJ8+MGFJak+cINXs6ETujlEMm0Et/2aQOFIdklhmvOwglBHKgM4dpsYbStVBbNMwrf3VXzOvRR1rp/blRe0vi1kGRRx7bKjTaq8J2m8Q62lBSXvlHoQUgmf+FBlqtHNtjziZ1YjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717171661; c=relaxed/simple;
	bh=mE0OUhJiQMMzHxfgx0IOqHje5tQRxYiF+OB7kIk7BQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBpx7JfOHpgvCfE3KBfb8P9kfE5v50jC0iXwQIfZAUgFchHUWThy7VYoufTa4eoOPHPLRpjaXZLjn4Lp4xaBN+Ae96lWLg7nxiVX27jdIbbPgUEEi14WrGkrOEAL8yU1caCTvRNZy/c5PwlUZfR4aKuGGfo6Tkz7NbRLggMnXy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmIiCxm0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD16C2BD10;
	Fri, 31 May 2024 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171661;
	bh=mE0OUhJiQMMzHxfgx0IOqHje5tQRxYiF+OB7kIk7BQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmIiCxm0t+WW0oDLFbzpb97vsloCQOGygqInun3z/KqgTGXTl0X8sb6iu/GPspD+F
	 NPEMmQfMP5NPkWPOQfPn+ZR01fhntn9dZ4xZJyreUlb5Jt3XqhrOCAgx2X6+3Qar+1
	 sJl0/nS6GLx6bYMl5Q3Nq8TsaS4qvADsYam0QoK25lv4+38tki18s91Ryxs5eCPMLt
	 08S6l5f4C1YPnmOk20oswNPJxj3VLzNXpY8FiHClDIxWUsDgs51ThFWVSM4JmnzSow
	 5xhTgwGIfx6iTjLHyFhjj5oJWbEIomg04B1e5uyTuV9M8mBApgf8D8PsEm0x8SadNf
	 bNMxEUZUv5Mxg==
Date: Fri, 31 May 2024 17:07:32 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
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
Message-ID: <20240531160732.GT1005600@google.com>
References: <20240510123018.3902184-1-robh@kernel.org>
 <20240531134536.GK1005600@google.com>
 <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>

On Fri, 31 May 2024, Rob Herring wrote:

> On Fri, May 31, 2024 at 8:45 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Fri, 10 May 2024, Rob Herring (Arm) wrote:
> >
> > > Add another batch of various "simple" syscon compatibles which were
> > > undocumented or still documented with old text bindings. Remove the old
> > > text binding docs for the ones which were documented.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > > This batch is mostly from arm32 platforms.
> > > ---
> > >  .../bindings/arm/amlogic/analog-top.txt       | 20 -------------
> > >  .../bindings/arm/amlogic/assist.txt           | 17 -----------
> > >  .../bindings/arm/amlogic/bootrom.txt          | 17 -----------
> > >  .../devicetree/bindings/arm/amlogic/pmu.txt   | 18 ------------
> > >  .../devicetree/bindings/arm/atmel-sysregs.txt | 29 -------------------
> > >  .../devicetree/bindings/arm/axis.txt          | 16 ----------
> > >  .../arm/cpu-enable-method/al,alpine-smp       | 10 -------
> > >  .../arm/freescale/fsl,vf610-mscm-cpucfg.txt   | 14 ---------
> > >  .../bindings/arm/marvell/marvell,dove.txt     | 15 ----------
> > >  .../devicetree/bindings/arm/spear-misc.txt    |  9 ------
> > >  .../bindings/clock/ti-keystone-pllctrl.txt    | 20 -------------
> > >  .../devicetree/bindings/mfd/syscon.yaml       | 29 +++++++++++++++++++
> > >  .../devicetree/bindings/mips/mscc.txt         | 17 -----------
> > >  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
> > >  .../bindings/net/hisilicon-hip04-net.txt      | 10 -------
> > >  15 files changed, 29 insertions(+), 221 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/analog-top.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/assist.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/bootrom.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/pmu.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/spear-misc.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt
> >
> > No longer applies.  Please rebase and I'll promptly hoover this up.
> 
> I can't find where it doesn't. Fine on next, v6.10-rc1, your current
> branch. Maybe something you applied today and haven't pushed out?

That could well be the case.

I just pushed for-mfd-next for you.

Thanks.

-- 
Lee Jones [李琼斯]

