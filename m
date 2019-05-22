Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 623DA25ECA
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 09:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfEVHrS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 03:47:18 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37916 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfEVHrR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 May 2019 03:47:17 -0400
Received: by mail-vs1-f65.google.com with SMTP id x184so835381vsb.5;
        Wed, 22 May 2019 00:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GbgAE4EAd8osAGsmtLYnEIjMKRoWMwBKHGa/aNCkc44=;
        b=luyK/kFpsAFMecplEe8+Ac9GpSk70/jAIp0lu6F3FbTPvSIB19ZuPXfCXzlt4THNe6
         8JwQwWY9Z4nJE22Z2ba1EwciQhPG7ts/bb4WDCFwVxGp4axLvrUj3qVPbn85iN6LqjeN
         yCjVBXnGMJKVHXurjvF8b02aJ5hKQeGBo8hmqEZwg1IVWm3dLAaJZPyFmKXqAOeBWUtl
         3qTOE2YJV4b6LxkImaySXRgIAwICrCW6ZshzoLWSgZCmrHLxltR4UW/pDwH3mAA7puxu
         s73HOtI97ByXy1fYE0cGcOhaBJe3u5xBSjJ0uQOfcGH9gDBWyrHAguvQ/STPjZmQDrPb
         Uq7A==
X-Gm-Message-State: APjAAAV6ef/T+OsoDI+0Pe7gKATO5y0TUtuc+UJ++fCayMpbuxnJ3rNJ
        hpAwLAJQWYXgeutFY2dpgRIjKcK5JzVIVZwYCXM=
X-Google-Smtp-Source: APXvYqw7oPQoYbogWoDA1rBHsGRroFebaWZUtvRBdPHyXlgTv6xz5np283C7zuFyLNRo3cMhKpzcrsjUfcPMWokVE4c=
X-Received: by 2002:a67:f589:: with SMTP id i9mr11304088vso.152.1558511235981;
 Wed, 22 May 2019 00:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com> <CAMuHMdWPmL5Z86cgJ4N-U-3XKr4ys8Y7U85okDcXYEu7z4ybaw@mail.gmail.com>
 <20190521155309.GB24470@rapoport-lnx>
In-Reply-To: <20190521155309.GB24470@rapoport-lnx>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 May 2019 09:47:04 +0200
Message-ID: <CAMuHMdWK6-ge-j1NbunDu_Jy7JOwbMfTzNQ767MViuTo4DNf+A@mail.gmail.com>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
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

Hi Mike,

On Tue, May 21, 2019 at 5:53 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
> On Tue, May 21, 2019 at 04:56:39PM +0200, Geert Uytterhoeven wrote:
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

Thanks! Output below...

 Determined physical RAM map:
  memory: 08000000 @ 00000000 (usable)
+memblock_reserve: [0x00100000-0x004b77c7] setup_arch+0x258/0x8e4
 Initrd not found or empty - disabling initrd
+memblock_reserve: [0x00448000-0x00447fff] setup_arch+0x5ac/0x8e4
+MEMBLOCK configuration:
+ memory size = 0x08000000 reserved size = 0x003b77c8
+ memory.cnt  = 0x1
+ memory[0x0]    [0x00000000-0x07ffffff], 0x08000000 bytes on node 0 flags: 0x0
+ reserved.cnt  = 0x1
+ reserved[0x0]  [0x00100000-0x004b77c7], 0x003b77c8 bytes flags: 0x0
+memblock_alloc_try_nid: 32 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 setup_arch+0x7ec/0x8e4
+memblock_reserve: [0x004b77e0-0x004b77ff] memblock_alloc_range_nid+0x130/0x178
 Primary instruction cache 32kB, VIPT, 4-way, linesize 32 bytes.
 Primary data cache 32kB, 4-way, VIPT, cache aliases, linesize 32 bytes
 Zone ranges:
@@ -16,10 +26,48 @@ Movable zone start for each node
 Early memory node ranges
   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
 Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
