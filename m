Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013E941AC03
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 11:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239966AbhI1JhS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 28 Sep 2021 05:37:18 -0400
Received: from aposti.net ([89.234.176.197]:48646 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239724AbhI1JhP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 05:37:15 -0400
Date:   Tue, 28 Sep 2021 10:35:12 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 02/10] drm/ingenic: Add support for JZ4780 and HDMI
 output
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Message-Id: <OA150R.JLKJBJP8V7FJ2@crapouillou.net>
In-Reply-To: <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
        <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus / Paul,

Le lun., sept. 27 2021 at 18:44:20 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a �crit :
> From: Paul Boddie <paul@boddie.org.uk>
> 
> Add support for the LCD controller present on JZ4780 SoCs.
> This SoC uses 8-byte descriptors which extend the current
> 4-byte descriptors used for other Ingenic SoCs.
> 
> Tested on MIPS Creator CI20 board.
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 85 
> +++++++++++++++++++++--
>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 42 +++++++++++
>  2 files changed, 122 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index f73522bdacaa..e2df4b085905 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -6,6 +6,7 @@
> 
>  #include "ingenic-drm.h"
> 
> +#include <linux/bitfield.h>
>  #include <linux/component.h>
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
> @@ -49,6 +50,11 @@ struct ingenic_dma_hwdesc {
>  	u32 addr;
>  	u32 id;
>  	u32 cmd;
> +	/* extended hw descriptor for jz4780 */
> +	u32 offsize;
> +	u32 pagewidth;
> +	u32 cpos;
> +	u32 dessize;
>  } __aligned(16);
> 
>  struct ingenic_dma_hwdescs {
> @@ -60,9 +66,11 @@ struct jz_soc_info {
>  	bool needs_dev_clk;
>  	bool has_osd;
>  	bool map_noncoherent;
> +	bool use_extended_hwdesc;
>  	unsigned int max_width, max_height;
>  	const u32 *formats_f0, *formats_f1;
>  	unsigned int num_formats_f0, num_formats_f1;
> +	unsigned int max_reg;
>  };
> 
>  struct ingenic_drm_private_state {
> @@ -168,12 +176,11 @@ static bool ingenic_drm_writeable_reg(struct 
> device *dev, unsigned int reg)
>  	}
>  }
> 
> -static const struct regmap_config ingenic_drm_regmap_config = {
> +static struct regmap_config ingenic_drm_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
>  	.reg_stride = 4,
> 
> -	.max_register = JZ_REG_LCD_SIZE1,
>  	.writeable_reg = ingenic_drm_writeable_reg,
>  };
> 
> @@ -663,6 +670,37 @@ static void 
> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
>  		hwdesc->next = dma_hwdesc_addr(priv, next_id);
> 
> +		if (priv->soc_info->use_extended_hwdesc) {
> +			hwdesc->cmd |= JZ_LCD_CMD_FRM_ENABLE;
> +
> +			/* Extended 8-byte descriptor */
> +			hwdesc->cpos = 0;
> +			hwdesc->offsize = 0;
> +			hwdesc->pagewidth = 0;
> +
> +			switch (newstate->fb->format->format) {
> +			case DRM_FORMAT_XRGB1555:
> +				hwdesc->cpos |= JZ_LCD_CPOS_RGB555;
> +				fallthrough;
> +			case DRM_FORMAT_RGB565:
> +				hwdesc->cpos |= JZ_LCD_CPOS_BPP_15_16;
> +				break;
> +			case DRM_FORMAT_XRGB8888:
> +				hwdesc->cpos |= JZ_LCD_CPOS_BPP_18_24;
> +				break;
> +			}
> +			hwdesc->cpos |= JZ_LCD_CPOS_PREMULTIPLY_LCD |
> +					    (JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
> +					     JZ_LCD_CPOS_COEFFICIENT_OFFSET);
> +
> +			hwdesc->dessize =
> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
> +				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK <<
> +					   JZ_LCD_DESSIZE_HEIGHT_OFFSET, height - 1) |
> +				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK <<
> +					   JZ_LCD_DESSIZE_WIDTH_OFFSET, width - 1);
> +		}
> +
>  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  			fourcc = newstate->fb->format->format;
> 
> @@ -694,6 +732,10 @@ static void 
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>  	}
> 
> +	/* set use of the 8-word descriptor and OSD foreground usage. */
> +	if (priv->soc_info->use_extended_hwdesc)
> +		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
> +
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>  		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> @@ -1010,6 +1052,7 @@ static int ingenic_drm_bind(struct device *dev, 
> bool has_components)
>  	struct drm_encoder *encoder;
>  	struct ingenic_drm_bridge *ib;
>  	struct drm_device *drm;
> +	struct regmap_config regmap_config;
>  	void __iomem *base;
>  	long parent_rate;
>  	unsigned int i, clone_mask = 0;
> @@ -1063,8 +1106,10 @@ static int ingenic_drm_bind(struct device 
> *dev, bool has_components)
>  		return PTR_ERR(base);
>  	}
> 
> +	regmap_config = ingenic_drm_regmap_config;
> +	regmap_config.max_register = soc_info->max_reg;
>  	priv->map = devm_regmap_init_mmio(dev, base,
> -					  &ingenic_drm_regmap_config);
> +					  &regmap_config);

