Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B7738171B
	for <lists+linux-mips@lfdr.de>; Sat, 15 May 2021 11:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhEOJPq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 15 May 2021 05:15:46 -0400
Received: from aposti.net ([89.234.176.197]:43786 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231558AbhEOJPp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 15 May 2021 05:15:45 -0400
Date:   Sat, 15 May 2021 10:14:17 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-mips@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>, od@opendingux.net
Message-Id: <TN55TQ.WL68QNFRU9LG2@crapouillou.net>
In-Reply-To: <738660d9-495b-a9b5-b371-a2e4364ee9b8@suse.de>
References: <20210514201138.162230-1-paul@crapouillou.net>
        <20210514201138.162230-2-paul@crapouillou.net>
        <738660d9-495b-a9b5-b371-a2e4364ee9b8@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Le sam., mai 15 2021 at 11:03:34 +0200, Thomas Zimmermann 
<tzimmermann@suse.de> a �crit :
> Hi
> 
> Am 14.05.21 um 22:11 schrieb Paul Cercueil:
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
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/gpu/drm/drm_gem_cma_helper.c | 41 
>> +++++++++++++++++++++++++---
>>   include/drm/drm_gem_cma_helper.h     |  7 ++++-
>>   2 files changed, 43 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c 
>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>> index 7942cf05cd93..81a31bcf7d68 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -115,8 +115,15 @@ struct drm_gem_cma_object 
>> *drm_gem_cma_create(struct drm_device *drm,
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
>> @@ -499,8 +506,13 @@ int drm_gem_cma_mmap(struct drm_gem_object 
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
>>   	if (ret)
>>   		drm_gem_vm_close(vma);
>>   @@ -556,3 +568,24 @@ 
>> drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
>>   	return obj;
>>   }
>>   EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
>> +
>> +/**
>> + * drm_gem_cma_prime_mmap - PRIME mmap function for CMA GEM drivers
>> + * @obj: GEM object
>> + * @vma: Virtual address range
>> + *
>> + * Carbon copy of drm_gem_prime_mmap, but the 'map_noncoherent' 
>> flag is
>> + * disabled to ensure that the exported buffers have the expected 
>> cache
>> + * coherency.
>> + */
>> +int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>> +			   struct vm_area_struct *vma)
>> +{
>> +	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
>> +
>> +	/* Use standard cache settings for PRIME-exported GEM buffers */
>> +	cma_obj->map_noncoherent = false;
>> +
>> +	return drm_gem_prime_mmap(obj, vma);
>> +}
>> +EXPORT_SYMBOL(drm_gem_cma_prime_mmap);
>> diff --git a/include/drm/drm_gem_cma_helper.h 
>> b/include/drm/drm_gem_cma_helper.h
>> index 0a9711caa3e8..b597e00fd5f6 100644
>> --- a/include/drm/drm_gem_cma_helper.h
>> +++ b/include/drm/drm_gem_cma_helper.h
>> @@ -16,6 +16,7 @@ struct drm_mode_create_dumb;
>>    *       more than one entry but they are guaranteed to have 
>> contiguous
>>    *       DMA addresses.
>>    * @vaddr: kernel virtual address of the backing memory
>> + * @map_noncoherent: if true, the GEM object is backed by 
>> non-coherent memory
>>    */
>>   struct drm_gem_cma_object {
>>   	struct drm_gem_object base;
>> @@ -24,6 +25,8 @@ struct drm_gem_cma_object {
>>     	/* For objects with DMA memory allocated by GEM CMA */
>>   	void *vaddr;
>> +
>> +	bool map_noncoherent;
>>   };
>>     #define to_drm_gem_cma_obj(gem_obj) \
>> @@ -119,7 +122,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, 
>> struct vm_area_struct *vma);
>>   	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
>>   	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
>>   	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table, \
>> -	.gem_prime_mmap		= drm_gem_prime_mmap
>> +	.gem_prime_mmap		= drm_gem_cma_prime_mmap
> 
> gem_prime_mmap is deprecated and on the way out. Only mmap in 
> drm_gem_object_funcs should be used. I have patches for other drivers 
> that convert everything to drm_gem_prime_mmap. Afterwards the pointer 
> can be removed.
> 
> Rather than writing a custom prime mmap function, update 
> drm_gem_cma_prime_import_sg_table() so that it disables non-coherent 
> mappings for imported buffers. For an example, see how SHMEM's 
> internal create function uses the 'private' parameter. [1]

Alright, I can do that.

Cheers,
-Paul

> Best regards
> Thomas
> 
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L39
> 
>>     /**
>>    * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
>> @@ -181,5 +184,7 @@ struct drm_gem_object *
>>   drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
>>   				       struct dma_buf_attachment *attach,
>>   				       struct sg_table *sgt);
>> +int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>> +			   struct vm_area_struct *vma);
>>     #endif /* __DRM_GEM_CMA_HELPER_H__ */
>> 
> 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N�rnberg, Germany
> (HRB 36809, AG N�rnberg)
> Gesch�ftsf�hrer: Felix Imend�rffer
> 


