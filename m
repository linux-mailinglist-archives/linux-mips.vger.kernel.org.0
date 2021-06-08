Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA2F39FC91
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhFHQdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:33:09 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:38409 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbhFHQdI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:33:08 -0400
Received: by mail-pg1-f182.google.com with SMTP id t17so389426pga.5;
        Tue, 08 Jun 2021 09:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c/oBlFBZpymRmok4+Br5HKJTKzk4izKuifiUtNGmmMU=;
        b=Gt5jel2CR9xCdZy9k96JXt+8Ohx6Hixp6IpzWMRAR4iLEmegUVW4WKifvZKonDQZ0O
         hFDoO+GkKuA7wfp9NGKknXspxzCWCgp2OimNYaANzPXxHSbG+KUdocKaOCYDD7F8oO5Y
         npDiaohydAOoCwa5n8M6iQWqcs1oKAI/HCMlMnpL4yZma3Dnm6fEj1bQnyoFv8bdSn9q
         lVj8cdTFc04NC3X5jqK5PzCY0V9P1w7CDUmMWGLfTN5PgFO090vwFt2xYXhpOcFecOpW
         kaA9wcOgSHUc1e2Ea4kcBDINhBHG8SABK2HUl3Bwql538KodRNaBn2Ur3IGcv5g0SOPT
         M5LQ==
X-Gm-Message-State: AOAM530asWA/LjqZ0L0IP4C1ykJDutu2oD0AaSZuRzfeW8we7D9otThD
        iSHap2tIMjkwyCrGwgi71Z/8FolKoGc=
X-Google-Smtp-Source: ABdhPJxAnY1ILuuUidoa80Is797vj32J19rnEPL6OqbB3/VUdrwY9tRxfOHxegyAC+CunZFhbY6BTQ==
X-Received: by 2002:a65:6243:: with SMTP id q3mr23851189pgv.297.1623169859346;
        Tue, 08 Jun 2021 09:30:59 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id c5sm9194629pfn.144.2021.06.08.09.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 09:30:58 -0700 (PDT)
Subject: Re: [PATCH 08/16] dm-writecache: use bvec_kmap_local instead of
 bvec_kmap_irq
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        ceph-devel@vger.kernel.org
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-9-hch@lst.de>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <4c248453-713f-9da8-04e8-7939388be49a@acm.org>
Date:   Tue, 8 Jun 2021 09:30:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210608160603.1535935-9-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/8/21 9:05 AM, Christoph Hellwig wrote:
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index aecc246ade26..93ca454eaca9 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -1205,14 +1205,13 @@ static void memcpy_flushcache_optimized(void *dest, void *source, size_t size)
>  static void bio_copy_block(struct dm_writecache *wc, struct bio *bio, void *data)
>  {
>  	void *buf;
> -	unsigned long flags;
>  	unsigned size;
>  	int rw = bio_data_dir(bio);
>  	unsigned remaining_size = wc->block_size;
>  
>  	do {
>  		struct bio_vec bv = bio_iter_iovec(bio, bio->bi_iter);
> -		buf = bvec_kmap_irq(&bv, &flags);
> +		buf = bvec_kmap_local(&bv);
>  		size = bv.bv_len;
>  		if (unlikely(size > remaining_size))
>  			size = remaining_size;
> @@ -1230,7 +1229,7 @@ static void bio_copy_block(struct dm_writecache *wc, struct bio *bio, void *data
>  			memcpy_flushcache_optimized(data, buf, size);
>  		}
>  
> -		bvec_kunmap_irq(buf, &flags);
> +		kunmap_local(buf);
>  
>  		data = (char *)data + size;
>  		remaining_size -= size;

From one of the functions called by kunmap_local():

unsigned long addr = (unsigned long) vaddr & PAGE_MASK;

This won't work well if bvec->bv_offset >= PAGE_SIZE I assume?

Thanks,

Bart.
