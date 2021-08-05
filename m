Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F653E1677
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 16:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241868AbhHEOIg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 10:08:36 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:20670 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241865AbhHEOIc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 10:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628172482;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Xd4Ow7UQR8vN93lIKdP4aP3NQNR6paMvzex82nFNjl8=;
    b=PNVlmYtX5Ak5oysu3AsUdNOi4HhQwyUS5153cU6cHGkVGlnvnQFsn726hxO2Cgcwq+
    pUUxMazeTOUPHpTT6LkQeMhzkediRjtRGzZVs0uX5NsJkxXeZeZ64CPR0289g+SX8uui
    Yo2ZNyXHtXZZdKJnutR7J/r80gbU4W5Usw+20B7hCUFVVtK/uLoZCyLmU2OzLPUgshJb
    rxODcwRViwaXobCkDWIu4DCfQsENajTagwd7O/KsO3PV8Oz8ffvUwmXJnHlb+tTNrVzi
    4PxkmmIJdfZHURyPpcBGbLzMXTkchiOJdRcuy16vt/6DnAILDAjo9iNfb/1H5GUqDdGT
    2oiA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdbLzk="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id Q02727x75E82783
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 5 Aug 2021 16:08:02 +0200 (CEST)
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
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/ingenic: Add support for JZ4780 and HDMI output
Date:   Thu,  5 Aug 2021 16:07:52 +0200
Message-Id: <263a207d2aeb8bc95aa8464212dcc9b225548f4f.1628172477.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628172477.git.hns@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

Add support for the LCD controller present on JZ4780 SoCs.
This SoC uses 8-byte descriptors which extend the current
4-byte descriptors used for other Ingenic SoCs.

Also, add special handling for HDMI-A connectors.

For some reason, only the primary planes are working
properly. As soon as the overlay plane is enabled
things go south :P

Tested on MIPS Creator CI20 board.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 163 ++++++++++++++++++++--
 drivers/gpu/drm/ingenic/ingenic-drm.h     |  52 +++++++
 2 files changed, 200 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 5244f47634777..a2d103ae46833 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -56,13 +56,27 @@ struct ingenic_dma_hwdescs {
 	u16 palette[256] __aligned(16);
 };
 
