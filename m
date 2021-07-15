Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFCC3C9D5D
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 12:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235182AbhGOLCf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 07:02:35 -0400
Received: from aposti.net ([89.234.176.197]:47056 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234936AbhGOLCf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 15 Jul 2021 07:02:35 -0400
MIME-Version: 1.0
Date:   Thu, 15 Jul 2021 12:59:41 +0200
From:   paul <paul@crapouillou.net>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/ingenic: Convert to Linux IRQ interfaces
In-Reply-To: <20210715100258.6638-1-tzimmermann@suse.de>
References: <20210715100258.6638-1-tzimmermann@suse.de>
Message-ID: <50974b954415b69fae55674f60430c31@crapouillou.net>
X-Sender: paul@crapouillou.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-07-15 12:02, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> This patch also fixes a bug where the driver didn't release the
> IRQ.
> 
> v2:
> 	* automatically release IRQ via devm_request_irq() (Paul)
> 	* mention the bugfix (Sam)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index c296472164d9..857ed070b21b 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -33,7 +33,6 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -799,8 +798,6 @@ static const struct drm_driver 
> ingenic_drm_driver_data = {
>  	.fops			= &ingenic_drm_fops,
>  	.gem_create_object	= ingenic_drm_gem_create_object,
>  	DRM_GEM_CMA_DRIVER_OPS,
> -
> -	.irq_handler		= ingenic_drm_irq_handler,
>  };
> 
>  static const struct drm_plane_funcs ingenic_drm_primary_plane_funcs = 
> {
> @@ -1098,7 +1095,7 @@ static int ingenic_drm_bind(struct device *dev,
> bool has_components)
>  		encoder->possible_clones = clone_mask;
>  	}
> 
> -	ret = drm_irq_install(drm, irq);
> +	ret = devm_request_irq(dev, irq, ingenic_drm_irq_handler, 0,
> drm->driver->name, drm);
>  	if (ret) {
>  		dev_err(dev, "Unable to install IRQ handler\n");
>  		return ret;
