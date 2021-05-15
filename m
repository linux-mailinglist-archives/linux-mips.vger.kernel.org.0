Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B9B381AEC
	for <lists+linux-mips@lfdr.de>; Sat, 15 May 2021 22:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbhEOUJt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 15 May 2021 16:09:49 -0400
Received: from aposti.net ([89.234.176.197]:42434 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231280AbhEOUJq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 15 May 2021 16:09:46 -0400
Date:   Sat, 15 May 2021 21:08:14 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 3/3] drm/ingenic: Add option to alloc cached GEM
 buffers
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <QXZ5TQ.6UOSSUCWI08C2@crapouillou.net>
In-Reply-To: <4aae6b75-4f7e-2b6e-d8e7-b2599fdfd49d@suse.de>
References: <20210515145359.64802-1-paul@crapouillou.net>
        <20210515145359.64802-4-paul@crapouillou.net>
        <4aae6b75-4f7e-2b6e-d8e7-b2599fdfd49d@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,


Le sam., mai 15 2021 at 21:42:40 +0200, Thomas Zimmermann 
<tzimmermann@suse.de> a �crit :
> Hi
> 
> Am 15.05.21 um 16:53 schrieb Paul Cercueil:
>> Alloc GEM buffers backed by noncoherent memory on SoCs where it is
>> actually faster than write-combine.
>> 
>> This dramatically speeds up software rendering on these SoCs, even 
>> for
>> tasks where write-combine memory should in theory be faster (e.g. 
>> simple
>> blits).
>> 
>> v3: The option is now selected per-SoC instead of being a module
>>      parameter.
>> 
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 56 
>> ++++++++++++++++++++++-
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c     | 18 ++++++--
>>   2 files changed, 68 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index 09225b770bb8..5f64e8583eec 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/component.h>
>>   #include <linux/clk.h>
>>   #include <linux/dma-mapping.h>
>> +#include <linux/io.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/of_device.h>
>> @@ -23,6 +24,7 @@
>>   #include <drm/drm_color_mgmt.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_damage_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_encoder.h>
>>   #include <drm/drm_gem_cma_helper.h>
>> @@ -57,6 +59,7 @@ struct ingenic_dma_hwdescs {
>>   struct jz_soc_info {
>>   	bool needs_dev_clk;
>>   	bool has_osd;
>> +	bool map_noncoherent;
>>   	unsigned int max_width, max_height;
>>   	const u32 *formats_f0, *formats_f1;
>>   	unsigned int num_formats_f0, num_formats_f1;
>> @@ -410,6 +413,8 @@ static int ingenic_drm_plane_atomic_check(struct 
>> drm_plane *plane,
>>   	     old_plane_state->fb->format->format != 
>> new_plane_state->fb->format->format))
>>   		crtc_state->mode_changed = true;
>>   +	drm_atomic_helper_check_plane_damage(state, new_plane_state);
>> +
>>   	return 0;
>>   }
>>   @@ -544,8 +549,8 @@ static void 
>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   					    struct drm_atomic_state *state)
>>   {
>>   	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
>> -	struct drm_plane_state *newstate = 
>> drm_atomic_get_new_plane_state(state,
>> -									  plane);
>> +	struct drm_plane_state *newstate = 
>> drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_plane_state *oldstate = 
>> drm_atomic_get_old_plane_state(state, plane);
>>   	struct drm_crtc_state *crtc_state;
>>   	struct ingenic_dma_hwdesc *hwdesc;
>>   	unsigned int width, height, cpp, offset;
>> @@ -553,6 +558,8 @@ static void 
>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   	u32 fourcc;
>>     	if (newstate && newstate->fb) {
>> +		drm_gem_cma_sync_data(&priv->drm, oldstate, newstate);
>> +
>>   		crtc_state = newstate->crtc->state;
>>     		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
>> @@ -742,6 +749,43 @@ static void ingenic_drm_disable_vblank(struct 
>> drm_crtc *crtc)
>>   	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL, 
>> JZ_LCD_CTRL_EOF_IRQ, 0);
>>   }
>>   +static int ingenic_drm_atomic_helper_dirtyfb(struct 
>> drm_framebuffer *fb,
>> +					     struct drm_file *file_priv,
>> +					     unsigned int flags,
>> +					     unsigned int color,
>> +					     struct drm_clip_rect *clips,
>> +					     unsigned int num_clips)
>> +{
>> +	struct ingenic_drm *priv = drm_device_get_priv(fb->dev);
>> +
>> +	if (!priv->soc_info->map_noncoherent)
>> +		return 0;
> 
> I'm not sure you can get away without calling 
> drm_atomic_helper_dirtyfb(). The function does some things with the 
> plane's damage-clips property. If you don't call it here, the plane 
> might pile up unhandled clipping areas. It's better to call it and 
> rely on the test in drm_gem_cma_sync_data(). See below on how to 
> optimize this.

I guess that would work if I don't enable fb damage clips if 
!map_noncoherent, but I'm missing that.

>> +
>> +	return drm_atomic_helper_dirtyfb(fb, file_priv, flags,
>> +					 color, clips, num_clips);
>> +}
>> +
>> +static const struct drm_framebuffer_funcs ingenic_drm_gem_fb_funcs 
>> = {
>> +	.destroy	= drm_gem_fb_destroy,
>> +	.create_handle	= drm_gem_fb_create_handle,
>> +	.dirty          = ingenic_drm_atomic_helper_dirtyfb,
>> +};
> 
> You don't seem to be using this anywhere. You have to implement a 
> custom fb_create for drm_mode_config_funcs. [1]

