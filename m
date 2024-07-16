Return-Path: <linux-mips+bounces-4338-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1128D93231A
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2024 11:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0CB1283927
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2024 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACA7198A31;
	Tue, 16 Jul 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMEWyG/Y"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BC198A27;
	Tue, 16 Jul 2024 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122982; cv=none; b=otWFdpcLtYyqAy8PTpnQybggRgHbDAQG2mqtIiByX5f+xyBlfYuMTPs3jg57nDOl1I+BulBXc2FmHqXYPbrZQ9MX7N+1TQaQNfRDrvpjn/hlhs+3bF3jODiHfL+8Nf/YMZ9lEyR9+cjjm86lJRkl5mRtAVWdRLbqJz1DLUpvaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122982; c=relaxed/simple;
	bh=eNChfPChigiUxAWMQ3GMxFV/+m9v/jfaNQ16NzY8u8s=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=pJZGkNKuuaH6eqbPo8Z5D0ozhOCwninKQ4CSNiG7E5Hfd9vP8YXcO9R5DlNuASjXSxumoq8XplR+aUpOle4JF8FgeBMwYRq2pvSn114kkrbGUFpXEDk6nB7rKHep48nI48Jja5FeqDtk0OsnlPDDhVYFx88K6CvHwEerHKAzfaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMEWyG/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9850EC4AF09;
	Tue, 16 Jul 2024 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721122982;
	bh=eNChfPChigiUxAWMQ3GMxFV/+m9v/jfaNQ16NzY8u8s=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=QMEWyG/YnYqbz5SV4MXIBqUNls9iqmvOzFWQ1NTePO3AsSHLUkQXT1z6YSiKL17F2
	 6Tzbn81TwwU63iI4bYx/ABq8c3EkqvY4F9UxyUw0Jp1YQO5Ph7u0MvCvPbHeCw9sIr
	 DwP2I/gMCPV0KtQ2vB1cIlybHr4zZW6i92aKhE3tad6BsxgVp/StTJWSolS4rUzLqH
	 IyUzsOU7CNx71PSDivf7y1kgYcsuXoT4no1Z4mIKPlyBAkDKKbfO7NrFmFDvWIsjKd
	 uet+mQjUnQONjhoIVQlXfHH6ceZikM/2gZyyCH3g8P1VFpZRd9dsBK9hNKIc5/0lgP
	 ro65TJyb6Fjyw==
Message-ID: <b357f0ccad87752368a8514fe796e6b8@kernel.org>
Date: Tue, 16 Jul 2024 09:42:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 4/5] drm/bridge-connector: move to DRM_DISPLAY_HELPER
 module
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-4-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-4-61e6417cfd99@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, igt-dev@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Anitha
 Chrisanthus" <anitha.chrisanthus@intel.com>, "Biju Das" <biju.das.jz@bp.renesas.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Edmund
 Dea" <edmund.j.dea@intel.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Kevin Hilman" <khilman@baylibre.com>, "Kieran
 Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurentiu
 Palcu" <laurentiu.palcu@oss.nxp.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Cercueil" <paul@crapouillou.net>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Sean
 Paul" <sean@poorly.run>, "Shawn Guo" <shawnguo@kernel.org>, "Thierry Reding" <thierry.reding@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

On Mon, 15 Jul 2024 09:33:04 +0300, Dmitry Baryshkov wrote:
> drm_bridge_connector is a "leaf" driver, belonging to the display
> helper, rather than the "CRTC" drm_kms_helper module. Move the driver
> to the drm/display and add necessary Kconfig selection clauses.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

