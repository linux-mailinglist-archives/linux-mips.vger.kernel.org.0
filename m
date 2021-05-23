Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDE638DC94
	for <lists+linux-mips@lfdr.de>; Sun, 23 May 2021 21:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhEWTVI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 23 May 2021 15:21:08 -0400
Received: from aposti.net ([89.234.176.197]:55128 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231887AbhEWTVI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 23 May 2021 15:21:08 -0400
Date:   Sun, 23 May 2021 20:19:27 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 0/3] Add option to mmap GEM buffers cached
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>, list@opendingux.net
Message-Id: <F0RKTQ.VPIWIN1LS7JH3@crapouillou.net>
In-Reply-To: <452b2228-2415-69d7-9212-51707daf8616@suse.de>
References: <20210523170415.90410-1-paul@crapouillou.net>
        <452b2228-2415-69d7-9212-51707daf8616@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Le dim., mai 23 2021 at 21:05:30 +0200, Thomas Zimmermann 
<tzimmermann@suse.de> a écrit :
> Hi
> 
> Am 23.05.21 um 19:04 schrieb Paul Cercueil:
>> V5 of my patchset which adds the option for having GEM buffers 
>> backed by
>> non-coherent memory.
>> 
>> Changes from V4:
>> 
>> - [2/3]:
>>      - Rename to drm_fb_cma_sync_non_coherent
>>      - Invert loops for better cache locality
>>      - Only sync BOs that have the non-coherent flag
>>      - Properly sort includes
>>      - Move to drm_fb_cma_helper.c to avoid circular dependency
> 
> I'm pretty sure it's still not the right place. That would be 
> something like drm_gem_cma_atomic_helper.c, but creating a new file 
> just for a single function doesn't make sense.

drm_fb_cma_sync_non_coherent calls drm_fb_cma_* functions, so it's a 
better match than its former location (which wasn't good as it created 
a circular dependency between drm.ko and drm-kms-helper.ko).

Do you have a better idea?

>> 
>> - [3/3]:
>>      - Fix drm_atomic_get_new_plane_state() used to retrieve the old
>>        state
>>      - Use custom drm_gem_fb_create()
> 
> It's often a better choice to express such differences via different 
> data structures (i.e., different instances of drm_mode_config_funcs) 
> but it's not a big deal either.

The different drm_mode_config_funcs instances already exist in 
drm_gem_framebuffer_helper.c but are static, and drm_gem_fb_create() 
and drm_gem_fb_create_with_dirty() are just tiny wrappers around 
drm_gem_fb_create_with_funcs() with the corresponding 
drm_mode_config_funcs instance. I didn't want to copy them to 
ingenic-drm-drv.c, but maybe I can export the symbols and use 
drm_gem_fb_create_with_funcs() directly?

> Please go ahaed and merge if no one objects. All patches:
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

Cheers,
-Paul

> Best regards
> Thomas
> 
>>      - Only check damage clips and sync DMA buffers if non-coherent
>>        buffers are used
>> 
>> Cheers,
>> -Paul
>> 
>> Paul Cercueil (3):
>>    drm: Add support for GEM buffers backed by non-coherent memory
>>    drm: Add and export function drm_fb_cma_sync_non_coherent
>>    drm/ingenic: Add option to alloc cached GEM buffers
>> 
>>   drivers/gpu/drm/drm_fb_cma_helper.c       | 46 ++++++++++++++++++
>>   drivers/gpu/drm/drm_gem_cma_helper.c      | 38 +++++++++++----
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 59 
>> +++++++++++++++++++++--
>>   drivers/gpu/drm/ingenic/ingenic-drm.h     |  1 +
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c     | 21 ++++++--
>>   include/drm/drm_fb_cma_helper.h           |  4 ++
>>   include/drm/drm_gem_cma_helper.h          |  3 ++
>>   7 files changed, 156 insertions(+), 16 deletions(-)
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


