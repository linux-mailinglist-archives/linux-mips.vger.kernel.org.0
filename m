Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FB03A3D8F
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 09:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhFKHzi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 11 Jun 2021 03:55:38 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53061 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhFKHzi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 03:55:38 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E806D20005;
        Fri, 11 Jun 2021 07:53:36 +0000 (UTC)
Date:   Thu, 10 Jun 2021 16:09:19 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/11] drm/ingenic: Move no_vblank to private state
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     David Airlie <airlied@linux.ie>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <JFRHUQ.5QKJTG7CMA3P2@crapouillou.net>
In-Reply-To: <YLZWvFDJzZ6Ij2qy@phenom.ffwll.local>
References: <20210527232104.152577-1-paul@crapouillou.net>
        <20210527232104.152577-5-paul@crapouillou.net>
        <YLZWvFDJzZ6Ij2qy@phenom.ffwll.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Daniel,

Le mar., juin 1 2021 at 17:48:12 +0200, Daniel Vetter <daniel@ffwll.ch> 
a écrit :
> On Fri, May 28, 2021 at 12:20:58AM +0100, Paul Cercueil wrote:
>>  This information is carried from the ".atomic_check" to the
>>  ".atomic_commit_tail"; as such it is state-specific, and should be 
>> moved
>>  to the private state structure.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Not sure this applies to your hw, but drm_crtc_state.no_vblank exists.
> Might want to move to that instead of rolling your own. Or explain 
> why you
> need your own here in your own private state. It does look quite a bit
> like you're just rolling your own version of this support that helpers
> gained meanwhile.

If I use drm_crtc_state->no_vblank, then I need a custom 
.atomic_commit_tail() that only calls 
drm_atomic_helper_wait_for_vblanks() when !no_vblank. That works, but I 
don't understand why drm_atomic_helper_commit_tail() doesn't do that by 
default, and makes me think I'm using it wrong.

Cheers,
-Paul

> -Daniel
> 
> 
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 41 
>> ++++++++++++++++++++---
>>   1 file changed, 37 insertions(+), 4 deletions(-)
>> 
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index e81084eb3b0e..639994329c60 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -66,6 +66,8 @@ struct jz_soc_info {
>> 
>>   struct ingenic_drm_private_state {
>>   	struct drm_private_state base;
>>  +
>>  +	bool no_vblank;
>>   };
>> 
>>   struct ingenic_drm {
>>  @@ -87,7 +89,6 @@ struct ingenic_drm {
>>   	dma_addr_t dma_hwdescs_phys;
>> 
>>   	bool panel_is_sharp;
>>  -	bool no_vblank;
>> 
>>   	/*
>>   	 * clk_mutex is used to synchronize the pixel clock rate update 
>> with
>>  @@ -113,6 +114,30 @@ to_ingenic_drm_priv_state(struct 
>> drm_private_state *state)
>>   	return container_of(state, struct ingenic_drm_private_state, 
>> base);
>>   }
>> 
>>  +static struct ingenic_drm_private_state *
>>  +ingenic_drm_get_priv_state(struct ingenic_drm *priv, struct 
>> drm_atomic_state *state)
>>  +{
>>  +	struct drm_private_state *priv_state;
>>  +
>>  +	priv_state = drm_atomic_get_private_obj_state(state, 
>> &priv->private_obj);
>>  +	if (IS_ERR(priv_state))
>>  +		return ERR_CAST(priv_state);
>>  +
>>  +	return to_ingenic_drm_priv_state(priv_state);
>>  +}
>>  +
>>  +static struct ingenic_drm_private_state *
>>  +ingenic_drm_get_new_priv_state(struct ingenic_drm *priv, struct 
>> drm_atomic_state *state)
>>  +{
>>  +	struct drm_private_state *priv_state;
>>  +
>>  +	priv_state = drm_atomic_get_new_private_obj_state(state, 
>> &priv->private_obj);
>>  +	if (!priv_state)
>>  +		return NULL;
>>  +
>>  +	return to_ingenic_drm_priv_state(priv_state);
>>  +}
>>  +
>>   static bool ingenic_drm_writeable_reg(struct device *dev, unsigned 
>> int reg)
>>   {
>>   	switch (reg) {
>>  @@ -268,6 +293,7 @@ static int ingenic_drm_crtc_atomic_check(struct 
>> drm_crtc *crtc,
>>   									  crtc);
>>   	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>>   	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
>>  +	struct ingenic_drm_private_state *priv_state;
>> 
>>   	if (crtc_state->gamma_lut &&
>>   	    drm_color_lut_size(crtc_state->gamma_lut) != 
>> ARRAY_SIZE(priv->dma_hwdescs->palette)) {
>>  @@ -299,9 +325,13 @@ static int 
>> ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>>   			}
>>   		}
>> 
>>  +		priv_state = ingenic_drm_get_priv_state(priv, state);
>>  +		if (IS_ERR(priv_state))
>>  +			return PTR_ERR(priv_state);
>>  +
>>   		/* If all the planes are disabled, we won't get a VBLANK IRQ */
>>  -		priv->no_vblank = !f1_state->fb && !f0_state->fb &&
>>  -				  !(ipu_state && ipu_state->fb);
>>  +		priv_state->no_vblank = !f1_state->fb && !f0_state->fb &&
>>  +					!(ipu_state && ipu_state->fb);
>>   	}
>> 
>>   	return 0;
>>  @@ -727,6 +757,7 @@ static void 
>> ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
>>   	 */
>>   	struct drm_device *dev = old_state->dev;
>>   	struct ingenic_drm *priv = drm_device_get_priv(dev);
>>  +	struct ingenic_drm_private_state *priv_state;
>> 
>>   	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>> 
>>  @@ -736,7 +767,9 @@ static void 
>> ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
>> 
>>   	drm_atomic_helper_commit_hw_done(old_state);
>> 
>>  -	if (!priv->no_vblank)
>>  +	priv_state = ingenic_drm_get_new_priv_state(priv, old_state);
>>  +
>>  +	if (!priv_state || !priv_state->no_vblank)
>>   		drm_atomic_helper_wait_for_vblanks(dev, old_state);
>> 
>>   	drm_atomic_helper_cleanup_planes(dev, old_state);
>>  --
>>  2.30.2
>> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


