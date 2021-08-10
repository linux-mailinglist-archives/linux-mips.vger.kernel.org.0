Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0823E5889
	for <lists+linux-mips@lfdr.de>; Tue, 10 Aug 2021 12:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237407AbhHJKqg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 10 Aug 2021 06:46:36 -0400
Received: from aposti.net ([89.234.176.197]:47546 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236505AbhHJKqf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 10 Aug 2021 06:46:35 -0400
Date:   Tue, 10 Aug 2021 12:46:05 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/8] drm/ingenic: Use standard
 drm_atomic_helper_commit_tail
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     David Airlie <airlied@linux.ie>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <TWDMXQ.LWEW6X38G98J@crapouillou.net>
In-Reply-To: <YRJS9kZt5jUe5Z3r@phenom.ffwll.local>
References: <20210808134526.119198-1-paul@crapouillou.net>
        <20210808134526.119198-4-paul@crapouillou.net>
        <YRJS9kZt5jUe5Z3r@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Daniel,

Le mar., août 10 2021 at 12:20:38 +0200, Daniel Vetter 
<daniel@ffwll.ch> a écrit :
> On Sun, Aug 08, 2021 at 03:45:21PM +0200, Paul Cercueil wrote:
>>  By making the CRTC's .vblank_enable() function return an error when 
>> it
>>  is known that the hardware won't deliver a VBLANK, we can drop the
>>  ingenic_drm_atomic_helper_commit_tail() function and use the 
>> standard
>>  drm_atomic_helper_commit_tail() function instead.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 
>> ++++-------------------
>>   1 file changed, 4 insertions(+), 24 deletions(-)
>> 
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index bc71ba44ccf4..3ed7c27a8dde 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -706,29 +706,6 @@ static int 
>> ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
>>   	}
>>   }
>> 
>>  -static void ingenic_drm_atomic_helper_commit_tail(struct 
>> drm_atomic_state *old_state)
>>  -{
>>  -	/*
>>  -	 * Just your regular drm_atomic_helper_commit_tail(), but only 
>> calls
>>  -	 * drm_atomic_helper_wait_for_vblanks() if priv->no_vblank.
>>  -	 */
>>  -	struct drm_device *dev = old_state->dev;
>>  -	struct ingenic_drm *priv = drm_device_get_priv(dev);
>>  -
>>  -	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>>  -
>>  -	drm_atomic_helper_commit_planes(dev, old_state, 0);
>>  -
>>  -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>>  -
>>  -	drm_atomic_helper_commit_hw_done(old_state);
>>  -
>>  -	if (!priv->no_vblank)
>>  -		drm_atomic_helper_wait_for_vblanks(dev, old_state);
>>  -
>>  -	drm_atomic_helper_cleanup_planes(dev, old_state);
>>  -}
>>  -
>>   static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
>>   {
>>   	struct ingenic_drm *priv = drm_device_get_priv(arg);
>>  @@ -749,6 +726,9 @@ static int ingenic_drm_enable_vblank(struct 
>> drm_crtc *crtc)
>>   {
>>   	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>> 
>>  +	if (priv->no_vblank)
>>  +		return -EWOULDBLOCK;
> 
> I think other drivers return EINVAL here. I'm not sure exactly this is
> specified, but the errno here is visible to userspace.
> 
> Maybe would be good to update the kerneldoc for this hook?
> 
> Anyway this is great, with the errno fixed:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I thought about it afterwards, that my error code wasn't great. In my 
mind it was "the driver will hang while waiting for vblank" hence 
-EWOULDBLOCK ;)

I'll need to v2 anyway so I'll change it to -EINVAL then.

Cheers,
-Paul

> 
>>  +
>>   	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>>   			   JZ_LCD_CTRL_EOF_IRQ, JZ_LCD_CTRL_EOF_IRQ);
>> 
>>  @@ -856,7 +836,7 @@ static const struct drm_mode_config_funcs 
>> ingenic_drm_mode_config_funcs = {
>>   };
>> 
>>   static struct drm_mode_config_helper_funcs 
>> ingenic_drm_mode_config_helpers = {
>>  -	.atomic_commit_tail = ingenic_drm_atomic_helper_commit_tail,
>>  +	.atomic_commit_tail = drm_atomic_helper_commit_tail,
>>   };
>> 
>>   static void ingenic_drm_unbind_all(void *d)
>>  --
>>  2.30.2
>> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