+struct ingenic_dma_hwdesc_ext {
+	struct ingenic_dma_hwdesc base;
+	u32 offsize;
+	u32 pagewidth;
+	u32 cpos;
+	u32 dessize;
+} __packed;
+
 struct jz_soc_info {
 	bool needs_dev_clk;
 	bool has_osd;
 	bool map_noncoherent;
+	bool has_alpha;
+	bool has_pcfg;
+	bool has_recover;
+	bool has_rgbc;
+	unsigned int hwdesc_size;
 	unsigned int max_width, max_height;
 	const u32 *formats_f0, *formats_f1;
 	unsigned int num_formats_f0, num_formats_f1;
+	unsigned int max_reg;
 };
 
 struct ingenic_drm {
@@ -118,12 +132,11 @@ static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config ingenic_drm_regmap_config = {
+static struct regmap_config ingenic_drm_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
 
-	.max_register = JZ_REG_LCD_SIZE1,
 	.writeable_reg = ingenic_drm_writeable_reg,
 };
 
@@ -582,7 +595,39 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 			hwdesc = &priv->dma_hwdescs->hwdesc_f1;
 
 		hwdesc->addr = addr;
-		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
+		hwdesc->cmd = JZ_LCD_CMD_FRM_ENABLE | JZ_LCD_CMD_EOF_IRQ |
+			      (width * height * cpp / 4);
+
+		if (priv->soc_info->hwdesc_size == sizeof(struct ingenic_dma_hwdesc_ext)) {
+			struct ingenic_dma_hwdesc_ext *hwdesc_ext;
+
+			/* Extended 8-byte descriptor */
+			hwdesc_ext = (struct ingenic_dma_hwdesc_ext *) hwdesc;
+			hwdesc_ext->cpos = 0;
+			hwdesc_ext->offsize = 0;
+			hwdesc_ext->pagewidth = 0;
+
+			switch (newstate->fb->format->format) {
+			case DRM_FORMAT_XRGB1555:
+				hwdesc_ext->cpos |= JZ_LCD_CPOS_RGB555;
+				fallthrough;
+			case DRM_FORMAT_RGB565:
+				hwdesc_ext->cpos |= JZ_LCD_CPOS_BPP_15_16;
+				break;
+			case DRM_FORMAT_XRGB8888:
+				hwdesc_ext->cpos |= JZ_LCD_CPOS_BPP_18_24;
+				break;
+			}
+			hwdesc_ext->cpos |= JZ_LCD_CPOS_PREMULTIPLY_LCD |
+					    (3 << JZ_LCD_CPOS_COEFFICIENT_OFFSET);
+
+			hwdesc_ext->dessize =
+				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
+				(((height - 1) & JZ_LCD_DESSIZE_HEIGHT_MASK) <<
+						 JZ_LCD_DESSIZE_HEIGHT_OFFSET) |
+				(((width - 1) & JZ_LCD_DESSIZE_WIDTH_MASK) <<
+						JZ_LCD_DESSIZE_WIDTH_OFFSET);
+		}
 
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 			fourcc = newstate->fb->format->format;
@@ -612,8 +657,12 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_display_info *info = &conn->display_info;
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	unsigned int cfg, rgbcfg = 0;
 
+	if (info->num_bus_formats)
+		bus_format = info->bus_formats[0];
+
 	priv->panel_is_sharp = info->bus_flags & DRM_BUS_FLAG_SHARP_SIGNALS;
 
 	if (priv->panel_is_sharp) {
@@ -623,6 +672,13 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
 	}
 
+	if (priv->soc_info->has_recover)
+		cfg |= JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;
+
+	/* CI20: set use of the 8-word descriptor and OSD foreground usage. */
+	if (priv->soc_info->hwdesc_size == sizeof(struct ingenic_dma_hwdesc_ext))
+		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
+
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
@@ -639,7 +695,7 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 			else
 				cfg |= JZ_LCD_CFG_MODE_TV_OUT_P;
 		} else {
-			switch (*info->bus_formats) {
+			switch (bus_format) {
 			case MEDIA_BUS_FMT_RGB565_1X16:
 				cfg |= JZ_LCD_CFG_MODE_GENERIC_16BIT;
 				break;
@@ -665,19 +721,23 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
 }
 
-static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
-					    struct drm_crtc_state *crtc_state,
-					    struct drm_connector_state *conn_state)
+static int
+ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
+				 struct drm_crtc_state *crtc_state,
+				 struct drm_connector_state *conn_state)
 {
 	struct drm_display_info *info = &conn_state->connector->display_info;
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 
+	switch (conn_state->connector->connector_type) {
+	case DRM_MODE_CONNECTOR_TV:
+	case DRM_MODE_CONNECTOR_HDMIA:
+		return 0;
+	}
+
 	if (info->num_bus_formats != 1)
 		return -EINVAL;
 
-	if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV)
-		return 0;
-
 	switch (*info->bus_formats) {
 	case MEDIA_BUS_FMT_RGB888_3X8:
 	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
@@ -924,7 +984,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = soc_info->max_width;
-	drm->mode_config.max_height = 4095;
+	drm->mode_config.max_height = soc_info->max_height;
 	drm->mode_config.funcs = &ingenic_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &ingenic_drm_mode_config_helpers;
 
@@ -934,6 +994,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		return PTR_ERR(base);
 	}
 
