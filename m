Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED88CAEAC9
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2019 14:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbfIJMok convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 10 Sep 2019 08:44:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:38430 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726892AbfIJMoj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 10 Sep 2019 08:44:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D69F1B65B;
        Tue, 10 Sep 2019 12:44:35 +0000 (UTC)
Date:   Tue, 10 Sep 2019 14:44:35 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-Id: <20190910144435.1e8af04b876e5cc7137a040e@suse.de>
In-Reply-To: <20190910113243.GA19207@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
        <20190905152150.f7ff6ef70726085de63df828@suse.de>
        <20190905133251.GA3650@rapoport-lnx>
        <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
        <20190905154747.GB3650@rapoport-lnx>
        <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
        <20190906130223.GA17704@rapoport-lnx>
        <20190909182242.c1ef9717d14b20212ef75954@suse.de>
        <20190910113243.GA19207@rapoport-lnx>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 10 Sep 2019 12:32:44 +0100
Mike Rapoport <rppt@kernel.org> wrote:

> Before we start adding printks, can you please run with
> CONFIG_DEBUG_MEMORY_INIT=y and with 
> 
> mminit_loglevel=4 ignore_loglevel
> 
> in the command line?

here we go:

Linux version 5.3.0-rc5-01209-g6ba2d3aed465 (tbogendoerfer@samweis) (gcc version 6.1.1 20160621 (Red Hat Cross 6.1.1-2) (GCC)) #776 SMP Tue Sep 10 13:51:45 CEST 2019
ARCH: SGI-IP27
PROMLIB: ARC firmware Version 64 Revision 0
Discovered 8 cpus on 4 nodes
************** Topology ********************
    00 01 02 03 
00   0  1  2  2 
01   1  0  2  2 
02   2  2  0  1 
03   2  2  1  0 
Router 0: r 1 0 r
Router 1: r 3 2 r
printk: bootconsole [early0] enabled
CPU0 revision is: 00000e23 (R12000)
FPU revision is: 00000900
Checking for the multiply/shift bug... no.
Checking for the daddiu bug... no.
IP27: Running on node 0.
Node 0 has a primary CPU, CPU is running.
Node 0 has a secondary CPU, CPU is running.
Machine is in M mode.
Determined physical RAM map:
 memory: 00000000006ec000 @ 000000000001c000 (usable)
 memory: 0000000000058000 @ 0000000000708000 (usable after init)
 memory: 000000000002f000 @ 0000000000760000 (usable)
printk: debug: ignoring loglevel setting.
REPLICATION: ON nasid 0, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 1, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 2, ktext from nasid 0, kdata from nasid 0
REPLICATION: ON nasid 3, ktext from nasid 0, kdata from nasid 0
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
Zone ranges:
  Normal   [mem 0x0000000000000000-0x000000033bffffff]
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
mminit::pageflags_layout_widths Section 20 Node 6 Zone 1 Lastcpupid 0 Flags 22
mminit::pageflags_layout_shifts Section 20 Node 6 Zone 1 Lastcpupid 0
mminit::pageflags_layout_pgshifts Section 44 Node 38 Zone 37 Lastcpupid 0
mminit::pageflags_layout_nodezoneid Node/Zone ID: 44 -> 37
mminit::pageflags_layout_usage location: 64 -> 37 layout 37 -> 22 unused 22 -> 0 page-flags
Zeroed struct page in unavailable ranges: 376832 pages
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
Initmem setup node 3 [mem 0x0000000300000000-0x000000033bffffff]
On node 3 totalpages: 131072
  Normal zone: 1792 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 131072 pages, LIFO batch:31
