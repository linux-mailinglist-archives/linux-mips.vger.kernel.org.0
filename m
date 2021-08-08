Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B8E3E3A90
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 15:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhHHNq3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Aug 2021 09:46:29 -0400
Received: from aposti.net ([89.234.176.197]:55820 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231673AbhHHNq3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Aug 2021 09:46:29 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/8] drm/ingenic: Use standard drm_atomic_helper_commit_tail
Date:   Sun,  8 Aug 2021 15:45:21 +0200
Message-Id: <20210808134526.119198-4-paul@crapouillou.net>
In-Reply-To: <20210808134526.119198-1-paul@crapouillou.net>
References: <20210808134526.119198-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

By making the CRTC's .vblank_enable() function return an error when it
is known that the hardware won't deliver a VBLANK, we can drop the
ingenic_drm_atomic_helper_commit_tail() function and use the standard
drm_atomic_helper_commit_tail() function instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 ++++-------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index bc71ba44ccf4..3ed7c27a8dde 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -706,29 +706,6 @@ static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
 	}
 }
 
-static void ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
-{
-	/*
-	 * Just your regular drm_atomic_helper_commit_tail(), but only calls
-	 * drm_atomic_helper_wait_for_vblanks() if priv->no_vblank.
-	 */
-	struct drm_device *dev = old_state->dev;
-	struct ingenic_drm *priv = drm_device_get_priv(dev);
-
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
-
-	drm_atomic_helper_commit_planes(dev, old_state, 0);
-
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
-
-	drm_atomic_helper_commit_hw_done(old_state);
-
-	if (!priv->no_vblank)
-		drm_atomic_helper_wait_for_vblanks(dev, old_state);
-
-	drm_atomic_helper_cleanup_planes(dev, old_state);
-}
-
 static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(arg);
@@ -749,6 +726,9 @@ static int ingenic_drm_enable_vblank(struct drm_crtc *crtc)
 {
 	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
 
+	if (priv->no_vblank)
+		return -EWOULDBLOCK;
+
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
 			   JZ_LCD_CTRL_EOF_IRQ, JZ_LCD_CTRL_EOF_IRQ);
 
@@ -856,7 +836,7 @@ static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
 };
 
 static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
-	.atomic_commit_tail = ingenic_drm_atomic_helper_commit_tail,
+	.atomic_commit_tail = drm_atomic_helper_commit_tail,
 };
 
 static void ingenic_drm_unbind_all(void *d)
-- 
2.30.2

