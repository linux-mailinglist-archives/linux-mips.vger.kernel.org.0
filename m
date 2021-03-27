Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684EC34B5B8
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 10:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhC0JrA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 05:47:00 -0400
Received: from elvis.franken.de ([193.175.24.41]:53073 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230415AbhC0Jqg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Mar 2021 05:46:36 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQ5Wa-0005A7-00; Sat, 27 Mar 2021 10:46:32 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8B16FC1D8B; Sat, 27 Mar 2021 10:46:20 +0100 (CET)
Date:   Sat, 27 Mar 2021 10:46:20 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: ralink: mt7621: add memory detection support
Message-ID: <20210327094620.GA4320@alpha.franken.de>
References: <20210317055902.506773-1-ilya.lipnitskiy@gmail.com>
 <20210325095529.GA5775@alpha.franken.de>
 <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCv0x2ni97mLEar6M9boWCrXzdsqM3JJNMbe=cDitHj+npanw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 25, 2021 at 07:45:23PM -0700, Ilya Lipnitskiy wrote:
> On Thu, Mar 25, 2021 at 3:01 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Tue, Mar 16, 2021 at 10:59:02PM -0700, Ilya Lipnitskiy wrote:
> > > From: Chuanhong Guo <gch981213@gmail.com>
> > >
> > > mt7621 has the following memory map:
> > > 0x0-0x1c000000: lower 448m memory
> > > 0x1c000000-0x2000000: peripheral registers
> > > 0x20000000-0x2400000: higher 64m memory
> > >
> > > detect_memory_region in arch/mips/kernel/setup.c only adds the first
> > > memory region and isn't suitable for 512m memory detection because
> > > it may accidentally read the memory area for peripheral registers.
> > >
> > > This commit adds memory detection capability for mt7621:
> > >   1. Add the highmem area when 512m is detected.
> > >   2. Guard memcmp from accessing peripheral registers:
> > >      This only happens when a user decided to change kernel load address
> > >      to 256m or higher address. Since this is a quite unusual case, we
> > >      just skip 512m testing and return 256m as memory size.
> > >
> > > [...]
> >
> > I get
> >
> > WARNING: modpost: vmlinux.o(.text+0x132c): Section mismatch in reference from the function prom_soc_init() to the function .init.text:mt7621_memory_detect()
> > The function prom_soc_init() references
> > the function __init mt7621_memory_detect().
> > This is often because prom_soc_init lacks a __init
> > annotation or the annotation of mt7621_memory_detect is wrong.
> >
> > Can you please fix this ?
> Thanks, I will fix it. Having trouble reproducing the error, but I
> clearly see the issue. Are you building on a MIPS target or
> cross-compiling (I'm cross-compiling and no errors).

I'm cross compiling, I can provide you the .config, if you want.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
