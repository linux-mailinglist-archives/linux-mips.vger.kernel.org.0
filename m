Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5915E4400B5
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 18:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhJ2Q5z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 12:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhJ2Q5z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 12:57:55 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86273C061570;
        Fri, 29 Oct 2021 09:55:26 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id r8so4385872wra.7;
        Fri, 29 Oct 2021 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SRcEZWu8D3vX9CUuQVcWwIJfOQutmrq5UYvVkoqhCpQ=;
        b=fCaHZ62fxWekoHiW9cVt7guKLcdU2vVE4M00ZSGfnLQ2HjFzshpoRDy+jGXab8BuRN
         0XZkeC3vzL0Wq7AZaQXrXajzCE9cyG239HC6AN2rLCWs12VnEn+roPyP6maFKdDFNHbp
         aqdc3k6vLIvDrsxSRraiSqm8uUB9m+LT/wgWRkbjuSUKXnieOqjxfgFvRg/qqWqINDJI
         ASqyRESmnY1QqpxjWfLGQKwZxImnx+Sw9AlBSQbt47WkQLABZii8JNm0fJhveWEfYLVW
         3v98GKlRDbI7dY5fkYI42JOf7PTUjlt3sv42ME4zwJtcXldwByIOQdERP0Qna72voakK
         MMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SRcEZWu8D3vX9CUuQVcWwIJfOQutmrq5UYvVkoqhCpQ=;
        b=L6vgSNJ/3lZHmP04EjPOpWyaerJhqtVLV7+XP6t5zo0O3OFzugBO63+9pB7p/FUGrD
         /jDzJ9/ZyYFryv0IMPR0voDuqi7Hch70BeK5UsNGd66BpGCx4By4b7xg2IlYFjUuf1+j
         LW4nT7q1KlNWg1nw1C5OrKFnMDlNzpN8O5oJxB+xp657ZUi+/PMRf992frS/utLiVHiz
         5NU8hG9Fnm7wA+VxCgN9hzgHe6XrtZVamOqyPL5ajxotFjVAmkSeb1Dc2zBQ48mofolv
         ezS8zRisWAg08dxSKXQFWKHgavkE0TtkGA+Sw9yq3Mt8sLJdcOJp1D3HPdQj9Bpu29XO
         LCQg==
X-Gm-Message-State: AOAM5301rExBAPgmunXuKF7I8R6vF34WjjcIk/CRalV3mNPR9kFw0AVJ
        aQWQYHGfGyeCD0KO9G/mnRaokXCfs114Hr8hqIk=
X-Google-Smtp-Source: ABdhPJzY0DLuPzbZLZcd4wqLNlTKlTol7oAAaYtyLoHQGKo9FeBNuhgPN9FypHeygwYnzdqtF3IpeYFOp9Eq1Bs4hMs=
X-Received: by 2002:adf:f708:: with SMTP id r8mr10314653wrp.198.1635526525094;
 Fri, 29 Oct 2021 09:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211026181240.213806-1-paul@crapouillou.net> <20211026181240.213806-4-paul@crapouillou.net>
In-Reply-To: <20211026181240.213806-4-paul@crapouillou.net>
From:   Christophe Branchereau <cbranchereau@gmail.com>
Date:   Fri, 29 Oct 2021 18:55:14 +0200
Message-ID: <CAFsFa86iJc2Hc8eqfQjsPQWx+xwMiC_K+NN-MTHZ0UE00eAAeg@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 3/6] drm/ingenic: Move IPU scale settings to
 private state
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Christophe Branchereau <cbranchereau@gmail.com>

