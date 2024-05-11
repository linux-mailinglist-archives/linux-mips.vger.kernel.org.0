Return-Path: <linux-mips+bounces-3231-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B04D28C3151
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 14:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48D101F21838
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEAC94DA09;
	Sat, 11 May 2024 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMvdel0D"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79230468E;
	Sat, 11 May 2024 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715431412; cv=none; b=RCfBZr9Wh0YAdungpsm1S00PqTffF261sDQLE7+yWXrc9xkChC0EtEJsKjEFdiemIaR/SthR4aQoVxJNzeG7ypGFi6L65+slBSF0cx6pkTKGobEBv0z2ztMxec2Y2OtNmIReX5xFZaDncPZQ3xb7tt3OusM6c5q01idMYhewt3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715431412; c=relaxed/simple;
	bh=d4VKieaSxJD4O9fan0sp4G+844Bs3wrwI3hZbLLfkXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci4kpOEEZJtIfJQZ8sT9HDcavImR/WksHjECoj4RwABuRB3XQhGkDTnMw2+KJVLYDU8BYVntKE3KQBAnNSejVje6zWUG+/x/DCP2mEabMnBBmw4R+GlhFQQ9UNboFmTcYzyShnGZEpHwVykXk8XwV/YxLqeDQXJwbfXyqwyqQcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMvdel0D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CA8C2BBFC;
	Sat, 11 May 2024 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715431412;
	bh=d4VKieaSxJD4O9fan0sp4G+844Bs3wrwI3hZbLLfkXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMvdel0DY2pBVYj1A7coO/B+rMIO47XYcatES8h6dp3q/a0wHnEdYkkQhKc0kHM6F
	 R5siUi5TNnYhyvsFZ3ct4vYXvIO//GNTkmIVazERoyp2vZdrDSPeZwuFlzD5viOLZF
	 qu51GpXkvw7//RsxRf0s+wfmt9GuzAx/faZwnoCK0QODpe4erqsiy51Fu8KCroI9Er
	 SXWB3N9Bzm3bkRLX+vpX3xIb+298XdKui2spF938GLhwbl3bb8edtYKBLnA8JzMxcc
	 nXEESPNyPUFg8xwI6zZxJpcq4fhBlUvadsbA95jMtmYdMdcaijYUFF6T1DLpx9XJ8q
	 tOTHuogfZFawA==
Date: Sat, 11 May 2024 13:43:24 +0100
From: Conor Dooley <conor@kernel.org>
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
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
	UNGLinuxDriver@microchip.com,
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
Message-ID: <20240511-trailing-confiding-93e4c97f2adf@spud>
References: <20240510123018.3902184-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BSbcBdeN2vnKatp0"
Content-Disposition: inline
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>


--BSbcBdeN2vnKatp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 07:30:14AM -0500, Rob Herring (Arm) wrote:
> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This batch is mostly from arm32 platforms.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--BSbcBdeN2vnKatp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9n7AAKCRB4tDGHoIJi
0gG1AP47sdu3A8RqntUv+sHeomfUnc/kOanj3aHZojsdbapUpAD0DOQrlhFkp8Gc
XbFn8V4hiQpWfuV/HoEcegLy+fB9DQ==
=jck4
-----END PGP SIGNATURE-----

--BSbcBdeN2vnKatp0--

