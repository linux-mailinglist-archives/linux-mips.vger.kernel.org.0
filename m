Return-Path: <linux-mips+bounces-3253-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4AC8C3CCB
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 09:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DBC11F243AF
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 07:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976351474CB;
	Mon, 13 May 2024 07:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4WPjdpA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDF51474BE;
	Mon, 13 May 2024 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715587183; cv=none; b=MQhrb2SHZ2BY/Pc6ve2f09v55qK+ycVA/bljHq7IsjI5SW2kZTig8a46lv9l2lvWnIuSNdETzeCg9ZxtyInC7GRzeuGhnqcjfV2CAA92SIAQ1r4mbbkzdIPeLv8Q+UL40lJ6vtueniTk3aGEw3X1YvwbQ9uHXUzNPoPU7VLWQXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715587183; c=relaxed/simple;
	bh=wvFY5C7KnIUWngjEubPKtJkMfV486jqserq7eRMaVVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTry0u8CymCdGAuCI6R7Jl6OwNSJf0KzfdUGU393a5Z1J8ow+XWBVhy9VJdWK09QWlYEsePnqf+9wJtAfRKO1K/Tn/+94N2hlSLUGqmM7GJhZALws+0cTT79I05khbo/JO7430RHrnY51wwr2bGpfuvVdG2FR1zirt/nb2FNHOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4WPjdpA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86DDC32783;
	Mon, 13 May 2024 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715587182;
	bh=wvFY5C7KnIUWngjEubPKtJkMfV486jqserq7eRMaVVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4WPjdpAVW+TxaxkAz6L/Rbf+aQyR+EQ5zHzk1w8QwUnm7ekYI9C5ISCzVfuekf20
	 vGgRqORbQhiZvXcbiU72Hp/LNaSoiw2wTtoQUxdMqzY/pvRD52C4H+HO1sCk/ix5m6
	 FGz23YHCLqmSxXfIDVdlAE4Ksi7xDBuq6UiTG3C+0Z5RFQwWU8NyPCAPCLq5E5AODj
	 eNcff4Vb4JCZ97cyR47OM+vUQDReH/l7eA3teXH9JGMV4TKEf7bO33TtO55hgN4vnT
	 krtYmP06detrmO9S/gKudLrWXS5TCKrTlEoyQkyuiu6AIPgkSchWjYW1RQClsYOdFX
	 ZtxW1NSBxIptQ==
Date: Mon, 13 May 2024 08:59:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
Message-ID: <20240513-timing-snippet-38983a6b3e2f@spud>
References: <20240510123018.3902184-1-robh@kernel.org>
 <20240513095504.37776289@xps-13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ejuqGmZ1Bh+Fj8SZ"
Content-Disposition: inline
In-Reply-To: <20240513095504.37776289@xps-13>


--ejuqGmZ1Bh+Fj8SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 09:55:04AM +0200, Miquel Raynal wrote:
> Hi Rob,
>=20
> robh@kernel.org wrote on Fri, 10 May 2024 07:30:14 -0500:
>=20
> > Add another batch of various "simple" syscon compatibles which were
> > undocumented or still documented with old text bindings. Remove the old
> > text binding docs for the ones which were documented.
>=20
> ...
>=20
> >  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
>=20
> I don't know how useful are these compatibles, but if I take the case
> of atmel,sama5d3-nfc-io, it is only described in this file, while
> several DTSI reference it. After this change they will no longer be
> referenced at all but still in use. Is this intended? Shall these
> compatibles be totally dropped from the device trees as well?
>=20
> $ git grep -c atmel,sama5d3-nfc-io arch/
> arch/arm/boot/dts/microchip/sama5d2.dtsi:1
> arch/arm/boot/dts/microchip/sama5d3.dtsi:1
> arch/arm/boot/dts/microchip/sama5d4.dtsi:1
> arch/arm/boot/dts/microchip/sama7g5.dtsi:1

atmel,sama5d3-nfc-io is added to the syscon yaml binding in this patch,
so it's a move not a removal, no?

--ejuqGmZ1Bh+Fj8SZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkHIYQAKCRB4tDGHoIJi
0kjhAQCywBkItTLslLEIC/Q3Nmz+t/xZFgyPQcDxhpgIFVh/xwD+L7u6ZYa12INM
yYuvsouRgrYM7F0I+RsI2qBAfMNdDAw=
=HwQ9
-----END PGP SIGNATURE-----

--ejuqGmZ1Bh+Fj8SZ--

