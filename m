Return-Path: <linux-mips+bounces-10542-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1C4B341C8
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB3B57B742C
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5602F0688;
	Mon, 25 Aug 2025 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAHR3eVs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C42F0671;
	Mon, 25 Aug 2025 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129441; cv=none; b=tcPfyQYevtVaFl4D/52W1wZsdwmpTB5xQwuqhMZfhE03hGSYrvtA8yipmOa7Hzk8hAkKRTFuRlJ0/p9XzHSV6mJuwK/UUUCwg2dHfxavAJRv+5XcE59+gDkW2XAYTACvtVQDQiRDaJ53TYfRO+E/Cpqnmk/RmUYHezHnueD06rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129441; c=relaxed/simple;
	bh=n/MDiUm7aoemlaqHwOyPGuWXQ+rc5qKP4nRNGdzA+n4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsnU+rR8jwBIpvXePT+6HGfQtEUD+ywwpbOIFxrDkGQ8Vizshp9JBo64MUzaZEHMSLJ3WZqRAlqTKgEF/ryvDXfMQCzdlOdp0lCgwx3N64UYtjRsr1kJIDB8j5biGDqJkEiQWc1n1PBPMMlcpWs+HxYOfRGk6Pa8wCvITefNML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAHR3eVs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FB6C4CEF4;
	Mon, 25 Aug 2025 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129441;
	bh=n/MDiUm7aoemlaqHwOyPGuWXQ+rc5qKP4nRNGdzA+n4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TAHR3eVszsFAduYgtnHxtAUQX1XqosCdOUWomkwHZoQ63Ci/9OLzAz6m+q49mRWr/
	 GWJe+eq5hRNPgnN8+JniBNnnAItDLqHAciiU84hMWCDuWvHBIzWh0Qj3WkvDfPVR5F
	 Bsis053cV6ppM/WSaBHdtakM9NZauAg7ZMif1keN+G0rgwrRdAIUmbL+McvnRFe7tU
	 2OV8bSqA8qG+p7C3daHqXzfcVorfwqUsLYIl6TObsaD7EUCF7/29OQURrA3S1eX5pd
	 Qn/IPrNf0rAIoVXaj4weJ1sN6ywxMAof2henV7IpDqFXvEM4QpW+OPKB/1N8PcCtMu
	 ZW2dLCVDyGunQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:14 +0200
Subject: [PATCH 09/39] drm/tilcdc: crtc: Use
 drm_atomic_helper_check_crtc_primary_plane()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-9-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n/MDiUm7aoemlaqHwOyPGuWXQ+rc5qKP4nRNGdzA+n4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMsqmbl5+TeeCyDtpBXapy7OS27u3r5F4FBGv6jW19
 Mdi6buVHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAizo2MDYdNdgUb3PvEorFa
 Ovqgb96vRWduL0ktMX3KMuvi2RfBAcpbb5+x1710IrZo44xJmUufP2esd1rP3iq6/LjlVdbjZUc
 tgvRXLyhfunKhuf4Ena6gZTbenMIqz1780xR9ukNgtuTT7asjAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

In the tilcdc_crtc_atomic_check(), the tilcdc driver hand-crafts its own
implementation of drm_atomic_helper_check_crtc_primary_plane(). And it
does so by accessing the state pointer in drm_atomic_state->planes which
is deprecated.

Let's use the right helper here.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e72ae8ec0f3f4e5e85bc5004e6e5b..5718d9d83a49f38081aabbc9860847bdc83cf773 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -674,18 +674,11 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	/* If we are not active we don't care */
 	if (!crtc_state->active)
 		return 0;
 
-	if (state->planes[0].ptr != crtc->primary ||
-	    state->planes[0].state == NULL ||
-	    state->planes[0].state->crtc != crtc) {
-		dev_dbg(crtc->dev->dev, "CRTC primary plane must be present");
-		return -EINVAL;
-	}
-
-	return 0;
+	return drm_atomic_helper_check_crtc_primary_plane(crtc_state);
 }
 
 static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);

-- 
2.50.1


