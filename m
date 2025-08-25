Return-Path: <linux-mips+bounces-10544-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFC0B341EF
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 15:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 202DA7B533C
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 13:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A6B2F0698;
	Mon, 25 Aug 2025 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D539xSRT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE02F0C66;
	Mon, 25 Aug 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756129447; cv=none; b=eVAzB61nzK6QPpe9IVJtKaIhOGsfdifSvm17CFS+c6SfOWZ2zE6iuiqGX5W+8jDqDKspd0PLwD2CXvPUqZmh6P71LSIn4uNu7996WZmFb68ru0n1r75Avk6aX7vMuDTfkkjDJ1S2+S7WpSgtoHHQ89NLVSuf2uePf+PRIVLJ8PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756129447; c=relaxed/simple;
	bh=zMbFg0p1Hsu9u9xOAhfW6MA410xngWSLfsvX95wACGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsCGfU0T8wesN2GXYLlbV972yK/yvMrcGvPKk/SU0MdpUttQqWIuPkhOAk0z+7KDX8EIvxNkMgVm59yrS1Fchs8iHYs/NIN/IaMKDeNvHagIy+JslXbUUKcEUtymNiTFCm0a86DOZeZ/Yc0Dmvi6RDTikikiE0r/f0EheKHv6eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D539xSRT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9057C4CEF4;
	Mon, 25 Aug 2025 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756129446;
	bh=zMbFg0p1Hsu9u9xOAhfW6MA410xngWSLfsvX95wACGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D539xSRTSk7gVbYS0In1u7UHKAioWUMXAPgMZVTsJ4UYdi6oBoHBO/OGBSl7lEyqZ
	 eDZ7NrxaZ/9G7fVk5Vyr58upJxP5r5aTNEMcBhYgPDnrtTK0TsaXeKIP6hC8n11s+I
	 fViSDR0gUsjzvv2H6vX/dPZHpXlOPqZvF+FgqOMcSutWMuXgwm4HzJpjsjhLWSBPOu
	 e8WT4GeZmbATJ11iP7T6n30oWo+caHGz7swuw0FESAzLChgiQ+DPrcwToNnYeJ8OBj
	 cPate3Gc96pRxGluzjUF8tVIHzlQFTR8heaN9AKtvWyriBF20GN4jug5KguFTVXoBg
	 tVRyDX4zozmpg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Aug 2025 15:43:16 +0200
Subject: [PATCH 11/39] drm/atomic: Document __drm_planes_state state
 pointer
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-drm-no-more-existing-state-v1-11-f08ccd9f85c9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zMbFg0p1Hsu9u9xOAhfW6MA410xngWSLfsvX95wACGc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBlrMsr9Q/UYNH3vcu8WKZP+cuvO4z87sypsJ0/KsBAv+
 7T+us/UjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARK2/Ghg6LC1efC/zc//XX
 +99TXoUsn3Zw/aYoxeh1Vr3LJry4abn1feW+sos1y/RN1y1Oyrl3W4Cx4VnoB6acxdObXtl/b3c
 36Ql4+n5L/7bKSZw/nGZuKpUu1Yi8Y3VgQZ25v8KppAul+Q9fAgA=
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
index 2f2c92fc4c20ee4e6abd6911bd574969d9cabbbb..89c9a059b36763205fc2fc764283423cbea62679 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -157,11 +157,25 @@ struct drm_crtc_commit {
 	bool abort_completion;
 };
 
 struct __drm_planes_state {
 	struct drm_plane *ptr;
-	struct drm_plane_state *state, *old_state, *new_state;
+
+	/**
+	 * @state:
+	 *
+	 * Used to track the @drm_plane_state we will need to free
+	 * when tearing down the associated &drm_atomic_state.
+	 *
+	 * Before a commit, and the call to
+	 * drm_atomic_helper_swap_state() in particular, it points to
+	 * the same state than @new_state. After a commit, it points to
+	 * the same state than @old_state.
+	 */
+	struct drm_plane_state *state;
+
+	struct drm_plane_state *old_state, *new_state;
 };
 
 struct __drm_crtcs_state {
 	struct drm_crtc *ptr;
 	struct drm_crtc_state *state, *old_state, *new_state;

-- 
2.50.1


