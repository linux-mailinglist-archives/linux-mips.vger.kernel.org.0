Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F0C393918
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 01:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236604AbhE0XW6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 19:22:58 -0400
Received: from aposti.net ([89.234.176.197]:35906 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236593AbhE0XWz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 19:22:55 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>
Cc:     list@opendingux.net, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 01/11] drm/ingenic: Remove dead code
Date:   Fri, 28 May 2021 00:20:55 +0100
Message-Id: <20210527232104.152577-2-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The priv->ipu_plane would get a different value further down the code,
without the first assigned value being read first; so the first
assignation can be dropped.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5244f4763477..93c099e7464d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -988,9 +988,6 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	priv->dma_hwdescs->hwdesc_pal.cmd = JZ_LCD_CMD_ENABLE_PAL
 		| (sizeof(priv->dma_hwdescs->palette) / 4);
 
-	if (soc_info->has_osd)
-		priv->ipu_plane = drm_plane_from_index(drm, 0);
-
 	primary = priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
 
 	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
-- 
2.30.2

