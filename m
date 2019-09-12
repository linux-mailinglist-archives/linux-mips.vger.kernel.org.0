Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBBA9B1078
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2019 15:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731786AbfILNzq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 12 Sep 2019 09:55:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:41728 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731474AbfILNzq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Sep 2019 09:55:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 61F52AF81;
        Thu, 12 Sep 2019 13:55:39 +0000 (UTC)
Date:   Thu, 12 Sep 2019 15:55:39 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-Id: <20190912155539.6151b0811e858455be4c8d86@suse.de>
In-Reply-To: <20190912105831.GA10677@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
        <20190905152150.f7ff6ef70726085de63df828@suse.de>
        <20190905133251.GA3650@rapoport-lnx>
        <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
        <20190905154747.GB3650@rapoport-lnx>
        <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
        <20190906130223.GA17704@rapoport-lnx>
        <20190909182242.c1ef9717d14b20212ef75954@suse.de>
        <20190910113243.GA19207@rapoport-lnx>
        <20190911160939.19f776535770d12ff51a2af7@suse.de>
        <20190912105831.GA10677@rapoport-lnx>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 12 Sep 2019 11:58:33 +0100
Mike Rapoport <rppt@kernel.org> wrote:

> On Wed, Sep 11, 2019 at 04:09:39PM +0200, Thomas Bogendoerfer wrote:
> > Does memblocks_present() deal better with the one reserved page per node
> > than sparse_memory_present_with_active_regions() ? Or is there a better
> > explanation ? My debug prints didn't make sense out of it...
> 
> I think the problem is that when we call
> sparse_memory_present_with_active_regions() per node, the page for the node
> data of the next nodes is not yet reserved and since memory_present() does
> memblock allocations it may use that memory.
> 
> We can try to verify that with "memblock=debug" in the command line.

see below

> Another thing we could try to rule out the differences between
> memblocks_present() and sparse_memory_present_with_active_regions() is to
> replace memblocks_present() in your patch with
> sparse_memory_present_with_active_regions(MAX_NUMNODES).

that works as well and produces the same debug output.

Important line of diff -u max_numnodes broken:

- memory size = 0x00000000b0000000 reserved size = 0x0000000004d1a360
+ memory size = 0x00000000b0000000 reserved size = 0x0000000004d12360

- reserved.cnt  = 0xe
+ reserved.cnt  = 0xd

- reserved[0xd]	[0x000000035bff8000-0x000000035bffffff], 0x0000000000008000 bytes flags: 0x0

I have no idea which reservation this is, but it's not from one of the node data.

Thomas.

bootlog with sparse_memory_present_with_active_regions(MAX_NUMNODES):

Determined physical RAM map:
 memory: 00000000006ec000 @ 000000000001c000 (usable)
 memory: 0000000000058000 @ 0000000000708000 (usable after init)
 memory: 000000000002f000 @ 0000000000760000 (usable)
