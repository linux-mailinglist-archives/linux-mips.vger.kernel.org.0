Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D5F255CA
	for <lists+linux-mips@lfdr.de>; Tue, 21 May 2019 18:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbfEUQjj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 May 2019 12:39:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43100 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfEUQji (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 May 2019 12:39:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id r4so19358886wro.10;
        Tue, 21 May 2019 09:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZevjsTq/5oCWSC9Ugeppy6ZBh126nny81ksWozxVUrk=;
        b=tvm1JOL0YFWgJB2+atKjWCcbVwD4q5BDf1EVnyAQpEkMWlsQG4wtnp9tBwH7P2pfkV
         pnEPwkecXt/Q0zov15HYfF8O++JY9wNFfHixPe0cg3YD30/WZD47SCfzr20PiSlJL3Qz
         M0lPkOFuUa1JajSby9MlWGpRQqNgfI+gSCQnGyeO4PuJAkHjwcsULhw5qM2ZvUGcBfmo
         2pXiHxZlTU7HvT2Ky3SDWlzGbEFy8CvY3fAJESkOshc2TcEMxxHktpX8ET0v6Ic5+kxz
         uqgredhrpIsMI6grhTL78lcyqcJkDr46KynQ32GPij15/sfqrmT5so3yW3f8iG83y8ZG
         cNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZevjsTq/5oCWSC9Ugeppy6ZBh126nny81ksWozxVUrk=;
        b=GosShyVFW40h8Ky/7VGTIOOMgNBW8AU5dbESTL2vlMjWiG4O4iUdBDo3QKmAHVQ4R3
         3gZJ/nSRTw0vh+mAOjq9KYQ4D/6pFAbmR9fJyuvyre3o5dsHE2pHgIpbEwKuGQla74n+
         +fn57RcI23su+ItnRAY0ktbK97T3ztgdImEsZI30Rux8O69T2iNsk8I65fmEifiDolKy
         YX8Rgjp8A1Jmk+tBQFQtE1jDIWAwE0WHSR1YRVZk1Uac8qoyRZ1ELAQhNVkmt/srPItF
         6gLBp6bMXrFx2+xhhOLfxd7PxMPs+da4yRrXL2peN6hK84Dc9dsPgGJA3taWwIBGyxa5
         Maww==
X-Gm-Message-State: APjAAAVi1BbWxn1y1VbH5UBZYgUpMqmrOCXf9TWOVpJFyJmpoSU8t7wO
        R+IzdYpAKUo6jekD5/9/Ukw=
X-Google-Smtp-Source: APXvYqxanh5/uLLUoGMESOyA6hkugmy/Dymko0raF1QOHBgVfGXVF57kkpmdXuP5+JCpm+i8cxjOPQ==
X-Received: by 2002:adf:94a5:: with SMTP id 34mr52115482wrr.275.1558456776368;
        Tue, 21 May 2019 09:39:36 -0700 (PDT)
Received: from mobilestation ([31.13.144.82])
        by smtp.gmail.com with ESMTPSA id w13sm3560134wmk.0.2019.05.21.09.39.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 21 May 2019 09:39:35 -0700 (PDT)
Date:   Tue, 21 May 2019 19:39:30 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Matt Redfearn <matt.redfearn@mips.com>,
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
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
Message-ID: <20190521163928.yo75uskjachtw2nt@mobilestation>
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com>
 <CAMuHMdWPmL5Z86cgJ4N-U-3XKr4ys8Y7U85okDcXYEu7z4ybaw@mail.gmail.com>
 <20190521155309.GB24470@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521155309.GB24470@rapoport-lnx>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Geert, Mike

On Tue, May 21, 2019 at 06:53:10PM +0300, Mike Rapoport wrote:
> Hi Geert,
> 
> On Tue, May 21, 2019 at 04:56:39PM +0200, Geert Uytterhoeven wrote:
> > Hi Serge,
> > 
> > On Wed, Apr 24, 2019 at 12:50 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > The reserved_end variable had been used by the bootmem_init() code
> > > to find a lowest limit of memory available for memmap blob. The original
> > > code just tried to find a free memory space higher than kernel was placed.
> > > This limitation seems justified for the memmap ragion search process, but
> > > I can't see any obvious reason to reserve the unused space below kernel
> > > seeing some platforms place it much higher than standard 1MB. Moreover
> > > the RELOCATION config enables it to be loaded at any memory address.
> > > So lets reserve the memory occupied by the kernel only, leaving the region
> > > below being free for allocations. After doing this we can now discard the
> > > code freeing a space between kernel _text and VMLINUX_LOAD_ADDRESS symbols
> > > since it's going to be free anyway (unless marked as reserved by
> > > platforms).
> > >
> > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > 
> > This is now commit b93ddc4f9156205e ("mips: Reserve memory for the kernel
> > image resources") in v5.2-rc1, which causes rbtx4927 to crash during boot:
> > 
> >     VFS: Mounted root (nfs filesystem) on device 0:13.
> >     devtmpfs: mounted
> >     BUG: Bad page state in process swapper  pfn:00001
> >     page:804b7820 refcount:0 mapcount:-128 mapping:00000000 index:0x1
> >     flags: 0x0()
> >     raw: 00000000 00000100 00000200 00000000 00000001 00000000 ffffff7f 00000000
> >     page dumped because: nonzero mapcount
> >     Modules linked in:
> >     CPU: 0 PID: 1 Comm: swapper Not tainted
> > 5.2.0-rc1-rbtx4927-00468-g3c05ea3d4077b756-dirty #137
> >     Stack : 00000000 10008400 8040dd2c 87c1b974 8044af63 8040dd2c
> > 00000001 804a3490
> >             00000001 81000000 0030f231 80148558 00000003 10008400
> > 87c1dd80 7599ee13
> >             00000000 00000000 804b0000 00000000 00000007 00000000
> > 00000085 00000000
> >             62722d31 00000084 804b0000 39347874 00000000 804b7820
> > 8040cef8 81000010
> >             00000001 00000007 00000001 81000000 00000008 8021de24
> > 00000000 804a0000
> >             ...
> >     Call Trace:
> >     [<8010adec>] show_stack+0x74/0x104
> >     [<801a5e44>] bad_page+0x130/0x138
> >     [<801a654c>] free_pcppages_bulk+0x17c/0x3b0
> >     [<801a789c>] free_unref_page+0x40/0x68
> >     [<801120f4>] free_init_pages+0xec/0x104
> >     [<803bdde8>] free_initmem+0x10/0x58
> >     [<803bdb8c>] kernel_init+0x20/0x100
> >     [<801057c8>] ret_from_kernel_thread+0x14/0x1c
> >     Disabling lock debugging due to kernel taint
> >     BUG: Bad page state in process swapper  pfn:00002
> >     [...]
> > 

The root cause of the problem most likely is in prom_free_prom_memory() method of
arch/mips/txx9/generic/setup.c:
void __init prom_free_prom_memory(void)
{
        unsigned long saddr = PAGE_SIZE;
        unsigned long eaddr = __pa_symbol(&_text);
        
        if (saddr < eaddr)
                free_init_pages("prom memory", saddr, eaddr);
}

As you can see the txx9 platform tries to free a memory which isn't reserved
and set free from the very beginning due to the patch above. So as soon as you
remove the free_init_pages("prom memory", ...) the problem shall be fixed.
Could you try it and send a result to us whether it helped?

Regards,
-Sergey

> > CONFIG_RELOCATABLE is not set, so the only relevant part is the
> > change quoted below.
> > 
> > > --- a/arch/mips/kernel/setup.c
> > > +++ b/arch/mips/kernel/setup.c
> > > @@ -371,7 +371,6 @@ static void __init bootmem_init(void)
> > >
> > >  static void __init bootmem_init(void)
> > >  {
> > > -       unsigned long reserved_end;
> > >         phys_addr_t ramstart = PHYS_ADDR_MAX;
> > >         int i;
> > >
> > > @@ -382,10 +381,10 @@ static void __init bootmem_init(void)
> > >          * will reserve the area used for the initrd.
> > >          */
> > >         init_initrd();
> > > -       reserved_end = (unsigned long) PFN_UP(__pa_symbol(&_end));
> > >
> > > -       memblock_reserve(PHYS_OFFSET,
> > > -                        (reserved_end << PAGE_SHIFT) - PHYS_OFFSET);
> > > +       /* Reserve memory occupied by kernel. */
> > > +       memblock_reserve(__pa_symbol(&_text),
> > > +                       __pa_symbol(&_end) - __pa_symbol(&_text));
> > >
> > >         /*
> > >          * max_low_pfn is not a number of pages. The number of pages
> > 
> > With some debug code added:
> > 
> >     Determined physical RAM map:
> >      memory: 08000000 @ 00000000 (usable)
> >     bootmem_init:390: PHYS_OFFSET = 0x0
> >     bootmem_init:391: __pa_symbol(&_text) = 0x100000
> >     bootmem_init:392: __pa_symbol(&_end) = 0x4b77c8
> >     bootmem_init:393: PFN_UP(__pa_symbol(&_end)) = 0x4b8
> 
> Have you tried adding memblock=debug to the command line?
> Not sure it'll help, but still :)
>  
> > Hence the old code reserved 1 MiB extra at the beginning.
> > 
> > Note that the new code also dropped the rounding up of the memory block
> > size to a multiple of PAGE_SIZE. I'm not sure the latter actually
> > matters or not.
> 
> I'd say that bad page state for pfn 1 is caused by "freeing" the first 1M.
> 
> > Do you have a clue? Thanks!
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> > -- 
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 
