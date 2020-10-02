Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C7E281022
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 11:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgJBJw6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 05:52:58 -0400
Received: from elvis.franken.de ([193.175.24.41]:39814 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgJBJw6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Oct 2020 05:52:58 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kOHkG-0002DT-00; Fri, 02 Oct 2020 11:52:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1443DC1058; Fri,  2 Oct 2020 11:52:48 +0200 (CEST)
Date:   Fri, 2 Oct 2020 11:52:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu
Subject: Re: [PATCH] MIPS: remove the obsolete RM7000 extended interrupts
 handler
Message-ID: <20201002095248.GA9146@alpha.franken.de>
References: <20200912142306.3604968-1-fazilyildiran@gmail.com>
 <20200918135053.GB19202@alpha.franken.de>
 <alpine.LFD.2.21.2009301529080.333514@eddie.linux-mips.org>
 <20200930212131.GA14275@alpha.franken.de>
 <alpine.LFD.2.21.2009302342030.333514@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2009302342030.333514@eddie.linux-mips.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 01, 2020 at 12:10:57AM +0100, Maciej W. Rozycki wrote:
> On Wed, 30 Sep 2020, Thomas Bogendoerfer wrote:
> 
> > > > not yet;-) I have an RM7000 based system in my basement... I'm also
> > > > not sure, if R7k O2s need that.
> > > 
> > >  One of the more exotic Malta daughtercards used that too I believe.  I'd 
> > > have to check the docs.  Of course getting hands on such a daughtercard is 
> > > another matter, but we continue having RM7000 enabled for the Malta.
> > 
> > I've checked interrupts on P6064 and doesn't use the "extented" interrupts.
> > And since O2 uses the same CPU connector for all CPU boards I doubt it
> > it either.
> 
>  Mind that interrupts can be asserted in the RM7k via an external write 
> request too, and I'm fairly sure SGI hardware would use that rather than 
> interrupt inputs given that R4000/R4400 SC/MC CPUs only have Int*(0) wired 
> and all the remaining interrupts are only available via a processor write.  
> Have you checked that?

checked now, IP32 uses a single interrupt pin coming from CRIME ASIC,
so nothing "fanncy" there and no use for the extended RM7k interrupts.

> > What about Malta ? 
> 
>  So this is the CoreBonito64 daughtercard, which can have either an RM5261 
> or an RM7061 processor installed.  The Int*(9:6) inputs are not mentioned, 
> which I take it means unconnected, and ExtRqst* has a pull-up and is 
> otherwise wired to a debug connector only.  Which makes me conclude this 
> feature cannot be used in a standard application with this card.
> 
>  NB there is another interrupt controller embedded in the Bonito64 system 
> controller, which on the CoreBonito64, conversely, can actually be enabled 
> with a jumper and used, but it's not usually either.

ok, thanks for the info.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
