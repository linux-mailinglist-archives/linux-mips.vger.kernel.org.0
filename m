Return-Path: <linux-mips+bounces-10718-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE29B39780
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 10:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEC8F68026A
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 08:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A182E3AFE;
	Thu, 28 Aug 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxUz4OE7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C0430CD89;
	Thu, 28 Aug 2025 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371111; cv=none; b=CF1a4N1/A0WlYKH4O2WfhYeLjcOvy57cx8ISulJJBeeVnq/Rkb3GLRm+WDdTv3DOwLPbULPRtszQ6GVRpBPdbgSQwUNvQ7RGYwKeO1FU1o99t/dRoM5hUXYDWE32xRTHOQF2WTma24uSlpn5EiKad2fJu1a4ytT2LaC9Dm7AoHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371111; c=relaxed/simple;
	bh=3YzdMt4Qw41h9On9I6WWC7I2bIUYtljay6e0dtrlQB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9NnpuXbBnwSXIcIu2u23R/XRyrjdiogzPrL5rpKpTYtdQEDM30Bn123ZmbgZuqNh8tDZSivVJmd2ZwAPi1D036B5qDEUApKX9GHCydqvzIuBQ5/4SdWp73OGbFp/aqwrb9LJ6WjQIAbm+3B/m2CEeUlCgwAmL0Ye8bc9TCUm0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxUz4OE7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA74C4CEEB;
	Thu, 28 Aug 2025 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756371110;
	bh=3YzdMt4Qw41h9On9I6WWC7I2bIUYtljay6e0dtrlQB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CxUz4OE7D1NGKWLHEwzYtKgtTZECCDgFwxLLFeEJiE5hR7TF/HdMp0veLk2o6qfDv
	 KrmFmQeAKMvmoCGTsN2QEpErm2Z/n46G4CUgdan/vOqQ9+XQ8CHs5YjX+RarjPGWNt
	 4fgJOJt8RG0sXbgl0kwnayykHV1vIbocYp6VitOqSIqH+RSsoJuBA8wtGEelQ3uPo5
	 xCNZZZqIFBHNQnmi6rQHhugNHWi8N0tBMVwx+A651+DQ29n0lH/uQg909DvdKUppWS
	 TcZgiGOplL37u0h/PshdhvyJVU8d5z8Os53O2PwwUjdkj2x+Ik0u8cPM+8bvR7rx0x
	 zclGiA7ZwYXog==
Date: Thu, 28 Aug 2025 10:51:44 +0200
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
Message-ID: <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
 <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
 <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CMe5mpL7NfxBkMEj"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
X-Cookie: Filmed before a live audience.


--CMe5mpL7NfxBkMEj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 06:46:28PM +0200, Bartosz Golaszewski wrote:
> On Wed, Aug 27, 2025 at 12:22=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > I've just got the log I linked above.

> So, I've been looking at this bisect email and clicking the links to
> LAVA jobs and I can't find anything. Does it fail to build? Fail at
> run-time? I'm not sure how to read this.

It's failing prior to putting any output on the console.  I was also
seeing an issue on i.MX6 so it might be all i.MX boards, same issue:

   https://lava.sirena.org.uk/scheduler/job/1697667

so it's possibly all the i.MX platforms failing.

--CMe5mpL7NfxBkMEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiwGJ8ACgkQJNaLcl1U
h9Dgwgf/cCYgHVux4WcIOpHZVKvbhmDSDtzns435zt8WkkHs0HTefX6c8qkduloE
AKCQvlOXq4w9mLYUJB73eu5lR2UZ9F/crY4Skm4QKJSl7xbmcTrUKkDh4anAgPCr
TzCuAz0wBXpZDV6rbgGsv50bHpga2TkeYe4ILfO9i5WsXq884j6qH3q37x3LK9nk
lbgltpZaBfzXdFk8ofMDg7QZQI/JDl0cR+6rsMZ60fSoehdmCHlO3Yk1ce8K2PMt
jeC24eNQXFrAPZojnEdcSiHf7+AGirU7we0+4EPcomJRcfJDrf5lr4Mj/c5ofgNV
ElALxe39ERW5FGeRn5q9m5nQ+3/dMQ==
=cP5U
-----END PGP SIGNATURE-----

--CMe5mpL7NfxBkMEj--

