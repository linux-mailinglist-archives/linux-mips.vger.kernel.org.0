Return-Path: <linux-mips+bounces-10335-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637DB2833C
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 17:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8616D1CC54B8
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 15:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E41C3090E6;
	Fri, 15 Aug 2025 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIAhpLjd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0109A30749E;
	Fri, 15 Aug 2025 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272929; cv=none; b=oYMp7hf9JfwJcJQ9SNwuh1C0qHrXEysFWpqw0+RDSdKMusyzw2YV/c99K32Q1LX02bXbzoJFHgQ974o2YJ/qSoFbThUCa81dAHXul6KNvkeg7ganNwxRPHG9q5jm5f9CPASmvEEP7t0ompyzmv3e/SEkozJmNduKtn2/8x8z8T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272929; c=relaxed/simple;
	bh=dXeZ3KZjlb7yNV7W1EJTeFuhkJItJWW4QMeQLARxE0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iESnrFWubdmuqKcmaman3cZ/oSmCVvHG5Q7e6fhCKxK87fiyjxYhOXeNrtepk8DbCRQzU0r7yCXYENzdWzblR0MO7Zkd4pHbseiXCYd3kSrijW/PRa3zwCZkuXKYvRe2IvQ5Gfqe9WSl6EQ8OCaXUMkZatRer9qnU4XK2ia38po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIAhpLjd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679EAC4CEEB;
	Fri, 15 Aug 2025 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755272928;
	bh=dXeZ3KZjlb7yNV7W1EJTeFuhkJItJWW4QMeQLARxE0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIAhpLjdnjd7KwcPxHe/fKOEaOJM9IILyUDtcEh08BwHDL/Qr4xpEEEWpXMvKI9Mk
	 W8cOtYXpZjP09ZQzBX+sykHJb+XQtPylWBCAIJ6L3chyorZcJODU4BbED4STxDDQGo
	 4/R3x6OX7WTaZRAU92XFukTzVCgTkwf2WzPK7s6cGjKFePaA0Wdq1N+RWwrBIVKNJY
	 LbbJPUM2a8jNTXCey9UQN2eWqqW0qKEKEOWwrRf8I9RXKXvRc1inLGqB9qmrjZpcRM
	 Vy4ALkuM6htnQyqEf8KT5Mi+IYIIbCJAssLhzENhYNKdR5Zr0BYNV6MJgUa2oRFYfV
	 YAymPSJAQG6TQ==
Date: Fri, 15 Aug 2025 16:48:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: y@spud.smtp.subspace.kernel.org, tsbogend@alpha.franken.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mips: lantiq: Document lantiq dcdc
 binding
Message-ID: <20250815-kangaroo-isolating-7e1a366be8d4@spud>
References: <20250814082705.3183231-1-olek2@wp.pl>
 <20250814-vocation-viscous-b54bc343e8c6@spud>
 <e327b6ce-11ad-4909-9c6f-cd833b44e15f@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gk3TvpZT3rBa5qnL"
Content-Disposition: inline
In-Reply-To: <e327b6ce-11ad-4909-9c6f-cd833b44e15f@wp.pl>


--Gk3TvpZT3rBa5qnL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 12:13:41PM +0200, Aleksander Jan Bajkowski wrote:
> Hi Conor,
>=20
> On 8/14/25 22:48, Conor Dooley wrote:
> > On Thu, Aug 14, 2025 at 10:26:56AM +0200, Aleksander Jan Bajkowski wrot=
e:
> > > Lantiq DCDC is a voltage converter with a voltage sensor.
> > >=20
> > > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > > ---
> > >   .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 32 ++++++++++++++++=
+++
> > >   1 file changed, 32 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/mips/lantiq/la=
ntiq,dcdc-xrx200.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcd=
c-xrx200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-x=
rx200.yaml
> > > new file mode 100644
> > > index 000000000000..5648b9676b3c
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx20=
0.yaml
> > > @@ -0,0 +1,32 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,dcdc-xrx200.ya=
ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Lantiq DCDC (DC-DC converter with voltage sensor)
> > > +
> > > +maintainers:
> > > +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - lantiq,dcdc-xrx200
> > What is "xrx2000" in this context?
>=20
>=20
> =E2=80=9Cxrx200=E2=80=9D is one of the generations of Lantiq SoCs. It inc=
ludes four part
> numbers
> with the same memory map. The other generations are amazon-se, danube,
> ARX100,
> GRX100, xRX200, xRX300, xRX330. These correspond to the internal code nam=
es:
> ase,
> danube, ar9, gr9, vr9, ar10, grx390.

And the dc-dc converter is part of the SoC?
Either way, you've got this file in the wrong location probably, dc-dc
converters are usually under the regulator directory.

--Gk3TvpZT3rBa5qnL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ9W2gAKCRB4tDGHoIJi
0gU0AQDWGnQAlsfUsnHcf5CuOvGvb6BnMJxzi+zek/8IRJDzsAD9FsLU7/k+cBL/
CEsR9Y5lV2b6M6GJ7M0xSzGlxVEvIQg=
=4KYv
-----END PGP SIGNATURE-----

--Gk3TvpZT3rBa5qnL--

