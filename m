Return-Path: <linux-mips+bounces-11195-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8AB516AE
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 14:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5853B3B11FB
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 12:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6C23128BF;
	Wed, 10 Sep 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XX6UMLXK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541C276051
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757506807; cv=none; b=kyNsa3gzIbX8gset9xzFbExToJJQVkHm20f55Hq73FTe3GOY4PGF4aVmf2BBPxtPxz1iKhG5BInkHVrQ0VBYNEqrfAAE1HF5zOvF6nbgnESy1BkT/xSL7Ru/IPK8zrP9HQoWlaqXK5L7wS9vTg3aiGFMZqj4LlqRc23bpY0e6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757506807; c=relaxed/simple;
	bh=rgatcfpSHJFIq03+1BpCz0qXxfXWZcNtAG8djb+d++Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiXd/gxQbSWK31HeGvx6cafzGlZRDZuR9VexKR7iWIVf3lyqW4r4Xh+Qo3MEUmD+Ig/wHzg5QKhji0iYJqkUaU8cdJz/vCd+kZ9Snu7xgC29YvmhArqP9Om/8iOvG5HhZgBLujW7cd8isPvKsENDAs5l5mRrr6+9owZR6Ogx7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XX6UMLXK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757506806; x=1789042806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rgatcfpSHJFIq03+1BpCz0qXxfXWZcNtAG8djb+d++Y=;
  b=XX6UMLXKmPkFyjl4raZGKm8KA+fvg3Ix4zNOUwK77NwqqhV8PpfqqpPm
   f9t0vFBpc8mw3BNL0W3A5s3fZLH56EO1nFkdwHH/XjT9dENT6R9LGv+tF
   CSh3sfMPvs1UWEmG7FRQh+kg5cP8F5R2fZOxaTcP6Lx/PmbT2cyw4zcAE
   mMj7TKcCLguteKlLpzA9yKmZ1huEUPt+8pIv8AuBpdUW8kLs97cpmBSC+
   mcBqtBzzTqo11tEjpiXZyGIwlD0xQRlaN2aPL37h7TjYoqWxMN+OJ94h+
   tSjiRLJXlB/A7Wt0kvzm1Ki1L57M8P47lTF7mnu+0udq5WfHUzMAF5tF7
   g==;
X-CSE-ConnectionGUID: 4Xe3MKddQFOkdSd2mWQ9Iw==
X-CSE-MsgGUID: aBeKfmfRSKmXreK0Ikhx6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59889480"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="59889480"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 05:20:05 -0700
X-CSE-ConnectionGUID: 6qIYDzrDR+mAt+kmM5J0pg==
X-CSE-MsgGUID: /ifEP50AT+CXv3GriT5P8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="173215240"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.88])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 05:20:02 -0700
Date: Wed, 10 Sep 2025 15:19:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
Message-ID: <aMFs7pqJISInxHkT@intel.com>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-37-1c7a7d960c33@kernel.org>
 <aMAxEjIJOvxmOj2D@intel.com>
 <3d9058a503d6b852756476490f091e43358c21ba.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d9058a503d6b852756476490f091e43358c21ba.camel@crapouillou.net>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 09, 2025 at 04:45:27PM +0200, Paul Cercueil wrote:
> Hi Ville,
> 
> Le mardi 09 septembre 2025 à 16:52 +0300, Ville Syrjälä a écrit :
> > On Tue, Sep 09, 2025 at 01:27:56PM +0200, Maxime Ripard wrote:
> > > The ingenic CRTC atomic_enable() implementation will indirectly
> > > call
> > > drm_atomic_get_private_obj_state() through
> > > ingenic_drm_get_priv_state().
> > > 
> > > drm_atomic_get_private_obj_state() will either return the new state
> > > for
> > > the object in the global state if it exists, or will allocate a new
> > > one
> > > and add it to the global state.
> > > 
> > > atomic_enable() however isn't allowed to modify the global state.
> > > So
> > > what the implementation should use is the
> > > drm_atomic_get_new_private_obj_state() helper to get the new state
> > > for
> > > the CRTC, without performing an extra allocation.
> > > 
> > > The ingenic driver has a wrapper around that helper with
> > > ingenic_drm_get_new_priv_state(), so let's use that instead.
> > > 
> > > Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > 
> > > ---
> > > To: Paul Cercueil <paul@crapouillou.net>
> > > Cc: linux-mips@vger.kernel.org
> > > ---
> > >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > index
> > > 05faed933e5619c796f2a4fa1906e0eaa029ac68..a1b641d63fc500dc169d0b0e2
> > > 2f93168c343a242 100644
> > > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > @@ -245,11 +245,11 @@ static void
> > > ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> > >  {
> > >  	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
> > >  	struct ingenic_drm_private_state *priv_state;
> > >  	unsigned int next_id;
> > >  
> > > -	priv_state = ingenic_drm_get_priv_state(priv, state);
> > > +	priv_state = ingenic_drm_get_new_priv_state(priv, state);
> > >  	if (WARN_ON(IS_ERR(priv_state)))
> > 
> > get_new_state() will never return an error pointer. It's either
> > a valid pointer or NULL.
> 
> Good catch.
> 
> > To me it looks like this could potentially be NULL here as the
> > get_pvi_state() call is done from the plane .atomic_check()
> > whereas this gets called for the crtc. So if the plane is
> > disabled there might not be any private state included in the
> > commit.
> > 
> > Not sure how this driver/hardware is supposed to work so not
> > sure what the proper fix for that is...
> 
> Would it be just a matter of calling drm_atomic_get_private_obj_state()
> in the crtc's .atomic_check() to make sure the object is created?

Looks like this thing only has the one crtc, so yeah, seems
fine to it uncoditionally there. With multiple crtcs the
private object locking would start to hinder parallelism.

-- 
Ville Syrjälä
Intel

