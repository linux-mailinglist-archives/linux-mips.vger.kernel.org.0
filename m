Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8432027F5B7
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 01:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730918AbgI3XK7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 19:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730528AbgI3XK7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 19:10:59 -0400
X-Greylist: delayed 30990 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 30 Sep 2020 16:10:59 PDT
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6EA48C061755;
        Wed, 30 Sep 2020 16:10:59 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 728F02BE086;
        Thu,  1 Oct 2020 00:10:58 +0100 (BST)
Date:   Thu, 1 Oct 2020 00:10:57 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@pgazz.com, jeho@cs.utexas.edu
Subject: Re: [PATCH] MIPS: remove the obsolete RM7000 extended interrupts
 handler
In-Reply-To: <20200930212131.GA14275@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2009302342030.333514@eddie.linux-mips.org>
References: <20200912142306.3604968-1-fazilyildiran@gmail.com> <20200918135053.GB19202@alpha.franken.de> <alpine.LFD.2.21.2009301529080.333514@eddie.linux-mips.org> <20200930212131.GA14275@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 30 Sep 2020, Thomas Bogendoerfer wrote:

> > > not yet;-) I have an RM7000 based system in my basement... I'm also
> > > not sure, if R7k O2s need that.
> > 
> >  One of the more exotic Malta daughtercards used that too I believe.  I'd 
> > have to check the docs.  Of course getting hands on such a daughtercard is 
> > another matter, but we continue having RM7000 enabled for the Malta.
> 
> I've checked interrupts on P6064 and doesn't use the "extented" interrupts.
> And since O2 uses the same CPU connector for all CPU boards I doubt it
> it either.

 Mind that interrupts can be asserted in the RM7k via an external write 
request too, and I'm fairly sure SGI hardware would use that rather than 
interrupt inputs given that R4000/R4400 SC/MC CPUs only have Int*(0) wired 
and all the remaining interrupts are only available via a processor write.  
Have you checked that?

> What about Malta ? 

 So this is the CoreBonito64 daughtercard, which can have either an RM5261 
or an RM7061 processor installed.  The Int*(9:6) inputs are not mentioned, 
which I take it means unconnected, and ExtRqst* has a pull-up and is 
otherwise wired to a debug connector only.  Which makes me conclude this 
feature cannot be used in a standard application with this card.

 NB there is another interrupt controller embedded in the Bonito64 system 
controller, which on the CoreBonito64, conversely, can actually be enabled 
with a jumper and used, but it's not usually either.

  Maciej
