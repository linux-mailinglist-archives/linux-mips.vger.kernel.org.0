Return-Path: <linux-mips+bounces-11469-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1693B8039E
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 16:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4460216F160
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 14:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FAA2F4A1E;
	Wed, 17 Sep 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNqET/kH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6DB1E25FA
	for <linux-mips@vger.kernel.org>; Wed, 17 Sep 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120475; cv=none; b=WOFOro4/NmceQhIfK/hf8TBu2oDGSHL+ei77JzQzrVRC6fGmEj+DwhhC0VEiF44QsQ+0PAO5A6XPEwjwh0dLw/ObrUqYtH+qOPhihRUZ2iepJeSfSEIiUQHE62k7kiX58a42+C0HjOCijaMNJGT1kpC9VN2CVfn7ATTdVE/JuoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120475; c=relaxed/simple;
	bh=w9FYSGCFlvp1v1BCXyAA0Xy9sUV+AIrXP/toqUxniEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=riNt8mWf8oLtq08BdMkgUJOgyEswcwFxw//Ns7RB3JI512CrU8Qj760ORMTONGUU/tj8afdJZ2E6kCP2T7Z1w/EGgXuHQrF4TggTNMuJp08MkjK78pH8qItg3YdROUHDYFZB0+YThb0ll8B0lhyVcVl6z37YF+I7RVb5i2RPxsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNqET/kH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E81C4CEFA;
	Wed, 17 Sep 2025 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120475;
	bh=w9FYSGCFlvp1v1BCXyAA0Xy9sUV+AIrXP/toqUxniEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oNqET/kHKZLRuh4R89fIMtFhu+kPzsP0McepxuDdw8zc1/JEV6/XT4foKK5u334Cx
	 SMLbRx/jjB7KqxqUYlSzgZb3L4geqYK9p0H/yzw+mCRPjapFsX13MXt/ErvBpTlBaJ
	 o7ayuzUZfySHw+Kv71KFlhrXEG0NbCELgT7R4DZLGI2PWkhx1Kq9mX3zWAu7R2pVb0
	 lkcWkCJvfl0UhTT7ZmXUqkFvEPc7GMWwu9y/IQ2u2U3Z7HrK4wQnNVmZx/yWjYdPnm
	 G0NskpsROE46l74WSI4rn/zHcO5UhREBeSM+EEF6juP2oMvyHoO/LnnE/ouWGJNhnK
	 1KaQ/5LaTCukQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:18 +0200
Subject: [PATCH v4 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-37-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3183; i=mripard@kernel.org;
 h=from:subject:message-id; bh=w9FYSGCFlvp1v1BCXyAA0Xy9sUV+AIrXP/toqUxniEQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq6fcKfv9fe7Eq+uxLxYd2njuaU/9vs5vHvCvtWAN
 8chSs/zYMdUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYiFwIY8MB4Xpen/3xeTXW
 SReibDjKuSRmCFxetXn6VcEFrS92PbSeMTuKsfXylqX7+SbuEn4oLsRYnzJ1+azsbtW9N9Ujorz
 +TWirqb4Q9Fz1FvtKx+KeOT8/nL3+/ENMVMEpVt6dVoyLuXYwAAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ingenic CRTC atomic_enable() implementation will indirectly call
drm_atomic_get_private_obj_state() through ingenic_drm_get_priv_state().

drm_atomic_get_private_obj_state() will either return the new state for
the object in the global state if it exists, or will allocate a new one
and add it to the global state.

atomic_enable() however isn't allowed to modify the global state. So
what the implementation should use is the
drm_atomic_get_new_private_obj_state() helper to get the new state for
the CRTC, without performing an extra allocation.

We still need to make sure the private state will be part of the global
state by the time atomic_enable runs, so we still need to call
ingenic_drm_get_priv_state() in atomic_check. We can then call
ingenic_drm_get_new_priv_state() in atomic_enable, which is a wrapper
around drm_atomic_get_new_private_obj_state().

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 05faed933e5619c796f2a4fa1906e0eaa029ac68..d3213fbf22be14b177fc1b7100c5b721d5f17924 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -245,12 +245,12 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 	struct ingenic_drm_private_state *priv_state;
 	unsigned int next_id;
 
-	priv_state = ingenic_drm_get_priv_state(priv, state);
-	if (WARN_ON(IS_ERR(priv_state)))
+	priv_state = ingenic_drm_get_new_priv_state(priv, state);
+	if (WARN_ON(!priv_state))
 		return;
 
 	/* Set addresses of our DMA descriptor chains */
 	next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;
 	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, next_id));
@@ -338,17 +338,23 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
+	struct ingenic_drm_private_state *priv_state;
 
 	if (crtc_state->gamma_lut &&
 	    drm_color_lut_size(crtc_state->gamma_lut) != ARRAY_SIZE(priv->dma_hwdescs->palette)) {
 		dev_dbg(priv->dev, "Invalid palette size\n");
 		return -EINVAL;
 	}
 
+	/* We will need the state in atomic_enable, so let's make sure it's part of the state */
+	priv_state = ingenic_drm_get_priv_state(priv, state);
+	if (IS_ERR(priv_state))
+		return PTR_ERR(priv_state);
+
 	if (drm_atomic_crtc_needs_modeset(crtc_state) && priv->soc_info->has_osd) {
 		f1_state = drm_atomic_get_plane_state(crtc_state->state,
 						      &priv->f1);
 		if (IS_ERR(f1_state))
 			return PTR_ERR(f1_state);

-- 
2.50.1


