Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2320E33728D
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 13:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbhCKM1y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 07:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbhCKM1V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Mar 2021 07:27:21 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22CFC061574;
        Thu, 11 Mar 2021 04:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=8DrH20SyIhaL5dK4MtN3ycWDMzkAzg5EQ7aSqI2ov9w=; b=X0cMyaSGqKu2P/fq3y1JdWH3JF
        mCwL1UOG577Rsl7j8VXv96vG4pFensynHv8HwkEq5ySh/oUxcJEvzJTgCB64bMSF6IlirMRzqmF1r
        k82MTnL3eNQjnSpYeAOhomO6qFhk7R3p7lm6AGLEfFU0/8Ma8UqPaDudCaeqTN1zpd6yJpDextUWF
        BPCMte6FU2bUGTkUFyc3RKmGZ0ap7CEBpRQL5qaP8w4oQ2KcFxAawLxSE6QCQh5tTF+d95WvkMMgg
        htFr2Mac14C9mhMpsHc/pmwelab23jyp2QsfbiWdM62+LhanSL9NWJ3j4HXapkSYSrV9a32u8MGL+
        eFS64k/A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lKKOo-007In6-Px; Thu, 11 Mar 2021 12:26:48 +0000
Date:   Thu, 11 Mar 2021 12:26:42 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm: Add and export function
 drm_gem_cma_mmap_noncoherent
Message-ID: <20210311122642.GB1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307202835.253907-4-paul@crapouillou.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> +int drm_gem_cma_mmap_noncoherent(struct drm_gem_object *obj,
> +				 struct vm_area_struct *vma)
> +{
> +	struct drm_gem_cma_object *cma_obj;
> +	unsigned long pfn;
> +	int ret;
> +
> +	/*
> +	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
> +	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
> +	 * the whole buffer.
> +	 */
> +	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
> +	vma->vm_flags &= ~VM_PFNMAP;
> +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> +
> +	cma_obj = to_drm_gem_cma_obj(obj);
> +
> +	pfn = PHYS_PFN(dma_to_phys(cma_obj->base.dev->dev, cma_obj->paddr));
> +
> +	ret = remap_pfn_range(vma, vma->vm_start, pfn,
> +			      vma->vm_end - vma->vm_start,
> +			      vma->vm_page_prot);

dma_to_phys must not be used by drivers.

I have a proper helper for this waiting for users:

http://git.infradead.org/users/hch/misc.git/commitdiff/96a546e7229ec53aadbdb7936d1e5e6cb5958952

If you can confirm the helpers works for you I can try to still sneak
it to Linus for 5.12 to ease the merge pain.
