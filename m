Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D371BF26A
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 10:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgD3IPb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 04:15:31 -0400
Received: from elvis.franken.de ([193.175.24.41]:33107 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgD3IPa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 04:15:30 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jU4Lu-0001S9-00; Thu, 30 Apr 2020 10:15:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 334B3C0355; Thu, 30 Apr 2020 10:13:57 +0200 (CEST)
Date:   Thu, 30 Apr 2020 10:13:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2] MIPS: perf: Add hardware perf events support for new
 Loongson-3
Message-ID: <20200430081357.GA7626@alpha.franken.de>
References: <1588145170-9451-1-git-send-email-chenhc@lemote.com>
 <20200429182231.GA21158@alpha.franken.de>
 <CAAhV-H6j9ktHZ2C2Psk6X+0jmh-L9GMgOmKM95x0iXHo0d7TqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H6j9ktHZ2C2Psk6X+0jmh-L9GMgOmKM95x0iXHo0d7TqA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 03:30:55PM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> On Thu, Apr 30, 2020 at 2:33 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Wed, Apr 29, 2020 at 03:26:10PM +0800, Huacai Chen wrote:
> > > New Loongson-3 means Loongson-3A R2 (Loongson-3A2000) and newer CPUs.
> > > Loongson-3 processors have three types of PMU types (so there are three
> > > event maps): Loongson-3A1000/Loonngson-3B1000/Loongson-3B1500 is Type-1,
> > > Loongson-3A2000/Loongson-3A3000 is Type-2, Loongson-3A4000+ is Type-3.
> > >
> > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > ---
> > >  .../asm/mach-loongson64/cpu-feature-overrides.h    |   1 +
> > >  arch/mips/kernel/perf_event_mipsxx.c               | 358 +++++++++++++++++++--
> >
> > checkpatch warns about missing break/fallthrough statement and indention
> > problems, could please look at this ? And as all the new code is only
> > usefull for loongsoon CPUs could you try to only compile it in, if it's
> > enabled for the image ?
> OK, I will solve the "fallthrough" warnings and indention warnings.
> But the other problem is I should use #ifdef CONFIG_CPU_LOONGSON64 to
> guard all new code in this file? I remember that Paul Burton suggest
> us to avoid use #ifdef and use runtime detection instead.

if you do the cpu checks for current_cpu_type() == CPU_LOONGSON64
the compiler will eliminate not needed cpu code. Looks like most
of the new code is done inside case CPU_LOONGSON64 blocks, so
that is fine. Could you check how much size increase you get for
a non loongson64 target with your patch ?


Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
