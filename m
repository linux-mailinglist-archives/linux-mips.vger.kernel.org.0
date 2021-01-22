Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7218A3009AD
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 18:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729388AbhAVRZZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 12:25:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:43294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728996AbhAVRMD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 12:12:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FD56233FA;
        Fri, 22 Jan 2021 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611335482;
        bh=0XIyyg4LOxNrer6F5QQYteZcaKAJap8zqz/sF3g3bUU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O6mHpXMzH3/bRn5H1clkBsP+H1i46DrSdrROkK77olwJj6xOYIdEP0RZZ6W4M/U5k
         Y/KWdXeweeLFswfslNaSDLeQpCQCWQxYWkaLjou/e/146ExLQ6RP5q9yXX/6QISrnr
         A4cJ3JLk9mjMf9OS60c2ol+T8xCBwmlgk0kV1Npwd8EN2/9wIMohQTM0uWn32KYzYU
         w2JhqbyG4q+NOKOJ9okwqFR+bbkbovdOBcEhFhTPDdEXV3fuB3ijuGWde7WRO9Vr4S
         FlV4jX9+3CMvrb6XMVOgt29IbVfj2Yx2fo0FwjiiS1ggInQwzn3Ks5HSgVn8cpfayZ
         ZT4KhfKlYctQg==
Date:   Fri, 22 Jan 2021 09:11:20 -0800
From:   Keith Busch <kbusch@kernel.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-ID: <20210122171120.GA1728441@dhcp-10-100-145-180.wdc.com>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
 <20210122111727.GA161970@infradead.org>
 <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
 <20210122161804.GA225607@infradead.org>
 <20210122182349.c98d8599f7593afefa43c9dd@gmx.com>
 <20210122163913.GA227449@infradead.org>
 <20210122185619.980fa4f713b8f57528c3af9e@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122185619.980fa4f713b8f57528c3af9e@gmx.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 06:56:19PM +0200, Lauri Kasanen wrote:
> On Fri, 22 Jan 2021 16:39:13 +0000
> Christoph Hellwig <hch@infradead.org> wrote:
> 
> > On Fri, Jan 22, 2021 at 06:23:49PM +0200, Lauri Kasanen wrote:
> > > > Your driver can communicate the required alignment using the
> > > > blk_queue_update_dma_alignment API.
> > >
> > > Is it guaranteed to be physically contiguous?
> >
> > The alignment requirement applies to each bio_vec.
> >
> > What alignment does the hardware require?
> 
> It requires 8-byte alignment, but the buffer must also be physically
> contiguous.

Each bio_vec segment is physically contiguous.

> I grepped around, but apparently no driver under drivers/block does
> direct DMA to the bio buffer. They all use their own buffer and memcpy,
> like this patch. ps3vram, ps3disk, amiflop, etc etc.

block/brd.c
 
> If all existing drivers use their own buffer, why is a different
> approach required for new drivers?

It's certainly more efficient to send the data directly to the
destination without an unnecessary middle-man. And 64k seems like quite
a lot of memory to sequestor considering how little you have to start
with.
