Return-Path: <linux-mips+bounces-10572-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A987B3422E
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 840CE5E2F65
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A2B2ECEAB;
	Mon, 25 Aug 2025 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gbd9TFFp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C226CE32;
	Mon, 25 Aug 2025 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129521; cv=none; b=nThNCor5dIkLdngGpGlzRhVz5vFHiTcSG5rCv0Vm5n2TKH8bRHOfAhBML/CiurpU4WUEFXAO66tGlhuXk0DXxPY6vFKzxp3+sP5epOZFgUOmz0bsC1Sy5FGMTF0R6K9zJ8NP98DsMZk3kdOMD4X0BMSLuCJ0YxFCSssOQiuTgaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129521; c=relaxed/simple;
	bh=JLMIgCAsxjzxuydkVuFbaW+CIAKd8FHbajZuUIMyqfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AH5Edl3/D3C4uvmhtZ9m1lvKYuohDL8LcFLrqjwvUQvxv9f1+aw1UpTIBsyGA362QcGQzKBD44dX6Ruef/XAlqndPeK4rMOlHzvIsKdG5SFqausyiXVslHk41SsZvee/l/0nerxQu0FfwkdlHwaG1qkD52/qK/HhjhS5E2SnUTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gbd9TFFp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D3BC113D0;
	Mon, 25 Aug 2025 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129521;
	bh=JLMIgCAsxjzxuydkVuFbaW+CIAKd8FHbajZuUIMyqfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gbd9TFFphA8CsNadp5kIg68cFiPRgIGBzQXqFxl4f5sE34+h3jyfL90zokSNigLi4
	 OKtMVh2T/9d0WN0xpmsjujI22Ml6/Auy+PTXywkhRmgEk43Dgxe9EZdlkDpj6T5tcx
	 h+tITF3cx9j5cpYIqGvQvAqjHeyUG54Y65RhTeVtZfJJkzFLjVnKhkhoVmJnzk2CaR
	 f+g7xw7kIzBqMPtofuGEdXTG43+AFzWZ/AotyCnLFh/O2MooVX/MK/7z0LcP2xP6a4
	 EMgZB+mnrz6RqLmNK7UnLbVao22QdoznSLQXNRpCt+TCV86tPXyEKdkjWV9ZgaJObI
	 FIuUqaBo7t6EA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:44 +0200
Subject: [PATCH 39/39] drm/atomic: Document __drm_private_objs_state state
 pointer
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-39-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JLMIgCAsxjzxuydkVuFbaW+CIAKd8FHbajZuUIMyqfg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMprNd0U4trEo204sdVznvn9uxM7dL9fWXJ05WcBui
 uRnJ4EzHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiv/kYG+a6Wz5Y42Vho3Jr
 h7P23y+KAYuDZlvLqmjGCVe9uebfqV0iVpKQ2bw+U5H7c1DIkk//GOtj5ZLqjY5uONkxz9Oo121
 ekb2Sif22bcLft74z5K44bLVR5Y/TpHUxxx2kI6S3lrU1CwMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

While the old and new state pointers are somewhat self-explanatory, the
state pointer and its relation to the other two really isn't.

Now that we've cleaned up everything and it isn't used in any
modesetting path, we can document what it's still useful for: to free
the right state when we free the global state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index e8edf33ab260c03c81e16917a6a5a7d9648d46c9..a7e75bb0bdc6a38eb83c07b844dd97af48006f0f 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -383,11 +383,25 @@ struct drm_private_state {
 	struct drm_private_obj *obj;
 };
 
 struct __drm_private_objs_state {
 	struct drm_private_obj *ptr;
-	struct drm_private_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_private_state we will need to free
+	 * when tearing down the associated &drm_atomic_state.
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_private_state *state;
+
+	struct drm_private_state *old_state, *new_state;
 };
 
 /**
  * struct drm_atomic_state - Atomic commit structure
  *

-- 
2.50.1


