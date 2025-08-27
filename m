Return-Path: <linux-mips+bounces-10649-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A42AFB37FC7
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 12:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0202C5E3C5D
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 10:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1261A34AB14;
	Wed, 27 Aug 2025 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMY73pat"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E8341ABD;
	Wed, 27 Aug 2025 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290125; cv=none; b=iZdXwCjERHlVpibncqnnOf843I/nSxCAiB3VTBur0DwnTj6H1TzctZlOqOlm9WlX6eS/5Yp9tw/S8YXKYxV7HdpvzShpTuPgi+6UWDW1DCyHjy7orCsJfmn6zzf7Iz0xe554ocWHbdP4yH6hAu91al3UehKU6xZdyOXATYy9Bkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290125; c=relaxed/simple;
	bh=feIeFoFe/NIkaHWsBJ6sykJyPk/bFO1DqGerlF+Pkfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIAF5vVVEpcw/dcgOai/QgLmA7KqcHHwbV/aID8rfPenPu/4J9JKfHNONQdj93JqiyG4j3xkB7Lp98k9POlH00UCKA33fFFIzjOgQmWe1Xwy3yYxafVPx3IaZcZOcGg1qjDcZZ5+4Q88wxAtBszET+R+Nd3qz5sM+3mUF/wesE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMY73pat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E6FC4CEEB;
	Wed, 27 Aug 2025 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756290123;
	bh=feIeFoFe/NIkaHWsBJ6sykJyPk/bFO1DqGerlF+Pkfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMY73patfhFBm1cWrO0GjSOUppBTmRm9w9tK3Op5eYvw95EorabzAemE8TKMQjBN0
	 AFJLkvpc/07xvzw49PtfcXgo1jyfgqSIyA3tv8EQho2HxgcPu5RJ7YIj6+5ZO0Jjfj
	 ejeS0GRY1n7Mq9lcoiSrFgud7UC1CHzgBEAzXF9wgw4H35uLjqwGgcAgwRdWTSnps4
	 uVbcQD9zxttmWF0K8GiZTPHDS7eDEZN1k6CLQV5sYnoFYmqneHGPBxowx91U05F03k
	 g5jrxQjovkqZ6CO/JHFUeS2pHASrfBK5fwYnJi/a4eamilP7bDZYeUuhHoJFoX+o0y
	 IaB8i4S88yEdA==
Date: Wed, 27 Aug 2025 11:21:46 +0100
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
Message-ID: <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
 <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cfgNcmAX2xoMgwh"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
X-Cookie: Most people prefer certainty to truth.


--2cfgNcmAX2xoMgwh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 08:19:37PM +0200, Bartosz Golaszewski wrote:
> On Wed, Aug 20, 2025 at 8:41=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:
> > On Wed, Aug 20, 2025 at 09:12:49AM +0200, Linus Walleij wrote:

> > > The qualcomm 32bit platforms fail in next anyway so I dropped the pat=
ches
> > > for now.

> > FWIW the i.MX8MP also seems to have been broken by this:

> I can't test it unfortunately - would you mind sharing some info on
> what's failing exactly?

I've just got the log I linked above.

--2cfgNcmAX2xoMgwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiu2/8ACgkQJNaLcl1U
h9AN7gf9EwrkCMDKQJ3+l64opijlSNrt1Fb1YRWh9KvdN/1+7aQ7T/xu5C8tCq/f
8Egc7c8xmS27/9OO0NDM90NRmoDvRBfCYsrX0yqXzJ/SMQ27wrw9H/OnNqrrq9V1
OU0NsJVeKrt5FELD7Zd1UbdrMmQXQlJeWx80plpgQDCxBzBliPEFiSg3OkTc+mqd
Ef9KfjLAlIwsCVBOC1uwPq3Z0vsIDMzbxXq/e9R6nmwhHZMI3puSNp8ZmUBXBSeq
D8k41vgIAo2YLmAdLfeiepGWT3CcfFlmbEHdeRIRVUS4zoUK0u0/OIedQnCwXknI
ucg20UGLpA7K1JhJlA678HGIBlpJcg==
=VNoC
-----END PGP SIGNATURE-----

--2cfgNcmAX2xoMgwh--

