Return-Path: <linux-mips+bounces-10546-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF2B341B7
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66A3D7B8390
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671862F360C;
	Mon, 25 Aug 2025 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzhR3Q5r"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0BD2F291D;
	Mon, 25 Aug 2025 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129452; cv=none; b=qny6qY9TG6Eln0gSPFz1IoXiYXCMnPivM8DOLwmPwpGygK7ZQeabFkZaPhAxhPWg2M/7R2DCAr4omVGhrcSb2hl9l9Cw+2GtpL1Ip9vXbsarfLj0NrDOuepShrjlCIoxkJ1BVT3btAsv+rcRH4mgPmzR2E+Qoon+leb69M20zSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129452; c=relaxed/simple;
	bh=OVEekJ412TDrWcPosT5PbcAORq/ZSX10mh7GmfSf1w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXSc3X4Th4rMbIpsBc+p+VIFz03XesoGPhCmYicNN2I1IBkJp4NhVlpOW8yyOZSGG7qaqxyY1yBM9fLGasGnB3OVU7AVxmho+fYY0dv3f4hvWSlof6sGJkaI7Wp5QShbCj1L3xI0mAsUiS7XiH/A4nMr7PVSsjIkrNl1Rcw6NQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzhR3Q5r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A538C113D0;
	Mon, 25 Aug 2025 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129451;
	bh=OVEekJ412TDrWcPosT5PbcAORq/ZSX10mh7GmfSf1w4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VzhR3Q5rh3V4HDtcuCLmgfBZ+t53W1q97NCBIe9yGooqYjO3WbtF7roOG8gNpzAoI
	 +knkrfgaKj7VP6SAuVqMESK+mTtWVoFsbGv1HapCN/2R5t4CHYInBU1PrLwUjn+ggg
	 G2G3m8AnOQbSmPh1SQsD6Ab1xz7Dfz2SPs1KweBHxwCwT2Pj//Xi6TRkFm0JTbfNu7
	 I3b3bQwK9lZk4if44f8RtxaEKQJxfCsNNTCNm03A60uHpmqCHn070ana4/rZU4lgXY
	 oo+0F5+JKJmR4NE2k9CvfdNzi+GTsqNXnBIoGzJvGsN5vP0dB68F8bTDsmKfXJbhPy
	 16R4HxPcv0Hmw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:18 +0200
Subject: [PATCH 13/39] drm/ingenic: ipu: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-13-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=mripard@kernel.org;
 h=from:subject:message-id; bh=OVEekJ412TDrWcPosT5PbcAORq/ZSX10mh7GmfSf1w4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMsqPKNnscJ/EkLEysv9qzRqmZdKRilP2FadeZJx6t
 jFsGrNux1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhImAdjfeXk9bnq/B+VPr9l
 n/bwkGn9yhVuk1ZzPJlve+kPl5xI1IxV09qZbttnb3268qTnDI1XeYz1buI+OTfzitff1WlwnGO
 uVGJ2k1F22f+1KzQiLfPFItjel36bZPpeJO+p8E/D00nHT3kAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ingenic IPU atomic_set_property implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called during the state building process, before
atomic_check, and thus before the states are swapped. The existing state
thus points to the new state, and we can use
drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/ingenic/ingenic-ipu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 26ebf424d63ec21ccee80221745c3e8bcc6b3d7f..2574a4b4d40a2c27cb212114117829d9f6ab3ddb 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -703,11 +703,11 @@ ingenic_ipu_plane_atomic_set_property(struct drm_plane *plane,
 
 	mode_changed = val != ipu->sharpness;
 	ipu->sharpness = val;
 
 	if (state->crtc) {
-		crtc_state = drm_atomic_get_existing_crtc_state(state->state, state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
 		if (WARN_ON(!crtc_state))
 			return -EINVAL;
 
 		crtc_state->mode_changed |= mode_changed;
 	}

-- 
2.50.1


