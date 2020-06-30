Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F059D20F3B9
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 13:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733060AbgF3Lo7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jun 2020 07:44:59 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:43102 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733050AbgF3Lo6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jun 2020 07:44:58 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 738CA804B4;
        Tue, 30 Jun 2020 13:44:54 +0200 (CEST)
Date:   Tue, 30 Jun 2020 13:44:53 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, od@zcrc.me
Subject: Re: [PATCH v2 06/10] drm/ingenic: Set DMA descriptor chain address
 in probe
Message-ID: <20200630114453.GB560155@ravnborg.org>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-6-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629235210.441709-6-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=e5mUnYsNAAAA:8
        a=_F4ZNtTwmw7fjDG2MVkA:9 a=7tZkzEg-RNLL3d5o:21 a=j8Rw1sZxBYetKqRA:21
        a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul.

On Tue, Jun 30, 2020 at 01:52:06AM +0200, Paul Cercueil wrote:
> The address of the DMA descriptor never changes. It can therefore be set
> in the probe function.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: No change
> 
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 924c8daf071a..f7b0c5dc8cd8 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -358,8 +358,6 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  		ingenic_drm_crtc_update_ctrl(priv, finfo);
>  
>  		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
> -
> -		regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc->next);
>  	}
>  
>  	if (event) {
> @@ -757,6 +755,9 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/* Set address of our DMA descriptor chain */
> +	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys);
> +


What is the purpose of this code after the assignment was moved:

static int ingenic_drm_probe(struct platform_device *pdev)
{
...
	priv->dma_hwdesc->next = priv->dma_hwdesc_phys;

I do not see ->next used anymore.
Could this assignment be dropped?


And the following line:
	priv->dma_hwdesc->id = 0xdeafbead;

I can only see ->id be assingned, it is never referenced??

Maybe this is all related to the structure assumed by the data pointed
to by JZ_REG_LCD_DA0?

	Sam

>  	ret = drm_dev_register(drm, 0);
>  	if (ret) {
>  		dev_err(dev, "Failed to register DRM driver\n");
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