+	ingenic_drm_regmap_config.max_register = soc_info->max_reg;
 	priv->map = devm_regmap_init_mmio(dev, base,
 					  &ingenic_drm_regmap_config);
 	if (IS_ERR(priv->map)) {
@@ -966,7 +1027,6 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	if (!priv->dma_hwdescs)
 		return -ENOMEM;
 
-
 	/* Configure DMA hwdesc for foreground0 plane */
 	dma_hwdesc_phys_f0 = priv->dma_hwdescs_phys
 		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
@@ -1147,7 +1207,26 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 	/* Enable OSD if available */
 	if (soc_info->has_osd)
-		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
+		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
+
+	if (soc_info->has_alpha)
+		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_ALPHAEN);
+
+	/* Magic values from the vendor kernel for the priority thresholds. */
+	if (soc_info->has_pcfg)
+		regmap_write(priv->map, JZ_REG_LCD_PCFG,
+			     JZ_LCD_PCFG_PRI_MODE |
+			     JZ_LCD_PCFG_HP_BST_16 |
+			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
+			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
+			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));
+
+	/* RGB output control may be superfluous. */
+	if (soc_info->has_rgbc)
+		regmap_write(priv->map, JZ_REG_LCD_RGBC,
+			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
+			     JZ_LCD_RGBC_ODD_LINE_RGB |
+			     JZ_LCD_RGBC_EVEN_LINE_RGB);
 
 	mutex_init(&priv->clk_mutex);
 	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
@@ -1296,41 +1375,75 @@ static const struct jz_soc_info jz4740_soc_info = {
 	.needs_dev_clk = true,
 	.has_osd = false,
 	.map_noncoherent = false,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
+	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
 	.max_width = 800,
 	.max_height = 600,
 	.formats_f1 = jz4740_formats,
 	.num_formats_f1 = ARRAY_SIZE(jz4740_formats),
 	/* JZ4740 has only one plane */
+	.max_reg = JZ_REG_LCD_SIZE1,
 };
 
 static const struct jz_soc_info jz4725b_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
 	.map_noncoherent = false,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
+	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
 	.max_width = 800,
 	.max_height = 600,
 	.formats_f1 = jz4725b_formats_f1,
 	.num_formats_f1 = ARRAY_SIZE(jz4725b_formats_f1),
 	.formats_f0 = jz4725b_formats_f0,
 	.num_formats_f0 = ARRAY_SIZE(jz4725b_formats_f0),
+	.max_reg = JZ_REG_LCD_SIZE1,
 };
 
 static const struct jz_soc_info jz4770_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
 	.map_noncoherent = true,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
+	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
 	.max_width = 1280,
 	.max_height = 720,
 	.formats_f1 = jz4770_formats_f1,
 	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
 	.formats_f0 = jz4770_formats_f0,
 	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
+	.max_reg = JZ_REG_LCD_SIZE1,
+};
+
+static const struct jz_soc_info jz4780_soc_info = {
+	.needs_dev_clk = true,
+	.has_osd = true,
+	.has_alpha = true,
+	.has_pcfg = true,
+	.has_recover = true,
+	.has_rgbc = true,
+	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc_ext),
+	.max_width = 4096,
+	.max_height = 4096,
+	/* REVISIT: do we support formats different from jz4770? */
+	.formats_f1 = jz4770_formats_f1,
+	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
+	.formats_f0 = jz4770_formats_f0,
+	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
+	.max_reg = JZ_REG_LCD_PCFG,
 };
 
 static const struct of_device_id ingenic_drm_of_match[] = {
 	{ .compatible = "ingenic,jz4740-lcd", .data = &jz4740_soc_info },
 	{ .compatible = "ingenic,jz4725b-lcd", .data = &jz4725b_soc_info },
 	{ .compatible = "ingenic,jz4770-lcd", .data = &jz4770_soc_info },
+	{ .compatible = "ingenic,jz4780-lcd", .data = &jz4780_soc_info },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
@@ -1349,13 +1462,31 @@ static int ingenic_drm_init(void)
 {
 	int err;
 
+	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
+		err = platform_driver_register(ingenic_dw_hdmi_driver_ptr);
+		if (err)
+			return err;
+	}
+
 	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
 		err = platform_driver_register(ingenic_ipu_driver_ptr);
 		if (err)
-			return err;
+			goto err_hdmi_unreg;
 	}
 
