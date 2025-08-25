Return-Path: <linux-mips+bounces-10556-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FCEB341C7
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B38551A85BF6
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FEA2F7473;
	Mon, 25 Aug 2025 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4I3x/yB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C52F7464;
	Mon, 25 Aug 2025 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129478; cv=none; b=WgBiXa8GlOKt5qcdToaFrmO5nf6LiItEz6gArf2ORWKaFkhjr+wP0T7+3gZ5QcWTijiYY6r5sTLciwdbuWPiqqHo7kB5H5S/AirqEwJasBfRPzSdBc2cDEs6g8y2tauB24qu4UXmXqnuaLy3qIHO6nEa4ZJgpEynljpmT/DI3ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129478; c=relaxed/simple;
	bh=5ghhYDBMFJyKIkZbVGAo2O5nXbSJDY0ydQcOIHmbhJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IejEynRvRTZBavCb8xye4QPexj88uSycDSBCus0Y/Jl7Xp1hWVmWgl8cq+Bo/Ab9w+fS3xCK/Q7JF9nnYBwq+oWIEZPEfaj+B1Dqm4AmbmJRuO02DBIwBlD3BJ1ROms0fqxIWD1r/cGdfQK66qMLN8zvGqRBhmdSVg9U2nxhNS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4I3x/yB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC87C19421;
	Mon, 25 Aug 2025 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129478;
	bh=5ghhYDBMFJyKIkZbVGAo2O5nXbSJDY0ydQcOIHmbhJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D4I3x/yBjanVz2cYz/LhIcwvv6sPWavU9NDr7nkjzQ66ZA8eNRmFoS6iZlpkxl8oM
	 RyJYXlwJbLDPC3njIBNJKU1JElOQ7tgCO8WIdKf+AFGR9JfIVYd2G3jalytW2K2hKF
	 QbTINWgea+BKxb929KBbzjf1cWGpQDFZ8xVgBPQvTUxhMBTmpnc29vZvAFkTHTrCzQ
	 UqWGRRlvaUORwAo4lwIrDyWHKz+FO11GGRmg/mO5nHGuie08/i96EEMEuOsXV60vlP
	 rZTKjsTOXl7WivMXMXLoP+gsko6sVWE0a9hzvH3rcCfIOLy+BDWQsZpACyfH/OH+Kz
	 CHZxYTyhJvY2A==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:28 +0200
Subject: [PATCH 23/39] drm/logicvc: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-23-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1236; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5ghhYDBMFJyKIkZbVGAo2O5nXbSJDY0ydQcOIHmbhJU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMmpiJOO1V55NWWtX0vOaee7OgJJls9q75Xbqdu1J6
 lxYrbilYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenANzkJ4wNkwIXXO1pdri+u2J7
 8sIa/9bLUYLFZ4K/eD4T+mPufO2aTMFD6Um/yj9/PpP3ZWnkrT/ljPUFWt0x3BNcVEN6lwrm6qx
 e0fYvcJn2xolu255IMR/ouvY4bLNiTluYhLKa2qkM7+DlnQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The logicvc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/logicvc/logicvc_layer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 464000aea765378894002fdb02dab16d197c27b1..eab4d773f92b66a9edb9770aa7a95349d665ec18 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -94,12 +94,12 @@ static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
 	int ret;
 
 	if (!new_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state,
-							new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
+						   new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (new_state->crtc_x < 0 || new_state->crtc_y < 0) {
 		drm_err(drm_dev,

-- 
2.50.1


