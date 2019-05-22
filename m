Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A887325F2E
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 10:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfEVIPB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 04:15:01 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:40635 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfEVIPA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 04:15:00 -0400
Received: by mail-vs1-f68.google.com with SMTP id c24so872503vsp.7;
        Wed, 22 May 2019 01:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1df3Eq8yn4hsuyurUkvamlYR20/HasH0eCx5uiP9kTI=;
        b=oyOjzqIYdQLt52FRDYuQLlEZq53JZM62YAyw4cjffM523t3acAAnkS/ulcA4DhgcME
         fI6B92EVvR5df6kA5wJQ4RXKaDZgZdJ65bT5N7ZuVEk5I06DoXjmaHdFNy/xi835kIlA
         t5xIHuhiG38F54LfhhwUmUnp2JRgFnzPh7n7Iib56aahFrqKzx4CyD9zINXmtkhw2PhX
         jIPnV++ou09zl47FZ6nofVx6MQ15PTAIqySN96ebWlTZ35IJMduWVUm/94U+z4Ns3bpR
         Gld/8yWqogzrw6rs28+/G+mHiUROg5cGWWneb3Ot7suowy6efGhHe2MtZCDU0HS4u2eu
         P+CQ==
X-Gm-Message-State: APjAAAUllIRxJzsI5wUQQYdldQjzOE5/4HTUK95oZzI0NzEBOWSTYEiG
        CDMk7WwWYL4+DT8PE2sT8e5qUCvXlTmGlrO5l68=
X-Google-Smtp-Source: APXvYqz0Exhwgjdce8PBJ1d38pT+WJnO+csw1vTnd/2YPJFctNalEdroqBrljZdpKcTcL2cOxFCBJ9lLVE+xAKBNFQs=
X-Received: by 2002:a67:7c93:: with SMTP id x141mr33731609vsc.96.1558512899454;
 Wed, 22 May 2019 01:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com> <CAMuHMdWPmL5Z86cgJ4N-U-3XKr4ys8Y7U85okDcXYEu7z4ybaw@mail.gmail.com>
 <20190521155309.GB24470@rapoport-lnx> <CAMuHMdWK6-ge-j1NbunDu_Jy7JOwbMfTzNQ767MViuTo4DNf+A@mail.gmail.com>
 <20190522080802.GA31930@rapoport-lnx>
In-Reply-To: <20190522080802.GA31930@rapoport-lnx>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 May 2019 10:14:47 +0200
Message-ID: <CAMuHMdWS9vMUuWAbgZ9tpNcStXOvP2eRkA7WtPOERA3keLq9Eg@mail.gmail.com>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
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
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mike,

