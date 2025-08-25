Return-Path: <linux-mips+bounces-10559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F4B341DE
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A24723A2673
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD642F90D3;
	Mon, 25 Aug 2025 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyofisIO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FA32F8BCA;
	Mon, 25 Aug 2025 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129486; cv=none; b=U2TIMn8NzCvWWcb8Pg+iJX35p8b7aBi8oW1Mp4MuKmTPjz6og+WplBKFer9abbZoRhAP+oe8u9kyYkttXWgXiehXMrEMlmKagZ6i24rs6JeLPrXy+3tCUZRsXIB0L8Lgp/3mzNY3LJ+j9GwE0+qKhy9EjYZeoKx4dsABdDz8HDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129486; c=relaxed/simple;
	bh=HcSbzm6xiAcXfwnDx0Cv/dA7CqHgBV6SnVkm3VTl8b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DcRxrF+2naYx7A5Db4gxsQ6yVcvZFFtk3Fp9rxZrWdfY/FbjttTT0ejr+fHHN5WrNVbcZEvaNrStA9FPr2unPAjdk9hJYHXQFNWIUw6j5j2tns5Ds4D6wnJECfWX/B3XCtC+u2inljBU1cbIsgBDz98Q9qhzZqyDJNNu9U7HHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyofisIO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605F5C4CEF4;
	Mon, 25 Aug 2025 13:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129485;
	bh=HcSbzm6xiAcXfwnDx0Cv/dA7CqHgBV6SnVkm3VTl8b8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AyofisIOZGuv/zRqYOaeXnjJZg1MeSrRJi2kw0vA+ULf2PuI4GYVAWgFhqhNxLdvZ
	 tvMLfEiL/5nB0r8R0SBdzojjnkCRbUcWvQN+EzfdUi26iGbYKIxFAKrf2B49kynvle
	 MHgQ5sCxepLsLs0bkvUZO+TG3vd5nx9HuZhYbfEWu1Pjgfq79LuEB0h4U86JhIZmbJ
	 TYJ2bLTdBsn0nao5cQs0ebKgRoCXRHIfpFLwFFviKMbRypi3JxYNlUmLzTNzxFnVc1
	 JwDlUzCIUEx2PygCcNcHOPkM1dOTOu3AZS8w/LaPBLbkhYLsMCZmfa+qmcwGIgS9oa
	 +BGknHV8Hpy5w==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:31 +0200
Subject: [PATCH 26/39] drm/msm/mdp5: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=mripard@kernel.org;
 h=from:subject:message-id; bh=HcSbzm6xiAcXfwnDx0Cv/dA7CqHgBV6SnVkm3VTl8b8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMmp3bz6RONOjzXdyXarlBweLvcmn58/k6N7sKxf4/
 znje32vjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRmVKMDftn/mbblDC9wyT4
 tFDQxL4bCbeOuSbu1d3zo1xh2ceEm6oOgrW7hGQ1bonfXd6429HoD2PD0Wcue/Qt96gb2x2Us9M
 3OVl9rkRoYvdJwSkbf868bHT+uYXUplYJxqVfhLZunHyZza0AAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The msm atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 7c790406d533fbabb330c438419efb18204cc4b7..4ca183fb61a95af60ef5a2c011ae6b2a0df963f0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -334,12 +334,11 @@ static int mdp5_plane_atomic_check(struct drm_plane *plane,
 
 	crtc = new_plane_state->crtc ? new_plane_state->crtc : old_plane_state->crtc;
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	return mdp5_plane_atomic_check_with_state(crtc_state, new_plane_state);
 }
@@ -371,12 +370,12 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
 	struct mdp5_plane_state *mdp5_state = to_mdp5_plane_state(new_plane_state);
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 	int ret;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (!crtc_state->active)
 		return -EINVAL;

-- 
2.50.1


