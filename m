Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2827397720
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 17:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbhFAPuF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 11:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234441AbhFAPt6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 11:49:58 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24CAC061760
        for <linux-mips@vger.kernel.org>; Tue,  1 Jun 2021 08:48:16 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so12169wmc.0
        for <linux-mips@vger.kernel.org>; Tue, 01 Jun 2021 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q8EEULV2XUyoDYA+dJtImlBO0lxdzr+eqmxQC/BBcv0=;
        b=dDkvQicam4mmftigT63dkthZ9Urj7HmvwHWc2qS9CYg42cCxyl2qe1+qo01bB8lIg+
         HJINB8hQNwINtAFSbiykAKQ+BtOvFyLOgXPX1iV57NjP/QOLenaNUiHxyU1qu6wdY+yV
         cWqODPLKvQCIGzLY17APZ0sO2JIYKuHm7V7Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Q8EEULV2XUyoDYA+dJtImlBO0lxdzr+eqmxQC/BBcv0=;
        b=FdLYQuPGHBaEofhg+AVumEtWk/LO7y6kVvBWaaND8zsjX63yCYaA8phfl2d8jvw1KX
         iqbObrz3WLPG0e//bpPQzyXKaOP7LCgE4PtB4AewRS8SrFWe4dHqdRBD5yd8KeF9x8kU
         G98aTFVpHXRaOGPaiFQ6tkK21wcflW9eJqC1DI3KdQGC8RVC18u5zPy+tInvqWykZhZd
         TCX9JYIemqav3jnRMlUL4A4OvhyBM2Mi0UN9HBxvz5KPseiXt4LAy1lnEbYCdI0fAXuR
         K/LaXZ2KG9kSLkwz7T4CTI8qZFbs/ihhwKPXpW3CXPByNwacHKKzGXF/lzLewb1ZdvQa
         G9XA==
X-Gm-Message-State: AOAM530jP+3AFhWDgId+7Fq1+r2jqBjCnm/IG0oIkkkYM63VonR9dqNk
        jSh+Mv4+Cj2KO8c/FEoXUvUgFg==
X-Google-Smtp-Source: ABdhPJwJMR5y+XSgwRtZP2Gw8DtDanT8UPxNOkko8yyNBEjSwgLo29htQ5gwQu3qFHFbl+kDugNoIg==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr589240wmi.66.1622562495359;
        Tue, 01 Jun 2021 08:48:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k6sm2966955wmi.42.2021.06.01.08.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:48:14 -0700 (PDT)
Date:   Tue, 1 Jun 2021 17:48:12 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 04/11] drm/ingenic: Move no_vblank to private state
Message-ID: <YLZWvFDJzZ6Ij2qy@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
References: <20210527232104.152577-1-paul@crapouillou.net>
 <20210527232104.152577-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527232104.152577-5-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 28, 2021 at 12:20:58AM +0100, Paul Cercueil wrote:
> This information is carried from the ".atomic_check" to the
> ".atomic_commit_tail"; as such it is state-specific, and should be moved
> to the private state structure.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Not sure this applies to your hw, but drm_crtc_state.no_vblank exists.
Might want to move to that instead of rolling your own. Or explain why you
need your own here in your own private state. It does look quite a bit
like you're just rolling your own version of this support that helpers
gained meanwhile.
-Daniel


> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 41 ++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index e81084eb3b0e..639994329c60 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -66,6 +66,8 @@ struct jz_soc_info {
>  
>  struct ingenic_drm_private_state {
>  	struct drm_private_state base;
> +
> +	bool no_vblank;
>  };
>  
>  struct ingenic_drm {
> @@ -87,7 +89,6 @@ struct ingenic_drm {
>  	dma_addr_t dma_hwdescs_phys;
>  
>  	bool panel_is_sharp;
> -	bool no_vblank;
>  
>  	/*
>  	 * clk_mutex is used to synchronize the pixel clock rate update with
> @@ -113,6 +114,30 @@ to_ingenic_drm_priv_state(struct drm_private_state *state)
>  	return container_of(state, struct ingenic_drm_private_state, base);
>  }
>  
> +static struct ingenic_drm_private_state *
> +ingenic_drm_get_priv_state(struct ingenic_drm *priv, struct drm_atomic_state *state)
> +{
> +	struct drm_private_state *priv_state;
> +
> +	priv_state = drm_atomic_get_private_obj_state(state, &priv->private_obj);
> +	if (IS_ERR(priv_state))
> +		return ERR_CAST(priv_state);
> +
> +	return to_ingenic_drm_priv_state(priv_state);
> +}
> +
> +static struct ingenic_drm_private_state *
> +ingenic_drm_get_new_priv_state(struct ingenic_drm *priv, struct drm_atomic_state *state)
> +{
> +	struct drm_private_state *priv_state;
> +
> +	priv_state = drm_atomic_get_new_private_obj_state(state, &priv->private_obj);
> +	if (!priv_state)
> +		return NULL;
> +
> +	return to_ingenic_drm_priv_state(priv_state);
> +}
> +
>  static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
>  {
>  	switch (reg) {
> @@ -268,6 +293,7 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>  									  crtc);
>  	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>  	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
> +	struct ingenic_drm_private_state *priv_state;
>  
>  	if (crtc_state->gamma_lut &&
>  	    drm_color_lut_size(crtc_state->gamma_lut) != ARRAY_SIZE(priv->dma_hwdescs->palette)) {
> @@ -299,9 +325,13 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>  			}
>  		}
>  
> +		priv_state = ingenic_drm_get_priv_state(priv, state);
> +		if (IS_ERR(priv_state))
> +			return PTR_ERR(priv_state);
> +
>  		/* If all the planes are disabled, we won't get a VBLANK IRQ */
> -		priv->no_vblank = !f1_state->fb && !f0_state->fb &&
> -				  !(ipu_state && ipu_state->fb);
> +		priv_state->no_vblank = !f1_state->fb && !f0_state->fb &&
> +					!(ipu_state && ipu_state->fb);
>  	}
>  
>  	return 0;
> @@ -727,6 +757,7 @@ static void ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
>  	 */
>  	struct drm_device *dev = old_state->dev;
>  	struct ingenic_drm *priv = drm_device_get_priv(dev);
> +	struct ingenic_drm_private_state *priv_state;
>  
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  
> @@ -736,7 +767,9 @@ static void ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
>  
>  	drm_atomic_helper_commit_hw_done(old_state);
>  
> -	if (!priv->no_vblank)
> +	priv_state = ingenic_drm_get_new_priv_state(priv, old_state);
> +
> +	if (!priv_state || !priv_state->no_vblank)
>  		drm_atomic_helper_wait_for_vblanks(dev, old_state);
>  
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
