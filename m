Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D5E45AA64
	for <lists+linux-mips@lfdr.de>; Tue, 23 Nov 2021 18:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239479AbhKWRt6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Nov 2021 12:49:58 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:36248 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239193AbhKWRtu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Nov 2021 12:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637689587;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mfjFOi+pE8zHJ1cv20btETAZGvc5bGuruyTCI3rWs3Y=;
    b=IboHYebnruUhy4ZZSE5bnPbYggIh4ywxxWjqJEPlj7tKL2YGk5oY9axdoSp6zaNDiu
    NM1BPraNNRNG3CZls4lKmRg06PvOMMec7fkLvmg0qhZcDPcKeTMKu2NjrOxuR+pt0i14
    7e/aP2M5YQHA7+IpOHpgzmnOh5jRCp+QsJk8ol3DaVnFM5eThgEXKMmGOOtGgVJRf5eQ
    L/+LELayEma24bNk28tJ0/MQKH8ixTPLvdXsiPqaohqn/aUAaqC+ab6uLKW5iPhndvtt
    L5v9cLF2zOmzkLfzaROTT0oPZ2vGgORylokCDbpfg1GfXaGnTtIG4+6L8B7XMXc4f245
    pgOw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.6 DYNA|AUTH)
    with ESMTPSA id g09b5fxANHkQ7fo
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 23 Nov 2021 18:46:26 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v7 2/8] drm/ingenic: Add support for JZ4780 and HDMI output
Date:   Tue, 23 Nov 2021 18:46:17 +0100
Message-Id: <af92a37f6c652aedac1782efcf442ad56e38f3ab.1637689583.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637689583.git.hns@goldelico.com>
References: <cover.1637689583.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

Add support for the LCD controller present on JZ4780 SoCs.
This SoC uses 8-byte descriptors which extend the current
4-byte descriptors used for other Ingenic SoCs.

Tested on MIPS Creator CI20 board.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 55 ++++++++++++++++++++++-
 drivers/gpu/drm/ingenic/ingenic-drm.h     | 38 ++++++++++++++++
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 0bb590c3910d9..5ff97a4bbcfe5 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -6,6 +6,7 @@
 
 #include "ingenic-drm.h"
 
+#include <linux/bitfield.h>
 #include <linux/component.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
@@ -49,6 +50,11 @@ struct ingenic_dma_hwdesc {
 	u32 addr;
 	u32 id;
 	u32 cmd;
+	/* extended hw descriptor for jz4780 */
+	u32 offsize;
+	u32 pagewidth;
+	u32 cpos;
+	u32 dessize;
 } __aligned(16);
 
 struct ingenic_dma_hwdescs {
@@ -60,6 +66,7 @@ struct jz_soc_info {
 	bool needs_dev_clk;
 	bool has_osd;
 	bool map_noncoherent;
+	bool use_extended_hwdesc;
 	unsigned int max_width, max_height;
 	const u32 *formats_f0, *formats_f1;
 	unsigned int num_formats_f0, num_formats_f1;
@@ -446,6 +453,9 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc)
 		return 0;
 
+	if (plane == &priv->f0)
+		return -EINVAL;
+
 	crtc_state = drm_atomic_get_existing_crtc_state(state,
 							crtc);
 	if (WARN_ON(!crtc_state))
@@ -662,6 +672,33 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
 		hwdesc->next = dma_hwdesc_addr(priv, next_id);
 
+		if (priv->soc_info->use_extended_hwdesc) {
+			hwdesc->cmd |= JZ_LCD_CMD_FRM_ENABLE;
+
+			/* Extended 8-byte descriptor */
+			hwdesc->cpos = 0;
+			hwdesc->offsize = 0;
+			hwdesc->pagewidth = 0;
+
+			switch (newstate->fb->format->format) {
+			case DRM_FORMAT_XRGB1555:
+				hwdesc->cpos |= JZ_LCD_CPOS_RGB555;
+				fallthrough;
+			case DRM_FORMAT_RGB565:
+				hwdesc->cpos |= JZ_LCD_CPOS_BPP_15_16;
+				break;
+			case DRM_FORMAT_XRGB8888:
+				hwdesc->cpos |= JZ_LCD_CPOS_BPP_18_24;
+				break;
+			}
+			hwdesc->cpos |= (JZ_LCD_CPOS_COEFFICIENT_1 <<
+					 JZ_LCD_CPOS_COEFFICIENT_OFFSET);
+			hwdesc->dessize =
+				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
+				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK, height - 1) |
+				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK, width - 1);
+		}
+
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 			fourcc = newstate->fb->format->format;
 
@@ -693,6 +730,9 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
 	}
 
+	if (priv->soc_info->use_extended_hwdesc)
+		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
+
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
@@ -1064,7 +1104,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	}
 
 	regmap_config = ingenic_drm_regmap_config;
