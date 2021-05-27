Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB00393933
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 01:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbhE0XYQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 19:24:16 -0400
Received: from aposti.net ([89.234.176.197]:36238 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236565AbhE0XX4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 19:23:56 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>
Cc:     list@opendingux.net, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 08/11] drm/ingenic: Support custom GEM object
Date:   Fri, 28 May 2021 00:21:02 +0100
Message-Id: <20210527232104.152577-9-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add boilerplate code to support a custom "ingenic_gem_object". Empty for
now, but it will be useful later when subsequent patches will introduce
object-specific driver data.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index ced2109e8f35..1cac369f6293 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -64,6 +64,10 @@ struct jz_soc_info {
 	unsigned int num_formats_f0, num_formats_f1;
 };
 
+struct ingenic_gem_object {
+	struct drm_gem_cma_object base;
+};
+
 struct ingenic_drm_private_state {
 	struct drm_private_state base;
 
@@ -179,6 +183,11 @@ static inline struct ingenic_drm *drm_nb_get_priv(struct notifier_block *nb)
 	return container_of(nb, struct ingenic_drm, clock_nb);
 }
 
+static inline struct ingenic_gem_object *to_ingenic_gem_obj(struct drm_gem_object *gem_obj)
+{
+	return container_of(gem_obj, struct ingenic_gem_object, base.base);
+}
+
 static inline dma_addr_t dma_hwdesc_addr(const struct ingenic_drm *priv, bool use_f1)
 {
 	u32 offset = offsetof(struct ingenic_dma_hwdescs, hwdesc[use_f1]);
@@ -853,15 +862,15 @@ static struct drm_gem_object *
 ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(drm);
-	struct drm_gem_cma_object *obj;
+	struct ingenic_gem_object *obj;
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
 
-	obj->map_noncoherent = priv->soc_info->map_noncoherent;
+	obj->base.map_noncoherent = priv->soc_info->map_noncoherent;
 
-	return &obj->base;
+	return &obj->base.base;
 }
 
 static struct drm_private_state *
-- 
2.30.2

