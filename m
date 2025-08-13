Return-Path: <linux-mips+bounces-10255-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E1B2507F
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 19:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F28122A02DF
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 16:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B5128D8C9;
	Wed, 13 Aug 2025 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6yM3sx5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8FB28C036;
	Wed, 13 Aug 2025 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104218; cv=none; b=ULTb4wn0c//0pBylyxKRO4AqgC4sb4OgsQYN2oDOMg7P9qQPq4Ju9BsnX6qUMtsaot6Y1ZWeruRwPrA7k291yqj3DXc0Z6q3tgrQ4BDZDiFiwreGpAibKBjMAhZn4dSACDeY6F1ppP6dz2pHQhFaKuz8/hb6aLSD14Td0Je3QMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104218; c=relaxed/simple;
	bh=wtCHHBkc9VQ/tOWiyIF3NLlBUxmXbuQSsSyqsyTRB0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLC7F5ygMXq4el14pR90i1LjSRcuLGEINnt6GleBEQZXOAr73qOjIqLyUDRpPJ5OtQPmgbeGzwtqoPPMLE4ea1pNQzNWazF3ci2ZION2Hy9HW8OUt1zBB1CBFbD8NYCzJVrbuDxAEWKv7fZlN+x286DCx1qNGDi7vF5p9wZ1d8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6yM3sx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6133C4CEF1;
	Wed, 13 Aug 2025 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755104217;
	bh=wtCHHBkc9VQ/tOWiyIF3NLlBUxmXbuQSsSyqsyTRB0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6yM3sx5VWEoU6FdpzNPR2Ijpmm3fGYciJXsi6bY709/j+rEoGpbZO6tQlqAqSbjB
	 Xt/NQONCE2LdwNYOrUsf3mm8u8sASwXor2CS6P+t3SQVX4nQOLBqNACE+/mLIRMD4q
	 GgLpKvlkSJ8WstBpKZvcWH3J3WEMUJx3iI5CAZ5Jdb0dCt+GhNtSKzmYy0tzi1ovur
	 JrTqE2rPuekpJ8JiAxNX3qGwptv3Uz7y0958VeWC+6IhpBYCcXcdadWVJIqbjEk5YH
	 NJr6I1lIEXtfYGneukrMdh+lqhABcirN6uFZa8IiyySmLy/CxkUSoHEYwI2FhjJvQ5
	 7Pyr4oun3VLqA==
Date: Wed, 13 Aug 2025 17:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, heiko@sntech.de,
	kever.yang@rock-chips.com, mani@kernel.org,
	tsbogend@alpha.franken.de, john@phrozen.org, masahiroy@kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: mips: lantiq: Add Lantiq platform
 binding
Message-ID: <20250813-overprice-pledge-2e3bd932992c@spud>
References: <20250813142917.2053814-1-olek2@wp.pl>
 <20250813142917.2053814-4-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oEx4W702Fmql7/me"
Content-Disposition: inline
In-Reply-To: <20250813142917.2053814-4-olek2@wp.pl>


--oEx4W702Fmql7/me
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 04:21:34PM +0200, Aleksander Jan Bajkowski wrote:
> Document the top-level device tree binding for Lantiq MIPS-based SoCs
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../devicetree/bindings/mips/lantiq/soc.yaml  | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/soc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mips/lantiq/soc.yaml b/Doc=
umentation/devicetree/bindings/mips/lantiq/soc.yaml
> new file mode 100644
> index 000000000000..e1708cd9b07e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/lantiq/soc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/lantiq/soc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq SoC based Platform
> +
> +maintainers:
> +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> +
> +description:
> +  Devices with a Lantiq CPU shall have the following properties.
> +
> +properties:
> +  $nodename:
> +    const: "/"
> +  compatible:
> +    oneOf:
> +      - description: Boards with Lantiq Amazon-SE SoC
> +        items:
> +          - const: lantiq,ase

Half these entries you have added say "boards" but there are no boards
in them at all. Where are the boards? Only the homehub entry appears to
be complete.


Cheers,
Conor.

> +
> +      - description: Boards with Lantiq Danube SoC
> +        items:
> +          - const: lantiq,danube
> +
> +      - description: Boards with Lantiq Falcon SoC
> +        items:
> +          - const: lantiq,falcon
> +
> +      - description: Boards with Lantiq Twinpass SoC
> +        items:
> +          - const: lantiq,twinpass
> +
> +      - description: Boards with Lantiq ARX100 SoC
> +        items:
> +          - const: lantiq,ar9
> +
> +      - description: Boards with Lantiq GRX100 SoC
> +        items:
> +          - const: lantiq,gr9
> +
> +      - description: Boards with Lantiq xRX200 SoC
> +        items:
> +          - enum:
> +              - bt,homehub-v5a
> +          - const: lantiq,vr9
> +
> +      - description: Boards with Lantiq xRX300 SoC
> +        items:
> +          - const: lantiq,ar10
> +
> +      - description: Boards with Lantiq xRX330 SoC
> +        items:
> +          - const: lantiq,grx390
> +
> +additionalProperties: true
> +
> +...
> --=20
> 2.47.2
>=20

--oEx4W702Fmql7/me
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJzD0wAKCRB4tDGHoIJi
0gLqAQCON/a/zUlss+fouyGiv6bXwMRRNP0gxpfNdo6HstJz1wEAgYqoZh4z9Mn3
YCjpQZf9MWi5Wrb7dW7c0OGxNH8g0wE=
=eH7D
-----END PGP SIGNATURE-----

--oEx4W702Fmql7/me--

