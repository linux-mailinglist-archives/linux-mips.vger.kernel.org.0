Return-Path: <linux-mips+bounces-10340-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B4AB28463
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 18:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E669A5E38C3
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 16:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C200E2E5D08;
	Fri, 15 Aug 2025 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5DB8i2s"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938522E5D03;
	Fri, 15 Aug 2025 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755276540; cv=none; b=FEj3kbCIJ+QnTqBP4MKyvt5ByA1SsU2b4KKgVAqmVNkRbs+YqtiXexNsPPje/N6X1g7clF0Mw5e0mUkh9KXOzRDbTAD8PIipaMGAxwocbo+LNUQ+t3B8zR3GqRDjaC3Gm4mYXc21yJcjkhDJER6rRqjh7mqePOBXW6c3GpGIvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755276540; c=relaxed/simple;
	bh=0vPG1MADrG+2zpv34/zMl/pZHDU4YlVxfH3UCbBB6z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pz5gFU4ANsPFnzscYaTBfu6YK9W3lfA+I4eRs/C1FlrtTvzgSLLGP1ad/b2HmOaNKYO/elfza8ROaqah5Hx7iaycUOkDiwkk5frJQmSYE3/5zACqsE8FWs2AXW8t1fJL/fjaXOAP69UfEOmlxR9D4Y9Pwdq8Vkb0hKTUcgRzEEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5DB8i2s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0161C4CEEB;
	Fri, 15 Aug 2025 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755276540;
	bh=0vPG1MADrG+2zpv34/zMl/pZHDU4YlVxfH3UCbBB6z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5DB8i2sqrAP4Zs6guVj1gHH+Ys0L7buPUbG+9erHeWxphnKjJy6jrBjyUwhtzaJL
	 u723gMGUvNca29yP0HESqzj6qWVXfF9O+4pYJ0td8uqhO7R0AcwjpinU9d9wDLTWZ1
	 zp1vR0FGUeWEmk/8llag3NMNPMywi0qltGgabbDXc1i23dq8Nxt0kFqWIOYaFTov3f
	 YAGvDnuyKNgvWpAsptB4jGsNaetOShSTlmT0O39PJFX8oLAP+81q0Lm11AEIhv+F7a
	 ufxi5e6PvJmOrRbVg+NbvnMjRYZWq0ZF3ozjOD94uWrx8m2KwqaX9kYITtURnWPSAp
	 xI5tfDnxAMS2Q==
Date: Fri, 15 Aug 2025 17:48:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: y@spud.smtp.subspace.kernel.org, tsbogend@alpha.franken.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mips: lantiq: Document lantiq dcdc
 binding
Message-ID: <20250815-crawling-edge-2f0f47f5bc53@spud>
References: <20250814082705.3183231-1-olek2@wp.pl>
 <20250814-vocation-viscous-b54bc343e8c6@spud>
 <e327b6ce-11ad-4909-9c6f-cd833b44e15f@wp.pl>
 <20250815-kangaroo-isolating-7e1a366be8d4@spud>
 <ce607448-0936-4791-976e-8e57dbd2706f@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="18YxAmquK+Jf3x7P"
Content-Disposition: inline
In-Reply-To: <ce607448-0936-4791-976e-8e57dbd2706f@wp.pl>


--18YxAmquK+Jf3x7P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 06:46:21PM +0200, Aleksander Jan Bajkowski wrote:
>=20
> On 8/15/25 17:48, Conor Dooley wrote:
> > On Fri, Aug 15, 2025 at 12:13:41PM +0200, Aleksander Jan Bajkowski wrot=
e:
> > > Hi Conor,
> > >=20
> > > On 8/14/25 22:48, Conor Dooley wrote:
> > > > On Thu, Aug 14, 2025 at 10:26:56AM +0200, Aleksander Jan Bajkowski =
wrote:
> > > > > Lantiq DCDC is a voltage converter with a voltage sensor.
> > > > >=20
> > > > > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > > > > ---
> > > > >    .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 32 +++++++++++=
++++++++
> > > > >    1 file changed, 32 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/mips/lant=
iq/lantiq,dcdc-xrx200.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq=
,dcdc-xrx200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dc=
dc-xrx200.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..5648b9676b3c
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-x=
rx200.yaml
> > > > > @@ -0,0 +1,32 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,dcdc-xrx20=
0.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Lantiq DCDC (DC-DC converter with voltage sensor)
> > > > > +
> > > > > +maintainers:
> > > > > +  - Aleksander Jan Bajkowski <olek2@wp.pl>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - enum:
> > > > > +          - lantiq,dcdc-xrx200
> > > > What is "xrx2000" in this context?
> > >=20
> > > =E2=80=9Cxrx200=E2=80=9D is one of the generations of Lantiq SoCs. It=
 includes four part
> > > numbers
> > > with the same memory map. The other generations are amazon-se, danube,
> > > ARX100,
> > > GRX100, xRX200, xRX300, xRX330. These correspond to the internal code=
 names:
> > > ase,
> > > danube, ar9, gr9, vr9, ar10, grx390.
> > And the dc-dc converter is part of the SoC?
> > Either way, you've got this file in the wrong location probably, dc-dc
> > converters are usually under the regulator directory.
>=20
>=20
> The converter is inside the SoC. This driver only reads the voltage and
> prints it at startup. The voltage supplied by this converter powers one
> of the power domains. It powers the CPU core and probably other
> peripherals as well. The voltage is programmed by the bootloader and
> Linux never touches it.

Okay cool, compatible is fine then :) The location change and more
information (like what you've given here) in the description are still
needed though unfortunately for you.

--18YxAmquK+Jf3x7P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJ9k9wAKCRB4tDGHoIJi
0sOpAPwN3T5FcZilH9G/X6QO3XIxyNAtB/SYmVcadBA2QlYM0wD9HCAmrAVoLlxX
6h+0qxrucjcDgNUg5G1n3SOmHlkQxwk=
=dAQd
-----END PGP SIGNATURE-----

--18YxAmquK+Jf3x7P--

