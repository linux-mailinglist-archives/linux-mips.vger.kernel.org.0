Return-Path: <linux-mips+bounces-10991-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD923B41E70
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28B4E5436C9
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650002FD1D0;
	Wed,  3 Sep 2025 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixEbLi2A"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F042FCC19;
	Wed,  3 Sep 2025 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901265; cv=none; b=SoEPM6qinUKV3y0K14LI0mvlcgBtfwr/UW4fsWyezhqCKLOf0pUmR9R8GuwkdKvrtUJcYGyJIgqH0W9SgJBR4PyZkisZCr/v8EZnnd3Jfzushlb5cahjCPXEFkEHKNfJXJzczwoXs1yNa/fLwsTipHaMdMfnSOTxTTbiGUZmIkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901265; c=relaxed/simple;
	bh=m1Ang/Ev5msbe29qUOK0afUPlJKTCWi4jjZ05SuuqY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tkz5RMO6xnxhaYAQ+dijHgeEGIKYmizdfSPIttTsgo0clz4aA0F1aT5o2LWkx/IPkgMYh/lNPdTLEZaBNc/76cLoC+cSlhLmInij2XyVu9jXuP+tGg0V3jSDHrlSbn8Scc2IxInk/WuU62TXXhpaVCXpKD/xr137/9uPWwYNCK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixEbLi2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5248CC4CEF0;
	Wed,  3 Sep 2025 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756901264;
	bh=m1Ang/Ev5msbe29qUOK0afUPlJKTCWi4jjZ05SuuqY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixEbLi2A6jjg3LDOMR+jiLI0kr10I8xn9VvAhh0P7/z4DH0i1kyknq5gSkeU0VCh5
	 i7tl5kkxInZ+7hYu+tRelEpYAuP8FN2uFIlm5P42FO3SelGzylxnLKF/pNSR2m1aFw
	 RE/5Os5QrL3UByY4KoMftxBxXI8nABa43VeNvttCKTwJnSRMLLSkAAqu3VLPfLy7vD
	 AeMa8NriBmA/D6erdbbe4fr51rNUQY9oaQtg+HQjcR31u8e8fIRtxBTyJgVpc39MZw
	 KS0+rKXi8YwhnPg5XMTY+J7MPSqIPKFVJNPfLuAXIVPCyL2HDJsMj/a8wFJkAKiMQ+
	 b2BQwIrvDUtwA==
Date: Wed, 3 Sep 2025 13:07:33 +0100
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
Subject: Re: [PATCH v7 07/16] pinctrl: imx: don't access the pin function
 radix tree directly
Message-ID: <bfb9a2f0-92b4-4f68-ba54-2c01e93eee97@sirena.org.uk>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-7-bb091daedc52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LMkJw+F2UT+cDaFZ"
Content-Disposition: inline
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-7-bb091daedc52@linaro.org>
X-Cookie: You were s'posed to laugh!


--LMkJw+F2UT+cDaFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 01:59:16PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> The radix tree containing pin function descriptors should not be
> accessed directly by drivers. There are dedicated functions for it. I
> suppose this driver does it so that the memory containing the function
> description is not duplicated but we're going to address that shortly so
> convert it to using generic pinctrl APIs.

Tested-by: Mark Brown <broonie@kernel.org>

--LMkJw+F2UT+cDaFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi4L4QACgkQJNaLcl1U
h9Cofgf+Nx2+OT+tp4D5FUxhtTOmhW7sSoV0qG4ncMEPM9CqTpXL04wbbzyJxjJi
x44Lzl7dhYejlq1ljZcrLRtyyOEx2GJmVq+XHynLGl0+WRR2yx5BIF/VZUKrpjdp
Rd7Wd/4PDIWu+9AdKJ05UjqdXCojpVhxUDMFoha24910w0dlC3/GOS+5CLd3t5nP
o8DekdJ0fH6kx1PD4bw8qgA54bkwX/A1xWWTNxpAg/4zlmNuqFrT48Nuyz9AxY7W
KRh+JFWffC6f3gBQeYYoJOJsaSojIuYpDVDTTwkkrtr0ZmxbYGan3Gfw+uDC2O8W
SI38WHTPgNA+BpMaBE3K/SB/spudUA==
=Wljw
-----END PGP SIGNATURE-----

--LMkJw+F2UT+cDaFZ--