-	return platform_driver_register(&ingenic_drm_driver);
+	err = platform_driver_register(&ingenic_drm_driver);
+	if (err)
+		goto err_ipu_unreg;
+
+	return 0;
+
+err_ipu_unreg:
+	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
+		platform_driver_unregister(ingenic_ipu_driver_ptr);
+err_hdmi_unreg:
+	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI))
+		platform_driver_unregister(ingenic_dw_hdmi_driver_ptr);
+	return err;
 }
 module_init(ingenic_drm_init);
 
@@ -1363,6 +1494,8 @@ static void ingenic_drm_exit(void)
 {
 	platform_driver_unregister(&ingenic_drm_driver);
 
+	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI))
+		platform_driver_unregister(ingenic_dw_hdmi_driver_ptr);
 	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
 		platform_driver_unregister(ingenic_ipu_driver_ptr);
 }
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
index 22654ac1dde1c..7e55a88243e28 100644
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
 
@@ -176,6 +182,51 @@
 #define JZ_LCD_SIZE01_WIDTH_LSB			0
 #define JZ_LCD_SIZE01_HEIGHT_LSB		16
 
+#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
+#define JZ_LCD_DESSIZE_HEIGHT_OFFSET		12
+#define JZ_LCD_DESSIZE_WIDTH_OFFSET		0
+#define JZ_LCD_DESSIZE_HEIGHT_MASK		0xfff
+#define JZ_LCD_DESSIZE_WIDTH_MASK		0xfff
+
+/* TODO: 4,5 and 7 match the above BPP */
+#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
+#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
+#define JZ_LCD_CPOS_BPP_30			(7 << 27)
+#define JZ_LCD_CPOS_RGB555			BIT(30)
+#define JZ_LCD_CPOS_PREMULTIPLY_LCD		BIT(26)
+#define JZ_LCD_CPOS_COEFFICIENT_OFFSET		24
+
+#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
+#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
+#define JZ_LCD_RGBC_422				BIT(8)
+#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
+#define JZ_LCD_RGBC_ODD_LINE_MASK		(0x7 << 4)
+#define JZ_LCD_RGBC_ODD_LINE_RGB		(0 << 4)
+#define JZ_LCD_RGBC_ODD_LINE_RBG		(1 << 4)
+#define JZ_LCD_RGBC_ODD_LINE_GRB		(2 << 4)
+#define JZ_LCD_RGBC_ODD_LINE_GBR		(3 << 4)
+#define JZ_LCD_RGBC_ODD_LINE_BRG		(4 << 4)
+#define JZ_LCD_RGBC_ODD_LINE_BGR		(5 << 4)
+#define JZ_LCD_RGBC_EVEN_LINE_MASK		(0x7 << 0)
+#define JZ_LCD_RGBC_EVEN_LINE_RGB		0
+#define JZ_LCD_RGBC_EVEN_LINE_RBG		1
+#define JZ_LCD_RGBC_EVEN_LINE_GRB		2
+#define JZ_LCD_RGBC_EVEN_LINE_GBR		3
+#define JZ_LCD_RGBC_EVEN_LINE_BRG		4
+#define JZ_LCD_RGBC_EVEN_LINE_BGR		5
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
@@ -187,5 +238,6 @@ void ingenic_drm_plane_disable(struct device *dev, struct drm_plane *plane);
 bool ingenic_drm_map_noncoherent(const struct device *dev);
 
 extern struct platform_driver *ingenic_ipu_driver_ptr;
+extern struct platform_driver *ingenic_dw_hdmi_driver_ptr;
 
 #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
-- 
2.31.1

