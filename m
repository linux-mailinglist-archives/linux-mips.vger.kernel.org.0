Return-Path: <linux-mips+bounces-3183-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA08C02CB
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 19:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BD802885F2
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 17:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DA253387;
	Wed,  8 May 2024 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3F7OSAP"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B0886643;
	Wed,  8 May 2024 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188479; cv=none; b=jBzPY7oy9XrohNtD93Kpw079Aq20FSbuLmjAthDyTZ/nCenpV90jJOtnSix/pcLM9zvvlEK8+QlzbQQ+Zv1vqhd/FWOb7Nr6It2cSoFgpY6lE3eLcH2x413x6eJ/KxSqVxR5BvfTJCkbl2Bh4KGxC//keOpzB5VKkQz7y59F9bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188479; c=relaxed/simple;
	bh=XSgaEyCzeNF9SkxYds1YfiZ5UDt/BaJ3Qv4zS2ndpxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEqAY5YZq2QMdlmRr0oivxTfsSvpI2mBHxK5oU4IkY7vkTRHxnf7cs8btSkVoFAnUOIYFfCvc+lfRrIJlUEkfTPfO9YaEDXLF+bRzNLxloQ04qoxhUMADXuU0V6R6zCdRNa2vAtb0VemfVhzln2+G6wg9zIcSl1xNRvgEnUZzQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3F7OSAP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7730EC113CC;
	Wed,  8 May 2024 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715188478;
	bh=XSgaEyCzeNF9SkxYds1YfiZ5UDt/BaJ3Qv4zS2ndpxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3F7OSAPT4v2lUwpBQoIMsce8QcQZgJDb9Jhu3nZJhtB04v3ntV6TuIMjB6g2RXls
	 /LcryR2ZaCqT9KLZPievhSccTF4SOxmQz1Yl2oDZQZouwSy+yil771YGPuI7SCsfxE
	 VPbeeGv5kyEXycWt+WQEy9kDHH+vosuPRPnBHHetdUY+jJkGmirx1YSypYMyDznX+T
	 SDq6DOYK7595cZwVB0SZ6fETnNL1AnN0r1jX+4x1HMgWNXq1hJAeHsGioJLyBkF8tA
	 Ddtk90gQcqGk4EGb6KrVrYgjcEzcqoyZVHeaqjS/s3jTr5QOk+JYyU4BfTmvM+jB5N
	 Cb01xtIbnvDiw==
Date: Wed, 8 May 2024 18:14:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: mips: brcm: Document
 brcm,bmips-cbr-reg property
Message-ID: <20240508-prong-serving-660e6046621d@spud>
References: <20240508170721.3023-1-ansuelsmth@gmail.com>
 <20240508170721.3023-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3T0eXEEj/GfP9EAy"
Content-Disposition: inline
In-Reply-To: <20240508170721.3023-3-ansuelsmth@gmail.com>


--3T0eXEEj/GfP9EAy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2024 at 07:07:18PM +0200, Christian Marangi wrote:
> Document brcm,bmips-cbr-reg property.
>=20
> Some SoC suffer from a BUG where read_c0_brcm_cbr() might return 0
> if called from TP1. The CBR address is always the same on the SoC
> hence it can be provided in DT to handle broken case where bootloader
> doesn't init it or SMP where read_c0_brcm_cbr() returns 0 from TP1.
>=20
> Usage of this property is to give an address also in these broken
> configuration/bootloader.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mips/brcm/soc.yaml    | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Docum=
entation/devicetree/bindings/mips/brcm/soc.yaml
> index 975945ca2888..77f73ab48c11 100644
> --- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> @@ -55,6 +55,15 @@ properties:
>           under the "cpus" node.
>          $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +      brcm,bmips-cbr-reg:
> +        description: Reference address of the CBR.

Pretty sure that Rob commented last time that there's no definition
anywhere here of CBR, but I don't see either a response to him or an
explanation in v3 as to what CBR means.

> +          Some SoC suffer from a BUG where read_c0_brcm_cbr() might
> +          return 0 if called from TP1. The CBR address is always the
> +          same on the SoC hence it can be provided in DT to handle
> +          broken case where bootloader doesn't initialise it or SMP
> +          where read_c0_brcm_cbr() returns 0 from TP1.

Why is a ?linux? function name in the binding? Surely this is just
"or in SMP systems where reading CBR returns 0 from...", no? Ditto
above.

Thanks,
Conor.

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
>      patternProperties:
>        "^cpu@[0-9]$":
>          type: object
> @@ -64,6 +73,20 @@ properties:
>      required:
>        - mips-hpt-frequency
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - brcm,bcm6358
> +          - brcm,bcm6368
> +
> +then:
> +  properties:
> +    cpus:
> +      required:
> +        - brcm,bmips-cbr-reg
> +
>  additionalProperties: true
> =20
>  examples:
> --=20
> 2.43.0
>=20

--3T0eXEEj/GfP9EAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjuy+gAKCRB4tDGHoIJi
0qVMAQDuVWWj+vEUXNkj/tXEtwvj2RZ6t8pKRp7szq5BGLRp3gD+N+FBalhu+8dG
Im2poiIXGxI0tEoyutCeF6HaXJM63gg=
=GVnj
-----END PGP SIGNATURE-----

--3T0eXEEj/GfP9EAy--

