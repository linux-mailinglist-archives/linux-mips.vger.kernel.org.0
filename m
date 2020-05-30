Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7101E8FEB
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 11:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgE3JGa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 05:06:30 -0400
Received: from elvis.franken.de ([193.175.24.41]:44328 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgE3JG3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 30 May 2020 05:06:29 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jexRh-0001vR-00; Sat, 30 May 2020 11:06:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E64CDC05F2; Sat, 30 May 2020 11:05:43 +0200 (CEST)
Date:   Sat, 30 May 2020 11:05:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefinition
Message-ID: <20200530090543.GA3202@alpha.franken.de>
References: <1590740530-15649-1-git-send-email-chenhc@lemote.com>
 <20200529111858.GA11955@alpha.franken.de>
 <CAAhV-H41SPVQzRmQAVYpgW_dChz+QXwTZHKGWJQv4B7JjQ5gjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H41SPVQzRmQAVYpgW_dChz+QXwTZHKGWJQv4B7JjQ5gjA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 30, 2020 at 12:43:17PM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> On Fri, May 29, 2020 at 7:19 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Fri, May 29, 2020 at 04:22:10PM +0800, Huacai Chen wrote:
> > >  arch/mips/include/asm/inst.h      | 779 ------------------------------------
> > >  arch/mips/include/asm/unaligned.h | 802 ++++++++++++++++++++++++++++++++++++++
> >
> > please use a different filename for this to avoid another disaster
> > because asm/unaligned.h is already used.
> It seems like unaligned.h is the best place, because LoadXX/StoreXX is
> nearly the same thing as get_unaligned/put_unaligned in the original
> unaligned.h. For PTR_STR, the only confliction comes from
> lib/test_printf.c, but lib/test_printf.c doesn't include unaligned.h.
> And it seems there is no future problem, because unaligned.h has only
> one new macro (i.e., PTR_STR, while LoadXX/StoreXX has no problems).

this approach has two things I don't like. First it duplicates code
from asm-generic/unaligned.h and second it again risks to leak PTR_STR
since asm/unaligned.h is included by other kernel code.

I took your patch renamed unaligned.h to unaligned-emul.h, included 
asm/asm.h and replaced PTR_STR by STR(PTR). I've pushed it to mips-next
with a Co-developed by you.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
