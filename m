Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353E5440850
	for <lists+linux-mips@lfdr.de>; Sat, 30 Oct 2021 12:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhJ3KDJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 Oct 2021 06:03:09 -0400
Received: from aposti.net ([89.234.176.197]:36548 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230427AbhJ3KDJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 Oct 2021 06:03:09 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Christophe Branchereau <cbranchereau@gmail.com>,
        list@opendingux.net, Paul Cercueil <paul@crapouillou.net>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] gpu/drm: ingenic: Remove bogus register write
Date:   Sat, 30 Oct 2021 11:00:32 +0100
Message-Id: <20211030100032.42066-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 1bdb542da736 ("drm/ingenic: Simplify code by using hwdescs
array") caused the dma_hwdesc_phys_f{0,1} variables to be used while
uninitialized in a mmio register write, which most certainly broke the
ingenic-drm driver.

However, the very same patchset also submitted commit 6055466203df
("drm/ingenic: Upload palette before frame"), which restored a correct
behaviour by doing the register writes in a different place in the code.

What's left of this, is just to remove the bogus register writes in the
probe function.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a05a9fa6e115..b4943a56be09 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1013,7 +1013,6 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	void __iomem *base;
 	long parent_rate;
 	unsigned int i, clone_mask = 0;
-	dma_addr_t dma_hwdesc_phys_f0, dma_hwdesc_phys_f1;
 	int ret, irq;
 
 	soc_info = of_device_get_match_data(dev);
@@ -1268,10 +1267,6 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
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
2.33.0

