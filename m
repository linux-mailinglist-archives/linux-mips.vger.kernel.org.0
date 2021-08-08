Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0ECE3E3CA5
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 22:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhHHUJn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 8 Aug 2021 16:09:43 -0400
Received: from aposti.net ([89.234.176.197]:50362 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229977AbhHHUJm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Aug 2021 16:09:42 -0400
Date:   Sun, 08 Aug 2021 22:09:14 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/8] drm/ingenic: Use standard
 drm_atomic_helper_commit_tail
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <ENEJXQ.6TCYILUOPORD@crapouillou.net>
In-Reply-To: <f3b761ed-4e71-e8b8-f2b5-f4f7f1547fed@wanadoo.fr>
References: <20210808134526.119198-1-paul@crapouillou.net>
        <20210808134526.119198-4-paul@crapouillou.net>
        <f3b761ed-4e71-e8b8-f2b5-f4f7f1547fed@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christophe,

Le dim., août 8 2021 at 21:50:04 +0200, Christophe JAILLET 
<christophe.jaillet@wanadoo.fr> a écrit :
> Le 08/08/2021 à 15:45, Paul Cercueil a écrit :
>> By making the CRTC's .vblank_enable() function return an error when 
>> it
>> is known that the hardware won't deliver a VBLANK, we can drop the
>> ingenic_drm_atomic_helper_commit_tail() function and use the standard
>> drm_atomic_helper_commit_tail() function instead.
>> 
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 
>> ++++-------------------
>>   1 file changed, 4 insertions(+), 24 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index bc71ba44ccf4..3ed7c27a8dde 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -706,29 +706,6 @@ static int 
>> ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
>>   	}
>>   }
>>   -static void ingenic_drm_atomic_helper_commit_tail(struct 
>> drm_atomic_state *old_state)
>> -{
>> -	/*
>> -	 * Just your regular drm_atomic_helper_commit_tail(), but only 
>> calls
>> -	 * drm_atomic_helper_wait_for_vblanks() if priv->no_vblank.
>> -	 */
>> -	struct drm_device *dev = old_state->dev;
>> -	struct ingenic_drm *priv = drm_device_get_priv(dev);
>> -
>> -	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>> -
>> -	drm_atomic_helper_commit_planes(dev, old_state, 0);
>> -
>> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>> -
>> -	drm_atomic_helper_commit_hw_done(old_state);
>> -
>> -	if (!priv->no_vblank)
>> -		drm_atomic_helper_wait_for_vblanks(dev, old_state);
>> -
>> -	drm_atomic_helper_cleanup_planes(dev, old_state);
>> -}
>> 
> 
> Hi,
> if this function is removed, shouldn't:
>   static struct drm_mode_config_helper_funcs 
> ingenic_drm_mode_config_helpers = {
>   	.atomic_commit_tail = ingenic_drm_atomic_helper_commit_tail,
>   };
> be updated as well?
> 
> I've not seen it in the serie.

It is there though :) At the bottom of this very patch.

> Just my 2v.
> CJ

Cheers,
-Paul