On Wed, May 22, 2019 at 10:08 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> On Wed, May 22, 2019 at 09:47:04AM +0200, Geert Uytterhoeven wrote:
> > On Tue, May 21, 2019 at 5:53 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > On Tue, May 21, 2019 at 04:56:39PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Apr 24, 2019 at 12:50 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > > The reserved_end variable had been used by the bootmem_init() code
> > > > > to find a lowest limit of memory available for memmap blob. The original
> > > > > code just tried to find a free memory space higher than kernel was placed.
> > > > > This limitation seems justified for the memmap ragion search process, but
> > > > > I can't see any obvious reason to reserve the unused space below kernel
> > > > > seeing some platforms place it much higher than standard 1MB. Moreover
> > > > > the RELOCATION config enables it to be loaded at any memory address.
> > > > > So lets reserve the memory occupied by the kernel only, leaving the region
> > > > > below being free for allocations. After doing this we can now discard the
> > > > > code freeing a space between kernel _text and VMLINUX_LOAD_ADDRESS symbols
> > > > > since it's going to be free anyway (unless marked as reserved by
> > > > > platforms).
> > > > >
> > > > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > > >
> > > > This is now commit b93ddc4f9156205e ("mips: Reserve memory for the kernel
> > > > image resources") in v5.2-rc1, which causes rbtx4927 to crash during boot:
> > > >
> > > >     VFS: Mounted root (nfs filesystem) on device 0:13.
> > > >     devtmpfs: mounted
> > > >     BUG: Bad page state in process swapper  pfn:00001
> > > >     page:804b7820 refcount:0 mapcount:-128 mapping:00000000 index:0x1
> > > >     flags: 0x0()
> > > >     raw: 00000000 00000100 00000200 00000000 00000001 00000000 ffffff7f 00000000
> > > >     page dumped because: nonzero mapcount
> > > >     Modules linked in:
> > > >     CPU: 0 PID: 1 Comm: swapper Not tainted
> > > > 5.2.0-rc1-rbtx4927-00468-g3c05ea3d4077b756-dirty #137
> > > >     Stack : 00000000 10008400 8040dd2c 87c1b974 8044af63 8040dd2c
> > > > 00000001 804a3490
> > > >             00000001 81000000 0030f231 80148558 00000003 10008400
> > > > 87c1dd80 7599ee13
> > > >             00000000 00000000 804b0000 00000000 00000007 00000000
> > > > 00000085 00000000
> > > >             62722d31 00000084 804b0000 39347874 00000000 804b7820
> > > > 8040cef8 81000010
> > > >             00000001 00000007 00000001 81000000 00000008 8021de24
> > > > 00000000 804a0000
> > > >             ...
> > > >     Call Trace:
> > > >     [<8010adec>] show_stack+0x74/0x104
> > > >     [<801a5e44>] bad_page+0x130/0x138
> > > >     [<801a654c>] free_pcppages_bulk+0x17c/0x3b0
> > > >     [<801a789c>] free_unref_page+0x40/0x68
> > > >     [<801120f4>] free_init_pages+0xec/0x104
> > > >     [<803bdde8>] free_initmem+0x10/0x58
> > > >     [<803bdb8c>] kernel_init+0x20/0x100
> > > >     [<801057c8>] ret_from_kernel_thread+0x14/0x1c
> > > >     Disabling lock debugging due to kernel taint
> > > >     BUG: Bad page state in process swapper  pfn:00002
> > > >     [...]
> > > >
> > > > CONFIG_RELOCATABLE is not set, so the only relevant part is the
> > > > change quoted below.
> > > >
> > > > > --- a/arch/mips/kernel/setup.c
> > > > > +++ b/arch/mips/kernel/setup.c
> > > > > @@ -371,7 +371,6 @@ static void __init bootmem_init(void)
> > > > >
> > > > >  static void __init bootmem_init(void)
> > > > >  {
> > > > > -       unsigned long reserved_end;
> > > > >         phys_addr_t ramstart = PHYS_ADDR_MAX;
> > > > >         int i;
> > > > >
> > > > > @@ -382,10 +381,10 @@ static void __init bootmem_init(void)
> > > > >          * will reserve the area used for the initrd.
> > > > >          */
> > > > >         init_initrd();
> > > > > -       reserved_end = (unsigned long) PFN_UP(__pa_symbol(&_end));
> > > > >
> > > > > -       memblock_reserve(PHYS_OFFSET,
> > > > > -                        (reserved_end << PAGE_SHIFT) - PHYS_OFFSET);
> > > > > +       /* Reserve memory occupied by kernel. */
> > > > > +       memblock_reserve(__pa_symbol(&_text),
> > > > > +                       __pa_symbol(&_end) - __pa_symbol(&_text));
> > > > >
> > > > >         /*
> > > > >          * max_low_pfn is not a number of pages. The number of pages

> > > > Hence the old code reserved 1 MiB extra at the beginning.
> > > >
> > > > Note that the new code also dropped the rounding up of the memory block
> > > > size to a multiple of PAGE_SIZE. I'm not sure the latter actually
> > > > matters or not.
> > >
> > > I'd say that bad page state for pfn 1 is caused by "freeing" the first 1M.
> >
> > Yes, by prom_free_prom_memory(), as pointed out by Serge.
>
> I wonder how other MIPS variants would react to the fact that the memory
> below the kernel is not reserved ;-)

Exactly...

Looks like at least arch/mips/dec/prom/memory.c needs a similar but\
more complicated fix, due to declance handling...


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
