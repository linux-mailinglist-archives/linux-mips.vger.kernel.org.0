Return-Path: <linux-mips+bounces-10336-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C7B28347
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 17:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F2931B601AD
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 15:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727AF3074A7;
	Fri, 15 Aug 2025 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Okuu1+fF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D67301031;
	Fri, 15 Aug 2025 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755273009; cv=none; b=U70QBBdv3F4RUOM+QxwhJopRS+/oO2ObCmloUGSlAv7kmi5GV20y71cAudRVVWCdLqFyS35d/+7DgsiCbUCYtYr7Y2Pv5Ig/KLVk5w0AZEzr4ir4Q1g1N38UeJe2jkRrFOtoRA0BRKTL1ldZuJQoVaVFsK3sOfthsQTZo83npLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755273009; c=relaxed/simple;
	bh=qytKwaB3l4RIjNh9PVsL/wNzm8knGPzPeQsYYa/SDd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjoOC85OQiWTZKfcoEzPOv5kyA7TcbrWEtTmsVdFuCFxB2BPE1eQ4o1n4OGgcEOp3eMHvuk4cH6bxy29xpATD0UY+p2CTAIcPoxuNaIYgpbq/y11cuawbMAxkERGmllsBSkSS67ZTvhbkEuzfyVWXxIBdaZ7foRDj0nPKpnR9xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Okuu1+fF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B3BC4CEEB;
	Fri, 15 Aug 2025 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755273008;
	bh=qytKwaB3l4RIjNh9PVsL/wNzm8knGPzPeQsYYa/SDd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Okuu1+fFXo2By0VOowZPvAEYLx8AJ/DEJbCie3aW0qGo5w9462MRUariT9wUj7y1a
	 QGKQRWT3ycFdh9XQvDh1QHk11fWR11E2nufk4p8dvcXknRmYL9AtHTm6FXGfK3xcxH
	 ntq9zPEW1G/3jS6hl2SSATYTapxZ4VkpnPS5UDKmx64LyD6oMk+DJWcIxXiLyhOgxB
	 Xd3HrFbism+bnMkZjIWzr+zv7XkFYOdls/fmBSN0m6nJ09ivERt5wTWZsx89EUS/yh
	 6cxbrLuFjExaQ8mYI5pjNAcZkrqYYNWjUNtKwDTYis3GVIxAlmHFkOT0g0/EIvkmvO
	 IXQBKhUrSdcBw==
Date: Fri, 15 Aug 2025 16:50:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: y@spud.smtp.subspace.kernel.org, tsbogend@alpha.franken.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mips: lantiq: Document lantiq dcdc
 binding
Message-ID: <20250815-deflation-item-571bdcdbce8f@spud>
References: <20250814082705.3183231-1-olek2@wp.pl>
 <20250814-vocation-viscous-b54bc343e8c6@spud>
 <e327b6ce-11ad-4909-9c6f-cd833b44e15f@wp.pl>
 <20250815-kangaroo-isolating-7e1a366be8d4@spud>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ei3muymvEB30lY7P"
Content-Disposition: inline
In-Reply-To: <20250815-kangaroo-isolating-7e1a366be8d4@spud>


--ei3muymvEB30lY7P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 04:48:42PM +0100, Conor Dooley wrote:
> On Fri, Aug 15, 2025 at 12:13:41PM +0200, Aleksander Jan Bajkowski wrote:
> > Hi Conor,
> >=20
> > On 8/14/25 22:48, Conor Dooley wrote:
> > > On Thu, Aug 14, 2025 at 10:26:56AM +0200, Aleksander Jan Bajkowski wr=
ote:
> > > > Lantiq DCDC is a voltage converter with a voltage sensor.
> > > >=20
> > > > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > > > ---
> > > >   .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 32 ++++++++++++++=
+++++
> > > >   1 file changed, 32 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/mips/lantiq/=
lantiq,dcdc-xrx200.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,d=
cdc-xrx200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc=
-xrx200.yaml
> > > > new file mode 100644
> > > > index 000000000000..5648b9676b3c
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx=
200.yaml
> > > > @@ -0,0 +1,32 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,dcdc-xrx200.=
yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Lantiq DCDC (DC-DC converter with voltage sensor)
> > > > +
> > > > +maintainers:
> > > > +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - lantiq,dcdc-xrx200
> > > What is "xrx2000" in this context?
> >=20
> >=20
> > =E2=80=9Cxrx200=E2=80=9D is one of the generations of Lantiq SoCs. It i=
ncludes four part
> > numbers
> > with the same memory map. The other generations are amazon-se, danube,
> > ARX100,
> > GRX100, xRX200, xRX300, xRX330. These correspond to the internal code n=
ames:
> > ase,
> > danube, ar9, gr9, vr9, ar10, grx390.
>=20
> And the dc-dc converter is part of the SoC?

(whether it is or not, you'd be well served by having a more complete
explanation either in your commit message, the description field of the
binding or both)

> Either way, you've got this file in the wrong location probably, dc-dc
> converters are usually under the regulator directory.



--ei3muymvEB30lY7P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ9XLAAKCRB4tDGHoIJi
0kM8AQDutrBeBqQha2GCIzclWmBKrRjriazwSkHEwZb9m515WAD/ectDgU+IhI8Y
0g//ICWo/kYYTIEwRx3m2hmr6K/SjA4=
=4gxX
-----END PGP SIGNATURE-----

--ei3muymvEB30lY7P--

