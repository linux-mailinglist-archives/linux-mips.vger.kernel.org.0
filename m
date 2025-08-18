Return-Path: <linux-mips+bounces-10361-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3122B2AC7C
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 17:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678776250DC
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 15:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FDF254841;
	Mon, 18 Aug 2025 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zle6j0tV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B1253F3A;
	Mon, 18 Aug 2025 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530050; cv=none; b=mS86QoPW3iSkYDqXwqbvPaz6B71ALdRJNTe0h6tmhLfbi/kQnvNeUimQJwMArmm+GWUX4G49wBT+9qNR+op4SDdeJT+jIAQNOc5g54RP3YvsdDr9O13dpAwedE6HgXCTbUtnuF1GJiY0UjUGdPldmK2ELQn+qZO8HURIJULO0jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530050; c=relaxed/simple;
	bh=tOUhwJGx85p2BfG+Bn0VSze0+NdSwK2c8fjcf0xhHxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1s/0BVkU0XdpkGgJ1KNycCjdloUfampfHfW8fNpJxYMb5Jll8+zLKZe6/tWXTV1L+MfOrEsNG3s7CW3jTOH8ldAHYF5lmIL8+mD+AmkX4LqTWkHxBc5kL7gUvK2DpJ8RKqqTL1Wj9o1Jj3Omopy+r6hfpw1sJsHwYEu1cFWeb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zle6j0tV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60197C113D0;
	Mon, 18 Aug 2025 15:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755530050;
	bh=tOUhwJGx85p2BfG+Bn0VSze0+NdSwK2c8fjcf0xhHxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zle6j0tVeVa5X6hCFsk5f8TEKcSHT0e0FOQ2Nt54pPUsWyuq5Oi36qFd+CqdHuKow
	 Waug4HtQi2GqVfYFg/mVxH9JG3PAqlpP4plFHTmiBGW4tWmnHjC4xhNMSXkpSew9zA
	 FhpdsXzZJbXiXfT3du0hkZEGf7lTrRft2Y2N7g7wKtG31iwzhpyBHoPGR8ByszeykI
	 g+ZTwMDasRBjBIwrWee/s/ToPmddNhEGwvoR/r2esvTH68/a9EFVqb60NQFaAAsDNI
	 H9aApwQDTL0OZnVHUr3IKI9M4ZcY5zA/bOWfCiYQ65Sn2xvw9RZStt3JoWNGGJxNaw
	 YSOr4+/m/0tdg==
Date: Mon, 18 Aug 2025 16:14:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: tsbogend@alpha.franken.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mips: lantiq: Document Lantiq Xway GPTU
Message-ID: <20250818-mossy-brute-1bdef24730d9@spud>
References: <20250814093704.3197030-1-olek2@wp.pl>
 <20250814-settling-hamstring-d6a6e957f6c6@spud>
 <0dc6c3b2-cf93-4cdf-b0bb-1b0d420f1060@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pVrvUgz7KE00fOxH"
Content-Disposition: inline
In-Reply-To: <0dc6c3b2-cf93-4cdf-b0bb-1b0d420f1060@wp.pl>


--pVrvUgz7KE00fOxH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 02:04:09PM +0200, Aleksander Jan Bajkowski wrote:
>=20
> On 8/14/25 22:50, Conor Dooley wrote:
> > On Thu, Aug 14, 2025 at 11:36:59AM +0200, Aleksander Jan Bajkowski wrot=
e:
> > > The Lantiq SoC has six built-in 16-bit general purpose timers (GPTU).
> > >=20
> > > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > > ---
> > >   .../mips/lantiq/lantiq,gptu-xway.yaml         | 39 ++++++++++++++++=
+++
> > >   1 file changed, 39 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/mips/lantiq/la=
ntiq,gptu-xway.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,gpt=
u-xway.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xwa=
y.yaml
> > > new file mode 100644
> > > index 000000000000..fcfc634dd391
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.=
yaml
> > > @@ -0,0 +1,39 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,gptu-xway.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Lantiq Xway SoC series General Purpose Timer Unit (GPTU)
> > "SoC series" implies that you're using the same compatible for multiple
> > devices. Why are you not using device-specific compatibles?
>=20
> This IP Core didn't change in subsequent generations of SoCs, so it had
> one compatible string. In the next iteration, I will add device-specific
> compatibles.

You can (and should) use a fallback when you do that, probably to
whatever the first device to contain the IP is. The driver need only
contain the one fallback compatible.

--pVrvUgz7KE00fOxH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNDPQAKCRB4tDGHoIJi
0tsfAQD4qCs1xUG6WqmLbIDo6LT0mvhgy74eYvV4AfW2Gn+nEgEAzdfcNpkKvzKS
/YwBF2WUoZT+cGGACoVPiXjo3iIINgo=
=pSUh
-----END PGP SIGNATURE-----

--pVrvUgz7KE00fOxH--

