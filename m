Return-Path: <linux-mips+bounces-10885-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F1B3E757
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 16:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E36DC7AE619
	for <lists+linux-mips@lfdr.de>; Mon,  1 Sep 2025 14:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA39340D94;
	Mon,  1 Sep 2025 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJgb866O"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21B2EFD83;
	Mon,  1 Sep 2025 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756737464; cv=none; b=tLAbKRb+UcvN9wbVV6f6MjhEug+Vp+vlThsF5Rq18BxzdTdGs52uBDDAbZY0Rc4UryKdzyKF0KkM7t14sVL4xcQmjYpsAT28jWhb93+A/3wFCE258tea+C/XDW3TjVxWxwbCaKsMGRzuYvIbNxusSIlaoz5CjlRn9IR80xwFs3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756737464; c=relaxed/simple;
	bh=gIvp8Vp/E1swy4wyBXx3jb2SoCxt+LuCiS4lw6AuyVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC+TXcTCtI2pZAQGJSfbbIsllVCVmJQ7pvJDXNcxGASp7VyifoyO/LeylLgRYPDaH0RITVdqz0PCkzQ5y1lUCqQa/P8k9EB4XPHfkAVdsa9JDy+p8M5hJSYkG7XROIgK2DugP83gQ9/Eexx9o5GHUi2YVQHHtGbiWLcKR4ziV+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJgb866O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91158C4CEF0;
	Mon,  1 Sep 2025 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756737464;
	bh=gIvp8Vp/E1swy4wyBXx3jb2SoCxt+LuCiS4lw6AuyVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJgb866OavVlQXKjEcSDRgX01RL+TgYXMilYRhox1DG2A4pbmL/EMuUOSPQkhKm9y
	 ZvbgzuWzlkHcKChIVmdcfSamTbXnIcObi8vEvl5/9muDCgJpxid02CByyOsACIh1yU
	 OKX98+D8HARzpuduhCAuxsNQWh5qbLNOOQS83t6frONv3iLVNfsFrehXLjwvOHBqVS
	 gJYuwaea4P7AtESKCzphgnRjeu3/3j4HbVoPTYqH34hpPGEiqkEowrs9BdVtPLHybV
	 TE95H7tVbki8s9jUEg4vMUHVN4eZ+ZaHfW6KZvrIPhItfOg2iPgxsvk5RylWjzgxwD
	 tuJt2jvYGPKOQ==
Date: Mon, 1 Sep 2025 15:37:33 +0100
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
Message-ID: <4a633387-08a9-43c8-81d7-488e7222aeda@sirena.org.uk>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <20250828-pinctrl-gpio-pinfuncs-v6-6-c9abb6bdb689@linaro.org>
 <61bad868-d976-4f49-805c-8d14d4d8b3e4@sirena.org.uk>
 <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j8LdXSlZH7SdW4XI"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfB_3e0sjCpV+XaKcKvit7Opk5LczH2wsxO=RftrAabjg@mail.gmail.com>
X-Cookie: Auction:


--j8LdXSlZH7SdW4XI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2025 at 03:20:44PM +0200, Bartosz Golaszewski wrote:

> That's not a lot of info but it fails in strcmp() which - I suppose -
> is the one in pinmux_func_name_to_selector(). Any chance you could
> check what the value of np->name is in imx_pinctrl_parse_functions()?
> Is it NULL for some reason?

[    0.628245] imx8mp-pinctrl 30330000.pinctrl: np->name pinctrl

https://lava.sirena.org.uk/scheduler/job/1758947#L705

--j8LdXSlZH7SdW4XI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi1r60ACgkQJNaLcl1U
h9BW/wf/VkjCjvE+ktBljc+ZJ9dT0UQZrXYUDHUyuCETxomTnFA+SILt5aJ5bGe/
iD8AWBpbbDsJH4vnF0ozS/kwuILQKFDettcRtaH7dIBsn/izkOQipQk8GdpbQ8WM
hWYcC4httv6HQ2rMJMgKMjRxy7L5L6xf+VRzgPc8X+0GfzYeCig6jLv6tX80PLkO
kOxJn1iP3VVHkXsDCw2fENaiXRuUOaSlrbwkkvBihKNbrM0499j/uQ4hwqAT8bTa
9ubBJhS8X9FGO12dl2qkEJPtjal2M0Vf4H4PoJilobNInq/WByIDsQANxJC8XDhG
4/h5vZiPNAzd8Qj8VQAkfeNquySq2Q==
=Lt5F
-----END PGP SIGNATURE-----

--j8LdXSlZH7SdW4XI--

