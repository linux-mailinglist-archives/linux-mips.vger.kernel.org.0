Return-Path: <linux-mips+bounces-10305-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E91B27061
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 22:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2616CAA3092
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 20:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CF62737F8;
	Thu, 14 Aug 2025 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fud/L1Hb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49A7271454;
	Thu, 14 Aug 2025 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755204642; cv=none; b=aTKWaayKeI0XVZRepjmAl84+WjHYe0Ho8+XHV78ZgzG1Jsx/ZPZ2WdpGK38UVk7eR2JAL2xCknZetNm8pLbrKg/kvzhglKqmgZFQwMczeSdHNysILPZtMyz5geLzbwobJrVjHsbziNKZGOQ6GtGABBO6Oerb23rEzZnK7Jh0w1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755204642; c=relaxed/simple;
	bh=OOI4DB/mL+NkajxL9xJ+1NoYw7SxLOJDEDn8zGVrYwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+bmXB/vFCZ2bnaFOzfkBh3hVO5V+r1nSUwwdPsha9QWDmFi6aAoty7j3jDdlPz71jNtu1chRdXSesIU9PGNu09VA7CyD9ZMoahZALuVvIO1/ps1s9gLZXQh3bqhCg14oCo2CjZcbRPYG/4/zWPKeZS4Sx559u6gMSSrmpEjnoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fud/L1Hb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E306C4CEED;
	Thu, 14 Aug 2025 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755204642;
	bh=OOI4DB/mL+NkajxL9xJ+1NoYw7SxLOJDEDn8zGVrYwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fud/L1Hb+g8n8XkJj5mgQ/mZSgwy820ROyMyrtR2NUgJI/Vn4hflKbo9GIrjlbKlV
	 SQmsMXerE4zY+w6enqtvM37sVPQteSZNkzsyuZVGTgTnGYTCZ2IsTR9DrrDqEX34M5
	 jQ8zfmc2FLk3d7I4LSSKjffwBjagk31J3E8GJ4HsuL/K9DiXGLxJPvonxs792VTQCh
	 19N7O7Kr3yMyJwG+oT+kHdbIaeveYnoK/Gu9YozRb+mSfN9FSrFIi9Udg/4d86iTxF
	 5JQml7JquuveKf59hOw+9D/abZKgNSRRx7bSZ2Ymgor79fePekLSB2q8xa7EsfXD78
	 z6q4kJLeTNnOQ==
Date: Thu, 14 Aug 2025 21:50:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mips: lantiq: Document Lantiq Xway GPTU
Message-ID: <20250814-settling-hamstring-d6a6e957f6c6@spud>
References: <20250814093704.3197030-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BLXlkC8fqvyxa9cW"
Content-Disposition: inline
In-Reply-To: <20250814093704.3197030-1-olek2@wp.pl>


--BLXlkC8fqvyxa9cW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 11:36:59AM +0200, Aleksander Jan Bajkowski wrote:
> The Lantiq SoC has six built-in 16-bit general purpose timers (GPTU).
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../mips/lantiq/lantiq,gptu-xway.yaml         | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,=
gptu-xway.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xw=
ay.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.ya=
ml
> new file mode 100644
> index 000000000000..fcfc634dd391
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,gptu-xway.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq Xway SoC series General Purpose Timer Unit (GPTU)

"SoC series" implies that you're using the same compatible for multiple
devices. Why are you not using device-specific compatibles?

> +
> +maintainers:
> +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lantiq,gptu-xway
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 6
> +    maxItems: 6

And these interrupts are what exactly? I'd rather an items list
explaining what they are tbh.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gptu@e100a00 {
> +        compatible =3D "lantiq,gptu-xway";
> +        reg =3D <0xe100a00 0x100>;
> +        interrupt-parent =3D <&icu0>;
> +        interrupts =3D <126>, <127>, <128>, <129> ,<130>, <131>;
> +    };
> --=20
> 2.47.2
>=20

--BLXlkC8fqvyxa9cW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ5MHQAKCRB4tDGHoIJi
0oWiAP4hqAZXrh2LAuhZ5bI8sl3BZhTxe1pCtJ/iC5OZP0xEWwEA7fXMN/IX1bXR
XNyV4at0xE1msRNcqTWiIdbDqcwAAQI=
=OCux
-----END PGP SIGNATURE-----

--BLXlkC8fqvyxa9cW--

