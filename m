Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C754228DDFA
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 11:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbgJNJtN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 05:49:13 -0400
Received: from [157.25.102.26] ([157.25.102.26]:36782 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726491AbgJNJtN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Oct 2020 05:49:13 -0400
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 8FE2A2BE086;
        Wed, 14 Oct 2020 10:49:08 +0100 (BST)
Date:   Wed, 14 Oct 2020 10:49:05 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Serge Semin <fancer.lancer@gmail.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image
 resources
In-Reply-To: <20190522135422.q6w7lcvh5fgpf7a5@mobilestation>
Message-ID: <alpine.LFD.2.21.2010140244560.866917@eddie.linux-mips.org>
References: <20190423224748.3765-1-fancer.lancer@gmail.com> <20190423224748.3765-5-fancer.lancer@gmail.com> <CAMuHMdWPmL5Z86cgJ4N-U-3XKr4ys8Y7U85okDcXYEu7z4ybaw@mail.gmail.com> <20190521155309.GB24470@rapoport-lnx> <CAMuHMdWK6-ge-j1NbunDu_Jy7JOwbMfTzNQ767MViuTo4DNf+A@mail.gmail.com>
 <20190522080802.GA31930@rapoport-lnx> <CAMuHMdWS9vMUuWAbgZ9tpNcStXOvP2eRkA7WtPOERA3keLq9Eg@mail.gmail.com> <20190522133402.duhybxf66oubx6ng@mobilestation> <CAMuHMdUR90cabKys=ZAJxyH3okiof-7gu3k8TUer55LA_Nse5A@mail.gmail.com>
 <20190522135422.q6w7lcvh5fgpf7a5@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 22 May 2019, Serge Semin wrote:

> > > The problem might be fixed there by the next patch:
> > > ---
> > > diff --git a/arch/mips/dec/prom/memory.c b/arch/mips/dec/prom/memory.c
> > > index 5073d2ed78bb..5a0c734b5d04 100644
> > > --- a/arch/mips/dec/prom/memory.c
> > > +++ b/arch/mips/dec/prom/memory.c
> > > @@ -91,29 +91,14 @@ void __init prom_meminit(u32 magic)
> > >                 pmax_setup_memory_region();
> > >         else
> > >                 rex_setup_memory_region();
> > > -}
> > > -
> > > -void __init prom_free_prom_memory(void)
> > > -{
> > > -       unsigned long end;
> > > -
> > > -       /*
> > > -        * Free everything below the kernel itself but leave
> > > -        * the first page reserved for the exception handlers.
> > > -        */
> > >
> > >  #if IS_ENABLED(CONFIG_DECLANCE)
> > >         /*
> > > -        * Leave 128 KB reserved for Lance memory for
> > > -        * IOASIC DECstations.
> > > +        * Reserve 128 KB for Lance memory for IOASIC DECstations.
> > >          *
> > >          * XXX: save this address for use in dec_lance.c?
> > >          */
> > >         if (IOASIC)
> > > -               end = __pa(&_text) - 0x00020000;
> > > -       else
> > > +               memblock_reserve(__pa_symbol(&_text), 0x00020000);
> > 
> > Shouldn't that be
> > 
> >     memblock_reserve(__pa_symbol(&_text) - 0x00020000, 0x00020000);
> > 
> > ?
> > 
> 
> Right. Thanks. The updated version of the patch is attached to this email.
> 
> -Sergey
> 
> > >  #endif
> > > -               end = __pa(&_text);
> > > -
> > > -       free_init_pages("unused PROM memory", PAGE_SIZE, end);
> > >  }
> > > ---
> > >
> > > Didn't wanna use prom_FREE_prom_memory to actually reserve a memory
> > > chunk, so I moved the reservation into the prom_meminit() method.
> > 
> > I guess Maciej will test this on real hardware, eventually...

 I finally got to it as I was hit by it the hard way (and I do have kept 
the thread in my inbox!), however this is the wrong fix.

 With DEC hardware the whole 128KiB region is reserved as firmware working 
memory area and we call into the firmware throughout bootstrap on several 
occasions.  Therefore we have to stay away from it until we know we won't 
need any firmware services any longer, which is at this point.  So this 
piece has to stay, and the removed reservation has to be reinstated in 
platform code.  I'll be posting a fix separately.

 NB I suspect CFE platforms may need a similar fix, but I don't have 
access to my SWARM now, so I'll verify it on another occasion.

 Other platforms may need it too; at least up to a point an assumption was 
the kernel load address is just at the end of any firmware working area 
typically allocated right beyond the exception vector area, hence the 
reservation.  I realise the assumption may have changed at one point and 
the oldtimers who have known it may have been away or not paying enough 
attention while the newcomers did not realise that.

  Maciej
