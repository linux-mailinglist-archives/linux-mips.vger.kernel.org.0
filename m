Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C7F41B1BE
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 16:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240990AbhI1OMj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 28 Sep 2021 10:12:39 -0400
Received: from aposti.net ([89.234.176.197]:53928 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241003AbhI1OMj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 10:12:39 -0400
Date:   Tue, 28 Sep 2021 15:10:44 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 06/10] drm/ingenic: Add dw-hdmi driver for jz4780
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
Message-Id: <W1E50R.77NJ4ON3G1EY2@crapouillou.net>
In-Reply-To: <cecd7ae2e21f6547f23c125b2f7767b0090277bc.1632761068.git.hns@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
        <cecd7ae2e21f6547f23c125b2f7767b0090277bc.1632761068.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus & Paul,

Le lun., sept. 27 2021 at 18:44:24 +0200, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> From: Paul Boddie <paul@boddie.org.uk>
> 
> A specialisation of the generic Synopsys HDMI driver is employed for 
> JZ4780
> HDMI support. This requires a new driver, plus device tree and 
> configuration
> modifications.
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>  drivers/gpu/drm/ingenic/Makefile          |   1 +
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 142 
> ++++++++++++++++++++++
>  3 files changed, 152 insertions(+)
>  create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> 
> diff --git a/drivers/gpu/drm/ingenic/Kconfig 
> b/drivers/gpu/drm/ingenic/Kconfig
> index 3b57f8be007c..4c7d311fbeff 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -25,4 +25,13 @@ config DRM_INGENIC_IPU
> 
>  	  The Image Processing Unit (IPU) will appear as a second primary 
> plane.
> 
> +config DRM_INGENIC_DW_HDMI
> +	bool "Ingenic specific support for Synopsys DW HDMI"
> +	depends on MACH_JZ4780
> +	select DRM_DW_HDMI
> +	help
> +	  Choose this option to enable Synopsys DesignWare HDMI based 
> driver.
> +	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
> +	  select this option..
> +
>  endif
> diff --git a/drivers/gpu/drm/ingenic/Makefile 
> b/drivers/gpu/drm/ingenic/Makefile
> index d313326bdddb..3db9888a6c04 100644
> --- a/drivers/gpu/drm/ingenic/Makefile
> +++ b/drivers/gpu/drm/ingenic/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
>  ingenic-drm-y = ingenic-drm-drv.o
>  ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
> +ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c 
> b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> new file mode 100644
> index 000000000000..dd9c94ae842e
> --- /dev/null
> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
> + * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
> + *
> + * Derived from dw_hdmi-imx.c with i.MX portions removed.
> + * Probe and remove operations derived from rcar_dw_hdmi.c.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] = {
> +	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 
> 0x0000 } } },
> +	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, 
> 0x0005 } } },
> +	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, 
> 0x000a } } },
> +	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, 
> 0x000f } } },
> +	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 
> 0x0000 } } }
> +};
> +
> +static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] = {
> +	/*pixelclk     bpp8    bpp10   bpp12 */
> +	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
> +	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
> +	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
> +	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
> +	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
> +	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
> +};
> +
> +/*
> + * Resistance term 133Ohm Cfg
> + * PREEMP config 0.00
> + * TX/CK level 10
> + */
> +static const struct dw_hdmi_phy_config ingenic_phy_config[] = {
> +	/*pixelclk   symbol   term   vlev */
> +	{ 216000000, 0x800d, 0x0005, 0x01ad},
> +	{ ~0UL,      0x0000, 0x0000, 0x0000}
> +};
> +
> +static enum drm_mode_status
> +ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +			   const struct drm_display_info *info,
> +			   const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < 13500)
> +		return MODE_CLOCK_LOW;
> +	/* FIXME: Hardware is capable of 270MHz, but setup data is missing. 
> */
> +	if (mode->clock > 216000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static bool
> +ingenic_dw_hdmi_mode_fixup(struct drm_bridge *bridge,
> +			   const struct drm_display_mode *mode,
> +			   struct drm_display_mode *adjusted_mode)
> +{
> +	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | 
> DRM_MODE_FLAG_PVSYNC);
> +	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | 
> DRM_MODE_FLAG_NVSYNC);

Why do these flags need to be cleared? The LCDC can work with negative 
v/h sync, does the HDMI core not work with that?

> +
> +	return true;
> +}
> +
> +static const struct drm_bridge_timings ingenic_dw_hdmi_timings = {
> +	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,

That info should be provided in the EDID, is this really needed here?

Cheers,
-Paul

> +};
> +
> +static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data = {
> +	.mpll_cfg   = ingenic_mpll_cfg,
> +	.cur_ctr    = ingenic_cur_ctr,
> +	.phy_config = ingenic_phy_config,
> +	.mode_valid = ingenic_dw_hdmi_mode_valid,
> +	.mode_fixup = ingenic_dw_hdmi_mode_fixup,
> +	.timings    = &ingenic_dw_hdmi_timings,
> +	.output_port	= 1,
> +};
> +
> +static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
> +	{ .compatible = "ingenic,jz4780-dw-hdmi" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
> +
> +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi;
> +	struct regulator *regulator;
> +	int ret;
> +
> +	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	regulator = devm_regulator_get_optional(&pdev->dev, "hdmi-5v");
> +
> +	if (IS_ERR(regulator)) {
> +		ret = PTR_ERR(regulator);
> +
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %s (%d)\n",
> +			      "hdmi-5v", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(regulator);
> +	if (ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "Failed to enable hpd regulator: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> +	dw_hdmi_remove(hdmi);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver ingenic_dw_hdmi_driver = {
> +	.probe  = ingenic_dw_hdmi_probe,
> +	.remove = ingenic_dw_hdmi_remove,
> +	.driver = {
> +		.name = "dw-hdmi-ingenic",
> +		.of_match_table = ingenic_dw_hdmi_dt_ids,
> +	},
> +};
> +
> +struct platform_driver *ingenic_dw_hdmi_driver_ptr = 
> &ingenic_dw_hdmi_driver;
> --
> 2.31.1
> 


