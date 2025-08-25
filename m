Return-Path: <linux-mips+bounces-10562-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 097EBB341E3
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 584321A857DC
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EE82FABF7;
	Mon, 25 Aug 2025 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Do/99lzg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537EB2FA0E9;
	Mon, 25 Aug 2025 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129494; cv=none; b=SEdpcYmaX1oacbht8d5603BOaR2AwOzi1rkBk/Kx6b1qH9Z4RurTMpUB9096TF4pQbetCv5oh3O/Mw0tn1U8xA1tQQJn7VzthP+jJPzhqRYoI9wvaEjP54BVstoAMJwLv4U3g8vgDNLNFw6oqiuasneSifj6WCB+KZjLWELQRZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129494; c=relaxed/simple;
	bh=XL7am6yFhJPBGBAkQnl5lifTl2dnfwC5ZN37c2K6oUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a1v/cZ2qS2AryWjVKhIyZHHXcc00cVFV/OPKsGg3xCCIElEFnycUlojEIiRp7RVOgjmGL7vBrYtWJ4WAd+Ps1JURnEln0M7Fn6WlhjJGwvq4SNmh4uvjWz7jdCcGApBmob4aJU69ag5E6/sCoURIgOzq8GH1EauwNDNPYN1Llc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Do/99lzg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B409C116C6;
	Mon, 25 Aug 2025 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129493;
	bh=XL7am6yFhJPBGBAkQnl5lifTl2dnfwC5ZN37c2K6oUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Do/99lzgBAASy6alUHrxQBDqc4aKKvHx3b85MPRfUZP0vwljhhVCWaEhZAswso2pp
	 o1d0yau0MJKDiV7LmYGIAOJRn7pLBr1H0r51uNDwUgw/LN7m/LSXu+qriAWs34wx6Q
	 /gTdcP5VSZgGQC6FhegSniTW5Cb8vRAYWU02btsucgZjzts0YkpeaBMSahAv54bk7j
	 SQdQlyVrtBPIT9bKlt8hVtQtOAYql/Di+cvXKG/bg1rRV12sAWLdvX7MTGhQT0+KZM
	 moUseO01ivD3tityw2WnnxekEuvVbsnLAMfXxlzY93WFTsqYh8V000eCzYK2ROTsoh
	 PUBiICfqyhaTA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:34 +0200
Subject: [PATCH 29/39] drm/sun4i: Switch to drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-29-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XL7am6yFhJPBGBAkQnl5lifTl2dnfwC5ZN37c2K6oUc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMupTHJZ9uPpBz1rpgreXyo6pO1eH9K+60s8V3/Fou
 4euwRmGjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARawfGhmuVjv1vv0461xes
 I32i2iD2972f+bY+uSF9pXaBT+Zpzb5v8PT/8ffmsz9sip61aHn5PsY67ZjZc1Zn71oZXMoutLz
 FOft0snIaRyDX8a1CsZYCV67/KZTluNqjoV5arHAr97WAtREA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The sun4i atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 3 +--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index f97be0040aab29cb4e138fcceb20e90c72db0252..94ac6ad6f30688a048e594811d2ae72aaa44376d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -204,12 +204,11 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index a09ee4097537fca8b653f34a833b36b69e343ea5..1f77e1d2984548e746805f8323f537f3b4d93198 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -325,12 +325,11 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	min_scale = DRM_PLANE_NO_SCALING;
 	max_scale = DRM_PLANE_NO_SCALING;

-- 
2.50.1


