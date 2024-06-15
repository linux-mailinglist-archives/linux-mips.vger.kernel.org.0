Return-Path: <linux-mips+bounces-3688-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 945ED909850
	for <lists+linux-mips@lfdr.de>; Sat, 15 Jun 2024 14:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA5E1F21CC9
	for <lists+linux-mips@lfdr.de>; Sat, 15 Jun 2024 12:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63AE45C14;
	Sat, 15 Jun 2024 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ek5WpUKf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973513F9C5;
	Sat, 15 Jun 2024 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718454541; cv=none; b=OPFDj5d8A5hGcausJOxZ1e/CBerLLJ73b5p+V2A9J6m1UewbVqUud856lKvbJUKF2v+FRxqpB3yfXMux+LWtxz5JGh+ACNN/g5uVDlpHaMqrnaRzmoJ9dDsdb+VWohoBcm7nflhjFjRNiAukRxa44NqPYSjkxqMjeyXSFWf5j3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718454541; c=relaxed/simple;
	bh=RaTAnhVIlkpDEE+yfgbEyJaQBEXDFiPMDuwsBS+7ucA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvL/ktiZ6J7eAEgo0hS2HEF5KCVn1FoU7y9vGo7So7QuACnslI5iIdeKELxmlNKWE5Xv80WblrWIayuDK14WEFOnRRxhKCTusl0UhN7B5v2n3WoVAeIqQtvgLREcTGplD/kqqGVxXL6wavu1iXGcDwJWTEMBv8F2kZONzS6RFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ek5WpUKf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E58C116B1;
	Sat, 15 Jun 2024 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718454541;
	bh=RaTAnhVIlkpDEE+yfgbEyJaQBEXDFiPMDuwsBS+7ucA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ek5WpUKfSeg3pJsF/wXAU4BCWs5pdismhzTlqKNvCRWpjTAvrQwBEooY59CQ2/pEQ
	 Fxayyb+r7MheN5iVDYmsDbyPVdE8V3ZleJAs+IoY/YvWUcYfXKbna4fmsFutpXyyNr
	 1s4tTkNzlBxhRkeXc5SDmwKLuXRMVxBXlLD7z9hMeegxNbgqM3DdzA3QzxWM67roJI
	 ONxuKaNjwB6fxGkYl9j405Yg9xQa9YzkOyOGsf+sOIWFWN4hIOobStNQUxM7YNm1MI
	 LCkKAvzsR1/JElEgGfeUPaubVAGUmyz2SL7rDrESnLepj83YYTp6T+Qrko9ACpjxEX
	 CeWY61oVS0DQg==
Date: Sat, 15 Jun 2024 13:28:57 +0100
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
Message-ID: <20240615-reaction-movie-b4c21f2c7d91@spud>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>
 <20240612-unstuffed-figure-966c90af52bc@spud>
 <ddb36d6c-b54f-4982-b9ca-48c022ce6eb8@app.fastmail.com>
 <20240613185902.GB2286020-robh@kernel.org>
 <dfb545a6-b8c2-4498-aa01-3e851fe0877f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wExznsS/WrtDRpyq"
Content-Disposition: inline
In-Reply-To: <dfb545a6-b8c2-4498-aa01-3e851fe0877f@app.fastmail.com>


--wExznsS/WrtDRpyq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 08:40:18PM +0100, Jiaxun Yang wrote:
>=20
>=20
> =E5=9C=A82024=E5=B9=B46=E6=9C=8813=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=887:59=EF=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> > On Wed, Jun 12, 2024 at 05:59:24PM +0100, Jiaxun Yang wrote:
> >>=20
> >>=20
> >> =E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=
=8B=E5=8D=885:39=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> >> > On Wed, Jun 12, 2024 at 12:56:26PM +0100, Jiaxun Yang wrote:
> >> >> This compatible is used by boston.dts.
> >> >>=20
> >> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> >> ---
> >> >> note: This is a wildcard compatible for all MIPS CPUs,
> >> >>       I think we should use something like "riscv" for riscv.
> >> >
> >> > riscv systems, other than simulators etc are not meant to use the
> >> > "riscv" compatible. All of the real CPUs use "vendor,cpu", "riscv".
> >> > I'd suggest you add specific compatibles for your CPUs.
> >>=20
> >> Boston can be combined with many different CPUs, thus we need to have
> >> such compatibles.
> >
> > Then you'll need different DTs. Different h/w, different DT.
>=20
> The board have 9 CPU types in total, with hundreds of different possible
> CPU topologies. Maintaining separate DT for them seems impossible in kern=
el.

But you could definitely add 9 different compatibles for each of these
different CPUs.

> We can potentially patch this in bootloader, but for existing firmware it=
's
> being doing like this for years. I can see for RISC-V QEMU generated DTB =
is
> using a single "riscv" compatible and I do think it's a similar problem.

That "riscv" compatible is only supposed to be used for
simulators/software models. Real CPUs are not meant to use it. AFAICT,
your boston is a real platform, even if the CPUs are implemented on an
FPGA they should still have one. If you take the OpenC906 RISC-V CPU and
put it on an FPGA, you're still meant to put "thead,c906" in your DT.

> I think it's better to document it and warn people only to use it in limi=
ted
> circumstances, instead of keeping such usage in grey area.
>=20
> >
> > No way we're taking a generic compatible like this.

--wExznsS/WrtDRpyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm2JCQAKCRB4tDGHoIJi
0hrQAP9ZMKRb6PuwLNF9W3vEyByWW+d2FcQgNqw90Ghc+9dtJwD+MA3ymrvj4+Wg
SXzI1xoFEHhYv42MKWI3kBIM5JWPVgk=
=PbcG
-----END PGP SIGNATURE-----

--wExznsS/WrtDRpyq--

