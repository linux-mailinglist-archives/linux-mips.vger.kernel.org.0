Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF554522B9
	for <lists+linux-mips@lfdr.de>; Tue, 16 Nov 2021 02:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353121AbhKPBPw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 15 Nov 2021 20:15:52 -0500
Received: from aposti.net ([89.234.176.197]:54220 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244269AbhKOTMW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Nov 2021 14:12:22 -0500
Date:   Mon, 15 Nov 2021 19:09:07 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 1/8] drm/ingenic: prepare ingenic drm for later
 addition of JZ4780
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
Message-Id: <7VNM2R.1CHJIFHQDLSS@crapouillou.net>
In-Reply-To: <122791473d61add6992310cec267ffde2607a2df.1636573413.git.hns@goldelico.com>
References: <cover.1636573413.git.hns@goldelico.com>
        <122791473d61add6992310cec267ffde2607a2df.1636573413.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

I will look at the patches in depth in the coming days.


Le mer., nov. 10 2021 at 20:43:26 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> This changes the way the regmap is allocated to prepare for the
> later addition of the JZ4780 which has more registers and bits
> than the others.
> 
> Therefore we make the regmap as big as the reg property in
> the device tree tells.
> 
> Suggested-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 462bc0f35f1bf..4abfe5b094174 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -173,7 +173,6 @@ static const struct regmap_config 
> ingenic_drm_regmap_config = {
>  	.val_bits = 32,
>  	.reg_stride = 4,
> 
> -	.max_register = JZ_REG_LCD_SIZE1,
>  	.writeable_reg = ingenic_drm_writeable_reg,
>  };
> 
> @@ -1011,6 +1010,8 @@ static int ingenic_drm_bind(struct device *dev, 
> bool has_components)
>  	struct ingenic_drm_bridge *ib;
>  	struct drm_device *drm;
>  	void __iomem *base;
> +	struct resource *res;
> +	struct regmap_config regmap_config;
>  	long parent_rate;
>  	unsigned int i, clone_mask = 0;
>  	int ret, irq;
> @@ -1056,14 +1057,16 @@ static int ingenic_drm_bind(struct device 
> *dev, bool has_components)
>  	drm->mode_config.funcs = &ingenic_drm_mode_config_funcs;
>  	drm->mode_config.helper_private = &ingenic_drm_mode_config_helpers;
> 
> -	base = devm_platform_ioremap_resource(pdev, 0);
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(base)) {
>  		dev_err(dev, "Failed to get memory resource\n");
>  		return PTR_ERR(base);
>  	}
> 
> +	regmap_config = ingenic_drm_regmap_config;
> +	regmap_config.max_register = res->end - res->start - 4;

Just a quick feedback here: I just tested and it's actually just 
(res->end - res->start), otherwise the last register of the memory area 
set in DT is inaccessible.

Cheers,
-Paul

>  	priv->map = devm_regmap_init_mmio(dev, base,
> -					  &ingenic_drm_regmap_config);
> +					  &regmap_config);
>  	if (IS_ERR(priv->map)) {
>  		dev_err(dev, "Failed to create regmap\n");
>  		return PTR_ERR(priv->map);
> --
> 2.33.0
> 


