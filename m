Return-Path: <linux-mips+bounces-4339-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C4932332
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2024 11:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8A8DB23FB1
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2024 09:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB659198A31;
	Tue, 16 Jul 2024 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqcYY9TU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EF446450;
	Tue, 16 Jul 2024 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721123027; cv=none; b=JNLFbUioEw17ZcvEf+fi85LfipGi90IVyApA9uXYfbgoxjmxmAgmDTrQK6vF2AADCb/9OjArf9SFT4x5Stz+Jo+w+Xwrp45njKdpLd2Ov4om2gPS8Th9rmCBOiB9zqRYi4x+2kfQENr9w/eceC7rQ0QXUp+Ju1FNOeJtalLTsuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721123027; c=relaxed/simple;
	bh=cb2kMyUZz+09TPxC7XSnOt+aHqAq3RB1JfOHowI1lTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRRQ9UtYtxf+pahcVp/byYFBCIZYk2qoDgxebyEZ8D9wPqEngQxBEO2voHRU+LyX6szMdyyxpRhmbgQ8NMRPOCle7ntn4qO2HE5que8RNfN/gpj2MzLqn2FO1apKIwEnoeF9jiAjwByL2Fxe5UzZZFyDt6ql+jzbxjr6hbvp/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqcYY9TU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C0DC116B1;
	Tue, 16 Jul 2024 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721123027;
	bh=cb2kMyUZz+09TPxC7XSnOt+aHqAq3RB1JfOHowI1lTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqcYY9TUYD+gO1X/TCX0AUvnR4331B3UHqHC1W0kpktTNHpNsjf3Dp4YhLrqN9TkH
	 PnBMqFqjM2H5F6O8v93th0cgBhzqMFZNFBaF5MbxY2qlckU6RkhM9Je0AqwhEO/lpb
	 p2AhLDbcTzNI+wGb39KK8K573p/4ttCA92iEqW7F1Si7UanKBNm4uyCS+9w5vKkYl5
	 9nTZi2UQhaDPrj3pnDIHA2AZLRLMdGunPZSIfJgKGE2KIYq7D6tQKaOdcFimxp0nLp
	 As1I1B8WZsCguk8p+p3nnPMM7Uh1tBqwSjIArMzLbPk6uRAtouQYKRFi2nQRMG+pj4
	 esxa//Keq3dSQ==
Date: Tue, 16 Jul 2024 11:43:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 3/5] drm/connector: automatically set immutable flag
 for max_bpc property
Message-ID: <20240716-majestic-vermilion-hornet-fd1cfb@houat>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
 <20240715-drm-bridge-connector-fix-hdmi-reset-v4-3-61e6417cfd99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fdsfmxhl5wgvjiuk"
Content-Disposition: inline
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-3-61e6417cfd99@linaro.org>


--fdsfmxhl5wgvjiuk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 09:33:03AM GMT, Dmitry Baryshkov wrote:
> With the introduction of the HDMI Connector framework the driver might
> end up creating the max_bpc property with min =3D max =3D 8. IGT insists
> that such properties carry the 'immutable' flag. Automatically set the
> flag if the driver asks for the max_bpc property with min =3D=3D max.
>=20
> Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connecto=
r state")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Assuming that someone on the uapi sides agrees to patch 3:

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--fdsfmxhl5wgvjiuk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZpZA0AAKCRAnX84Zoj2+
dtNdAX9Ax2E/pR1JgBzBrUF/uMPOl1sAEeevA2aoMOeQhKfGs2BZhGJ77abapFvP
xuT5sK8Bfjqe28CP8kHlRvXG2ER2YP8NG+nrxaw4u1WdmauMPDTJzHoGi2MW4dkH
Czrtx7ncfw==
=AL/r
-----END PGP SIGNATURE-----

--fdsfmxhl5wgvjiuk--

