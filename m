Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F46F2E9D2D
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 19:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbhADShz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 13:37:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:46222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbhADShz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 13:37:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C17620663;
        Mon,  4 Jan 2021 18:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609785434;
        bh=J1cGuPleoSI5zPluNEqAr770WDvm3AN/VcL3CeO73YU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XREe7U/kv75I3o+JEoI89YFPItpIBCO4IFED6CJBQhZe49aiq3HtI6jbMDLe0Iw+R
         o7R+9OrRpyUlWxbPClSAGFwoTw97ng16wQij+dYAoQOdiliGR1A9/SMthWR4D46N3T
         lKLq1F3xcZkGFUQ5EXAcQXi+KF4UPbv51lEH/012bz+ZnhImd3sAAIaK5Znwkl/TFI
         ZflLtx9Q/MvwHNKbkbjWdTwBwFJoKXVrzgTCiRnV2pRYx48mP6l0AkcNRY1BqXUkFr
         N1hsgEvoDrjTtyB+j+kzACumFVm1sHPwd3jENKOg7zVi2zgqWiDPAHQDOGdzbE/Ixj
         9g95fLwXyo+eQ==
Date:   Mon, 4 Jan 2021 10:37:12 -0800
From:   Keith Busch <kbusch@kernel.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6 v2] block: Add n64 cart driver
Message-ID: <20210104183712.GD1024941@dhcp-10-100-145-180.wdc.com>
References: <20210104195611.61997e86092b3559c95f36fc@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104195611.61997e86092b3559c95f36fc@gmx.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 04, 2021 at 07:56:11PM +0200, Lauri Kasanen wrote:
> +static blk_status_t get_seg(struct request *req)
> +{
> +	u32 bstart = blk_rq_pos(req) * 512;
> +	u32 len = blk_rq_cur_bytes(req);
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
> +
> +		n64cart_wait_dma();
> +
> +		barrier();
> +		n64cart_write_reg(PI_DRAM_REG, dma_addr);
> +		barrier();
> +		n64cart_write_reg(PI_CART_REG, (bstart | 0x10000000) & 0x1FFFFFFF);
> +		barrier();
> +		n64cart_write_reg(PI_WRITE_REG, curlen - 1);
> +		barrier();
> +
> +		n64cart_wait_dma();
> +
> +		memcpy(dst, buf, curlen);

Is there a reason for using a bounce buffer rather than reading directly
into the destination?