-	regmap_config.max_register = res->end - res->start;
+	regmap_config.max_register = res->end - res->start - 4;
 	priv->map = devm_regmap_init_mmio(dev, base,
 					  &regmap_config);
 	if (IS_ERR(priv->map)) {
@@ -1468,10 +1508,23 @@ static const struct jz_soc_info jz4770_soc_info = {
 	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
 };
 
+static const struct jz_soc_info jz4780_soc_info = {
+	.needs_dev_clk = true,
+	.has_osd = true,
+	.use_extended_hwdesc = true,
+	.max_width = 4096,
+	.max_height = 2048,
+	.formats_f1 = jz4770_formats_f1,
+	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
+	.formats_f0 = jz4770_formats_f0,
+	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
+};
+
 static const struct of_device_id ingenic_drm_of_match[] = {
 	{ .compatible = "ingenic,jz4740-lcd", .data = &jz4740_soc_info },
 	{ .compatible = "ingenic,jz4725b-lcd", .data = &jz4725b_soc_info },
 	{ .compatible = "ingenic,jz4770-lcd", .data = &jz4770_soc_info },
+	{ .compatible = "ingenic,jz4780-lcd", .data = &jz4780_soc_info },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
index 22654ac1dde1c..cb1d09b625881 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.h
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -44,8 +44,11 @@
 #define JZ_REG_LCD_XYP1				0x124
 #define JZ_REG_LCD_SIZE0			0x128
 #define JZ_REG_LCD_SIZE1			0x12c
+#define JZ_REG_LCD_PCFG				0x2c0
 
 #define JZ_LCD_CFG_SLCD				BIT(31)
+#define JZ_LCD_CFG_DESCRIPTOR_8			BIT(28)
+#define JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN	BIT(25)
 #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
 #define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
 #define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
@@ -63,6 +66,7 @@
 #define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
 #define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
 #define JZ_LCD_CFG_18_BIT			BIT(7)
+#define JZ_LCD_CFG_24_BIT			BIT(6)
 #define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
 
 #define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
@@ -132,6 +136,7 @@
 #define JZ_LCD_CMD_SOF_IRQ			BIT(31)
 #define JZ_LCD_CMD_EOF_IRQ			BIT(30)
 #define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
+#define JZ_LCD_CMD_FRM_ENABLE			BIT(26)
 
 #define JZ_LCD_SYNC_MASK			0x3ff
 
@@ -153,6 +158,7 @@
 #define JZ_LCD_RGBC_EVEN_BGR			(0x5 << 0)
 
 #define JZ_LCD_OSDC_OSDEN			BIT(0)
+#define JZ_LCD_OSDC_ALPHAEN			BIT(2)
 #define JZ_LCD_OSDC_F0EN			BIT(3)
 #define JZ_LCD_OSDC_F1EN			BIT(4)
 
@@ -176,6 +182,38 @@
 #define JZ_LCD_SIZE01_WIDTH_LSB			0
 #define JZ_LCD_SIZE01_HEIGHT_LSB		16
 
+#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
+#define JZ_LCD_DESSIZE_HEIGHT_MASK		GENMASK(23, 12)
+#define JZ_LCD_DESSIZE_WIDTH_MASK		GENMASK(11, 0)
+
+#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
+#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
+#define JZ_LCD_CPOS_BPP_30			(7 << 27)
+#define JZ_LCD_CPOS_RGB555			BIT(30)
+#define JZ_LCD_CPOS_PREMULTIPLY_LCD		BIT(26)
+#define JZ_LCD_CPOS_COEFFICIENT_OFFSET		24
+#define JZ_LCD_CPOS_COEFFICIENT_0		0
+#define JZ_LCD_CPOS_COEFFICIENT_1		1
+#define JZ_LCD_CPOS_COEFFICIENT_ALPHA1		2
+#define JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1	3
+
+#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
+#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
+#define JZ_LCD_RGBC_422				BIT(8)
+#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
+
+#define JZ_LCD_PCFG_PRI_MODE			BIT(31)
+#define JZ_LCD_PCFG_HP_BST_4			(0 << 28)
+#define JZ_LCD_PCFG_HP_BST_8			(1 << 28)
+#define JZ_LCD_PCFG_HP_BST_16			(2 << 28)
+#define JZ_LCD_PCFG_HP_BST_32			(3 << 28)
+#define JZ_LCD_PCFG_HP_BST_64			(4 << 28)
+#define JZ_LCD_PCFG_HP_BST_16_CONT		(5 << 28)
+#define JZ_LCD_PCFG_HP_BST_DISABLE		(7 << 28)
+#define JZ_LCD_PCFG_THRESHOLD2_OFFSET		18
+#define JZ_LCD_PCFG_THRESHOLD1_OFFSET		9
+#define JZ_LCD_PCFG_THRESHOLD0_OFFSET		0
+
 struct device;
 struct drm_plane;
 struct drm_plane_state;
-- 
2.33.0

