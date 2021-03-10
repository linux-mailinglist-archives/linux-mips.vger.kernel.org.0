Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415A4334757
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 20:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbhCJTCk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 10 Mar 2021 14:02:40 -0500
Received: from aposti.net ([89.234.176.197]:54112 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhCJTCf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 14:02:35 -0500
Date:   Wed, 10 Mar 2021 19:02:22 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/5] Add option to mmap GEM buffers cached
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <YVORPQ.MCVK409VD57J2@crapouillou.net>
In-Reply-To: <ab488f52-f93d-ff50-efc5-bbdceec99ecb@suse.de>
References: <20210307202835.253907-1-paul@crapouillou.net>
        <ab488f52-f93d-ff50-efc5-bbdceec99ecb@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Le lun. 8 mars 2021 à 9:41, Thomas Zimmermann <tzimmermann@suse.de> a 
écrit :
> Hi Paul,
> 
> having individual functions for each mode only makes sense if the 
> decision is at compile time. But in patch 5, you're working around 
> your earlier design by introducing in-driver helpers that select the 
> correct CMA function.
> 
> In SHMEM helpers we have the flag map_wc in the GEM structure that 
> selects the pages caching mode (wc vs uncached). I think CMA should 
> use this design as well. Have a map_noncoherent flag in the CMA GEM 
> object and set it from the driver's implementation of 
> gem_create_object.

Is that a new addition? That severely reduces the patchset size, which 
is perfect.

I'll send a V3 then.

Cheers,
-Paul

> And in the long run, we could try to consolidate all drivers/helpers 
> mapping flags in struct drm_gem_object.
> 
> Best regards
> Thomas
> 
> Am 07.03.21 um 21:28 schrieb Paul Cercueil:
>> Rework of my previous patchset which added support for GEM buffers
>> backed by non-coherent memory to the ingenic-drm driver.
>> 
>> Having GEM buffers backed by non-coherent memory is interesting in
>> the particular case where it is faster to render to a non-coherent
>> buffer then sync the data cache, than to render to a write-combine
>> buffer, and (by extension) much faster than using a shadow buffer.
>> This is true for instance on some Ingenic SoCs, where even simple
>> blits (e.g. memcpy) are about three times faster using this method.
>> 
>> For the record, the previous patchset was accepted for 5.10 then had
>> to be reverted, as it conflicted with some changes made to the DMA 
>> API.
>> 
>> This new patchset is pretty different as it adds the functionality to
>> the DRM core. The first three patches add variants to existing 
>> functions
>> but with the "non-coherent memory" twist, exported as GPL symbols. 
>> The
>> fourth patch adds a function to be used with the damage helpers.
>> Finally, the last patch adds support for non-coherent GEM buffers to 
>> the
>> ingenic-drm driver. The functionality is enabled through a module
>> parameter, and is disabled by default.
>> 
>> Cheers,
>> -Paul
>> 
>> Paul Cercueil (5):
>>    drm: Add and export function drm_gem_cma_create_noncoherent
>>    drm: Add and export function drm_gem_cma_dumb_create_noncoherent
>>    drm: Add and export function drm_gem_cma_mmap_noncoherent
>>    drm: Add and export function drm_gem_cma_sync_data
>>    drm/ingenic: Add option to alloc cached GEM buffers
>> 
>>   drivers/gpu/drm/drm_gem_cma_helper.c      | 223 
>> +++++++++++++++++++---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  49 ++++-
>>   drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 +
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c     |  14 +-
>>   include/drm/drm_gem_cma_helper.h          |  13 ++
>>   5 files changed, 273 insertions(+), 30 deletions(-)
>> 
> 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 


