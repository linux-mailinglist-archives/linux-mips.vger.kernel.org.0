Return-Path: <linux-mips+bounces-8049-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CCDA4A148
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 19:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28E43BC602
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 18:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9216C1C1F0F;
	Fri, 28 Feb 2025 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6QGvTjJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECEB1F4CBF;
	Fri, 28 Feb 2025 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740766756; cv=none; b=tqnLba5hr+8UC9n/RnSPxO6q8AuKtmqlCXZK9Oq8o181Y2scivXZIonnhaOIJq7gZygH9glNdYMP5t8vPWvr65tp0ZhFIWwrJm4oFUwY4Z1x+CbE9r0gEep70R16KlOLaAPmmS/W15NvhPih5BFHlLzcmwo2X9Ea6ChVRJN06NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740766756; c=relaxed/simple;
	bh=JApBZwRIXITeT7RDTkJfHrhIsGCMN9PP8KGP890U2lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDTv3xmITU2l7hE8Gq6Sp7Cbp2Embl8Wla5tKWwBfkKc6tkwa2r/kwofLAVLqnkMNK1oi16EjF0WvbZ57f5Jek2IN33oG4637VY2II90/rmpEXoltgaRskEcI2fo9kg5iDLpZD/qezOGeJF8f6No9ZrDon/LjiwcENn13qikqdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6QGvTjJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EA7C4CED6;
	Fri, 28 Feb 2025 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740766756;
	bh=JApBZwRIXITeT7RDTkJfHrhIsGCMN9PP8KGP890U2lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6QGvTjJahh91nAuR/99i5L/1kCj7MOzD6zkCIhfy7K7uOmcS/rfadj3gScoyeT0c
	 ChUf78FlPofFEIA8TgWTMFLI0kYXY+ySe3PLKR+poPlf7K+84HwFiCl+JpkvrdBqZX
	 q65oj/+INMpV90pkDdMhYwICaUeG2ltjJBVSVjihNBmDs3KLd21h+h+R9CsRZsAC3c
	 J403hWMgigWT2JJ35p0Y9ANI8aRtRVvgo8OGX0Y1zOO+0cNPyYQdydc1PGNb8sYdYT
	 HZrFHHIjWLgbRkA34tbQ1HVVHDc6Xn88HTM6nBAr0b7XLwz+IMCRulfYIPPJ/oHr3V
	 +nwlnolI1G+eQ==
Date: Fri, 28 Feb 2025 18:19:11 +0000
From: Conor Dooley <conor@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Andreas Kemnade <andreas@kemnade.info>,
	Paul Boddie <paul@boddie.org.uk>, Tim Bysun <tim.bysun@ingenic.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [PATCH v2 1/4] bindings: ingenic,pinctrl: add x1600
Message-ID: <20250228-stimuli-dingy-32502e56f821@spud>
References: <cover.1740749637.git.hns@goldelico.com>
 <c42f0ad1aeedbfc90b9a5f10a36b2f5f2da528e2.1740749637.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WVS54cCjn+9yKs+B"
Content-Disposition: inline
In-Reply-To: <c42f0ad1aeedbfc90b9a5f10a36b2f5f2da528e2.1740749637.git.hns@goldelico.com>


--WVS54cCjn+9yKs+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 02:33:55PM +0100, H. Nikolaus Schaller wrote:
> Add bindings for the Lumissil/Ingenic X1600 SoC.

FWIW, normal subject ordering here would be more like
"dt-bindings: pinctrl: ingenic: add x1600"

Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.ya=
ml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> index 890961826c6f0..84e960255a36d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -42,6 +42,7 @@ properties:
>            - ingenic,jz4780-pinctrl
>            - ingenic,x1000-pinctrl
>            - ingenic,x1500-pinctrl
> +          - ingenic,x1600-pinctrl
>            - ingenic,x1830-pinctrl
>            - ingenic,x2000-pinctrl
>            - ingenic,x2100-pinctrl
> @@ -81,6 +82,7 @@ patternProperties:
>            - ingenic,jz4780-gpio
>            - ingenic,x1000-gpio
>            - ingenic,x1500-gpio
> +          - ingenic,x1600-gpio
>            - ingenic,x1830-gpio
>            - ingenic,x2000-gpio
>            - ingenic,x2100-gpio
> --=20
> 2.47.0
>=20
>=20

--WVS54cCjn+9yKs+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8H+HgAKCRB4tDGHoIJi
0rkYAP45VMggPtX0S8CdNjy5aSFDJjgOdnkhVcG304/MGv6Q5QEA4VPOSA000d7w
rCAKKORtGr+c5d3aotkEkn37btdjTwQ=
=hmOv
-----END PGP SIGNATURE-----

--WVS54cCjn+9yKs+B--

