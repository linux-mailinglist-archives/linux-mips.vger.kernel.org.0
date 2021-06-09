Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF693A1049
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jun 2021 12:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238069AbhFIJjn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Jun 2021 05:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234748AbhFIJjm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Jun 2021 05:39:42 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA42C061574;
        Wed,  9 Jun 2021 02:37:47 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id b5so24586358ilc.12;
        Wed, 09 Jun 2021 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=11paM/1lp22CavDEEN3A/olA+tOS+m0UgIjuNNPMc5c=;
        b=AUn30ilbL3NzF5q2BCp0QVXHikpm8Vm6yUAM9SdAhos2m9u8xXGwxlhY7L/mh5ETkk
         xMDLHdDCnvMj9u5VwkHn37GW+ujRpw2uJn/g/RTKxpbLL7paohPJB9BFTIoD6vBOz0FJ
         wlEZkhAcmqWn9YlRTm67JdkNWHAiNqs9sQF7kLfjGLtZZjwbbdwYYhZL9eEqO6j8XGwT
         WGtn6z7Ok1u7/f7AJWVfLsFL4AOnd9bBJ2NKdphWe6mO0Sya+xn+4ljLwykvBX8unsLj
         qDtDo0A3iPuoyVDOa2dKVu/uzCQIFKij1E9QJ4Rpt6+OuJFeAbsxKLDuKg+JVf9eTdvV
         qvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=11paM/1lp22CavDEEN3A/olA+tOS+m0UgIjuNNPMc5c=;
        b=D+4f2a9eNChSRAA625nVypjPfxAKmgHzYO1PX48Zh64AITQquDEUcgJsuj5a5bt9Pe
         hom6FP+cbzAgNCSYOESRIYnfS1uG1p5/dEH/Un0rgmryIYpZ+cF2Cfls+nXrjLjil0kX
         ++Y2rVWNge8GsGQ0wAnyvp6krHA0qhkGyv90uI+kD8OwvMWE61w/X8KIruWRBaVcRbAd
         8uurSPMiRqj4Glm73UCXY8RjzBGQwPZ7SYck9AWcu9PwzXFyPDGYrI12bS6b/OJp2rcp
         E4Yanqjz3qv8QMw4JdZalSq7AHWEvkTHUbn32UKVfAaMj0Zid0ki4ydmZGazXirvIWhH
         wM7A==
X-Gm-Message-State: AOAM5313/mgOhvCJK8cXznROgr0ZWB9nDI6Rrd2UXhB+50CP7KG6CXx8
        FkPmpgMQkFRnWwoBUe4/JP3QuYSc9LrmgZKthEs=
X-Google-Smtp-Source: ABdhPJy5AROZdbsU+O1Vh/bwrnsq7wRpZEor176YD0iLaHDJhsh5Ad6i076nqZiL2In6oQ6aCiJFsx/mBME7wo4cSUc=
X-Received: by 2002:a05:6638:267:: with SMTP id x7mr7028650jaq.51.1623231466755;
 Wed, 09 Jun 2021 02:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210608160603.1535935-1-hch@lst.de> <20210608160603.1535935-8-hch@lst.de>
In-Reply-To: <20210608160603.1535935-8-hch@lst.de>
From:   Ilya Dryomov <idryomov@gmail.com>
Date:   Wed, 9 Jun 2021 11:37:45 +0200
Message-ID: <CAOi1vP-zSAnx5z7EbPNVLoCHWdK5iGjXU7KKrRL8YZF1QfMf3A@mail.gmail.com>
Subject: Re: [PATCH 07/16] rbd: use memzero_bvec
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Ceph Development <ceph-devel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 8, 2021 at 6:06 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use memzero_bvec instead of reimplementing it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rbd.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index bbb88eb009e0..eb243fc4d108 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -1219,24 +1219,13 @@ static void rbd_dev_mapping_clear(struct rbd_device *rbd_dev)
>         rbd_dev->mapping.size = 0;
>  }
>
> -static void zero_bvec(struct bio_vec *bv)
> -{
> -       void *buf;
> -       unsigned long flags;
> -
> -       buf = bvec_kmap_irq(bv, &flags);
> -       memset(buf, 0, bv->bv_len);
> -       flush_dcache_page(bv->bv_page);
> -       bvec_kunmap_irq(buf, &flags);
> -}
> -
>  static void zero_bios(struct ceph_bio_iter *bio_pos, u32 off, u32 bytes)
>  {
>         struct ceph_bio_iter it = *bio_pos;
>
>         ceph_bio_iter_advance(&it, off);
>         ceph_bio_iter_advance_step(&it, bytes, ({
> -               zero_bvec(&bv);
> +               memzero_bvec(&bv);
>         }));
>  }
>
> @@ -1246,7 +1235,7 @@ static void zero_bvecs(struct ceph_bvec_iter *bvec_pos, u32 off, u32 bytes)
>
>         ceph_bvec_iter_advance(&it, off);
>         ceph_bvec_iter_advance_step(&it, bytes, ({
> -               zero_bvec(&bv);
> +               memzero_bvec(&bv);
>         }));
>  }
>

Ira already brought up the fact that this conversion drops
flush_dcache_page() calls throughout.  Other than that:

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya
