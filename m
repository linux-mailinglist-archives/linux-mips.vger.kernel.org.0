Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9753425F12
	for <lists+linux-mips@lfdr.de>; Wed, 22 May 2019 10:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbfEVIIQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 04:08:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43856 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728085AbfEVIIQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 May 2019 04:08:16 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4M7vkAi077281
        for <linux-mips@vger.kernel.org>; Wed, 22 May 2019 04:08:14 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2smyx66cc6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-mips@vger.kernel.org>; Wed, 22 May 2019 04:08:14 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-mips@vger.kernel.org> from <rppt@linux.ibm.com>;
        Wed, 22 May 2019 09:08:12 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 22 May 2019 09:08:06 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x4M885E258982606
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 May 2019 08:08:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D86CEA4051;
        Wed, 22 May 2019 08:08:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 883CBA405B;
        Wed, 22 May 2019 08:08:04 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.112])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 22 May 2019 08:08:04 +0000 (GMT)
Date:   Wed, 22 May 2019 11:08:02 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com>
 <CAMuHMdWPmL5Z86cgJ4N-U-3XKr4ys8Y7U85okDcXYEu7z4ybaw@mail.gmail.com>
 <20190521155309.GB24470@rapoport-lnx>
 <CAMuHMdWK6-ge-j1NbunDu_Jy7JOwbMfTzNQ767MViuTo4DNf+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWK6-ge-j1NbunDu_Jy7JOwbMfTzNQ767MViuTo4DNf+A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19052208-4275-0000-0000-000003375536
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052208-4276-0000-0000-00003846ECDA
Message-Id: <20190522080802.GA31930@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-22_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905220059
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 22, 2019 at 09:47:04AM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Tue, May 21, 2019 at 5:53 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
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
> > > CONFIG_RELOCATABLE is not set, so the only relevant part is the
> > > change quoted below.
> > >
> > > > --- a/arch/mips/kernel/setup.c
> > > > +++ b/arch/mips/kernel/setup.c
> > > > @@ -371,7 +371,6 @@ static void __init bootmem_init(void)
> > > >
> > > >  static void __init bootmem_init(void)
> > > >  {
> > > > -       unsigned long reserved_end;
> > > >         phys_addr_t ramstart = PHYS_ADDR_MAX;
> > > >         int i;
> > > >
> > > > @@ -382,10 +381,10 @@ static void __init bootmem_init(void)
> > > >          * will reserve the area used for the initrd.
> > > >          */
> > > >         init_initrd();
> > > > -       reserved_end = (unsigned long) PFN_UP(__pa_symbol(&_end));
> > > >
> > > > -       memblock_reserve(PHYS_OFFSET,
> > > > -                        (reserved_end << PAGE_SHIFT) - PHYS_OFFSET);
> > > > +       /* Reserve memory occupied by kernel. */
> > > > +       memblock_reserve(__pa_symbol(&_text),
> > > > +                       __pa_symbol(&_end) - __pa_symbol(&_text));
> > > >
> > > >         /*
> > > >          * max_low_pfn is not a number of pages. The number of pages
> > >
> > > With some debug code added:
> > >
> > >     Determined physical RAM map:
> > >      memory: 08000000 @ 00000000 (usable)
> > >     bootmem_init:390: PHYS_OFFSET = 0x0
> > >     bootmem_init:391: __pa_symbol(&_text) = 0x100000
> > >     bootmem_init:392: __pa_symbol(&_end) = 0x4b77c8
> > >     bootmem_init:393: PFN_UP(__pa_symbol(&_end)) = 0x4b8
> >
> > Have you tried adding memblock=debug to the command line?
> > Not sure it'll help, but still :)
> 
> Thanks! Output below...
> 
>  Determined physical RAM map:
>   memory: 08000000 @ 00000000 (usable)
> +memblock_reserve: [0x00100000-0x004b77c7] setup_arch+0x258/0x8e4
>  Initrd not found or empty - disabling initrd
> +memblock_reserve: [0x00448000-0x00447fff] setup_arch+0x5ac/0x8e4
> +MEMBLOCK configuration:
> + memory size = 0x08000000 reserved size = 0x003b77c8
> + memory.cnt  = 0x1
> + memory[0x0]    [0x00000000-0x07ffffff], 0x08000000 bytes on node 0 flags: 0x0
> + reserved.cnt  = 0x1
> + reserved[0x0]  [0x00100000-0x004b77c7], 0x003b77c8 bytes flags: 0x0
> +memblock_alloc_try_nid: 32 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 setup_arch+0x7ec/0x8e4
> +memblock_reserve: [0x004b77e0-0x004b77ff] memblock_alloc_range_nid+0x130/0x178
>  Primary instruction cache 32kB, VIPT, 4-way, linesize 32 bytes.
>  Primary data cache 32kB, 4-way, VIPT, cache aliases, linesize 32 bytes
>  Zone ranges:
> @@ -16,10 +26,48 @@ Movable zone start for each node
>  Early memory node ranges
>    node   0: [mem 0x0000000000000000-0x0000000007ffffff]
>  Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
> +memblock_alloc_try_nid: 1048576 bytes align=0x20 nid=0
> from=0x00000000 max_addr=0x00000000
> alloc_node_mem_map.constprop.31+0x6c/0xc8
> +memblock_reserve: [0x004b7800-0x005b77ff] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 16 bytes align=0x20 nid=0 from=0x00000000
> max_addr=0x00000000 setup_usemap.isra.13+0x68/0xa0
> +memblock_reserve: [0x005b7800-0x005b780f] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 116 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 start_kernel+0xb0/0x508
> +memblock_reserve: [0x005b7820-0x005b7893] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 116 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 start_kernel+0xf0/0x508
> +memblock_reserve: [0x005b78a0-0x005b7913] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 116 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 start_kernel+0x114/0x508
> +memblock_reserve: [0x005b7920-0x005b7993] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1
> from=0x00000000 max_addr=0x00000000 pcpu_alloc_alloc_info+0x60/0xb8
> +memblock_reserve: [0x005b8000-0x005b8fff] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 32768 bytes align=0x1000 nid=-1
> from=0x01000000 max_addr=0x00000000 setup_per_cpu_areas+0x38/0xa8
> +memblock_reserve: [0x01000000-0x01007fff] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_setup_first_chunk+0x200/0x588
> +memblock_reserve: [0x005b79a0-0x005b79a3] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_setup_first_chunk+0x22c/0x588
> +memblock_reserve: [0x005b79c0-0x005b79c3] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_setup_first_chunk+0x250/0x588
> +memblock_reserve: [0x005b79e0-0x005b79e3] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 4 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_setup_first_chunk+0x288/0x588
> +memblock_reserve: [0x005b7a00-0x005b7a03] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 120 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_setup_first_chunk+0x47c/0x588
> +memblock_reserve: [0x005b7a20-0x005b7a97] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 89 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_alloc_first_chunk+0x88/0x2e0
> +memblock_reserve: [0x005b7aa0-0x005b7af8] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 1024 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_alloc_first_chunk+0xd8/0x2e0
> +memblock_reserve: [0x005b7b00-0x005b7eff] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 1028 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_alloc_first_chunk+0x118/0x2e0
> +memblock_reserve: [0x005b9000-0x005b9403] memblock_alloc_range_nid+0x130/0x178
> +memblock_alloc_try_nid: 256 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 pcpu_alloc_first_chunk+0x154/0x2e0
> +memblock_reserve: [0x005b7f00-0x005b7fff] memblock_alloc_range_nid+0x130/0x178
> +   memblock_free: [0x005b8000-0x005b8fff] start_kernel+0x164/0x508
>  Built 1 zonelists, mobility grouping on.  Total pages: 32512
> -Kernel command line:   console=ttyS0,9600 ip=on root=/dev/nfs rw
> nfsroot=192.168.97.29:/nas/rbtx4927/debian-mipsel,tcp,v3
> +Kernel command line:   console=ttyS0,9600 ip=on root=/dev/nfs rw
> nfsroot=192.168.97.29:/nas/rbtx4927/debian-mipsel,tcp,v3
> memblock=debug
> +memblock_alloc_try_nid: 65536 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 alloc_large_system_hash+0x270/0x478
> +memblock_reserve: [0x005b9420-0x005c941f] memblock_alloc_range_nid+0x130/0x178
>  Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
> +memblock_alloc_try_nid: 32768 bytes align=0x20 nid=-1 from=0x00000000
> max_addr=0x00000000 alloc_large_system_hash+0x270/0x478
> +memblock_reserve: [0x005c9420-0x005d141f] memblock_alloc_range_nid+0x130/0x178
>  Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
> +memblock_reserve: [0x00000000-0x000003ff] trap_init+0x58/0x474
>  Memory: 126100K/131072K available (2830K kernel code, 147K rwdata,
> 508K rodata, 220K init, 93K bss, 4972K reserved, 0K cma-reserved)

Presuming your system is !cpu_has_mips_r2_r6 and CAC_BASE is 0 the log
looks completely sane
 
> > > Hence the old code reserved 1 MiB extra at the beginning.
> > >
> > > Note that the new code also dropped the rounding up of the memory block
> > > size to a multiple of PAGE_SIZE. I'm not sure the latter actually
> > > matters or not.
> >
> > I'd say that bad page state for pfn 1 is caused by "freeing" the first 1M.
> 
> Yes, by prom_free_prom_memory(), as pointed out by Serge.

I wonder how other MIPS variants would react to the fact that the memory
below the kernel is not reserved ;-)

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

-- 
Sincerely yours,
Mike.

