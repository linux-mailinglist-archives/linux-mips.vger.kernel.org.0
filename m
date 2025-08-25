Return-Path: <linux-mips+bounces-10571-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C4B3420A
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CB3A4E3366
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EBF2FF64E;
	Mon, 25 Aug 2025 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPKeTWtS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEBD2FE074;
	Mon, 25 Aug 2025 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129520; cv=none; b=SOZmOYZjAKQqwv/S+ba8/iFZITUderamP+7rBSqkdfcSj83nnJIjhmrhtZX2oBc7WSkizK/LoH3fg84Q2d7wnh/24/JAyc3ZDvSx7WGk02UCJI30XBkv4eR8rnGxTJAwzuJ6dwwP8fmJ+qOOg6OJJxL2SwSgeqsD9W1Tg4QgqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129520; c=relaxed/simple;
	bh=P+MwotXQU+Br0nktRY81tUlU3m2eu+riDoASsuu8dS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2cxngGCVOkuLqwWUg90Fk7JVAKbGPfTuGhbr3ZG0K1xt89wy8wBpDKX9SGMCzzoLCb+0h60aTrSilqnAFB3m7ikVDkjLmiJ4wY9/y+TLViDLP1OzAdjyanbu7Onhr+7yMCvpKW0MzMJfy6Zrri3gOnx4fGFVpwWyPdirTCJ/AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPKeTWtS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96B8C4CEED;
	Mon, 25 Aug 2025 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129518;
	bh=P+MwotXQU+Br0nktRY81tUlU3m2eu+riDoASsuu8dS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZPKeTWtSJ75T40PkL1eTTeKIuQeKANNnmbgXcC73UafAROYFn0rY7i07YHZcbJRk5
	 hkbIf0BV8aiyHUgtdVUDrIU5wfIKklozpFtW11IRj8qTvo2UWSbne1Ik+quRMzJa2Z
	 IwW/7BSLcRzVwz2/On6lt7k0QCpZvZJs+cezG2BzyRSjPxq/FMXxbv5QlOETXeoQA4
	 l3P7scEsth6m5JB9VcaO4GUyQ9ghc20hAh+vUw88/sL0zzsMlU92wqDe7lqPE3JQ8i
	 3a6Hc7NdZP0qgamw+tAGWNjOKpcjXabJEKnIFinEc85sh466Rjt5De8pQkomUF2O5y
	 KJEuxck4MDY/A==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:43 +0200
Subject: [PATCH 38/39] drm/atomic: Convert
 drm_atomic_get_private_obj_state() to use new plane state
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-38-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578; i=mripard@kernel.org;
 h=from:subject:message-id; bh=P+MwotXQU+Br0nktRY81tUlU3m2eu+riDoASsuu8dS4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMpr15orvaMzIv/mS60q77/a3uRP5zLs5Jh+a1fn5z
 tEVNx7d7ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATmXuBsWH5ajkug/kfs+VP
 3G7xtCneufqGidbEr2uupN0zn2Ud1GKq9U0/vH6tUcXWO9rpp6ctaWNsaNcX6/8X8uq4g4jEa7U
 OLQG5/g6ViXn35Xn4jaVvVXBNNtUSFr6qH3lX7mxGuaPENh0A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_atomic_get_private_obj_state() function tries to find if a
private_obj had already been allocated and was part of the given
drm_atomic_state. If one is found, it returns the existing state
pointer.

At the point in time where drm_atomic_get_private_obj_state() can be
called (ie, during atomic_check), the existing state is the new state
and we can thus replace the hand-crafted logic by a call to
drm_atomic_get_new_private_obj_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6d92f13d489f299aea5cd14f900ae766588462da..b7bef44e2d42eb56446a5a05f851c7503daeaa1f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -829,18 +829,18 @@ EXPORT_SYMBOL(drm_atomic_private_obj_fini);
  */
 struct drm_private_state *
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 				 struct drm_private_obj *obj)
 {
-	int index, num_objs, i, ret;
+	int index, num_objs, ret;
 	size_t size;
 	struct __drm_private_objs_state *arr;
 	struct drm_private_state *obj_state;
 
-	for (i = 0; i < state->num_private_objs; i++)
-		if (obj == state->private_objs[i].ptr)
-			return state->private_objs[i].state;
+	obj_state = drm_atomic_get_new_private_obj_state(state, obj);
+	if (obj_state)
+		return obj_state;
 
 	ret = drm_modeset_lock(&obj->lock, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.50.1


