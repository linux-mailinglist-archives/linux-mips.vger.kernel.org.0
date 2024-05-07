Return-Path: <linux-mips+bounces-3141-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDCC8BE9B6
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 18:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001171F21970
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 16:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF9838DD6;
	Tue,  7 May 2024 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy0d52nm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D0CC148;
	Tue,  7 May 2024 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715100654; cv=none; b=oxSInL40wbkNVd6kw2fjxzDiHhAsMZvuO0ZubadXvYIJudmWqty9SyGBbIOl1W9eac7u0WQOaDCSLNqXaRTRc8bNOPHuRZYA+1rb/9ZY6mnrSq06cb4hlZKyDw6XLyD3aZsPx5tVzH27dk97MP7L4zGmWrk/wZSv/ODgy+XZUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715100654; c=relaxed/simple;
	bh=4KlGXEb5MaJvVfdIChb4oVA/A+O8sO7IHBsckW8932E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIcA2/mTAW5oUXH/tvWKSiy978aMgymoOdQ4SXnfeAR8J2hjB2BZK8JuVEtNmXYItgColwEs/nKkwFwMDyU9KFzCIpnDZKuRmXC+k5UhInrFINFpHJRcKx/PiDEkOqlPRr3GhCrf38adBSKSYAc1inD+rit4Xz14L0QshhMmvu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy0d52nm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939CCC2BBFC;
	Tue,  7 May 2024 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715100653;
	bh=4KlGXEb5MaJvVfdIChb4oVA/A+O8sO7IHBsckW8932E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fy0d52nmTSnKrXLiL+qFfs06Vypp7P+IwnrCTs0QOvWhvsBQeo/AsAlhDw1iwUsQF
	 xfC72eu8okO91wpGrlcPJJokgj3yROxwnYrssdCd+hXYvfxgDTM6ARwWKESlXXNrMS
	 c9ydBiJiE1ct3KFKTbJWYMcfk0yQXTWhiHdZ9nTSp8MyiEc3fayqTXcXyvXfS9D+xR
	 CYvB6Iv6oPUrhP8ElZ7mrFV0/x9EszsaWny1lOiaKu5aRk7Wju/4cor3xstN3o+A5T
	 AaE9AQij0VhCijug/NGd2UWRJ9LR97Xe4x23iBNf5As91HtFw06MWlnbUQQv4x1e0B
	 j8Icafg5QDlrg==
Date: Tue, 7 May 2024 17:50:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: mips: Document mti,mips-cm
Message-ID: <20240507-jokester-antelope-808b21b957e6@spud>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
 <20240507-cm_probe-v1-4-11dbfd598f3c@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ms7utr74CnSeXu0u"
Content-Disposition: inline
In-Reply-To: <20240507-cm_probe-v1-4-11dbfd598f3c@flygoat.com>


--Ms7utr74CnSeXu0u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 10:01:52AM +0100, Jiaxun Yang wrote:
> Add devicetree binding documentation for MIPS Coherence Manager.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../devicetree/bindings/mips/mips-cm.yaml          | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/mips-cm.yaml b/Docume=
ntation/devicetree/bindings/mips/mips-cm.yaml
> new file mode 100644
> index 000000000000..b92b008d7758
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/mips-cm.yaml

Filename matching the compatible please.

> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/mips-cm.yaml#
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

Is it actually only available on mips? Google seems to report there
being Coherence Managers on their RISC-V offerings too.

> +  reg:
> +    description: |

The | isn't needed, there's no formatting to preserve.

> +      Base address and size of an unoccupied memory region, which will be
> +      used to map the MIPS CM registers block.

This sounds like it should actually be a memory-region that references
some reserved memory, not a reg, given the description. I think the
commit message here is lacking any information about what the intentions
are for this binding.

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
> +    cm@1fbf8000 {

And a generic node name here please. I actually don't quite know what to
suggest though, but "coherency-manager" would likely be better than
"cm".

Thanks,
Conor.

> +      compatible =3D "mti,mips-cm";
> +      reg =3D <0x1bde8000 0x8000>;
> +    };
> +...
>=20
> --=20
> 2.34.1
>=20

--Ms7utr74CnSeXu0u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpb6QAKCRB4tDGHoIJi
0qZ1AP9isaOpzM2dAWT6giwIsfSBgSxT3zhqxMO6xdhbcbBDQAD/ZVphdXVgl1Ks
xK6CpzPPmSCgNjQT2sCRv5jFuTHHxwE=
=K2q4
-----END PGP SIGNATURE-----

--Ms7utr74CnSeXu0u--

