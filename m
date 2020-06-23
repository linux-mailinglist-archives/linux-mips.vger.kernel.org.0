Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6782064D8
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 23:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389363AbgFWV2e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 17:28:34 -0400
Received: from mail6.webfaction.com ([31.170.123.134]:33630 "EHLO
        smtp.webfaction.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391052AbgFWV23 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jun 2020 17:28:29 -0400
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
        by smtp.webfaction.com (Postfix) with ESMTPSA id 30CE16002D5F0;
        Tue, 23 Jun 2020 21:28:28 +0000 (UTC)
From:   Paul Boddie <paul@boddie.org.uk>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: JZ4780 LCD controller initialisation (was Re: [PATCH] clocksource: Ingenic: Add high resolution timer support for SMP.)
Date:   Tue, 23 Jun 2020 23:28:17 +0200
Message-ID: <1649131.CzUY014Fir@jason>
In-Reply-To: <T8OYAQ.3TE69K2DB79Z2@crapouillou.net>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com> <6095840.Tg7rQzGjE8@jeremy> <T8OYAQ.3TE69K2DB79Z2@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1871479.ccVFjyGrhW"
Content-Transfer-Encoding: 7Bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart1871479.ccVFjyGrhW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 27 May 2020 01:07:41 CEST Paul Cercueil wrote:
> 
> Don't focus too much on interrupts right now. You don't get interrupts
> because the data is not flowing. Which in turns is caused either by the
> LCDC not being correctly configured, or the HDMI not sending
> hsync/vsync signals.
> 
> For now, what seems to be the problem is that the DMA descriptors
> aren't loaded properly. Whatever I do, the debug registers
> (LCDSAx/LCDIDx/etc) are still zero here.

So, as I may have mentioned already, I got the LCD controller and HDMI 
peripheral working in a simple L4Re-based configuration, verifying a working 
configuration of the LCD controller. Since then, I have been trying to build 
working Linux drivers with this knowledge.

At the moment, I can indeed get the LCDC to start and to produce end-of-frame 
interrupts which are counted by the DRM framework. However, my current problem 
to solve is how to get anything other than "Input not supported" from my 
monitor.

I have pursuing the laborious process of verifying the HDMI register settings, 
which is rather perverse given that my L4Re code effectively takes the 
simplified logic of the HDMI driver (plus my JZ4780 specialisations) and works 
fine. So, I am trying to reproduce the configuration of something that should 
already work from my clone of that same thing.

One thing that was in dispute before was the matter of the input bus formats. 
It is definitely the case that the Ingenic driver will never see any format 
information based on what the Synopsys driver does. I don't know whether the 
DRM framework is supposed to magically propagate the information, but as of 
right now it just doesn't.

Currently, I hack the display information's input bus format in the bridge 
driver's atomic_check function along with bus flags that I also think are 
needed. Setting the format enables the Ingenic DRM driver to start up. For 
some reason, the signal over the cable cannot be handled by the monitor.

Anyway, I have included the Ingenic DRM driver patch along with the Synopsys 
driver hack and a patch adding the specialised driver, all of which apply 
against v5.8-rc1 of torvalds/linux, so that they might be inspected. I hope 
that some additional insight can move things forward. Debugging this in the 
Linux environment is particularly tiresome.

Regards,

Paul
--nextPart1871479.ccVFjyGrhW
Content-Disposition: attachment; filename="ingenic-drm.c-jz4780.diff"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="ingenic-drm.c-jz4780.diff"

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 55b49a31729b..41974ab13e02 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -3,6 +3,7 @@
 // Ingenic JZ47xx KMS driver
 //
 // Copyright (C) 2019, Paul Cercueil <paul@crapouillou.net>
+// Copyright (C) 2020 Paul Boddie <paul@boddie.org.uk>
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
@@ -53,8 +54,17 @@
 #define JZ_REG_LCD_SA1				0x54
 #define JZ_REG_LCD_FID1				0x58
 #define JZ_REG_LCD_CMD1				0x5C
+#define JZ_REG_LCD_RGBC				0x90
+#define JZ_REG_LCD_OSDC				0x100
+#define JZ_REG_LCD_OSDCTRL			0x104
+#define JZ_REG_LCD_OSDS				0x108
+#define JZ_REG_LCD_PCFG				0x2c0
 
 #define JZ_LCD_CFG_SLCD				BIT(31)
+#define JZ_LCD_CFG_TV_PAL_HALFLINE_ENABLE	BIT(30)
+#define JZ_LCD_CFG_DESCRIPTOR_8			BIT(28)
+#define JZ_LCD_CFG_TV_ENABLE			BIT(26)
+#define JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN	BIT(25)
 #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
 #define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
 #define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
@@ -72,6 +82,7 @@
 #define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
 #define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
 #define JZ_LCD_CFG_18_BIT			BIT(7)
+#define JZ_LCD_CFG_24_BIT			BIT(6)
 #define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
 
 #define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
@@ -111,6 +122,9 @@
 #define JZ_LCD_CTRL_BURST_4			(0x0 << 28)
 #define JZ_LCD_CTRL_BURST_8			(0x1 << 28)
 #define JZ_LCD_CTRL_BURST_16			(0x2 << 28)
+#define JZ_LCD_CTRL_BURST_32			(0x3 << 28)
+#define JZ_LCD_CTRL_BURST_64			(0x4 << 28)
+#define JZ_LCD_CTRL_BURST_MASK			(0x7 << 28)
 #define JZ_LCD_CTRL_RGB555			BIT(27)
 #define JZ_LCD_CTRL_OFUP			BIT(26)
 #define JZ_LCD_CTRL_FRC_GRAYSCALE_16		(0x0 << 24)
@@ -139,6 +153,7 @@
 #define JZ_LCD_CMD_SOF_IRQ			BIT(31)
 #define JZ_LCD_CMD_EOF_IRQ			BIT(30)
 #define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
+#define JZ_LCD_CMD_FRM_ENABLE			BIT(26)
 
 #define JZ_LCD_SYNC_MASK			0x3ff
 
@@ -146,6 +161,52 @@
 #define JZ_LCD_STATE_SOF_IRQ			BIT(4)
 #define JZ_LCD_STATE_DISABLED			BIT(0)
 
+#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
+#define JZ_LCD_DESSIZE_HEIGHT_OFFSET		12
+#define JZ_LCD_DESSIZE_WIDTH_OFFSET		0
+#define JZ_LCD_DESSIZE_HEIGHT_MASK		0xfff
+#define JZ_LCD_DESSIZE_WIDTH_MASK		0xfff
+
+#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
+#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
+#define JZ_LCD_CPOS_BPP_30			(7 << 27)
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
+#define JZ_REG_LCD_OSDC_ALPHA_ENABLE		BIT(2)
+#define JZ_REG_LCD_OSDC_ENABLE			BIT(0)
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
 struct ingenic_dma_hwdesc {
 	u32 next;
 	u32 addr;
@@ -153,8 +214,25 @@ struct ingenic_dma_hwdesc {
 	u32 cmd;
 } __packed;
 
+struct ingenic_dma_hwdesc_extended_fields {
+	u32 offsize;
+	u32 pagewidth;
+	u32 cpos;
+	u32 dessize;
+} __packed;
+
+struct ingenic_dma_hwdesc_extended {
+	struct ingenic_dma_hwdesc base;
+	struct ingenic_dma_hwdesc_extended_fields extra;
+} __packed;
+
 struct jz_soc_info {
 	bool needs_dev_clk;
+	bool has_pcfg;
+	bool has_recover;
+	bool has_rgbc;
+	u32 dma_hwdesc_size;
+	int num_descriptors;
 	unsigned int max_width, max_height;
 };
 
@@ -169,7 +247,7 @@ struct ingenic_drm {
 	struct clk *lcd_clk, *pix_clk;
 	const struct jz_soc_info *soc_info;
 
-	struct ingenic_dma_hwdesc *dma_hwdesc;
+	struct ingenic_dma_hwdesc *dma_hwdesc[2];
 	dma_addr_t dma_hwdesc_phys;
 
 	bool panel_is_sharp;
@@ -179,6 +257,7 @@ static const u32 ingenic_drm_primary_formats[] = {
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ABGR8888,
 };
 
 static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
@@ -202,7 +281,7 @@ static const struct regmap_config ingenic_drm_regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 
-	.max_register = JZ_REG_LCD_CMD1,
+	.max_register = JZ_REG_LCD_PCFG,
 	.writeable_reg = ingenic_drm_writeable_reg,
 };
 
@@ -304,6 +383,9 @@ static void ingenic_drm_crtc_update_ctrl(struct ingenic_drm *priv,
 {
 	unsigned int ctrl = JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16;
 
+	/* NOTE: This does not have the intended effect on JZ4780 since the
+		 pixel depth of each frame is set in the descriptors. */
+
 	switch (finfo->format) {
 	case DRM_FORMAT_XRGB1555:
 		ctrl |= JZ_LCD_CTRL_RGB555;
@@ -319,6 +401,30 @@ static void ingenic_drm_crtc_update_ctrl(struct ingenic_drm *priv,
 	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
 			   JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16 |
 			   JZ_LCD_CTRL_BPP_MASK, ctrl);
+
+	/* "Magic values" from the 3.18 kernel for the priority thresholds. */
+	if (priv->soc_info->has_pcfg)
+		regmap_write(priv->map, JZ_REG_LCD_PCFG,
+			     JZ_LCD_PCFG_PRI_MODE |
+			     JZ_LCD_PCFG_HP_BST_16 |
+			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
+			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
+			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));
+
+	/* RGB output control may be superfluous. */
+	if (priv->soc_info->has_rgbc)
+		regmap_write(priv->map, JZ_REG_LCD_RGBC,
+			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
+			     JZ_LCD_RGBC_ODD_LINE_RGB |
+			     JZ_LCD_RGBC_EVEN_LINE_RGB);
+
+	/* OSD settings for extended descriptor definitions. */
+	if (priv->soc_info->dma_hwdesc_size == sizeof(struct ingenic_dma_hwdesc_extended))
+	{
+		regmap_write(priv->map, JZ_REG_LCD_OSDC,
+			     JZ_REG_LCD_OSDC_ALPHA_ENABLE |
+			     JZ_REG_LCD_OSDC_ENABLE);
+	}
 }
 
 static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
@@ -350,6 +456,7 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct drm_pending_vblank_event *event = state->event;
 	struct drm_framebuffer *drm_fb = crtc->primary->state->fb;
 	const struct drm_format_info *finfo;
+	int num;
 
 	if (drm_atomic_crtc_needs_modeset(state)) {
 		finfo = drm_format_info(drm_fb->format->format);
@@ -359,7 +466,10 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 
 		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
 
-		regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc->next);
+		/* Initialise up to two descriptor address registers. */
+		for (num = 0; num < priv->soc_info->num_descriptors; num++)
+			regmap_write(priv->map, !num ? JZ_REG_LCD_DA0 : JZ_REG_LCD_DA1,
+				     priv->dma_hwdesc[num]->next);
 	}
 
 	if (event) {
@@ -374,6 +484,48 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	}
 }
 
+static void ingenic_drm_descriptor_init(struct ingenic_drm *priv, int num,
+					unsigned int width,
+					unsigned int height,
+					unsigned int cpp,
+					u32 addr)
+{
+	struct ingenic_dma_hwdesc *hwdesc = priv->dma_hwdesc[num];
+	struct ingenic_dma_hwdesc_extended *hwdesc_ext;
+
+	/* Chain the descriptor to itself. */
+	hwdesc->next = priv->dma_hwdesc_phys +
+		       num * priv->soc_info->dma_hwdesc_size;
+
+	hwdesc->id = 0xfeed0000 | num;
+	hwdesc->addr = addr;
+	hwdesc->cmd = width * height * cpp / 4;
+	hwdesc->cmd |= JZ_LCD_CMD_EOF_IRQ;
+
+	/* CI20 initialisation. */
+	if (priv->soc_info->dma_hwdesc_size == sizeof(struct ingenic_dma_hwdesc_extended))
+	{
+		/* Enable only the first descriptor's frame. */
+		if (!num)
+			hwdesc->cmd |= JZ_LCD_CMD_FRM_ENABLE;
+
+		hwdesc_ext = (struct ingenic_dma_hwdesc_extended *) hwdesc;
+		hwdesc_ext->extra.offsize = 0;
+		hwdesc_ext->extra.pagewidth = 0;
+
+		hwdesc_ext->extra.cpos = JZ_LCD_CPOS_BPP_18_24 |
+					 JZ_LCD_CPOS_PREMULTIPLY_LCD |
+					 (3 << JZ_LCD_CPOS_COEFFICIENT_OFFSET);
+
+		hwdesc_ext->extra.dessize =
+			(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
+			(((height - 1) & JZ_LCD_DESSIZE_HEIGHT_MASK) <<
+					 JZ_LCD_DESSIZE_HEIGHT_OFFSET) |
+			(((width - 1) & JZ_LCD_DESSIZE_WIDTH_MASK) <<
+					JZ_LCD_DESSIZE_WIDTH_OFFSET);
+	}
+}
+
 static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_plane_state *oldstate)
 {
@@ -381,6 +533,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *state = plane->state;
 	unsigned int width, height, cpp;
 	dma_addr_t addr;
+	int num;
 
 	if (state && state->fb) {
 		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
@@ -388,9 +541,8 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 		height = state->src_h >> 16;
 		cpp = state->fb->format->cpp[plane->index];
 
-		priv->dma_hwdesc->addr = addr;
-		priv->dma_hwdesc->cmd = width * height * cpp / 4;
-		priv->dma_hwdesc->cmd |= JZ_LCD_CMD_EOF_IRQ;
+		for (num = 0; num < priv->soc_info->num_descriptors; num++)
+			ingenic_drm_descriptor_init(priv, num, width, height, cpp, addr);
 	}
 }
 
@@ -413,6 +565,13 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
 	}
 
