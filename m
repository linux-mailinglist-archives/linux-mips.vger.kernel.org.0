Return-Path: <linux-mips+bounces-4337-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F6193230F
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2024 11:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1068E1F231C0
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2024 09:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4F3197531;
	Tue, 16 Jul 2024 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bs6ovHpw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D829CF7;
	Tue, 16 Jul 2024 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122974; cv=none; b=FxFhB0sp1ttAWZ8b0iagXGNEMO8b0Ncqc+hkJcAKqIScbVLOkAEJ7edM2Q42QRgsMuqJXLWeX6lGgG92RX4ERVjZXiUXhGy5xpv1fkz6d3eHfxTi1OxPOtWwRrTsSVSazwu3jUuQFf2UfVYiekyqow5UAAbgeh03S5L/NdFzB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122974; c=relaxed/simple;
	bh=gDVpLTlm7lBzqAAT1y+n80sMgKwLRhbqPLufAivER2Q=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=BmphCKgwVxnPsHOKKoyHgLwFHufwXmBXtFuaW9/WtWLq21tAteYa7EDmSq/ed599YddG9KdFk3dXLmLK/IvXlgMU0iw3RTW+GPJzKIilS0EEPyKa40Gdz0BZSup2MVVCFoA0Osw9p7MXQKCQqQvzzf1jzOkKR4zeJriqT/Jkilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bs6ovHpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82D1C116B1;
	Tue, 16 Jul 2024 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721122973;
	bh=gDVpLTlm7lBzqAAT1y+n80sMgKwLRhbqPLufAivER2Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=bs6ovHpwe2yWXn0F3AasvaT0I9cp3MjORXkUWDKeHHYlApUX1laz7G3TE5RZ+3Jj+
	 TG3VKC2uWktVdXdjJSwxZIndsY1UKZiG5nbjx5vL8Abybaldxg7kysjkpNAWhg6Lmq
	 5bmHBMyoZIqgckSmPy0d6bP2O+MLst1RjKorDzb3JQJFOYdYHaQWVkFeMVRRgdkbJh
	 pTfAUkUn5zsWg83t3X60WPPtiOZWLV7FLoTmJZDom4O/G/wIC+stSHFYKlevzxvqcN
	 s5lQPuqdxuKPnESNh+3vSaZGWggDoMyzSYJzZuyqtHqJ/crn4o61e9U0WvX46e7R5K
	 jfUFkHbLvy3+g==
Message-ID: <26a64cd3ad422eaa9367917dd90d65b7@kernel.org>
Date: Tue, 16 Jul 2024 09:42:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 5/5] drm/bridge-connector: reset the HDMI connector
 state
In-Reply-To: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-5-61e6417cfd99@linaro.org>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-5-61e6417cfd99@linaro.org>
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

On Mon, 15 Jul 2024 09:33:05 +0300, Dmitry Baryshkov wrote:
> On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> IGT chokes on the max_bpc property in several kms_properties tests due
> to the drm_bridge_connector failing to reset HDMI-related
> properties.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

