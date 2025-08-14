Return-Path: <linux-mips+bounces-10306-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B98B27068
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 22:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3291797B0
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 20:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8779F273803;
	Thu, 14 Aug 2025 20:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xd8F/Vqp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF5C26FA46;
	Thu, 14 Aug 2025 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755204800; cv=none; b=iTFVPS3M8XoGAZfdRw4vF4DiuDvcuZijSSI4LwXLo8nKMoVcRxVv3LYFBv0AlXOrei4qzQ9IXrGYeD+wgzCDI5CqPKeSPXgnCefe/4pnOgb5KFfqZb6QRVxOjmYxoAfyDI3WaplS3jD8sRvpFpsorn1ytuiMKTrZMwmZoca/ekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755204800; c=relaxed/simple;
	bh=2LkRFzEQQLz4AsmD3GeNQ+csq6dZRddW53dxc2tua8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tt4fSw0GPWYZ0mYRLu2rjgSsh1wJljQNXxeiNAzXKv9iKdggyT5HgJdbN/6KMD7TZW9NUJjtmJxug/W3Z6BzdheW+xIM55icwa6d9Y5G4O7cOGAclvx4y1HiYNKRxsABoK9x8FUEA9A16tk5qz0bdDEKhSbX6BVQ+tb69s3P3mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xd8F/Vqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040DDC4CEED;
	Thu, 14 Aug 2025 20:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755204798;
	bh=2LkRFzEQQLz4AsmD3GeNQ+csq6dZRddW53dxc2tua8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xd8F/VqpOJKht5NslLkVfnLi7Vhs+djTmWL+AGaKqNfW+hlk1SizvwwK514eJaIX9
	 sJ6E+SnEPGgiX5AuS0qktX7na+YkgJ7dXTxuwASdjM2JkkdO6NvdwnMOVFNwsQfaXH
	 zdmK+WaRGzP1YjxZ7pn1eU6batw2NzSL8HJXkZdqWmUzUaPQ1Q1kc/rYMphoG5wCAk
	 0XBESRPPPGRacMW7e3jBNDliebXM7jMdFMR/pDxsYrB0DFRNgyMtCIrQf6Czu6Zas5
	 6qZj+R5W6Zx9n8b1hwaNLMzf0C4e1hwDXGy9I8VS3W7QvF00ZXIa+9+psPR9DmpNWe
	 RLt+FXQrtFPdA==
Date: Thu, 14 Aug 2025 21:53:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway VMMC
Message-ID: <20250814-extended-collector-8335abee820d@spud>
References: <20250814161748.3230278-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ari62n+PILi2eRwl"
Content-Disposition: inline
In-Reply-To: <20250814161748.3230278-1-olek2@wp.pl>


--ari62n+PILi2eRwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 06:17:45PM +0200, Aleksander Jan Bajkowski wrote:
> The Lantiq SoCs have a 2nd mips core called "voice mips macro core (vmmc)"
> which is used to run the voice firmware.
>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../mips/lantiq/lantiq,vmmc-xway.yaml         | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,=
vmmc-xway.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,vmmc-xw=
ay.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,vmmc-xway.ya=
ml
> new file mode 100644
> index 000000000000..bee64f6d0e97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,vmmc-xway.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,vmmc-xway.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq VMMC (Voice MIPS Macro Core)
> +
> +maintainers:
> +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> +
> +description:
> +  The Lantiq SoCs have a 2nd mips core called "Voice MIPS Macro Core (VM=
MC)"
> +  which is used to run the voice firmware. The firmware handles analog
> +  telephone lines.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lantiq,vmmc-xway

Same comment here as elsewhere, the commit message seems to suggest that
you're trying to use one compatible for multiple devices. Not using
soc-specific compatibles requires justification if that's what you're
doing as they are the norm.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 6
> +    maxItems: 6

Same comment here as elsewhere re: items list explaining each item.

> +
> +  gpios: true

What are these gpios? You've got 3 below, what portion of those three
are required? How many mix/max?

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
> +    #include <dt-bindings/gpio/gpio.h>
> +    vmmc@107000 {
> +        compatible =3D "lantiq,vmmc-xway";
> +        reg =3D <0x107000 0x300>;
> +        interrupt-parent =3D <&icu0>;
> +        interrupts =3D <150>, <151>, <152>, <153>, <154>, <155>;
> +        gpios =3D <&gpio 30 GPIO_ACTIVE_HIGH
> +                 &gpio 31 GPIO_ACTIVE_HIGH
> +                 &gpio 3  GPIO_ACTIVE_HIGH>;
> +
> +    };
> --=20
> 2.47.2
>=20

--ari62n+PILi2eRwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ5MugAKCRB4tDGHoIJi
0hEuAQChrMm3aIadGdB/jPZg4DG5RglwxgVK72EEf0NTp+WVDwEAm7/j5Wqo6L3m
QFpE8NvEPCIGmZLM6O1xgVsex/pW0Aw=
=KLOh
-----END PGP SIGNATURE-----

--ari62n+PILi2eRwl--

