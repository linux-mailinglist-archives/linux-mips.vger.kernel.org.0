Return-Path: <linux-mips+bounces-3176-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685C8C0273
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 19:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB8EB1F243F4
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 17:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AC68828;
	Wed,  8 May 2024 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfScOLOR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C847DDDD2;
	Wed,  8 May 2024 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715187667; cv=none; b=RK3fQAr3g1a43DBktoyW6FAzNoLteq7TkoHtuCKbbPKvPTm4h3FsOtX6zwXQTLGkoIkKz0hfwVFDixfinqTFV8Vg4Abt/32yhaACAw0btG4cJCVRcT5iki00hHWmiZax1I1+G5r3xA8xYxRdpo/Y4lBdqYmI8qtZDxu37fWUAmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715187667; c=relaxed/simple;
	bh=STM3fI9GyHweIwkuRf0VR/kVGXkNc6VIGqBgZKTd3ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyIpTt4rZdRoBYgyzhFQrKyu94UiA7JT3PWo4hxLc6eytIXnHiUANh/pwjk1oxPH7KQ/qGzP9MnZlyzB80L/EvnRTtTJ2UODdZV5XXS9bjl5l0E6nd5jkDEvyZ5CcGBXKNv3hsnBzh1LGvJpV5cnPl0+Mi9qDV/nVGgqp7z3CfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfScOLOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55029C113CC;
	Wed,  8 May 2024 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715187667;
	bh=STM3fI9GyHweIwkuRf0VR/kVGXkNc6VIGqBgZKTd3ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfScOLORS/pkJar9tewfFa5frHmMHnT+LrmuC494vapwjBZ3A7mwT3ApzF/dGf8Jp
	 0Bpdlnt9bXIYYUHmaZyaehVQUOLa29TK15ziK1WUnGUjEwgyevk6zDhqYPrLSgoZMz
	 +tQjrlfZZMK4odyzAAAIV3F4SAtosgVNj6YMYg1IOFUVyh41n+84Cx032dYbxvShtC
	 DWlbbvP/Ug9HWlz/BZpOYBy2TW2yNc30pCPnPffremMMcWUwIPDk1zWcQI7Es2A27i
	 JwuzxbxvzShmCL3y7A4n734T/GVhQNVE6tHTxSICEF2VT8RpRQ7ujHxqo2339KQ/zt
	 nmI9TAN/vcxWQ==
Date: Wed, 8 May 2024 18:01:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "paulburton@kernel.org" <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: mips: Document mti,mips-cm
Message-ID: <20240508-puzzle-directive-b6f771f92fe9@spud>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
 <20240507-cm_probe-v1-4-11dbfd598f3c@flygoat.com>
 <20240507-jokester-antelope-808b21b957e6@spud>
 <fbb4b8e2-edf4-4b4e-8b71-154a09f24ccd@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L+OpDBD0ahnwdeqe"
Content-Disposition: inline
In-Reply-To: <fbb4b8e2-edf4-4b4e-8b71-154a09f24ccd@app.fastmail.com>


--L+OpDBD0ahnwdeqe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 07:16:25PM +0100, Jiaxun Yang wrote:
>=20
>=20
> =E5=9C=A82024=E5=B9=B45=E6=9C=887=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=885:50=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, May 07, 2024 at 10:01:52AM +0100, Jiaxun Yang wrote:
> >> Add devicetree binding documentation for MIPS Coherence Manager.
> >>=20
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >>  .../devicetree/bindings/mips/mips-cm.yaml          | 37 +++++++++++++=
+++++++++
> >>  1 file changed, 37 insertions(+)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/mips/mips-cm.yaml b/Doc=
umentation/devicetree/bindings/mips/mips-cm.yaml
> >> new file mode 100644
> >> index 000000000000..b92b008d7758
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mips/mips-cm.yaml
> Hi Cornor,
>=20
> Thanks for your comments.
>=20
> >
> > Filename matching the compatible please.
> Ok.
>=20
> >
> >> @@ -0,0 +1,37 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/mips/mips-cm.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: MIPS Coherence Manager
> >> +
> >> +description: |
> >> +  Defines a location of the MIPS Coherence Manager registers.
> >> +
> >> +maintainers:
> >> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: mti,mips-cm
> >
> > Is it actually only available on mips? Google seems to report there
> > being Coherence Managers on their RISC-V offerings too.
>=20
> I think for MIPS's RISC-V system, it is only used by SBI and transparent
> to kernel, so it won't present in DT.=20

Devicetree isn't just for Linux, things that only the SBI implementation
cares about should also be documented in bindings - or at least I try to
get them to be, where I have enough sway to have it happen..

> Register fields for RISC-V system is totally different with MIPS one, and
> there is no driver to be reused. In MIPS system CM code is highly coupled
> with arch code, so for RISC-V if we want to expose it to kernel we'll need
> a new set of driver and a new binding.

Right, that's a reasonable reason (lol) for having it be declared as
mips-specific.

> >> +  reg:
> >> +    description: |
> >
> > The | isn't needed, there's no formatting to preserve.
> Ok.
>=20
> >
> >> +      Base address and size of an unoccupied memory region, which wil=
l be
> >> +      used to map the MIPS CM registers block.
> >
> > This sounds like it should actually be a memory-region that references
> > some reserved memory, not a reg, given the description. I think the
> > commit message here is lacking any information about what the intentions
> > are for this binding.
> So it's actually a register block that can be remapped to anywhere in
> MMIO address space. DeviceTree usually passes firmware's mapping location
> to kernel.
>=20
> There are some other similar bindings like mti,mips-cdmm and mti,mips-cpc,
> I just copied phraseology from them, should I try to explain it more here?

The description that you've given here is of something that sounded
awfully like mapping into a location in DDR etc, is it actually being
mapped into a non-memory address?

Thanks,
Conor.

--L+OpDBD0ahnwdeqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjuvzwAKCRB4tDGHoIJi
0hWmAQDczIwGwAw6NKsPZytb5KFOytlrWSv+Tv2mAiWS/KhzmQEAhfoJKb3390mf
xqMiTAXMuYU+iAjqyZfpWgcymnsVBQY=
=GnaL
-----END PGP SIGNATURE-----

--L+OpDBD0ahnwdeqe--

