Return-Path: <linux-mips+bounces-10534-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2CB34112
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24ADD3A9B2A
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8661D28A1F1;
	Mon, 25 Aug 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFhidSqW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2EB279789;
	Mon, 25 Aug 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129418; cv=none; b=A/COcedbmcqeuIs8ClMCPV7XqyxQkvVUvx8VLco24WzGKe0sVGJknH+GVJ/T5LCQK1ubaAkmBDpLpD/6idAIaR5VdxDGds2hElOhU9n0kGSavqE3cQlmZzUF9jt7EZhvMViO6CnQGOguwLjkkUFKWmIOf3YigedNa0jJ4CQ0Gz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129418; c=relaxed/simple;
	bh=fRlvE8ePbEUQlPi4SftjLgiOk4WsYYC2DKU3UHlDcig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lMN3muep1ZhyFEVX2Bw/v4XZ+WA2+E/PnQqjs70Zw7binklpNiBMkpYvV4A0tDRWYH+rWWrilQwK0qZ8X9DtXypvnLhCDWjnEeqajVT0VZ8xPQbLXE6EkkkxvPk8rX+c8Y3aHX+5de6fI1YYwiWsgR4zRmSiI+JyA437akS6D/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFhidSqW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E55C4CEF4;
	Mon, 25 Aug 2025 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129417;
	bh=fRlvE8ePbEUQlPi4SftjLgiOk4WsYYC2DKU3UHlDcig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bFhidSqWZE3ksEZ1z+MAWokhw6hEwtnZJYHsDuCvvwHCmCjgjrwUAjKCJsYR5fbPS
	 xCdlo4D+XzkxJFdL7sslS3OHoR75iVeXGAuJiQI1Stxvq1jIo1cBD6i4czSPKbW+J3
	 h5Z290ucnaVwFVpFfUgaMjMH4onGvJR3T9lS0fDv/8LmWcD+P+R48f5H9mXkc0pxDu
	 FF3c+SJWKGyS4aKsnwOWighFM04ce5URWGweE5X8ToKICKK1APpqA0kZwkdkSeCO1q
	 WSO46lxARwlORpN8CWmKYJCh6QKzTagC7BTnWyErp2lvwRuiENe0AUd5ndJk9wRHFb
	 McIcImPq0vuAA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:06 +0200
Subject: [PATCH 01/39] drm/atomic: Make drm_atomic_get_connector_state()
 early return consistent
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-1-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fRlvE8ePbEUQlPi4SftjLgiOk4WsYYC2DKU3UHlDcig=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMooahIxPfue/4M0epeJXJWzrea18yz5v2d68hEtco
 ZMP/Z7YMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyeR1jw08zid3vNn6/fNhl
 2ewjD1x7dqREfIg+KnPnm3Bh28/H7trn5R92pl07tFyM1ZzHOyeyhLGhX4O/5nvb/qWXzkuV5jO
 wL+LYzvvD/JyIOZuDSNikXac95H9LMRs3BQpyWwQVW/QK7AEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_connector_state() tries to lookup if a connector
state was already allocated in the global state to return early if it
was the case. drm_atomic_get_plane_state() and
drm_atomic_get_crtc_state() behave similarly.

However, and unlike the other two, drm_atomic_get_connector_state() will
do that lookup after having called drm_modeset_lock(), when the others
will do it before.

Let's move the early return before the lock to make it consistent.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cd15cf52f0c9144711da5879da57884674aea9e4..fe21f154e0fa030f85fb3d6d35e2684adcf36e26 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1128,10 +1128,13 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 	struct drm_mode_config *config = &connector->dev->mode_config;
 	struct drm_connector_state *connector_state;
 
 	WARN_ON(!state->acquire_ctx);
 
+	if (state->connectors[index].state)
+		return state->connectors[index].state;
+
 	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 
 	index = drm_connector_index(connector);
@@ -1150,13 +1153,10 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 		       sizeof(*state->connectors) * (alloc - state->num_connector));
 
 		state->num_connector = alloc;
 	}
 
-	if (state->connectors[index].state)
-		return state->connectors[index].state;
-
 	connector_state = connector->funcs->atomic_duplicate_state(connector);
 	if (!connector_state)
 		return ERR_PTR(-ENOMEM);
 
 	drm_connector_get(connector);

-- 
2.50.1


