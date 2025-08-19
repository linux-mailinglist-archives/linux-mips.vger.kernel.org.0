Return-Path: <linux-mips+bounces-10388-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF98B2CB88
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 19:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E84E63B66E9
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 17:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F12E30DD3E;
	Tue, 19 Aug 2025 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmsNpGGT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342CF27B33A;
	Tue, 19 Aug 2025 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755626176; cv=none; b=MToGlj7TzA56DyYh0z+zj/0wiNWtSyH9Z0kljrUVGUCb7o4LZXET1TTEtzk7/FozHbmGGXfCW8pr96s5vRJ8EDb+erV/Zp63DJ4cqF/54BBTSrALU8TTb2sTKLnNTQmV1SJ+1DM8Jff2UhEDMirgfxbt+txG/OvtKD/yyavW2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755626176; c=relaxed/simple;
	bh=F0pzTDSvW+ccw2vtjCHXF9l6KK99zjYqcuK7Yl/OJTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgGlzmdwtDpm1vp7EfgB+ebWUuHqCZ99VM8k7RMbePZR7rv+U4FTAxc/u1ARk0GTUHb9tWI/MclrVN0hP3pbJbVTIFYFi2SO88WVeEkuzSrbdgymTKCkFL0auCCZJxqUtiVc9djUawxwfvgtlbY8w5H0V0nnUn6gi25bqT9KUus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmsNpGGT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7C8C4CEF1;
	Tue, 19 Aug 2025 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755626175;
	bh=F0pzTDSvW+ccw2vtjCHXF9l6KK99zjYqcuK7Yl/OJTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmsNpGGTdra5c+b6Bs6bmH5nGP6BfEX2ZGV6bH8cWWVTobZw2/BHGQJgbHsrf5SPi
	 3r4ssvIv67Y3hWPCmfBSeRItW17plpMViQPzwiW3El9SLq9jHiw+7ZWrDwcd76LaXD
	 nv2bhpimJkvlIuBy/RmyDGMLy1mRqzAkZFBBEO9c0XBKg9ko6dsx8HmnUrq1eTaOzA
	 VA1K7fFb+XbjxAtvj/e4f++tQEZEJUxVHzDmwOTV8XJyB/d3MZ81ZgLIR8CMhXIfHp
	 absJqLGk0Pq+LGHxhQ5zr/wRuxpgwPXUSAwUPzTfzdY7W6BqcDR/msw91JBGKNzV4s
	 Fz4Wegw2aifcQ==
Date: Tue, 19 Aug 2025 18:56:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mips: lantiq: Document lantiq dcdc
 binding
Message-ID: <20250819-mongrel-scrubbed-e0a281674afb@spud>
References: <20250818214153.1084844-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NMhKQHuj2uEhMvrE"
Content-Disposition: inline
In-Reply-To: <20250818214153.1084844-1-olek2@wp.pl>


--NMhKQHuj2uEhMvrE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 11:37:28PM +0200, Aleksander Jan Bajkowski wrote:
> Lantiq DCDC is a voltage converter with a voltage sensor. The converter
> is inside the SoC. This driver only reads the voltage and prints it at
> startup. The voltage supplied by this converter powers one of the power
> domains. It powers the CPU core and probably other peripherals as well.
> The voltage is programmed by the bootloader and Linux never touches it.
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v3:
> - extended commit description
> v2:
> - added missing commit description
> ---
>  .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,=
dcdc-xrx200.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xr=
x200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx20=
0.yaml
> new file mode 100644
> index 000000000000..d951012392bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.ya=
ml

Still in a weird directory, why isn't this under regulators?

> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,dcdc-xrx200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq DCDC (DC-DC converter with voltage sensor)
> +
> +maintainers:
> +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> +
> +description:
> +  Lantiq DCDC is a voltage converter with a voltage sensor. The converte=
r is
> +  inside the xRX200 SoC. This driver only reads the voltage and prints i=
t at
> +  startup. The voltage supplied by this converter powers one of the power
> +  domains. It powers the CPU core and probably other peripherals as well.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lantiq,dcdc-xrx200

An items list containing one element doesn't do anything, just get rid
of it and use enum directly.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dcdc@106a00 {
> +        compatible =3D "lantiq,dcdc-xrx200";
> +        reg =3D <0x106a00 0x200>;
> +    };
> --=20
> 2.47.2
>=20

--NMhKQHuj2uEhMvrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKS6uwAKCRB4tDGHoIJi
0kQmAP9AeB9RE81d1AmBOdkCkO5JB8JPBu1OoJdju9i5Y4Zi5AD+Nz3LqCUeqVfu
ljUW6trkuKI+qwxaeebfSsYiXEXczAM=
=lo4h
-----END PGP SIGNATURE-----

--NMhKQHuj2uEhMvrE--

