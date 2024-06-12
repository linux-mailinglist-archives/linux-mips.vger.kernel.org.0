Return-Path: <linux-mips+bounces-3630-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D54F905952
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 18:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9425284B2B
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 16:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4450181CE7;
	Wed, 12 Jun 2024 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5zfqpLy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D8116C865;
	Wed, 12 Jun 2024 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211586; cv=none; b=IusQoXa41HJqwxcpWxNk7o3kwqZxsTqeEr4zI7Qm9zJuvm9VnCmbWv+GnEi6YTlU2WOaefEhMSsKeVEXWlc+Q5V7E1kFeCicj9WMyBRlSc1PwNFSOxgxXvmbi5gJiAn54wa9rq4WGNFfhceVyo41EzTTZNyr28AcDHeOj27Vjek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211586; c=relaxed/simple;
	bh=TjkTOGYJvxhn3IFj+Aa1QC/4Xv4t2bo37LIvGAbgf2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZDzLctF2AN0gYa2jwGdTsJiIsKLWqOUS4IEPAIf8YdA/evhpCDrwzPYSJrGdeIaVhVlu93TPvFqzjvPBXWCi+eNZRxLcZBfM1qFBJ0cOTQHaUfd0JQDLjhW2B/qJ+SJX2AZtq2RdTMlAJibx/SqaVt9rstno8EfZYZUnnM2BRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5zfqpLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6813CC116B1;
	Wed, 12 Jun 2024 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718211585;
	bh=TjkTOGYJvxhn3IFj+Aa1QC/4Xv4t2bo37LIvGAbgf2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5zfqpLyTZh+7fGHMxszI7HdYWfCSB4IUs1UIwX4662kuaZdmUEBTWoQm11IcEQf+
	 Tbx0d+T5fYhS7ilk4KvYRY0/ztP3JxOVnm28N3GGxos+P8KvIHYVRD5lnvGUfOTuV0
	 lR2S10/n/srUTIUjwlmY4kBH6bYW9i7HFrhkfr1yFocLOaE3JIi2W7XEdjBpALsAOp
	 PdE5MLLU1rNWPGDj57J9c/qONdDG5f8EmzU/8p+wBmWce1r/0G6MUDI9Qp+pEm4uul
	 QzQ9bYDZwK1e/nESGmiyQOZHjoj2tS5fs738gkKozR8GyeEo/x3zzx/9k8tnDezHvD
	 pZjIs1JGSPHKQ==
Date: Wed, 12 Jun 2024 17:59:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"paulburton@kernel.org" <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 8/8] dt-bindings: mips: img: Add devices binding
Message-ID: <20240612-purr-tribute-6842361c9815@spud>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-8-9f8e1a07fa63@flygoat.com>
 <20240612-styling-deafening-2cdae7cf0b55@spud>
 <c991ca40-5b9d-45fd-a4e8-4fe6930c2968@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wivKV2f+RbzZ0mjW"
Content-Disposition: inline
In-Reply-To: <c991ca40-5b9d-45fd-a4e8-4fe6930c2968@app.fastmail.com>


--wivKV2f+RbzZ0mjW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 05:57:55PM +0100, Jiaxun Yang wrote:
>=20
>=20
> =E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=885:43=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> [...]
> > Usually the order used here is something like:
> > compatible =3D "vendor,soc-board", "vendor,soc"
> > The pistachio one seems to follow that, but AFAICT "boston" is a board
> > and the order in this one is something like:
> > compatible =3D "vendor,soc", "vendor,generic-fpga-board"
>=20
> Boston is an FPGA & Emulation platform, so I don't have a good answer
> for what should I fill as SoC.

Ah right. Probably worth adding a little more information then as to
what the platforms are in the commit message in that case.

--wivKV2f+RbzZ0mjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnT/QAKCRB4tDGHoIJi
0v5DAP90k4Esoh+eoqMy0Vlvpm9L9SwvBY186/zVVasiRxhMyQD/TCS2WhwasDyY
0rd2rzOI4qvBHgqEnZFnrNan+APTpQo=
=/eIf
-----END PGP SIGNATURE-----

--wivKV2f+RbzZ0mjW--

