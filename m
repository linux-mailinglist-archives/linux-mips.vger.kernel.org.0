Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC3E3372AF
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 13:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbhCKMdN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 11 Mar 2021 07:33:13 -0500
Received: from aposti.net ([89.234.176.197]:47038 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233243AbhCKMcp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Mar 2021 07:32:45 -0500
Date:   Thu, 11 Mar 2021 12:32:27 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/5] drm: Add and export function
 drm_gem_cma_mmap_noncoherent
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <3I1TPQ.E55GRWWDYVRG@crapouillou.net>
In-Reply-To: <20210311122642.GB1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
        <20210307202835.253907-4-paul@crapouillou.net>
        <20210311122642.GB1739082@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

Le jeu. 11 mars 2021 à 12:26, Christoph Hellwig <hch@infradead.org> a 
écrit :
>>  +int drm_gem_cma_mmap_noncoherent(struct drm_gem_object *obj,
>>  +				 struct vm_area_struct *vma)
>>  +{
>>  +	struct drm_gem_cma_object *cma_obj;
>>  +	unsigned long pfn;
>>  +	int ret;
>>  +
>>  +	/*
>>  +	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and 
>> set the
>>  +	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want 
>> to map
>>  +	 * the whole buffer.
>>  +	 */
>>  +	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>>  +	vma->vm_flags &= ~VM_PFNMAP;
>>  +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>>  +
>>  +	cma_obj = to_drm_gem_cma_obj(obj);
>>  +
>>  +	pfn = PHYS_PFN(dma_to_phys(cma_obj->base.dev->dev, 
>> cma_obj->paddr));
>>  +
>>  +	ret = remap_pfn_range(vma, vma->vm_start, pfn,
>>  +			      vma->vm_end - vma->vm_start,
>>  +			      vma->vm_page_prot);
> 
> dma_to_phys must not be used by drivers.
> 
> I have a proper helper for this waiting for users:
> 
> http://git.infradead.org/users/hch/misc.git/commitdiff/96a546e7229ec53aadbdb7936d1e5e6cb5958952
> 
> If you can confirm the helpers works for you I can try to still sneak
> it to Linus for 5.12 to ease the merge pain.

I can try. How do I get a page pointer from a dma_addr_t?

-Paul


