Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381803A09B3
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jun 2021 03:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbhFICAO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 22:00:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:29232 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229685AbhFICAO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Jun 2021 22:00:14 -0400
IronPort-SDR: aIXev9uo9voKZ2Rz8fxzOe3O4f5qxZxWSaHHrDcUJRzF9ZcOxTb5ovmwZayXzilUx2AUazqi3s
 uZFqVvhuTfxg==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="226348637"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; 
   d="scan'208";a="226348637"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 18:58:20 -0700
IronPort-SDR: KYJW5Refe0V9ltnuDGlVJ6TLopiUWwZYULWIqWG34N4OkvARGXzz0Av7vRHCtdujeOQY9X1fyQ
 6/vheDgG7Nyg==
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; 
   d="scan'208";a="482201138"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 18:58:19 -0700
Date:   Tue, 8 Jun 2021 18:58:19 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        ceph-devel@vger.kernel.org
Subject: Re: [PATCH 14/16] block: use memcpy_from_bvec in __blk_queue_bounce
Message-ID: <20210609015819.GU3697498@iweiny-DESK2.sc.intel.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608160603.1535935-15-hch@lst.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 08, 2021 at 06:06:01PM +0200, Christoph Hellwig wrote:
> Rewrite the actual bounce buffering loop in __blk_queue_bounce to that
> the memcpy_to_bvec helper can be used to perform the data copies.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/bounce.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/block/bounce.c b/block/bounce.c
> index a2fc6326b6c9..b5ad09e07bcf 100644
> --- a/block/bounce.c
> +++ b/block/bounce.c
> @@ -243,24 +243,17 @@ void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig)
>  	 * because the 'bio' is single-page bvec.
>  	 */
>  	for (i = 0, to = bio->bi_io_vec; i < bio->bi_vcnt; to++, i++) {
> -		struct page *page = to->bv_page;
> +		struct page *bounce_page;
>  
> -		if (!PageHighMem(page))
> +		if (!PageHighMem(to->bv_page))
>  			continue;
>  
> -		to->bv_page = mempool_alloc(&page_pool, GFP_NOIO);
> -		inc_zone_page_state(to->bv_page, NR_BOUNCE);
> +		bounce_page = mempool_alloc(&page_pool, GFP_NOIO);
> +		inc_zone_page_state(bounce_page, NR_BOUNCE);
>  
> -		if (rw == WRITE) {
> -			char *vto, *vfrom;
> -
> -			flush_dcache_page(page);
> -
> -			vto = page_address(to->bv_page) + to->bv_offset;
> -			vfrom = kmap_atomic(page) + to->bv_offset;
> -			memcpy(vto, vfrom, to->bv_len);
> -			kunmap_atomic(vfrom);
> -		}
> +		if (rw == WRITE)
> +			memcpy_from_bvec(page_address(bounce_page), to);

NIT: the fact that the copy is from 'to' makes my head hurt...  But I don't
see a good way to change that without declaring unnecessary variables...  :-(

The logic seems right.

Ira

> +		to->bv_page = bounce_page;
>  	}
>  
>  	trace_block_bio_bounce(*bio_orig);
> -- 
> 2.30.2
> 
