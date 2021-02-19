Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB83B31F8D0
	for <lists+linux-mips@lfdr.de>; Fri, 19 Feb 2021 13:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhBSMBs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Feb 2021 07:01:48 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45287 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229524AbhBSMBj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Feb 2021 07:01:39 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 632BE5803B6;
        Fri, 19 Feb 2021 07:00:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 19 Feb 2021 07:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
        8SiuRJvmDBxHkppOl7XNYlYL81u802Dvun023WYT7VU=; b=DkpTg+I/R5IM2VIh
        8GygxQO13JiX997ohIsmFTIRfQc/Lr+CdTruqK9Tuio5Wlt3jLTl2uT9LFjjIbV+
        OXtBQUs+gNKLIaauIYxjTxP3ycl9/p5yf2TBjELUHjaToybW9/qfdwZqGzQhpD/3
        75GQeuOAwVZFsxS9KsxQ6ScJJyJflOekOx3dub61BVGYMZW6nv3V7AvjKhAwI1Ne
        CBZAM4HVofYyjfrnPkcq0MpUvXoIGu/sWj+EcTWLZqRHPSUmjEv6UmxFixb1HrIn
        4KZH4uCJlRTsDk3e8gDomQZQpD5Ps34C0YtmjVWDJK+4s0ZP7xalRo6vZDkKvF74
        T1qYwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=8SiuRJvmDBxHkppOl7XNYlYL81u802Dvun023WYT7
        VU=; b=t892QCGn2e6UUSzmdd7un9ZIOVN5CgA5ztWWMEBViq1lrSuxl+D/s0T/c
        SM6X88okWpW8C98rXzRbUiYUSGtMJWquGH8P+bIGDj1F1T/YZADWEIPrqTYMiIBl
        mPJSjkJNUAe48RCrs/MoRej/mkkaU8l3k92QZLOgTwaZaYFnSSB6wc28DGhOW5pl
        gvo1PlxLeJ89lyHiwGlJoJQqJhUSnc/Z9uKUEmsGiYzSR79L37seZ0i+4BHvOvHt
        JB/Kbdq637ySFJbF4WZK4SjRKagzs0WC59KFgh6SgyaiWTMj2jrX2vh4kreDGCSb
        kbZamBKzoUH/eD4uXcQiIgZsXfbwQ==
X-ME-Sender: <xms:c6gvYCQQvnhiuX7Zibxn9J6U1wRvLRuRq8Ho_Z5Xi40PEbt0xmVcMw>
    <xme:c6gvYNlJ9onAXWsP1qDHrIfuBMhtM6FZgxpLYG8AXJazRucYDpF-Kwez5M7fvOTbl
    YVsc9X2gc1p8QtZ-qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
    keeknecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:c6gvYFKhwo1DrLPmgO7-C4lqhYNj2h9OtGL4f90gq5ae06m_dAkykA>
    <xmx:c6gvYIWhQc-YMc79ikXcGdleik9v8qaAp5ia0_D2QQXwXbxvbfBggA>
    <xmx:c6gvYCE6Chv_wrU0-s5YlnEVK-bpOkwrjOA120QQeN2oCKutBtgR-A>
    <xmx:dKgvYIXFbFyZbCuC88G8wrZiDwCXiiXXP6m__kSRrc7O50J9L_xmZA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DF7651080057;
        Fri, 19 Feb 2021 07:00:50 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 06/11] drm: Use state helper instead of plane state pointer in atomic_check
Date:   Fri, 19 Feb 2021 13:00:26 +0100
Message-Id: <20210219120032.260676-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219120032.260676-1-maxime@cerno.tech>
References: <20210219120032.260676-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Many drivers reference the plane->state pointer in order to get the
current plane state in their atomic_check hook, which would be the old
plane state in the global atomic state since _swap_state hasn't happened
when atomic_check is run.

Use the drm_atomic_get_old_plane_state helper to get that state to make
it more obvious.

This was made using the coccinelle script below:

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

static struct drm_plane_helper_funcs helpers = {
	...,
	.atomic_check = func,
	...,
};

@ replaces_old_state @
identifier plane_atomic_func.func;
identifier plane, state, plane_state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state) {
 	...
-	struct drm_plane_state *plane_state = plane->state;
+	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
 	...
 }

