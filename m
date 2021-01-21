Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E772FF0A0
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 17:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388100AbhAUQiA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 11:38:00 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:42263 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388070AbhAUQhz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 11:37:55 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id D1120580543;
        Thu, 21 Jan 2021 11:36:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 21 Jan 2021 11:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=yGhE70aETX3Tw
        6s03oleGvvMP2EhdvogzJcQTeMZysY=; b=sbWoJuecJc1QlvWOuQFzV1G1EUKNO
        zwRRnLCBO2SOWRvsvJFbajSYsIaQYzig35vDSTQuyejS/VyoVWAOlvUdTWhnDcoH
        DeIHFAUzK0rNNbLZY+6iNvGufqCM9a5Uql78/pu8qcUazTxzOXIT11larHq58Zp5
        8VOKx8K9aLmUNqX9OCroOGuWZa8cMIUQgsyADc+pvfOAA0Soim3GA5BeiGIUA7OB
        ev3hKRFNSO0m/PuJnU5XWltPgkPQl+zXsMefONvvilnqVKzfDgnAN3I7eB+SDoKT
        FitOGmB0Ae1Zo+27AJNnrNPuECjCtj6jszvr4dzW2T5+Ak5TXC3sYyj1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=yGhE70aETX3Tw6s03oleGvvMP2EhdvogzJcQTeMZysY=; b=lmIFfU/I
        4pIR4dFJMxs9K3TxSaT0q0aaU0dNHMP8HZ/cU/Sc7HxFFBjssfrmEEszQceiG/fq
        SSO0UHeN14yX++Wl6s5u6RW0EIqphCpnfB+BIP6EhnAHYz+sMTijnCT//p+rBQ0g
        CqBglF3AGSds6A8BPB60DcA/JrBKqswTNQNGccBIgATzNbZQNr6DtnjDRmuZUr1A
        pGWeyWX7AI1yqtvyv2YUA17JxM6hCg1ymFeyf1JFKtHIzOEaQYO0SJfG/zBQwVau
        WRjeldJ3SMgYQXSD4SLzj+CvmYi58eqCoicxGNOloMyP4/Tx9jiKERySGxOUw1Z9
        36iV0oxDzowKPg==
X-ME-Sender: <xms:cq0JYF9PsoZOabtG3ysY9D6Emw9LK6StvuONyhyiyCshTLHgZNV3mg>
    <xme:cq0JYJtBxWL7GeMtGzQciQHr1RcVZOrH1MxlobJWD85pLhk_dzNJskW-kCT4Ulyax
    y4JTHhQUEUE2ERkLzE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cq0JYDCJMiO6_eRSkvBzxqzyLfCXEOR0ZC5kRA9_cdNb3ARNgWvcpw>
    <xmx:cq0JYJf16MBo86S5dmJQYegDlqLovMV5G84ZTYVvhmbvFTljg0OI_w>
    <xmx:cq0JYKP_TQVbzGuedRz-qnsThzkE8bY658JQFWxcUqsvbVDDJOElNg>
    <xmx:cq0JYLkZfuKoilO21iIR4mGN-TywK9JZHLipw8Q--hdGfwddvKj5PQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A068E1080059;
        Thu, 21 Jan 2021 11:36:01 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        John Stultz <john.stultz@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marek Vasut <marex@denx.de>, Tomi Valkeinen <tomba@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 08/11] drm: Rename plane->state variables in atomic update and disable
Date:   Thu, 21 Jan 2021 17:35:33 +0100
Message-Id: <20210121163537.1466118-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121163537.1466118-1-maxime@cerno.tech>
References: <20210121163537.1466118-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some drivers are storing the plane->state pointer in atomic_update and
atomic_disable in a variable simply called state, while the state passed
as an argument is called old_state.

In order to ease subsequent reworks and to avoid confusing or
inconsistent names, let's rename those variables to new_state.

This was done using the following coccinelle script, plus some manual
changes for mtk and tegra.

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

(
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_disable = func,
	...,
 };
|
 static const struct drm_plane_helper_funcs helpers = {
 	...,
 	.atomic_update = func,
	...,
 };
)

@ moves_new_state_old_state @
identifier plane_atomic_func.func;
identifier plane;
symbol old_state;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_state)
 {
 	...
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
	...
 }

@ depends on moves_new_state_old_state @
identifier plane_atomic_func.func;
identifier plane;
identifier old_state;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_state)
 {
 	<...
-	state
+	new_state
	...>
 }

@ moves_new_state_oldstate @
identifier plane_atomic_func.func;
identifier plane;
symbol oldstate;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *oldstate)
 {
 	...
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *newstate = plane->state;
	...
 }

@ depends on moves_new_state_oldstate @
identifier plane_atomic_func.func;
identifier plane;
identifier old_state;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_state)
 {
 	<...
-	state
+	newstate
	...>
 }

@ moves_new_state_old_pstate @
identifier plane_atomic_func.func;
identifier plane;
symbol old_pstate;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_pstate)
 {
 	...
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_pstate = plane->state;
	...
 }

@ depends on moves_new_state_old_pstate @
identifier plane_atomic_func.func;
identifier plane;
identifier old_pstate;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *old_pstate)
 {
 	<...
-	state
+	new_pstate
	...>
 }

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/arm/malidp_planes.c           |  34 +++---
 drivers/gpu/drm/armada/armada_overlay.c       | 104 +++++++++---------
 drivers/gpu/drm/armada/armada_plane.c         |  63 +++++------
 drivers/gpu/drm/ast/ast_mode.c                |  14 +--
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |   6 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  10 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    |  12 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  11 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |  25 +++--
 drivers/gpu/drm/imx/ipuv3-plane.c             |  45 ++++----
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  16 +--
 drivers/gpu/drm/ingenic/ingenic-ipu.c         |  34 +++---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  29 +++--
 drivers/gpu/drm/meson/meson_overlay.c         |   6 +-
 drivers/gpu/drm/meson/meson_plane.c           |  30 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   8 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |   4 +-
 drivers/gpu/drm/omapdrm/omap_plane.c          |  21 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  20 ++--
 drivers/gpu/drm/sti/sti_cursor.c              |  10 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |  40 +++----
 drivers/gpu/drm/sti/sti_hqvdp.c               |  40 +++----
 drivers/gpu/drm/stm/ltdc.c                    |  28 ++---
 drivers/gpu/drm/tegra/dc.c                    |  20 ++--
 drivers/gpu/drm/tegra/hub.c                   |  10 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |   8 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c         |  14 +--
 drivers/gpu/drm/zte/zx_plane.c                |   8 +-
 30 files changed, 347 insertions(+), 339 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index c94c4a96db68..646b27a42452 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -795,9 +795,9 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 {
 	struct malidp_plane *mp;
 	struct malidp_plane_state *ms = to_malidp_plane_state(plane->state);
-	struct drm_plane_state *state = plane->state;
-	u16 pixel_alpha = state->pixel_blend_mode;
-	u8 plane_alpha = state->alpha >> 8;
+	struct drm_plane_state *new_state = plane->state;
+	u16 pixel_alpha = new_state->pixel_blend_mode;
+	u8 plane_alpha = new_state->alpha >> 8;
 	u32 src_w, src_h, dest_w, dest_h, val;
 	int i;
 	struct drm_framebuffer *fb = plane->state->fb;
@@ -813,12 +813,12 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 		src_h = fb->height;
 	} else {
 		/* convert src values from Q16 fixed point to integer */
-		src_w = state->src_w >> 16;
-		src_h = state->src_h >> 16;
+		src_w = new_state->src_w >> 16;
+		src_h = new_state->src_h >> 16;
 	}
 
-	dest_w = state->crtc_w;
-	dest_h = state->crtc_h;
+	dest_w = new_state->crtc_w;
+	dest_h = new_state->crtc_h;
 
 	val = malidp_hw_read(mp->hwdev, mp->layer->base);
 	val = (val & ~LAYER_FORMAT_MASK) | ms->format;
@@ -830,7 +830,7 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 	malidp_de_set_mmu_control(mp, ms);
 
 	malidp_de_set_plane_pitches(mp, ms->n_planes,
-				    state->fb->pitches);
+				    new_state->fb->pitches);
 
 	if ((plane->state->color_encoding != old_state->color_encoding) ||
 	    (plane->state->color_range != old_state->color_range))
@@ -843,8 +843,8 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 	malidp_hw_write(mp->hwdev, LAYER_H_VAL(dest_w) | LAYER_V_VAL(dest_h),
 			mp->layer->base + MALIDP_LAYER_COMP_SIZE);
 
