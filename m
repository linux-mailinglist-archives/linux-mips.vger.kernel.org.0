Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228B71E77DD
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 10:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgE2IGJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 04:06:09 -0400
Received: from elvis.franken.de ([193.175.24.41]:43199 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726519AbgE2IF5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 04:05:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jea1Y-0001El-00; Fri, 29 May 2020 10:05:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 70A20C05BD; Fri, 29 May 2020 09:56:43 +0200 (CEST)
Date:   Fri, 29 May 2020 09:56:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefined under
 CONFIG_TEST_PRINTF
Message-ID: <20200529075643.GA7031@alpha.franken.de>
References: <1590654459-10827-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7W7iXJOmJ8yT7kfuMN2Y8VhzcOUQXrnkytEEqrQZtWmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H7W7iXJOmJ8yT7kfuMN2Y8VhzcOUQXrnkytEEqrQZtWmQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 29, 2020 at 09:24:06AM +0800, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Thu, May 28, 2020 at 4:28 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> > Replace PTR_STR with INST_PTR_STR to fix the following build warning when
> > CONFIG_TEST_PRINTF is set:
> >
> >   CC      lib/test_printf.o
> > lib/test_printf.c:214:0: warning: "PTR_STR" redefined
> >  #define PTR_STR "ffff0123456789ab"
> >  ^
> > In file included from ./arch/mips/include/asm/dsemul.h:11:0,
> >                  from ./arch/mips/include/asm/processor.h:22,
> >                  from ./arch/mips/include/asm/thread_info.h:16,
> >                  from ./include/linux/thread_info.h:38,
> >                  from ./include/asm-generic/preempt.h:5,
> >                  from ./arch/mips/include/generated/asm/preempt.h:1,
> >                  from ./include/linux/preempt.h:78,
> >                  from ./include/linux/spinlock.h:51,
> >                  from ./include/linux/seqlock.h:36,
> >                  from ./include/linux/time.h:6,
> >                  from ./include/linux/stat.h:19,
> >                  from ./include/linux/module.h:13,
> >                  from lib/test_printf.c:10:
> > ./arch/mips/include/asm/inst.h:20:0: note: this is the location of the previous definition
> >  #define PTR_STR  ".dword"
> >  ^
> >
> > Fixes: e701656ec4db ("MIPS: inst.h: Stop including asm.h to avoid various build failures")
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Thank you for catching this issue, but I think this is not the best
> solution. Maciej suggest another solution, and I will send a patch to
> fix it.

thank you, I was about to fix it myself. Not sure about your plan,
but my idea would be to move the unaligned stuff into it's another
or a new header file.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
