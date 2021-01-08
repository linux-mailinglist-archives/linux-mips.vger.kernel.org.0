Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A062EEF70
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 10:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbhAHJWs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 04:22:48 -0500
Received: from elvis.franken.de ([193.175.24.41]:35839 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbhAHJWr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Jan 2021 04:22:47 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxny9-0008TB-00; Fri, 08 Jan 2021 10:22:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2C506C081D; Fri,  8 Jan 2021 09:40:51 +0100 (CET)
Date:   Fri, 8 Jan 2021 09:40:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/6] mips: Add N64 machine type
Message-ID: <20210108084051.GA6710@alpha.franken.de>
References: <20210104154357.6cf126150407ba4839630177@gmx.com>
 <20210107171035.GA13117@alpha.franken.de>
 <20210108090434.d404fe2dfa604542d8c88a05@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108090434.d404fe2dfa604542d8c88a05@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 08, 2021 at 09:04:34AM +0200, Lauri Kasanen wrote:
> On Thu, 7 Jan 2021 18:10:35 +0100
> Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:
> 
> > 32BIT kernel don't compile, because you use TO_UNCAC which only
> > exists for 64bit kernels. One solution would be to use CKSEG1 to
> > convert from physical to an uncached address. But I'd prefer if
> > you add resources to your platform device and do ioremap in device
> > drivers. This way there is also no need to export the interrupt
> > defines outside.
> 
> :( Jiaxun told me to use TO_UNCAC because CKSEG1 was unclear to him...
> 
> I will change back to CKSEG1. ioremap seems much needless overhead.

ok, let me put it that way: Using ioremap is not a wish. To get your code
integrated use ioremap and platform resources. IMHO driver maintainers
will appreciate that as well. 

> > > +#define RCP_IRQ			MIPS_CPU_IRQ(2)
> > > +#define CART_IRQ		MIPS_CPU_IRQ(3)
> > > +#define PRENMI_IRQ		MIPS_CPU_IRQ(4)
> > > +#define RDBR_IRQ		MIPS_CPU_IRQ(5)
> > > +#define RDBW_IRQ		MIPS_CPU_IRQ(6)
> > > +#define TIMER_IRQ		MIPS_CPU_IRQ(7)
> >
> > and this IMHO also unsed, so no need to define it.
> 
> The sound driver uses the RCP IRQ; the machine-specific names are
> defined because they're much more clear.

you can keep the defines, but no need to have it in an #include when
you move it to n64/init.c. From there you pass it via platform irq
resource to drivers. Background is that I want to keep stuff in
mach-xxx at the bear minimum.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
