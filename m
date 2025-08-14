Return-Path: <linux-mips+bounces-10303-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D404B26F09
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 20:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A63617B71BB
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 18:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D649422DFA5;
	Thu, 14 Aug 2025 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGvCwDSq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9275319865;
	Thu, 14 Aug 2025 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196703; cv=none; b=dRiWIhD5e+L9/jvVayy4lhVX93xGiKFjkzDtfMzw643RWWi6AtU6Opl/sF0Szk95/QjhTs7qlK5kO4LR99iGH7nyQBlhfR07cXFckdHNUK9OhwjQn/QHwUVutZNmZLWcWIMuEldSuv0BDJsN75TLdkHBEcueD9rotDpdnEv2WsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196703; c=relaxed/simple;
	bh=N2hZSrjJY5TjwYixr0iBueiA0E/CNEsynrD7kaGpZ3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j99s2jCUss73yQQGE7U7D1ygVSiDQYPHoPxKrRVKe65WEOoAYSma8fHumyMqbXwR5F2x8z6AB0Y/OEno+F7GF7f0QDBmM5TH9jg9WXsBgbHhq+QQj5XfPE7WPYbsR0J//SFHW9l5n85WG+JwWijhFYXdY0RoQMn7iofDH3an7EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGvCwDSq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618F3C4CEED;
	Thu, 14 Aug 2025 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755196703;
	bh=N2hZSrjJY5TjwYixr0iBueiA0E/CNEsynrD7kaGpZ3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KGvCwDSqBQicn/sGnmQHV6tsV+tEGcJvP//7jgcaL+scwEfhxnzWJIvpVQpQpYVQw
	 EMEpAiydk0yL1TLX3hOpkxgGlhWNKnmPFdtt8D2fwRmmEl4cQNzNt5/zUTlGGzZDIR
	 XtYcpUHYo2BVWH7pFVkE52vMrNfKIwN6mZF9y6yhAzTvjgA3A5J92BEJp3YGV+9fDA
	 GyjXxdEPoXA6BIOGkCFlcvD9SfbFCUPXZqCedTZaRUsfQot9ltV/UWJSj/Du6d+xq6
	 magTCoMwe5oMBIj8SL8lKKpugorRuTen8fuRn3zwffY4K8TdBN1maxmSYJXHkMMPTR
	 +sV2qf5yU+/Vw==
Date: Thu, 14 Aug 2025 19:38:17 +0100
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
Message-ID: <20250814-manmade-carbon-dc376b153052@spud>
References: <20250813142917.2053814-1-olek2@wp.pl>
 <20250813142917.2053814-4-olek2@wp.pl>
 <20250813-overprice-pledge-2e3bd932992c@spud>
 <d0d7afb6-65b8-4fef-ba4d-1c1320c33c22@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qPhzTwZ4pdJ4yn5N"
Content-Disposition: inline
In-Reply-To: <d0d7afb6-65b8-4fef-ba4d-1c1320c33c22@wp.pl>


--qPhzTwZ4pdJ4yn5N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 06:31:42PM +0200, Aleksander Jan Bajkowski wrote:
> On 8/13/25 18:56, Conor Dooley wrote:
> > On Wed, Aug 13, 2025 at 04:21:34PM +0200, Aleksander Jan Bajkowski wrot=
e:
> > > Document the top-level device tree binding for Lantiq MIPS-based SoCs
> > >=20
> > > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > > ---
> > >   .../devicetree/bindings/mips/lantiq/soc.yaml  | 60 ++++++++++++++++=
+++
> > >   1 file changed, 60 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/mips/lantiq/so=
c.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mips/lantiq/soc.yaml b=
/Documentation/devicetree/bindings/mips/lantiq/soc.yaml
> > > new file mode 100644
> > > index 000000000000..e1708cd9b07e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mips/lantiq/soc.yaml
> > > @@ -0,0 +1,60 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mips/lantiq/soc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Lantiq SoC based Platform
> > > +
> > > +maintainers:
> > > +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> > > +
> > > +description:
> > > +  Devices with a Lantiq CPU shall have the following properties.
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    const: "/"
> > > +  compatible:
> > > +    oneOf:
> > > +      - description: Boards with Lantiq Amazon-SE SoC
> > > +        items:
> > > +          - const: lantiq,ase
> > Half these entries you have added say "boards" but there are no boards
> > in them at all. Where are the boards? Only the homehub entry appears to
> > be complete.
>=20
> Right now, I'm just adding one router with the Lantiq xRX200 SoC. The
> binding
> is prepared for adding more devices in the future. I'd like to add devices
> based on the xRX100 and xRX330 SoCs too. Should I remove the other SoCs f=
rom
> the list now?

Ye, I'd remove all of the unused SoCs.=20

--qPhzTwZ4pdJ4yn5N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ4tGQAKCRB4tDGHoIJi
0oZeAQD8+DYuoTPhwqdvyRHLOd2UBWwW0XdIOS69XziV4HXdewD/cDGbj58ky/Ng
D9oEqTYpldSXxtBxd19hlUFLBoaaZgE=
=/18F
-----END PGP SIGNATURE-----

--qPhzTwZ4pdJ4yn5N--

