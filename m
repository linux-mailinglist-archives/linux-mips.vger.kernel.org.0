Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D503E3C93
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 21:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbhHHTu3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Aug 2021 15:50:29 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:40883 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbhHHTu3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Aug 2021 15:50:29 -0400
Received: from [192.168.1.18] ([90.126.253.178])
        by mwinf5d25 with ME
        id f7q42500E3riaq2037q5nP; Sun, 08 Aug 2021 21:50:08 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Aug 2021 21:50:08 +0200
X-ME-IP: 90.126.253.178
Subject: Re: [PATCH 3/8] drm/ingenic: Use standard
 drm_atomic_helper_commit_tail
To:     Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-4-paul@crapouillou.net>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <f3b761ed-4e71-e8b8-f2b5-f4f7f1547fed@wanadoo.fr>
Date:   Sun, 8 Aug 2021 21:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808134526.119198-4-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Le 08/08/2021 à 15:45, Paul Cercueil a écrit :
> By making the CRTC's .vblank_enable() function return an error when it
> is known that the hardware won't deliver a VBLANK, we can drop the
> ingenic_drm_atomic_helper_commit_tail() function and use the standard
> drm_atomic_helper_commit_tail() function instead.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 ++++-------------------
>   1 file changed, 4 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index bc71ba44ccf4..3ed7c27a8dde 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -706,29 +706,6 @@ static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
>   	}
>   }
>   
> -static void ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
> -{
> -	/*
> -	 * Just your regular drm_atomic_helper_commit_tail(), but only calls
> -	 * drm_atomic_helper_wait_for_vblanks() if priv->no_vblank.
> -	 */
> -	struct drm_device *dev = old_state->dev;
> -	struct ingenic_drm *priv = drm_device_get_priv(dev);
> -
> -	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> -
> -	drm_atomic_helper_commit_planes(dev, old_state, 0);
> -
> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> -
> -	drm_atomic_helper_commit_hw_done(old_state);
> -
> -	if (!priv->no_vblank)
> -		drm_atomic_helper_wait_for_vblanks(dev, old_state);
> -
> -	drm_atomic_helper_cleanup_planes(dev, old_state);
> -}
> 

Hi,
if this function is removed, shouldn't:
   static struct drm_mode_config_helper_funcs 
ingenic_drm_mode_config_helpers = {
   	.atomic_commit_tail = ingenic_drm_atomic_helper_commit_tail,
   };
be updated as well?

I've not seen it in the serie.

Just my 2v.
CJ
