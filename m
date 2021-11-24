Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EB245CC44
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 19:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243530AbhKXSn3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 24 Nov 2021 13:43:29 -0500
Received: from aposti.net ([89.234.176.197]:50650 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350801AbhKXSnP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Nov 2021 13:43:15 -0500
Date:   Wed, 24 Nov 2021 18:39:49 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
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
Message-Id: <DIA33R.QE29K7RKLI2C1@crapouillou.net>
In-Reply-To: <016973B0-B7F0-4E63-BF4F-2643611A6351@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
        <64c6ab288d4d7159f633c860f1b23b3395491ae1.1637691240.git.hns@goldelico.com>
        <GTJ13R.RSQAWZX83DUZ2@crapouillou.net>
        <016973B0-B7F0-4E63-BF4F-2643611A6351@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le mer., nov. 24 2021 at 17:13:30 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> 
> 
>>  Am 23.11.2021 um 21:05 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>  Hi Nikolaus,
>> 
>>  I keep seeing a few things, sorry.
> 
> no problem.
> 
>> 
>> 
>>  Le mar., nov. 23 2021 at 19:13:57 +0100, H. Nikolaus Schaller 
>> <hns@goldelico.com> a écrit :
>>>  From: Paul Boddie <paul@boddie.org.uk>
>>>  A specialisation of the generic Synopsys HDMI driver is employed 
>>> for
>>>  JZ4780 HDMI support. This requires a new driver, plus device tree 
>>> and
>>>  configuration modifications.
>>>  Here we add Kconfig DRM_INGENIC_DW_HDMI, Makefile and driver code.
>>>  Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>>  Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  ---
>>>  drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>>>  drivers/gpu/drm/ingenic/Makefile          |   1 +
>>>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 129 
>>> ++++++++++++++++++++++
>>>  3 files changed, 139 insertions(+)
>>>  create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>>>  diff --git a/drivers/gpu/drm/ingenic/Kconfig 
>>> b/drivers/gpu/drm/ingenic/Kconfig
>>>  index 3b57f8be007c4..4efc709d77b0a 100644
>>>  --- a/drivers/gpu/drm/ingenic/Kconfig
>>>  +++ b/drivers/gpu/drm/ingenic/Kconfig
>>>  @@ -25,4 +25,13 @@ config DRM_INGENIC_IPU
>>>  	  The Image Processing Unit (IPU) will appear as a second primary 
>>> plane.
>>>  +config DRM_INGENIC_DW_HDMI
>>>  +	tristate "Ingenic specific support for Synopsys DW HDMI"
>>>  +	depends on MACH_JZ4780
>>>  +	select DRM_DW_HDMI
>>>  +	help
>>>  +	  Choose this option to enable Synopsys DesignWare HDMI based 
>>> driver.
>>>  +	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you 
>>> should
>>>  +	  select this option..
>>>  +
>>>  endif
>>>  diff --git a/drivers/gpu/drm/ingenic/Makefile 
>>> b/drivers/gpu/drm/ingenic/Makefile
>>>  index d313326bdddbb..f10cc1c5a5f22 100644
>>>  --- a/drivers/gpu/drm/ingenic/Makefile
>>>  +++ b/drivers/gpu/drm/ingenic/Makefile
>>>  @@ -1,3 +1,4 @@
>>>  obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
>>>  ingenic-drm-y = ingenic-drm-drv.o
>>>  ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
>>>  +obj-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
>>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c 
>>> b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>>>  new file mode 100644
>>>  index 0000000000000..c14890d6b9826
>>>  --- /dev/null
>>>  +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
>>>  @@ -0,0 +1,129 @@
>>>  +// SPDX-License-Identifier: GPL-2.0
>>>  +/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
>>>  + * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
>>>  + *
>>>  + * Derived from dw_hdmi-imx.c with i.MX portions removed.
>>>  + * Probe and remove operations derived from rcar_dw_hdmi.c.
>>>  + */
>>>  +
>>>  +#include <linux/module.h>
>>>  +#include <linux/platform_device.h>
>>>  +#include <linux/regmap.h>
>>>  +
>>>  +#include <drm/bridge/dw_hdmi.h>
>>>  +#include <drm/drm_of.h>
>>>  +#include <drm/drm_print.h>
>>>  +
>>>  +static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] = {
>>>  +	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 
>>> 0x0000 } } },
>>>  +	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, 
>>> 0x0005 } } },
>>>  +	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, 
>>> 0x000a } } },
>>>  +	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, 
>>> 0x000f } } },
>>>  +	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 
>>> 0x0000 } } }
>>>  +};
>>>  +
>>>  +static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] = {
>>>  +	/*pixelclk     bpp8    bpp10   bpp12 */
>>>  +	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
>>>  +	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
>>>  +	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
>>>  +	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
>>>  +	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
>>>  +	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
>>>  +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
>>>  +};
>>>  +
>>>  +/*
>>>  + * Resistance term 133Ohm Cfg
>>>  + * PREEMP config 0.00
>>>  + * TX/CK level 10
>>>  + */
>>>  +static const struct dw_hdmi_phy_config ingenic_phy_config[] = {
>>>  +	/*pixelclk   symbol   term   vlev */
>>>  +	{ 216000000, 0x800d, 0x0005, 0x01ad},
>>>  +	{ ~0UL,      0x0000, 0x0000, 0x0000}
>>>  +};
>>>  +
>>>  +static enum drm_mode_status
>>>  +ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
>>>  +			   const struct drm_display_info *info,
>>>  +			   const struct drm_display_mode *mode)
>>>  +{
>>>  +	if (mode->clock < 13500)
>>>  +		return MODE_CLOCK_LOW;
>>>  +	/* FIXME: Hardware is capable of 270MHz, but setup data is 
>>> missing. */
>>>  +	if (mode->clock > 216000)
>>>  +		return MODE_CLOCK_HIGH;
>>>  +
>>>  +	return MODE_OK;
>>>  +}
>>>  +
>>>  +static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data = {
>>>  +	.mpll_cfg   = ingenic_mpll_cfg,
>>>  +	.cur_ctr    = ingenic_cur_ctr,
>>>  +	.phy_config = ingenic_phy_config,
>>>  +	.mode_valid = ingenic_dw_hdmi_mode_valid,
>>>  +	.output_port	= 1,
>>>  +};
>>>  +
>>>  +static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
>>>  +	{ .compatible = "ingenic,jz4780-dw-hdmi" },
>>>  +	{ /* Sentinel */ },
>>>  +};
>>>  +MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
>>>  +
>>>  +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
>>>  +{
>>>  +	struct dw_hdmi *hdmi;
>>>  +	struct regulator *regulator;
>>>  +	int ret;
>>>  +
>>>  +	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
>>>  +	if (IS_ERR(hdmi))
>>>  +		return PTR_ERR(hdmi);
>>>  +
>>>  +	platform_set_drvdata(pdev, hdmi);
>>>  +
>>>  +	regulator = devm_regulator_get_optional(&pdev->dev, "hdmi-5v");
>>>  +
>> 
>>  Nit - you can remove this blank line.
> 
> ok.
> 
>> 
>>>  +	if (IS_ERR(regulator)) {
>>>  +		ret = PTR_ERR(regulator);
>>>  +
>>>  +		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %s 
>>> (%d)\n",
>>>  +			      "hdmi-5v", ret);
>>>  +		return ret;
>>>  +	}
>>>  +
>>>  +	ret = regulator_enable(regulator);
>> 
>>  You used devm_regulator_get_optional(), so you are not guaranteed 
>> to obtain anything; your "regulator" variable might be a NULL 
>> pointer, so you can't just call regulator_enable() without checking 
>> it first.
> 
> right. I forgot about that.
> 
>> 
>>>  +	if (ret) {
>>>  +		DRM_DEV_ERROR(&pdev->dev, "Failed to enable hpd regulator: 
>>> %d\n",
>>>  +			      ret);
>>>  +		return ret;
>>>  +	}
>>>  +
>>>  +	return 0;
>>>  +}
>>>  +
>>>  +static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
>>>  +{
>>>  +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
>>>  +
>>>  +	dw_hdmi_remove(hdmi);
>> 
>>  You probably should disable the regulator (if not NULL) here.
> 
> Indeed. Would it be ok to make struct regulator *regulator static
> or do we need dynamically allocated memory?

static non-const is almost always a bad idea, so avoid it.

You can either:

- create a "ingenic_dw_hdmi" struct that will contain a pointer to 
dw_hdmi and a pointer to the regulator. Instanciate it in the probe 
with devm_kzalloc() and set the pointers, then set it as the driver 
data (platform_set_drvdata). In the remove function you can then obtain 
the pointer to your ingenic_dw_hdmi struct with platform_get_drvdata(), 
and you can remove the dw_hdmi and unregister the regulator.

- register cleanup functions, using devm_add_action_or_reset(dev, f, 
priv). When it's time to cleanup, the kernel core will call f(priv) 
automatically. So you can add a small wrapper around dw_hdmi_remove() 
and another one around regulator_disable(), and those will be called 
automatically if your probe function fails, or when the driver is 
removed. Then you can completely remove the ".remove" callback. There 
are a few examples of these in the ingenic-drm-drv.c if you want to 
take a look.

Cheers,
-Paul

>> 
>>>  +
>>>  +	return 0;
>>>  +}
>>>  +
>>>  +static struct platform_driver ingenic_dw_hdmi_driver = {
>>>  +	.probe  = ingenic_dw_hdmi_probe,
>>>  +	.remove = ingenic_dw_hdmi_remove,
>>>  +	.driver = {
>>>  +		.name = "dw-hdmi-ingenic",
>>>  +		.of_match_table = ingenic_dw_hdmi_dt_ids,
>>>  +	},
>>>  +};
>>>  +
>> 
>>  Nit - remove this blank line too.
> 
> ok.
> 
>> 
>>  Cheers,
>>  -Paul
>> 
>>>  +module_platform_driver(ingenic_dw_hdmi_driver);
>>>  +
>>>  +MODULE_DESCRIPTION("JZ4780 Specific DW-HDMI Driver Extension");
>>>  +MODULE_LICENSE("GPL v2");
>>>  +MODULE_ALIAS("platform:dwhdmi-ingenic");
>>>  --
>>>  2.33.0
>> 
>> 
> 


