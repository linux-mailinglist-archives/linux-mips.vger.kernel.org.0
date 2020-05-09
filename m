Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347161CC270
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2020 17:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgEIPfa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 May 2020 11:35:30 -0400
Received: from elvis.franken.de ([193.175.24.41]:46036 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727092AbgEIPfa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 May 2020 11:35:30 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jXRVf-0005ZO-00; Sat, 09 May 2020 17:35:27 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9AB96C044C; Sat,  9 May 2020 17:25:01 +0200 (CEST)
Date:   Sat, 9 May 2020 17:25:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: inst.h: Stop including asm.h to avoid various
 build failures
Message-ID: <20200509152501.GA9125@alpha.franken.de>
References: <1588930212-5255-1-git-send-email-chenhc@lemote.com>
 <20200508130149.GA14297@alpha.franken.de>
 <CAAhV-H5BRhxvaQ_-RHYkEe8BY-OSQto1FhQtBx3T+bZTOVs+-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H5BRhxvaQ_-RHYkEe8BY-OSQto1FhQtBx3T+bZTOVs+-Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 09, 2020 at 12:10:05PM +0800, Huacai Chen wrote:
> On Fri, May 8, 2020 at 9:31 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Fri, May 08, 2020 at 05:30:12PM +0800, Huacai Chen wrote:
> > > Commit d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to
> > > inst.h") causes a lot of build failures because macros in asm.h conflict
> > > with various subsystems. Some of these conflictions has been fixed (such
> > > as LONG, PANIC and PRINT) by adjusting asm.h, but some of them is nearly
> > > impossible to fix (such as PTR and END). The only reason of including
> > > asm.h in inst.h is that we need the PTR macro which is used by unaligned
> > > load/store helpers. So in this patch we define a new PTR_STR macro and
> > > use it to replace STR(PTR), then we can stop including asm.h to avoid
> > > various build failures.
> > >
> > > Fixes: d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to inst.h")
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > > ---
> > >  arch/mips/include/asm/inst.h | 184 ++++++++++++++++++++++---------------------
> >
> > applied to mips-next. /me hopes this is the last fix... thanks
> I think this is the last fix... and, does "MIPS: asm: Rename some
> macros to avoid build errors" need to be reverted?

let's keep it as it is now.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
