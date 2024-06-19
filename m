Return-Path: <linux-mips+bounces-3744-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F390F5D0
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 20:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B7831C212CC
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 18:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE740156F39;
	Wed, 19 Jun 2024 18:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQ4OPWIt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF94C1CAA2;
	Wed, 19 Jun 2024 18:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820818; cv=none; b=DWC9BNAauM3FQMgr44rbvyKCYliGpm7LDfzQj5scjRmQ64eaIlbaxcYtt0cVDSFIBUlmEQ7XKm4nCKnakmjHofYkYTxnhkf9FIinURSAWpzHOOyfnjGDRQqk4W4jBm9GrzNTueYLtACfhcOTouuxKJmi3gXAzaVlwOTkzPv3o1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820818; c=relaxed/simple;
	bh=jQ350hWNQNEF+QIPUhbhSXFLJT/hEkaoG2NqYHuZChE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssb4nkF5UVP15lqpStIYmTpg/lORXuqHVakK//IwN5SIrmywv43FyNgzSpgDJDqgQtSvtwMTGNntwEoFlAodpcYL/4vVTO74ExpehSkXxt7p66S6j5bgh7gS3OrRPjfHbQ7khAL32EbIvaflQ8djc19gP6LOpfzr57JTuYMraOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQ4OPWIt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E37C2BBFC;
	Wed, 19 Jun 2024 18:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718820818;
	bh=jQ350hWNQNEF+QIPUhbhSXFLJT/hEkaoG2NqYHuZChE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQ4OPWIt0F+aBz3HBGG4uiDemdaXnQF108MrIGWVOqMJSJzYdGYgGWag/a3LsCOaX
	 QiFiqQWDPht76vC1Xk5unXmQJl7IY//fqwsJkFyBAtVwaqyFpxu/eqDMnQxso00Abz
	 BnhDjBETTM1S4BERRGn7rNdcnTQk7DqHUs2JgxwMXBOZhEX7BfqZHjZmkHlHirGYGm
	 Hu8vyOPL6ldhxLoti2Zub1lb+Nu9YxoXPfS2u8hl/x6mFjXx14rf+Z9a/xDhqLcAq4
	 z8oll2GMlix5ft6c9FMd894UhGOY5peo3fbb3oUnB8jNLH9znHK23EBsoEPeNSHdFs
	 qWkcaNiGvGVOA==
Date: Wed, 19 Jun 2024 19:13:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] du-bindings: mips: cpu: Add img,mips compatible
Message-ID: <20240619-joystick-broadcast-c1d37b923eb3@spud>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>
 <20240612-unstuffed-figure-966c90af52bc@spud>
 <ddb36d6c-b54f-4982-b9ca-48c022ce6eb8@app.fastmail.com>
 <20240613185902.GB2286020-robh@kernel.org>
 <dfb545a6-b8c2-4498-aa01-3e851fe0877f@app.fastmail.com>
 <20240615-reaction-movie-b4c21f2c7d91@spud>
 <5c51085b-6e6c-47f8-a68a-829ddc7ba74d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w5J5qdwPEV2LTuB+"
Content-Disposition: inline
In-Reply-To: <5c51085b-6e6c-47f8-a68a-829ddc7ba74d@app.fastmail.com>


--w5J5qdwPEV2LTuB+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2024 at 08:16:11PM +0100, Jiaxun Yang wrote:
>=20
>=20
> =E5=9C=A82024=E5=B9=B46=E6=9C=8815=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=881:28=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Jun 13, 2024 at 08:40:18PM +0100, Jiaxun Yang wrote:
> >>=20
> >>=20
> >> =E5=9C=A82024=E5=B9=B46=E6=9C=8813=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=
=8B=E5=8D=887:59=EF=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> >> > On Wed, Jun 12, 2024 at 05:59:24PM +0100, Jiaxun Yang wrote:
> >> >>=20
> >> >>=20
> >> >> =E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=
=B8=8B=E5=8D=885:39=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> >> >> > On Wed, Jun 12, 2024 at 12:56:26PM +0100, Jiaxun Yang wrote:
> >> >> >> This compatible is used by boston.dts.
> >> >> >>=20
> >> >> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> >> >> ---
> >> >> >> note: This is a wildcard compatible for all MIPS CPUs,
> >> >> >>       I think we should use something like "riscv" for riscv.
> >> >> >
> >> >> > riscv systems, other than simulators etc are not meant to use the
> >> >> > "riscv" compatible. All of the real CPUs use "vendor,cpu", "riscv=
".
> >> >> > I'd suggest you add specific compatibles for your CPUs.
> >> >>=20
> >> >> Boston can be combined with many different CPUs, thus we need to ha=
ve
> >> >> such compatibles.
> >> >
> >> > Then you'll need different DTs. Different h/w, different DT.
> >>=20
> >> The board have 9 CPU types in total, with hundreds of different possib=
le
> >> CPU topologies. Maintaining separate DT for them seems impossible in k=
ernel.
> >
> > But you could definitely add 9 different compatibles for each of these
> > different CPUs.
>=20
> They are already in current bindings, but we need a default one to fill
> in kernel dts.

IMO, no you don't. I don't think some "default" dts does anything other
than promote not correctly documenting what the CPU actually is and just
using the default. I'd reject the "riscv" compatibles in isolation if
they arrived now & demand a "qemu,riscv" or w/e compatible.

>=20
> >
> >> We can potentially patch this in bootloader, but for existing firmware=
 it's
> >> being doing like this for years. I can see for RISC-V QEMU generated D=
TB is
> >> using a single "riscv" compatible and I do think it's a similar proble=
m.
> >
> > That "riscv" compatible is only supposed to be used for
> > simulators/software models. Real CPUs are not meant to use it. AFAICT,
> > your boston is a real platform, even if the CPUs are implemented on an
> > FPGA they should still have one. If you take the OpenC906 RISC-V CPU and
> > put it on an FPGA, you're still meant to put "thead,c906" in your DT.
> >
>=20
> And sadly, boston is also the platform used by MIPS internal emulators :-(
>=20
> Thanks
> - Jiaxun
> >
> > =E9=99=84=E4=BB=B6:
> > * signature.asc
>=20
> --=20
> - Jiaxun

--w5J5qdwPEV2LTuB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMfzgAKCRB4tDGHoIJi
0qLOAQCxs6Ttljb48q1RQ5keEJDU1zyZeZCoJD6Erz1IkAUV3gD8DVTC9euCscn6
YiF0jiirvlZe8hxgDTwwd9Rybkbi2g4=
=Sbte
-----END PGP SIGNATURE-----

--w5J5qdwPEV2LTuB+--

