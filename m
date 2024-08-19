Return-Path: <linux-mips+bounces-4953-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C93957201
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 19:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD18FB2C588
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 17:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCFC17C98D;
	Mon, 19 Aug 2024 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pa+h8Drx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62217335E;
	Mon, 19 Aug 2024 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087399; cv=none; b=imZdvQcs0ORBwly+1zjCgg640ijWOwTpPpQr6AP7uYyavQWzkSLsmVOHgaSgbirq/fXNPVhaBCw2xfe/31QHKuSnyAxIj2oeb7aY5EOUR5PMRcj0tnumxQsgfBfaUhc6hTpHIgIjmJ/f7ms5nsSgLOu5JqMk/s6dUsmb6MP1SGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087399; c=relaxed/simple;
	bh=y0BPApxZk4aDhMX97Jwl8VXXrKnby22KdqpU7J1bQkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feXNwEzm6Jwou1NZnLpixDXJdq0fyVuvQjmEsPTZxq+wIvn2C/rEtLcMdiwuGXAv6PI0+P8CNeFTq2CC2e9miB2Q6FByfjt2oRC4AxQ7SgTS95TyMNB28Y0L0zzWqEHc+y8tNsyXh+tSHR/6xf19T/+AufSCt3Mxs74I1qXatP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pa+h8Drx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A86CC32782;
	Mon, 19 Aug 2024 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087398;
	bh=y0BPApxZk4aDhMX97Jwl8VXXrKnby22KdqpU7J1bQkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa+h8DrxLeHfDGJrBQVitsYHqB/pyw1h/FU0HbRVRFVEk4hghLNNTBVKgDOWYPEuN
	 2uVkgPVbgel/8HaR5+UTrszeOkYA79Ma3wUzx4flbhRf2KyLXMQoO5KFi7GmsV9wRg
	 8DJve+xTwvD9HqTnl8lU7kMKalPzevXJ2XaUj68fOEdHNKCuQlElpz2LQunfj/Uy/j
	 cFVyiuG29X10hY61G2aQGwfGVKih4ZNLyPQYyeXcuDGjLW5cGKArqIFAtCNpN0gSKF
	 iM4BMKPTN1SIQRBwZ3VZGfbCaTcu4cU1/kfmr/rrJht7nlMj89/APVdA+cR3Ravw6p
	 xP7SCYrgGG6TA==
Date: Mon, 19 Aug 2024 18:09:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>, patches@opensource.cirrus.com,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/5] dt-bindings: clock: renesas,cpg-clocks: add
 top-level constraints
Message-ID: <20240819-troubling-player-29e310e19708@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sVIeHr/i4zviJEQI"
Content-Disposition: inline
In-Reply-To: <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>


--sVIeHr/i4zviJEQI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:12PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-output-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--sVIeHr/i4zviJEQI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8YAAKCRB4tDGHoIJi
0lwuAQDKkWVinmbagVwudZnRiljGI+aqE2s4bM/77Eu7ju0UkgEAro7GK2SEKlT1
Y+3SDLYFT01P134qXysfSawdu8ozOgo=
=ekTV
-----END PGP SIGNATURE-----

--sVIeHr/i4zviJEQI--

