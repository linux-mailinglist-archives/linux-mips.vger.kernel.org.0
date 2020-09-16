Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7037C26BB85
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 06:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgIPEcS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Sep 2020 00:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgIPEcR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Sep 2020 00:32:17 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6A2C06174A;
        Tue, 15 Sep 2020 21:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=OKTWFAL+NCWsshjoWfsYmebaDqHMxSj4fA0XVdGhN64=; b=BTnM3sISVd4A5Y/9dnOnRfAysr
        37jkU+yxCg0Yaiej6Ek99q07blcBL764QdUlgAyh4s7M76DoaOA2VGlAwR2I9FrP3gk0xi8aPPbuN
        aSiUERmKhDEv/eeq6KaUaZhxHmOvQDqyz2G87otgc/5Wb8pbIEFxJ9iwjH17G19oxo5HhQakqb+HF
        HtBovQ6U8EOQW5K2eiXOzcN/9x9plUQly0ujPWF9GTkcnsubC489HDmJUKncwRPeA4FNma09Aunyy
        aulMtYeCSlI1Sh+zRwkTttW3Ec31zhNdFkPSG+k6X/b8hALX/G2Yg5sM8q03uQB66RJRp2OD1ZmaM
        YLmKrs5g==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIP71-0000xb-ND; Wed, 16 Sep 2020 04:32:07 +0000
Date:   Wed, 16 Sep 2020 05:32:07 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Roman Gushchin <guro@fb.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Joonsoo Kim <js1304@gmail.com>,
        Rik van Riel <riel@surriel.com>,
        Aslan Bakirov <aslan@fb.com>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] cma: make number of CMA areas dynamic, remove
 CONFIG_CMA_AREAS
Message-ID: <20200916043207.GA713@infradead.org>
References: <20200903030204.253433-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903030204.253433-1-mike.kravetz@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 02, 2020 at 08:02:04PM -0700, Mike Kravetz wrote:
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -383,25 +383,34 @@ postcore_initcall(atomic_pool_init);
>  struct dma_contig_early_reserve {
>  	phys_addr_t base;
>  	unsigned long size;
> +	struct list_head areas;
>  };
>  
> +static __initdata LIST_HEAD(dma_mmu_remap_areas);
>  
>  void __init dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
>  {
> +	struct dma_contig_early_reserve *d;
> +
> +	d = memblock_alloc(sizeof(struct dma_contig_early_reserve),
> +			sizeof(void *));
> +	if (!d) {
> +		pr_err("Unable to allocate dma_contig_early_reserve struct!\n");
> +		return;
> +	}
> +
> +	d->base = base;
> +	d->size = size;
> +	list_add_tail(&d->areas, &dma_mmu_remap_areas);
>  }

I wonder if struct cma should grow a flags or type field, so that the
arm code can simply use cma_for_each_area to iterate the CMA areas for
the DMA fixup, and we can remove the extra list and the magic hook.

> +/* modify here */
> +LIST_HEAD(cma_areas);

What does this comment mean?

> +static unsigned int cma_area_count;

It seems this is only used to provide a default name for the CMA
areas, but all areas actually provide a name, so I think we can drop
the default naming and the cma_area_count variable entirely.

>  	if (!size || !memblock_is_region_reserved(base, size))
>  		return -EINVAL;
>  
> +
>  	/* ensure minimal alignment required by mm core */

This adds a spurious empty line.

>  static int __init cma_debugfs_init(void)
>  {
>  	struct dentry *cma_debugfs_root;
> -	int i;
> +	struct cma *c;
>  
>  	cma_debugfs_root = debugfs_create_dir("cma", NULL);
>  
> -	for (i = 0; i < cma_area_count; i++)
> -		cma_debugfs_add_one(&cma_areas[i], cma_debugfs_root);
> +	list_for_each_entry(c, &cma_areas, areas)
> +		cma_debugfs_add_one(c, cma_debugfs_root);

I think this should use cma_for_each_area, that way cma_areas can be
keep static in cma.c.
