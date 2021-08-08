Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6CA23E3C31
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 20:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhHHSeO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 8 Aug 2021 14:34:14 -0400
Received: from aposti.net ([89.234.176.197]:41390 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229977AbhHHSeN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Aug 2021 14:34:13 -0400
Date:   Sun, 08 Aug 2021 20:33:45 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/8] drm/ingenic: Remove dead code
To:     Joe Perches <joe@perches.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <98AJXQ.3ASLLMR2SY4@crapouillou.net>
In-Reply-To: <5a003da4e38fcb50782664496fc37b84773a7813.camel@perches.com>
References: <20210808134526.119198-1-paul@crapouillou.net>
        <20210808134526.119198-2-paul@crapouillou.net>
        <ff06e53b-ba7e-5535-8931-ce7f7cdae5a6@suse.de>
        <5a003da4e38fcb50782664496fc37b84773a7813.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Joe,

Le dim., août 8 2021 at 11:27:34 -0700, Joe Perches <joe@perches.com> 
a écrit :
> On Sun, 2021-08-08 at 19:58 +0200, Thomas Zimmermann wrote:
>> 
>>  Am 08.08.21 um 15:45 schrieb Paul Cercueil:
>>  > The priv->ipu_plane would get a different value further down the 
>> code,
>>  > without the first assigned value being read first; so the first
>>  > assignation can be dropped.
>>  >
>>  > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> 
>>  Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> I think this is at best an incomplete description.
> 
> How is it known that this priv->ipu_plane assignment isn't
> necessary for any path of any failure path after this assignment
> and before the new assignment?

It is only used in the .atomic_begin and .atomic_check callbacks of the 
CRTC. These will only ever be called after the call to 
drm_dev_register() which happens at the end of the probe function.

Cheers,
-Paul

>>  > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> []
>>  > @@ -984,9 +984,6 @@ static int ingenic_drm_bind(struct device 
>> *dev, bool has_components)
>>  >   	priv->dma_hwdescs->hwdesc_pal.cmd = JZ_LCD_CMD_ENABLE_PAL
>>  >   		| (sizeof(priv->dma_hwdescs->palette) / 4);
>>  >
>>  > -	if (soc_info->has_osd)
>>  > -		priv->ipu_plane = drm_plane_from_index(drm, 0);
>>  > -
>>  >   	primary = priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
>>  >
>>  >   	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
>>  >
>> 
> 
> 


