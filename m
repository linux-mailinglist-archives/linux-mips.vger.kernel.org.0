Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 265975700CC
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jul 2022 13:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiGKLjc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jul 2022 07:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiGKLjN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jul 2022 07:39:13 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 49A727172C;
        Mon, 11 Jul 2022 04:28:00 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1oAra3-0000Hm-00; Mon, 11 Jul 2022 13:27:59 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 71F92C0353; Mon, 11 Jul 2022 13:27:40 +0200 (CEST)
Date:   Mon, 11 Jul 2022 13:27:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, gerg@kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Fixed __debug_virt_addr_valid()
Message-ID: <20220711112740.GA12918@alpha.franken.de>
References: <20220707215237.1730283-1-f.fainelli@gmail.com>
 <20220711083848.GE6084@alpha.franken.de>
 <20220711104052.ddefbgd34xbbjykg@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711104052.ddefbgd34xbbjykg@mobilestation>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 11, 2022 at 01:40:52PM +0300, Serge Semin wrote:
> On Mon, Jul 11, 2022 at 10:38:48AM +0200, Thomas Bogendoerfer wrote:
> > On Thu, Jul 07, 2022 at 02:52:36PM -0700, Florian Fainelli wrote:
> > > It is permissible for kernel code to call virt_to_phys() against virtual
> > > addresses that are in KSEG0 or KSEG1 and we need to be dealing with both
> > > types. Add a final condition that ensures that the virtual address is
> > > below KSEG2.
> > > 
> > > Fixes: dfad83cb7193 ("MIPS: Add support for CONFIG_DEBUG_VIRTUAL")
> > > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> > > ---
> > >  arch/mips/mm/physaddr.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/mips/mm/physaddr.c b/arch/mips/mm/physaddr.c
> > > index a1ced5e44951..a82f8f57a652 100644
> > > --- a/arch/mips/mm/physaddr.c
> > > +++ b/arch/mips/mm/physaddr.c
> > > @@ -5,6 +5,7 @@
> > >  #include <linux/mmdebug.h>
> > >  #include <linux/mm.h>
> > >  
> > > +#include <asm/addrspace.h>
> > >  #include <asm/sections.h>
> > >  #include <asm/io.h>
> > >  #include <asm/page.h>
> > > @@ -30,7 +31,7 @@ static inline bool __debug_virt_addr_valid(unsigned long x)
> > >  	if (x == MAX_DMA_ADDRESS)
> > >  		return true;
> > >  
> > > -	return false;
> > > +	return KSEGX(x) < KSEG2;
> > >  }
> > >  
> > >  phys_addr_t __virt_to_phys(volatile const void *x)
> > > -- 
> > > 2.25.1
> > 
> 
> > applied to mips-next.
> 
> Are you sure it was ready to be applied?
> Link: https://lore.kernel.org/linux-mips/20220708115851.ejsooiilxcopkoei@mobilestation/

your comment sounded like optimizing, which can be done later on, so
I assumed it ready.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
