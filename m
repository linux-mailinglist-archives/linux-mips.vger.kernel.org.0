Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C9D358E88
	for <lists+linux-mips@lfdr.de>; Thu,  8 Apr 2021 22:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhDHUiR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Apr 2021 16:38:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:35356 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231676AbhDHUiR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Apr 2021 16:38:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lUbPg-0007g1-00; Thu, 08 Apr 2021 22:38:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0AB84C24DB; Thu,  8 Apr 2021 22:37:45 +0200 (CEST)
Date:   Thu, 8 Apr 2021 22:37:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: uaccess: Reduce number of nested macros
Message-ID: <20210408203744.GA18538@alpha.franken.de>
References: <20210408181437.19570-1-tsbogend@alpha.franken.de>
 <20210408194611.GA16189@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408194611.GA16189@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 08, 2021 at 09:46:11PM +0200, Christoph Hellwig wrote:
> > +#define put_user(x, ptr)						\
> > +({									\
> > +	__typeof__(*(ptr)) __user *__p = (ptr);				\
> > +									\
> > +	might_fault();							\
> > +	access_ok(__p, sizeof(*__p)) ?					\
> > +		__put_user((x), __p) :					\
> > +		-EFAULT;						\
> 
> Why not merge this into a single line, which seems a little more
> readable:
> 
> 	access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;	\

I just copied the riscv version ;-) I'll make it one line before applying.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
