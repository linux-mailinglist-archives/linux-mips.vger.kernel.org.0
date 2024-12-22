Return-Path: <linux-mips+bounces-7150-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0FE9FA6E2
	for <lists+linux-mips@lfdr.de>; Sun, 22 Dec 2024 17:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C178163FCA
	for <lists+linux-mips@lfdr.de>; Sun, 22 Dec 2024 16:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D9D190058;
	Sun, 22 Dec 2024 16:37:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4373916BE3A
	for <linux-mips@vger.kernel.org>; Sun, 22 Dec 2024 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734885442; cv=none; b=or7Icx50ioI5pPq9Cv3SmyaujBU6dQ5f6gsfZoOmno0TPJyaisUMV80QBmus3DEYto7Y+lmj3dEy2CCA4b0dE4gVI292SeNGQ0HZKQfOxuq/vjWTmM6AeWUvJ3EUABYP4hBmqkxf6AqXJXchs3iKu1c7QuHXS9rkcT9g5dPwgNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734885442; c=relaxed/simple;
	bh=2SZzl9eyY9Y6QrDQ2UoAg1a3tmLGactrhocsbj0LTrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJZol7CnLhoJRR090KLLpo+4ODBl51bRVi48wp/qEtjAtq6bzQeVA4yWH5Y3SeymldUnDTAtqUuo8vS/dNhvjYQQw+XsBQc1oH9UcRDn1P/ZUnA2OEG8P6lXYuc0tmT6Yu9f79rPmJZ95ShqXBDkX0qhQ4nFuxgqeggXljT5TZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tPOx7-0004fs-O4; Sun, 22 Dec 2024 17:37:13 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tPOx6-004jFX-1G;
	Sun, 22 Dec 2024 17:37:13 +0100
Received: from pengutronix.de (2a02-8206-240a-ed00-dcc8-6079-a37a-d53f.dynamic.ewe-ip-backbone.de [IPv6:2a02:8206:240a:ed00:dcc8:6079:a37a:d53f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 98303393BD4;
	Sun, 22 Dec 2024 16:37:12 +0000 (UTC)
Date: Sun, 22 Dec 2024 17:37:11 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
Cc: linux-media@vger.kernel.org, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, linux-can@vger.kernel.org, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [PATCH v2 3/3] net/can/dev: Remove dead code
Message-ID: <20241222-resolute-calculating-mamba-531d3d-mkl@pengutronix.de>
References: <20241221111454.1074285-1-ariel.otilibili-anieli@eurecom.fr>
 <20241221111454.1074285-4-ariel.otilibili-anieli@eurecom.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5udhwgfvmqoyk63"
Content-Disposition: inline
In-Reply-To: <20241221111454.1074285-4-ariel.otilibili-anieli@eurecom.fr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org


--w5udhwgfvmqoyk63
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] net/can/dev: Remove dead code
MIME-Version: 1.0

On 21.12.2024 12:06:49, Ariel Otilibili wrote:
> The default switch case ends with a return; meaning this return is never
> reached.
>=20
> Coverity-ID: 1497123
> Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>

Applied this patch only to linux-can-next/testing.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--w5udhwgfvmqoyk63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdoQDQACgkQKDiiPnot
vG8eTwf/Sxe/6J1RWnwku+KXTmOwOThsF6STOKJ8i7Oyn/4Mv81WJLFDdUFN6m0b
oVxkXQcDh2pxSkBQyHJ35US9bvRP3K5VkseOtf6O0ialbZFx/yEw2EKeaLC40A7g
L13HTc+uloH652pwA+4826XpvUGhF2GqgnRa2N/Q4ueaUKhnG8Z/nIs9ZIAnrA0P
pNKpPXmmk8bM4I0VN3VgIRqNFn32N7LQu0UVXtrdIbvXOGIk9+8rY4NrXDPhdrBT
7CIVjcz1aFR6FOTTTek9WO5ttE5cOG50xc13n74OgEN13Jh0vSFJQEpMTmnlbqU2
JP6onNgBDXuwpHOZ1yasdRh2HTEhTw==
=9x7J
-----END PGP SIGNATURE-----

--w5udhwgfvmqoyk63--

