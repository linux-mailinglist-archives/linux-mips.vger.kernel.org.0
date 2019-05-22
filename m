Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0974F25ED0
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 09:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfEVHua (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 03:50:30 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42672 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfEVHua (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 03:50:30 -0400
Received: by mail-vs1-f68.google.com with SMTP id z11so828157vsq.9;
        Wed, 22 May 2019 00:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VaX5n9Y4+kdsUYd/DwkTtH11TWtmPeaSdyXahzJcElc=;
        b=J6SZ4MFkN0QH+9oAJxgWMX+ZnSOj8Ger0hdktNpn6Ai/6FrBdK4gZbY7aVkvgXfV87
         PIruYTXy2F4CCYZ8md872K3TqMoS3ktRBzBLBuGYa9/vj4trKugnwehCBGoQ5joSPvFz
         GYHXoyxdES6s/sfCtFA4nlhCUVRD8b7JmU06V70xmZmmuXqH1dGGy5Afq/BYcl57Cqko
         DMzoyZzHQFaEBG9jJrI2hgy7hCvvB0aHn4N8j6KI7msx74yPLCNwMUM6LgzhP6l6H0AK
         fyYAmqurPjZcfcy06UFzzxtsaLLo1bYKsMSR3QCp5296E7/GeV42qa97NqNyosTjltdK
         jyew==
X-Gm-Message-State: APjAAAX1pc+PSMJ4Fz9xgTGxKgAFTRk2YgyDCqUhqRCq86+GMdPiAHJg
        vDdR40R8Yv38nsx5tbD0hjDad3AZI2YVGDcmSnQ=
X-Google-Smtp-Source: APXvYqwy2pF+UO7dRnr4UrAQWmD8wUcJ5l9PXgP1dlYl4TIbbRpCuuso+pne9cj3RT3KExnSOEslckAsdIBKx/R7v+w=
X-Received: by 2002:a67:f589:: with SMTP id i9mr11310444vso.152.1558511429417;
 Wed, 22 May 2019 00:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com> <CAMuHMdWPmL5Z86cgJ4N-U-3XKr4ys8Y7U85okDcXYEu7z4ybaw@mail.gmail.com>
 <20190521155309.GB24470@rapoport-lnx> <20190521163928.yo75uskjachtw2nt@mobilestation>
In-Reply-To: <20190521163928.yo75uskjachtw2nt@mobilestation>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 May 2019 09:50:17 +0200
Message-ID: <CAMuHMdUr297MbGqSO+N1NeYbqQsqfLBVFeFMA6epFGQA5V+X+w@mail.gmail.com>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Serge,

On Tue, May 21, 2019 at 6:39 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Tue, May 21, 2019 at 06:53:10PM +0300, Mike Rapoport wrote:
> > On Tue, May 21, 2019 at 04:56:39PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Apr 24, 2019 at 12:50 AM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > The reserved_end variable had been used by the bootmem_init() code
> > > > to find a lowest limit of memory available for memmap blob. The original
> > > > code just tried to find a free memory space higher than kernel was placed.
> > > > This limitation seems justified for the memmap ragion search process, but
> > > > I can't see any obvious reason to reserve the unused space below kernel
> > > > seeing some platforms place it much higher than standard 1MB. Moreover
> > > > the RELOCATION config enables it to be loaded at any memory address.
> > > > So lets reserve the memory occupied by the kernel only, leaving the region
> > > > below being free for allocations. After doing this we can now discard the
> > > > code freeing a space between kernel _text and VMLINUX_LOAD_ADDRESS symbols
> > > > since it's going to be free anyway (unless marked as reserved by
> > > > platforms).
> > > >
> > > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > >
> > > This is now commit b93ddc4f9156205e ("mips: Reserve memory for the kernel
> > > image resources") in v5.2-rc1, which causes rbtx4927 to crash during boot:
> > >
> > >     VFS: Mounted root (nfs filesystem) on device 0:13.
> > >     devtmpfs: mounted
> > >     BUG: Bad page state in process swapper  pfn:00001
> > >     page:804b7820 refcount:0 mapcount:-128 mapping:00000000 index:0x1
> > >     flags: 0x0()
> > >     raw: 00000000 00000100 00000200 00000000 00000001 00000000 ffffff7f 00000000
> > >     page dumped because: nonzero mapcount
> > >     Modules linked in:
> > >     CPU: 0 PID: 1 Comm: swapper Not tainted
> > > 5.2.0-rc1-rbtx4927-00468-g3c05ea3d4077b756-dirty #137
> > >     Stack : 00000000 10008400 8040dd2c 87c1b974 8044af63 8040dd2c
> > > 00000001 804a3490
> > >             00000001 81000000 0030f231 80148558 00000003 10008400
> > > 87c1dd80 7599ee13
> > >             00000000 00000000 804b0000 00000000 00000007 00000000
> > > 00000085 00000000
> > >             62722d31 00000084 804b0000 39347874 00000000 804b7820
> > > 8040cef8 81000010
> > >             00000001 00000007 00000001 81000000 00000008 8021de24
> > > 00000000 804a0000
> > >             ...
> > >     Call Trace:
> > >     [<8010adec>] show_stack+0x74/0x104
> > >     [<801a5e44>] bad_page+0x130/0x138
> > >     [<801a654c>] free_pcppages_bulk+0x17c/0x3b0
> > >     [<801a789c>] free_unref_page+0x40/0x68
> > >     [<801120f4>] free_init_pages+0xec/0x104
> > >     [<803bdde8>] free_initmem+0x10/0x58
> > >     [<803bdb8c>] kernel_init+0x20/0x100
> > >     [<801057c8>] ret_from_kernel_thread+0x14/0x1c
> > >     Disabling lock debugging due to kernel taint
> > >     BUG: Bad page state in process swapper  pfn:00002
> > >     [...]
> > >
>
> The root cause of the problem most likely is in prom_free_prom_memory() method of
> arch/mips/txx9/generic/setup.c:
> void __init prom_free_prom_memory(void)
> {
>         unsigned long saddr = PAGE_SIZE;
>         unsigned long eaddr = __pa_symbol(&_text);
>
>         if (saddr < eaddr)
>                 free_init_pages("prom memory", saddr, eaddr);
> }
>
> As you can see the txx9 platform tries to free a memory which isn't reserved
> and set free from the very beginning due to the patch above. So as soon as you
> remove the free_init_pages("prom memory", ...) the problem shall be fixed.
> Could you try it and send a result to us whether it helped?

Thanks, that does the trick!
Will send a patch shortly...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
