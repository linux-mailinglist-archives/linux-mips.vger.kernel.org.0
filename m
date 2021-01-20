Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3112FD441
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 16:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732271AbhATOu1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Jan 2021 09:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732634AbhATOpA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Jan 2021 09:45:00 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6920AC061757;
        Wed, 20 Jan 2021 06:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=8oGnse20jtcObzKBjFFKIfOWtA48on9bdegesC2EgOY=; b=nyvB4UlH9NmdhY4gBU6Nv7//7t
        O5JAE1LZeo1XMVMo3f9j4X/v1Mywly9us6K6YRjldh4vaqQ/jHercdD5VRbU5XLE7x8WOxeEk6ADq
        gBCM7RyD9dGSSzXox1P1yX0N7ukBbyoBAYeARIKD9T2BoN1IG2oFpufcDdw6w8Qo08YESrlHxxew3
        8oVDafwcgi88JToyDvu6nHxgbNRqWBNTrq8wIjpRVdFuwE6n0uvC0Lpj/5N9r4kkzdF72+37yqrVa
        SETrZLgV1JjNl/oWiE/Hj1l7c/XZZ4KllgO+kR9GPIwIgbPwWzEUEP60Mjtg4/ztKD47KTp47EmKk
        pSRpACgQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l2EiL-00Fnfm-73; Wed, 20 Jan 2021 14:44:09 +0000
Date:   Wed, 20 Jan 2021 14:44:05 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 3/3 v7] block: Add n64 cart driver
Message-ID: <20210120144405.GA3763056@infradead.org>
References: <20210115133559.84b2997dc326c277c4d91503@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115133559.84b2997dc326c277c4d91503@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> +
> +MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
> +MODULE_DESCRIPTION("Driver for the N64 cart");
> +MODULE_LICENSE("GPL");
> +
> +#define BUFSIZE (64 * 1024)

Maybe use SZ_64K here?

> +	void *dst = bio_data(req->bio);
> +
> +	if (bstart + len > size)
> +		return BLK_STS_IOERR;
> +
> +	bstart += start;
> +
> +	while (len) {
> +		const u32 curlen = len < BUFSIZE ? len : BUFSIZE;
> +
> +		dma_cache_inv((unsigned long) buf, curlen);

dma_cache_inv is not a public API, but only a helper for the DMA API.

> +		n64cart_wait_dma();
> +
> +		barrier();
> +		n64cart_write_reg(PI_DRAM_REG, dma_addr);
> +		barrier();

barrier is just a compiler barrier.  But the mmio APIs already include
actual cpu barriers where applicable, so I don't think you need these at
al.

> +		n64cart_write_reg(PI_CART_REG, (bstart | 0x10000000) & 0x1FFFFFFF);

Overly long line.  Also this looks a little too magic, can you explain
what is going on here with symbolic constants and&or a helper?

> +
> +	do {
> +		err = get_seg(req);
> +	} while (blk_update_request(req, err, blk_rq_cur_bytes(req)));
> +
> +	blk_mq_end_request(req, BLK_STS_OK);

This should be __blk_mq_end_request given that you call
blk_update_request manually.

> +	major = register_blkdev(0, "n64cart");

No need to call register_blkdev in a new driver, just set the
GENHD_FL_EXT_DEVT flag in struct gendisk.

> +	buf = kmalloc(BUFSIZE, GFP_DMA | GFP_KERNEL);
> +	if (!buf) {
> +		err = -ENOMEM;
> +		goto fail_queue;
> +	}
> +	dma_addr = virt_to_phys(buf);

Please use dma_aloc_noncoherent to allocate dma memory.  And then
use the dma_sync_single_for_{device,cpu} to transfer ownership to
and from the device.


Just curious:  wouldn't it make more sense to implement this as a bio
based driver with a helper thread?  It doesn't look like blk-mq provides
you a lot of benefits here.  And then we could make the blk-mq code
optional and you could save a fair amount of a kernel memory on your
rather constrained device.
