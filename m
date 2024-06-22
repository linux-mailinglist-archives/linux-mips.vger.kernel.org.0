Return-Path: <linux-mips+bounces-3854-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1539133D0
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 14:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C27211F22538
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 12:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4040014C59C;
	Sat, 22 Jun 2024 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwWw60Ha"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1341327735;
	Sat, 22 Jun 2024 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719058519; cv=none; b=ZxFWBOr+E0KrRezaZnNCmX9ied7/EG9cR6Ywqtbb0DJgHiKTkABvJSKZly6BPhbr93d3nVfezMETdyEsvA3tPFe5t2NkkCjYIPwMdU0ZdNRg1iP8oGEmwK6dwIMdsBLMiHgSMTSUarvRfyABt1jBp9Kw6PL83eHMcVqIBbCe6xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719058519; c=relaxed/simple;
	bh=fi97dEveogKAGMiz/612NFPLGYcNqCb4xaymxfaZfZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/wotEejpWQeGRdmPhI2foylHxHSndQJIjZVGzui/KTd6Xp7IMru5L6OcFO8W3micCCsNvrUiYi1axdrXaIWW5w11oQaaj6yICgcqPkgagePMlAZZ1Nu7pK23t0ph3enRk367TIdI/R5KrQ3dzH4bZjRSzV673OMAPRwbnTOgfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwWw60Ha; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A66C3277B;
	Sat, 22 Jun 2024 12:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719058518;
	bh=fi97dEveogKAGMiz/612NFPLGYcNqCb4xaymxfaZfZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwWw60Hap87Kx0NsYjQ8a5mZ7otTaRxNCHb//GD7OvuRtTj1rtTHC/tdzgT9YH1qK
	 Glyw65o8uegpmU8Hghzfe46BJ7hepRTi2jTEmaVH53qdj+B6C3/lEpdHiJwDJOagZs
	 phQdnbRj4YAjMUikWyBqrHe49495IVzVlXKPmfBdwyB86jSJBlmz4To+Chi5Pg8NeK
	 0Lt+whZiG8RV0dz3kPrXhME8DS7Ap7RG3pAQj1kp3xuWVukxNkFrQw+jXs1z1z/Rgb
	 moq2UqiSeOK1KOhaHIhC4G8na/KLUlZB5b5StsERGcTGgPKak+MQAvCGDY4j0qb2bx
	 OwhsaNc97gLkQ==
Date: Sat, 22 Jun 2024 13:15:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org, paulburton@kernel.org,
	peterz@infradead.org, mail@birger-koblitz.de, bert@biot.com,
	john@phrozen.org, sander@svanheule.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com
Subject: Re: [PATCH 1/6] dt-bindings: mips: realtek: Add rtl930x-soc
 compatible
Message-ID: <20240622-underpaid-brunch-76db32c7d461@spud>
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
 <20240621042737.674128-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DqGDXWL3EGIBLbu+"
Content-Disposition: inline
In-Reply-To: <20240621042737.674128-2-chris.packham@alliedtelesis.co.nz>


--DqGDXWL3EGIBLbu+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 04:27:32PM +1200, Chris Packham wrote:
> Add the rtl930x-soc and RTL9302C board to the list of Realtek compatible
> strings.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  Documentation/devicetree/bindings/mips/realtek-rtl.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml b/Do=
cumentation/devicetree/bindings/mips/realtek-rtl.yaml
> index f8ac309d2994..f59249a2cefe 100644
> --- a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
> +++ b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
> @@ -19,6 +19,8 @@ properties:
>        - items:
>            - enum:
>                - cisco,sg220-26
> +              - realtek,RTL9302C

lower case please.

>            - const: realtek,rtl8382-soc
> +          - const: realtek,rtl930x-soc

Please avoid wildcards in compatibles. Can you add the actual compatible
instead please.

Also, I think this patch is wrong. It will disallow
compatible =3D "cisco,sg220-26", "realtek,rtl8382-soc"
and instead require
compatible =3D "cisco,sg220-26", "realtek,rtl8382-soc", "realtek,rtl930x-so=
c"
  or
compatible =3D "realtek,RTL9302C, "realtek,rtl8382-soc", "realtek,rtl930x-s=
oc"

Cheers,
Conor.

> =20
>  additionalProperties: true
> --=20
> 2.45.2
>=20

--DqGDXWL3EGIBLbu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnbAUQAKCRB4tDGHoIJi
0jVgAP9e3yzH37VmFTjMLr3whhrSJz8x8mY6qISWymMpDxdFbQEAsHVC96lmezsB
uVGZUNgNuF94oN7hvbJseKw9+qmO3A4=
=ZTdz
-----END PGP SIGNATURE-----

--DqGDXWL3EGIBLbu+--