@@
identifier plane_atomic_func.func;
identifier plane, state, plane_state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state) {
 	struct drm_plane_state *plane_state = drm_atomic_get_old_plane_state(state, plane);
 	<...
-	plane->state
+	plane_state
 	...>
 }

@ adds_old_state @
identifier plane_atomic_func.func;
identifier plane, state;
@@

 func(struct drm_plane *plane, struct drm_atomic_state *state) {
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	<...
-	plane->state
+	old_plane_state
 	...>
 }

@ include depends on adds_old_state || replaces_old_state @
@@

 #include <drm/drm_atomic.h>

@ no_include depends on !include && (adds_old_state || replaces_old_state) @
@@

+ #include <drm/drm_atomic.h>
  #include <drm/...>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v2:
  - s/.../<.../ in the coccinelle script as suggested by Ville
---
 drivers/gpu/drm/imx/ipuv3-plane.c          |  3 ++-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c  | 16 +++++++++-------
 drivers/gpu/drm/ingenic/ingenic-ipu.c      |  8 +++++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c |  4 +++-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c      |  3 ++-
 5 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index b5f6123850bb..6484592e3f86 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -341,7 +341,8 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
-	struct drm_plane_state *old_state = plane->state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	struct drm_crtc_state *crtc_state;
 	struct device *dev = plane->dev->dev;
 	struct drm_framebuffer *fb = new_state->fb;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e6d7d0a04ddb..c022d9f1e737 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -361,11 +361,13 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
+										 plane);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *crtc = new_plane_state->crtc ?: plane->state->crtc;
+	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
 	int ret;
 
 	if (!crtc)
@@ -399,12 +401,12 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	 * its position, size or depth.
 	 */
 	if (priv->soc_info->has_osd &&
-	    (!plane->state->fb || !new_plane_state->fb ||
-	     plane->state->crtc_x != new_plane_state->crtc_x ||
-	     plane->state->crtc_y != new_plane_state->crtc_y ||
-	     plane->state->crtc_w != new_plane_state->crtc_w ||
-	     plane->state->crtc_h != new_plane_state->crtc_h ||
-	     plane->state->fb->format->format != new_plane_state->fb->format->format))
+	    (!old_plane_state->fb || !new_plane_state->fb ||
+	     old_plane_state->crtc_x != new_plane_state->crtc_x ||
+	     old_plane_state->crtc_y != new_plane_state->crtc_y ||
+	     old_plane_state->crtc_w != new_plane_state->crtc_w ||
+	     old_plane_state->crtc_h != new_plane_state->crtc_h ||
+	     old_plane_state->fb->format->format != new_plane_state->fb->format->format))
 		crtc_state->mode_changed = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 1e1b0fe095bd..3d072b25e1c4 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -516,11 +516,13 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
+										 plane);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	unsigned int num_w, denom_w, num_h, denom_h, xres, yres, max_w, max_h;
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
-	struct drm_crtc *crtc = new_plane_state->crtc ?: plane->state->crtc;
+	struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 
 	if (!crtc)
@@ -531,7 +533,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* Request a full modeset if we are enabling or disabling the IPU. */
-	if (!plane->state->crtc ^ !new_plane_state->crtc)
+	if (!old_plane_state->crtc ^ !new_plane_state->crtc)
 		crtc_state->mode_changed = true;
 
 	if (!new_plane_state->crtc ||
@@ -552,7 +554,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	if (((new_plane_state->src_w >> 16) & 1) || (new_plane_state->crtc_w & 1))
 		return -EINVAL;
 
-	if (!osd_changed(new_plane_state, plane->state))
+	if (!osd_changed(new_plane_state, old_plane_state))
 		return 0;
 
 	crtc_state->mode_changed = true;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 4aac6217a5ad..6ce6ce09fecc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -406,12 +406,14 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 static int mdp5_plane_atomic_check(struct drm_plane *plane,
 				   struct drm_atomic_state *state)
 {
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
+										 plane);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 
-	crtc = new_plane_state->crtc ? new_plane_state->crtc : plane->state->crtc;
+	crtc = new_plane_state->crtc ? new_plane_state->crtc : old_plane_state->crtc;
 	if (!crtc)
 		return 0;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index ebdd42dcaf82..c86258132432 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -26,7 +26,8 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_crtc_state *crtc_state;
-	struct drm_plane_state *old_state = plane->state;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
 	unsigned int pitch;
 
 	if (!new_state->crtc)
-- 
2.29.2

