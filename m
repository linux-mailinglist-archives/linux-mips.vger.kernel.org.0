Return-Path: <linux-mips+bounces-10536-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2E6B3413A
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBEFB16347F
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BCB2EA483;
	Mon, 25 Aug 2025 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsunBBc0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB5C279357;
	Mon, 25 Aug 2025 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129424; cv=none; b=LLh8NWtEiXhJip4FxWVR/lL0bAm1PivB7iYn6ea5+h/1/JafQwo++NW45YK370BHALF6YWxYzoWEmFsYUl/coFlJVM+XJGCJmks2aq+DcvoXOMsKNwRUGG4/LG0DLUyHOleu4zgECGwoWGO1AVPKujAdiofmhycZmMWU93YPSTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129424; c=relaxed/simple;
	bh=SkC2OYWRCfo1mXdc8s1OlAFhd2ZbE2QZTG+wQcJNj0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n//wXSydsPwKbv7MTMvjYl1kyNw12UhR9SKhl58aV0QI43g+5CKQ9pN62ahFR8Pdn9cukMEuwyUB0ZvYhPeejXFQTmMwHRdQLTqrP3fd517O89T/zCq2bFD/DcRDfrzCuB+mfMRjsvKTX5BODKBVVrnXr5vA6AeMoAYX6JyY9AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsunBBc0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619D3C4CEED;
	Mon, 25 Aug 2025 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129423;
	bh=SkC2OYWRCfo1mXdc8s1OlAFhd2ZbE2QZTG+wQcJNj0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IsunBBc0zfRo4QhcTj1sI593baVUz/CmfiWpv5tMmzRRWObXuu4WfoPby56Qxy2Mz
	 ng9S8qtZQWLcZOkd8l3kIv6BEW7yLczrw6h9f9kOlMHDTL3zG+w1SChW/gTDq4O82Z
	 KMKsQVsWdCcUV7grOjnpRO4spHxfrQEPl7f+ShCpj8wEgM3B16htTf61RQREvheIzr
	 M53s3OsSWv47q5XanoZjijN/j2r/A1tnDGgba51bX6ph4NLT951pvoJlNgDRyjuztX
	 3uvunmUK+keyYQLlNIc441l1ugZP0A6PNSKJqvK9/tqYZhIO7Huf8WEQpluLUG902V
	 k0sKmNxNDc2tg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:08 +0200
Subject: [PATCH 03/39] drm/atomic: Convert drm_atomic_get_connector_state()
 to use new connector state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
In-Reply-To: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Paul Cercueil <paul@crapouillou.net>, Liviu Dudau <liviu.dudau@arm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Sui Jingfeng <suijingfeng@loongson.cn>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hansg@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416; i=mripard@kernel.org;
 h=from:subject:message-id; bh=SkC2OYWRCfo1mXdc8s1OlAFhd2ZbE2QZTG+wQcJNj0E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMopt70yavNOwXCkkvl34m/ujb+KTp7Dd9d6eYHNdJ
 PhJvGtYx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI0XLGepdio+IF9xh+Mz2+
 sOvNFHUxgdzZoYvmZ8Y+fLHq38YFqg/SLEw1dQoZ36dsWrTLXqqxhLHhr7xV7bZdTf1er3u77k+
 U6X3/jsOC/+6FqM585T97y2KNmGKFzjTHFNTOc/tr8KOg+BQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_connector_state() function calls the deprecated
drm_atomic_get_existing_connector_state() helper to get find if a
connector state had already been allocated and was part of the given
drm_atomic_state.

At the point in time where drm_atomic_get_connector_state() can be
called (ie, during atomic_check), the existing state is the new state
and drm_atomic_get_existing_connector_state() can thus be replaced by
drm_atomic_get_new_connector_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 660b081ff5d8c39061cebfb5ea122ac1e51677ad..30b7ec05a1af07075e40cd2822ecfd67df004ba2 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1128,11 +1128,11 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 	struct drm_mode_config *config = &connector->dev->mode_config;
 	struct drm_connector_state *connector_state;
 
 	WARN_ON(!state->acquire_ctx);
 
-	connector_state = drm_atomic_get_existing_connector_state(state, connector);
+	connector_state = drm_atomic_get_new_connector_state(state, connector);
 	if (connector_state)
 		return connector_state;
 
 	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
 	if (ret)

-- 
2.50.1