+memblock_alloc_try_nid: 1048576 bytes align=0x20 nid=0
from=0x00000000 max_addr=0x00000000
alloc_node_mem_map.constprop.31+0x6c/0xc8
+memblock_reserve: [0x004b7800-0x005b77ff] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 16 bytes align=0x20 nid=0 from=0x00000000
max_addr=0x00000000 setup_usemap.isra.13+0x68/0xa0
+memblock_reserve: [0x005b7800-0x005b780f] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 116 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 start_kernel+0xb0/0x508
+memblock_reserve: [0x005b7820-0x005b7893] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 116 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 start_kernel+0xf0/0x508
+memblock_reserve: [0x005b78a0-0x005b7913] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 116 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 start_kernel+0x114/0x508
+memblock_reserve: [0x005b7920-0x005b7993] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1
from=0x00000000 max_addr=0x00000000 pcpu_alloc_alloc_info+0x60/0xb8
+memblock_reserve: [0x005b8000-0x005b8fff] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 32768 bytes align=0x1000 nid=-1
from=0x01000000 max_addr=0x00000000 setup_per_cpu_areas+0x38/0xa8
+memblock_reserve: [0x01000000-0x01007fff] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_setup_first_chunk+0x200/0x588
+memblock_reserve: [0x005b79a0-0x005b79a3] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_setup_first_chunk+0x22c/0x588
+memblock_reserve: [0x005b79c0-0x005b79c3] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_setup_first_chunk+0x250/0x588
+memblock_reserve: [0x005b79e0-0x005b79e3] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_setup_first_chunk+0x288/0x588
+memblock_reserve: [0x005b7a00-0x005b7a03] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 120 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_setup_first_chunk+0x47c/0x588
+memblock_reserve: [0x005b7a20-0x005b7a97] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 89 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_alloc_first_chunk+0x88/0x2e0
+memblock_reserve: [0x005b7aa0-0x005b7af8] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 1024 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_alloc_first_chunk+0xd8/0x2e0
+memblock_reserve: [0x005b7b00-0x005b7eff] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 1028 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_alloc_first_chunk+0x118/0x2e0
+memblock_reserve: [0x005b9000-0x005b9403] memblock_alloc_range_nid+0x130/0x178
+memblock_alloc_try_nid: 256 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 pcpu_alloc_first_chunk+0x154/0x2e0
+memblock_reserve: [0x005b7f00-0x005b7fff] memblock_alloc_range_nid+0x130/0x178
+   memblock_free: [0x005b8000-0x005b8fff] start_kernel+0x164/0x508
 Built 1 zonelists, mobility grouping on.  Total pages: 32512
-Kernel command line:   console=ttyS0,9600 ip=on root=/dev/nfs rw
nfsroot=192.168.97.29:/nas/rbtx4927/debian-mipsel,tcp,v3
+Kernel command line:   console=ttyS0,9600 ip=on root=/dev/nfs rw
nfsroot=192.168.97.29:/nas/rbtx4927/debian-mipsel,tcp,v3
memblock=debug
+memblock_alloc_try_nid: 65536 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 alloc_large_system_hash+0x270/0x478
+memblock_reserve: [0x005b9420-0x005c941f] memblock_alloc_range_nid+0x130/0x178
 Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
+memblock_alloc_try_nid: 32768 bytes align=0x20 nid=-1 from=0x00000000
max_addr=0x00000000 alloc_large_system_hash+0x270/0x478
+memblock_reserve: [0x005c9420-0x005d141f] memblock_alloc_range_nid+0x130/0x178
 Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
+memblock_reserve: [0x00000000-0x000003ff] trap_init+0x58/0x474
 Memory: 126100K/131072K available (2830K kernel code, 147K rwdata,
508K rodata, 220K init, 93K bss, 4972K reserved, 0K cma-reserved)

> > Hence the old code reserved 1 MiB extra at the beginning.
> >
> > Note that the new code also dropped the rounding up of the memory block
> > size to a multiple of PAGE_SIZE. I'm not sure the latter actually
> > matters or not.
>
> I'd say that bad page state for pfn 1 is caused by "freeing" the first 1M.

Yes, by prom_free_prom_memory(), as pointed out by Serge.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