+	if (priv->soc_info->has_recover)
+		cfg |= JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;
+
+	/* CI20: set use of the 8-word descriptor and OSD foreground usage. */
+	if (priv->soc_info->dma_hwdesc_size == sizeof(struct ingenic_dma_hwdesc_extended))
+		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
+
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
@@ -584,12 +743,33 @@ static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static void ingenic_drm_free_dma_hwdesc(void *d)
+static int ingenic_drm_allocate_descriptors(struct ingenic_drm *priv)
+{
+	int num;
+
+	priv->dma_hwdesc[0] = dma_alloc_coherent(priv->dev,
+						 priv->soc_info->num_descriptors
+						 * priv->soc_info->dma_hwdesc_size,
+						 &priv->dma_hwdesc_phys,
+						 GFP_KERNEL);
+	if (!priv->dma_hwdesc[0])
+		return -ENOMEM;
+
+	for (num = 1; num < priv->soc_info->num_descriptors; num++)
+		priv->dma_hwdesc[num] = (struct ingenic_dma_hwdesc *)
+					((u32) priv->dma_hwdesc[0] +
+					num * priv->soc_info->dma_hwdesc_size);
+
+	return 0;
+}
+
+static void ingenic_drm_free_descriptors(void *d)
 {
 	struct ingenic_drm *priv = d;
 
-	dma_free_coherent(priv->dev, sizeof(*priv->dma_hwdesc),
-			  priv->dma_hwdesc, priv->dma_hwdesc_phys);
+	dma_free_coherent(priv->dev, priv->soc_info->num_descriptors
+				     * priv->soc_info->dma_hwdesc_size,
+			  priv->dma_hwdesc[0], priv->dma_hwdesc_phys);
 }
 
 static int ingenic_drm_probe(struct platform_device *pdev)
