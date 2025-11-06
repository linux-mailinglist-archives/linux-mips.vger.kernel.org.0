Return-Path: <linux-mips+bounces-12087-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D951C3A66E
	for <lists+linux-mips@lfdr.de>; Thu, 06 Nov 2025 11:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93C8E4F6A88
	for <lists+linux-mips@lfdr.de>; Thu,  6 Nov 2025 10:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381EB2DF3E7;
	Thu,  6 Nov 2025 10:51:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BD2DAFBF
	for <linux-mips@vger.kernel.org>; Thu,  6 Nov 2025 10:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426307; cv=none; b=nNmEUptsjuEqPgOzmD4w2/tgIdGEELC39wn4/IG1g5mErzNFIa8KXmtkAinR4XfIo6q2rHxyJQH1nbg1b8SsVgONItvPmIUq+JI8HPNrk2RPSkXdAMIheV87s7wcM1YddwCaMHuB43zOUGxtu6hyw0Q5eofi/Xn+D4q07UZ/zEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426307; c=relaxed/simple;
	bh=itQfKCyAMWt8v5ABjQ4YIGdNfHovzQUz4scVas16PAM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jsnVqQw/hLO5Fefph7UYw7Z5QPi3HRkZszH+ht7rUEm/1x7mifqXk+8Bj1jcMcxtQ4DsxHYnJNraZubO8/g1gOWMasp1XIXVgv7vCHSFs8CXPiGfGFl4uyIvT2ddeBHFimP4CR0gNwq+13V9M92wpdm+jcN0ps1Z8GkAGnesars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGxaR-00027U-O1; Thu, 06 Nov 2025 11:51:27 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGxaR-007LZi-0X;
	Thu, 06 Nov 2025 11:51:27 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGxaR-000000004PL-0HZk;
	Thu, 06 Nov 2025 11:51:27 +0100
Message-ID: <56a49462312d89fd0de6da273f698c0f89e73ada.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/7] Add generic PHY driver used by MACB/GEM on EyeQ5
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>, =?ISO-8859-1?Q?Gr=E9gory?=
 Clement	 <gregory.clement@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,  Kishon Vijay Abraham
 I	 <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd	 <sboyd@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-clk@vger.kernel.org, =?ISO-8859-1?Q?Beno=EEt?= Monin	
 <benoit.monin@bootlin.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>,  Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Conor Dooley	 <conor.dooley@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn	 <andrew@lunn.ch>
Date: Thu, 06 Nov 2025 11:51:26 +0100
In-Reply-To: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
References: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org

On Sa, 2025-11-01 at 09:53 +0100, Th=C3=A9o Lebrun wrote:
> EyeQ5 SoCs integrate two GEM instances. A system-controller register
> region named "OLB" has some control over the Ethernet PHY integration.
>=20
> Past iterations [0] touched those syscon registers directly from MACB.
> It was a bad idea. Extend the current OLB ecosystem with a new generic
> PHY driver.
>  - OLB is carried by one main platform driver: clk-eyeq.
>  - It instantiates auxiliary devices: reset-eyeq & pinctrl-eyeq5.
>  - We add a new one: phy-eyeq5-eth.
>=20
> Here is a DT overview:
>=20
>    olb: system-controller@e00000 {
>            compatible =3D "mobileye,eyeq5-olb", "syscon";
>            reg =3D <0 0xe00000 0x0 0x400>;
>            // ...
>            #reset-cells =3D <2>;
>            #clock-cells =3D <1>;
>            #phy-cells =3D <1>; // <=3D this is new
>    };
>=20
>    macb0: ethernet@2a00000 {
>            compatible =3D "mobileye,eyeq5-gem";
>            phys =3D <&olb 0>; // <=3D GEM device consumes the PHY
>            // ...
>    };
>=20
>    macb1: ethernet@2b00000 {
>            compatible =3D "mobileye,eyeq5-gem";
>            phys =3D <&olb 1>; // <=3D same thing for the second instance
>            // ...
>    };
>=20
> The Linux MACB driver already consumes a generic PHY for some other
> compatibles, this is nothing new. The MACB series [1] has been merged
> into net-next/main.
>=20
> --
>=20
> One topic to talk about: the whole "we must assign child->of_node
> manually". Auxiliary driver core does not do it automatically, so
> either the parent (clk-eyeq) or the children must do it.
>=20
> In OLB land, until now, children were doing it with a
> device_set_of_node_from_dev(dev, dev->parent) call in probe.
>=20
> Recently, Jerome Brunet added devm_auxiliary_device_create():
> eaa0d30216c1 ("driver core: auxiliary bus: add device creation
> helpers"). Using that cleans up clk-eyeq but means we must remove
> device_set_of_node_from_dev() from reset-eyeq in the same patch series,
> as the helpers do the dev->of_node assignement from the parent driver.
>=20
> That explains why the ideal patch:
> [PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generic PH=
Ys
> Turned into those three:
> [PATCH 3/7] clk: eyeq: use the auxiliary device creation helper
> [PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generic PH=
Ys
> [PATCH 5/7] reset: eyeq: drop device_set_of_node_from_dev() done by paren=
t
>=20
> --
>=20
> About merging, it'll probably be complex. I see no build dependencies,
> but the board will be in an odd state if only some patches are applied.
> Some dev_warn() at boot and dev->of_node refcounting issues at unload.
>=20
>  - [PATCH 1/7] dt-bindings: soc: mobileye: OLB is an Ethernet PHY provide=
r on EyeQ5
>    We touch dt-bindings because OLB becomes a PHY provider.
>    =3D> linux-mips (?)
>=20
>  - [PATCH 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
>    We add the generic PHY driver in drivers/phy/phy-eyeq5-eth.c with the
>    usual Kconfig, Makefile and MAINTAINERS changes.
>    =3D> linux-phy (?)
>=20
>  - [PATCH 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet contro=
llers
>    [PATCH 7/7] MIPS: mobileye: eyeq5-epm: add two Cadence GEM Ethernet PH=
Ys
>    DTS patches to add both the #phy-cells of OLB and the MACB instances.
>    =3D> linux-mips
>=20
>  - [PATCH 4/7] clk: eyeq: add EyeQ5 children auxiliary device for generic=
 PHYs
>    We must update clk-eyeq because it instantiates a new auxdev.
>    =3D> linux-clk
>=20
>  - [PATCH 3/7] clk: eyeq: use the auxiliary device creation helper
>    [PATCH 5/7] reset: eyeq: drop device_set_of_node_from_dev() done by pa=
rent
>    With the dev->of_node assignement, we must also correct reset-eyeq.
>    =3D> separate them into linux-clk and linux-reset?

Since 3 and 4 should go via clk, and 5 has a dependency on 3, I would
suggest merging them all together.

regards
Philipp

