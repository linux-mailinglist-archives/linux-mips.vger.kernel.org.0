Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A8D41523B
	for <lists+linux-mips@lfdr.de>; Wed, 22 Sep 2021 22:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237973AbhIVU7A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Sep 2021 16:59:00 -0400
Received: from aposti.net ([89.234.176.197]:47320 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237783AbhIVU6w (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Sep 2021 16:58:52 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-mips@vger.kernel.org, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 4/6] drm/ingenic: Set DMA descriptor chain register when starting CRTC
Date:   Wed, 22 Sep 2021 21:55:53 +0100
Message-Id: <20210922205555.496871-5-paul@crapouillou.net>
In-Reply-To: <20210922205555.496871-1-paul@crapouillou.net>
References: <20210922205555.496871-1-paul@crapouillou.net>
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
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5dbeca0f8f37..cbc76cede99e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -186,6 +186,10 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
 
+	/* Set address of our DMA descriptor chain */
+	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
+	regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
+
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
 			   JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
 			   JZ_LCD_CTRL_ENABLE);
-- 
2.33.0