mminit::memmap_init Initialising map node 3 zone 0 pfns 3145728 -> 3391488
percpu: Embedded 19 pages/cpu s39584 r8192 d30048 u77824
pcpu-alloc: s39584 r8192 d30048 u77824 alloc=19*4096
pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
CPU 0 clock is 300MHz.
mminit::zonelist general 0:Normal = 0:Normal 1:Normal 2:Normal 3:Normal 
mminit::zonelist thisnode 0:Normal = 0:Normal 
mminit::zonelist general 1:Normal = 1:Normal 3:Normal 2:Normal 0:Normal 
mminit::zonelist thisnode 1:Normal = 1:Normal 
mminit::zonelist general 2:Normal = 2:Normal 3:Normal 1:Normal 0:Normal 
mminit::zonelist thisnode 2:Normal = 2:Normal 
mminit::zonelist general 3:Normal = 3:Normal 2:Normal 1:Normal 0:Normal 
mminit::zonelist thisnode 3:Normal = 3:Normal 
Built 4 zonelists, mobility grouping on.  Total pages: 646400
Policy zone: Normal
Kernel command line: root=dksc(0,1,0) ip=dhcp root=/dev/nfs mminit_loglevel=4 ignore_loglevel
printk: log_buf_len individual max cpu contribution: 4096 bytes
printk: log_buf_len total cpu_extra contributions: 28672 bytes
printk: log_buf_len min size: 32768 bytes
printk: log_buf_len: 65536 bytes
printk: early log buf free: 25360(77%)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 2550028K/2621440K available (5530K kernel code, 345K rwdata, 1196K rodata, 352K init, 186K bss, 71412K reserved, 0K cma-reserved)
rcu: Hierarchical RCU implementation.
rcu: 	RCU event tracing is enabled.
rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=8.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
NR_IRQS: 256
clocksource: HUB-RT: mask: 0xfffffffffffff max_cycles: 0x127350b88, max_idle_ns: 1763180808480 ns
sched_clock: 52 bits at 1250kHz, resolution 800ns, wraps every 4398046510800ns
Calibrating delay loop... 449.02 BogoMIPS (lpj=898048)
pid_max: default: 32768 minimum: 301
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, vmalloc)
Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, vmalloc)
Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, vmalloc)
*** VALIDATE proc ***
*** VALIDATE cgroup1 ***
*** VALIDATE cgroup2 ***
Checking for the daddi bug... no.
rcu: Hierarchical SRCU implementation.
smp: Bringing up secondary CPUs ...
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
CPU 1 clock is 300MHz.
CPU1 revision is: 00000e23 (R12000)
FPU revision is: 00000900
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
CPU 2 clock is 300MHz.
CPU2 revision is: 00000e23 (R12000)
FPU revision is: 00000900
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
CPU 3 clock is 300MHz.
CPU3 revision is: 00000e23 (R12000)
FPU revision is: 00000900
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
CPU 4 clock is 300MHz.
CPU4 revision is: 00000e23 (R12000)
FPU revision is: 00000900
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
CPU 5 clock is 300MHz.
CPU5 revision is: 00000e23 (R12000)
FPU revision is: 00000900
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
CPU 6 clock is 300MHz.
CPU6 revision is: 00000e23 (R12000)
FPU revision is: 00000900
Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
Unified secondary cache 8192kB 2-way, linesize 128 bytes.
CPU 7 clock is 300MHz.
CPU7 revision is: 00000e23 (R12000)
FPU revision is: 00000900
smp: Brought up 4 nodes, 8 CPUs
random: get_random_u32 called from bucket_table_alloc.isra.11+0x70/0x260 with crng_init=0
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
futex hash table entries: 2048 (order: 6, 262144 bytes, vmalloc)
NET: Registered protocol family 16
xtalk:n0/0 xbow widget
xtalk:n0/8 bridge widget
xtalk:n0/c bridge widget
xtalk:n1/0 xbow widget
xtalk:n2/0 xbow widget
xtalk:n3/0 xbow widget
xtalk:n3/b bridge widget
xtalk:n3/e bridge widget
SCSI subsystem initialized
clocksource: Switched to clocksource HUB-RT
NET: Registered protocol family 2
tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, vmalloc)
TCP established hash table entries: 32768 (order: 6, 262144 bytes, vmalloc)
TCP bind hash table entries: 32768 (order: 7, 524288 bytes, vmalloc)
TCP: Hash tables configured (established 32768 bind 32768)
UDP hash table entries: 2048 (order: 4, 65536 bytes, vmalloc)
UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, vmalloc)
NET: Registered protocol family 1
CPU 4 Unable to handle kernel paging request at virtual address 0000000200d0f9c0, epc == a800000000169874, ra == a8000000001697f4
Oops[#1]:
CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.3.0-rc5-01209-g6ba2d3aed465 #776
$ 0   : 0000000000000000 ffffffff94001ce0 fffffffffffffff0 0000000200d0f9b8
$ 4   : 0000000000d0f9b8 0000000000000000 000000000003bb51 a80000003bb512e8
$ 8   : 00000000000000ff a80000033bef1330 0000000000000000 a800000001bdcfa0
$12   : 0000000000000000 a800000000578838 0000000000af515d 00000000000000c0
$16   : a80000000006b230 a80000003bb512e0 ffffffff94001ce1 a8000000006d8270
$20   : a80000003bb512e8 a80000003bb512e0 a80000003b17ac00 a80000003b8064a0
$24   : 0000000000000000 0000000000780000                                  
$28   : a80000003ba10000 a80000003ba13c60 0000000000000040 a8000000001697f4
Hi    : 0000000000000000
Lo    : 0000000000000000
epc   : a800000000169874 kfree+0xac/0x1d0
ra    : a8000000001697f4 kfree+0x2c/0x1d0
Status: 94001ce2	KX SX UX KERNEL EXL 
Cause : 00008008 (ExcCode 02)
BadVA : 0000000200d0f9c0
PrId  : 00000e23 (R12000)
Modules linked in:
Process swapper/0 (pid: 1, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
Stack : a80000023bde5800 0000000000000040 a80000033bef1320 a80000000006b230
        a80000033bef1328 a80000003b8064a8 a80000003b17ac00 a80000003b8064a0
        a80000003b17ac20 a80000003b17ac10 a8000000006e0000 0000000000000000
        0000000000000006 a800000000708414 a800000000760000 a80000000006b2e8
        a80000003b17ac00 a80000000006f6ec a80000003ba13d68 a800000000733ae4
        0000000000000000 a8000000007019a8 0000000000000000 a800000000760000
        a80000000073417c a800000000745b18 a800000000737a10 a800000000760000
        0000000000000006 a800000000708414 a800000000760000 a800000000546330
        a800000000760000 0000000000000000 0000000000000000 a8000000005453e0
        fffffffffffffffc a80000033bf0a459 0000000000000000 a800000000760000
        ...
Call Trace:
[<a800000000169874>] kfree+0xac/0x1d0
[<a80000000006b230>] apply_wqattrs_prepare+0x288/0x2f8
[<a80000000006b2e8>] apply_workqueue_attrs_locked+0x48/0xb8
[<a80000000006f6ec>] alloc_workqueue+0x1ec/0x5d0
[<a800000000546330>] rpc_init_mempool+0x58/0x208
[<a800000000734190>] init_sunrpc+0x14/0xac
[<a80000000001c604>] do_one_initcall+0x54/0x250
[<a80000000070932c>] kernel_init_freeable+0x250/0x370
[<a80000000057a0e8>] kernel_init+0x10/0x1c0
[<a800000000025b08>] ret_from_kernel_thread+0x14/0x1c
Code: 00621824  000420f8  0064182d <dc620008> 30440001  6442ffff  0044180b  dc620008  30440001 

Unhandled kernel unaligned access[#2]:
---[ end trace 2ab2a60260911a25 ]---
CPU: 2 PID: 2 Comm: kthreadd Tainted: G      D           5.3.0-rc5-01209-g6ba2d3aed465 #776
$ 0   : 0000000000000000 ffffffff94001ce0 0000000000000000 0000000000000000
$ 4   : a80000003ba14000 00000000005882a0 15b6dbb727684e00 0000000000000201
CPU 4 Unable to handle kernel paging request at virtual address 00000000045185b8, epc == a8000000001682c0, ra == a800000000168abc
$ 8   : a8000000006d8000 a8000000006d8000 ffffffffffffffff 0000000000000001
$12   : ffffffff94001ce1 000000001000001e 00000000006d0000 000000000000001e
$16   : a80000003ba178c0 fffffffffc800000 15b6dbb727684000 0000000000000000
$20   : a80000000003fcd8 a80000000014c854 a80000010109ece0 0000000000000000
$24   : a80000013bdfbdc0 0000000000770000                                  
$28   : a80000003ba14000 a80000003ba17860 a80000010109ece0 a800000000026700
Hi    : fb49249256e9acb0
Lo    : 90b6db6dbb727684
epc   : a80000000002e854 do_ade+0x314/0x7d0
ra    : a800000000026700 handle_ades_int+0x2c/0x4c
Status: 94001ce3	KX SX UX KERNEL EXL IE 
Cause : 00008014 (ExcCode 05)
BadVA : 15b6dbb727684000
PrId  : 00000e23 (R12000)
Modules linked in:
Process kthreadd (pid: 2, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
Stack : 0000000000000000 0000000000000000 0000000000000000 0000000000000000
        6db6db6db6db6db7 a80000010109edc0 a800000000000000 a800000000780000
        fffffffffffffff0 a80000010109ece0 a80000010109ece0 a800000000026700
        0000000000000000 ffffffff94001ce0 0000000000000130 a80000033be1ed30
        15b6dbb727684000 0000000000000004 15b6dbb727684e00 0000000000000201
        a8000000006d8000 a8000000006d8000 ffffffffffffffff 0000000000000001
        a80000003ba17fe0 0000000000001c00 00000000006d0000 000000000000001e
        6db6db6db6db6db7 a80000010109edc0 a800000000000000 a800000000780000
        fffffffffffffff0 a80000010109ece0 a80000010109ece0 0000000000000000
        a80000013bdfbdc0 0000000000770000 0000000000000001 a8000000006d8000
        ...
Call Trace:
[<a80000000002e854>] do_ade+0x314/0x7d0
[<a800000000026700>] handle_ades_int+0x2c/0x4c
[<a80000000014c854>] kernel_init_free_pages+0xcc/0x138
[<a80000000014ca7c>] prep_new_page+0x154/0x160
[<a800000000151108>] get_page_from_freelist+0xab8/0x11c8
[<a800000000151f80>] __alloc_pages_nodemask+0x140/0xe68
[<a80000000004a360>] copy_process+0x210/0x1738
[<a80000000004ba98>] _do_fork+0x90/0x2f0
[<a80000000004bd68>] kernel_thread+0x50/0x60
[<a8000000000742f8>] kthreadd+0x180/0x208
[<a800000000025b08>] ret_from_kernel_thread+0x14/0x1c
Code: 000210f8  0202102d  dc420000 <b2420000> b6420007  24120000  5640ffd1  02002025  1000ff88 

Oops[#3]:
---[ end trace 2ab2a60260911a26 ]---
CPU: 4 PID: 1 Comm: swapper/0 Tainted: G      D           5.3.0-rc5-01209-g6ba2d3aed465 #776
$ 0   : 0000000000000000 ffffffff94001ce0 fffffffffffffff0 00000000045185b8
$ 4   : 0000000000760000 0000000000000004 000000000013bdd1 00000000006e0000
$ 8   : 0000000000780000 0000000000000000 6162326136303236 3039313161323520
$12   : 00000000006e0000 00000000006d0000 a800000000780000 0000000000780000
$16   : 0000000001484000 a80000013bdd1080 a80000023bc23380 a80000000075a640
$20   : a80000013bdd10a8 a80000003ba0d380 a80000003ba0d380 a80000003b8064a0
$24   : 0000000000000004 0000000000780000                                  
$28   : a80000003ba10000 a80000003ba13950 0000000000000001 a800000000168abc
Hi    : 0000000000000000
Lo    : 00342b42e0000000
epc   : a8000000001682c0 ___cache_free+0x120/0x540
ra    : a800000000168abc kmem_cache_free+0x4c/0x260
Status: 94001ce2	KX SX UX KERNEL EXL 
Cause : 00008008 (ExcCode 02)
BadVA : 00000000045185b8
PrId  : 00000e23 (R12000)
Modules linked in:
Process swapper/0 (pid: 1, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
Stack : ffffffff94001ce1 0000000000000001 0000000000000000 0000000000000000
        00000000000000f4 a80000013bdd1080 a80000000019a13c ffffffff94001ce1
        0000000000000001 a80000013bdd10a8 a80000003ba0d380 a80000003ba0d380
        a80000003b8064a0 a800000000168abc a80000023bc23380 0000000000000000
        0000000000000000 0000000000000040 a80000013bdd1080 a80000000019a13c
        000000003ba13b30 0000000000000000 0000000000000000 000000000000000b
        a80000003ba13b30 0000000000000000 0000000000000000 a80000000004fb24
        0000000000000001 a8000000000a6cc4 a80000003ba13a68 0000000000000000
        0000000000000000 0000000000000000 a800000000768420 000000000000000b
        a80000003ba13b30 a80000000063c7c0 0000000000000000 a80000003bb512e0
        ...
Call Trace:
[<a8000000001682c0>] ___cache_free+0x120/0x540
[<a800000000168abc>] kmem_cache_free+0x4c/0x260
[<a80000000019a13c>] put_files_struct+0x11c/0x140
[<a80000000004fb24>] do_exit+0x6d4/0xaf0
[<a80000000002c494>] die+0x154/0x188
[<a80000000003cde8>] do_page_fault+0x578/0x580
[<a800000000042eb4>] tlb_do_page_fault_0+0x124/0x12c
[<a8000000001697f4>] kfree+0x2c/0x1d0
[<a80000000006b230>] apply_wqattrs_prepare+0x288/0x2f8
[<a80000000006b2e8>] apply_workqueue_attrs_locked+0x48/0xb8
[<a80000000006f6ec>] alloc_workqueue+0x1ec/0x5d0
[<a800000000546330>] rpc_init_mempool+0x58/0x208
[<a800000000734190>] init_sunrpc+0x14/0xac
[<a80000000001c604>] do_one_initcall+0x54/0x250
[<a80000000070932c>] kernel_init_freeable+0x250/0x370
[<a80000000057a0e8>] kernel_init+0x10/0x1c0
[<a800000000025b08>] ret_from_kernel_thread+0x14/0x1c
Code: 000318f8  0064182d  3c040076 <dc740000> 3c03a800  64844090  00051078  64630000  0045102d 

---[ end trace 2ab2a60260911a27 ]---
Fixing recursive fault but reboot is needed!
CPU 1 Unable to handle kernel paging request at virtual address 0000000200cf6f18, epc == a8000000001682c0, ra == a800000000168abc
CPU 3 Unable to handle kernel paging request at virtual address 0000000004519ff8, epc == a8000000001682c0, ra == a800000000168abc
CPU 2 Unable to handle kernel paging request at virtual address 0000000004519ff8, epc == a8000000001682c0, ra == a800000000168abc
Oops[#4]:
CPU 7 Unable to handle kernel paging request at virtual address 000000000b518510, epc == a8000000001682c0, ra == a800000000168abc
CPU 6 Unable to handle kernel paging request at virtual address 000000000b518510, epc == a8000000001682c0, ra == a800000000168abc
CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D           5.3.0-rc5-01209-g6ba2d3aed465 #776
$ 0   : 0000000000000000 ffffffff94001ce0 fffffffffffffff0 0000000004519ff8
$ 4   : 0000000000760000 0000000000000003 000000000013be49 00000000006e0000
$ 8   : 0000000000780000 00000000006d0000 00000000006d0000 0000000000000000
$12   : 0000000000000002 a800000000578834 0000000000000001 0000000000000001
$16   : 0000000001471000 a80000013be49e00 a80000003b851c00 a8000000007597f0
$20   : ffffffff94001ce1 a8000000006b8148 0000000000000010 a8000000006b8140
$24   : a8000000006e28e8 a800000000330a90                                  
$28   : a80000013bde0000 a80000003b823e00 0000000000000002 a800000000168abc
Hi    : 0000000000000000
Lo    : 0000000000000000
epc   : a8000000001682c0 ___cache_free+0x120/0x540
ra    : a800000000168abc kmem_cache_free+0x4c/0x260
Status: 94001ce2	KX SX UX KERNEL EXL 
Cause : 00008008 (ExcCode 02)
BadVA : 0000000004519ff8
PrId  : 00000e23 (R12000)
Modules linked in:
Process swapper/3 (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
Stack : a800000001bb95e0 0000000000000003 0000000000000000 a80000003b823e70
        0000000000000000 a80000013be49e00 a8000000000be054 ffffffff94001ce1
        a800000001bc24d0 ffffffff94001ce1 a8000000006b8148 0000000000000010
        a8000000006b8140 a800000000168abc a80000003b851c00 a8000000000bd2a4
        a800000001bc2480 000000000000000a a8000000006e4000 a8000000000be054
        a80000013bfe6800 a80000013bfe6800 ffffffffffffffff 0000000000000000
        0000000000000009 a8000000006d8000 a8000000006b8100 0000000000000002
        0000000000000100 a8000000006b8148 0000000000000010 a800000000580d0c
        0000000958568600 a8000000007485a8 a800000000750080 000000000000000a
        a80000000063e170 a8000000005893b0 a800000000748538 00000000fffee4de
        ...
Call Trace:
[<a8000000001682c0>] ___cache_free+0x120/0x540
[<a800000000168abc>] kmem_cache_free+0x4c/0x260
[<a8000000000be054>] rcu_core+0x434/0x5c8
[<a800000000580d0c>] __do_softirq+0x26c/0x470
[<a800000000051be8>] irq_exit+0xd8/0xe0
[<a800000000330c00>] plat_irq_dispatch+0xc8/0x118
[<a800000000025ed0>] handle_int+0x160/0x16c
[<a800000000578928>] arch_local_irq_restore+0x18/0x20
Code: 000318f8  0064182d  3c040076 <dc740000> 3c03a800  64844090  00051078  64630000  0045102d 

Oops[#5]:
---[ end trace 2ab2a60260911a28 ]---
CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D           5.3.0-rc5-01209-g6ba2d3aed465 #776
$ 0   : 0000000000000000 ffffffff94001ce0 fffffffffffffff0 0000000004519ff8
Kernel panic - not syncing: Fatal exception in interrupt
$ 4   : 0000000000760000 0000000000000002 000000000013be49 00000000006e0000
------------[ cut here ]------------
$ 8   : 0000000000780000 00000000006d0000 00000000006d0000 0000000000000000
WARNING: CPU: 3 PID: 0 at /home/tbogendoerfer/wip/mips/linux/kernel/smp.c:433 smp_call_function_many+0x488/0x4f8
Modules linked in:
$12   : 0000000000000002 a800000000578834 0000000000000001 0000000000000001
CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D           5.3.0-rc5-01209-g6ba2d3aed465 #776
$16   : 000000000145e000 a80000013be49d00 a80000003b851c00 a8000000007597f0
Stack : ffffffff94001ce0 ffffffff94001ce0 0000000000000000 0000000000790000
$20   : ffffffff94001ce1 0000000000000004 0000000000000000 a8000000006b8140
        0000000000000000 0000000000000000 a800000000790000 a800000000771618
$24   : 0000000000000004 a800000000330a90                                  
        a80000000003c090 0000000000000000 0000000000000030 0000000000000001
$28   : a80000013bddc000 a80000003b81fe00 0000000000000002 a800000000168abc
        00000000006e0000 00000000006d0000 a800000000780000 0000000000780000
Hi    : 0000000000000000
Lo    : 0000000000000000
        0000000000000000 ffffffffffffffff ffffffff94001ce0 a800000000700000
epc   : a8000000001682c0 ___cache_free+0x120/0x540
ra    : a800000000168abc kmem_cache_free+0x4c/0x260
        00000000000001b1 0000000000000000 a8000000000309e8 0000000000000000
Status: 94001ce2	KX SX UX KERNEL EXL 
        0000000000000010 0000000000780000 0000000000000018 a800000000760018
Cause : 00008008 (ExcCode 02)
BadVA : 0000000004519ff8
        a80000013bde0000 a80000003b823980 a8000000006d0000 a80000000055f684
PrId  : 00000e23 (R12000)
Modules linked in:
        0000000000000000 0000000000000000 0000000000000000 ffffffff94001ce0
Process swapper/2 (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
Stack : a800000001ba65e0 0000000000000002 0000000000000000 a80000003b81fe70
        a800000000700000 a80000000002c1c4 0000000000000000 a80000000055f684
        0000000000000400 a80000013be49d00 a8000000000be054 ffffffff94001ce1
        ...
        a800000001baf4d0 ffffffff94001ce1 0000000000000004 0000000000000000
Call Trace:
[<a80000000002c1c4>] show_stack+0x94/0x138
        a8000000006b8140 a800000000168abc a80000003b851c00 a8000000006e4000
[<a80000000055f684>] dump_stack+0xb4/0xf0
        a800000001baf480 000000000000000a a8000000006e4000 a8000000000be054
[<a80000000004cc14>] __warn+0x14c/0x170
        a80000013bffbb80 a80000013bffbb80 ffffffffffffffff 0000000000000000
[<a8000000000dd200>] smp_call_function_many+0x488/0x4f8
        0000000000000009 a8000000006d8000 a8000000006b8100 0000000000000002
[<a8000000000dd2a8>] smp_call_function+0x38/0x48
        0000000000000100 a8000000006b8148 0000000000000010 a800000000580d0c
[<a80000000004cea4>] panic+0x174/0x410
        0000000958568600 a8000000007485a8 a800000000750080 000000000000000a
[<a80000000002c4b0>] die+0x170/0x188
 [<<aa8800000000000000000033ccddee88>>]]  ddoo__ppaaggee__ffaauulltt++00xx557788//00xx558800

 0 00 0 0  74 8 .53.8. 
00[<00a08000000f00ff00e0e404de2eb
C4>a]l l tlTrb_acdoe:_pa
g[<raee80+00x00102000/001x658420c
0>0]x 1_2_c_c
[ac<aac8h00e_00fr0e00e+010x684ca/bc0x>2] 60k[me<am8_0c0ac00h0e_00fr01e6e+8a0xbc4>c/] 0kxm2e60m_c
a-a-2-[9  ]e-nd- -t
r0axce4c 2/0axb22a60602
[6<_cao80re0+000x04003400/0beRseebocoontidsn.g. i
nc 1or ese+0cox4n3d4s/..0x5
c8
[<a800000000580d0c>] __do_softirq+0x26c/0x470
[<a800000000051be8>] irq_exit+0xd8/0xe0
[<a800000000330c00>] plat_irq_dispatch+0xc8/0x118
[<a800000000025ed0>] handle_int+0x160/0x16c
[<a800000000578928>] arch_local_irq_restore+0x18/0x20
Code: 000318f8  0064182d  3c040076 <dc740000> 3c03a800  64844090  00051078  64630000  0045102d 

Oops[#6]:
CPU: 7 PID: 0 Comm: swapper/7 Tainted: G      D W         5.3.0-rc5-01209-g6ba2d3aed465 #776
$ 0   : 0000000000000000 ffffffff94001ce0 fffffffffffffff0 000000000b518510
$ 4   : 0000000000760000 0000000000000007 000000000033bdce 00000000006e0000
$ 8   : 0000000000780000 00000000006d0000 00000000006d0000 0000000000000000
$12   : 0000000000000002 a800000000578834 0000000000000001 0000000000000001
$16   : 00000000014bd000 a80000033bdcef80 a80000003b851c00 a8000000007597f0
$20   : ffffffff94001ce1 a8000000006b8148 0000000000000010 a8000000006b8140
$24   : a8000003010c4050 a800000000330a90  R  e b o ot    s t a r t e d  f  r om   C  P U   3  
     
$28   : a80000033be08000 a80000003b833e00 0000000000000002 a800000000168abc
Hi    : 0000000000000000
Lo    : 0000000000000000
epc   : a8000000001682c0 ___cache_free+0x120/0x540
ra    : a800000000168abc kmem_cache_free+0x4c/0x260
Status: 94001ce2	KX SX UX KERNEL EXL 
Cause : 00008008 (ExcCode 02)
BadVA : 000000000b518510
PrId  : 00000e23 (R12000)
Modules linked in:
Process swapper/7 (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
Stack : a800000001c055e0 0000000000000007 0000017e00000000 a80000003b833e70
        0000000000000000 a80000033bdcef80 a8000000000be054 ffffffff94001ce1
        a800000001c0e4d0 ffffffff94001ce1 a8000000006b8148 0000000000000010
        a8000000006b8140 a800000000168abc a80000003b851c00 a800000000075b34
        a800000001c0e480 000000000000000a a8000000006e4000 a8000000000be054
        a80000033bef9768 a80000033bef9468 ffffffffffffffff 0000000000000000
        0000000000000009 a8000000006d8000 a8000000006b8100 0000000000000002
        0000000000000100 a8000000006b8148 0000000000000010 a800000000580d0c
        0000000958d09800 a8000000007485a8 a800000000750080 000000000000000a
        a80000000063e170 a8000000005893b0 a800000000748538 00000000fffee4e0
        ...
Call Trace:
[<a8000000001682c0>] ___cache_free+0x120/0x540
[<a800000000168abc>] kmem_cache_free+0x4c/0x260
[<a8000000000be054>] rcu_core+0x434/0x5c8
[<a800000000580d0c>] __do_softirq+0x26c/0x470
[<a800000000051be8>] irq_exit+0xd8/0xe0
[<a800000000330c00>] plat_irq_dispatch+0xc8/0x118
[<a800000000025ed0>] handle_int+0x160/0x16c
[<a800000000578928>] arch_local_irq_restore+0x18/0x20
Code: 000318f8  0064182d  3c040076 <dc740000> 3c03a800  64844090  00051078  64630000  0045102d 

Oops[#7]:
CPU: 6 PID: 0 Comm: swapper/6 Tainted: G      D W         5.3.0-rc5-01209-g6ba2d3aed465 #776
$ 0   : 0000000000000000 ffffffff94001ce0 fffffffffffffff0 000000000b518510
$ 4   : 0000000000760000 0000000000000006 000000000033bdce 00000000006e0000
$ 8   : 0000000000780000 00000000006d0000 00000000006d0000 0000000000000000
$12   : 0000000000000002 a800000000578834 0000000000000001 0000000000000001
$16   : 00000000014aa000 a80000033bdce380 a80000003b851c00 a8000000007597f0
$20   : ffffffff94001ce1 a8000000006b8148 0000000000000010 a8000000006b8140
$24   : 0000000000000000 a800000000330a90                                  
$28   : a80000033be00000 a80000003b82fe00 0000000000000002 a800000000168abc
Hi    : 0000000000000000
Lo    : 0000000000000000
epc   : a8000000001682c0 ___cache_free+0x120/0x540
ra    : a800000000168abc kmem_cache_free+0x4c/0x260
Status: 94001ce2	KX SX UX KERNEL EXL 
Cause : 0000c008 (ExcCode 02)
BadVA : 000000000b518510
PrId  : 00000e23 (R12000)
Modules linked in:
Process swapper/6 (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
Stack : a800000001bf25e0 fffffffffffffb68 0000017d01bfb4d0 a8000000000bc770
        0000000000000000 a80000033bdce380 a8000000000be054 ffffffff94001ce1
        a800000001bfb4d0 ffffffff94001ce1 a8000000006b8148 0000000000000010
        a8000000006b8140 a800000000168abc a80000003b851c00 a800000000075b34
        a800000001bfb480 000000000000000a a8000000006e4000 a8000000000be054
        a80000033bdce268 a80000033bf4f200 ffffffffffffffff 0000000000000000
        0000000000000009 a8000000006d8000 a8000000006b8100 0000000000000002
        0000000000000100 a8000000006b8148 0000000000000010 a800000000580d0c
        00000009590da100 a8000000007485a8 a800000000750080 000000000000000a
        a80000000063e170 a8000000005893b0 a800000000748538 00000000fffee4e1
        ...
Call Trace:
[<a8000000001682c0>] ___cache_free+0x120/0x540
[<a800000000168abc>] kmem_cache_free+0x4c/0x260
[<a8000000000be054>] rcu_core+0x434/0x5c8
[<a800000000580d0c>] __do_softirq+0x26c/0x470
[<a800000000051be8>] irq_exit+0xd8/0xe0
[<a800000000330c00>] plat_irq_dispatch+0xc8/0x118
[<a800000000025ed0>] handle_int+0x160/0x16c
[<a800000000080b28>] do_idle+0x128/0x1e8
[<a800000000080eec>] cpu_startup_entry+0x2c/0x40
Code: 000318f8  0064182d  3c040076 <dc740000> 3c03a800  64844090  00051078  64630000  0045102d 

Oops[#8]:
CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D W         5.3.0-rc5-01209-g6ba2d3aed465 #776
$ 0   : 0000000000000000 ffffffff94001ce0 fffffffffffffff0 0000000200cf6f18
$ 4   : 0000000000760000 0000000000000001 000000000003b445 00000000006e0000
$ 8   : 0000000000780000 00000000006d0000 00000000006d0000 0000000000000000
$12   : 0000000000000002 a800000000578834 0000000000000001 0000000000000001
$16   : 000000000144b000 a80000003b445f00 a80000013bc21980 c00000fefeb30b70
$20   : ffffffff94001ce1 a8000000006b8148 0000000000000010 a8000000006b8140
$24   : 0000000000000000 a800000000330a90                                  
$28   : a80000003ba5c000 a80000003b81be00 0000000000000002 a800000000168abc
Hi    : 0000000000000000
Lo    : 0000000000000000
epc   : a8000000001682c0 ___cache_free+0x120/0x540
ra    : a800000000168abc kmem_cache_free+0x4c/0x260
Status: 94001ce2	KX SX UX KERNEL EXL 
Cause : 00008008 (ExcCode 02)
BadVA : 0000000200cf6f18
PrId  : 00000e23 (R12000)
Modules linked in:
Process swapper/1 (pid: 0, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
Stack : a800000001b935e0 fffffffffffffb68 a800000001b9c4d0 a8000000000bc770
        0000000000000000 a80000003b445f00 a8000000000be054 ffffffff94001ce1
        a800000001b9c4d0 ffffffff94001ce1 a8000000006b8148 0000000000000010
        a8000000006b8140 a800000000168abc a80000013bc21980 a8000000000bd2a4
        a800000001b9c480 000000000000000a a8000000006e4000 a8000000000be054
        a80000003b263be8 a80000003b266a00 ffffffffffffffff 0000000000000000
        0000000000000009 a8000000006d8000 a8000000006b8100 0000000000000002
        0000000000000100 a8000000006b8148 0000000000000010 a800000000580d0c
        0000000958568600 a8000000007485a8 a800000000750080 000000000000000a
        a80000000063e170 a8000000005893b0 a800000000748538 00000000fffee4de
        ...
Call Trace:
[<a8000000001682c0>] ___cache_free+0x120/0x540
[<a800000000168abc>] kmem_cache_free+0x4c/0x260
[<a8000000000be054>] rcu_core+0x434/0x5c8
[<a800000000580d0c>] __do_softirq+0x26c/0x470
[<a800000000051be8>] irq_exit+0xd8/0xe0
[<a800000000330c00>] plat_irq_dispatch+0xc8/0x118
[<a800000000025ed0>] handle_int+0x160/0x16c
[<a800000000080b28>] do_idle+0x128/0x1e8
[<a800000000080eec>] cpu_startup_entry+0x2c/0x40
Code: 000318f8  0064182d  3c040076 <dc740000> 3c03a800  64844090  00051078  64630000  0045102d 

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