Could you split the code that makes .max_reg configurable per-SoC into 
its own patch?

>  	if (IS_ERR(priv->map)) {
>  		dev_err(dev, "Failed to create regmap\n");
>  		return PTR_ERR(priv->map);
> @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct device *dev, 
> bool has_components)
> 
>  	/* Enable OSD if available */
>  	if (soc_info->has_osd)
> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);

Why?

> 
>  	mutex_init(&priv->clk_mutex);
>  	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
> @@ -1444,6 +1489,7 @@ static const struct jz_soc_info jz4740_soc_info 
> = {
>  	.formats_f1 = jz4740_formats,
>  	.num_formats_f1 = ARRAY_SIZE(jz4740_formats),
>  	/* JZ4740 has only one plane */
> +	.max_reg = JZ_REG_LCD_SIZE1,
>  };
> 
>  static const struct jz_soc_info jz4725b_soc_info = {
> @@ -1456,6 +1502,7 @@ static const struct jz_soc_info 
> jz4725b_soc_info = {
>  	.num_formats_f1 = ARRAY_SIZE(jz4725b_formats_f1),
>  	.formats_f0 = jz4725b_formats_f0,
>  	.num_formats_f0 = ARRAY_SIZE(jz4725b_formats_f0),
> +	.max_reg = JZ_REG_LCD_SIZE1,
>  };
> 
>  static const struct jz_soc_info jz4770_soc_info = {
> @@ -1468,12 +1515,28 @@ static const struct jz_soc_info 
> jz4770_soc_info = {
>  	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
>  	.formats_f0 = jz4770_formats_f0,
>  	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
> +	.max_reg = JZ_REG_LCD_SIZE1,
> +};
> +
> +static const struct jz_soc_info jz4780_soc_info = {
> +	.needs_dev_clk = true,
> +	.has_osd = true,
> +	.use_extended_hwdesc = true,
> +	.max_width = 4096,
> +	.max_height = 2048,
> +	/* REVISIT: do we support formats different from jz4770? */
> +	.formats_f1 = jz4770_formats_f1,
> +	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
> +	.formats_f0 = jz4770_formats_f0,
> +	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
> +	.max_reg = JZ_REG_LCD_PCFG,
>  };
> 
>  static const struct of_device_id ingenic_drm_of_match[] = {
>  	{ .compatible = "ingenic,jz4740-lcd", .data = &jz4740_soc_info },
>  	{ .compatible = "ingenic,jz4725b-lcd", .data = &jz4725b_soc_info },
>  	{ .compatible = "ingenic,jz4770-lcd", .data = &jz4770_soc_info },
> +	{ .compatible = "ingenic,jz4780-lcd", .data = &jz4780_soc_info },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
> @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>  {
>  	int err;
> 
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
> +		err = platform_driver_register(ingenic_dw_hdmi_driver_ptr);
> +		if (err)
> +			return err;
> +	}

I don't see why you need to register the ingenic-dw-hdmi driver here. 
Just register it in the ingenic-dw-hdmi driver.

Cheers,
-Paul

> +
>  	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
>  		err = platform_driver_register(ingenic_ipu_driver_ptr);
>  		if (err)
> -			return err;
> +			goto err_hdmi_unreg;
>  	}
> 
>  	err = platform_driver_register(&ingenic_drm_driver);
> @@ -1507,6 +1576,10 @@ static int ingenic_drm_init(void)
>  err_ipu_unreg:
>  	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
>  		platform_driver_unregister(ingenic_ipu_driver_ptr);
> +err_hdmi_unreg:
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI))
> +		platform_driver_unregister(ingenic_dw_hdmi_driver_ptr);
> +
>  	return err;
>  }
>  module_init(ingenic_drm_init);
> @@ -1515,6 +1588,8 @@ static void ingenic_drm_exit(void)
>  {
>  	platform_driver_unregister(&ingenic_drm_driver);
> 
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI))
> +		platform_driver_unregister(ingenic_dw_hdmi_driver_ptr);
>  	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
>  		platform_driver_unregister(ingenic_ipu_driver_ptr);
>  }
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h 
> b/drivers/gpu/drm/ingenic/ingenic-drm.h
> index 22654ac1dde1..13dbc5d25c3b 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
> @@ -44,8 +44,11 @@
>  #define JZ_REG_LCD_XYP1				0x124
>  #define JZ_REG_LCD_SIZE0			0x128
>  #define JZ_REG_LCD_SIZE1			0x12c
> +#define JZ_REG_LCD_PCFG				0x2c0
> 
>  #define JZ_LCD_CFG_SLCD				BIT(31)
> +#define JZ_LCD_CFG_DESCRIPTOR_8			BIT(28)
> +#define JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN	BIT(25)
>  #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
>  #define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
>  #define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
> @@ -63,6 +66,7 @@
>  #define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
>  #define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
>  #define JZ_LCD_CFG_18_BIT			BIT(7)
> +#define JZ_LCD_CFG_24_BIT			BIT(6)
>  #define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
> 
>  #define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
> @@ -132,6 +136,7 @@
>  #define JZ_LCD_CMD_SOF_IRQ			BIT(31)
>  #define JZ_LCD_CMD_EOF_IRQ			BIT(30)
>  #define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
> +#define JZ_LCD_CMD_FRM_ENABLE			BIT(26)
> 
>  #define JZ_LCD_SYNC_MASK			0x3ff
> 
> @@ -153,6 +158,7 @@
>  #define JZ_LCD_RGBC_EVEN_BGR			(0x5 << 0)
> 
>  #define JZ_LCD_OSDC_OSDEN			BIT(0)
> +#define JZ_LCD_OSDC_ALPHAEN			BIT(2)
>  #define JZ_LCD_OSDC_F0EN			BIT(3)
>  #define JZ_LCD_OSDC_F1EN			BIT(4)
> 
> @@ -176,6 +182,41 @@
>  #define JZ_LCD_SIZE01_WIDTH_LSB			0
>  #define JZ_LCD_SIZE01_HEIGHT_LSB		16
> 
> +#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
> +#define JZ_LCD_DESSIZE_HEIGHT_OFFSET		12
> +#define JZ_LCD_DESSIZE_WIDTH_OFFSET		0
> +#define JZ_LCD_DESSIZE_HEIGHT_MASK		0xfff
> +#define JZ_LCD_DESSIZE_WIDTH_MASK		0xfff
> +
> +/* TODO: 4,5 and 7 match the above BPP */
> +#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
> +#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
> +#define JZ_LCD_CPOS_BPP_30			(7 << 27)
> +#define JZ_LCD_CPOS_RGB555			BIT(30)
> +#define JZ_LCD_CPOS_PREMULTIPLY_LCD		BIT(26)
> +#define JZ_LCD_CPOS_COEFFICIENT_OFFSET		24
> +#define JZ_LCD_CPOS_COEFFICIENT_0		0
> +#define JZ_LCD_CPOS_COEFFICIENT_1		1
> +#define JZ_LCD_CPOS_COEFFICIENT_ALPHA1		2
> +#define JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1	3
> +
> +#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
> +#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
> +#define JZ_LCD_RGBC_422				BIT(8)
> +#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
> +
> +#define JZ_LCD_PCFG_PRI_MODE			BIT(31)
> +#define JZ_LCD_PCFG_HP_BST_4			(0 << 28)
> +#define JZ_LCD_PCFG_HP_BST_8			(1 << 28)
> +#define JZ_LCD_PCFG_HP_BST_16			(2 << 28)
> +#define JZ_LCD_PCFG_HP_BST_32			(3 << 28)
> +#define JZ_LCD_PCFG_HP_BST_64			(4 << 28)
> +#define JZ_LCD_PCFG_HP_BST_16_CONT		(5 << 28)
> +#define JZ_LCD_PCFG_HP_BST_DISABLE		(7 << 28)
> +#define JZ_LCD_PCFG_THRESHOLD2_OFFSET		18
> +#define JZ_LCD_PCFG_THRESHOLD1_OFFSET		9
> +#define JZ_LCD_PCFG_THRESHOLD0_OFFSET		0
> +
>  struct device;
>  struct drm_plane;
>  struct drm_plane_state;
> @@ -187,5 +228,6 @@ void ingenic_drm_plane_disable(struct device 
> *dev, struct drm_plane *plane);
>  bool ingenic_drm_map_noncoherent(const struct device *dev);
> 
>  extern struct platform_driver *ingenic_ipu_driver_ptr;
> +extern struct platform_driver *ingenic_dw_hdmi_driver_ptr;
> 
>  #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
> --
> 2.31.1
> 


