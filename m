Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A25F20F250
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 12:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732316AbgF3KKY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jun 2020 06:10:24 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:34554 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732310AbgF3KKY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jun 2020 06:10:24 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id BFA4B80522;
        Tue, 30 Jun 2020 12:10:20 +0200 (CEST)
Date:   Tue, 30 Jun 2020 12:10:19 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, od@zcrc.me
Subject: Re: [PATCH v2 04/10] drm/ingenic: Add missing CR in debug strings
Message-ID: <20200630101019.GC553950@ravnborg.org>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629235210.441709-4-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=O7-e7zmCaJ8UY64ll6EA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 30, 2020 at 01:52:04AM +0200, Paul Cercueil wrote:
> If you pass a string that is not terminated with a carriage return to
> dev_err(), it will eventually be printed with a carriage return, but
> not right away, since the kernel will wait for a pr_cont().
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

It would have been nice if most was converted to drm_err() and friends
when touching these.
That may come later..
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
> 
> Notes:
>     v2: New patch
> 
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 30 +++++++++++------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 16f0740df507..a15f9a1940c6 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -623,14 +623,14 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
> -		dev_err(dev, "Failed to get memory resource");
> +		dev_err(dev, "Failed to get memory resource\n");
>  		return PTR_ERR(base);
>  	}
>  
>  	priv->map = devm_regmap_init_mmio(dev, base,
>  					  &ingenic_drm_regmap_config);
>  	if (IS_ERR(priv->map)) {
> -		dev_err(dev, "Failed to create regmap");
> +		dev_err(dev, "Failed to create regmap\n");
>  		return PTR_ERR(priv->map);
>  	}
>  
> @@ -641,21 +641,21 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  	if (soc_info->needs_dev_clk) {
>  		priv->lcd_clk = devm_clk_get(dev, "lcd");
>  		if (IS_ERR(priv->lcd_clk)) {
> -			dev_err(dev, "Failed to get lcd clock");
> +			dev_err(dev, "Failed to get lcd clock\n");
>  			return PTR_ERR(priv->lcd_clk);
>  		}
>  	}
>  
>  	priv->pix_clk = devm_clk_get(dev, "lcd_pclk");
>  	if (IS_ERR(priv->pix_clk)) {
> -		dev_err(dev, "Failed to get pixel clock");
> +		dev_err(dev, "Failed to get pixel clock\n");
>  		return PTR_ERR(priv->pix_clk);
>  	}
>  
>  	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
>  	if (ret) {
>  		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Failed to get panel handle");
> +			dev_err(dev, "Failed to get panel handle\n");
>  		return ret;
>  	}
>  
> @@ -684,7 +684,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  				       ARRAY_SIZE(ingenic_drm_primary_formats),
>  				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>  	if (ret) {
> -		dev_err(dev, "Failed to register primary plane: %i", ret);
> +		dev_err(dev, "Failed to register primary plane: %i\n", ret);
>  		return ret;
>  	}
>  
> @@ -693,7 +693,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  	ret = drm_crtc_init_with_planes(drm, &priv->crtc, &priv->primary,
>  					NULL, &ingenic_drm_crtc_funcs, NULL);
>  	if (ret) {
> -		dev_err(dev, "Failed to init CRTC: %i", ret);
> +		dev_err(dev, "Failed to init CRTC: %i\n", ret);
>  		return ret;
>  	}
>  
> @@ -705,25 +705,25 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  	ret = drm_simple_encoder_init(drm, &priv->encoder,
>  				      DRM_MODE_ENCODER_DPI);
>  	if (ret) {
> -		dev_err(dev, "Failed to init encoder: %i", ret);
> +		dev_err(dev, "Failed to init encoder: %i\n", ret);
>  		return ret;
>  	}
>  
>  	ret = drm_bridge_attach(&priv->encoder, bridge, NULL, 0);
>  	if (ret) {
> -		dev_err(dev, "Unable to attach bridge");
> +		dev_err(dev, "Unable to attach bridge\n");
>  		return ret;
>  	}
>  
>  	ret = drm_irq_install(drm, irq);
>  	if (ret) {
> -		dev_err(dev, "Unable to install IRQ handler");
> +		dev_err(dev, "Unable to install IRQ handler\n");
>  		return ret;
>  	}
>  
>  	ret = drm_vblank_init(drm, 1);
>  	if (ret) {
> -		dev_err(dev, "Failed calling drm_vblank_init()");
> +		dev_err(dev, "Failed calling drm_vblank_init()\n");
>  		return ret;
>  	}
>  
> @@ -731,7 +731,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  
>  	ret = clk_prepare_enable(priv->pix_clk);
>  	if (ret) {
> -		dev_err(dev, "Unable to start pixel clock");
> +		dev_err(dev, "Unable to start pixel clock\n");
>  		return ret;
>  	}
>  
> @@ -746,20 +746,20 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  		 */
>  		ret = clk_set_rate(priv->lcd_clk, parent_rate);
>  		if (ret) {
> -			dev_err(dev, "Unable to set LCD clock rate");
> +			dev_err(dev, "Unable to set LCD clock rate\n");
>  			goto err_pixclk_disable;
>  		}
>  
>  		ret = clk_prepare_enable(priv->lcd_clk);
>  		if (ret) {
> -			dev_err(dev, "Unable to start lcd clock");
> +			dev_err(dev, "Unable to start lcd clock\n");
>  			goto err_pixclk_disable;
>  		}
>  	}
>  
>  	ret = drm_dev_register(drm, 0);
>  	if (ret) {
> -		dev_err(dev, "Failed to register DRM driver");
> +		dev_err(dev, "Failed to register DRM driver\n");
>  		goto err_devclk_disable;
>  	}
>  
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
