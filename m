Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3163E17D4
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 17:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242204AbhHEPYt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 5 Aug 2021 11:24:49 -0400
Received: from aposti.net ([89.234.176.197]:55624 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241715AbhHEPXV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 11:23:21 -0400
Date:   Thu, 05 Aug 2021 17:22:24 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/8] drm/ingenic: Add support for JZ4780 and HDMI
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
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Message-Id: <CDHDXQ.QTKW3N6WINVB2@crapouillou.net>
In-Reply-To: <263a207d2aeb8bc95aa8464212dcc9b225548f4f.1628172477.git.hns@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
        <263a207d2aeb8bc95aa8464212dcc9b225548f4f.1628172477.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus & Paul,

Le jeu., août 5 2021 at 16:07:52 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> From: Paul Boddie <paul@boddie.org.uk>
> 
> Add support for the LCD controller present on JZ4780 SoCs.
> This SoC uses 8-byte descriptors which extend the current
> 4-byte descriptors used for other Ingenic SoCs.
> 
> Also, add special handling for HDMI-A connectors.
> 
> For some reason, only the primary planes are working
> properly. As soon as the overlay plane is enabled
> things go south :P
> 
> Tested on MIPS Creator CI20 board.
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 163 
> ++++++++++++++++++++--
>  drivers/gpu/drm/ingenic/ingenic-drm.h     |  52 +++++++
>  2 files changed, 200 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 5244f47634777..a2d103ae46833 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -56,13 +56,27 @@ struct ingenic_dma_hwdescs {
>  	u16 palette[256] __aligned(16);
>  };
> 
> +struct ingenic_dma_hwdesc_ext {
> +	struct ingenic_dma_hwdesc base;
> +	u32 offsize;
> +	u32 pagewidth;
> +	u32 cpos;
> +	u32 dessize;
> +} __packed;
> +
>  struct jz_soc_info {
>  	bool needs_dev_clk;
>  	bool has_osd;
>  	bool map_noncoherent;
> +	bool has_alpha;
> +	bool has_pcfg;
> +	bool has_recover;
> +	bool has_rgbc;
> +	unsigned int hwdesc_size;
>  	unsigned int max_width, max_height;
>  	const u32 *formats_f0, *formats_f1;
>  	unsigned int num_formats_f0, num_formats_f1;
> +	unsigned int max_reg;
>  };
> 
>  struct ingenic_drm {
> @@ -118,12 +132,11 @@ static bool ingenic_drm_writeable_reg(struct 
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
> @@ -582,7 +595,39 @@ static void 
> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  			hwdesc = &priv->dma_hwdescs->hwdesc_f1;
> 
>  		hwdesc->addr = addr;
> -		hwdesc->cmd = JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
> +		hwdesc->cmd = JZ_LCD_CMD_FRM_ENABLE | JZ_LCD_CMD_EOF_IRQ |
> +			      (width * height * cpp / 4);
> +
> +		if (priv->soc_info->hwdesc_size == sizeof(struct 
> ingenic_dma_hwdesc_ext)) {

I'd prefer a boolean flag, e.g. "soc_info->use_extended_hwdesc"

> +			struct ingenic_dma_hwdesc_ext *hwdesc_ext;
> +
> +			/* Extended 8-byte descriptor */
> +			hwdesc_ext = (struct ingenic_dma_hwdesc_ext *) hwdesc;
> +			hwdesc_ext->cpos = 0;
> +			hwdesc_ext->offsize = 0;
> +			hwdesc_ext->pagewidth = 0;
> +
> +			switch (newstate->fb->format->format) {
> +			case DRM_FORMAT_XRGB1555:
> +				hwdesc_ext->cpos |= JZ_LCD_CPOS_RGB555;
> +				fallthrough;
> +			case DRM_FORMAT_RGB565:
> +				hwdesc_ext->cpos |= JZ_LCD_CPOS_BPP_15_16;
> +				break;
> +			case DRM_FORMAT_XRGB8888:
> +				hwdesc_ext->cpos |= JZ_LCD_CPOS_BPP_18_24;
> +				break;
> +			}
> +			hwdesc_ext->cpos |= JZ_LCD_CPOS_PREMULTIPLY_LCD |
> +					    (3 << JZ_LCD_CPOS_COEFFICIENT_OFFSET);

Where's that magic value '3' coming from?

> +
> +			hwdesc_ext->dessize =
> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
> +				(((height - 1) & JZ_LCD_DESSIZE_HEIGHT_MASK) <<
> +						 JZ_LCD_DESSIZE_HEIGHT_OFFSET) |
> +				(((width - 1) & JZ_LCD_DESSIZE_WIDTH_MASK) <<
> +						JZ_LCD_DESSIZE_WIDTH_OFFSET);

Use FIELD_PREP() from <linux/bitfield.h>.

> +		}
> 
>  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  			fourcc = newstate->fb->format->format;
> @@ -612,8 +657,12 @@ static void 
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	struct drm_connector *conn = conn_state->connector;
>  	struct drm_display_info *info = &conn->display_info;
> +	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  	unsigned int cfg, rgbcfg = 0;
> 
> +	if (info->num_bus_formats)
> +		bus_format = info->bus_formats[0];
> +

That code is going to change really soon, as I have my own PR ready to 
convert the ingenic-drm driver to use a top-level bridge for bus format 
/ flags negociation.

The HDMI driver should therefore implement it as well; see for instance 
drivers/gpu/drm/bridge/ite-it66121.c for an example of how the bus 
format is negociated.

I'll be sure to Cc you as soon as I send it upstream - should be just 
in a couple of days.

>  	priv->panel_is_sharp = info->bus_flags & DRM_BUS_FLAG_SHARP_SIGNALS;
> 
>  	if (priv->panel_is_sharp) {
> @@ -623,6 +672,13 @@ static void 
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>  	}
> 
> +	if (priv->soc_info->has_recover)
> +		cfg |= JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;

Seems out of place. Does it not work without?

> +
> +	/* CI20: set use of the 8-word descriptor and OSD foreground usage. 
> */

Not really CI20-specific though.

> +	if (priv->soc_info->hwdesc_size == sizeof(struct 
> ingenic_dma_hwdesc_ext))
> +		cfg |= JZ_LCD_CFG_DESCRIPTOR_8;
> +
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>  		cfg |= JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> @@ -639,7 +695,7 @@ static void 
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  			else
>  				cfg |= JZ_LCD_CFG_MODE_TV_OUT_P;
>  		} else {
> -			switch (*info->bus_formats) {
> +			switch (bus_format) {
>  			case MEDIA_BUS_FMT_RGB565_1X16:
>  				cfg |= JZ_LCD_CFG_MODE_GENERIC_16BIT;
>  				break;
> @@ -665,19 +721,23 @@ static void 
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
>  }
> 
> -static int ingenic_drm_encoder_atomic_check(struct drm_encoder 
> *encoder,
> -					    struct drm_crtc_state *crtc_state,
> -					    struct drm_connector_state *conn_state)
> +static int
> +ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
> +				 struct drm_crtc_state *crtc_state,
> +				 struct drm_connector_state *conn_state)
>  {
>  	struct drm_display_info *info = 
> &conn_state->connector->display_info;
>  	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> 
> +	switch (conn_state->connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_TV:
> +	case DRM_MODE_CONNECTOR_HDMIA:
> +		return 0;
> +	}

This switch should move after the check on "num_bus_formats".
(I understand why you did it, but with proper bus format negociation 
this won't be needed).

> +
>  	if (info->num_bus_formats != 1)
>  		return -EINVAL;
> 
> -	if (conn_state->connector->connector_type == DRM_MODE_CONNECTOR_TV)
> -		return 0;
> -
>  	switch (*info->bus_formats) {
>  	case MEDIA_BUS_FMT_RGB888_3X8:
>  	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
> @@ -924,7 +984,7 @@ static int ingenic_drm_bind(struct device *dev, 
> bool has_components)
>  	drm->mode_config.min_width = 0;
>  	drm->mode_config.min_height = 0;
>  	drm->mode_config.max_width = soc_info->max_width;
> -	drm->mode_config.max_height = 4095;
> +	drm->mode_config.max_height = soc_info->max_height;

The drm->mode_config.max_height is different from soc_info->max_height; 
the former is the maximum framebuffer size, the latter is the maximum 
size that the SoC can display. The framebuffer can be bigger than what 
the SoC can display.

>  	drm->mode_config.funcs = &ingenic_drm_mode_config_funcs;
>  	drm->mode_config.helper_private = &ingenic_drm_mode_config_helpers;
> 
> @@ -934,6 +994,7 @@ static int ingenic_drm_bind(struct device *dev, 
> bool has_components)
>  		return PTR_ERR(base);
>  	}
> 
> +	ingenic_drm_regmap_config.max_register = soc_info->max_reg;

Avoid modifying a global variable; instead copy it to a local copy of 
ingenic_drm_regmap_config, and use this one in the regmap_init_mmio 
below.

>  	priv->map = devm_regmap_init_mmio(dev, base,
>  					  &ingenic_drm_regmap_config);
>  	if (IS_ERR(priv->map)) {
> @@ -966,7 +1027,6 @@ static int ingenic_drm_bind(struct device *dev, 
> bool has_components)
>  	if (!priv->dma_hwdescs)
>  		return -ENOMEM;
> 
> -

Cosmetic change - not needed.

>  	/* Configure DMA hwdesc for foreground0 plane */
>  	dma_hwdesc_phys_f0 = priv->dma_hwdescs_phys
>  		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
> @@ -1147,7 +1207,26 @@ static int ingenic_drm_bind(struct device 
> *dev, bool has_components)
> 
>  	/* Enable OSD if available */
>  	if (soc_info->has_osd)
> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
> +
> +	if (soc_info->has_alpha)
> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_ALPHAEN);

Do you need alpha blending support between planes, in this patch 
related to HDMI?

> +
> +	/* Magic values from the vendor kernel for the priority thresholds. 
> */
> +	if (soc_info->has_pcfg)
> +		regmap_write(priv->map, JZ_REG_LCD_PCFG,
> +			     JZ_LCD_PCFG_PRI_MODE |
> +			     JZ_LCD_PCFG_HP_BST_16 |
> +			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
> +			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
> +			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));

And why is that needed in this patch? Doesn't HDMI work without it?

> +
> +	/* RGB output control may be superfluous. */
> +	if (soc_info->has_rgbc)
> +		regmap_write(priv->map, JZ_REG_LCD_RGBC,
> +			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
> +			     JZ_LCD_RGBC_ODD_LINE_RGB |
> +			     JZ_LCD_RGBC_EVEN_LINE_RGB);

The last two macros set the subpixel ordering on the bus for serial 
(3x8) 24-bit panels - completely unrelated to HDMI.

> 
>  	mutex_init(&priv->clk_mutex);
>  	priv->clock_nb.notifier_call = ingenic_drm_update_pixclk;
> @@ -1296,41 +1375,75 @@ static const struct jz_soc_info 
> jz4740_soc_info = {
>  	.needs_dev_clk = true,
>  	.has_osd = false,
>  	.map_noncoherent = false,
> +	.has_pcfg = false,
> +	.has_recover = false,
> +	.has_rgbc = false,
> +	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
>  	.max_width = 800,
>  	.max_height = 600,
>  	.formats_f1 = jz4740_formats,
>  	.num_formats_f1 = ARRAY_SIZE(jz4740_formats),
>  	/* JZ4740 has only one plane */
> +	.max_reg = JZ_REG_LCD_SIZE1,
>  };
> 
>  static const struct jz_soc_info jz4725b_soc_info = {
>  	.needs_dev_clk = false,
>  	.has_osd = true,
>  	.map_noncoherent = false,
> +	.has_pcfg = false,
> +	.has_recover = false,
> +	.has_rgbc = false,
> +	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
>  	.max_width = 800,
>  	.max_height = 600,
>  	.formats_f1 = jz4725b_formats_f1,
>  	.num_formats_f1 = ARRAY_SIZE(jz4725b_formats_f1),
>  	.formats_f0 = jz4725b_formats_f0,
>  	.num_formats_f0 = ARRAY_SIZE(jz4725b_formats_f0),
> +	.max_reg = JZ_REG_LCD_SIZE1,
>  };
> 
>  static const struct jz_soc_info jz4770_soc_info = {
>  	.needs_dev_clk = false,
>  	.has_osd = true,
>  	.map_noncoherent = true,
> +	.has_pcfg = false,
> +	.has_recover = false,
> +	.has_rgbc = false,
> +	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc),
>  	.max_width = 1280,
>  	.max_height = 720,
>  	.formats_f1 = jz4770_formats_f1,
>  	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
>  	.formats_f0 = jz4770_formats_f0,
>  	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
> +	.max_reg = JZ_REG_LCD_SIZE1,
> +};
> +
> +static const struct jz_soc_info jz4780_soc_info = {
> +	.needs_dev_clk = true,
> +	.has_osd = true,
> +	.has_alpha = true,
> +	.has_pcfg = true,
> +	.has_recover = true,
> +	.has_rgbc = true,
> +	.hwdesc_size = sizeof(struct ingenic_dma_hwdesc_ext),
> +	.max_width = 4096,
> +	.max_height = 4096,

The PM says that the display is up to 4096x2048-30Hz; so this is wrong.

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
> @@ -1349,13 +1462,31 @@ static int ingenic_drm_init(void)
>  {
>  	int err;
> 
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
> +		err = platform_driver_register(ingenic_dw_hdmi_driver_ptr);
> +		if (err)
> +			return err;
> +	}
> +
>  	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
>  		err = platform_driver_register(ingenic_ipu_driver_ptr);
>  		if (err)
> -			return err;
> +			goto err_hdmi_unreg;
>  	}
> 
> -	return platform_driver_register(&ingenic_drm_driver);
> +	err = platform_driver_register(&ingenic_drm_driver);
> +	if (err)
> +		goto err_ipu_unreg;

That's actually a change of behaviour - before it would return on error 
without calling platform_driver_unregister on the IPU.

It is not necesarily bad, but it belongs in a separate commit.

> +
> +	return 0;
> +
> +err_ipu_unreg:
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
> +		platform_driver_unregister(ingenic_ipu_driver_ptr);
> +err_hdmi_unreg:
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI))
> +		platform_driver_unregister(ingenic_dw_hdmi_driver_ptr);
> +	return err;
>  }
>  module_init(ingenic_drm_init);
> 
> @@ -1363,6 +1494,8 @@ static void ingenic_drm_exit(void)
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
> index 22654ac1dde1c..7e55a88243e28 100644
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
> @@ -176,6 +182,51 @@
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
> +
> +#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
> +#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
> +#define JZ_LCD_RGBC_422				BIT(8)
> +#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
> +#define JZ_LCD_RGBC_ODD_LINE_MASK		(0x7 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_RGB		(0 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_RBG		(1 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_GRB		(2 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_GBR		(3 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_BRG		(4 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_BGR		(5 << 4)
> +#define JZ_LCD_RGBC_EVEN_LINE_MASK		(0x7 << 0)
> +#define JZ_LCD_RGBC_EVEN_LINE_RGB		0
> +#define JZ_LCD_RGBC_EVEN_LINE_RBG		1
> +#define JZ_LCD_RGBC_EVEN_LINE_GRB		2
> +#define JZ_LCD_RGBC_EVEN_LINE_GBR		3
> +#define JZ_LCD_RGBC_EVEN_LINE_BRG		4
> +#define JZ_LCD_RGBC_EVEN_LINE_BGR		5

We already have these in ingenic-drm.h...

Please only add the macros that you need and are missing.

Cheers,
-Paul

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
> @@ -187,5 +238,6 @@ void ingenic_drm_plane_disable(struct device 
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


