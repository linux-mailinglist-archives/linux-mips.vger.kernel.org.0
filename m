Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7073A3E96
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 11:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhFKJIS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 05:08:18 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:53905 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhFKJIR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 05:08:17 -0400
Received: by mail-wm1-f49.google.com with SMTP id b205so2974811wmb.3
        for <linux-mips@vger.kernel.org>; Fri, 11 Jun 2021 02:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+51tWRBJOECKbgqOJb7T24ictkPSs8YMANfZV9c7qLs=;
        b=CGAsmp7uKksJknhqrm4uU/pGbHtB9kMow+NVUe501pRxI4Y3t7hAm8UMHwmR5E03P5
         f+PSVObIZYqzBSifEjmm1mU6PJVJ+8LGDtq6Hlk4kBZ3snx6wCYyxO2TaMGgiHTnz7TQ
         mWqRBDXypuvDHQlEgCBRWuijzZYSlx8PH51Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=+51tWRBJOECKbgqOJb7T24ictkPSs8YMANfZV9c7qLs=;
        b=LtU71lJ2so2SjNlK7HpKGyhHKeecyZxaXK/vh0dVkyGGH6+rMCGoGLYMuB53e5asYr
         /0ztqBW3Jga93xZ4bUvuBqRITnEx2MklN8RFBv78WaTpmRtLb1SMjQx8lznnzzH86gr4
         /p1KUMZjFV+eeFjdipIgS+yV3UtAkCCwlvekGRwfmUdO7S8cif1DMpZtoEXjVHDq00+O
         c5WuF7i5DQ4rsW/HXAfAmmEEluaWNclvgZz0E6pEES+xe5wwAVAg/qhXmkIAVBYwMuMA
         nVcoKsMkDjyIT5rQp2FN9DtsiB/mpl1j8xDlgE4BU9QnIAkO0wwGh04wnxqpJxPQlyH0
         KBZw==
X-Gm-Message-State: AOAM533W/KcxiuzOG7VfjXh7Mwdy5afy3mgUI+4AP9LnjZHNJ7MxUbeZ
        n/B3v9k9BAyuXbc+APLhIFPMYw==
X-Google-Smtp-Source: ABdhPJz0QUrANSrRTyrageDmbHGZwg5kSUwAo2nBMrEIdnYQHUu29FplnyPdbftz688MCNpK92XJ1g==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr2897830wmk.54.1623402319116;
        Fri, 11 Jun 2021 02:05:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k5sm6590192wrv.85.2021.06.11.02.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 02:05:18 -0700 (PDT)
Date:   Fri, 11 Jun 2021 11:05:16 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 04/11] drm/ingenic: Move no_vblank to private state
Message-ID: <YMMnTIA20uy5GkFq@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
References: <20210527232104.152577-1-paul@crapouillou.net>
 <20210527232104.152577-5-paul@crapouillou.net>
 <YLZWvFDJzZ6Ij2qy@phenom.ffwll.local>
 <JFRHUQ.5QKJTG7CMA3P2@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <JFRHUQ.5QKJTG7CMA3P2@crapouillou.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 10, 2021 at 04:09:19PM +0100, Paul Cercueil wrote:
> Hi Daniel,
> 
> Le mar., juin 1 2021 at 17:48:12 +0200, Daniel Vetter <daniel@ffwll.ch> a
> �crit :
> > On Fri, May 28, 2021 at 12:20:58AM +0100, Paul Cercueil wrote:
> > >  This information is carried from the ".atomic_check" to the
> > >  ".atomic_commit_tail"; as such it is state-specific, and should be
> > > moved
> > >  to the private state structure.
> > > 
> > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > 
> > Not sure this applies to your hw, but drm_crtc_state.no_vblank exists.
> > Might want to move to that instead of rolling your own. Or explain why
> > you
> > need your own here in your own private state. It does look quite a bit
> > like you're just rolling your own version of this support that helpers
> > gained meanwhile.
> 
> If I use drm_crtc_state->no_vblank, then I need a custom
> .atomic_commit_tail() that only calls drm_atomic_helper_wait_for_vblanks()
> when !no_vblank. That works, but I don't understand why
> drm_atomic_helper_commit_tail() doesn't do that by default, and makes me
> think I'm using it wrong.

So the recommendation is to have your own commit_tail and use
drm_atomic_helper_wait_for_flip_done(). But also if wait_for_vblanks dies
on you, there's a driver bug: If vblanks arent available, then the
drm_crtc_vblank_get should fail. If that's not the case then I guess some
bigger issues to be fixed because userspace might also do a vblank wait
(for timing the next frame), so that really needs to work correctly.

That's kinda why I put that wait_for_vblank in there by default, it forces
drivers to be correct.

If you're wondering how that's done: This is why the driver
->enable_vblank callback can return an error code. So maybe the real fix
here is in there, and everything else can stay as-is?

