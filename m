Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C6E20E9C7
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 02:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgF2XxJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jun 2020 19:53:09 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49890 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbgF2XxJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jun 2020 19:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1593474746; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5AocaWc7rkH3ZEHuDGl/Rjgldp25dj2h8O/w329kYg4=;
        b=ax6sX1UDPA0hXuHlcDbC0ylSpkl+stoKxut0ANLmbAiZbYguWYzAND/v77jMx5hJKSqP4b
        3hTt9jfrdQWyeCdRuACqeTFP0l34eYXPwqRQ3AQF0AfLuF1XZJ9bci1zNk0+pO9DaZgnOo
        zVQO3iP2QY3YUhRKIGLj9eZjwabMZ0s=
From:   Paul Cercueil <paul@crapouillou.net>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 07/10] drm/ingenic: Move register definitions to ingenic-drm.h
Date:   Tue, 30 Jun 2020 01:52:07 +0200
Message-Id: <20200629235210.441709-7-paul@crapouillou.net>
In-Reply-To: <20200629235210.441709-1-paul@crapouillou.net>
References: <20200629235210.441709-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Move the register definitions to ingenic-drm.h, to keep
ingenic-drm-drv.c tidy.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Fix SPDX license tag

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 116 +-------------------
 drivers/gpu/drm/ingenic/ingenic-drm.h     | 126 ++++++++++++++++++++++
 2 files changed, 128 insertions(+), 114 deletions(-)
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-drm.h

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index f7b0c5dc8cd8..6590b61cb915 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -4,6 +4,8 @@
 //
 // Copyright (C) 2019, Paul Cercueil <paul@crapouillou.net>
 
