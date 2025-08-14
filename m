Return-Path: <linux-mips+bounces-10304-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 570D0B2705A
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 22:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC8F27B4666
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 20:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C412749C4;
	Thu, 14 Aug 2025 20:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icXcVjtb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E747192D97;
	Thu, 14 Aug 2025 20:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755204537; cv=none; b=HZkM9MOBqrSx3Pm+e/sjFjclQnl1eeHSSWgbKNzdXvoFjZ6kK8ZshW139MOJkUA57pGD3ZMhdyty5UGW8SFZcgXe73bwx5tJT66pOzGF4/uU1yu75kJ1QoQqL5obs2OYTNilL83tGbXoyvfJOdfcJEK5VGSjywgjhMntuAFlVJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755204537; c=relaxed/simple;
	bh=ZXdOUZiTPx1pSGhcCAzQtGhqj/s3tSp3R+Sg88K2uE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJT8zZCVST5DvQBv2Av/WkFwuQ48CbGas5ZKE9Bi7t8YeKe6bRenpO6/ETtpQ7e23KR7+03Uk4f1L0yDp1xN5tZEY9TY1aWZ9FnBNTLQv/y9jFT/0NXBlBz0Klcti6FQ+vqCLMTd992RZ5jrjgODrl8emv/+QRLLoZg7CDqJlw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icXcVjtb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C8FC4CEEF;
	Thu, 14 Aug 2025 20:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755204536;
	bh=ZXdOUZiTPx1pSGhcCAzQtGhqj/s3tSp3R+Sg88K2uE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icXcVjtbKgE1h+2EQzpHFxcmyfwiJFC8pzLvR3SZhZOFvCF22oK/2eoiZlGXNoe8d
	 TTH0NXfUoZZlDuYGPUMCaTYvJrmGKHWv/7jtYGuTg5MQXsu8OctatoVa3CT5xFxS8M
	 paoS+qstFB0VEH/9IpWwLBOdV1YV5BcCqvGlDcwS9c8FpGKmSKERwAKV/Yu0zQynQ1
	 BeLei+6aRWL78B7yzbvukpixeaJ4SUbMwfMn4wLZ/pp9IbTzeSoJoca/mEGnJL3fSE
	 w025/YaKcNXF1pNr0mCjMCNK7COR7avkT2HwcXKKqS7hQMBadcgnMQ6bt5lWT2YHKT
	 42wnZ4uZnU8+A==
Date: Thu, 14 Aug 2025 21:48:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>,
	y@spud.smtp.subspace.kernel.org
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mips: lantiq: Document lantiq dcdc
 binding
Message-ID: <20250814-vocation-viscous-b54bc343e8c6@spud>
References: <20250814082705.3183231-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="InbThig5viQLZRYJ"
Content-Disposition: inline
In-Reply-To: <20250814082705.3183231-1-olek2@wp.pl>


--InbThig5viQLZRYJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 10:26:56AM +0200, Aleksander Jan Bajkowski wrote:
> Lantiq DCDC is a voltage converter with a voltage sensor.
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,=
dcdc-xrx200.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xr=
x200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx20=
0.yaml
> new file mode 100644
> index 000000000000..5648b9676b3c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.ya=
ml
> @@ -0,0 +1,32 @@
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
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lantiq,dcdc-xrx200

What is "xrx2000" in this context?

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

--InbThig5viQLZRYJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ5LtAAKCRB4tDGHoIJi
0viMAP42q3/sznYQ027brpcyIW+wenz34Kt088Rd5gpOLTcgXQEA/MDfhv80ltj2
wsbUUrEVKqCqUGUR9Y9IHzznzdXEaQs=
=cXYA
-----END PGP SIGNATURE-----

--InbThig5viQLZRYJ--

