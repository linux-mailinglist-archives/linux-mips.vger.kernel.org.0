Return-Path: <linux-mips+bounces-10866-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A03B3E233
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 14:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2F2B189CF4F
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 12:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2D625F975;
	Mon,  1 Sep 2025 12:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="subnAYt3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F2254B09;
	Mon,  1 Sep 2025 12:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756728420; cv=none; b=IE2cMFZjf1UQQvMZeiGckhKoTftTKt8VJ5tVebrpgle7EyPDy8eRGY6Wds25tYMzjg3vs7gJ01oYxdyvpdVJW9HHd7id9sEwUlfSzXU+eCHlta5Mj4sRJb7wKe8si8gw5RiaUfjlaCfuvN49lQF6N/Gcmp+mrSd9fGAn4ZKeMiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756728420; c=relaxed/simple;
	bh=KLozvW2/PZEE4MLEPg7Ckr+Jd7gWELOn6bfbOk7IAwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUT9oqMqyXpIFydXbq+pD/vAqZKgIdnTH2LYCUxuaUvSH4IMe5wSgvMBolr3zwCxzlse/xGP18jXnAld2zc57zRmQAyfvQwjJ9a6+G3wkfQEAYVegFvGVFbX4+FVGtYBhOMmF+6jBsEG4q+u92kX2H+UEmpVOUCZONt7rO5LF+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=subnAYt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750A4C4CEF0;
	Mon,  1 Sep 2025 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756728419;
	bh=KLozvW2/PZEE4MLEPg7Ckr+Jd7gWELOn6bfbOk7IAwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=subnAYt3W6iRYWiLe4R1hyk02hHWugF12CkdwNtfWO6oweESVzkr4HHQSgrGdK/hQ
	 8F1KuLkxbirhX9eTa+UlHzROt6oVHRMDVtFWN5s14w38M5Is6TmFeJ5JJ8je4krspg
	 pBRIf5eDDzE+sPD131SIUvsN9YtFG8xjdavT9OTqqYxDYZRUulC8RH0fZzQh+efv6M
	 zm0xO5wdKFGcsgmWDEVbNVw84C2PinGI3Z8RXMoIob2mUpV8kkm7QMdnJyTfUcaJ1e
	 cCDoP5GnBM8z+lPd7plFSP8PsGAkGVMDl6cqmwfcIkGDifWC/YBbKkp9x6hig/ZOBh
	 elTOdLAEWl7eQ==
Date: Mon, 1 Sep 2025 13:06:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 06/15] pinctrl: imx: don't access the pin function
 radix tree directly
Message-ID: <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ck2hWlO4+9LtMqEh"
Content-Disposition: inline
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
X-Cookie: Auction:


--ck2hWlO4+9LtMqEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 06:00:14PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The radix tree containing pin function descriptors should not be
> accessed directly by drivers. There are dedicated functions for it. I
> suppose this driver does it so that the memory containing the function
> description is not duplicated but we're going to address that shortly so
> convert it to using generic pinctrl APIs.

This is still failing for me:

[    0.628221] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000000
[    0.636506] Mem abort info:

=2E..

[    0.801855]  __pi_strcmp+0x20/0x140 (P)
[    0.805704]  pinmux_generic_add_pinfunction+0x28/0xe0
[    0.810777]  imx_pinctrl_parse_functions.isra.0+0xf8/0x4a0
[    0.816289]  imx_pinctrl_probe+0x404/0x520

Full log:

   https://lava.sirena.org.uk/scheduler/job/1758025#L704

--ck2hWlO4+9LtMqEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi1jFcACgkQJNaLcl1U
h9BGhwf/dS46HMJilXSgdHmEKJbp5ioFAwW8a4pof2TF7vY7Jpo/qiFqnKkvqhYC
tZO4exJFROsDCUKlVPp+Qawyyhy3CCU2p+vHcuz8p07gmzIEOw9QkjMf8IMlPGyA
UKEr+nQae21YF/iNRFDQGH9hqHAT76YwExslci+ilyDzaJeWu6ACPhVMFMNO9a/q
BjCieo2alJTBGdLUFgFDoMmVmqebVqIBYO0m966vo/efy8UG1BTlGE++FYa1OVnt
bVDlzyyNsdl94L6s8pxhABsajGCsOXj0inSK7SXdnJ4XusoEfuSIKKSieCGsjMEG
qkdS6DTMFfXrzPQZI5S3dgsmyVchug==
=JXXf
-----END PGP SIGNATURE-----

--ck2hWlO4+9LtMqEh--

