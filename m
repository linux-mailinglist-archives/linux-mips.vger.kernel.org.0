Return-Path: <linux-mips+bounces-3128-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662B8BE6F1
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 17:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38C061C23C8C
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E0F16132B;
	Tue,  7 May 2024 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNc9FF0V"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332416130C;
	Tue,  7 May 2024 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094450; cv=none; b=R56WgsADhwpnUmVXd1JgmEH8hCKr5csfJvJxHY+cJTjii1v4SisHwfvOYjLNgnl9vUwMsS4g1I9B++IlNWKy3i7rXHsbrn/lbIzy4bQEllEpds2v6ulxR3ZJgCEtKWS4AOW942QFfnNWlQ751dVJKRQYP6v9oz7UZ1twYPL9m5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094450; c=relaxed/simple;
	bh=rmiC3JnKmBcWgPnAg0VDBYhfRMugYPaV56OZGdQbX34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpeiaCjWYtQQ3kpRjBEoDJl8mcHUpO2yk8Vp0oQudzOHzsmq5CY6zre4B/rrsAVOKc7fl1rf+FHuJwQTGGFvtK5rhMzs7DEjfoqKGfMzsNBmhp31Xek+TlyhxYDLlLv74Q/0cv8EPrbKSPu9L1UZh11WJXmh+uR8DLCPY6jXm2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNc9FF0V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647DFC4AF67;
	Tue,  7 May 2024 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715094450;
	bh=rmiC3JnKmBcWgPnAg0VDBYhfRMugYPaV56OZGdQbX34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNc9FF0VrQyTm6l1JVOX/0SKwqOybxPrWTD40BeRjByFfpr2W19AKZSYidEKzO54u
	 sBL8FeLvkxb0F6a+c5OeEz+j2pj/C8ZSiJaSHB9gb0JByOqEOmd8JySxT0WAIaJDCC
	 B8WnLbMyyV+ja93ENqofeQ6X6Mg6LjnOasES3CwxMX72rGvydFazpOkj6k1/17FXfM
	 QYe2Ksb/eOnGNJzXBcOeUYl30MQSLaM+089HchyASRNRYIIfgQJ2ndF7N/JCxTRpLO
	 nQicEq6gO4Ygc+HBvnQTJxLjV6ukruoFGNrfk3mVZJnJMaNi2t1wkdpQeFcuru7EFu
	 KgKzkBxjEt3sQ==
Date: Tue, 7 May 2024 16:07:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: mips: Add bindings for a new Mobileye
 SoC EyeQ6H
Message-ID: <20240507-sprint-legacy-892f3026e875@spud>
References: <20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com>
 <20240506-eyeq6h-v1-1-f29b5269cc43@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JY9djc8wQW9Fnnmg"
Content-Disposition: inline
In-Reply-To: <20240506-eyeq6h-v1-1-f29b5269cc43@bootlin.com>


--JY9djc8wQW9Fnnmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 06:16:10PM +0200, Gregory CLEMENT wrote:
> Add the yaml bindings for a new Mobileye SoC: EyeQ6H.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--JY9djc8wQW9Fnnmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjpDqQAKCRB4tDGHoIJi
0mGTAQCxKEHeq65HQJ+W2pC6vZsej4nn0f6K1DICEPbOEJ2KSgEA9r/OkmuT70Lp
iZRaR5QOYvhNCsqPNexd+Ua12q0TUgM=
=6XKs
-----END PGP SIGNATURE-----

--JY9djc8wQW9Fnnmg--

