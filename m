Return-Path: <linux-mips+bounces-12421-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE56CADFA4
	for <lists+linux-mips@lfdr.de>; Mon, 08 Dec 2025 19:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8BDB304FB95
	for <lists+linux-mips@lfdr.de>; Mon,  8 Dec 2025 18:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DC528541A;
	Mon,  8 Dec 2025 18:24:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87798281532;
	Mon,  8 Dec 2025 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765218248; cv=none; b=RCc0Lu3UyTZWLDCGLdyNe9+9WIuoiN3hXvFbbztYMuXJDTFnCexxh/FYo4cDs5ae8h71vHAqnSCv0OrM0uLByEivfrPc5hHTseicVMpRwwe7+Aab2CG1bR1DtahgpMtCp50PPtAgBgZE9pcS5c1xWvDcgCpLQ6yDyKmS/bH+oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765218248; c=relaxed/simple;
	bh=W+NLJSeImOKki1mt9PgOe3q9Sm0BkibwAiwXq+bh4gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fn0UnnhhBcOro3RbfbVBGZM0UlUBz3qBIeAe5Aq00MTbYN7185IIZ5PjuRS1P6tMzDjJl9lOB684ZbTyefrO/1d5t1LGOjzubRTJqPGf+ole35I1Yg3uD+RAPSMbDX6AHAW+iNjRrtPKfqNl4RiYshaODLrIyWs/pFQfVcN5IiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 585021F8005F;
	Mon,  8 Dec 2025 18:13:59 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id BE08DB121CD; Mon,  8 Dec 2025 18:13:56 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 74EE8B121BB;
	Mon,  8 Dec 2025 18:13:53 +0000 (UTC)
Date: Mon, 8 Dec 2025 19:13:50 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev,
	linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mips@vger.kernel.org, asahi@lists.linux.dev,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	chrome-platform@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-sh@vger.kernel.org, x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
Message-ID: <aTcVXrUXVsyjaT22@shepard>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z9eEZ2V8rb9VqsSG"
Content-Disposition: inline
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>


--z9eEZ2V8rb9VqsSG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
>=20
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that we=
re noise).

[...]

> DRM_KMS_DMA_HELPER ---
> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER

For these two, the symbol was removed in commit
09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
missed by the batch rename or were introduced a bit later.

Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
drivers), it should be replaced with DRM_GEM_CMA_HELPER.

Are you expecting to craft a patch for fixing this or should I do it myself?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--z9eEZ2V8rb9VqsSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmk3FV4ACgkQhP3B6o/u
lQxHMA/9EINPzAC/mNsqKqe+ejzVAFDvbkqgtj46jdHchIRyg5QqUNEoQvUKACwR
bZftHenlJS3ho4n0eejvmJG9LkV6HYA4X0vXrPKGJTBCMgy1CUl7j7v8ZFn7qhcc
KmyK3klG9hxRNAFrMTlxaE3uzNZWaZ56eEINuq5RkJWv5ieiadTkXR03L4x2l++z
B1RqTh3yh5d57Ckfs7lLGfmiDUQAkhdAm1CASv6bO1jKRiyhuSN95aOZFZ94DV+m
oV44vbSx4aXyh1lb07PxtPMa+WITGI6/mW0+TKhRNd0eAoO19K0zkSNA18KjgiOw
3m/4Vs1pdWSKCTDIgtcymufTpdjqWt5LEpxEuzLprgUXrpoQbS7paAfhB4Ex6yIR
CcQfarVp0SM0/OI5kZc40xoz6UEHrCjw7+loxHuUV+2KHAhfRlQhLcScrQXUO/X3
L2vzAFURuGyVpPbZnq2ftkMT4h6o+W93ZtKP8vIHJjDijdwM3NAt90FT9byKXAYP
AvVBPERmf9+savPI0eDYuO825wAcF3D2rvF4ZElPj4+OD6sq93Z52bDN3CUFHsMD
tKp3GKwBxZ0ENUxQZvrIINzLx40EXOq/MDI1JZd4Nl89W5BBk6QGIRE4hj0FNctf
+4gCjq9z339Ik0u6aVtzq/jdewPuTo2wZ5DVPxsH1RyPX2cBWAg=
=azY3
-----END PGP SIGNATURE-----

--z9eEZ2V8rb9VqsSG--

