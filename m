Return-Path: <linux-mips+bounces-6763-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F8D9CF3B0
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 19:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B87B51F23FBD
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 18:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3146A1D6DB1;
	Fri, 15 Nov 2024 18:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOfeHz6i"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471D1C68F;
	Fri, 15 Nov 2024 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731694398; cv=none; b=kWPji4Tzqbkxq1TOKPN5wmKqXIGG8iSVvtqz+3JlYFhlzcBnmY2Z0EXu0AJzR+6CVJAvcI21r7GcA8AItZ/E1QPVg8tNS0H6K3hyyMgNYPOjzN3LRGtcA6kYVbcIYVVwtdqAHetEteG4g5nHz8exG6aDCt/yGG0IawNPkwvv14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731694398; c=relaxed/simple;
	bh=32WLkf0O+yGDOwkZskNwQL4/F4N5Iho9l67AcmoDPQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhNkbnOldJJ/ZcDfGZtv0YqVS4LsUtdFPXY0M6RMV47F1bRGWh6n5TABD0cIM3++UwH7Dl/n8eXYz/DKyGR+4YzsqdUWUvMF2LHYSsBBFf6Ar2Rt3Xr4phBWT0V0U4ZkUhUW23Xm2MA6kv5ESQves1XW+6gMkNzHSSgOjDqB6dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOfeHz6i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3581C4CECF;
	Fri, 15 Nov 2024 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731694396;
	bh=32WLkf0O+yGDOwkZskNwQL4/F4N5Iho9l67AcmoDPQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOfeHz6illFnbHfeiY2UCmpzhMd1jMMontnwOJrzFjU0Byu/GFzyMFHIfQ+PU6ur7
	 lKcCBtbD8k1gburqyN10VWE4HTrJhfdkBNZ89HbmQwMWsg22Yh6uuMwn7EmCUsNITT
	 enoCcuD4IvtsLbKVUzfM1VT+mSOzTOkXP2Yk/broM+tBUn6c/uhs+yWCjxMi3I3MKU
	 05z0NgJ6kV9lD3f/D1TXxyz+mnLfQGfPgda+9WkoEKcOcG/wGmGIG5GwSirtWSneq5
	 r8+tFNoQ4uBpbuJZ6HjL1joqGFHHX3fpPjlTFeyERrYadwC1qrTaGvTaq4is2LVN+f
	 UAZgnpSXyRT6w==
Date: Fri, 15 Nov 2024 18:13:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: mips: Document mti,mips-cm
Message-ID: <20241115-strained-rule-631f3a514bf9@spud>
References: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
 <20241115-cluster-hci-broken-v1-1-00636800611d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WKK6JjqQ/ZrGErBt"
Content-Disposition: inline
In-Reply-To: <20241115-cluster-hci-broken-v1-1-00636800611d@bootlin.com>


--WKK6JjqQ/ZrGErBt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 04:29:54PM +0100, Gregory CLEMENT wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>=20
> Add devicetree binding documentation for MIPS Coherence Manager.
>=20
> gc: reg is no more mandatory

That's not enough, you need to explain somewhere why it's not required
anymore. Without a reg property, what does this even convey that cannot
be derived from a compatible etc?

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Do=
cumentation/devicetree/bindings/mips/mti,mips-cm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..03a5ba5624a429c428ee2afca=
73b3e29127e02f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPS Coherence Manager
> +
> +description: |
> +  Defines a location of the MIPS Coherence Manager registers.
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +properties:
> +  compatible:
> +    const: mti,mips-cm
> +
> +  reg:
> +    description:
> +      Base address and size of an unoccupied region in system's MMIO add=
ress
> +      space, which will be used to map the MIPS CM global control regist=
ers
> +      block. It is conventionally decided by the system integrator.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    coherency-manager@1fbf8000 {
> +      compatible =3D "mti,mips-cm";
> +      reg =3D <0x1bde8000 0x8000>;
> +    };
> +...
>=20
> --=20
> 2.45.2
>=20

--WKK6JjqQ/ZrGErBt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzePNwAKCRB4tDGHoIJi
0kZ2AQDP8rK+EnmP2/PFlMeK5SwD4Mod+z2/W+S3yPZcvfjjSgD9EvZIoNcmRfNV
do8IcntnztF+QfCvk9vk06z3F8fFxgY=
=EdMY
-----END PGP SIGNATURE-----

--WKK6JjqQ/ZrGErBt--

