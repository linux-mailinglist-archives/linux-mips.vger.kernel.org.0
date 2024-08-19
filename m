Return-Path: <linux-mips+bounces-4955-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C495720B
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 19:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37194B21E85
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 17:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBC914AD02;
	Mon, 19 Aug 2024 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Otjdm7aA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3FC179202;
	Mon, 19 Aug 2024 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087455; cv=none; b=tvhhAx649ZO2xy+z2C5X9WuMoxLiTQqIlk8Tf4U86zb9FXUtMHN6g8ps+qADFWV6gdcsLK8MzQMn43Dvml3dN0xSC6uRe89rqP2zofnY/vs3VVhp5aaZdQCtDtksAgHYGHdEjyK1h9kR6+MLd4WbTwJJguHIE/wso8Agn+wJvuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087455; c=relaxed/simple;
	bh=BkzBcgZ6MeeyKr/8OAHpDoLQnK+icaA3eyHoXP52qSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZTThzRKxCOXfyWBLAAuqmLzNBouR530mWwdpOq5a2vCG0HLwK3f5IjFD35/thCZxiQY37cFeUHiy2vcGQK4ywBc5tlqXLYX71jhKDTkbapN+g7jnWUOSgyt8+ojmKYZDKe6BmEDHD0g0+nuQVyQow1RLPgLYQ5R9aE1PibaA/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Otjdm7aA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5072C32782;
	Mon, 19 Aug 2024 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087455;
	bh=BkzBcgZ6MeeyKr/8OAHpDoLQnK+icaA3eyHoXP52qSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Otjdm7aA5VxyBcfNAmLpnd5lUpLaeh6bivkXUSq2c6lXtzu9VkD6YDAQpsUKYdmTk
	 ZnpPIU7BMOvedJjrYht/uxySYTuCYPFqXm/lfKXTi4uBu6cz5pm27Y+Cm1BVQpf2Iw
	 WNI3f18/Gu48e/TVVWBmyz6gxvxiGnUeVGerhCM1Cb5hiQOqc/ZPo1iDxbRRmZ6QpD
	 akq8E5wGJ8+Ol2kp6W/L9ASUE6fI/fsRt9merad33OQItoolqRol0II2AKJqzOW7hh
	 f9T/wqiPPIi6jAvqcwycHH7I53kn+1OPce5ha2xQpxaqiIFxBR94SbTS1b5jVoKWS7
	 E8gRDCAsEMA5Q==
Date: Mon, 19 Aug 2024 18:10:48 +0100
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
Subject: Re: [PATCH 1/5] dt-bindings: clock: baikal,bt1-ccu-div: add
 top-level constraints
Message-ID: <20240819-salt-oxymoron-41d0d0bbf8b1@spud>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o8wdPAPqT2Zmc7N9"
Content-Disposition: inline
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>


--o8wdPAPqT2Zmc7N9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:30:10PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I really wish you'd sent cover letters so I don't "have" to send 5
different acks where one would do.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../devicetree/bindings/clock/baikal,bt1-ccu-div.yaml     | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.y=
aml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> index bd4cefbb1244..30252c95700c 100644
> --- a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> +++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> @@ -134,9 +134,13 @@ properties:
>    "#reset-cells":
>      const: 1
> =20
> -  clocks: true
> +  clocks:
> +    minItems: 3
> +    maxItems: 4
> =20
> -  clock-names: true
> +  clock-names:
> +    minItems: 3
> +    maxItems: 4
> =20
>  additionalProperties: false
> =20
> --=20
> 2.43.0
>=20

--o8wdPAPqT2Zmc7N9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN8mAAKCRB4tDGHoIJi
0g9hAQD23j6IACN0lwlIWMGLgnB5y0kie/pEMOqt2djDMLdPcgD/QeiNcD9hvDcG
yZWAg6ZsBkCGw5djJD6Z+qVuQkXpaQs=
=SJOu
-----END PGP SIGNATURE-----

--o8wdPAPqT2Zmc7N9--