Another thing is that if you call drm_crtc_vblank_on/off correctly, this
should also work out correctly - attempted vblank waits outside of when
the vblank is running should fail.

Maybe something fell off here in this area because it's tricky, but the
infrastructure should be here already.
-Daniel

> 
> Cheers,
> -Paul
> 
> > -Daniel
> > 
> > 
> > >  ---
> > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 41
> > > ++++++++++++++++++++---
> > >   1 file changed, 37 insertions(+), 4 deletions(-)
> > > 
> > >  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  index e81084eb3b0e..639994329c60 100644
> > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  @@ -66,6 +66,8 @@ struct jz_soc_info {
> > > 
> > >   struct ingenic_drm_private_state {
> > >   	struct drm_private_state base;
> > >  +
> > >  +	bool no_vblank;
> > >   };
> > > 
> > >   struct ingenic_drm {
> > >  @@ -87,7 +89,6 @@ struct ingenic_drm {
> > >   	dma_addr_t dma_hwdescs_phys;
> > > 
> > >   	bool panel_is_sharp;
> > >  -	bool no_vblank;
> > > 
> > >   	/*
> > >   	 * clk_mutex is used to synchronize the pixel clock rate update
> > > with
> > >  @@ -113,6 +114,30 @@ to_ingenic_drm_priv_state(struct
> > > drm_private_state *state)
> > >   	return container_of(state, struct ingenic_drm_private_state,
> > > base);
> > >   }
> > > 
> > >  +static struct ingenic_drm_private_state *
> > >  +ingenic_drm_get_priv_state(struct ingenic_drm *priv, struct
> > > drm_atomic_state *state)
> > >  +{
> > >  +	struct drm_private_state *priv_state;
> > >  +
> > >  +	priv_state = drm_atomic_get_private_obj_state(state,
> > > &priv->private_obj);
> > >  +	if (IS_ERR(priv_state))
> > >  +		return ERR_CAST(priv_state);
> > >  +
> > >  +	return to_ingenic_drm_priv_state(priv_state);
> > >  +}
> > >  +
> > >  +static struct ingenic_drm_private_state *
> > >  +ingenic_drm_get_new_priv_state(struct ingenic_drm *priv, struct
> > > drm_atomic_state *state)
> > >  +{
> > >  +	struct drm_private_state *priv_state;
> > >  +
> > >  +	priv_state = drm_atomic_get_new_private_obj_state(state,
> > > &priv->private_obj);
> > >  +	if (!priv_state)
> > >  +		return NULL;
> > >  +
> > >  +	return to_ingenic_drm_priv_state(priv_state);
> > >  +}
> > >  +
> > >   static bool ingenic_drm_writeable_reg(struct device *dev, unsigned
> > > int reg)
> > >   {
> > >   	switch (reg) {
> > >  @@ -268,6 +293,7 @@ static int ingenic_drm_crtc_atomic_check(struct
> > > drm_crtc *crtc,
> > >   									  crtc);
> > >   	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
> > >   	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
> > >  +	struct ingenic_drm_private_state *priv_state;
> > > 
> > >   	if (crtc_state->gamma_lut &&
> > >   	    drm_color_lut_size(crtc_state->gamma_lut) !=
> > > ARRAY_SIZE(priv->dma_hwdescs->palette)) {
> > >  @@ -299,9 +325,13 @@ static int
> > > ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
> > >   			}
> > >   		}
> > > 
> > >  +		priv_state = ingenic_drm_get_priv_state(priv, state);
> > >  +		if (IS_ERR(priv_state))
> > >  +			return PTR_ERR(priv_state);
> > >  +
> > >   		/* If all the planes are disabled, we won't get a VBLANK IRQ */
> > >  -		priv->no_vblank = !f1_state->fb && !f0_state->fb &&
> > >  -				  !(ipu_state && ipu_state->fb);
> > >  +		priv_state->no_vblank = !f1_state->fb && !f0_state->fb &&
> > >  +					!(ipu_state && ipu_state->fb);
> > >   	}
> > > 
> > >   	return 0;
> > >  @@ -727,6 +757,7 @@ static void
> > > ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
> > >   	 */
> > >   	struct drm_device *dev = old_state->dev;
> > >   	struct ingenic_drm *priv = drm_device_get_priv(dev);
> > >  +	struct ingenic_drm_private_state *priv_state;
> > > 
> > >   	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > > 
> > >  @@ -736,7 +767,9 @@ static void
> > > ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
> > > 
> > >   	drm_atomic_helper_commit_hw_done(old_state);
> > > 
> > >  -	if (!priv->no_vblank)
> > >  +	priv_state = ingenic_drm_get_new_priv_state(priv, old_state);
> > >  +
> > >  +	if (!priv_state || !priv_state->no_vblank)
> > >   		drm_atomic_helper_wait_for_vblanks(dev, old_state);
> > > 
> > >   	drm_atomic_helper_cleanup_planes(dev, old_state);
> > >  --
> > >  2.30.2
> > > 
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
