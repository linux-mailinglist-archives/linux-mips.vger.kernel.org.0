Return-Path: <linux-mips+bounces-3892-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F3B9153FF
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 18:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 363421C20A01
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 16:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF9719DF77;
	Mon, 24 Jun 2024 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZ69Sbqu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E319AA7E;
	Mon, 24 Jun 2024 16:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246896; cv=none; b=tZXoEkt6p2wMo/zLQuUvml+X5YG9EDjgx8q5Y3QYQwuITfdImoOoHHVN3Fto8jYtMHDjwcnoF9YggPQCYfKmlZPqP9POVENdrWIH9DXK/tYnaIhmrOMGJz/WHQBZjkWB6HlxHl/cNzsEEcRstK2kSrUXqBffiXhY27oKc5RY+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246896; c=relaxed/simple;
	bh=xcCXb1OAJeu5YbHF3396C+1CaivyqQWq1obgNCA8UfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duz7sMlDCFXgWHFiCBZXGvtjKw1E9bf9VKC5t8PO7zbPS8MnkPezBTOr+J04NU/4fPzls81nPa0JflQucoabwLP1FcMC9WuA6b5A6eHkegc25VeG5B6qRjR+Phg6M3bEk5oDwS9vuHRDcc1Ns/oB8UAIf8P1i4Vv5iNA/X1D9gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZ69Sbqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0F1C2BBFC;
	Mon, 24 Jun 2024 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719246895;
	bh=xcCXb1OAJeu5YbHF3396C+1CaivyqQWq1obgNCA8UfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZ69SbquEzYZrVfsPLrp2+IFRZ4bxPTRlG3SGbzMQqajqVKv8p3id27UupW5f67HX
	 G/becUAkHu4ToDjdXErtqKmLRy+ZJerri1e/XrowN9r8W0kKit5Up9EPqOuEg5ojRu
	 cVOBr3VlGGuvHTRSUWTmFK7nUVXUHhBUeXv+hn4QMtKt6IvD+fUcDuaE53lpgCTFqI
	 p5h5sA5mTQrJ0RaBhjUU2M+D9LydZQYkgj38Ty3OQtCRh1o1C9v8X+6Q240PGDWiP3
	 UKLplUXmx3xpoAKSN+ebCYrslsC5indQjIXICtlBb41BAsNQ6fMTLSIe/Vjd3aj4VP
	 hgDM8xZouAs3A==
Date: Mon, 24 Jun 2024 17:34:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"mail@birger-koblitz.de" <mail@birger-koblitz.de>,
	"bert@biot.com" <bert@biot.com>,
	"john@phrozen.org" <john@phrozen.org>,
	"sander@svanheule.net" <sander@svanheule.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"kabel@kernel.org" <kabel@kernel.org>,
	"ericwouds@gmail.com" <ericwouds@gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: timer: Add schema for realtek,otto-timer
Message-ID: <20240624-dining-bullseye-5397d0921701@spud>
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
 <20240621042737.674128-3-chris.packham@alliedtelesis.co.nz>
 <20240622-dagger-willpower-8dc828553384@spud>
 <2ed9ba19-ef0b-481c-b17a-5499cc0664ed@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="72/0f+nl4k9+kRLS"
Content-Disposition: inline
In-Reply-To: <2ed9ba19-ef0b-481c-b17a-5499cc0664ed@alliedtelesis.co.nz>


--72/0f+nl4k9+kRLS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 09:23:55PM +0000, Chris Packham wrote:
> (resend as plain text)
>=20
> On 23/06/24 00:11, Conor Dooley wrote:
> > On Fri, Jun 21, 2024 at 04:27:33PM +1200, Chris Packham wrote:
> >> Add the devicetree schema for the realtek,otto-timer present on a numb=
er
> >> of Realtek SoCs.
> >>
> >> Signed-off-by: Chris Packham<chris.packham@alliedtelesis.co.nz>
> >> ---
> >>   .../bindings/timer/realtek,otto-timer.yaml    | 54 +++++++++++++++++=
++
> >>   1 file changed, 54 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/timer/realtek,o=
tto-timer.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/timer/realtek,otto-time=
r.yaml b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
> >> new file mode 100644
> >> index 000000000000..b6e85aadbc99
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
> >> @@ -0,0 +1,54 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id:http://devicetree.org/schemas/timer/realtek,otto-timer.yaml#
> >> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Realtek Otto SoCs Timer/Counter
> >> +
> >> +description:
> >> +  Realtek SoCs support a number of timers/counters. These are used
> >> +  as a per CPU clock event generator and an overall CPU clocksource.
> >> +
> >> +maintainers:
> >> +  - Chris Packham<chris.packham@alliedtelesis.co.nz>
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    pattern: "^timer@[0-9a-f]+$"
> >> +
> >> +  compatible:
> >> +    items:
> >> +      - enum:
> >> +          - realtek,rtl930x-timer
>=20
> I'll change this to rtl9302
>=20
> >> +      - const: realtek,otto-timer
> >> +  reg:
> >> +    minItems: 5
> >> +    maxItems: 5
> > Since minitems =3D=3D maxitems, can you just make this a list, and defi=
ne
> > what they all are? Ditto interrupts.
>=20
> This is where more conditions might need to be added. The rtl9302 is a=20
> single core SoC. So technically it only needs 2 timers (the hardware=20
> still has 5 but 3 would be unused at the moment). The rtl9312 is a dual=
=20
> core SoC so needs 3 timers (I won't be looking at that platform for a=20
> while). So I think maybe maxItems should stay at 5 but minItems should=20
> be set based on the compatible.

Sounds good to me.

> > reg:
> >    items:
> >      - foo
> >      - bar
> >      - baz
> >
> > etc.
>=20
> I can do. But they'd all be something like cpuN-event. The way the=20
> driver is written it grabs a timer for each CPU and uses the next one=20
> for a global timer.

I think it's fine if they all have very simplistic names, their roles
should be documented somehow.

Cheers,
Conor.

--72/0f+nl4k9+kRLS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmgKgAKCRB4tDGHoIJi
0meqAQC8j5BEwXHy4TeXKS37GL/K4+lldlY8ECFGCT/7scItCAEAiT0zRYX9JJix
9JKuz3kg+oujYnMFPsUSFvVDAFt7/Qw=
=Uzax
-----END PGP SIGNATURE-----

--72/0f+nl4k9+kRLS--