+#include "ingenic-drm.h"
+
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
@@ -32,120 +34,6 @@
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
-#define JZ_REG_LCD_CFG				0x00
-#define JZ_REG_LCD_VSYNC			0x04
-#define JZ_REG_LCD_HSYNC			0x08
-#define JZ_REG_LCD_VAT				0x0C
-#define JZ_REG_LCD_DAH				0x10
-#define JZ_REG_LCD_DAV				0x14
-#define JZ_REG_LCD_PS				0x18
-#define JZ_REG_LCD_CLS				0x1C
-#define JZ_REG_LCD_SPL				0x20
-#define JZ_REG_LCD_REV				0x24
-#define JZ_REG_LCD_CTRL				0x30
-#define JZ_REG_LCD_STATE			0x34
-#define JZ_REG_LCD_IID				0x38
-#define JZ_REG_LCD_DA0				0x40
-#define JZ_REG_LCD_SA0				0x44
-#define JZ_REG_LCD_FID0				0x48
-#define JZ_REG_LCD_CMD0				0x4C
-#define JZ_REG_LCD_DA1				0x50
-#define JZ_REG_LCD_SA1				0x54
-#define JZ_REG_LCD_FID1				0x58
-#define JZ_REG_LCD_CMD1				0x5C
-
-#define JZ_LCD_CFG_SLCD				BIT(31)
-#define JZ_LCD_CFG_PS_DISABLE			BIT(23)
-#define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
-#define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
-#define JZ_LCD_CFG_REV_DISABLE			BIT(20)
-#define JZ_LCD_CFG_HSYNCM			BIT(19)
-#define JZ_LCD_CFG_PCLKM			BIT(18)
-#define JZ_LCD_CFG_INV				BIT(17)
-#define JZ_LCD_CFG_SYNC_DIR			BIT(16)
-#define JZ_LCD_CFG_PS_POLARITY			BIT(15)
-#define JZ_LCD_CFG_CLS_POLARITY			BIT(14)
-#define JZ_LCD_CFG_SPL_POLARITY			BIT(13)
-#define JZ_LCD_CFG_REV_POLARITY			BIT(12)
-#define JZ_LCD_CFG_HSYNC_ACTIVE_LOW		BIT(11)
-#define JZ_LCD_CFG_PCLK_FALLING_EDGE		BIT(10)
-#define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
-#define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
-#define JZ_LCD_CFG_18_BIT			BIT(7)
-#define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
-
-#define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
-#define JZ_LCD_CFG_MODE_GENERIC_18BIT		BIT(7)
-#define JZ_LCD_CFG_MODE_GENERIC_24BIT		BIT(6)
-
-#define JZ_LCD_CFG_MODE_SPECIAL_TFT_1		1
-#define JZ_LCD_CFG_MODE_SPECIAL_TFT_2		2
-#define JZ_LCD_CFG_MODE_SPECIAL_TFT_3		3
-
-#define JZ_LCD_CFG_MODE_TV_OUT_P		4
-#define JZ_LCD_CFG_MODE_TV_OUT_I		6
-
-#define JZ_LCD_CFG_MODE_SINGLE_COLOR_STN	8
-#define JZ_LCD_CFG_MODE_SINGLE_MONOCHROME_STN	9
-#define JZ_LCD_CFG_MODE_DUAL_COLOR_STN		10
-#define JZ_LCD_CFG_MODE_DUAL_MONOCHROME_STN	11
-
-#define JZ_LCD_CFG_MODE_8BIT_SERIAL		12
-#define JZ_LCD_CFG_MODE_LCM			13
-
-#define JZ_LCD_VSYNC_VPS_OFFSET			16
-#define JZ_LCD_VSYNC_VPE_OFFSET			0
-
-#define JZ_LCD_HSYNC_HPS_OFFSET			16
-#define JZ_LCD_HSYNC_HPE_OFFSET			0
-
-#define JZ_LCD_VAT_HT_OFFSET			16
-#define JZ_LCD_VAT_VT_OFFSET			0
-
-#define JZ_LCD_DAH_HDS_OFFSET			16
-#define JZ_LCD_DAH_HDE_OFFSET			0
-
-#define JZ_LCD_DAV_VDS_OFFSET			16
-#define JZ_LCD_DAV_VDE_OFFSET			0
-
-#define JZ_LCD_CTRL_BURST_4			(0x0 << 28)
-#define JZ_LCD_CTRL_BURST_8			(0x1 << 28)
-#define JZ_LCD_CTRL_BURST_16			(0x2 << 28)
-#define JZ_LCD_CTRL_RGB555			BIT(27)
-#define JZ_LCD_CTRL_OFUP			BIT(26)
-#define JZ_LCD_CTRL_FRC_GRAYSCALE_16		(0x0 << 24)
-#define JZ_LCD_CTRL_FRC_GRAYSCALE_4		(0x1 << 24)
-#define JZ_LCD_CTRL_FRC_GRAYSCALE_2		(0x2 << 24)
-#define JZ_LCD_CTRL_PDD_MASK			(0xff << 16)
-#define JZ_LCD_CTRL_EOF_IRQ			BIT(13)
-#define JZ_LCD_CTRL_SOF_IRQ			BIT(12)
-#define JZ_LCD_CTRL_OFU_IRQ			BIT(11)
-#define JZ_LCD_CTRL_IFU0_IRQ			BIT(10)
-#define JZ_LCD_CTRL_IFU1_IRQ			BIT(9)
-#define JZ_LCD_CTRL_DD_IRQ			BIT(8)
-#define JZ_LCD_CTRL_QDD_IRQ			BIT(7)
-#define JZ_LCD_CTRL_REVERSE_ENDIAN		BIT(6)
-#define JZ_LCD_CTRL_LSB_FISRT			BIT(5)
-#define JZ_LCD_CTRL_DISABLE			BIT(4)
-#define JZ_LCD_CTRL_ENABLE			BIT(3)
-#define JZ_LCD_CTRL_BPP_1			0x0
-#define JZ_LCD_CTRL_BPP_2			0x1
-#define JZ_LCD_CTRL_BPP_4			0x2
-#define JZ_LCD_CTRL_BPP_8			0x3
-#define JZ_LCD_CTRL_BPP_15_16			0x4
-#define JZ_LCD_CTRL_BPP_18_24			0x5
-#define JZ_LCD_CTRL_BPP_MASK			(JZ_LCD_CTRL_RGB555 | (0x7 << 0))
-
-#define JZ_LCD_CMD_SOF_IRQ			BIT(31)
-#define JZ_LCD_CMD_EOF_IRQ			BIT(30)
-#define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
-
-#define JZ_LCD_SYNC_MASK			0x3ff
-
-#define JZ_LCD_STATE_EOF_IRQ			BIT(5)
-#define JZ_LCD_STATE_SOF_IRQ			BIT(4)
-#define JZ_LCD_STATE_DISABLED			BIT(0)
-
 struct ingenic_dma_hwdesc {
 	u32 next;
 	u32 addr;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
new file mode 100644
index 000000000000..cb578cff7bb1
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+//
+// Ingenic JZ47xx KMS driver - Register definitions and private API
+//
+// Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
+
+#ifndef DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H
+#define DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H
+
+#include <linux/bitops.h>
+
+#define JZ_REG_LCD_CFG				0x00
+#define JZ_REG_LCD_VSYNC			0x04
+#define JZ_REG_LCD_HSYNC			0x08
+#define JZ_REG_LCD_VAT				0x0C
+#define JZ_REG_LCD_DAH				0x10
+#define JZ_REG_LCD_DAV				0x14
+#define JZ_REG_LCD_PS				0x18
+#define JZ_REG_LCD_CLS				0x1C
+#define JZ_REG_LCD_SPL				0x20
+#define JZ_REG_LCD_REV				0x24
+#define JZ_REG_LCD_CTRL				0x30
+#define JZ_REG_LCD_STATE			0x34
+#define JZ_REG_LCD_IID				0x38
+#define JZ_REG_LCD_DA0				0x40
+#define JZ_REG_LCD_SA0				0x44
+#define JZ_REG_LCD_FID0				0x48
+#define JZ_REG_LCD_CMD0				0x4C
+#define JZ_REG_LCD_DA1				0x50
+#define JZ_REG_LCD_SA1				0x54
+#define JZ_REG_LCD_FID1				0x58
+#define JZ_REG_LCD_CMD1				0x5C
+
+#define JZ_LCD_CFG_SLCD				BIT(31)
+#define JZ_LCD_CFG_PS_DISABLE			BIT(23)
+#define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
+#define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
+#define JZ_LCD_CFG_REV_DISABLE			BIT(20)
+#define JZ_LCD_CFG_HSYNCM			BIT(19)
+#define JZ_LCD_CFG_PCLKM			BIT(18)
+#define JZ_LCD_CFG_INV				BIT(17)
+#define JZ_LCD_CFG_SYNC_DIR			BIT(16)
+#define JZ_LCD_CFG_PS_POLARITY			BIT(15)
+#define JZ_LCD_CFG_CLS_POLARITY			BIT(14)
+#define JZ_LCD_CFG_SPL_POLARITY			BIT(13)
+#define JZ_LCD_CFG_REV_POLARITY			BIT(12)
+#define JZ_LCD_CFG_HSYNC_ACTIVE_LOW		BIT(11)
+#define JZ_LCD_CFG_PCLK_FALLING_EDGE		BIT(10)
+#define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
+#define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
+#define JZ_LCD_CFG_18_BIT			BIT(7)
+#define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
+
+#define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
+#define JZ_LCD_CFG_MODE_GENERIC_18BIT		BIT(7)
+#define JZ_LCD_CFG_MODE_GENERIC_24BIT		BIT(6)
+
+#define JZ_LCD_CFG_MODE_SPECIAL_TFT_1		1
+#define JZ_LCD_CFG_MODE_SPECIAL_TFT_2		2
+#define JZ_LCD_CFG_MODE_SPECIAL_TFT_3		3
+
+#define JZ_LCD_CFG_MODE_TV_OUT_P		4
+#define JZ_LCD_CFG_MODE_TV_OUT_I		6
+
+#define JZ_LCD_CFG_MODE_SINGLE_COLOR_STN	8
+#define JZ_LCD_CFG_MODE_SINGLE_MONOCHROME_STN	9
+#define JZ_LCD_CFG_MODE_DUAL_COLOR_STN		10
+#define JZ_LCD_CFG_MODE_DUAL_MONOCHROME_STN	11
+
+#define JZ_LCD_CFG_MODE_8BIT_SERIAL		12
+#define JZ_LCD_CFG_MODE_LCM			13
+
+#define JZ_LCD_VSYNC_VPS_OFFSET			16
+#define JZ_LCD_VSYNC_VPE_OFFSET			0
+
+#define JZ_LCD_HSYNC_HPS_OFFSET			16
+#define JZ_LCD_HSYNC_HPE_OFFSET			0
+
+#define JZ_LCD_VAT_HT_OFFSET			16
+#define JZ_LCD_VAT_VT_OFFSET			0
+
+#define JZ_LCD_DAH_HDS_OFFSET			16
+#define JZ_LCD_DAH_HDE_OFFSET			0
+
+#define JZ_LCD_DAV_VDS_OFFSET			16
+#define JZ_LCD_DAV_VDE_OFFSET			0
+
+#define JZ_LCD_CTRL_BURST_4			(0x0 << 28)
+#define JZ_LCD_CTRL_BURST_8			(0x1 << 28)
+#define JZ_LCD_CTRL_BURST_16			(0x2 << 28)
+#define JZ_LCD_CTRL_RGB555			BIT(27)
+#define JZ_LCD_CTRL_OFUP			BIT(26)
+#define JZ_LCD_CTRL_FRC_GRAYSCALE_16		(0x0 << 24)
+#define JZ_LCD_CTRL_FRC_GRAYSCALE_4		(0x1 << 24)
+#define JZ_LCD_CTRL_FRC_GRAYSCALE_2		(0x2 << 24)
+#define JZ_LCD_CTRL_PDD_MASK			(0xff << 16)
+#define JZ_LCD_CTRL_EOF_IRQ			BIT(13)
+#define JZ_LCD_CTRL_SOF_IRQ			BIT(12)
+#define JZ_LCD_CTRL_OFU_IRQ			BIT(11)
+#define JZ_LCD_CTRL_IFU0_IRQ			BIT(10)
+#define JZ_LCD_CTRL_IFU1_IRQ			BIT(9)
+#define JZ_LCD_CTRL_DD_IRQ			BIT(8)
+#define JZ_LCD_CTRL_QDD_IRQ			BIT(7)
+#define JZ_LCD_CTRL_REVERSE_ENDIAN		BIT(6)
+#define JZ_LCD_CTRL_LSB_FISRT			BIT(5)
+#define JZ_LCD_CTRL_DISABLE			BIT(4)
+#define JZ_LCD_CTRL_ENABLE			BIT(3)
+#define JZ_LCD_CTRL_BPP_1			0x0
+#define JZ_LCD_CTRL_BPP_2			0x1
+#define JZ_LCD_CTRL_BPP_4			0x2
+#define JZ_LCD_CTRL_BPP_8			0x3
+#define JZ_LCD_CTRL_BPP_15_16			0x4
+#define JZ_LCD_CTRL_BPP_18_24			0x5
+#define JZ_LCD_CTRL_BPP_MASK			(JZ_LCD_CTRL_RGB555 | 0x7)
+
+#define JZ_LCD_CMD_SOF_IRQ			BIT(31)
+#define JZ_LCD_CMD_EOF_IRQ			BIT(30)
+#define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
+
+#define JZ_LCD_SYNC_MASK			0x3ff
+
+#define JZ_LCD_STATE_EOF_IRQ			BIT(5)
+#define JZ_LCD_STATE_SOF_IRQ			BIT(4)
+#define JZ_LCD_STATE_DISABLED			BIT(0)
+
+#endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
-- 
2.27.0

