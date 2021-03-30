Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7893C34F261
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 22:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhC3Uqg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 16:46:36 -0400
Received: from elvis.franken.de ([193.175.24.41]:38593 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232290AbhC3UqC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 16:46:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lRLFR-0007z3-00; Tue, 30 Mar 2021 22:46:01 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D7E34C2047; Tue, 30 Mar 2021 22:02:22 +0200 (CEST)
Date:   Tue, 30 Mar 2021 22:02:22 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] MIPS: uaccess: Remove get_fs/set_fs call sites
Message-ID: <20210330200222.GB18146@alpha.franken.de>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de>
 <20210330172702.146909-3-tsbogend@alpha.franken.de>
 <20210330174943.GB15145@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330174943.GB15145@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 30, 2021 at 07:49:43PM +0200, Christoph Hellwig wrote:
> On Tue, Mar 30, 2021 at 07:26:59PM +0200, Thomas Bogendoerfer wrote:
> > +#define __get_data(x, ptr, u)						\
> > +	(((u) == true) ? __get_udata((x), (ptr), sizeof(*(ptr))) :	\
> > +			__get_kdata((x), (ptr), sizeof(*(ptr))))
> > +
> 
> I'm a little worried about exposing this in uaccess.h.  Can you
> have local helpers insted, preferably strongly typed for their
> specific use cases?

sure, no problem.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
