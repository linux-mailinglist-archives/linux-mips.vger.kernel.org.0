Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD532E9ACF
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 17:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbhADQOP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 11:14:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:46798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728925AbhADQOP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 11:14:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32F1720769;
        Mon,  4 Jan 2021 16:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609776814;
        bh=0O9cgiszsmkiPH9qvSUIsnGC/DBt3cGbj3zvOhZUmDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tANr90w6w60WttQdlgNU1JUmMcPtHwX1Ry8UVpDJNbIlsmAREuB13X+UxeyAEeR+0
         nn1UPLvOMvjBXh2DXwkYh/62C/MtTf29TSVkzBH1+dMNxUHOHVaB0D6/G2mevFFg3a
         g5WYTQCtrdU5iguFrTWzk736xkIjL3/X59BdsPryRiacAMeGOX9ZDQH6D0IhxtVMwc
         yyxyMg4k65dFO/xwOVWnFpkLNjiREaX+UPqgIeuA8Cjzxl9oyqam91X5r7UDY5wN3v
         pUUYWOpPeJ7wnwD93QNvSgwsfOFiM/gl+gdDPKvLGH1PVTTV+hdV65YrXEUFBJOiRh
         QRW8/+uG9Hc0w==
Date:   Mon, 4 Jan 2021 08:13:32 -0800
From:   Keith Busch <kbusch@kernel.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
Message-ID: <20210104161332.GC1024941@dhcp-10-100-145-180.wdc.com>
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
 <20210104154902.GA1024941@dhcp-10-100-145-180.wdc.com>
 <20210104180115.b1d5438cd4ee21efcd557976@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104180115.b1d5438cd4ee21efcd557976@gmx.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 04, 2021 at 06:01:15PM +0200, Lauri Kasanen wrote:
> On Mon, 4 Jan 2021 07:49:02 -0800
> Keith Busch <kbusch@kernel.org> wrote:
> 
> > On Mon, Jan 04, 2021 at 03:50:31PM +0200, Lauri Kasanen wrote:
> > > block folks: rest of the series is on linux-mips. Being a mips-specific driver,
> > > not sure which tree it should go to.
> >
> > Probably through mips.
> 
> Thanks.

To be more clear, the initial commit probably makes since to go through
mips once the series is ready, but new block drivers do need to be sent
to linux-block for the appropriate acks and reviews first.
 
> > > +static blk_status_t get_seg(struct request *req)
> > > +{ > > > +	u32 bstart = blk_rq_pos(req) * 512;
> > > +	u32 len = blk_rq_cur_bytes(req);
> > > +	void *dst = bio_data(req->bio);
> > > +
> > > +	if (bstart + len > size || rq_data_dir(req) == WRITE)
> > > +		return BLK_STS_IOERR;
> >
> > If you don't support writes (is that limitation temporary?), then you
> > can prevent such operations from reaching the driver by setting the
> > "disk" to read-only during initialization with set_disk_ro(disk, true).
> 
> The media is read-only (but not runtime removable).

It's been a while, but I could swear we can save state on these carts.
If so, it sounds like that must be separate from the media this driver
is accessing, so is that capability provided through a different driver?
