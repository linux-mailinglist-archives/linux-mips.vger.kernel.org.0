Return-Path: <linux-mips+bounces-3190-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00B8C13FD
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 19:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CAC41F244BD
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 17:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D42110A36;
	Thu,  9 May 2024 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoDS76sy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4CEC2ED;
	Thu,  9 May 2024 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715275468; cv=none; b=bCeLMKnp6ar7HlZwhjdTUEqVuc8nW9GXUL2TJtDzBskzhJBxkLQ98t8KU7K0mLTc3TxLl6yDx1oZkVoHS9HiDX3htJo7UQkwKW2tm6SH6flmI3hCTChLysHSjqlPATN9KjcFMY+1WF4t68y5ZReYFpUo4AfYfpU7HFLaLjN2tkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715275468; c=relaxed/simple;
	bh=Hjq02dwS2sb5bxjvJqeSXUaXB4HOcENIQBuKUe3e6EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQdmvnHhe9pZ9pNceCpsAFaFNSoZgJ8blvNgjTsdgvS4Ioq3DHG/bnYm1tdnHHoPs4LPRQcenrJaSbA1xQ6T2JTsFOOtNx2kRuLwVaYzwh3VA6jCWQZ6XzhUTdZynl6rF6AgaiIGXZxNej6uytwhFlnOXO+l75RYTwhdG2B52q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoDS76sy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FA6C116B1;
	Thu,  9 May 2024 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715275468;
	bh=Hjq02dwS2sb5bxjvJqeSXUaXB4HOcENIQBuKUe3e6EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZoDS76syiw4B/jq5SjSNXYTmMkWgnVhMsg/b7dzxsRTi1CF/m/w4uFr7I3RiiArYJ
	 9bLmzVIEYYicuqM6bl3hrKRaswnGvPTe4zWZ2Kar1UH3qmjWDqySFnSwSxZU+f54+d
	 a86mbEezgsIHDAyyTJquIbYG6PrxDpuEt9DjBznvj3BExHL0SSunylFmf7c7wukmn+
	 AxtiG6bnTU2INqGiHZg0pz+gDjrP/lTvmMYkFUYmcA18JJduATKtbusiJ+008EztDn
	 hNQULshB4JhjAOMjCJOdZSKPSHagLaHEYUGF7VNLg8JwlIQZ0nHjTKG7DqBqmQaE3T
	 V+C55t5wMZbgA==
Date: Thu, 9 May 2024 18:24:24 +0100
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
Message-ID: <20240509-maimed-wharf-555787f5d773@spud>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
 <20240507-cm_probe-v1-4-11dbfd598f3c@flygoat.com>
 <20240507-jokester-antelope-808b21b957e6@spud>
 <fbb4b8e2-edf4-4b4e-8b71-154a09f24ccd@app.fastmail.com>
 <20240508-puzzle-directive-b6f771f92fe9@spud>
 <42f91b62-2bf9-414d-ad05-6770282637f7@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MugsB6SaPrl37OTd"
Content-Disposition: inline
In-Reply-To: <42f91b62-2bf9-414d-ad05-6770282637f7@flygoat.com>


--MugsB6SaPrl37OTd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2024 at 09:28:27PM +0100, Jiaxun Yang wrote:
>=20
>=20
> =E5=9C=A8 2024/5/8 18:01, Conor Dooley =E5=86=99=E9=81=93:
> [...]
> > > So it's actually a register block that can be remapped to anywhere in
> > > MMIO address space. DeviceTree usually passes firmware's mapping loca=
tion
> > > to kernel.
> > >=20
> > > There are some other similar bindings like mti,mips-cdmm and mti,mips=
-cpc,
> > > I just copied phraseology from them, should I try to explain it more =
here?
> > The description that you've given here is of something that sounded
> > awfully like mapping into a location in DDR etc, is it actually being
> > mapped into a non-memory address?
> It is an overlay being realized at CPU core level so it can be mapped at =
any
> where, but the firmware convention is to map it to a "non-memory address".

In that case, a description that even eejits like my can understand
sounds like all you need to understand :)

Thanks,
Conor.

--MugsB6SaPrl37OTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0GxwAKCRB4tDGHoIJi
0kqyAP0fDiEStQ6JcYJzsw962RPlPtomFrmdBAU9SQAQGiR65wD/UnGLN9Qa1HT7
sLegR6jS7JDKrIjxkTK2Bk1uWH0miAo=
=Y91o
-----END PGP SIGNATURE-----

--MugsB6SaPrl37OTd--