@@ -674,19 +854,13 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		bridge = devm_drm_panel_bridge_add_typed(dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
 
-	priv->dma_hwdesc = dma_alloc_coherent(dev, sizeof(*priv->dma_hwdesc),
-					      &priv->dma_hwdesc_phys,
-					      GFP_KERNEL);
-	if (!priv->dma_hwdesc)
+	if (ingenic_drm_allocate_descriptors(priv))
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, ingenic_drm_free_dma_hwdesc, priv);
+	ret = devm_add_action_or_reset(dev, ingenic_drm_free_descriptors, priv);
 	if (ret)
 		return ret;
 
-	priv->dma_hwdesc->next = priv->dma_hwdesc_phys;
-	priv->dma_hwdesc->id = 0xdeafbead;
-
 	drm_plane_helper_add(&priv->primary, &ingenic_drm_plane_helper_funcs);
 
 	ret = drm_universal_plane_init(drm, &priv->primary,
@@ -802,26 +976,53 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 
 static const struct jz_soc_info jz4740_soc_info = {
 	.needs_dev_clk = true,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
+	.dma_hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
+	.num_descriptors = 1,
 	.max_width = 800,
 	.max_height = 600,
 };
 
 static const struct jz_soc_info jz4725b_soc_info = {
 	.needs_dev_clk = false,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
+	.dma_hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
+	.num_descriptors = 1,
 	.max_width = 800,
 	.max_height = 600,
 };
 
 static const struct jz_soc_info jz4770_soc_info = {
 	.needs_dev_clk = false,
+	.has_pcfg = false,
+	.has_recover = false,
+	.has_rgbc = false,
+	.dma_hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
+	.num_descriptors = 1,
 	.max_width = 1280,
 	.max_height = 720,
 };
 
+static const struct jz_soc_info jz4780_soc_info = {
+	.needs_dev_clk = true,
+	.has_pcfg = true,
+	.has_recover = true,
+	.has_rgbc = true,
+	.dma_hwdesc_size = sizeof(struct ingenic_dma_hwdesc_extended),
+	.num_descriptors = 2,
+	.max_width = 4096,
+	.max_height = 4096,
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
@@ -837,5 +1038,6 @@ static struct platform_driver ingenic_drm_driver = {
 module_platform_driver(ingenic_drm_driver);
 
 MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
+MODULE_AUTHOR("Paul Boddie <paul@boddie.org.uk>");
 MODULE_DESCRIPTION("DRM driver for the Ingenic SoCs\n");
 MODULE_LICENSE("GPL v2");

--nextPart1871479.ccVFjyGrhW
Content-Disposition: attachment; filename="dw-hdmi.c-bus_hack_jz4780.diff"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="dw-hdmi.c-bus_hack_jz4780.diff"

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 30681398cfb0..089250c81fd5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2690,6 +2690,7 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_connector_state *conn_state)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct drm_display_info *info = &conn_state->connector->display_info;
 
 	hdmi->hdmi_data.enc_out_bus_format =
 			bridge_state->output_bus_cfg.format;
@@ -2701,6 +2702,11 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
 		bridge_state->input_bus_cfg.format,
 		bridge_state->output_bus_cfg.format);
 
+	/* NOTE: Propagate the bus format to the display info. */
+	drm_display_info_set_bus_formats(info, &bridge_state->input_bus_cfg.format, 1);
+	/* NOTE: Set the bus flags for the LCD controller output. */
+	info->bus_flags |= DRM_BUS_FLAG_PIXDATA_NEGEDGE;
+
 	return 0;
 }
 