On Tue, Oct 26, 2021 at 8:13 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> The IPU scaling information is computed in the plane's ".atomic_check"
> callback, and used in the ".atomic_update" callback. As such, it is
> state-specific, and should be moved to a private state structure.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-ipu.c | 73 ++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index c819293b8317..2737fc521e15 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -47,6 +47,8 @@ struct soc_info {
>
>  struct ingenic_ipu_private_state {
>         struct drm_private_state base;
> +
> +       unsigned int num_w, num_h, denom_w, denom_h;
>  };
>
>  struct ingenic_ipu {
> @@ -58,8 +60,6 @@ struct ingenic_ipu {
>         const struct soc_info *soc_info;
>         bool clk_enabled;
>
> -       unsigned int num_w, num_h, denom_w, denom_h;
> -
>         dma_addr_t addr_y, addr_u, addr_v;
>
>         struct drm_property *sharpness_prop;
> @@ -85,6 +85,30 @@ to_ingenic_ipu_priv_state(struct drm_private_state *state)
>         return container_of(state, struct ingenic_ipu_private_state, base);
>  }
>
> +static struct ingenic_ipu_private_state *
> +ingenic_ipu_get_priv_state(struct ingenic_ipu *priv, struct drm_atomic_state *state)
> +{
> +       struct drm_private_state *priv_state;
> +
> +       priv_state = drm_atomic_get_private_obj_state(state, &priv->private_obj);
> +       if (IS_ERR(priv_state))
> +               return ERR_CAST(priv_state);
> +
> +       return to_ingenic_ipu_priv_state(priv_state);
> +}
> +
> +static struct ingenic_ipu_private_state *
> +ingenic_ipu_get_new_priv_state(struct ingenic_ipu *priv, struct drm_atomic_state *state)
> +{
> +       struct drm_private_state *priv_state;
> +
> +       priv_state = drm_atomic_get_new_private_obj_state(state, &priv->private_obj);
> +       if (!priv_state)
> +               return NULL;
> +
> +       return to_ingenic_ipu_priv_state(priv_state);
> +}
> +
>  /*
>   * Apply conventional cubic convolution kernel. Both parameters
>   *  and return value are 15.16 signed fixed-point.
> @@ -305,11 +329,16 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>         const struct drm_format_info *finfo;
>         u32 ctrl, stride = 0, coef_index = 0, format = 0;
>         bool needs_modeset, upscaling_w, upscaling_h;
> +       struct ingenic_ipu_private_state *ipu_state;
>         int err;
>
>         if (!newstate || !newstate->fb)
>                 return;
>
> +       ipu_state = ingenic_ipu_get_new_priv_state(ipu, state);
> +       if (WARN_ON(!ipu_state))
> +               return;
> +
>         finfo = drm_format_info(newstate->fb->format->format);
>
>         if (!ipu->clk_enabled) {
> @@ -482,27 +511,27 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>         if (ipu->soc_info->has_bicubic)
>                 ctrl |= JZ_IPU_CTRL_ZOOM_SEL;
>
> -       upscaling_w = ipu->num_w > ipu->denom_w;
> +       upscaling_w = ipu_state->num_w > ipu_state->denom_w;
>         if (upscaling_w)
>                 ctrl |= JZ_IPU_CTRL_HSCALE;
>
> -       if (ipu->num_w != 1 || ipu->denom_w != 1) {
> +       if (ipu_state->num_w != 1 || ipu_state->denom_w != 1) {
>                 if (!ipu->soc_info->has_bicubic && !upscaling_w)
> -                       coef_index |= (ipu->denom_w - 1) << 16;
> +                       coef_index |= (ipu_state->denom_w - 1) << 16;
>                 else
> -                       coef_index |= (ipu->num_w - 1) << 16;
> +                       coef_index |= (ipu_state->num_w - 1) << 16;
>                 ctrl |= JZ_IPU_CTRL_HRSZ_EN;
>         }
>
> -       upscaling_h = ipu->num_h > ipu->denom_h;
> +       upscaling_h = ipu_state->num_h > ipu_state->denom_h;
>         if (upscaling_h)
>                 ctrl |= JZ_IPU_CTRL_VSCALE;
>
> -       if (ipu->num_h != 1 || ipu->denom_h != 1) {
> +       if (ipu_state->num_h != 1 || ipu_state->denom_h != 1) {
>                 if (!ipu->soc_info->has_bicubic && !upscaling_h)
> -                       coef_index |= ipu->denom_h - 1;
> +                       coef_index |= ipu_state->denom_h - 1;
>                 else
> -                       coef_index |= ipu->num_h - 1;
> +                       coef_index |= ipu_state->num_h - 1;
>                 ctrl |= JZ_IPU_CTRL_VRSZ_EN;
>         }
>
> @@ -513,13 +542,13 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>         /* Set the LUT index register */
>         regmap_write(ipu->map, JZ_REG_IPU_RSZ_COEF_INDEX, coef_index);
>
> -       if (ipu->num_w != 1 || ipu->denom_w != 1)
> +       if (ipu_state->num_w != 1 || ipu_state->denom_w != 1)
>                 ingenic_ipu_set_coefs(ipu, JZ_REG_IPU_HRSZ_COEF_LUT,
> -                                     ipu->num_w, ipu->denom_w);
> +                                     ipu_state->num_w, ipu_state->denom_w);
>
> -       if (ipu->num_h != 1 || ipu->denom_h != 1)
> +       if (ipu_state->num_h != 1 || ipu_state->denom_h != 1)
>                 ingenic_ipu_set_coefs(ipu, JZ_REG_IPU_VRSZ_COEF_LUT,
> -                                     ipu->num_h, ipu->denom_h);
> +                                     ipu_state->num_h, ipu_state->denom_h);
>
>         /* Clear STATUS register */
>         regmap_write(ipu->map, JZ_REG_IPU_STATUS, 0);
> @@ -531,7 +560,8 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>         dev_dbg(ipu->dev, "Scaling %ux%u to %ux%u (%u:%u horiz, %u:%u vert)\n",
>                 newstate->src_w >> 16, newstate->src_h >> 16,
>                 newstate->crtc_w, newstate->crtc_h,
> -               ipu->num_w, ipu->denom_w, ipu->num_h, ipu->denom_h);
> +               ipu_state->num_w, ipu_state->denom_w,
> +               ipu_state->num_h, ipu_state->denom_h);
>  }
>
>  static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
> @@ -545,6 +575,7 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>         struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
>         struct drm_crtc *crtc = new_plane_state->crtc ?: old_plane_state->crtc;
>         struct drm_crtc_state *crtc_state;
> +       struct ingenic_ipu_private_state *ipu_state;
>
>         if (!crtc)
>                 return 0;
> @@ -553,6 +584,10 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>         if (WARN_ON(!crtc_state))
>                 return -EINVAL;
>
> +       ipu_state = ingenic_ipu_get_priv_state(ipu, state);
> +       if (IS_ERR(ipu_state))
> +               return PTR_ERR(ipu_state);
> +
>         /* Request a full modeset if we are enabling or disabling the IPU. */
>         if (!old_plane_state->crtc ^ !new_plane_state->crtc)
>                 crtc_state->mode_changed = true;
> @@ -605,10 +640,10 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
>         if (num_h > max_h)
>                 return -EINVAL;
>
> -       ipu->num_w = num_w;
> -       ipu->num_h = num_h;
> -       ipu->denom_w = denom_w;
> -       ipu->denom_h = denom_h;
> +       ipu_state->num_w = num_w;
> +       ipu_state->num_h = num_h;
> +       ipu_state->denom_w = denom_w;
> +       ipu_state->denom_h = denom_h;
>
>  out_check_damage:
>         if (ingenic_drm_map_noncoherent(ipu->master))
> --
> 2.33.0
>