printk: debug: ignoring loglevel setting.
memblock_alloc_try_nid: 192 bytes align=0x80 nid=0 from=0x0000000000000000 max_addr=0x0000000000000000 sparse_init_nid+0xa0/0x4ac
memblock_reserve: [0x0000000000791000-0x00000000007910bf] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid_raw: 14680064 bytes align=0x1000 nid=0 from=0x0000000001000000 max_addr=0x0000000000000000 sparse_init_nid+0x154/0x4ac
memblock_reserve: [0x0000000001000000-0x0000000001dfffff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 3670016 bytes align=0x1000 nid=0 from=0x0000000001000000 max_addr=0x0000000000000000 __populate_section_memmap+0x3c/0x98
memblock_reserve: [0x0000000001e00000-0x000000000217ffff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000001b80000-0x0000000001dfffff] sparse_init_nid+0x360/0x4ac
memblock_alloc_try_nid: 192 bytes align=0x80 nid=0 from=0x0000000000000000 max_addr=0x0000000000000000 sparse_init_nid+0xa0/0x4ac
memblock_reserve: [0x0000000000791100-0x00000000007911bf] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid_raw: 14680064 bytes align=0x1000 nid=1 from=0x0000000001000000 max_addr=0x0000000000000000 sparse_init_nid+0x154/0x4ac
memblock_reserve: [0x0000000100027000-0x0000000100e26fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 3670016 bytes align=0x1000 nid=1 from=0x0000000001000000 max_addr=0x0000000000000000 __populate_section_memmap+0x3c/0x98
memblock_reserve: [0x0000000100e27000-0x00000001011a6fff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000100c00000-0x0000000100e26fff] sparse_init_nid+0x360/0x4ac
memblock_alloc_try_nid: 192 bytes align=0x80 nid=0 from=0x0000000000000000 max_addr=0x0000000000000000 sparse_init_nid+0xa0/0x4ac
memblock_reserve: [0x0000000000791200-0x00000000007912bf] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid_raw: 14680064 bytes align=0x1000 nid=2 from=0x0000000001000000 max_addr=0x0000000000000000 sparse_init_nid+0x154/0x4ac
memblock_reserve: [0x0000000200027000-0x0000000200e26fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 3670016 bytes align=0x1000 nid=2 from=0x0000000001000000 max_addr=0x0000000000000000 __populate_section_memmap+0x3c/0x98
memblock_reserve: [0x0000000200e27000-0x00000002011a6fff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000200c00000-0x0000000200e26fff] sparse_init_nid+0x360/0x4ac
memblock_alloc_try_nid: 288 bytes align=0x80 nid=0 from=0x0000000000000000 max_addr=0x0000000000000000 sparse_init_nid+0xa0/0x4ac
memblock_reserve: [0x0000000000791300-0x000000000079141f] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid_raw: 22020096 bytes align=0x1000 nid=3 from=0x0000000001000000 max_addr=0x0000000000000000 sparse_init_nid+0x154/0x4ac
memblock_reserve: [0x0000000300027000-0x0000000301526fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 3670016 bytes align=0x1000 nid=3 from=0x0000000001000000 max_addr=0x0000000000000000 __populate_section_memmap+0x3c/0x98
memblock_reserve: [0x0000000301527000-0x00000003018a6fff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000301400000-0x0000000301526fff] sparse_init_nid+0x360/0x4ac
memblock_reserve: [0x00000000006b8000-0x00000000006b7fff] setup_arch+0x44c/0x58c
MEMBLOCK configuration:
 memory size = 0x00000000b0000000 reserved size = 0x0000000004d1a360
 memory.cnt  = 0x1c
 memory[0x0]	[0x0000000000000000-0x0000000023ffffff], 0x0000000024000000 bytes on node 0 flags: 0x0
 memory[0x1]	[0x0000000028000000-0x000000002bffffff], 0x0000000004000000 bytes on node 0 flags: 0x0
 memory[0x2]	[0x0000000030000000-0x0000000033ffffff], 0x0000000004000000 bytes on node 0 flags: 0x0
 memory[0x3]	[0x0000000038000000-0x000000003bffffff], 0x0000000004000000 bytes on node 0 flags: 0x0
 memory[0x4]	[0x0000000100000000-0x0000000123ffffff], 0x0000000024000000 bytes on node 1 flags: 0x0
 memory[0x5]	[0x0000000128000000-0x000000012bffffff], 0x0000000004000000 bytes on node 1 flags: 0x0
 memory[0x6]	[0x0000000130000000-0x0000000133ffffff], 0x0000000004000000 bytes on node 1 flags: 0x0
 memory[0x7]	[0x0000000138000000-0x000000013bffffff], 0x0000000004000000 bytes on node 1 flags: 0x0
 memory[0x8]	[0x0000000200000000-0x0000000203ffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0x9]	[0x0000000208000000-0x000000020bffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xa]	[0x0000000210000000-0x0000000213ffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xb]	[0x0000000218000000-0x000000021bffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xc]	[0x0000000220000000-0x0000000223ffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xd]	[0x0000000228000000-0x000000022bffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xe]	[0x0000000230000000-0x0000000233ffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xf]	[0x0000000238000000-0x000000023bffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0x10]	[0x0000000300000000-0x0000000303ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x11]	[0x0000000308000000-0x000000030bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x12]	[0x0000000310000000-0x0000000313ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x13]	[0x0000000318000000-0x000000031bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x14]	[0x0000000320000000-0x0000000323ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x15]	[0x0000000328000000-0x000000032bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x16]	[0x0000000330000000-0x0000000333ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x17]	[0x0000000338000000-0x000000033bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x18]	[0x0000000340000000-0x0000000343ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x19]	[0x0000000348000000-0x000000034bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x1a]	[0x0000000350000000-0x0000000353ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x1b]	[0x0000000358000000-0x000000035bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 reserved.cnt  = 0xe
 reserved[0x0]	[0x0000000000000000-0x00000000007910bf], 0x00000000007910c0 bytes flags: 0x0
 reserved[0x1]	[0x0000000000791100-0x00000000007911bf], 0x00000000000000c0 bytes flags: 0x0
 reserved[0x2]	[0x0000000000791200-0x00000000007912bf], 0x00000000000000c0 bytes flags: 0x0
 reserved[0x3]	[0x0000000000791300-0x000000000079141f], 0x0000000000000120 bytes flags: 0x0
 reserved[0x4]	[0x0000000001000000-0x0000000001b7ffff], 0x0000000000b80000 bytes flags: 0x0
 reserved[0x5]	[0x0000000001e00000-0x000000000217ffff], 0x0000000000380000 bytes flags: 0x0
 reserved[0x6]	[0x000000003bfff000-0x000000003bffffff], 0x0000000000001000 bytes flags: 0x0
 reserved[0x7]	[0x0000000100000000-0x0000000100bfffff], 0x0000000000c00000 bytes flags: 0x0
 reserved[0x8]	[0x0000000100e27000-0x00000001011a6fff], 0x0000000000380000 bytes flags: 0x0
 reserved[0x9]	[0x0000000200000000-0x0000000200bfffff], 0x0000000000c00000 bytes flags: 0x0
 reserved[0xa]	[0x0000000200e27000-0x00000002011a6fff], 0x0000000000380000 bytes flags: 0x0
 reserved[0xb]	[0x0000000300000000-0x00000003013fffff], 0x0000000001400000 bytes flags: 0x0
 reserved[0xc]	[0x0000000301527000-0x00000003018a6fff], 0x0000000000380000 bytes flags: 0x0
 reserved[0xd]	[0x000000035bff8000-0x000000035bffffff], 0x0000000000008000 bytes flags: 0x0
REPLICATION: ON nasid 0, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 1, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 2, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 3, ktext from nasid 0, kdata from nasid 0
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
Zone ranges:
  Normal   [mem 0x0000000000000000-0x000000035bffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000023ffffff]
  node   0: [mem 0x0000000028000000-0x000000002bffffff]
  node   0: [mem 0x0000000030000000-0x0000000033ffffff]
  node   0: [mem 0x0000000038000000-0x000000003bffffff]
  node   1: [mem 0x0000000100000000-0x0000000123ffffff]
  node   1: [mem 0x0000000128000000-0x000000012bffffff]
  node   1: [mem 0x0000000130000000-0x0000000133ffffff]
  node   1: [mem 0x0000000138000000-0x000000013bffffff]
  node   2: [mem 0x0000000200000000-0x0000000203ffffff]
  node   2: [mem 0x0000000208000000-0x000000020bffffff]
  node   2: [mem 0x0000000210000000-0x0000000213ffffff]
  node   2: [mem 0x0000000218000000-0x000000021bffffff]
  node   2: [mem 0x0000000220000000-0x0000000223ffffff]
  node   2: [mem 0x0000000228000000-0x000000022bffffff]
  node   2: [mem 0x0000000230000000-0x0000000233ffffff]
  node   2: [mem 0x0000000238000000-0x000000023bffffff]
  node   3: [mem 0x0000000300000000-0x0000000303ffffff]
  node   3: [mem 0x0000000308000000-0x000000030bffffff]
  node   3: [mem 0x0000000310000000-0x0000000313ffffff]
  node   3: [mem 0x0000000318000000-0x000000031bffffff]
  node   3: [mem 0x0000000320000000-0x0000000323ffffff]
  node   3: [mem 0x0000000328000000-0x000000032bffffff]
  node   3: [mem 0x0000000330000000-0x0000000333ffffff]
  node   3: [mem 0x0000000338000000-0x000000033bffffff]
  node   3: [mem 0x0000000340000000-0x0000000343ffffff]
  node   3: [mem 0x0000000348000000-0x000000034bffffff]
  node   3: [mem 0x0000000350000000-0x0000000353ffffff]
  node   3: [mem 0x0000000358000000-0x000000035bffffff]
mminit::pageflags_layout_widths Section 20 Node 6 Zone 1 Lastcpupid 0 Flags 22
mminit::pageflags_layout_shifts Section 20 Node 6 Zone 1 Lastcpupid 0
mminit::pageflags_layout_pgshifts Section 44 Node 38 Zone 37 Lastcpupid 0
mminit::pageflags_layout_nodezoneid Node/Zone ID: 44 -> 37
mminit::pageflags_layout_usage location: 64 -> 37 layout 37 -> 22 unused 22 -> 0 page-flags
Zeroed struct page in unavailable ranges: 442368 pages
Initmem setup node 0 [mem 0x0000000000000000-0x000000003bffffff]
On node 0 totalpages: 196608
  Normal zone: 2688 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 196608 pages, LIFO batch:63
mminit::memmap_init Initialising map node 0 zone 0 pfns 0 -> 245760
Initmem setup node 1 [mem 0x0000000100000000-0x000000013bffffff]
On node 1 totalpages: 196608
  Normal zone: 2688 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 196608 pages, LIFO batch:63
mminit::memmap_init Initialising map node 1 zone 0 pfns 1048576 -> 1294336
Initmem setup node 2 [mem 0x0000000200000000-0x000000023bffffff]
On node 2 totalpages: 131072
  Normal zone: 1792 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 131072 pages, LIFO batch:31
mminit::memmap_init Initialising map node 2 zone 0 pfns 2097152 -> 2342912
Initmem setup node 3 [mem 0x0000000300000000-0x000000035bffffff]
On node 3 totalpages: 196608
  Normal zone: 2688 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 196608 pages, LIFO batch:63
mminit::memmap_init Initialising map node 3 zone 0 pfns 3145728 -> 3522560
memblock_alloc_try_nid: 88 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 start_kernel+0x110/0x734
memblock_reserve: [0x0000000000791480-0x00000000007914d7] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 88 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 start_kernel+0x13c/0x734
memblock_reserve: [0x0000000000791500-0x0000000000791557] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 88 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 start_kernel+0x178/0x734
memblock_reserve: [0x0000000000791580-0x00000000007915d7] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_alloc_info+0x5c/0xc8
memblock_reserve: [0x0000000000792000-0x0000000000792fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 4096 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_embed_first_chunk+0x594/0x950
memblock_reserve: [0x0000000000793000-0x0000000000793fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 622592 bytes align=0x1000 nid=-1 from=0x0000000001000000 max_addr=0x0000000000000000 pcpu_embed_first_chunk+0x610/0x950
memblock_reserve: [0x0000000001b80000-0x0000000001c17fff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000001b93000-0x0000000001b92fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001ba6000-0x0000000001ba5fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001bb9000-0x0000000001bb8fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001bcc000-0x0000000001bcbfff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001bdf000-0x0000000001bdefff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001bf2000-0x0000000001bf1fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001c05000-0x0000000001c04fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001c18000-0x0000000001c17fff] pcpu_embed_first_chunk+0x7e0/0x950
percpu: Embedded 19 pages/cpu s39584 r8192 d30048 u77824
memblock_alloc_try_nid: 8 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x224/0x914
memblock_reserve: [0x0000000000791600-0x0000000000791607] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 8 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x24c/0x914
memblock_reserve: [0x0000000000791680-0x0000000000791687] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 32 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x274/0x914
memblock_reserve: [0x0000000000791700-0x000000000079171f] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 64 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x29c/0x914
memblock_reserve: [0x0000000000791780-0x00000000007917bf] memblock_alloc_range_nid+0x158/0x1fc
pcpu-alloc: s39584 r8192 d30048 u77824 alloc=19*4096
pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
memblock_alloc_try_nid: 256 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x76c/0x914
memblock_reserve: [0x0000000000791800-0x00000000007918ff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 121 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x90/0x320
memblock_reserve: [0x0000000000791900-0x0000000000791978] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 384 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0xe8/0x320
memblock_reserve: [0x0000000000791980-0x0000000000791aff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 392 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x154/0x320
memblock_reserve: [0x0000000000791b00-0x0000000000791c87] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 96 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x17c/0x320
memblock_reserve: [0x0000000000791d00-0x0000000000791d5f] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 121 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x90/0x320
memblock_reserve: [0x0000000000791d80-0x0000000000791df8] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 1024 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0xe8/0x320
memblock_reserve: [0x0000000000794000-0x00000000007943ff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 1032 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x154/0x320
memblock_reserve: [0x0000000000794400-0x0000000000794807] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 256 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x17c/0x320
memblock_reserve: [0x0000000000791e00-0x0000000000791eff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000000792000-0x0000000000792fff] pcpu_embed_first_chunk+0x870/0x950
   memblock_free: [0x0000000000793000-0x0000000000793fff] pcpu_embed_first_chunk+0x908/0x950
CPU 0 clock is 300MHz.
mminit::zonelist general 0:Normal = 0:Normal 1:Normal 2:Normal 3:Normal 
mminit::zonelist thisnode 0:Normal = 0:Normal 
mminit::zonelist general 1:Normal = 1:Normal 3:Normal 2:Normal 0:Normal 
mminit::zonelist thisnode 1:Normal = 1:Normal 
mminit::zonelist general 2:Normal = 2:Normal 3:Normal 1:Normal 0:Normal 
mminit::zonelist thisnode 2:Normal = 2:Normal 
mminit::zonelist general 3:Normal = 3:Normal 2:Normal 1:Normal 0:Normal 
mminit::zonelist thisnode 3:Normal = 3:Normal 
Built 4 zonelists, mobility grouping on.  Total pages: 711040
Policy zone: Normal
Kernel command line: root=dksc(0,1,0) ip=dhcp root=/dev/nfs mminit_loglevel=4 ignore_loglevel memblock=debug
printk: log_buf_len individual max cpu contribution: 4096 bytes
printk: log_buf_len total cpu_extra contributions: 28672 bytes
printk: log_buf_len min size: 32768 bytes
memblock_alloc_try_nid: 65536 bytes align=0x8 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 setup_log_buf+0x15c/0x2d0
memblock_reserve: [0x0000000000794808-0x00000000007a4807] memblock_alloc_range_nid+0x158/0x1fc
printk: log_buf_len: 65536 bytes
printk: early log buf free: 9680(29%)
memblock_reserve: [0x0000000000000000-0x00000000000003ff] trap_init+0x44/0x580
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 2803948K/2883584K available (5530K kernel code, 345K rwdata, 1196K rodata, 352K init, 186K bss, 79636K reserved, 0K cma-reserved)

bootlog with sparse_memory_present_with_active_regions per node:

Determined physical RAM map:
 memory: 00000000006ec000 @ 000000000001c000 (usable)
 memory: 0000000000058000 @ 0000000000708000 (usable after init)
 memory: 000000000002f000 @ 0000000000760000 (usable)
printk: debug: ignoring loglevel setting.
memblock_alloc_try_nid: 192 bytes align=0x80 nid=0 from=0x0000000000000000 max_addr=0x0000000000000000 sparse_init_nid+0xa0/0x4ac
memblock_reserve: [0x0000000000791000-0x00000000007910bf] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid_raw: 14680064 bytes align=0x1000 nid=0 from=0x0000000001000000 max_addr=0x0000000000000000 sparse_init_nid+0x154/0x4ac
memblock_reserve: [0x0000000001000000-0x0000000001dfffff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 3670016 bytes align=0x1000 nid=0 from=0x0000000001000000 max_addr=0x0000000000000000 __populate_section_memmap+0x3c/0x98
memblock_reserve: [0x0000000001e00000-0x000000000217ffff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000001b80000-0x0000000001dfffff] sparse_init_nid+0x360/0x4ac
memblock_alloc_try_nid: 192 bytes align=0x80 nid=0 from=0x0000000000000000 max_addr=0x0000000000000000 sparse_init_nid+0xa0/0x4ac
memblock_reserve: [0x0000000000791100-0x00000000007911bf] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid_raw: 14680064 bytes align=0x1000 nid=1 from=0x0000000001000000 max_addr=0x0000000000000000 sparse_init_nid+0x154/0x4ac
memblock_reserve: [0x0000000100027000-0x0000000100e26fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 3670016 bytes align=0x1000 nid=1 from=0x0000000001000000 max_addr=0x0000000000000000 __populate_section_memmap+0x3c/0x98
memblock_reserve: [0x0000000100e27000-0x00000001011a6fff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000100c00000-0x0000000100e26fff] sparse_init_nid+0x360/0x4ac
memblock_alloc_try_nid: 192 bytes align=0x80 nid=0 from=0x0000000000000000 max_addr=0x0000000000000000 sparse_init_nid+0xa0/0x4ac
memblock_reserve: [0x0000000000791200-0x00000000007912bf] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid_raw: 14680064 bytes align=0x1000 nid=2 from=0x0000000001000000 max_addr=0x0000000000000000 sparse_init_nid+0x154/0x4ac
memblock_reserve: [0x0000000200027000-0x0000000200e26fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 3670016 bytes align=0x1000 nid=2 from=0x0000000001000000 max_addr=0x0000000000000000 __populate_section_memmap+0x3c/0x98
memblock_reserve: [0x0000000200e27000-0x00000002011a6fff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000200c00000-0x0000000200e26fff] sparse_init_nid+0x360/0x4ac
memblock_alloc_try_nid: 288 bytes align=0x80 nid=0 from=0x0000000000000000 max_addr=0x0000000000000000 sparse_init_nid+0xa0/0x4ac
memblock_reserve: [0x0000000000791300-0x000000000079141f] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid_raw: 22020096 bytes align=0x1000 nid=3 from=0x0000000001000000 max_addr=0x0000000000000000 sparse_init_nid+0x154/0x4ac
memblock_reserve: [0x0000000300027000-0x0000000301526fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 3670016 bytes align=0x1000 nid=3 from=0x0000000001000000 max_addr=0x0000000000000000 __populate_section_memmap+0x3c/0x98
memblock_reserve: [0x0000000301527000-0x00000003018a6fff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000301400000-0x0000000301526fff] sparse_init_nid+0x360/0x4ac
memblock_reserve: [0x00000000006b8000-0x00000000006b7fff] setup_arch+0x44c/0x58c
MEMBLOCK configuration:
 memory size = 0x00000000b0000000 reserved size = 0x0000000004d12360
 memory.cnt  = 0x1c
 memory[0x0]	[0x0000000000000000-0x0000000023ffffff], 0x0000000024000000 bytes on node 0 flags: 0x0
 memory[0x1]	[0x0000000028000000-0x000000002bffffff], 0x0000000004000000 bytes on node 0 flags: 0x0
 memory[0x2]	[0x0000000030000000-0x0000000033ffffff], 0x0000000004000000 bytes on node 0 flags: 0x0
 memory[0x3]	[0x0000000038000000-0x000000003bffffff], 0x0000000004000000 bytes on node 0 flags: 0x0
 memory[0x4]	[0x0000000100000000-0x0000000123ffffff], 0x0000000024000000 bytes on node 1 flags: 0x0
 memory[0x5]	[0x0000000128000000-0x000000012bffffff], 0x0000000004000000 bytes on node 1 flags: 0x0
 memory[0x6]	[0x0000000130000000-0x0000000133ffffff], 0x0000000004000000 bytes on node 1 flags: 0x0
 memory[0x7]	[0x0000000138000000-0x000000013bffffff], 0x0000000004000000 bytes on node 1 flags: 0x0
 memory[0x8]	[0x0000000200000000-0x0000000203ffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0x9]	[0x0000000208000000-0x000000020bffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xa]	[0x0000000210000000-0x0000000213ffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xb]	[0x0000000218000000-0x000000021bffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xc]	[0x0000000220000000-0x0000000223ffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xd]	[0x0000000228000000-0x000000022bffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xe]	[0x0000000230000000-0x0000000233ffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0xf]	[0x0000000238000000-0x000000023bffffff], 0x0000000004000000 bytes on node 2 flags: 0x0
 memory[0x10]	[0x0000000300000000-0x0000000303ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x11]	[0x0000000308000000-0x000000030bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x12]	[0x0000000310000000-0x0000000313ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x13]	[0x0000000318000000-0x000000031bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x14]	[0x0000000320000000-0x0000000323ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x15]	[0x0000000328000000-0x000000032bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x16]	[0x0000000330000000-0x0000000333ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x17]	[0x0000000338000000-0x000000033bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x18]	[0x0000000340000000-0x0000000343ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x19]	[0x0000000348000000-0x000000034bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x1a]	[0x0000000350000000-0x0000000353ffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 memory[0x1b]	[0x0000000358000000-0x000000035bffffff], 0x0000000004000000 bytes on node 3 flags: 0x0
 reserved.cnt  = 0xd
 reserved[0x0]	[0x0000000000000000-0x00000000007910bf], 0x00000000007910c0 bytes flags: 0x0
 reserved[0x1]	[0x0000000000791100-0x00000000007911bf], 0x00000000000000c0 bytes flags: 0x0
 reserved[0x2]	[0x0000000000791200-0x00000000007912bf], 0x00000000000000c0 bytes flags: 0x0
 reserved[0x3]	[0x0000000000791300-0x000000000079141f], 0x0000000000000120 bytes flags: 0x0
 reserved[0x4]	[0x0000000001000000-0x0000000001b7ffff], 0x0000000000b80000 bytes flags: 0x0
 reserved[0x5]	[0x0000000001e00000-0x000000000217ffff], 0x0000000000380000 bytes flags: 0x0
 reserved[0x6]	[0x000000003bfff000-0x000000003bffffff], 0x0000000000001000 bytes flags: 0x0
 reserved[0x7]	[0x0000000100000000-0x0000000100bfffff], 0x0000000000c00000 bytes flags: 0x0
 reserved[0x8]	[0x0000000100e27000-0x00000001011a6fff], 0x0000000000380000 bytes flags: 0x0
 reserved[0x9]	[0x0000000200000000-0x0000000200bfffff], 0x0000000000c00000 bytes flags: 0x0
 reserved[0xa]	[0x0000000200e27000-0x00000002011a6fff], 0x0000000000380000 bytes flags: 0x0
 reserved[0xb]	[0x0000000300000000-0x00000003013fffff], 0x0000000001400000 bytes flags: 0x0
 reserved[0xc]	[0x0000000301527000-0x00000003018a6fff], 0x0000000000380000 bytes flags: 0x0
REPLICATION: ON nasid 0, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 1, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 2, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 3, ktext from nasid 0, kdata from nasid 0
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
Zone ranges:
  Normal   [mem 0x0000000000000000-0x000000035bffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000023ffffff]
  node   0: [mem 0x0000000028000000-0x000000002bffffff]
  node   0: [mem 0x0000000030000000-0x0000000033ffffff]
  node   0: [mem 0x0000000038000000-0x000000003bffffff]
  node   1: [mem 0x0000000100000000-0x0000000123ffffff]
  node   1: [mem 0x0000000128000000-0x000000012bffffff]
  node   1: [mem 0x0000000130000000-0x0000000133ffffff]
  node   1: [mem 0x0000000138000000-0x000000013bffffff]
  node   2: [mem 0x0000000200000000-0x0000000203ffffff]
  node   2: [mem 0x0000000208000000-0x000000020bffffff]
  node   2: [mem 0x0000000210000000-0x0000000213ffffff]
  node   2: [mem 0x0000000218000000-0x000000021bffffff]
  node   2: [mem 0x0000000220000000-0x0000000223ffffff]
  node   2: [mem 0x0000000228000000-0x000000022bffffff]
  node   2: [mem 0x0000000230000000-0x0000000233ffffff]
  node   2: [mem 0x0000000238000000-0x000000023bffffff]
  node   3: [mem 0x0000000300000000-0x0000000303ffffff]
  node   3: [mem 0x0000000308000000-0x000000030bffffff]
  node   3: [mem 0x0000000310000000-0x0000000313ffffff]
  node   3: [mem 0x0000000318000000-0x000000031bffffff]
  node   3: [mem 0x0000000320000000-0x0000000323ffffff]
  node   3: [mem 0x0000000328000000-0x000000032bffffff]
  node   3: [mem 0x0000000330000000-0x0000000333ffffff]
  node   3: [mem 0x0000000338000000-0x000000033bffffff]
  node   3: [mem 0x0000000340000000-0x0000000343ffffff]
  node   3: [mem 0x0000000348000000-0x000000034bffffff]
  node   3: [mem 0x0000000350000000-0x0000000353ffffff]
  node   3: [mem 0x0000000358000000-0x000000035bffffff]
mminit::pageflags_layout_widths Section 20 Node 6 Zone 1 Lastcpupid 0 Flags 22
mminit::pageflags_layout_shifts Section 20 Node 6 Zone 1 Lastcpupid 0
mminit::pageflags_layout_pgshifts Section 44 Node 38 Zone 37 Lastcpupid 0
mminit::pageflags_layout_nodezoneid Node/Zone ID: 44 -> 37
mminit::pageflags_layout_usage location: 64 -> 37 layout 37 -> 22 unused 22 -> 0 page-flags
Zeroed struct page in unavailable ranges: 442368 pages
Initmem setup node 0 [mem 0x0000000000000000-0x000000003bffffff]
On node 0 totalpages: 196608
  Normal zone: 2688 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 196608 pages, LIFO batch:63
mminit::memmap_init Initialising map node 0 zone 0 pfns 0 -> 245760
Initmem setup node 1 [mem 0x0000000100000000-0x000000013bffffff]
On node 1 totalpages: 196608
  Normal zone: 2688 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 196608 pages, LIFO batch:63
mminit::memmap_init Initialising map node 1 zone 0 pfns 1048576 -> 1294336
Initmem setup node 2 [mem 0x0000000200000000-0x000000023bffffff]
On node 2 totalpages: 131072
  Normal zone: 1792 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 131072 pages, LIFO batch:31
mminit::memmap_init Initialising map node 2 zone 0 pfns 2097152 -> 2342912
Initmem setup node 3 [mem 0x0000000300000000-0x000000035bffffff]
On node 3 totalpages: 196608
  Normal zone: 2688 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 196608 pages, LIFO batch:63
mminit::memmap_init Initialising map node 3 zone 0 pfns 3145728 -> 3522560
memblock_alloc_try_nid: 88 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 start_kernel+0x110/0x734
memblock_reserve: [0x0000000000791480-0x00000000007914d7] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 88 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 start_kernel+0x13c/0x734
memblock_reserve: [0x0000000000791500-0x0000000000791557] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 88 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 start_kernel+0x178/0x734
memblock_reserve: [0x0000000000791580-0x00000000007915d7] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 4096 bytes align=0x1000 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_alloc_info+0x5c/0xc8
memblock_reserve: [0x0000000000792000-0x0000000000792fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 4096 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_embed_first_chunk+0x594/0x950
memblock_reserve: [0x0000000000793000-0x0000000000793fff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 622592 bytes align=0x1000 nid=-1 from=0x0000000001000000 max_addr=0x0000000000000000 pcpu_embed_first_chunk+0x610/0x950
memblock_reserve: [0x0000000001b80000-0x0000000001c17fff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000001b93000-0x0000000001b92fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001ba6000-0x0000000001ba5fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001bb9000-0x0000000001bb8fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001bcc000-0x0000000001bcbfff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001bdf000-0x0000000001bdefff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001bf2000-0x0000000001bf1fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001c05000-0x0000000001c04fff] pcpu_embed_first_chunk+0x7e0/0x950
   memblock_free: [0x0000000001c18000-0x0000000001c17fff] pcpu_embed_first_chunk+0x7e0/0x950
percpu: Embedded 19 pages/cpu s39584 r8192 d30048 u77824
memblock_alloc_try_nid: 8 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x224/0x914
memblock_reserve: [0x0000000000791600-0x0000000000791607] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 8 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x24c/0x914
memblock_reserve: [0x0000000000791680-0x0000000000791687] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 32 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x274/0x914
memblock_reserve: [0x0000000000791700-0x000000000079171f] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 64 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x29c/0x914
memblock_reserve: [0x0000000000791780-0x00000000007917bf] memblock_alloc_range_nid+0x158/0x1fc
pcpu-alloc: s39584 r8192 d30048 u77824 alloc=19*4096
pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
memblock_alloc_try_nid: 256 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_setup_first_chunk+0x76c/0x914
memblock_reserve: [0x0000000000791800-0x00000000007918ff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 121 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x90/0x320
memblock_reserve: [0x0000000000791900-0x0000000000791978] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 384 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0xe8/0x320
memblock_reserve: [0x0000000000791980-0x0000000000791aff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 392 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x154/0x320
memblock_reserve: [0x0000000000791b00-0x0000000000791c87] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 96 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x17c/0x320
memblock_reserve: [0x0000000000791d00-0x0000000000791d5f] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 121 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x90/0x320
memblock_reserve: [0x0000000000791d80-0x0000000000791df8] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 1024 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0xe8/0x320
memblock_reserve: [0x0000000000794000-0x00000000007943ff] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 1032 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x154/0x320
memblock_reserve: [0x0000000000794400-0x0000000000794807] memblock_alloc_range_nid+0x158/0x1fc
memblock_alloc_try_nid: 256 bytes align=0x80 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 pcpu_alloc_first_chunk+0x17c/0x320
memblock_reserve: [0x0000000000791e00-0x0000000000791eff] memblock_alloc_range_nid+0x158/0x1fc
   memblock_free: [0x0000000000792000-0x0000000000792fff] pcpu_embed_first_chunk+0x870/0x950
   memblock_free: [0x0000000000793000-0x0000000000793fff] pcpu_embed_first_chunk+0x908/0x950
CPU 0 clock is 300MHz.
mminit::zonelist general 0:Normal = 0:Normal 1:Normal 2:Normal 3:Normal 
mminit::zonelist thisnode 0:Normal = 0:Normal 
mminit::zonelist general 1:Normal = 1:Normal 3:Normal 2:Normal 0:Normal 
mminit::zonelist thisnode 1:Normal = 1:Normal 
mminit::zonelist general 2:Normal = 2:Normal 3:Normal 1:Normal 0:Normal 
mminit::zonelist thisnode 2:Normal = 2:Normal 
mminit::zonelist general 3:Normal = 3:Normal 2:Normal 1:Normal 0:Normal 
mminit::zonelist thisnode 3:Normal = 3:Normal 
Built 4 zonelists, mobility grouping on.  Total pages: 711040
Policy zone: Normal
Kernel command line: root=dksc(0,1,0) ip=dhcp root=/dev/nfs mminit_loglevel=4 ignore_loglevel memblock=debug
printk: log_buf_len individual max cpu contribution: 4096 bytes
printk: log_buf_len total cpu_extra contributions: 28672 bytes
printk: log_buf_len min size: 32768 bytes
memblock_alloc_try_nid: 65536 bytes align=0x8 nid=-1 from=0x0000000000000000 max_addr=0x0000000000000000 setup_log_buf+0x15c/0x2d0
memblock_reserve: [0x0000000000794808-0x00000000007a4807] memblock_alloc_range_nid+0x158/0x1fc
printk: log_buf_len: 65536 bytes
printk: early log buf free: 9792(29%)
memblock_reserve: [0x0000000000000000-0x00000000000003ff] trap_init+0x44/0x580
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 2803980K/2883584K available (5530K kernel code, 345K rwdata, 1196K rodata, 352K init, 186K bss, 79604K reserved, 0K cma-reserved)

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
