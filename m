Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B7D39392A
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 01:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236693AbhE0XXe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 19:23:34 -0400
Received: from aposti.net ([89.234.176.197]:36112 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236723AbhE0XXb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 19:23:31 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>
Cc:     list@opendingux.net, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 06/11] drm/ingenic: Set DMA descriptor chain register when starting CRTC
Date:   Fri, 28 May 2021 00:21:00 +0100
Message-Id: <20210527232104.152577-7-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Setting the DMA descriptor chain register in the probe function has been
fine until now, because we only ever had one descriptor per foreground.

As the driver will soon have real descriptor chains, and the DMA
descriptor chain register updates itself to point to the current
descriptor being processed, this register needs to be reset after a full
modeset to point to the first descriptor of the chain.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 639994329c60..5ba3283da97d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -210,6 +210,10 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
 
+	/* Set address of our DMA descriptor chain */
+	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
+	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
+
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
 			   JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
 			   JZ_LCD_CTRL_ENABLE);
@@ -1218,10 +1222,6 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		}
 	}
 
-	/* Set address of our DMA descriptor chain */
-	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_phys_f0);
-	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_phys_f1);
-
 	/* Enable OSD if available */
 	if (soc_info->has_osd)
 		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
-- 
2.30.2

