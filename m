Return-Path: <linux-mips+bounces-10540-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F418FB34178
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 918E23B3489
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017A52EDD7E;
	Mon, 25 Aug 2025 13:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/BsQxIZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2A82EDD78;
	Mon, 25 Aug 2025 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129435; cv=none; b=Y7xhJBO7UfCTguMzEdmdqKENk5Nd9B6Rf+640w6cEgpb50deavkqs9wsbX2HBkpcxmMXvi7f7xeqLSl3LgdqexlyZ86en3zMJx61SDwoTSEr9vCxB1ct5+oQytPm0eGGqg050XTZNFqojQdITU6BiODHJ95U7oDfox7V7ycLNLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129435; c=relaxed/simple;
	bh=G7LZIEMwrZ2zs/QrPyVfL7lc9nJFGoxjHACLt6UBy9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXSAjgbwnS54r5uodjr6SOODKV29DolVixf6wrsWzOtALEIdxmkb9pMBKFB2sRz5gv1A3Bq8roUwbQjiazym0gNDTv/jiTaO7x2QcFvTE4I7iE9o2gT6JcWj8zZQY2ExelCnpWn1m7yR466tOMkSJM8WB2XBCL1n/S1KMO414pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/BsQxIZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCB2C4CEF4;
	Mon, 25 Aug 2025 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129435;
	bh=G7LZIEMwrZ2zs/QrPyVfL7lc9nJFGoxjHACLt6UBy9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M/BsQxIZAn8XM7JzzrFjrZdUc3D7InIlugU3ivp0a8mMND6PxsoAoexYQW5s1BJP2
	 wve75h+QT609gIKmHIj7eLk86c2scDorUwU0sZd5Q9KnKlhEHAXkbQCDfYfiVFX0IB
	 Uy5Bksa2k8bBVCuYcZk6rw953OgjfmP+kFaqtXvMZu7+GD6WpNiA7VqKk73Ga/5I+A
	 6sAcrYhhRPMcXVfHRDHmoc7CEbY1bzTJcsu05NCrweIUeQREfFNaU/Azf5j1948QSt
	 kmSQdVZUUGLfBUQbWBRaiUAEETrP6m0g9TfsC8cGKG6GUE59orm69u5Z5PTORkzbkk
	 k5qQGn2VDLGRw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:12 +0200
Subject: [PATCH 07/39] drm/atomic: Convert drm_atomic_get_plane_state() to
 use new plane state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-7-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316; i=mripard@kernel.org;
 h=from:subject:message-id; bh=G7LZIEMwrZ2zs/QrPyVfL7lc9nJFGoxjHACLt6UBy9o=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGisaHWi6ZggXb88wKCQXxIWkOcMML7Jvt56wKJuQOV0chzIg
 4iVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmisaHUACgkQJ1/OGaI9vnbwhwF8Dodd
 Y17XQ7BXnBlQbBZweZe/gruGXs9NZZHUrjXtF5ou5REq7DNpnpqIYKxd5QbSAYDrOKSG4/Mu545
 epolGS0QNE0nxjmucr4U/9WReHLXGgcWZ1SGDiizipXF9ST6M9Sg=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_plane_state() function calls the deprecated
drm_atomic_get_existing_plane_state() helper to get find if a plane
state had already been allocated and was part of the given
drm_atomic_state.

At the point in time where drm_atomic_get_plane_state() can be called
(ie, during atomic_check), the existing state is the new state and
drm_atomic_get_existing_plane_state() can thus be replaced by
drm_atomic_get_new_plane_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 30b7ec05a1af07075e40cd2822ecfd67df004ba2..a9d1265e34602c454866869b81b8837b2c0a97a4 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -532,11 +532,11 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 	/* the legacy pointers should never be set */
 	WARN_ON(plane->fb);
 	WARN_ON(plane->old_fb);
 	WARN_ON(plane->crtc);
 
-	plane_state = drm_atomic_get_existing_plane_state(state, plane);
+	plane_state = drm_atomic_get_new_plane_state(state, plane);
 	if (plane_state)
 		return plane_state;
 
 	ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
 	if (ret)

-- 
2.50.1


