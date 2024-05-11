Return-Path: <linux-mips+bounces-3232-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CABB8C315E
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 14:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01E6C282184
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85115024E;
	Sat, 11 May 2024 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOELNPOd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D28F6E;
	Sat, 11 May 2024 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715431941; cv=none; b=mjpzUJTUhI2IwEiw0v28j953UCJIrHs43flN1CsvsfANLiEcmQ00Nrbsbsu2rt/jSUEabv/o5xZuWxY8UZ5Lm3PERMGrw4rQXXfSktsT8dv0+i5Hf7G0ALdqK6yWMr+f+wZCyNhLUTERRvBF7U4LCPt6D9rALtxO/vuvVaOLeYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715431941; c=relaxed/simple;
	bh=YJRfqmKQd6lGzj5EKLiRngfVUGj4xvtMtKPTFfitnjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwtmxSZrfbCnB+S0IE/oWUmA7XwzBpwiRdmESeCMw4yF+zbvDEoEYzWxq6BjfFm+dssSCzfpYkHIIJMyki056OPIpGdbAGrTKNV6pIin31cLyEzHW5VcSTtwRReOiI1tJX8GnOvNJiN5OyIKpPvk/mlm/wngJkj6yBavkcJn+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOELNPOd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE868C2BBFC;
	Sat, 11 May 2024 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715431941;
	bh=YJRfqmKQd6lGzj5EKLiRngfVUGj4xvtMtKPTFfitnjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOELNPOdZKpZzvudiMZO5lxZnQpCzbtXr3zunS0M18GlKyQGGvZzwdOW7fm2euH3v
	 Qb8mvx52NL9uXzXxoFYfcoo9kwEnFFEMpr8SvT+VDkbNytvcZaiTWPpvza0U/c5mAU
	 VYDMwbGSiJ8jxtQhDmTrpfdcYvEw7KujhlOr+nGzX7gUtxZcM2nwnExclYM1I5luZ7
	 2yOCYOlGYaxh0Ao7Eu1QbbexuNN847TRNlPY4k4Lj7jqlka93v0zxWy75yA08YCYZR
	 sTGmbGZmYbvcTYLgLj2LtVTlrdmOF13/eNYwaJoCNxlcERA3TP5G/MCRmDBnVEPKMl
	 cteUuxeS8fVCA==
Date: Sat, 11 May 2024 13:52:16 +0100
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
Subject: Re: [PATCH v4 2/4] dt-bindings: mips: brcm: Document
 brcm,bmips-cbr-reg property
Message-ID: <20240511-headset-self-dc2501b38a71@spud>
References: <20240509204750.1538-1-ansuelsmth@gmail.com>
 <20240509204750.1538-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sQaAowGBPlZjH5aG"
Content-Disposition: inline
In-Reply-To: <20240509204750.1538-3-ansuelsmth@gmail.com>


--sQaAowGBPlZjH5aG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 10:47:46PM +0200, Christian Marangi wrote:
> Document brcm,bmips-cbr-reg property.
>=20
> Some SoC suffer from a BUG where CBR(Core Base Register)
> address might badly/never inizialized by the Bootloader or
> reaching it from co-processor registers if the system
> boots from secondary CPU results in invalid address.
>=20
> The CBR address is always the same on the SoC.
>=20
> Usage of this property is to give an address also in these broken
> configuration/bootloader.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/mips/brcm/soc.yaml    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Docum=
entation/devicetree/bindings/mips/brcm/soc.yaml
> index 975945ca2888..6b961b62aff2 100644
> --- a/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> @@ -55,6 +55,16 @@ properties:
>           under the "cpus" node.
>          $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +      brcm,bmips-cbr-reg:
> +        description: Reference address of the CBR.
> +          Some SoC suffer from a BUG where CBR(Core Base Register)
> +          address might badly/never inizialized by the Bootloader or

"be badly or never initialized"

> +          reaching it from co-processor registers if the system

"reading"?

Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +          boots from secondary CPU results in invalid address.
> +          The CBR address is always the same on the SoC hence it
> +          can be provided in DT to handle these broken case.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
>      patternProperties:
>        "^cpu@[0-9]$":
>          type: object
> @@ -64,6 +74,20 @@ properties:
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

--sQaAowGBPlZjH5aG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9qAAAKCRB4tDGHoIJi
0ovkAP9Wm2e/+UCnn4NvMtSAun5L6Cg/3H/9CP5QeIzfGa9z7gEAuMjsZsdC4gli
Bh51+UOTgKQ8XRIRmMptXN7aQPbthQM=
=uGJl
-----END PGP SIGNATURE-----

--sQaAowGBPlZjH5aG--

