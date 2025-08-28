Return-Path: <linux-mips+bounces-10723-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7262EB39F7C
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 15:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7F547C19C1
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 13:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A1F30F952;
	Thu, 28 Aug 2025 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrfsVLpI"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A9E18FC92;
	Thu, 28 Aug 2025 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389509; cv=none; b=WuGsFopeiRwjXWARhvNd0VyyR3HtaGKLxC5CyuX7k3YimH+y2UPr72oUBP32v4Qieeg5n2/Umdc/VbzKAkXAIC5L4AH8FL/lT7czniK9hWnzfKk3j6udTSgN7C/Q3hIB7/gmDVIsrhmziLK6szJpbJpcjocXoGxzNQJfCHYuIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389509; c=relaxed/simple;
	bh=iz346w1pfi50rQscMVqR3cBscGG9b/CJpfDF1KlI9pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cV8vdN1aUnTiCHXIhtkixEWBhKGoHdKmnfOukv/gyZU4RM90otuZkjOqP0npRMPL5fO7uRAL7yjJG+YUfB18kQ693IWJyOcIiSDlBGhNTahlW/Zu+3dNRaR/di6xaSyFVQKcto8F2dPffGhJ7J4ccccHNiZnSanaVwBO3l8zyQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrfsVLpI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8348AC4CEEB;
	Thu, 28 Aug 2025 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756389509;
	bh=iz346w1pfi50rQscMVqR3cBscGG9b/CJpfDF1KlI9pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrfsVLpIbrUkGgAu+200k/PsHzJAQOdhV7UtqX4U+r7efW+IZ3Lnx2YIzXWD3ehCr
	 FShLiemmKjyveYW7Y/Sn1aIqQcsHOx7hDhRUOu0yih3CJv+K7HiSt/xKdvRpLAxBK7
	 uNiOwHMzb3OmXsJPNOhSRmiKonF3mXegdbFfPK2XTyGjwDdsc7uxL7mtSZJj8gMwgf
	 ru2WWG4VEML2FiOwAISMO7D0Asg4S5Lfbd+5Mv+WUnOUKCg5D9d1TtIOlGGBDWkvKj
	 PHobj0Z/9HWALPe1v3/XjzRpAl3KnDm7V0af1GHnhlPvABhPasAswK4de7YkxXCluB
	 bnGI9WAIBQVYQ==
Date: Thu, 28 Aug 2025 15:58:25 +0200
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
Message-ID: <aLBggd4rGHV_5zQ7@finisterre.sirena.org.uk>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk>
 <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk>
 <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
 <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk>
 <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdNHFBtb1jUgefWr"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
X-Cookie: Filmed before a live audience.


--pdNHFBtb1jUgefWr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 03:36:43PM +0200, Bartosz Golaszewski wrote:
> On Thu, Aug 28, 2025 at 10:51=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> > It's failing prior to putting any output on the console.  I was also
> > seeing an issue on i.MX6 so it might be all i.MX boards, same issue:

> >    https://lava.sirena.org.uk/scheduler/job/1697667

> > so it's possibly all the i.MX platforms failing.

> Not even with earlycon? That's weird. There are no smatch warnings on
> this patch and I can't see anything obviously wrong upon visual
> inspection. I fixed all other issues but this one I can't test. :(

This looks like it has something:

   https://lava.sirena.org.uk/scheduler/job/1747304

--pdNHFBtb1jUgefWr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiwYHoACgkQJNaLcl1U
h9BglAf/Y29OWtMPmosc5BXwhhJ/DB1eMOx6Pwt45/ZIIP3KfZVtcP8ChTwYJTVE
u2ABb09S26V06eZAT7LKYhtQG4rTpgpT1XsEFPRjINGsorTtjmkb2mzyjol9redt
4hX8VqvBozyttsvveKI5gz99QgrRzWP4qG9el23QmBXNPHXepE3zj7DQSLv/N4js
iYFSgrRlkcyUCfoQDicck2S46lGl+7Beb4HcbRWieaQf381fgBqewrDFc6Kjd4Dd
ZCuh/UCjOU4bfLFrD+7777yJnSa5QysD5PyWqvByJ3vcoCQ1dwjDDIvbFevoe8yD
Xy0drJVTnqFyVOPssrxiz7IHh1kaHA==
=VMqo
-----END PGP SIGNATURE-----

--pdNHFBtb1jUgefWr--

