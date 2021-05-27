Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D956F393279
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 17:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235553AbhE0PdR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 27 May 2021 11:33:17 -0400
Received: from aposti.net ([89.234.176.197]:41566 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235395AbhE0PdQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 11:33:16 -0400
Date:   Thu, 27 May 2021 13:43:13 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
        Lokesh Vutla <lokeshvutla@ti.com>,
        "Yadav, Pratyush" <p.yadav@ti.com>
Message-Id: <1CNRTQ.12RZKDP9M4XR3@crapouillou.net>
In-Reply-To: <26b5424a-ff4c-090b-a08f-0e3e32278180@ideasonboard.com>
References: <20210523170415.90410-1-paul@crapouillou.net>
        <20210523170415.90410-2-paul@crapouillou.net>
        <26b5424a-ff4c-090b-a08f-0e3e32278180@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tomi,

Le jeu., mai 27 2021 at 13:40:07 +0300, Tomi Valkeinen 
<tomi.valkeinen@ideasonboard.com> a écrit :
> On 23/05/2021 20:04, Paul Cercueil wrote:
>> Having GEM buffers backed by non-coherent memory is interesting in 
>> the
>> particular case where it is faster to render to a non-coherent buffer
>> then sync the data cache, than to render to a write-combine buffer, 
>> and
>> (by extension) much faster than using a shadow buffer. This is true 
>> for
>> instance on some Ingenic SoCs, where even simple blits (e.g. memcpy)
>> are about three times faster using this method.
>> 
>> Add a 'map_noncoherent' flag to the drm_gem_cma_object structure, 
>> which
>> can be set by the drivers when they create the dumb buffer.
>> 
>> Since this really only applies to software rendering, disable this 
>> flag
>> as soon as the CMA objects are exported via PRIME.
>> 
>> v3: New patch. Now uses a simple 'map_noncoherent' flag to control 
>> how
>>      the objects are mapped, and use the new dma_mmap_pages function.
>> 
>> v4: Make sure map_noncoherent is always disabled when creating GEM
>>      objects meant to be used with dma-buf.
>> 
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_gem_cma_helper.c | 38 
>> +++++++++++++++++++++-------
>>   include/drm/drm_gem_cma_helper.h     |  3 +++
>>   2 files changed, 32 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c 
>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>> index 7942cf05cd93..235c7a63da2b 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -46,6 +46,7 @@ static const struct drm_gem_object_funcs 
>> drm_gem_cma_default_funcs = {
>>    * __drm_gem_cma_create - Create a GEM CMA object without 
>> allocating memory
>>    * @drm: DRM device
>>    * @size: size of the object to allocate
>> + * @private: true if used for internal purposes
>>    *
>>    * This function creates and initializes a GEM CMA object of the 
>> given size,
>>    * but doesn't allocate any memory to back the object.
>> @@ -55,11 +56,11 @@ static const struct drm_gem_object_funcs 
>> drm_gem_cma_default_funcs = {
>>    * error code on failure.
>>    */
>>   static struct drm_gem_cma_object *
>> -__drm_gem_cma_create(struct drm_device *drm, size_t size)
>> +__drm_gem_cma_create(struct drm_device *drm, size_t size, bool 
>> private)
>>   {
>>   	struct drm_gem_cma_object *cma_obj;
>>   	struct drm_gem_object *gem_obj;
>> -	int ret;
>> +	int ret = 0;
>>     	if (drm->driver->gem_create_object)
>>   		gem_obj = drm->driver->gem_create_object(drm, size);
>> @@ -73,7 +74,14 @@ __drm_gem_cma_create(struct drm_device *drm, 
>> size_t size)
>>     	cma_obj = container_of(gem_obj, struct drm_gem_cma_object, 
>> base);
>>   -	ret = drm_gem_object_init(drm, gem_obj, size);
>> +	if (private) {
>> +		drm_gem_private_object_init(drm, gem_obj, size);
>> +
>> +		/* Always use writecombine for dma-buf mappings */
>> +		cma_obj->map_noncoherent = false;
>> +	} else {
>> +		ret = drm_gem_object_init(drm, gem_obj, size);
>> +	}
>>   	if (ret)
>>   		goto error;
>>   @@ -111,12 +119,19 @@ struct drm_gem_cma_object 
>> *drm_gem_cma_create(struct drm_device *drm,
>>     	size = round_up(size, PAGE_SIZE);
>>   -	cma_obj = __drm_gem_cma_create(drm, size);
>> +	cma_obj = __drm_gem_cma_create(drm, size, false);
>>   	if (IS_ERR(cma_obj))
>>   		return cma_obj;
>>   -	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
>> -				      GFP_KERNEL | __GFP_NOWARN);
>> +	if (cma_obj->map_noncoherent) {
>> +		cma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
>> +						       &cma_obj->paddr,
>> +						       DMA_TO_DEVICE,
>> +						       GFP_KERNEL | __GFP_NOWARN);
>> +	} else {
>> +		cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
>> +					      GFP_KERNEL | __GFP_NOWARN);
>> +	}
>>   	if (!cma_obj->vaddr) {
>>   		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
>>   			 size);
>> @@ -432,7 +447,7 @@ drm_gem_cma_prime_import_sg_table(struct 
>> drm_device *dev,
>>   		return ERR_PTR(-EINVAL);
>>     	/* Create a CMA GEM buffer. */
>> -	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
>> +	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size, true);
>>   	if (IS_ERR(cma_obj))
>>   		return ERR_CAST(cma_obj);
>>   @@ -499,8 +514,13 @@ int drm_gem_cma_mmap(struct drm_gem_object 
>> *obj, struct vm_area_struct *vma)
>>     	cma_obj = to_drm_gem_cma_obj(obj);
>>   -	ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
>> -			  cma_obj->paddr, vma->vm_end - vma->vm_start);
>> +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>> +	if (!cma_obj->map_noncoherent)
>> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
>> +
>> +	ret = dma_mmap_pages(cma_obj->base.dev->dev,
>> +			     vma, vma->vm_end - vma->vm_start,
>> +			     virt_to_page(cma_obj->vaddr));
> 
> This breaks mmap on TI's J7 EVM (tidss driver). All DRM apps just die 
> when doing mmap. Changing these lines back to dma_mmap_wc() makes it 
> work.
> 
> Is dma_alloc_wc() even compatible with dma_mmap_pages()?

My bad, dma_mmap_wc() is not just a regular mmap with writecombine page 
protection.

The solution, I guess, would be to call dma_mmap_wc() if 
(!cma_obj->map_noncoherent). I can send a patch later this week, unless 
you already have one?

Cheers,
-Paul


