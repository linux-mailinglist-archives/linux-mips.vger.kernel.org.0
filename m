Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E773E96BE
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 19:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhHKRYI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 13:24:08 -0400
Received: from aposti.net ([89.234.176.197]:37490 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhHKRYH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Aug 2021 13:24:07 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 4/6] drm/ingenic: Set DMA descriptor chain register when starting CRTC
Date:   Wed, 11 Aug 2021 19:23:07 +0200
Message-Id: <20210811172309.314287-5-paul@crapouillou.net>
In-Reply-To: <20210811172309.314287-1-paul@crapouillou.net>
References: <20210811172309.314287-1-paul@crapouillou.net>
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
2.30.2

