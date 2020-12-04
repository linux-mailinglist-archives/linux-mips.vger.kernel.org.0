Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 222202CEE71
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 13:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgLDMzH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 07:55:07 -0500
Received: from elvis.franken.de ([193.175.24.41]:48216 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730173AbgLDMzH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Dec 2020 07:55:07 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1klAbR-0005vN-00; Fri, 04 Dec 2020 13:54:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2AE1CC02E5; Fri,  4 Dec 2020 13:14:56 +0100 (CET)
Date:   Fri, 4 Dec 2020 13:14:56 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: KASLR: Fix sync_icache() trapped in loop when
 synci_step is zero
Message-ID: <20201204121456.GA10990@alpha.franken.de>
References: <1606878005-11427-1-git-send-email-hejinyang@loongson.cn>
 <20201202103943.GA9065@alpha.franken.de>
 <b6e97d2f-6d5a-1dbb-3701-b238709b7345@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6e97d2f-6d5a-1dbb-3701-b238709b7345@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 12:02:10PM +0800, Jiaxun Yang wrote:
> 
> 
> 在 2020/12/2 下午6:39, Thomas Bogendoerfer 写道:
> > On Wed, Dec 02, 2020 at 11:00:05AM +0800, Jinyang He wrote:
> > > Reading synci_step by using rdhwr instruction may return zero if no cache
> > > need be synchronized. On the one hand, to make sure all load operation and
> > > store operation finished we do __sync() for every platform. On the other
> > > hand, some platform need operate synci one time although step is zero.
> > Should this be someting like: Avoid endless loop, if no synci is needed ?
> > 
> > > diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
> > > index 57bdd276..47aeb33 100644
> > > --- a/arch/mips/kernel/relocate.c
> > > +++ b/arch/mips/kernel/relocate.c
> > > @@ -64,7 +64,7 @@ static void __init sync_icache(void *kbase, unsigned long kernel_length)
> > >   			: "r" (kbase));
> > >   		kbase += step;
> > > -	} while (kbase < kend);
> > > +	} while (step && kbase < kend);
> > why not do a
> > 
> > 	if (step == 0)
> > 		return;
> > 
> > before entering the loop ? According to MIPS32PRA no synci is needed,
> > if stepi value is zero.
> > 
> > Thomas.
> > 
> > PS: Does anybody know a reason, why this code doesn't use an old fashioned
> > dache/icache flushing, which might be slower but would work also on
> > legecy cores ?
> 
> I thought that's because legacy flush requires much more cares.

that's true. It shouldn't be that hard, but probably has to wait until
someone needs it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
