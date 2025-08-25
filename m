Return-Path: <linux-mips+bounces-10550-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD6DB34212
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C2757B9053
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E614F2F49E7;
	Mon, 25 Aug 2025 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6BxImK3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B02DCF64;
	Mon, 25 Aug 2025 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129462; cv=none; b=hLp+V0yCNnZJsOXBSWs118OL5Y1RlQypeWWIx7XPvDbyCf972Zpe34dQMotKe6UfNSDN7mwLX8nJGuIjChFZ537MAFoOk5BS/jufXKROWrjLXJSxnyd5CLOFFVxgLm38v55IYx9+VELvBxn4MQrvtFj11l2QTnoCrzEQ5xjsShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129462; c=relaxed/simple;
	bh=ipEzi5m8pbpqql3fjjBZnFZQT/7rw8bUQKPrztMpMM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWNv8b2Mn59FpXlMRTWk1ks1j8lpYO6Kcc035N8CSHqgwJzhiVjuCZIQiX4S5J2HJs5D4aVdSWXmg4AsLTjfRJ1oYxiM1rW5vuPfUyzhqNsVc/l0dycXkP8XH7xUkKP0Ot+06mAWsZj00QNPNQTDQHoMZKQYJb2i6BytHxidY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6BxImK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF652C19422;
	Mon, 25 Aug 2025 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129462;
	bh=ipEzi5m8pbpqql3fjjBZnFZQT/7rw8bUQKPrztMpMM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R6BxImK3j0dba1VW7NlutrRy1g/KUZ1qqZE1WaUss3x7ZlEyQEHthgCTiHcU/avrC
	 VWSzol0iJ8+TiS3OkdXJpIFI3QpzPBCKg+rJNHU9mzq4WhiTnHQXGZhvXwfTBN6ROm
	 IN0Dv2L44se3r+E7TGJ6oKnVz0qXuMlC459msSUOXKo0PPznMTipOdfLpzoFFzTRSq
	 N8cAXnW4rbJZs4UFHfhbZrSqiuLdGBfWNeP7tngkzjaDyLALQ/uas8EsDq99wTXszH
	 0XhED3BE8hSAcoZD6oMXvtwi8vdccGik+7UILWudWPpGVbieHP1LA+1k0dwLTEAIjg
	 oczy/mKj3U3eQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:22 +0200
Subject: [PATCH 17/39] drm/exynos: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-17-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ipEzi5m8pbpqql3fjjBZnFZQT/7rw8bUQKPrztMpMM4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMipTb1Sk3RZolbgk0zR5R/cJzx6Jf/atcw2W/Xzwn
 N8qn4u/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzEbSdjw2GZbeJdb+1ff7r8
 SbWP46nlxKZJbAcWHedZeiBER/KQSYHnzcrCtV3ZaUv8cic/axBjZazTkk0XuPuTYbH0j2U+QVL
 V91LOHhW4FdKbyKbrcdrlEGPRQXOTqPmSURM0TgXXRfU8mQwA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The exynos atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 7c3aa77186d3431d7020db4dec70332c0cfccb5d..6400070a4c9bcc00ecd0f21cbce1b5aafe1bff48 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -56,11 +56,11 @@ static int exynos_plane_get_size(int start, unsigned length, unsigned last)
 static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 {
 	struct drm_plane_state *state = &exynos_state->base;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_crtc_state *crtc_state =
-			drm_atomic_get_existing_crtc_state(state->state, crtc);
+		drm_atomic_get_new_crtc_state(state->state, crtc);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	int crtc_x, crtc_y;
 	unsigned int crtc_w, crtc_h;
 	unsigned int src_x, src_y;
 	unsigned int src_w, src_h;

-- 
2.50.1


