Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156A5318841
	for <lists+linux-mips@lfdr.de>; Thu, 11 Feb 2021 11:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhBKKen (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Feb 2021 05:34:43 -0500
Received: from elvis.franken.de ([193.175.24.41]:44670 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhBKKbm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Feb 2021 05:31:42 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lA9FS-0005LQ-03; Thu, 11 Feb 2021 11:30:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id AA6C0C0E70; Thu, 11 Feb 2021 11:23:14 +0100 (CET)
Date:   Thu, 11 Feb 2021 11:23:14 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v11] block: Add n64 cart driver
Message-ID: <20210211102314.GD7985@alpha.franken.de>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
 <20210123124210.GB458363@infradead.org>
 <20210206192837.5ecec54cc5ac120ade1d5060@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206192837.5ecec54cc5ac120ade1d5060@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 06, 2021 at 07:28:37PM +0200, Lauri Kasanen wrote:
> On Sat, 23 Jan 2021 12:42:10 +0000
> Christoph Hellwig <hch@infradead.org> wrote:
> 
> > Looks good,
> >
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Hi,
> 
> Ping on this patch. Thomas, do you want to pick it up?

well that's up to the block maintainer. I'm open to take it
trhough mips-next, but then I need an acked-by for it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