--nextPart1871479.ccVFjyGrhW
Content-Disposition: attachment; filename="dw_hdmi-jz4780.c-new_driver.diff"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="dw_hdmi-jz4780.c-new_driver.diff"

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index d82c3d37ec9c..44bfd0d35af1 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -14,3 +14,11 @@ config DRM_INGENIC
 	  Choose this option for DRM support for the Ingenic SoCs.
 
 	  If M is selected the module will be called ingenic-drm.
+
+config DRM_DW_HDMI_JZ4780
+	tristate "HDMI Support for Ingenic JZ4780"
+	depends on DRM_INGENIC
+	depends on OF
+	select DRM_DW_HDMI
+	help
+	  Choose this option for HDMI output from the Ingenic JZ4780.
diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
index 11cac42ce0bb..238383de63c7 100644
--- a/drivers/gpu/drm/ingenic/Makefile
+++ b/drivers/gpu/drm/ingenic/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
+obj-$(CONFIG_DRM_DW_HDMI_JZ4780) += dw_hdmi-jz4780.o
diff --git a/drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c b/drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c
new file mode 100644
index 000000000000..8e4e316183ef
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
+ * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
+ *
+ * Derived from dw_hdmi-imx.c with i.MX portions removed.
+ * Probe and remove operations derived from rcar_dw_hdmi.c.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_of.h>
+
+static const struct dw_hdmi_mpll_config jz4780_mpll_cfg[] = {
+	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 0x0000 } } },
+	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, 0x0005 } } },
+	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, 0x000a } } },
+	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, 0x000f } } },
+	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 } } }
+};
+
+static const struct dw_hdmi_curr_ctrl jz4780_cur_ctr[] = {
+	/*pixelclk     bpp8    bpp10   bpp12 */
+	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
+	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
+	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
+	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
+	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
+	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
+	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
+};
+
+/*
+ * Resistance term 133Ohm Cfg
+ * PREEMP config 0.00
+ * TX/CK level 10
+ */
+static const struct dw_hdmi_phy_config jz4780_phy_config[] = {
+	/*pixelclk   symbol   term   vlev */
+	{ 216000000, 0x800d, 0x0005, 0x01ad},
+	{ ~0UL,      0x0000, 0x0000, 0x0000}
+};
+
+static enum drm_mode_status
+jz4780_hdmi_mode_valid(struct drm_connector *con,
+		       const struct drm_display_mode *mode)
+{
+	if (mode->clock < 13500)
+		return MODE_CLOCK_LOW;
+	/* FIXME: Hardware is capable of 270MHz, but setup data is missing. */
+	if (mode->clock > 216000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static struct dw_hdmi_plat_data jz4780_dw_hdmi_plat_data = {
+	.mpll_cfg   = jz4780_mpll_cfg,
+	.cur_ctr    = jz4780_cur_ctr,
+	.phy_config = jz4780_phy_config,
+	.mode_valid = jz4780_hdmi_mode_valid,
+};
+
+static const struct of_device_id jz4780_dw_hdmi_dt_ids[] = {
+	{ .compatible = "ingenic,jz4780-dw-hdmi" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, jz4780_dw_hdmi_dt_ids);
+
+static int jz4780_dw_hdmi_probe(struct platform_device *pdev)
+{
+        struct dw_hdmi *hdmi;
+
+        hdmi = dw_hdmi_probe(pdev, &jz4780_dw_hdmi_plat_data);
+        if (IS_ERR(hdmi))
+                return PTR_ERR(hdmi);
+
+        platform_set_drvdata(pdev, hdmi);
+
+        return 0;
+}
+
+static int jz4780_dw_hdmi_remove(struct platform_device *pdev)
+{
+        struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
+
+        dw_hdmi_remove(hdmi);
+
+        return 0;
+}
+
+static struct platform_driver jz4780_dw_hdmi_platform_driver = {
+	.probe  = jz4780_dw_hdmi_probe,
+	.remove = jz4780_dw_hdmi_remove,
+	.driver = {
+		.name = "dw-hdmi-jz4780",
+		.of_match_table = jz4780_dw_hdmi_dt_ids,
+	},
+};
+
+module_platform_driver(jz4780_dw_hdmi_platform_driver);
+
+MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
+MODULE_AUTHOR("Yakir Yang <ykk@rock-chips.com>");
+MODULE_AUTHOR("Paul Boddie <paul@boddie.org.uk>");
+MODULE_DESCRIPTION("Ingenic JZ4780 DW-HDMI Driver Extension");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:dw-hdmi-jz4780");

--nextPart1871479.ccVFjyGrhW--



