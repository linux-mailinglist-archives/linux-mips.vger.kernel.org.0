Return-Path: <linux-mips+bounces-10548-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C63FB34197
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CE0C48466C
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CB72F39D1;
	Mon, 25 Aug 2025 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yo7uFRbY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134CE2D94B2;
	Mon, 25 Aug 2025 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129457; cv=none; b=VLvqm9JYBcU/Y1+i6oJv/z/2FG0J2h4jqQxhUhZ9YvPu/Tfj1HCnR9S0GIZQN36oRM0Tvq+O/uwcVlWQlUwPo9X9t2SXGDzFzvJ68wsKvH+qLmCT/HxyXQeVSv7U6cWbDR7yBsab56hHZraYh6+JscPFFLGSY6JZh+lhIJ4+xoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129457; c=relaxed/simple;
	bh=jwpa6CJEP2ubfKRCAjsrSSxCi0tUyYxFZe/THLd4Tak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=feS0QKF12vnSCkXF765WF1SksyK65B09un5xfoYSmcnAzd3lXLDkMaGoPiuLIZZ13Y3B1ME+8t8BT1VGefRfyOi8/s11kUvBnXGw3t8/65TOHHWcTqJOWXENwjc8ilh3Uy3qYHw4rhBHOOj3DtgsNq0c7d3GzThORjpeekuYB7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yo7uFRbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680F5C116D0;
	Mon, 25 Aug 2025 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129456;
	bh=jwpa6CJEP2ubfKRCAjsrSSxCi0tUyYxFZe/THLd4Tak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yo7uFRbYFma10rAkRJpRBze4IKA64QXDoB0MxcmOsrLbWcD2b2Hb95zr5wIcLK3fG
	 9BVLxJl84DBZb6Qispw7CkAldKM7cs9RaSiCDJqlIIfLanWNMqLm3mqHES7aYzj7s0
	 RiXPMsSE/lXKPGHcWxL6+4Vq+lDx3ldG/2pyUS9xIC+lHbqOhPJ2LAedLj5IlWd2AR
	 SNbPPJ/21ATJvXSxlfJieEItgrjCEL0Ts+aEHVskc0+blUwmKUG+ttJZ4Hy7otZKiN
	 cMpiA6WvBeE6s7kYeuL1VaVC1q3Wve4M7Ul0d2Rne3o2888drckmSWUmMRMY5Kg8e3
	 wajjZRdr8rlyw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:20 +0200
Subject: [PATCH 15/39] drm/armada: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-15-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jwpa6CJEP2ubfKRCAjsrSSxCi0tUyYxFZe/THLd4Tak=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMipm1jo8C4w8YL9pvd4vpZDJZ6qnTo+fuF/zjc0Zz
 auPut4rdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJlP5grBUO0Uidz7hA7Hqk
 yqwPp50ScjPSX7AWJnelRfxZIzP9fKzqf+uVFaFXM5ZmT3s65cW8t4y1kjbeacxLZmq7+Rx8Uuq
 4yrcjyudehn+yz3E/wfeK85bt+Vhw7FGB7Q/5G2n53SbrlB4CAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The armada atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/armada/armada_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index cc47c032dbc151a463cbd0b0d048c74c2828f253..786bcce0dc20eadab14c5bee97593ae3e05732b1 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -93,12 +93,11 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 		new_plane_state->visible = false;
 		return 0;
 	}
 
 	if (state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	else
 		crtc_state = crtc->state;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  0,

-- 
2.50.1


