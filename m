Return-Path: <linux-mips+bounces-3628-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4902690590E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 18:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F3A81C20E6E
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 16:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212D3181B99;
	Wed, 12 Jun 2024 16:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfOFfJYl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18B181338;
	Wed, 12 Jun 2024 16:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718210597; cv=none; b=f6ZZ6ZKMQL4dolPnbotE69WIfy5DEyIoz4nA7+2+o1vD+rDhbgyb4OdyIcG0X/TWh6W6d0secIR0NWRtP6n4bXK60VpbzW9sQZk7ffWZl+/tFi6IlZoYV0XCRyFdmz6jvQ7hkp9zpw/1oShelBZtFyBaSmmODJ7r+hjwwOrtFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718210597; c=relaxed/simple;
	bh=qreY//fAnwwkk5hLrRnCWnJ+QKjVx1QnAEwqG8yApo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYGbjOKC6jD2ISC8HojW7mWtSj32RD97ta6WgI42M9HobsA3JPtvsglOlEaUvlJ/zTunBKuyj8CbUCMUN3iMzHYBvIk4hkomV6C8PMur/7pp6XvxhO0yiHUNGP+jy0U05zckEl3493tk2enbQagJMbLe+OTBh6Q7/0d6P294+C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfOFfJYl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B27C116B1;
	Wed, 12 Jun 2024 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718210596;
	bh=qreY//fAnwwkk5hLrRnCWnJ+QKjVx1QnAEwqG8yApo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfOFfJYl+At6SDp9QB2/9KYlRNFBxjcMd3sjevdUTbcPc9/nkSDqUsmp+QKjMB468
	 AnPPsM4PcmeWyrvZw8ofSIObzpyis7XpqdTeLJFggSg0Y8ddhM/l8WqHIQEOixuylV
	 cln7ccJa0R8i2k0q0EXtVYv80x5NXYe9NDi4oNx3HcciIwfi6LxWJMK/Gq7f51zPGJ
	 zszizSTfiQRQE5MXfLRHS7aoFNLb9zxPe2rh7m/CjT4zs5yrTTzyRTe732LlIYzcQ3
	 TpJNlI1WpoNFtlCIuv0RCwYItf1RbaJtqwcTQtZGwIajthNMXaRPnl6gxaNaI8w3Ym
	 +eeqRUUXPNL3w==
Date: Wed, 12 Jun 2024 17:43:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 8/8] dt-bindings: mips: img: Add devices binding
Message-ID: <20240612-styling-deafening-2cdae7cf0b55@spud>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-8-9f8e1a07fa63@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tzuLAazgu/3W4bpO"
Content-Disposition: inline
In-Reply-To: <20240612-boston-syscon-v2-8-9f8e1a07fa63@flygoat.com>


--tzuLAazgu/3W4bpO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 12:56:27PM +0100, Jiaxun Yang wrote:
> Add devices binding for various Imagination Technologies
> MIPS based Platforms.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../devicetree/bindings/mips/img/devices.yaml      | 33 ++++++++++++++++=
++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/img/devices.yaml b/Do=
cumentation/devicetree/bindings/mips/img/devices.yaml
> new file mode 100644
> index 000000000000..460ca96577ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/img/devices.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/img/devices.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination Technologies MIPS based Platforms
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +
> +      - description: IMG Boston
> +        const: img,boston
> +
> +      - description: IMG Marduk (Creator Ci40)
> +        items:
> +          - const: img,pistachio-marduk
> +          - const: img,pistachio
> +
> +      - description: Imagination University Program MIPSfpga
> +        items:
> +          - const: img,xilfpga
> +          - const: digilent,nexys4ddr

Usually the order used here is something like:
compatible =3D "vendor,soc-board", "vendor,soc"
The pistachio one seems to follow that, but AFAICT "boston" is a board
and the order in this one is something like:
compatible =3D "vendor,soc", "vendor,generic-fpga-board"

--tzuLAazgu/3W4bpO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnQIAAKCRB4tDGHoIJi
0h5jAP4hD5OB8U5paykiNEvhqV4ngCLkQcx7w24WR7mJaH7JwAD+JhirqZfMIhHi
eGZTIm9niUbibg1zRSo7OgnwY3iE9As=
=YVxZ
-----END PGP SIGNATURE-----

--tzuLAazgu/3W4bpO--