You are totally right, my v2 had a ingenic_drm_gem_fb_create() and it 
got dropped somehow.

> BUT: I think the overall approach should be to only use this on SoCs 
> with non-coherency setting. Use drm_gem_fb_create() on systems 
> without non-coherency and use drm_gem_fb_create_with_dirty() on 
> systems with non-coherency (i.e., have two instances of 
> drm_mode_config_funcs). Only call drm_plane_enable_fb_damage_clips() 
> on systems with non-coherency.

Yes, that was the idea - enable this according to 
(priv->soc_info->map_noncoherent) which is set only on the SoCs where 
it makes sense.

>> +
>> +static struct drm_gem_object *
>> +ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
>> +{
>> +	struct ingenic_drm *priv = drm_device_get_priv(drm);
>> +	struct drm_gem_cma_object *obj;
>> +
>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +	if (!obj)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	obj->map_noncoherent = priv->soc_info->map_noncoherent;
>> +
>> +	return &obj->base;
>> +}
>> +
>>   DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
>>     static const struct drm_driver ingenic_drm_driver_data = {
>> @@ -754,6 +798,7 @@ static const struct drm_driver 
>> ingenic_drm_driver_data = {
>>   	.patchlevel		= 0,
>>     	.fops			= &ingenic_drm_fops,
>> +	.gem_create_object	= ingenic_drm_gem_create_object,
>>   	DRM_GEM_CMA_DRIVER_OPS,
>>     	.irq_handler		= ingenic_drm_irq_handler,
>> @@ -961,6 +1006,8 @@ static int ingenic_drm_bind(struct device *dev, 
>> bool has_components)
>>   		return ret;
>>   	}
>>   +	drm_plane_enable_fb_damage_clips(&priv->f1);
>> +
>>   	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
>>     	ret = drm_crtc_init_with_planes(drm, &priv->crtc, primary,
>> @@ -989,6 +1036,8 @@ static int ingenic_drm_bind(struct device *dev, 
>> bool has_components)
>>   			return ret;
>>   		}
>>   +		drm_plane_enable_fb_damage_clips(&priv->f0);
>> +
>>   		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
>>   			ret = component_bind_all(dev, drm);
>>   			if (ret) {
>> @@ -1245,6 +1294,7 @@ static const u32 jz4770_formats_f0[] = {
>>   static const struct jz_soc_info jz4740_soc_info = {
>>   	.needs_dev_clk = true,
>>   	.has_osd = false,
>> +	.map_noncoherent = false,
>>   	.max_width = 800,
>>   	.max_height = 600,
>>   	.formats_f1 = jz4740_formats,
>> @@ -1255,6 +1305,7 @@ static const struct jz_soc_info 
>> jz4740_soc_info = {
>>   static const struct jz_soc_info jz4725b_soc_info = {
>>   	.needs_dev_clk = false,
>>   	.has_osd = true,
>> +	.map_noncoherent = false,
>>   	.max_width = 800,
>>   	.max_height = 600,
>>   	.formats_f1 = jz4725b_formats_f1,
>> @@ -1266,6 +1317,7 @@ static const struct jz_soc_info 
>> jz4725b_soc_info = {
>>   static const struct jz_soc_info jz4770_soc_info = {
>>   	.needs_dev_clk = false,
>>   	.has_osd = true,
>> +	.map_noncoherent = true,
>>   	.max_width = 1280,
>>   	.max_height = 720,
>>   	.formats_f1 = jz4770_formats_f1,
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c 
>> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>> index 3b1091e7c0cd..a4d1b500c3ad 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>> @@ -20,10 +20,13 @@
>>     #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_damage_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_cma_helper.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>>   #include <drm/drm_plane.h>
>>   #include <drm/drm_plane_helper.h>
>>   #include <drm/drm_property.h>
>> @@ -285,8 +288,8 @@ static void 
>> ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>>   					    struct drm_atomic_state *state)
>>   {
>>   	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
>> -	struct drm_plane_state *newstate = 
>> drm_atomic_get_new_plane_state(state,
>> -									  plane);
>> +	struct drm_plane_state *newstate = 
>> drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_plane_state *oldstate = 
>> drm_atomic_get_new_plane_state(state, plane);
> 
> get_old_state ?
> 
>>   	const struct drm_format_info *finfo;
>>   	u32 ctrl, stride = 0, coef_index = 0, format = 0;
>>   	bool needs_modeset, upscaling_w, upscaling_h;
>> @@ -317,6 +320,8 @@ static void 
>> ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>>   				JZ_IPU_CTRL_CHIP_EN | JZ_IPU_CTRL_LCDC_SEL);
>>   	}
>>   +	drm_gem_cma_sync_data(ipu->drm, oldstate, newstate);
>> +
> 
> If you want to optimize, maybe put this line behind
> 
>   if (priv->soc_info->map_noncoherent)
> 
>>   	/* New addresses will be committed in vblank handler... */
>>   	ipu->addr_y = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
>>   	if (finfo->num_planes > 1)
>> @@ -541,7 +546,7 @@ static int ingenic_ipu_plane_atomic_check(struct 
>> drm_plane *plane,
>>     	if (!new_plane_state->crtc ||
>>   	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
>> -		return 0;
>> +		goto out_check_damage;
>>     	/* Plane must be fully visible */
>>   	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0 ||
>> @@ -558,7 +563,7 @@ static int ingenic_ipu_plane_atomic_check(struct 
>> drm_plane *plane,
>>   		return -EINVAL;
>>     	if (!osd_changed(new_plane_state, old_plane_state))
>> -		return 0;
>> +		goto out_check_damage;
>>     	crtc_state->mode_changed = true;
>>   @@ -592,6 +597,9 @@ static int 
>> ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>>   	ipu->denom_w = denom_w;
>>   	ipu->denom_h = denom_h;
>>   +out_check_damage:
>> +	drm_atomic_helper_check_plane_damage(state, new_plane_state);
>> +
> 
> If you implement my suggestion above, this line could also be behind
> 
>   if (priv->soc_info->map_noncoherent)

Noted, thanks.

Cheers,
-Paul

> Best regards
> 
> Thomas
> 
> 
> 
> [1] 
> https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/drm/ingenic/ingenic-drm-drv.c#L808
> 
> 
> 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N�rnberg, Germany
> (HRB 36809, AG N�rnberg)
> Gesch�ftsf�hrer: Felix Imend�rffer
> 


