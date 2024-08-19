Return-Path: <linux-mips+bounces-4952-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BEB9571E2
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 19:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B86DB2C170
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 17:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A088C1741F8;
	Mon, 19 Aug 2024 17:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8tBrYGY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651653FEC;
	Mon, 19 Aug 2024 17:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087374; cv=none; b=E0O1jRkCFvbyfSYFjabSzYgJ1sRRfaoOWMIcSLZKx3DVuW/MpBKZ8AUEKBO01BV8+AMgQgpPeIlo75AXpXcpS8jS3EL5X2+yX2oSJ/95lA9ovtBOcfNOAa3G0gfv6LsFcsLmZKogRDqBZyW+RRq1jenecDdYbORBDbgt3tz9D3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087374; c=relaxed/simple;
	bh=oARwwlUGy47zMdBNGONRSrSMzd7r+lf6SHLoiVjpEJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwVHwiyG5GDUXW8aG8WbmH7Q4mVlBsnTY8l9Gzplc57CdJfqUXYAJfEZa+/KW1gENw2nwYsOaDHVarQQxJMpPXLf/MB+UYlz6FwCM0SecJDZ8hbWSTHvBg8goC/1n47RhyZUFvqZsmy7E7zYhGQiOI+IwkyaJi1a6S9tm4YhjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8tBrYGY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961A4C32782;
	Mon, 19 Aug 2024 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087374;
	bh=oARwwlUGy47zMdBNGONRSrSMzd7r+lf6SHLoiVjpEJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8tBrYGYakBo+U0t83osHpxSrmFXE5mmLVvLsdo8VCQjhSdzsVMlsd6UYxj/M4knD
	 9sngdrRadvBzj64sOEqEcmJOHX8uSj7Kvt6vFR9XMpiIrou7Q+lBEaYib5OsQPKNaw
	 VGRlFa0jYm1oJ6WH2px+0CAu8CsPZO6x5RhQCc3rBXhg55Na6wYYmX2uhJIC3sBW/t
	 A0ZYjAsEHiDTqxZ+hl27zAfCbS1wdndeH+AcTahqHG8tLFDe1uXn2fvRj6kcmi1YTR
	 4fZfEuCon7edSvXp1VrKWX9s+Sk47I5Y9BOwxlFAECzWykwbnjgMOe7yFs0fl1d9/N
	 LmjROnL0a7+hg==
Date: Mon, 19 Aug 2024 18:09:27 +0100
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
Subject: Re: [PATCH 4/5] dt-bindings: clock: rockchip,rk3588-cru: drop
 unneeded assigned-clocks
Message-ID: <20240819-collector-sketch-4c3ab4c1d1ab@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/mrW46uSLR2cSfa2"
Content-Disposition: inline
In-Reply-To: <20240818173014.122073-4-krzysztof.kozlowski@linaro.org>


--/mrW46uSLR2cSfa2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:13PM +0200, Krzysztof Kozlowski wrote:
> assigned-clocks property is redundant, because core dtschema allows them
> if clocks are provided.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/clock/rockchip,rk3588-cru.yaml        | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> index 74cd3f3f229a..4ff175c4992b 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
> @@ -42,10 +42,6 @@ properties:
>        - const: xin24m
>        - const: xin32k
> =20
> -  assigned-clocks: true
> -
> -  assigned-clock-rates: true
> -
>    rockchip,grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: >
> --=20
> 2.43.0
>=20

--/mrW46uSLR2cSfa2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8RwAKCRB4tDGHoIJi
0m3bAP9xPiuQp4KWRWFA1tEdvt5BlUb6PlruxmLJlIG9YqOgCgEAhT+aTF9E4YZF
39FaPSji+VLZRr3eSEA4KAMUTEx++wA=
=uDkF
-----END PGP SIGNATURE-----

--/mrW46uSLR2cSfa2--

