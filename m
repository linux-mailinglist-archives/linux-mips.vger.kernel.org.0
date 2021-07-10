Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5F03C3411
	for <lists+linux-mips@lfdr.de>; Sat, 10 Jul 2021 12:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhGJKHG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 10 Jul 2021 06:07:06 -0400
Received: from aposti.net ([89.234.176.197]:57032 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232135AbhGJKHF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 10 Jul 2021 06:07:05 -0400
Date:   Sat, 10 Jul 2021 11:04:11 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Convert to Linux IRQ interfaces
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
        daniel@ffwll.ch, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Message-Id: <ZAX0WQ.WYKBDC2M1I1Y2@crapouillou.net>
In-Reply-To: <YOk/S1MTPWEbe93Y@ravnborg.org>
References: <20210706074409.8664-1-tzimmermann@suse.de>
        <YOk/S1MTPWEbe93Y@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le sam., juil. 10 2021 at 08:33:47 +0200, Sam Ravnborg 
<sam@ravnborg.org> a écrit :
> Hi Thomas,
> 
> On Tue, Jul 06, 2021 at 09:44:09AM +0200, Thomas Zimmermann wrote:
>>  Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>>  IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>>  don't benefit from using it.
>> 
>>  Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>> 
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index c296472164d9..a09b7da21b53 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -33,7 +33,6 @@
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>  -#include <drm/drm_irq.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_panel.h>
>>  @@ -799,8 +798,6 @@ static const struct drm_driver 
>> ingenic_drm_driver_data = {
>>   	.fops			= &ingenic_drm_fops,
>>   	.gem_create_object	= ingenic_drm_gem_create_object,
>>   	DRM_GEM_CMA_DRIVER_OPS,
>>  -
>>  -	.irq_handler		= ingenic_drm_irq_handler,
>>   };
>> 
>>   static const struct drm_plane_funcs 
>> ingenic_drm_primary_plane_funcs = {
>>  @@ -1098,7 +1095,7 @@ static int ingenic_drm_bind(struct device 
>> *dev, bool has_components)
>>   		encoder->possible_clones = clone_mask;
>>   	}
>> 
>>  -	ret = drm_irq_install(drm, irq);
>>  +	ret = request_irq(irq, ingenic_drm_irq_handler, 0, 
>> drm->driver->name, drm);
>> 

Can't you use the devm variant?

>>   	if (ret) {
>>   		dev_err(dev, "Unable to install IRQ handler\n");
>>   		return ret;
>>  @@ -1192,14 +1189,18 @@ static void ingenic_drm_unbind(struct 
>> device *dev)
>>   {
>>   	struct ingenic_drm *priv = dev_get_drvdata(dev);
>>   	struct clk *parent_clk = clk_get_parent(priv->pix_clk);
>>  +	struct drm_device *drm = &priv->drm;
>>  +	struct platform_device *pdev = to_platform_device(drm->dev);
>>  +
>>  +	free_irq(platform_get_irq(pdev, 0), drm);
> 
> The driver was missing a drm_irq_uninstall() so the above code is
> actually a small bug-fix. It should be mentioned in the changelog.
> With this fixed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Note: I expect Paul to review too and apply.

I wasn't Cc'd? :(

-Paul

> 
> 	Sam
> 
>> 
>>   	clk_notifier_unregister(parent_clk, &priv->clock_nb);
>>   	if (priv->lcd_clk)
>>   		clk_disable_unprepare(priv->lcd_clk);
>>   	clk_disable_unprepare(priv->pix_clk);
>> 
>>  -	drm_dev_unregister(&priv->drm);
>>  -	drm_atomic_helper_shutdown(&priv->drm);
>>  +	drm_dev_unregister(drm);
>>  +	drm_atomic_helper_shutdown(drm);
>>   }
>> 
>>   static const struct component_master_ops ingenic_master_ops = {
>>  --
>>  2.32.0


