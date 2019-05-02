Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E858411B56
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 16:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfEBOYo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 10:24:44 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39927 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEBOYn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 10:24:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id q10so2363321ljc.6;
        Thu, 02 May 2019 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RxZ5w9mWQKJNicrHyEV1DSUmteddrLY464RPQLI5MEw=;
        b=hCeMdYfq8rOLM1fPJDEANp7JijVwFFF7eK76vdoE0+hzxMbf6UE8fU2RRfmfy6FzZD
         TdfGBos5hC1U2RoJgGavfJ3Hqzit/Zt186ZDcbqowdE/2EqgSV6Hcy3QxxDUAXPajR26
         zR1wb6ldMFeSb3fx4LufOumYRlh1C/aB/Oo7tauTLshk75feE1Ejc7auv77R6reoPQTZ
         jPBDjYlE5/kGYQyWuuoE0+RMBiP5UA4UVdXrAL1t7vTAHbhandPY9h/zraOueXpR+efX
         2HYtG4Blvlg+ercZCnOhZw4zA06iMw2OF+1lTZ6O1SnZJYQzkCzH9P7cnL2ZWUQY1+vH
         wVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RxZ5w9mWQKJNicrHyEV1DSUmteddrLY464RPQLI5MEw=;
        b=YLo/8PJXjDd72splfPZZaKHNNWNm5sf9FEqbqRoAn+8MEao1XeN9oWk2RrkFTMENt5
         O6Rs+/IRO2TwMR7ghftNWeMF19LegG794uaCxiypJxqsZIXWfMRY9b3mTIRZDlKaIcOO
         yFqJJSyN48nut6EVWOcEOqYbMT35tz3zt4RoAXKxx7/LBT4DKTtNsqtNrvh8ErODaVbn
         2/Hh+nzGAZqdcU4v6PUZ03SkWFbNI/Tbq9TKQMDNKNE/iqEDbqV3OSnceNIgLE0FSJu6
         TBilOvMJnQ/BdAr+CgrOizw+iZmJ9qcJ8Q5CgBVvdnPitUwCf6IQkhAgKwS5SxaoY17Z
         miCA==
X-Gm-Message-State: APjAAAVyDNi3igMEEd8g3G/7G9vyjLVZflzDKwbGXXfnS05rd6rdM/KA
        9zsCt/lFLGvRj0Kck80ol7g=
X-Google-Smtp-Source: APXvYqwqxkWHiw/74PjhWAN0MCl9FCHovc+9nVoWV2viac5S/CXNYVd9ONZL+YfQO2W8eXXVal11WA==
X-Received: by 2002:a2e:4ca:: with SMTP id a71mr1886791ljf.39.1556807080821;
        Thu, 02 May 2019 07:24:40 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id o17sm1985785ljj.39.2019.05.02.07.24.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 02 May 2019 07:24:40 -0700 (PDT)
Date:   Thu, 2 May 2019 17:24:37 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
Message-ID: <20190502142434.mpoyu4hhbunur5xe@mobilestation>
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com>
 <20190424224343.4skr727fszycwksq@pburton-laptop>
 <20190426000035.yfonfvrapmm4j3fg@mobilestation>
 <20190430225832.cjk7mj6dotw3cib6@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430225832.cjk7mj6dotw3cib6@pburton-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 30, 2019 at 10:58:33PM +0000, Paul Burton wrote:

Hello Paul

> Hi Serge,
> 
> On Fri, Apr 26, 2019 at 03:00:36AM +0300, Serge Semin wrote:
> > >  1) Older systems generally had something like an ISA bus which used
> > >     addresses below the kernel, and bootloaders like YAMON left behind
> > >     functions that could be called right at the start of RAM. This sort
> > >     of thing should be accounted for by /memreserve/ in DT or similar
> > >     platform-specific reservations though rather than generically, and
> > >     at least Malta & SEAD-3 DTs already have /memreserve/ entries for
> > >     it. So this part I think is OK. Some other older platforms might
> > >     need updating, but that's fine.
> > > 
> > 
> > Regarding ISA. As far as I remember devices on that bus can DMA only to the
> > lowest 16MB. So in case if kernel is too big or placed pretty much high,
> > they may be left even without reachable memory at all in current
> > implementation.
> 
> Sure - I'm not too worried about these old buses, platforms can continue
> to reserve the memory through DT or otherwise if they need to.
> 
> > >  2) trap_init() only allocates memory for the exception vector if using
> > >     a vectored interrupt mode. In other cases it just uses CAC_BASE
> > >     which currently gets reserved as part of this region between
> > >     PHYS_OFFSET & _text.
> > > 
> > >     I think this behavior is bogus, and we should instead:
> > > 
> > >     - Allocate the exception vector memory using memblock_alloc() for
> > >       CPUs implementing MIPSr2 or higher (ie. CPUs with a programmable
> > >       EBase register). If we're not using vectored interrupts then
> > >       allocating one page will do, and we already have the size
> > >       calculation for if we are.
> > > 
> > >     - Otherwise use CAC_BASE but call memblock_reserve() on the first
> > >       page.
> > > 
> > >     I think we should make that change before this one goes in. I can
> > >     try to get to it tomorrow, but feel free to beat me to it.
> > > 
> > 
> > As far as I understood you and the code this should be enough to fix
> > the problem:
> > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > index 98ca55d62201..f680253e2617 100644
> > --- a/arch/mips/kernel/traps.c
> > +++ b/arch/mips/kernel/traps.c
> > @@ -2326,6 +2326,8 @@ void __init trap_init(void)
> >  				ebase += (read_c0_ebase() & 0x3ffff000);
> >  			}
> >  		}
> > +
> > +		memblock_reserve(ebase, PAGE_SIZE);
> >  	}
> >  
> >  	if (cpu_has_mmips) {
> > ---
> > 
> > Allocation has already been implemented in the if-branch under the
> > (cpu_has_veic || cpu_has_vint) condition. So we don't need to change
> > there anything.
> > In case if vectored interrupts aren't supported the else-clause is
> > taken and we need to reserve whatever is set in the exception base
> > address variable.
> > 
> > I'll add this patch between 3d and 4th ones if you are ok with it.
> 
> I think that would work, but I have other motivations to allocate the
> memory in non-vectored cases anyway. I just sent a series that does that
> & cleans up a little [1]. If you could take a look that would be great.
> With that change made I think this patch will be good to apply.
> 

Just reviewed and tested your series on my machine. I tagged the whole series
in a response to the cover-letter of [1].

Could you please proceed with this patchset review procedure? There are
also eight more patches left without your tag or comment.  This patch
is also left with no explicit tag.

BTW I see you already applied patches 1-3 to the mips-next, so what shall I
do when sending a v2 patchset with fixes asked to be provided for patch 12
and possibly for others in future? Shall I just resend the series without that
applied patches or send them over with your acked-by tagges?

-Sergey

> Thanks,
>     Paul
> 
> [1] https://lore.kernel.org/linux-mips/20190430225216.7164-1-paul.burton@mips.com/T/#t
