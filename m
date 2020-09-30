Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C79027F41C
	for <lists+linux-mips@lfdr.de>; Wed, 30 Sep 2020 23:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730304AbgI3VVs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 17:21:48 -0400
Received: from elvis.franken.de ([193.175.24.41]:36854 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730338AbgI3VVo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Sep 2020 17:21:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kNjXi-0000Pw-00; Wed, 30 Sep 2020 23:21:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BD8EDC103F; Wed, 30 Sep 2020 23:21:31 +0200 (CEST)
Date:   Wed, 30 Sep 2020 23:21:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu
Subject: Re: [PATCH] MIPS: remove the obsolete RM7000 extended interrupts
 handler
Message-ID: <20200930212131.GA14275@alpha.franken.de>
References: <20200912142306.3604968-1-fazilyildiran@gmail.com>
 <20200918135053.GB19202@alpha.franken.de>
 <alpine.LFD.2.21.2009301529080.333514@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2009301529080.333514@eddie.linux-mips.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 30, 2020 at 03:34:25PM +0100, Maciej W. Rozycki wrote:
> On Fri, 18 Sep 2020, Thomas Bogendoerfer wrote:
> 
> > > IRQ_CPU_RM7K has been a non-visible config selected nowhere since
> > > PMC-Sierra Yosemite support has been removed with commit bdf20507da11
> > > ("MIPS: PMC-Sierra Yosemite: Remove support."). By the same token, the
> > > handler for RM7000 extended interrupts has been obsolete.
> > > 
> > > Remove the obsolete code.
> > 
> > not yet;-) I have an RM7000 based system in my basement... I'm also
> > not sure, if R7k O2s need that.
> 
>  One of the more exotic Malta daughtercards used that too I believe.  I'd 
> have to check the docs.  Of course getting hands on such a daughtercard is 
> another matter, but we continue having RM7000 enabled for the Malta.

I've checked interrupts on P6064 and doesn't use the "extented" interrupts.
And since O2 uses the same CPU connector for all CPU boards I doubt it
it either. What about Malta ? 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
