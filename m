Return-Path: <linux-mips+bounces-11475-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DEBB80F4F
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 18:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C1AB321651
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 16:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0B12F90CE;
	Wed, 17 Sep 2025 16:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egJB+hqU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA742F8BEE
	for <linux-mips@vger.kernel.org>; Wed, 17 Sep 2025 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758125527; cv=none; b=N/N4ou8L1hth59Hzdqm84Mpsu4nO91kmAQwzZKQW/AVnQ3GY0mamJwIS3GhOWdMuMITNYc3NPzZsQ51e7DygkNmbSeH5OjINLxz+/nmcyGKs8kXmlUk/W3oL2dVEs2LGkRMavzMQRQF7FkaENowgtz4tK6ziCaafGA8GrRaLGK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758125527; c=relaxed/simple;
	bh=Wmkyn+arNGgwXvW0IV7XIzWeeVc4yrlUrFqNTyxXwb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRGa6aYZsAeO31xhI7S+J6DQ7XHmvzrIPFOQ46ygUUoolTLKEW8J/E0WSgzYEbakCAOC5u3jGuD/r687znyxpE3Nv50+d7mGv5bf6LcZqTH5fyA1nGMSW+bs/DM7mqmSQ3LlzQwbiL0AorJQnP/o7I0h21DZjT+pTkvcCdJTs4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egJB+hqU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758125525; x=1789661525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Wmkyn+arNGgwXvW0IV7XIzWeeVc4yrlUrFqNTyxXwb8=;
  b=egJB+hqUiVvp5filD0omf2QW2nVsv4AEWsReilxDMfDruscI1jElj80z
   Sx39Fd51j84kQmtZYvJXpeh7iHaKRgmlHA4CkeiHW0RqKrBnSyNTYuezf
   2z7pNNk8FrBf7NxUImCnAMnt6vTsMe8zICfLER/mdIllB5of5iTc8PUpA
   FDe3YWv2qp0EWJ6knJNo1F/lSmZZUbhVERurHWTF2gNgYl5DqI4umAcWC
   /yDAucyh3fzLtIzQAD7EqV8aAzc3X4XZuFH63x1LqYaZ7Sp57ZfOAieFT
   76eAwvNL8JwCWgR5rS1is+IFxwFPbmv2yyyiQErA847brePWibdLqLnB5
   w==;
X-CSE-ConnectionGUID: EoHk+pVgSSK6nGXei/AhRg==
X-CSE-MsgGUID: fdrvyARPR2KeIO9+ZgB9tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71863361"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="71863361"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 09:12:03 -0700
X-CSE-ConnectionGUID: LFOe7+w6QOOjlQlq0URcxA==
X-CSE-MsgGUID: I2ZUJ8OxRJyVKf7t+mHaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="174570854"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 09:12:00 -0700
Date: Wed, 17 Sep 2025 19:11:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
Message-ID: <aMrdzcrx42OR_0KV@intel.com>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
 <20250917-drm-no-more-existing-state-v4-37-5d4b9889c3c8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917-drm-no-more-existing-state-v4-37-5d4b9889c3c8@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 17, 2025 at 04:46:18PM +0200, Maxime Ripard wrote:
> The ingenic CRTC atomic_enable() implementation will indirectly call
> drm_atomic_get_private_obj_state() through ingenic_drm_get_priv_state().
> 
> drm_atomic_get_private_obj_state() will either return the new state for
> the object in the global state if it exists, or will allocate a new one
> and add it to the global state.
> 
> atomic_enable() however isn't allowed to modify the global state. So
> what the implementation should use is the
> drm_atomic_get_new_private_obj_state() helper to get the new state for
> the CRTC, without performing an extra allocation.
> 
> We still need to make sure the private state will be part of the global
> state by the time atomic_enable runs, so we still need to call
> ingenic_drm_get_priv_state() in atomic_check. We can then call
> ingenic_drm_get_new_priv_state() in atomic_enable, which is a wrapper
> around drm_atomic_get_new_private_obj_state().
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Seems fine by me.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
> To: Paul Cercueil <paul@crapouillou.net>
> Cc: linux-mips@vger.kernel.org
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 05faed933e5619c796f2a4fa1906e0eaa029ac68..d3213fbf22be14b177fc1b7100c5b721d5f17924 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -245,12 +245,12 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>  	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>  	struct ingenic_drm_private_state *priv_state;
>  	unsigned int next_id;
>  
> -	priv_state = ingenic_drm_get_priv_state(priv, state);
> -	if (WARN_ON(IS_ERR(priv_state)))
> +	priv_state = ingenic_drm_get_new_priv_state(priv, state);
> +	if (WARN_ON(!priv_state))
>  		return;
>  
>  	/* Set addresses of our DMA descriptor chains */
>  	next_id = priv_state->use_palette ? HWDESC_PALETTE : 0;
>  	regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, next_id));
> @@ -338,17 +338,23 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>  {
>  	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>  									  crtc);
>  	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>  	struct drm_plane_state *f1_state, *f0_state, *ipu_state = NULL;
> +	struct ingenic_drm_private_state *priv_state;
>  
>  	if (crtc_state->gamma_lut &&
>  	    drm_color_lut_size(crtc_state->gamma_lut) != ARRAY_SIZE(priv->dma_hwdescs->palette)) {
>  		dev_dbg(priv->dev, "Invalid palette size\n");
>  		return -EINVAL;
>  	}
>  
> +	/* We will need the state in atomic_enable, so let's make sure it's part of the state */
> +	priv_state = ingenic_drm_get_priv_state(priv, state);
> +	if (IS_ERR(priv_state))
> +		return PTR_ERR(priv_state);
> +
>  	if (drm_atomic_crtc_needs_modeset(crtc_state) && priv->soc_info->has_osd) {
>  		f1_state = drm_atomic_get_plane_state(crtc_state->state,
>  						      &priv->f1);
>  		if (IS_ERR(f1_state))
>  			return PTR_ERR(f1_state);
> 
> -- 
> 2.50.1

-- 
Ville Syrjälä
Intel

