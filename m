Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AB53A099B
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jun 2021 03:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbhFIBuV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 21:50:21 -0400
Received: from mga05.intel.com ([192.55.52.43]:38052 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231438AbhFIBuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Jun 2021 21:50:20 -0400
IronPort-SDR: ojc764/nv4txkxhexo1hpQcCS/Ug64IxXfzphmm5e3724pKz8R9h5KDOX+xO2SgqyFsN/PK2hQ
 xa8XOtYQvJOw==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="290612580"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; 
   d="scan'208";a="290612580"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 18:48:24 -0700
IronPort-SDR: SRFfjIkTZkgdiWUkfbuxO/DHCb0ZQrp7YLBvUKhmAbESyYDmfBnXBu/pgXAlW0d/t+PE9XTYIq
 c7l/dYjK3T5A==
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; 
   d="scan'208";a="448117931"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2021 18:48:23 -0700
Date:   Tue, 8 Jun 2021 18:48:22 -0700
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
Subject: Re: [PATCH 09/16] ps3disk: use memcpy_{from,to}_bvec
Message-ID: <20210609014822.GT3697498@iweiny-DESK2.sc.intel.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608160603.1535935-10-hch@lst.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 08, 2021 at 06:05:56PM +0200, Christoph Hellwig wrote:
>  
>  	rq_for_each_segment(bvec, req, iter) {
> -		unsigned long flags;
> -		dev_dbg(&dev->sbd.core, "%s:%u: bio %u: %u sectors from %llu\n",
> -			__func__, __LINE__, i, bio_sectors(iter.bio),
> -			iter.bio->bi_iter.bi_sector);
> -
> -		size = bvec.bv_len;
> -		buf = bvec_kmap_irq(&bvec, &flags);
>  		if (gather)
> -			memcpy(dev->bounce_buf+offset, buf, size);
> +			memcpy_from_bvec(dev->bounce_buf + offset, &bvec);
>  		else
> -			memcpy(buf, dev->bounce_buf+offset, size);
> -		offset += size;
> -		flush_kernel_dcache_page(bvec.bv_page);

I'm still not 100% sure that these flushes are needed but the are not no-ops on
every arch.  Would it be best to preserve them after the memcpy_to/from_bvec()?

Same thing in patch 11 and 14.

Ira
