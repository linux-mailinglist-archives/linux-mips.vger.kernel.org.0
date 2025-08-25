Return-Path: <linux-mips+bounces-10547-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBEB34194
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AA64171521
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44B32F39A7;
	Mon, 25 Aug 2025 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Phfo7hkS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF362D6E6B;
	Mon, 25 Aug 2025 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129454; cv=none; b=IJ3XAcBqDVepb5JQTt0uJD51PfF5uZM2P91r1Lbq4zzK2L7kIRyCULcJuaCCozllq0ZhUzwoutJ+Gx8g9r2f3KX9pigLIuB0ZlKCvDPdDAzG3SnkqATPDiDhrOM9cSaRP5R6kNtiyK/gEJ3yzYdKOjq1oMchTS6eKQOydDrYNtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129454; c=relaxed/simple;
	bh=Dqurh617UrokV/DsN3wUHEPX/CtTx5rZKSYqJBIX2Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANO3VmWY/YHouK+DCmARkh9PZ4CvZ9i5MXUKOiNoUk5GWdTgNaoQolSR89yHvWWsU3Uk5gaxF9jFXCVFLPh+Lwt+lY1qrJKJFq6rCWFX/OQcU8Umi6KftW//QNZ8AHY3LmRP8IKKnWOlhcxu8a1p1tMeVmGsNhYSaRKyjvRKEX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Phfo7hkS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84BCC4CEED;
	Mon, 25 Aug 2025 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129454;
	bh=Dqurh617UrokV/DsN3wUHEPX/CtTx5rZKSYqJBIX2Lc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Phfo7hkSImUre0GDuGBAnNI68G6mb9DSo2cnBds3wAcpM2V5AAjw8JXJMlzWdyRnj
	 3/PhWhwoJw/t8UG7hXt0tin+l4LJZNwl5qAxD2DmchLvqwj/IQhX/HHMaItDsP8CYb
	 B67gKsLFjBLcQnwDEoYA3feOtbppFXrjSAk8+LdVSz22T24DBvfzLoyFaETHJTCWsx
	 hCWJ0TjPCBbqJDM3usjgC0wLszip/5B0MUj1YKzVQtdMRo+Xy1/22EX3P50k8WYQxg
	 fqvu+cgwApm3CXnbsfzdCfOayRONAgKjyK87V7QlUTnQNLtyPc13p8CjLLDmvcZDdM
	 xXt9WGVoLnFDA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:19 +0200
Subject: [PATCH 14/39] drm/arm/malidp: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-14-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Dqurh617UrokV/DsN3wUHEPX/CtTx5rZKSYqJBIX2Lc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMirkHv5ZIqsV78QcLb00l3Hxpwd5pUeX1QmteacUH
 cbwwcK8YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExk5mLGOvP0/dr/DnQ4Pblk
 yB6w8WZ6dO/itFXurQd0Ps7avGGCiOa541tvicfkmIu875m5QU9Ol7E+sedZ/j++rSyv3Yq93oR
 PnPixwUHg8KczrjLzNm179+P5n4m2dh1hurG1fTNbjYRE9OcCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The malidp atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 87f2e5ee87907403fac5386042bd6f313397ba03..f1a5014bcfa1058072e13f1ad8e84c85f52fb156 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -261,11 +261,11 @@ static const struct drm_plane_funcs malidp_de_plane_funcs = {
 
 static int malidp_se_check_scaling(struct malidp_plane *mp,
 				   struct drm_plane_state *state)
 {
 	struct drm_crtc_state *crtc_state =
-		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
+		drm_atomic_get_new_crtc_state(state->state, state->crtc);
 	struct malidp_crtc_state *mc;
 	u32 src_w, src_h;
 	int ret;
 
 	if (!crtc_state)

-- 
2.50.1