-	malidp_hw_write(mp->hwdev, LAYER_H_VAL(state->crtc_x) |
-			LAYER_V_VAL(state->crtc_y),
+	malidp_hw_write(mp->hwdev, LAYER_H_VAL(new_state->crtc_x) |
+			LAYER_V_VAL(new_state->crtc_y),
 			mp->layer->base + MALIDP_LAYER_OFFSET);
 
 	if (mp->layer->id == DE_SMART) {
@@ -866,19 +866,19 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 	val &= ~LAYER_ROT_MASK;
 
 	/* setup the rotation and axis flip bits */
-	if (state->rotation & DRM_MODE_ROTATE_MASK)
+	if (new_state->rotation & DRM_MODE_ROTATE_MASK)
 		val |= ilog2(plane->state->rotation & DRM_MODE_ROTATE_MASK) <<
 		       LAYER_ROT_OFFSET;
-	if (state->rotation & DRM_MODE_REFLECT_X)
+	if (new_state->rotation & DRM_MODE_REFLECT_X)
 		val |= LAYER_H_FLIP;
-	if (state->rotation & DRM_MODE_REFLECT_Y)
+	if (new_state->rotation & DRM_MODE_REFLECT_Y)
 		val |= LAYER_V_FLIP;
 
 	val &= ~(LAYER_COMP_MASK | LAYER_PMUL_ENABLE | LAYER_ALPHA(0xff));
 
-	if (state->alpha != DRM_BLEND_ALPHA_OPAQUE) {
+	if (new_state->alpha != DRM_BLEND_ALPHA_OPAQUE) {
 		val |= LAYER_COMP_PLANE;
-	} else if (state->fb->format->has_alpha) {
+	} else if (new_state->fb->format->has_alpha) {
 		/* We only care about blend mode if the format has alpha */
 		switch (pixel_alpha) {
 		case DRM_MODE_BLEND_PREMULTI:
@@ -892,9 +892,9 @@ static void malidp_de_plane_update(struct drm_plane *plane,
 	val |= LAYER_ALPHA(plane_alpha);
 
 	val &= ~LAYER_FLOWCFG(LAYER_FLOWCFG_MASK);
-	if (state->crtc) {
+	if (new_state->crtc) {
 		struct malidp_crtc_state *m =
-			to_malidp_crtc_state(state->crtc->state);
+			to_malidp_crtc_state(new_state->crtc->state);
 
 		if (m->scaler_config.scale_enable &&
 		    m->scaler_config.plane_src_id == mp->layer->id)
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 6346b890279a..f5e75c96b476 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -68,7 +68,7 @@ static inline u32 armada_csc(struct drm_plane_state *state)
 static void armada_drm_overlay_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	struct armada_crtc *dcrtc;
 	struct armada_regs *regs;
 	unsigned int idx;
@@ -76,62 +76,64 @@ static void armada_drm_overlay_plane_atomic_update(struct drm_plane *plane,
 
 	DRM_DEBUG_KMS("[PLANE:%d:%s]\n", plane->base.id, plane->name);
 
-	if (!state->fb || WARN_ON(!state->crtc))
+	if (!new_state->fb || WARN_ON(!new_state->crtc))
 		return;
 
 	DRM_DEBUG_KMS("[PLANE:%d:%s] is on [CRTC:%d:%s] with [FB:%d] visible %u->%u\n",
 		plane->base.id, plane->name,
-		state->crtc->base.id, state->crtc->name,
-		state->fb->base.id,
-		old_state->visible, state->visible);
+		new_state->crtc->base.id, new_state->crtc->name,
+		new_state->fb->base.id,
+		old_state->visible, new_state->visible);
 
-	dcrtc = drm_to_armada_crtc(state->crtc);
+	dcrtc = drm_to_armada_crtc(new_state->crtc);
 	regs = dcrtc->regs + dcrtc->regs_idx;
 
 	idx = 0;
-	if (!old_state->visible && state->visible)
+	if (!old_state->visible && new_state->visible)
 		armada_reg_queue_mod(regs, idx,
 				     0, CFG_PDWN16x66 | CFG_PDWN32x66,
 				     LCD_SPU_SRAM_PARA1);
-	val = armada_src_hw(state);
+	val = armada_src_hw(new_state);
 	if (armada_src_hw(old_state) != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_DMA_HPXL_VLN);
-	val = armada_dst_yx(state);
+	val = armada_dst_yx(new_state);
 	if (armada_dst_yx(old_state) != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_DMA_OVSA_HPXL_VLN);
-	val = armada_dst_hw(state);
+	val = armada_dst_hw(new_state);
 	if (armada_dst_hw(old_state) != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_DZM_HPXL_VLN);
 	/* FIXME: overlay on an interlaced display */
-	if (old_state->src.x1 != state->src.x1 ||
-	    old_state->src.y1 != state->src.y1 ||
-	    old_state->fb != state->fb ||
-	    state->crtc->state->mode_changed) {
+	if (old_state->src.x1 != new_state->src.x1 ||
+	    old_state->src.y1 != new_state->src.y1 ||
+	    old_state->fb != new_state->fb ||
+	    new_state->crtc->state->mode_changed) {
 		const struct drm_format_info *format;
 		u16 src_x;
 
-		armada_reg_queue_set(regs, idx, armada_addr(state, 0, 0),
+		armada_reg_queue_set(regs, idx, armada_addr(new_state, 0, 0),
 				     LCD_SPU_DMA_START_ADDR_Y0);
-		armada_reg_queue_set(regs, idx, armada_addr(state, 0, 1),
+		armada_reg_queue_set(regs, idx, armada_addr(new_state, 0, 1),
 				     LCD_SPU_DMA_START_ADDR_U0);
-		armada_reg_queue_set(regs, idx, armada_addr(state, 0, 2),
+		armada_reg_queue_set(regs, idx, armada_addr(new_state, 0, 2),
 				     LCD_SPU_DMA_START_ADDR_V0);
-		armada_reg_queue_set(regs, idx, armada_addr(state, 1, 0),
+		armada_reg_queue_set(regs, idx, armada_addr(new_state, 1, 0),
 				     LCD_SPU_DMA_START_ADDR_Y1);
-		armada_reg_queue_set(regs, idx, armada_addr(state, 1, 1),
+		armada_reg_queue_set(regs, idx, armada_addr(new_state, 1, 1),
 				     LCD_SPU_DMA_START_ADDR_U1);
-		armada_reg_queue_set(regs, idx, armada_addr(state, 1, 2),
+		armada_reg_queue_set(regs, idx, armada_addr(new_state, 1, 2),
 				     LCD_SPU_DMA_START_ADDR_V1);
 
-		val = armada_pitch(state, 0) << 16 | armada_pitch(state, 0);
+		val = armada_pitch(new_state, 0) << 16 | armada_pitch(new_state,
+								      0);
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_DMA_PITCH_YC);
-		val = armada_pitch(state, 1) << 16 | armada_pitch(state, 2);
+		val = armada_pitch(new_state, 1) << 16 | armada_pitch(new_state,
+								      2);
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_DMA_PITCH_UV);
 
-		cfg = CFG_DMA_FMT(drm_fb_to_armada_fb(state->fb)->fmt) |
-		      CFG_DMA_MOD(drm_fb_to_armada_fb(state->fb)->mod) |
+		cfg = CFG_DMA_FMT(drm_fb_to_armada_fb(new_state->fb)->fmt) |
+		      CFG_DMA_MOD(drm_fb_to_armada_fb(new_state->fb)->mod) |
 		      CFG_CBSH_ENA;
-		if (state->visible)
+		if (new_state->visible)
 			cfg |= CFG_DMA_ENA;
 
 		/*
@@ -139,28 +141,28 @@ static void armada_drm_overlay_plane_atomic_update(struct drm_plane *plane,
 		 * U/V planes to swap.  Compensate for it by also toggling
 		 * the UV swap.
 		 */
-		format = state->fb->format;
-		src_x = state->src.x1 >> 16;
+		format = new_state->fb->format;
+		src_x = new_state->src.x1 >> 16;
 		if (format->num_planes == 1 && src_x & (format->hsub - 1))
 			cfg ^= CFG_DMA_MOD(CFG_SWAPUV);
-		if (to_armada_plane_state(state)->interlace)
+		if (to_armada_plane_state(new_state)->interlace)
 			cfg |= CFG_DMA_FTOGGLE;
 		cfg_mask = CFG_CBSH_ENA | CFG_DMAFORMAT |
 			   CFG_DMA_MOD(CFG_SWAPRB | CFG_SWAPUV |
 				       CFG_SWAPYU | CFG_YUV2RGB) |
 			   CFG_DMA_FTOGGLE | CFG_DMA_TSTMODE |
 			   CFG_DMA_ENA;
-	} else if (old_state->visible != state->visible) {
-		cfg = state->visible ? CFG_DMA_ENA : 0;
+	} else if (old_state->visible != new_state->visible) {
+		cfg = new_state->visible ? CFG_DMA_ENA : 0;
 		cfg_mask = CFG_DMA_ENA;
 	} else {
 		cfg = cfg_mask = 0;
 	}
-	if (drm_rect_width(&old_state->src) != drm_rect_width(&state->src) ||
-	    drm_rect_width(&old_state->dst) != drm_rect_width(&state->dst)) {
+	if (drm_rect_width(&old_state->src) != drm_rect_width(&new_state->src) ||
+	    drm_rect_width(&old_state->dst) != drm_rect_width(&new_state->dst)) {
 		cfg_mask |= CFG_DMA_HSMOOTH;
-		if (drm_rect_width(&state->src) >> 16 !=
-		    drm_rect_width(&state->dst))
+		if (drm_rect_width(&new_state->src) >> 16 !=
+		    drm_rect_width(&new_state->dst))
 			cfg |= CFG_DMA_HSMOOTH;
 	}
 
@@ -168,41 +170,41 @@ static void armada_drm_overlay_plane_atomic_update(struct drm_plane *plane,
 		armada_reg_queue_mod(regs, idx, cfg, cfg_mask,
 				     LCD_SPU_DMA_CTRL0);
 
-	val = armada_spu_contrast(state);
-	if ((!old_state->visible && state->visible) ||
+	val = armada_spu_contrast(new_state);
+	if ((!old_state->visible && new_state->visible) ||
 	    armada_spu_contrast(old_state) != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_CONTRAST);
-	val = armada_spu_saturation(state);
-	if ((!old_state->visible && state->visible) ||
+	val = armada_spu_saturation(new_state);
+	if ((!old_state->visible && new_state->visible) ||
 	    armada_spu_saturation(old_state) != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_SATURATION);
-	if (!old_state->visible && state->visible)
+	if (!old_state->visible && new_state->visible)
 		armada_reg_queue_set(regs, idx, 0x00002000, LCD_SPU_CBSH_HUE);
-	val = armada_csc(state);
-	if ((!old_state->visible && state->visible) ||
+	val = armada_csc(new_state);
+	if ((!old_state->visible && new_state->visible) ||
 	    armada_csc(old_state) != val)
 		armada_reg_queue_mod(regs, idx, val, CFG_CSC_MASK,
 				     LCD_SPU_IOPAD_CONTROL);
-	val = drm_to_overlay_state(state)->colorkey_yr;
-	if ((!old_state->visible && state->visible) ||
+	val = drm_to_overlay_state(new_state)->colorkey_yr;
+	if ((!old_state->visible && new_state->visible) ||
 	    drm_to_overlay_state(old_state)->colorkey_yr != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_COLORKEY_Y);
-	val = drm_to_overlay_state(state)->colorkey_ug;
-	if ((!old_state->visible && state->visible) ||
+	val = drm_to_overlay_state(new_state)->colorkey_ug;
+	if ((!old_state->visible && new_state->visible) ||
 	    drm_to_overlay_state(old_state)->colorkey_ug != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_COLORKEY_U);
-	val = drm_to_overlay_state(state)->colorkey_vb;
-	if ((!old_state->visible && state->visible) ||
+	val = drm_to_overlay_state(new_state)->colorkey_vb;
+	if ((!old_state->visible && new_state->visible) ||
 	    drm_to_overlay_state(old_state)->colorkey_vb != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_COLORKEY_V);
-	val = drm_to_overlay_state(state)->colorkey_mode;
-	if ((!old_state->visible && state->visible) ||
+	val = drm_to_overlay_state(new_state)->colorkey_mode;
+	if ((!old_state->visible && new_state->visible) ||
 	    drm_to_overlay_state(old_state)->colorkey_mode != val)
 		armada_reg_queue_mod(regs, idx, val, CFG_CKMODE_MASK |
 				     CFG_ALPHAM_MASK | CFG_ALPHA_MASK,
 				     LCD_SPU_DMA_CTRL1);
-	val = drm_to_overlay_state(state)->colorkey_enable;
-	if (((!old_state->visible && state->visible) ||
+	val = drm_to_overlay_state(new_state)->colorkey_enable;
+	if (((!old_state->visible && new_state->visible) ||
 	     drm_to_overlay_state(old_state)->colorkey_enable != val) &&
 	    dcrtc->variant->has_spu_adv_reg)
 		armada_reg_queue_mod(regs, idx, val, ADV_GRACOLORKEY |
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index 51f33c689df3..3be7b3cfd251 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -163,7 +163,7 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 static void armada_drm_primary_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	struct armada_crtc *dcrtc;
 	struct armada_regs *regs;
 	u32 cfg, cfg_mask, val;
@@ -171,71 +171,72 @@ static void armada_drm_primary_plane_atomic_update(struct drm_plane *plane,
 
 	DRM_DEBUG_KMS("[PLANE:%d:%s]\n", plane->base.id, plane->name);
 
-	if (!state->fb || WARN_ON(!state->crtc))
+	if (!new_state->fb || WARN_ON(!new_state->crtc))
 		return;
 
 	DRM_DEBUG_KMS("[PLANE:%d:%s] is on [CRTC:%d:%s] with [FB:%d] visible %u->%u\n",
 		plane->base.id, plane->name,
-		state->crtc->base.id, state->crtc->name,
-		state->fb->base.id,
-		old_state->visible, state->visible);
+		new_state->crtc->base.id, new_state->crtc->name,
+		new_state->fb->base.id,
+		old_state->visible, new_state->visible);
 
-	dcrtc = drm_to_armada_crtc(state->crtc);
+	dcrtc = drm_to_armada_crtc(new_state->crtc);
 	regs = dcrtc->regs + dcrtc->regs_idx;
 
 	idx = 0;
-	if (!old_state->visible && state->visible) {
+	if (!old_state->visible && new_state->visible) {
 		val = CFG_PDWN64x66;
-		if (drm_fb_to_armada_fb(state->fb)->fmt > CFG_420)
+		if (drm_fb_to_armada_fb(new_state->fb)->fmt > CFG_420)
 			val |= CFG_PDWN256x24;
 		armada_reg_queue_mod(regs, idx, 0, val, LCD_SPU_SRAM_PARA1);
 	}
-	val = armada_src_hw(state);
+	val = armada_src_hw(new_state);
 	if (armada_src_hw(old_state) != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_GRA_HPXL_VLN);
-	val = armada_dst_yx(state);
+	val = armada_dst_yx(new_state);
 	if (armada_dst_yx(old_state) != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_GRA_OVSA_HPXL_VLN);
-	val = armada_dst_hw(state);
+	val = armada_dst_hw(new_state);
 	if (armada_dst_hw(old_state) != val)
 		armada_reg_queue_set(regs, idx, val, LCD_SPU_GZM_HPXL_VLN);
-	if (old_state->src.x1 != state->src.x1 ||
-	    old_state->src.y1 != state->src.y1 ||
-	    old_state->fb != state->fb ||
-	    state->crtc->state->mode_changed) {
-		armada_reg_queue_set(regs, idx, armada_addr(state, 0, 0),
+	if (old_state->src.x1 != new_state->src.x1 ||
+	    old_state->src.y1 != new_state->src.y1 ||
+	    old_state->fb != new_state->fb ||
+	    new_state->crtc->state->mode_changed) {
+		armada_reg_queue_set(regs, idx, armada_addr(new_state, 0, 0),
 				     LCD_CFG_GRA_START_ADDR0);
-		armada_reg_queue_set(regs, idx, armada_addr(state, 1, 0),
+		armada_reg_queue_set(regs, idx, armada_addr(new_state, 1, 0),
 				     LCD_CFG_GRA_START_ADDR1);
-		armada_reg_queue_mod(regs, idx, armada_pitch(state, 0), 0xffff,
+		armada_reg_queue_mod(regs, idx, armada_pitch(new_state, 0),
+				     0xffff,
 				     LCD_CFG_GRA_PITCH);
 	}
-	if (old_state->fb != state->fb ||
-	    state->crtc->state->mode_changed) {
-		cfg = CFG_GRA_FMT(drm_fb_to_armada_fb(state->fb)->fmt) |
-		      CFG_GRA_MOD(drm_fb_to_armada_fb(state->fb)->mod);
-		if (drm_fb_to_armada_fb(state->fb)->fmt > CFG_420)
+	if (old_state->fb != new_state->fb ||
+	    new_state->crtc->state->mode_changed) {
+		cfg = CFG_GRA_FMT(drm_fb_to_armada_fb(new_state->fb)->fmt) |
+		      CFG_GRA_MOD(drm_fb_to_armada_fb(new_state->fb)->mod);
+		if (drm_fb_to_armada_fb(new_state->fb)->fmt > CFG_420)
 			cfg |= CFG_PALETTE_ENA;
-		if (state->visible)
+		if (new_state->visible)
 			cfg |= CFG_GRA_ENA;
-		if (to_armada_plane_state(state)->interlace)
+		if (to_armada_plane_state(new_state)->interlace)
 			cfg |= CFG_GRA_FTOGGLE;
 		cfg_mask = CFG_GRAFORMAT |
 			   CFG_GRA_MOD(CFG_SWAPRB | CFG_SWAPUV |
 				       CFG_SWAPYU | CFG_YUV2RGB) |
 			   CFG_PALETTE_ENA | CFG_GRA_FTOGGLE |
 			   CFG_GRA_ENA;
-	} else if (old_state->visible != state->visible) {
-		cfg = state->visible ? CFG_GRA_ENA : 0;
+	} else if (old_state->visible != new_state->visible) {
+		cfg = new_state->visible ? CFG_GRA_ENA : 0;
 		cfg_mask = CFG_GRA_ENA;
 	} else {
 		cfg = cfg_mask = 0;
 	}
-	if (drm_rect_width(&old_state->src) != drm_rect_width(&state->src) ||
-	    drm_rect_width(&old_state->dst) != drm_rect_width(&state->dst)) {
+	if (drm_rect_width(&old_state->src) != drm_rect_width(&new_state->src) ||
+	    drm_rect_width(&old_state->dst) != drm_rect_width(&new_state->dst)) {
 		cfg_mask |= CFG_GRA_HSMOOTH;
-		if (drm_rect_width(&state->src) >> 16 !=
-		    drm_rect_width(&state->dst))
+		if (drm_rect_width(&new_state->src) >> 16 !=
+		    drm_rect_width(&new_state->dst))
 			cfg |= CFG_GRA_HSMOOTH;
 	}
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index fc39675b4c3d..b6fe4d3f04c5 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -572,14 +572,14 @@ ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 {
 	struct drm_device *dev = plane->dev;
 	struct ast_private *ast = to_ast_private(dev);
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	struct drm_gem_vram_object *gbo;
 	s64 gpu_addr;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_framebuffer *old_fb = old_state->fb;
 
 	if (!old_fb || (fb->format != old_fb->format)) {
-		struct drm_crtc_state *crtc_state = state->crtc->state;
+		struct drm_crtc_state *crtc_state = new_state->crtc->state;
 		struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 		struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
 
@@ -688,20 +688,20 @@ static void
 ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
 	unsigned int offset_x, offset_y;
 
 	offset_x = AST_MAX_HWC_WIDTH - fb->width;
 	offset_y = AST_MAX_HWC_WIDTH - fb->height;
 
-	if (state->fb != old_state->fb) {
+	if (new_state->fb != old_state->fb) {
 		/* A new cursor image was installed. */
 		ast_cursor_page_flip(ast);
 	}
 
-	ast_cursor_show(ast, state->crtc_x, state->crtc_y,
+	ast_cursor_show(ast, new_state->crtc_x, new_state->crtc_y,
 			offset_x, offset_y);
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 2c4ceb768a08..673f8a1d9010 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -254,11 +254,11 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 static void exynos_plane_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
-	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(state->crtc);
+	struct drm_plane_state *new_state = plane->state;
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(new_state->crtc);
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 
-	if (!state->crtc)
+	if (!new_state->crtc)
 		return;
 
 	if (exynos_crtc->ops->update_plane)
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 7d2aa2cbcff6..4272e121a185 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -80,7 +80,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 
 {
 	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	struct drm_framebuffer *fb = plane->state->fb;
 	struct drm_gem_cma_object *gem;
 	unsigned int alpha = DCU_LAYER_AB_NONE, bpp;
@@ -128,11 +128,11 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	regmap_write(fsl_dev->regmap, DCU_CTRLDESCLN(index, 1),
-		     DCU_LAYER_HEIGHT(state->crtc_h) |
-		     DCU_LAYER_WIDTH(state->crtc_w));
+		     DCU_LAYER_HEIGHT(new_state->crtc_h) |
+		     DCU_LAYER_WIDTH(new_state->crtc_w));
 	regmap_write(fsl_dev->regmap, DCU_CTRLDESCLN(index, 2),
-		     DCU_LAYER_POSY(state->crtc_y) |
-		     DCU_LAYER_POSX(state->crtc_x));
+		     DCU_LAYER_POSY(new_state->crtc_y) |
+		     DCU_LAYER_POSX(new_state->crtc_x));
 	regmap_write(fsl_dev->regmap,
 		     DCU_CTRLDESCLN(index, 3), gem->paddr);
 	regmap_write(fsl_dev->regmap, DCU_CTRLDESCLN(index, 4),
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 3f7027e40c79..a4b54e841c76 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -101,17 +101,17 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 static void hibmc_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
-	struct drm_plane_state	*state	= plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	u32 reg;
 	s64 gpu_addr = 0;
 	u32 line_l;
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(plane->dev);
 	struct drm_gem_vram_object *gbo;
 
-	if (!state->fb)
+	if (!new_state->fb)
 		return;
 
-	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
+	gbo = drm_gem_vram_of_gem(new_state->fb->obj[0]);
 
 	gpu_addr = drm_gem_vram_offset(gbo);
 	if (WARN_ON_ONCE(gpu_addr < 0))
@@ -119,9 +119,9 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 
 	writel(gpu_addr, priv->mmio + HIBMC_CRT_FB_ADDRESS);
 
-	reg = state->fb->width * (state->fb->format->cpp[0]);
+	reg = new_state->fb->width * (new_state->fb->format->cpp[0]);
 
-	line_l = state->fb->pitches[0];
+	line_l = new_state->fb->pitches[0];
 	writel(HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_WIDTH, reg) |
 	       HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_OFFS, line_l),
 	       priv->mmio + HIBMC_CRT_FB_WIDTH);
@@ -130,7 +130,7 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
 	reg &= ~HIBMC_CRT_DISP_CTL_FORMAT_MASK;
 	reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_FORMAT,
-			   state->fb->format->cpp[0] * 8 / 16);
+			   new_state->fb->format->cpp[0] * 8 / 16);
 	writel(reg, priv->mmio + HIBMC_CRT_DISP_CTL);
 }
 
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 1458893ecc52..ab85c238cec5 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -807,13 +807,14 @@ static int ade_plane_atomic_check(struct drm_plane *plane,
 static void ade_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	struct kirin_plane *kplane = to_kirin_plane(plane);
 
-	ade_update_channel(kplane, state->fb, state->crtc_x, state->crtc_y,
-			   state->crtc_w, state->crtc_h,
-			   state->src_x >> 16, state->src_y >> 16,
-			   state->src_w >> 16, state->src_h >> 16);
+	ade_update_channel(kplane, new_state->fb, new_state->crtc_x,
+			   new_state->crtc_y,
+			   new_state->crtc_w, new_state->crtc_h,
+			   new_state->src_x >> 16, new_state->src_y >> 16,
+			   new_state->src_w >> 16, new_state->src_h >> 16);
 }
 
 static void ade_plane_atomic_disable(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 35a7b23060b3..06ecfff8d3c3 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -266,10 +266,10 @@ static bool dcss_plane_needs_setup(struct drm_plane_state *state,
 static void dcss_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
 	struct dcss_dev *dcss = plane->dev->dev_private;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_crtc_state *crtc_state;
 	bool modifiers_present;
 	u32 src_w, src_h, dst_w, dst_h;
@@ -277,14 +277,14 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 	bool enable = true;
 	bool is_rotation_90_or_270;
 
-	if (!fb || !state->crtc || !state->visible)
+	if (!fb || !new_state->crtc || !new_state->visible)
 		return;
 
-	crtc_state = state->crtc->state;
+	crtc_state = new_state->crtc->state;
 	modifiers_present = !!(fb->flags & DRM_MODE_FB_MODIFIERS);
 
 	if (old_state->fb && !drm_atomic_crtc_needs_modeset(crtc_state) &&
-	    !dcss_plane_needs_setup(state, old_state)) {
+	    !dcss_plane_needs_setup(new_state, old_state)) {
 		dcss_plane_atomic_set_base(dcss_plane);
 		return;
 	}
@@ -304,23 +304,24 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 	    modifiers_present && fb->modifier == DRM_FORMAT_MOD_LINEAR)
 		modifiers_present = false;
 
-	dcss_dpr_format_set(dcss->dpr, dcss_plane->ch_num, state->fb->format,
+	dcss_dpr_format_set(dcss->dpr, dcss_plane->ch_num,
+			    new_state->fb->format,
 			    modifiers_present ? fb->modifier :
 						DRM_FORMAT_MOD_LINEAR);
 	dcss_dpr_set_res(dcss->dpr, dcss_plane->ch_num, src_w, src_h);
 	dcss_dpr_set_rotation(dcss->dpr, dcss_plane->ch_num,
-			      state->rotation);
+			      new_state->rotation);
 
 	dcss_plane_atomic_set_base(dcss_plane);
 
-	is_rotation_90_or_270 = state->rotation & (DRM_MODE_ROTATE_90 |
+	is_rotation_90_or_270 = new_state->rotation & (DRM_MODE_ROTATE_90 |
 						   DRM_MODE_ROTATE_270);
 
 	dcss_scaler_set_filter(dcss->scaler, dcss_plane->ch_num,
-			       state->scaling_filter);
+			       new_state->scaling_filter);
 
 	dcss_scaler_setup(dcss->scaler, dcss_plane->ch_num,
-			  state->fb->format,
+			  new_state->fb->format,
 			  is_rotation_90_or_270 ? src_h : src_w,
 			  is_rotation_90_or_270 ? src_w : src_h,
 			  dst_w, dst_h,
@@ -329,9 +330,9 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
 	dcss_dtg_plane_pos_set(dcss->dtg, dcss_plane->ch_num,
 			       dst.x1, dst.y1, dst_w, dst_h);
 	dcss_dtg_plane_alpha_set(dcss->dtg, dcss_plane->ch_num,
-				 fb->format, state->alpha >> 8);
+				 fb->format, new_state->alpha >> 8);
 
-	if (!dcss_plane->ch_num && (state->alpha >> 8) == 0)
+	if (!dcss_plane->ch_num && (new_state->alpha >> 8) == 0)
 		enable = false;
 
 	dcss_dpr_enable(dcss->dpr, dcss_plane->ch_num, enable);
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 6484592e3f86..0dd10aec8194 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -542,11 +542,11 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
 	struct ipu_plane *ipu_plane = to_ipu_plane(plane);
-	struct drm_plane_state *state = plane->state;
-	struct ipu_plane_state *ipu_state = to_ipu_plane_state(state);
-	struct drm_crtc_state *crtc_state = state->crtc->state;
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_rect *dst = &state->dst;
+	struct drm_plane_state *new_state = plane->state;
+	struct ipu_plane_state *ipu_state = to_ipu_plane_state(new_state);
+	struct drm_crtc_state *crtc_state = new_state->crtc->state;
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_rect *dst = &new_state->dst;
 	unsigned long eba, ubo, vbo;
 	unsigned long alpha_eba = 0;
 	enum ipu_color_space ics;
@@ -561,7 +561,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 
 	switch (ipu_plane->dp_flow) {
 	case IPU_DP_FLOW_SYNC_BG:
-		if (state->normalized_zpos == 1) {
+		if (new_state->normalized_zpos == 1) {
 			ipu_dp_set_global_alpha(ipu_plane->dp,
 						!fb->format->has_alpha, 0xff,
 						true);
@@ -570,7 +570,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		}
 		break;
 	case IPU_DP_FLOW_SYNC_FG:
-		if (state->normalized_zpos == 1) {
+		if (new_state->normalized_zpos == 1) {
 			ipu_dp_set_global_alpha(ipu_plane->dp,
 						!fb->format->has_alpha, 0xff,
 						false);
@@ -578,7 +578,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		break;
 	}
 
-	eba = drm_plane_state_to_eba(state, 0);
+	eba = drm_plane_state_to_eba(new_state, 0);
 
 	/*
 	 * Configure PRG channel and attached PRE, this changes the EBA to an
@@ -587,8 +587,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	if (ipu_state->use_pre) {
 		axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
 		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id,
-					  drm_rect_width(&state->src) >> 16,
-					  drm_rect_height(&state->src) >> 16,
+					  drm_rect_width(&new_state->src) >> 16,
+					  drm_rect_height(&new_state->src) >> 16,
 					  fb->pitches[0], fb->format->format,
 					  fb->modifier, &eba);
 	}
@@ -622,8 +622,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 
 	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, drm_rect_width(dst));
 
-	width = drm_rect_width(&state->src) >> 16;
-	height = drm_rect_height(&state->src) >> 16;
+	width = drm_rect_width(&new_state->src) >> 16;
+	height = drm_rect_height(&new_state->src) >> 16;
 	info = drm_format_info(fb->format->format);
 	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
 			     &burstsize, &num_bursts);
@@ -645,8 +645,8 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YUV444:
 	case DRM_FORMAT_YVU444:
-		ubo = drm_plane_state_to_ubo(state);
-		vbo = drm_plane_state_to_vbo(state);
+		ubo = drm_plane_state_to_ubo(new_state);
+		vbo = drm_plane_state_to_vbo(new_state);
 		if (fb->format->format == DRM_FORMAT_YVU420 ||
 		    fb->format->format == DRM_FORMAT_YVU422 ||
 		    fb->format->format == DRM_FORMAT_YVU444)
@@ -657,18 +657,18 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 
 		dev_dbg(ipu_plane->base.dev->dev,
 			"phy = %lu %lu %lu, x = %d, y = %d", eba, ubo, vbo,
-			state->src.x1 >> 16, state->src.y1 >> 16);
+			new_state->src.x1 >> 16, new_state->src.y1 >> 16);
 		break;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
-		ubo = drm_plane_state_to_ubo(state);
+		ubo = drm_plane_state_to_ubo(new_state);
 
 		ipu_cpmem_set_yuv_planar_full(ipu_plane->ipu_ch,
 					      fb->pitches[1], ubo, ubo);
 
 		dev_dbg(ipu_plane->base.dev->dev,
 			"phy = %lu %lu, x = %d, y = %d", eba, ubo,
-			state->src.x1 >> 16, state->src.y1 >> 16);
+			new_state->src.x1 >> 16, new_state->src.y1 >> 16);
 		break;
 	case DRM_FORMAT_RGB565_A8:
 	case DRM_FORMAT_BGR565_A8:
@@ -676,18 +676,19 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	case DRM_FORMAT_BGR888_A8:
 	case DRM_FORMAT_RGBX8888_A8:
 	case DRM_FORMAT_BGRX8888_A8:
-		alpha_eba = drm_plane_state_to_eba(state, 1);
+		alpha_eba = drm_plane_state_to_eba(new_state, 1);
 		num_bursts = 0;
 
 		dev_dbg(ipu_plane->base.dev->dev, "phys = %lu %lu, x = %d, y = %d",
-			eba, alpha_eba, state->src.x1 >> 16, state->src.y1 >> 16);
+			eba, alpha_eba, new_state->src.x1 >> 16,
+			new_state->src.y1 >> 16);
 
 		ipu_cpmem_set_burstsize(ipu_plane->ipu_ch, 16);
 
 		ipu_cpmem_zero(ipu_plane->alpha_ch);
 		ipu_cpmem_set_resolution(ipu_plane->alpha_ch,
-					 drm_rect_width(&state->src) >> 16,
-					 drm_rect_height(&state->src) >> 16);
+					 drm_rect_width(&new_state->src) >> 16,
+					 drm_rect_height(&new_state->src) >> 16);
 		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
 		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
 		ipu_idmac_set_double_buffer(ipu_plane->alpha_ch, 1);
@@ -698,7 +699,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		break;
 	default:
 		dev_dbg(ipu_plane->base.dev->dev, "phys = %lu, x = %d, y = %d",
-			eba, state->src.x1 >> 16, state->src.y1 >> 16);
+			eba, new_state->src.x1 >> 16, new_state->src.y1 >> 16);
 		break;
 	}
 	ipu_cpmem_set_buffer(ipu_plane->ipu_ch, 0, eba);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e6d7d0a04ddb..add4b3ce3c6a 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -542,20 +542,20 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_plane_state *oldstate)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *newstate = plane->state;
 	struct drm_crtc_state *crtc_state;
 	struct ingenic_dma_hwdesc *hwdesc;
 	unsigned int width, height, cpp, offset;
 	dma_addr_t addr;
 	u32 fourcc;
 
-	if (state && state->fb) {
-		crtc_state = state->crtc->state;
+	if (newstate && newstate->fb) {
+		crtc_state = newstate->crtc->state;
 
-		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
-		width = state->src_w >> 16;
-		height = state->src_h >> 16;
-		cpp = state->fb->format->cpp[0];
+		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
+		width = newstate->src_w >> 16;
+		height = newstate->src_h >> 16;
+		cpp = newstate->fb->format->cpp[0];
 
 		if (priv->soc_info->has_osd && plane->type == DRM_PLANE_TYPE_OVERLAY)
 			hwdesc = &priv->dma_hwdescs->hwdesc_f0;
@@ -566,7 +566,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
 
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-			fourcc = state->fb->format->format;
+			fourcc = newstate->fb->format->format;
 
 			ingenic_drm_plane_config(priv->dev, plane, fourcc);
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 1e1b0fe095bd..58325c4cffa7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -285,16 +285,16 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_plane_state *oldstate)
 {
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *newstate = plane->state;
 	const struct drm_format_info *finfo;
 	u32 ctrl, stride = 0, coef_index = 0, format = 0;
 	bool needs_modeset, upscaling_w, upscaling_h;
 	int err;
 
-	if (!state || !state->fb)
+	if (!newstate || !newstate->fb)
 		return;
 
-	finfo = drm_format_info(state->fb->format->format);
+	finfo = drm_format_info(newstate->fb->format->format);
 
 	if (!ipu->clk_enabled) {
 		err = clk_enable(ipu->clk);
@@ -307,7 +307,7 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	/* Reset all the registers if needed */
-	needs_modeset = drm_atomic_crtc_needs_modeset(state->crtc->state);
+	needs_modeset = drm_atomic_crtc_needs_modeset(newstate->crtc->state);
 	if (needs_modeset) {
 		regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_RST);
 
@@ -317,11 +317,13 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	/* New addresses will be committed in vblank handler... */
-	ipu->addr_y = drm_fb_cma_get_gem_addr(state->fb, state, 0);
+	ipu->addr_y = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
 	if (finfo->num_planes > 1)
-		ipu->addr_u = drm_fb_cma_get_gem_addr(state->fb, state, 1);
+		ipu->addr_u = drm_fb_cma_get_gem_addr(newstate->fb, newstate,
+						      1);
 	if (finfo->num_planes > 2)
-		ipu->addr_v = drm_fb_cma_get_gem_addr(state->fb, state, 2);
+		ipu->addr_v = drm_fb_cma_get_gem_addr(newstate->fb, newstate,
+						      2);
 
 	if (!needs_modeset)
 		return;
@@ -338,21 +340,21 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 
 	/* Set the input height/width/strides */
 	if (finfo->num_planes > 2)
-		stride = ((state->src_w >> 16) * finfo->cpp[2] / finfo->hsub)
+		stride = ((newstate->src_w >> 16) * finfo->cpp[2] / finfo->hsub)
 			<< JZ_IPU_UV_STRIDE_V_LSB;
 
 	if (finfo->num_planes > 1)
-		stride |= ((state->src_w >> 16) * finfo->cpp[1] / finfo->hsub)
+		stride |= ((newstate->src_w >> 16) * finfo->cpp[1] / finfo->hsub)
 			<< JZ_IPU_UV_STRIDE_U_LSB;
 
 	regmap_write(ipu->map, JZ_REG_IPU_UV_STRIDE, stride);
 
-	stride = ((state->src_w >> 16) * finfo->cpp[0]) << JZ_IPU_Y_STRIDE_Y_LSB;
+	stride = ((newstate->src_w >> 16) * finfo->cpp[0]) << JZ_IPU_Y_STRIDE_Y_LSB;
 	regmap_write(ipu->map, JZ_REG_IPU_Y_STRIDE, stride);
 
 	regmap_write(ipu->map, JZ_REG_IPU_IN_GS,
 		     (stride << JZ_IPU_IN_GS_W_LSB) |
-		     ((state->src_h >> 16) << JZ_IPU_IN_GS_H_LSB));
+		     ((newstate->src_h >> 16) << JZ_IPU_IN_GS_H_LSB));
 
 	switch (finfo->format) {
 	case DRM_FORMAT_XRGB1555:
@@ -421,9 +423,9 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 
 	/* Set the output height/width/stride */
 	regmap_write(ipu->map, JZ_REG_IPU_OUT_GS,
-		     ((state->crtc_w * 4) << JZ_IPU_OUT_GS_W_LSB)
-		     | state->crtc_h << JZ_IPU_OUT_GS_H_LSB);
-	regmap_write(ipu->map, JZ_REG_IPU_OUT_STRIDE, state->crtc_w * 4);
+		     ((newstate->crtc_w * 4) << JZ_IPU_OUT_GS_W_LSB)
+		     | newstate->crtc_h << JZ_IPU_OUT_GS_H_LSB);
+	regmap_write(ipu->map, JZ_REG_IPU_OUT_STRIDE, newstate->crtc_w * 4);
 
 	if (finfo->is_yuv) {
 		regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_CSC_EN);
@@ -508,8 +510,8 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 			JZ_IPU_CTRL_RUN | JZ_IPU_CTRL_FM_IRQ_EN);
 
 	dev_dbg(ipu->dev, "Scaling %ux%u to %ux%u (%u:%u horiz, %u:%u vert)\n",
-		state->src_w >> 16, state->src_h >> 16,
-		state->crtc_w, state->crtc_h,
+		newstate->src_w >> 16, newstate->src_h >> 16,
+		newstate->crtc_w, newstate->crtc_h,
 		ipu->num_w, ipu->denom_w, ipu->num_h, ipu->denom_h);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index cd143a34bd60..6ae24058ec35 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -176,18 +176,17 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *new_state = plane->state;
-	struct mtk_plane_state *state = to_mtk_plane_state(new_state);
-
-	state->pending.enable = false;
+	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
+	mtk_plane_state->pending.enable = false;
 	wmb(); /* Make sure the above parameter is set before update */
-	state->pending.dirty = true;
+	mtk_plane_state->pending.dirty = true;
 }
 
 static void mtk_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *new_state = plane->state;
-	struct mtk_plane_state *state = to_mtk_plane_state(new_state);
+	struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
 	struct drm_crtc *crtc = new_state->crtc;
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_object *gem;
@@ -212,17 +211,17 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
 	addr += (new_state->src.y1 >> 16) * pitch;
 
-	state->pending.enable = true;
-	state->pending.pitch = pitch;
-	state->pending.format = format;
-	state->pending.addr = addr;
-	state->pending.x = new_state->dst.x1;
-	state->pending.y = new_state->dst.y1;
-	state->pending.width = drm_rect_width(&new_state->dst);
-	state->pending.height = drm_rect_height(&new_state->dst);
-	state->pending.rotation = new_state->rotation;
+	mtk_plane_state->pending.enable = true;
+	mtk_plane_state->pending.pitch = pitch;
+	mtk_plane_state->pending.format = format;
+	mtk_plane_state->pending.addr = addr;
+	mtk_plane_state->pending.x = new_state->dst.x1;
+	mtk_plane_state->pending.y = new_state->dst.y1;
+	mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
+	mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
+	mtk_plane_state->pending.rotation = new_state->rotation;
 	wmb(); /* Make sure the above parameters are set before update */
-	state->pending.dirty = true;
+	mtk_plane_state->pending.dirty = true;
 }
 
 static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 93ba785de396..902b5711a2b8 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -471,8 +471,8 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					struct drm_plane_state *old_state)
 {
 	struct meson_overlay *meson_overlay = to_meson_overlay(plane);
-	struct drm_plane_state *state = plane->state;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct meson_drm *priv = meson_overlay->priv;
 	struct drm_gem_cma_object *gem;
 	unsigned long flags;
@@ -480,7 +480,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	interlace_mode = state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE;
+	interlace_mode = new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE;
 
 	spin_lock_irqsave(&priv->drm->event_lock, flags);
 
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index e5d05b725ed6..c2df7eca6808 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -133,10 +133,10 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
 	struct meson_plane *meson_plane = to_meson_plane(plane);
-	struct drm_plane_state *state = plane->state;
-	struct drm_rect dest = drm_plane_state_dest(state);
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_rect dest = drm_plane_state_dest(new_state);
 	struct meson_drm *priv = meson_plane->priv;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_cma_object *gem;
 	unsigned long flags;
 	int vsc_ini_rcv_num, vsc_ini_rpt_p0_num;
@@ -249,7 +249,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	hf_bank_len = 4;
 	vf_bank_len = 4;
 
-	if (state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE) {
+	if (new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE) {
 		vsc_bot_rcv_num = 6;
 		vsc_bot_rpt_p0_num = 2;
 	}
@@ -259,10 +259,10 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	hsc_ini_rpt_p0_num = (hf_bank_len / 2) - 1;
 	vsc_ini_rpt_p0_num = (vf_bank_len / 2) - 1;
 
-	src_w = fixed16_to_int(state->src_w);
-	src_h = fixed16_to_int(state->src_h);
-	dst_w = state->crtc_w;
-	dst_h = state->crtc_h;
+	src_w = fixed16_to_int(new_state->src_w);
+	src_h = fixed16_to_int(new_state->src_h);
+	dst_w = new_state->crtc_w;
+	dst_h = new_state->crtc_h;
 
 	/*
 	 * When the output is interlaced, the OSD must switch between
@@ -271,7 +271,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	 * But the vertical scaler can provide such funtionnality if
 	 * is configured for 2:1 scaling with interlace options enabled.
 	 */
-	if (state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE) {
+	if (new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE) {
 		dest.y1 /= 2;
 		dest.y2 /= 2;
 		dst_h /= 2;
@@ -280,7 +280,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	hf_phase_step = ((src_w << 18) / dst_w) << 6;
 	vf_phase_step = (src_h << 20) / dst_h;
 
-	if (state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE)
+	if (new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE)
 		bot_ini_phase = ((vf_phase_step / 2) >> 4);
 	else
 		bot_ini_phase = 0;
@@ -312,7 +312,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 					VSC_TOP_RPT_L0_NUM(vsc_ini_rpt_p0_num) |
 					VSC_VERTICAL_SCALER_EN;
 
-		if (state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE)
+		if (new_state->crtc->mode.flags & DRM_MODE_FLAG_INTERLACE)
 			priv->viu.osd_sc_v_ctrl0 |=
 					VSC_BOT_INI_RCV_NUM(vsc_bot_rcv_num) |
 					VSC_BOT_RPT_L0_NUM(vsc_bot_rpt_p0_num) |
@@ -347,11 +347,11 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	 * e.g. +30x1920 would be (1919 << 16) | 30
 	 */
 	priv->viu.osd1_blk0_cfg[1] =
-				((fixed16_to_int(state->src.x2) - 1) << 16) |
-				fixed16_to_int(state->src.x1);
+				((fixed16_to_int(new_state->src.x2) - 1) << 16) |
+				fixed16_to_int(new_state->src.x1);
 	priv->viu.osd1_blk0_cfg[2] =
-				((fixed16_to_int(state->src.y2) - 1) << 16) |
-				fixed16_to_int(state->src.y1);
+				((fixed16_to_int(new_state->src.y2) - 1) << 16) |
+				fixed16_to_int(new_state->src.y1);
 	priv->viu.osd1_blk0_cfg[3] = ((dest.x2 - 1) << 16) | dest.x1;
 	priv->viu.osd1_blk0_cfg[4] = ((dest.y2 - 1) << 16) | dest.y1;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d644044a2bbb..82a69d2cf20d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1244,13 +1244,13 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 				struct drm_plane_state *old_state)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 
 	pdpu->is_error = false;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
-	if (!state->visible) {
+	if (!new_state->visible) {
 		_dpu_plane_atomic_disable(plane);
 	} else {
 		dpu_plane_sspp_atomic_update(plane);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index f95b14ebfa8a..b4c74c1047ba 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -114,15 +114,15 @@ static int mdp4_plane_atomic_check(struct drm_plane *plane,
 static void mdp4_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	int ret;
 
 	ret = mdp4_plane_mode_set(plane,
-			state->crtc, state->fb,
-			state->crtc_x, state->crtc_y,
-			state->crtc_w, state->crtc_h,
-			state->src_x,  state->src_y,
-			state->src_w, state->src_h);
+			new_state->crtc, new_state->fb,
+			new_state->crtc_x, new_state->crtc_y,
+			new_state->crtc_w, new_state->crtc_h,
+			new_state->src_x,  new_state->src_y,
+			new_state->src_w, new_state->src_h);
 	/* atomic_check should have ensured that this doesn't fail */
 	WARN_ON(ret < 0);
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 6ce6ce09fecc..da1cc66f9f49 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -428,16 +428,16 @@ static int mdp5_plane_atomic_check(struct drm_plane *plane,
 static void mdp5_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 
 	DBG("%s: update", plane->name);
 
-	if (plane_enabled(state)) {
+	if (plane_enabled(new_state)) {
 		int ret;
 
 		ret = mdp5_plane_mode_set(plane,
-				state->crtc, state->fb,
-				&state->src, &state->dst);
+				new_state->crtc, new_state->fb,
+				&new_state->src, &new_state->dst);
 		/* atomic_check should have ensured that this doesn't fail */
 		WARN_ON(ret < 0);
 	}
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 18c0c0d7b4b6..6b19a84340e3 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -433,7 +433,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 					      struct drm_plane_state *old_pstate)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_pstate = plane->state;
 	dma_addr_t paddr;
 	u32 ctrl;
 
@@ -462,7 +462,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 
 	ctrl = AS_CTRL_AS_ENABLE | AS_CTRL_ALPHA(255);
 
-	switch (state->fb->format->format) {
+	switch (new_pstate->fb->format->format) {
 	case DRM_FORMAT_XRGB4444:
 		ctrl |= AS_CTRL_FORMAT_RGB444 | AS_CTRL_ALPHA_CTRL_OVERRIDE;
 		break;
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index b08880915d5e..d52124adedf7 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -44,26 +44,27 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 {
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	struct omap_overlay_info info;
 	int ret;
 
-	DBG("%s, crtc=%p fb=%p", omap_plane->name, state->crtc, state->fb);
+	DBG("%s, crtc=%p fb=%p", omap_plane->name, new_state->crtc,
+	    new_state->fb);
 
 	memset(&info, 0, sizeof(info));
 	info.rotation_type = OMAP_DSS_ROT_NONE;
 	info.rotation = DRM_MODE_ROTATE_0;
-	info.global_alpha = state->alpha >> 8;
-	info.zorder = state->normalized_zpos;
-	if (state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
+	info.global_alpha = new_state->alpha >> 8;
+	info.zorder = new_state->normalized_zpos;
+	if (new_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
 		info.pre_mult_alpha = 1;
 	else
 		info.pre_mult_alpha = 0;
-	info.color_encoding = state->color_encoding;
-	info.color_range = state->color_range;
+	info.color_encoding = new_state->color_encoding;
+	info.color_range = new_state->color_range;
 
 	/* update scanout: */
-	omap_framebuffer_update_scanout(state->fb, state, &info);
+	omap_framebuffer_update_scanout(new_state->fb, new_state, &info);
 
 	DBG("%dx%d -> %dx%d (%d)", info.width, info.height,
 			info.out_width, info.out_height,
@@ -73,8 +74,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 
 	/* and finally, update omapdss: */
 	ret = dispc_ovl_setup(priv->dispc, omap_plane->id, &info,
-			      omap_crtc_timings(state->crtc), false,
-			      omap_crtc_channel(state->crtc));
+			      omap_crtc_timings(new_state->crtc), false,
+			      omap_crtc_channel(new_state->crtc));
 	if (ret) {
 		dev_err(plane->dev->dev, "Failed to setup plane %s\n",
 			omap_plane->name);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 01f6cb99e8ea..3a389cd756ff 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -876,18 +876,18 @@ static void vop_plane_atomic_disable(struct drm_plane *plane,
 static void vop_plane_atomic_update(struct drm_plane *plane,
 		struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
-	struct drm_crtc *crtc = state->crtc;
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_crtc *crtc = new_state->crtc;
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
 	const struct vop_win_yuv2yuv_data *win_yuv2yuv = vop_win->yuv2yuv_data;
-	struct vop *vop = to_vop(state->crtc);
-	struct drm_framebuffer *fb = state->fb;
+	struct vop *vop = to_vop(new_state->crtc);
+	struct drm_framebuffer *fb = new_state->fb;
 	unsigned int actual_w, actual_h;
 	unsigned int dsp_stx, dsp_sty;
 	uint32_t act_info, dsp_info, dsp_st;
-	struct drm_rect *src = &state->src;
-	struct drm_rect *dest = &state->dst;
+	struct drm_rect *src = &new_state->src;
+	struct drm_rect *dest = &new_state->dst;
 	struct drm_gem_object *obj, *uv_obj;
 	struct rockchip_gem_object *rk_obj, *rk_uv_obj;
 	unsigned long offset;
@@ -908,7 +908,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 	if (WARN_ON(!vop->is_enabled))
 		return;
 
-	if (!state->visible) {
+	if (!new_state->visible) {
 		vop_plane_atomic_disable(plane, old_state);
 		return;
 	}
@@ -935,7 +935,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 	 * For y-mirroring we need to move address
 	 * to the beginning of the last line.
 	 */
-	if (state->rotation & DRM_MODE_REFLECT_Y)
+	if (new_state->rotation & DRM_MODE_REFLECT_Y)
 		dma_addr += (actual_h - 1) * fb->pitches[0];
 
 	format = vop_convert_format(fb->format->format);
@@ -957,9 +957,9 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 	VOP_WIN_SET(vop, win, yrgb_mst, dma_addr);
 	VOP_WIN_YUV2YUV_SET(vop, win_yuv2yuv, y2r_en, is_yuv);
 	VOP_WIN_SET(vop, win, y_mir_en,
-		    (state->rotation & DRM_MODE_REFLECT_Y) ? 1 : 0);
+		    (new_state->rotation & DRM_MODE_REFLECT_Y) ? 1 : 0);
 	VOP_WIN_SET(vop, win, x_mir_en,
-		    (state->rotation & DRM_MODE_REFLECT_X) ? 1 : 0);
+		    (new_state->rotation & DRM_MODE_REFLECT_X) ? 1 : 0);
 
 	if (is_yuv) {
 		int hsub = fb->format->hsub;
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index e34ab8317f6d..4cf3bf1b3007 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -258,11 +258,11 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
 static void sti_cursor_atomic_update(struct drm_plane *drm_plane,
 				     struct drm_plane_state *oldstate)
 {
-	struct drm_plane_state *state = drm_plane->state;
+	struct drm_plane_state *newstate = drm_plane->state;
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_cursor *cursor = to_sti_cursor(plane);
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = newstate->crtc;
+	struct drm_framebuffer *fb = newstate->fb;
 	struct drm_display_mode *mode;
 	int dst_x, dst_y;
 	struct drm_gem_cma_object *cma_obj;
@@ -273,8 +273,8 @@ static void sti_cursor_atomic_update(struct drm_plane *drm_plane,
 		return;
 
 	mode = &crtc->mode;
-	dst_x = state->crtc_x;
-	dst_y = state->crtc_y;
+	dst_x = newstate->crtc_x;
+	dst_y = newstate->crtc_y;
 
 	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
 
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index f64eef90dc58..0407b7dbd228 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -701,11 +701,11 @@ static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
 static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 				  struct drm_plane_state *oldstate)
 {
-	struct drm_plane_state *state = drm_plane->state;
+	struct drm_plane_state *newstate = drm_plane->state;
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_gdp *gdp = to_sti_gdp(plane);
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb =  state->fb;
+	struct drm_crtc *crtc = newstate->crtc;
+	struct drm_framebuffer *fb =  newstate->fb;
 	struct drm_display_mode *mode;
 	int dst_x, dst_y, dst_w, dst_h;
 	int src_x, src_y, src_w, src_h;
@@ -722,15 +722,15 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	if (!crtc || !fb)
 		return;
 
-	if ((oldstate->fb == state->fb) &&
-	    (oldstate->crtc_x == state->crtc_x) &&
-	    (oldstate->crtc_y == state->crtc_y) &&
-	    (oldstate->crtc_w == state->crtc_w) &&
-	    (oldstate->crtc_h == state->crtc_h) &&
-	    (oldstate->src_x == state->src_x) &&
-	    (oldstate->src_y == state->src_y) &&
-	    (oldstate->src_w == state->src_w) &&
-	    (oldstate->src_h == state->src_h)) {
+	if ((oldstate->fb == newstate->fb) &&
+	    (oldstate->crtc_x == newstate->crtc_x) &&
+	    (oldstate->crtc_y == newstate->crtc_y) &&
+	    (oldstate->crtc_w == newstate->crtc_w) &&
+	    (oldstate->crtc_h == newstate->crtc_h) &&
+	    (oldstate->src_x == newstate->src_x) &&
+	    (oldstate->src_y == newstate->src_y) &&
+	    (oldstate->src_w == newstate->src_w) &&
+	    (oldstate->src_h == newstate->src_h)) {
 		/* No change since last update, do not post cmd */
 		DRM_DEBUG_DRIVER("No change, not posting cmd\n");
 		plane->status = STI_PLANE_UPDATED;
@@ -748,15 +748,15 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	}
 
 	mode = &crtc->mode;
-	dst_x = state->crtc_x;
-	dst_y = state->crtc_y;
-	dst_w = clamp_val(state->crtc_w, 0, mode->hdisplay - dst_x);
-	dst_h = clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
+	dst_x = newstate->crtc_x;
+	dst_y = newstate->crtc_y;
+	dst_w = clamp_val(newstate->crtc_w, 0, mode->hdisplay - dst_x);
+	dst_h = clamp_val(newstate->crtc_h, 0, mode->vdisplay - dst_y);
 	/* src_x are in 16.16 format */
-	src_x = state->src_x >> 16;
-	src_y = state->src_y >> 16;
-	src_w = clamp_val(state->src_w >> 16, 0, GAM_GDP_SIZE_MAX_WIDTH);
-	src_h = clamp_val(state->src_h >> 16, 0, GAM_GDP_SIZE_MAX_HEIGHT);
+	src_x = newstate->src_x >> 16;
+	src_y = newstate->src_y >> 16;
+	src_w = clamp_val(newstate->src_w >> 16, 0, GAM_GDP_SIZE_MAX_WIDTH);
+	src_h = clamp_val(newstate->src_h >> 16, 0, GAM_GDP_SIZE_MAX_HEIGHT);
 
 	list = sti_gdp_get_free_nodes(gdp);
 	top_field = list->top_field;
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index c1a2450beed4..264a80d606f9 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1111,11 +1111,11 @@ static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
 static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 				    struct drm_plane_state *oldstate)
 {
-	struct drm_plane_state *state = drm_plane->state;
+	struct drm_plane_state *newstate = drm_plane->state;
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_hqvdp *hqvdp = to_sti_hqvdp(plane);
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = newstate->crtc;
+	struct drm_framebuffer *fb = newstate->fb;
 	struct drm_display_mode *mode;
 	int dst_x, dst_y, dst_w, dst_h;
 	int src_x, src_y, src_w, src_h;
@@ -1127,15 +1127,15 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 	if (!crtc || !fb)
 		return;
 
-	if ((oldstate->fb == state->fb) &&
-	    (oldstate->crtc_x == state->crtc_x) &&
-	    (oldstate->crtc_y == state->crtc_y) &&
-	    (oldstate->crtc_w == state->crtc_w) &&
-	    (oldstate->crtc_h == state->crtc_h) &&
-	    (oldstate->src_x == state->src_x) &&
-	    (oldstate->src_y == state->src_y) &&
-	    (oldstate->src_w == state->src_w) &&
-	    (oldstate->src_h == state->src_h)) {
+	if ((oldstate->fb == newstate->fb) &&
+	    (oldstate->crtc_x == newstate->crtc_x) &&
+	    (oldstate->crtc_y == newstate->crtc_y) &&
+	    (oldstate->crtc_w == newstate->crtc_w) &&
+	    (oldstate->crtc_h == newstate->crtc_h) &&
+	    (oldstate->src_x == newstate->src_x) &&
+	    (oldstate->src_y == newstate->src_y) &&
+	    (oldstate->src_w == newstate->src_w) &&
+	    (oldstate->src_h == newstate->src_h)) {
 		/* No change since last update, do not post cmd */
 		DRM_DEBUG_DRIVER("No change, not posting cmd\n");
 		plane->status = STI_PLANE_UPDATED;
@@ -1143,15 +1143,15 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 	}
 
 	mode = &crtc->mode;
-	dst_x = state->crtc_x;
-	dst_y = state->crtc_y;
-	dst_w = clamp_val(state->crtc_w, 0, mode->hdisplay - dst_x);
-	dst_h = clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
+	dst_x = newstate->crtc_x;
+	dst_y = newstate->crtc_y;
+	dst_w = clamp_val(newstate->crtc_w, 0, mode->hdisplay - dst_x);
+	dst_h = clamp_val(newstate->crtc_h, 0, mode->vdisplay - dst_y);
 	/* src_x are in 16.16 format */
-	src_x = state->src_x >> 16;
-	src_y = state->src_y >> 16;
-	src_w = state->src_w >> 16;
-	src_h = state->src_h >> 16;
+	src_x = newstate->src_x >> 16;
+	src_y = newstate->src_y >> 16;
+	src_w = newstate->src_w >> 16;
+	src_h = newstate->src_h >> 16;
 
 	cmd_offset = sti_hqvdp_get_free_cmd(hqvdp);
 	if (cmd_offset == -1) {
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 4536de9a18c1..911c56a1f8ee 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -749,33 +749,33 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_plane_state *oldstate)
 {
 	struct ltdc_device *ldev = plane_to_ltdc(plane);
-	struct drm_plane_state *state = plane->state;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_plane_state *newstate = plane->state;
+	struct drm_framebuffer *fb = newstate->fb;
 	u32 lofs = plane->index * LAY_OFS;
-	u32 x0 = state->crtc_x;
-	u32 x1 = state->crtc_x + state->crtc_w - 1;
-	u32 y0 = state->crtc_y;
-	u32 y1 = state->crtc_y + state->crtc_h - 1;
+	u32 x0 = newstate->crtc_x;
+	u32 x1 = newstate->crtc_x + newstate->crtc_w - 1;
+	u32 y0 = newstate->crtc_y;
+	u32 y1 = newstate->crtc_y + newstate->crtc_h - 1;
 	u32 src_x, src_y, src_w, src_h;
 	u32 val, pitch_in_bytes, line_length, paddr, ahbp, avbp, bpcr;
 	enum ltdc_pix_fmt pf;
 
-	if (!state->crtc || !fb) {
+	if (!newstate->crtc || !fb) {
 		DRM_DEBUG_DRIVER("fb or crtc NULL");
 		return;
 	}
 
 	/* convert src_ from 16:16 format */
-	src_x = state->src_x >> 16;
-	src_y = state->src_y >> 16;
-	src_w = state->src_w >> 16;
-	src_h = state->src_h >> 16;
+	src_x = newstate->src_x >> 16;
+	src_y = newstate->src_y >> 16;
+	src_w = newstate->src_w >> 16;
+	src_h = newstate->src_h >> 16;
 
 	DRM_DEBUG_DRIVER("plane:%d fb:%d (%dx%d)@(%d,%d) -> (%dx%d)@(%d,%d)\n",
 			 plane->base.id, fb->base.id,
 			 src_w, src_h, src_x, src_y,
-			 state->crtc_w, state->crtc_h,
-			 state->crtc_x, state->crtc_y);
+			 newstate->crtc_w, newstate->crtc_h,
+			 newstate->crtc_x, newstate->crtc_y);
 
 	bpcr = reg_read(ldev->regs, LTDC_BPCR);
 	ahbp = (bpcr & BPCR_AHBP) >> 16;
@@ -834,7 +834,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	reg_update_bits(ldev->regs, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, val);
 
 	/* Sets the FB address */
-	paddr = (u32)drm_fb_cma_get_gem_addr(fb, state, 0);
+	paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 0);
 
 	DRM_DEBUG_DRIVER("fb: phys 0x%08x", paddr);
 	reg_write(ldev->regs, LTDC_L1CFBAR + lofs, paddr);
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 9231c6ef602a..4eafd45baa60 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -709,7 +709,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *new_state = plane->state;
-	struct tegra_plane_state *state = to_tegra_plane_state(new_state);
+	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct drm_framebuffer *fb = new_state->fb;
 	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_dc_window window;
@@ -732,17 +732,17 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
 	window.dst.w = drm_rect_width(&new_state->dst);
 	window.dst.h = drm_rect_height(&new_state->dst);
 	window.bits_per_pixel = fb->format->cpp[0] * 8;
-	window.reflect_x = state->reflect_x;
-	window.reflect_y = state->reflect_y;
+	window.reflect_x = tegra_plane_state->reflect_x;
+	window.reflect_y = tegra_plane_state->reflect_y;
 
 	/* copy from state */
 	window.zpos = new_state->normalized_zpos;
-	window.tiling = state->tiling;
-	window.format = state->format;
-	window.swap = state->swap;
+	window.tiling = tegra_plane_state->tiling;
+	window.format = tegra_plane_state->format;
+	window.swap = tegra_plane_state->swap;
 
 	for (i = 0; i < fb->format->num_planes; i++) {
-		window.base[i] = state->iova[i] + fb->offsets[i];
+		window.base[i] = tegra_plane_state->iova[i] + fb->offsets[i];
 
 		/*
 		 * Tegra uses a shared stride for UV planes. Framebuffers are
@@ -869,7 +869,7 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *new_state = plane->state;
-	struct tegra_plane_state *state = to_tegra_plane_state(new_state);
+	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
 	u32 value = CURSOR_CLIP_DISPLAY;
 
@@ -900,11 +900,11 @@ static void tegra_cursor_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	value |= (state->iova[0] >> 10) & 0x3fffff;
+	value |= (tegra_plane_state->iova[0] >> 10) & 0x3fffff;
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR);
 
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
-	value = (state->iova[0] >> 32) & 0x3;
+	value = (tegra_plane_state->iova[0] >> 32) & 0x3;
 	tegra_dc_writel(dc, value, DC_DISP_CURSOR_START_ADDR_HI);
 #endif
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index e9d86aec5ee8..1d31086e1cc9 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -428,7 +428,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 					     struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *new_state = plane->state;
-	struct tegra_plane_state *state = to_tegra_plane_state(new_state);
+	struct tegra_plane_state *tegra_plane_state = to_tegra_plane_state(new_state);
 	struct tegra_dc *dc = to_tegra_dc(new_state->crtc);
 	unsigned int zpos = new_state->normalized_zpos;
 	struct drm_framebuffer *fb = new_state->fb;
@@ -480,9 +480,9 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	/* disable compression */
 	tegra_plane_writel(p, 0, DC_WINBUF_CDE_CONTROL);
 
-	base = state->iova[0] + fb->offsets[0];
+	base = tegra_plane_state->iova[0] + fb->offsets[0];
 
-	tegra_plane_writel(p, state->format, DC_WIN_COLOR_DEPTH);
+	tegra_plane_writel(p, tegra_plane_state->format, DC_WIN_COLOR_DEPTH);
 	tegra_plane_writel(p, 0, DC_WIN_PRECOMP_WGRP_PARAMS);
 
 	value = V_POSITION(new_state->crtc_y) |
@@ -512,10 +512,10 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 	tegra_plane_writel(p, value, DC_WINBUF_CROPPED_POINT);
 
 	if (dc->soc->supports_block_linear) {
-		unsigned long height = state->tiling.value;
+		unsigned long height = tegra_plane_state->tiling.value;
 
 		/* XXX */
-		switch (state->tiling.mode) {
+		switch (tegra_plane_state->tiling.mode) {
 		case TEGRA_BO_TILING_MODE_PITCH:
 			value = DC_WINBUF_SURFACE_KIND_BLOCK_HEIGHT(0) |
 				DC_WINBUF_SURFACE_KIND_PITCH;
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 9b531e625ec9..90554d0be2d0 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -110,21 +110,21 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
 	struct drm_device *ddev = plane->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
 	struct tidss_plane *tplane = to_tidss_plane(plane);
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 	u32 hw_videoport;
 	int ret;
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
-	if (!state->visible) {
+	if (!new_state->visible) {
 		dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
 		return;
 	}
 
-	hw_videoport = to_tidss_crtc(state->crtc)->hw_videoport;
+	hw_videoport = to_tidss_crtc(new_state->crtc)->hw_videoport;
 
 	ret = dispc_plane_setup(tidss->dispc, tplane->hw_plane_id,
-				state, hw_videoport);
+				new_state, hw_videoport);
 
 	if (ret) {
 		dev_err(plane->dev->dev, "%s: Failed to setup plane %d\n",
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index c86258132432..1d134a6d9fc6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -78,18 +78,18 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 static void tilcdc_plane_atomic_update(struct drm_plane *plane,
 				       struct drm_plane_state *old_state)
 {
-	struct drm_plane_state *state = plane->state;
+	struct drm_plane_state *new_state = plane->state;
 
-	if (!state->crtc)
+	if (!new_state->crtc)
 		return;
 
-	if (WARN_ON(!state->fb || !state->crtc->state))
+	if (WARN_ON(!new_state->fb || !new_state->crtc->state))
 		return;
 
-	if (tilcdc_crtc_update_fb(state->crtc,
-				  state->fb,
-				  state->crtc->state->event) == 0) {
-		state->crtc->state->event = NULL;
+	if (tilcdc_crtc_update_fb(new_state->crtc,
+				  new_state->fb,
+				  new_state->crtc->state->event) == 0) {
+		new_state->crtc->state->event = NULL;
 	}
 }
 
diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
index 2db0ace95426..2833734bd5fb 100644
--- a/drivers/gpu/drm/zte/zx_plane.c
+++ b/drivers/gpu/drm/zte/zx_plane.c
@@ -184,10 +184,10 @@ static void zx_vl_plane_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
 	struct zx_plane *zplane = to_zx_plane(plane);
-	struct drm_plane_state *state = plane->state;
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_rect *src = &state->src;
-	struct drm_rect *dst = &state->dst;
+	struct drm_plane_state *new_state = plane->state;
+	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_rect *src = &new_state->src;
+	struct drm_rect *dst = &new_state->dst;
 	struct drm_gem_cma_object *cma_obj;
 	void __iomem *layer = zplane->layer;
 	void __iomem *hbsc = zplane->hbsc;
-- 
2.29.2

