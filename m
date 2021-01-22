Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E86030109B
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 00:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbhAVXIn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 18:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730787AbhAVTju (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Jan 2021 14:39:50 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C039DC061786;
        Fri, 22 Jan 2021 11:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=fJjrLTchpZuvDRdgUaJrEMQ1tsdbXe3AFrBHowtkRTE=; b=IqrLDNur1JkaUgBRhjlM73OSmu
        b6lCABj2VbpFJ32JmgrlgxU2CyUXiR6VLkTwP4UIxHqo3BYloo1ehCVFe/hfI0x3EXeRaoeahtGLQ
        INgelaOuYKfJf1jePi8BKJNBtE7TvnfpZVkuS+ey7Tf4YejyqNcE1uNaAkIKreKDpgKoLo+UC1ppO
        KMFM0MjV55nhjXlBXaiNm9HYEOytCROcdHY7DtAe+VIG2ynUaRyW0QT/TsXZTTscxNoB/0dcVVZ40
        H//J7uN4RblWtwH2XhJcnYhUd4IAMjerKJUUUgSqsuj5pMP76Sf7eSLOglzBMIAUxGC2ZK+wyvRz/
        TQ9nZmpg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l32GG-0018wl-ED; Fri, 22 Jan 2021 19:38:26 +0000
Date:   Fri, 22 Jan 2021 19:38:24 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v10] block: Add n64 cart driver
Message-ID: <20210122193824.GA271343@infradead.org>
References: <20210122213346.774020bb9393ebded17e7412@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122213346.774020bb9393ebded17e7412@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> +static int n64cart_do_bvec(struct device *dev, struct bio_vec *bv,
> +			   unsigned int len, unsigned int off,
> +			   u32 pos)

I think this should either return bool or a blk_status_t instead
of the int with 1/0 values.

> +	if (bio_end_sector(bio) > get_capacity(bio->bi_disk))
> +		goto io_error;

This check is already performed by the block layer.  I have a series
pending that removes it from the few drivers that duplicate it.

> +
> +	bio_for_each_segment(bvec, bio, iter) {
> +		unsigned int len = bvec.bv_len;
> +		int err;
> +
> +		/* Alignment check */
> +		WARN_ON_ONCE((bvec.bv_offset & (MIN_ALIGNMENT - 1)) ||
> +				(len & (MIN_ALIGNMENT - 1)));
> +
> +		err = n64cart_do_bvec(dev, &bvec, len,
> +				      bvec.bv_offset, pos);
> +		if (err)
> +			goto io_error;
> +		pos += len;

Nit: I'd just pass the bvec to n64cart_do_bvec, calculate pos there
locally each time, and also move the WARN_ON_ONCE into the helper.

No real need for the len local variable either.
