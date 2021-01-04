Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BBA2E992A
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbhADPtp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:49:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:33894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbhADPtp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 10:49:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C7452245C;
        Mon,  4 Jan 2021 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609775344;
        bh=DDZiFQjgBagC83hsc5nY6Bb6Qby4XeHxkTeVloPqZpE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nPi8BB28PMPqD8H82FQrBA9sORa5t997Ak9Fe5ZT2ZbT8dkr/6DEn16IU/hBXNT7K
         AAjoQpEZgH7WM++Fm5dtG7u+VD3WGnHaZ4FAWxFNIwhj70L27G/tB/N2jt+DItBdJW
         T07iwwUAZ8xA0n1vwdUHl+mr9IzwaXU4CBnsTaeKdqd0SP8VVpTybixb77/N6Sdi6Z
         UqYnb5gGQtPDQbvrUu3bUAzEU8C0clgvOa3tt49YT7eruOmWQIFWwD6FJZ4nfBSDyx
         HSoW1uk9c3WDu/ZZK+Pe8/homGkS1HCmdicHDPdZgaRbkrRWCM0DWCmgJzjWb44rHt
         v02VzyyTaStBg==
Date:   Mon, 4 Jan 2021 07:49:02 -0800
From:   Keith Busch <kbusch@kernel.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
Message-ID: <20210104154902.GA1024941@dhcp-10-100-145-180.wdc.com>
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 04, 2021 at 03:50:31PM +0200, Lauri Kasanen wrote:
> block folks: rest of the series is on linux-mips. Being a mips-specific driver,
> not sure which tree it should go to.

Probably through mips.
 
> +static void n64cart_wait_dma(void)
> +{
> +	while (n64cart_read_reg(PI_STATUS_REG) &
> +		(PI_STATUS_DMA_BUSY | PI_STATUS_IO_BUSY))
> +		;
> +}

These sorts of loops generally call cpu_relax().

> +static blk_status_t get_seg(struct request *req)
> +{
> +	u32 bstart = blk_rq_pos(req) * 512;
> +	u32 len = blk_rq_cur_bytes(req);
> +	void *dst = bio_data(req->bio);
> +
> +	if (bstart + len > size || rq_data_dir(req) == WRITE)
> +		return BLK_STS_IOERR;

If you don't support writes (is that limitation temporary?), then you
can prevent such operations from reaching the driver by setting the
"disk" to read-only during initialization with set_disk_ro(disk, true).

> +static blk_status_t n64cart_queue_rq(struct blk_mq_hw_ctx *hctx,
> +				     const struct blk_mq_queue_data *bd)
> +{
> +	unsigned long flags;
> +	struct request *req = bd->rq;
> +	blk_status_t err;
> +
> +	blk_mq_start_request(req);
> +
> +	spin_lock_irqsave(&n64cart_lock, flags);

The .queue_rq() isn't called from an interrupts disabled context, so
there should be no need to save the flags. And since you're not taking
this lock from an interrupt context anywhere else, I don't think you
need to use the spin_lock_irq() variant either.

But since you just want to single-thread all IO, you could get that by
setting your tagset queue_depth to 1 and remove the spinlock entirely.

> +static int __init n64cart_init(void)
> +{
> +	int err;
> +
> +	if (!start || !size) {
> +		pr_err("n64cart: start and size not specified\n");
> +		return -ENODEV;
> +	}

Just curious, is it not possible to discover these values from the
installed cart? Requiring module parameters seems a bit fragile.
