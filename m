Return-Path: <linux-mips+bounces-4954-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A59571A4
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 19:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16E3E1F20F2B
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 17:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7354317ADEE;
	Mon, 19 Aug 2024 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IB/N4JBK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403C617335E;
	Mon, 19 Aug 2024 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087418; cv=none; b=NbAQD8vCrnR26TQMU1dOgUDWxQ6DczH0KzeNdahZotjSPzUzYOY+x4uSsy6ozzsEyWYNHMY/b9vwkPx1aiWnIjFdXYqgcgfPqDgCq825bSgM5ue1dnfLuNZI3SdI9k23ShffVjhhw5JKQS9u1dP6FZ2nlwpQfKG8b4dXgTy5zEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087418; c=relaxed/simple;
	bh=tvkLKPfhnq+Dnv1tlgVWFGm3TpmRLkA2ElQqNmnlHro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lugTxbbKhTOwr+gcchxXH7tte2qOJdP2GX+v2V+c4LCFrXs9S5j3i1ivJFv4enamjjMKmvtb33JwkjJa85120cWMRpdCD4MRiZGtxVHKbrAi1v2Kq/iq1Eh4T0qGnksk1yLF8jhBUzcB7Tocf09yZC8NJPC+DoGA+g1ZleD1+FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IB/N4JBK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361CAC32782;
	Mon, 19 Aug 2024 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087417;
	bh=tvkLKPfhnq+Dnv1tlgVWFGm3TpmRLkA2ElQqNmnlHro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IB/N4JBK7fXxX7UhoH3nnoB+wlcfSuRKms8mE8imDwiTdH5XLhetGXekNGlyxDWCf
	 StZ6nuHMO6vK6auDgSUirJd4MDk0qMSe1Wsq+hS7yTXi3/rZbMeDWVyjEcA3RYXuGK
	 oZm5LAA958WoDAHW5e4LN1aTBRNsOuiFNH2QSKnKfhMjt00mAGQArW++4IUgu/dMpS
	 ZdvNX+pP+k87820wCkq5pBh+rPm9IDSKduWXwlwgdAvhdwDIgGw+Xk/m4ghnPSzGRh
	 02i3/jbryMj1Xj1QXqXjZ3el+bfbU1DzlBYdGzLT5Iugdk1mOQ6fjEMVloGfqZFvbr
	 M5tgV5fJohOuA==
Date: Mon, 19 Aug 2024 18:10:11 +0100
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
Subject: Re: [PATCH 2/5] dt-bindings: clock: cirrus,lochnagar: add top-level
 constraints
Message-ID: <20240819-skipping-chip-55b0e252434c@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l+jfm2awHlfu3Eit"
Content-Disposition: inline
In-Reply-To: <20240818173014.122073-2-krzysztof.kozlowski@linaro.org>


--l+jfm2awHlfu3Eit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:11PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks.  Drop also redundant assigned-clocks properties, because
> core dtschema allows them if clocks are provided.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/clock/cirrus,lochnagar.yaml         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yam=
l b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
> index 59de125647ec..ccff74eda9fb 100644
> --- a/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
> @@ -67,9 +67,9 @@ properties:
>      minItems: 1
>      maxItems: 19
> =20
> -  clocks: true
> -  assigned-clocks: true
> -  assigned-clock-parents: true
> +  clocks:
> +    minItems: 1
> +    maxItems: 19
> =20
>  additionalProperties: false
> =20
> --=20
> 2.43.0
>=20

--l+jfm2awHlfu3Eit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8cwAKCRB4tDGHoIJi
0jnTAQCPbV4r9ep02lDb2S1N3Anztw9Q8g+dehpk36H3+f3iXwD+M3LSx5qb+UCB
gOhNqjjY3N0OMTXDxDo76CN0GeoJwg0=
=KkuM
-----END PGP SIGNATURE-----

--l+jfm2awHlfu3Eit--

