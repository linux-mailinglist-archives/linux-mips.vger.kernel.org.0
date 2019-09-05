Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1219AA7A5
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 17:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387610AbfIEPr5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 11:47:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:37962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733082AbfIEPrz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Sep 2019 11:47:55 -0400
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4239F207E0;
        Thu,  5 Sep 2019 15:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567698474;
        bh=jcOwFPwdXs+7Xuxqb+Q8wlapMVsrYBiHXwDmvfpppqk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oJmC3KUAaoxK54ycXpqsHIe90UF9NQUEEw84u2inV+c+laihBck+UbCgv8IsWR7JA
         Cp0oaBVX9YHrCNgvgMCc7ENLYi/GOv2xXs/LbWWiadRM9Qc5jygy28fmwEnEyVF1UJ
         DD7goZTffEEHphaEls5FyM1Jo5ebqb3YqoDoTLpA=
Date:   Thu, 5 Sep 2019 18:47:49 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190905154747.GB3650@rapoport-lnx>
References: <1567662477-27404-1-git-send-email-rppt@kernel.org>
 <20190905152150.f7ff6ef70726085de63df828@suse.de>
 <20190905133251.GA3650@rapoport-lnx>
 <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 05, 2019 at 03:48:31PM +0200, Thomas Bogendoerfer wrote:
> On Thu, 5 Sep 2019 16:32:53 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > On Thu, Sep 05, 2019 at 03:21:50PM +0200, Thomas Bogendoerfer wrote:
> > > On Thu,  5 Sep 2019 08:47:57 +0300
> > > Mike Rapoport <rppt@kernel.org> wrote:
> > > 
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > The memory initialization of SGI-IP27 is already half-way to support
> > > > SPARSEMEM and only a call to sparse_init() was missing. Add it to
> > > > prom_meminit() and adjust arch/mips/Kconfig to enable SPARSEMEM and
> > > > SPARSEMEM_EXTREME for SGI-IP27
> > > > 
> > > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > > ---
> > > > 
> > > > Thomas, could you please test this on your Origin machine?
> > > 
> > > it crashes in sparse_early_usemaps_alloc_pgdat_section(). Since there is
> > > already a sparse_init() in arch_mem_setup() I removed it from ip27-memory.c.
> > 
> > Oops, missed that.
> > 
> > > With this booting made more progress but I get an unaligned access in
> > > kernel_init_free_pages(). 
> > 
> > Can you please share the log?
> 
> sure

Nothing looked particularly suspicious, but I've found that I've missed the
definition of pfn_to_nid() is for DISCONTIGMEM only, maybe making it
available for SPARSE would help :)

I'm pretty much shooting in the dark here, but can you please try the patch
below on top of the original one:

diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
index b826b84..273290e 100644
--- a/arch/mips/include/asm/mmzone.h
+++ b/arch/mips/include/asm/mmzone.h
@@ -20,10 +20,10 @@
 #define nid_to_addrbase(nid) 0
 #endif
 
-#ifdef CONFIG_DISCONTIGMEM
+/* #ifdef CONFIG_DISCONTIGMEM */
 
 #define pfn_to_nid(pfn)		pa_to_nid((pfn) << PAGE_SHIFT)
 
-#endif /* CONFIG_DISCONTIGMEM */
+/* #endif /\* CONFIG_DISCONTIGMEM *\/ */
 
 #endif /* _ASM_MMZONE_H_ */
 
> Linux version 5.3.0-rc5-01209-gad9238e45ea0-dirty (tbogendoerfer@samweis) (gcc version 6.1.1 20160621 (Red Hat Cross 6.1.1-2) (GCC)) #759 SMP Thu Sep 5 15:04:55 CEST 2019
> ARCH: SGI-IP27
> PROMLIB: ARC firmware Version 64 Revision 0
> Discovered 8 cpus on 4 nodes
> ************** Topology ********************
>     00 01 02 03 
> 00   0  1  2  2 
> 01   1  0  2  2 
> 02   2  2  0  1 
> 03   2  2  1  0 
> Router 0: r 1 0 r
> Router 1: r 3 2 r
> printk: bootconsole [early0] enabled
> CPU0 revision is: 00000e23 (R12000)
> FPU revision is: 00000900
> Checking for the multiply/shift bug... no.
> Checking for the daddiu bug... no.
> IP27: Running on node 0.
> Node 0 has a primary CPU, CPU is running.
> Node 0 has a secondary CPU, CPU is running.
> Machine is in M mode.
> Determined physical RAM map:
>  memory: 00000000006ec000 @ 000000000001c000 (usable)
>  memory: 0000000000058000 @ 0000000000708000 (usable after init)
>  memory: 000000000002f000 @ 0000000000760000 (usable)
> sparse init
> REPLICATION: ON nasid 0, ktext from nasid 0, kdata from nasid 0
> REPLICATION: ON nasid 1, ktext from nasid 0, kdata from nasid 0
> REPLICATION: ON nasid 2, ktext from nasid 0, kdata from nasid 0
> REPLICATION: ON nasid 3, ktext from nasid 0, kdata from nasid 0
> Primary instruction cache 32kB, VIPT, 2-way, linesize 64 bytes.
> Primary data cache 32kB, 2-way, VIPT, no aliases, linesize 32 bytes
> Unified secondary cache 8192kB 2-way, linesize 128 bytes.
> Zone ranges:
>   Normal   [mem 0x0000000000000000-0x000000035bffffff]
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x0000000000000000-0x0000000023ffffff]
>   node   0: [mem 0x0000000028000000-0x000000002bffffff]
>   node   0: [mem 0x0000000030000000-0x0000000033ffffff]
>   node   0: [mem 0x0000000038000000-0x000000003bffffff]
>   node   1: [mem 0x0000000100000000-0x0000000123ffffff]
>   node   1: [mem 0x0000000128000000-0x000000012bffffff]
>   node   1: [mem 0x0000000130000000-0x0000000133ffffff]
>   node   1: [mem 0x0000000138000000-0x000000013bffffff]
>   node   2: [mem 0x0000000200000000-0x0000000203ffffff]
>   node   2: [mem 0x0000000208000000-0x000000020bffffff]
>   node   2: [mem 0x0000000210000000-0x0000000213ffffff]
>   node   2: [mem 0x0000000218000000-0x000000021bffffff]
>   node   2: [mem 0x0000000220000000-0x0000000223ffffff]
>   node   2: [mem 0x0000000228000000-0x000000022bffffff]
>   node   2: [mem 0x0000000230000000-0x0000000233ffffff]
>   node   2: [mem 0x0000000238000000-0x000000023bffffff]
>   node   3: [mem 0x0000000300000000-0x0000000303ffffff]
>   node   3: [mem 0x0000000308000000-0x000000030bffffff]
>   node   3: [mem 0x0000000310000000-0x0000000313ffffff]
>   node   3: [mem 0x0000000318000000-0x000000031bffffff]
>   node   3: [mem 0x0000000320000000-0x0000000323ffffff]
>   node   3: [mem 0x0000000328000000-0x000000032bffffff]
>   node   3: [mem 0x0000000330000000-0x0000000333ffffff]
>   node   3: [mem 0x0000000338000000-0x000000033bffffff]
>   node   3: [mem 0x0000000340000000-0x0000000343ffffff]
>   node   3: [mem 0x0000000348000000-0x000000034bffffff]
>   node   3: [mem 0x0000000350000000-0x0000000353ffffff]
>   node   3: [mem 0x0000000358000000-0x000000035bffffff]
> Zeroed struct page in unavailable ranges: 442368 pages
> Initmem setup node 0 [mem 0x0000000000000000-0x000000003bffffff]
> Initmem setup node 1 [mem 0x0000000100000000-0x000000013bffffff]
> Initmem setup node 2 [mem 0x0000000200000000-0x000000023bffffff]
> Initmem setup node 3 [mem 0x0000000300000000-0x000000035bffffff]
> percpu: Embedded 19 pages/cpu s39584 r8192 d30048 u77824
> CPU 0 clock is 300MHz.
> Built 4 zonelists, mobility grouping on.  Total pages: 711040
> Policy zone: Normal
> Kernel command line: root=dksc(0,1,0) ip=dhcp root=/dev/nfs
> printk: log_buf_len individual max cpu contribution: 4096 bytes
> printk: log_buf_len total cpu_extra contributions: 28672 bytes
> printk: log_buf_len min size: 32768 bytes
> printk: log_buf_len: 65536 bytes
> printk: early log buf free: 26584(81%)
> mem auto-init: stack:off, heap alloc:off, heap free:off
> Memory: 2803980K/2883584K available (5527K kernel code, 347K rwdata, 1196K rodata, 352K init, 186K bss, 79604K reserved, 0K cma-reserved)
> rcu: Hierarchical RCU implementation.
> rcu: 	RCU event tracing is enabled.
> rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=8.
> rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
> NR_IRQS: 256
> clocksource: HUB-RT: mask: 0xfffffffffffff max_cycles: 0x127350b88, max_idle_ns: 1763180808480 ns
> sched_clock: 52 bits at 1250kHz, resolution 800ns, wraps every 4398046510800ns
> Calibrating delay loop... 449.02 BogoMIPS (lpj=898048)
> io scheduler mq-deadline registered
> Unhandled kernel unaligned access[#1]:
> CPU: 1 PID: 52 Comm: kworker/u17:1 Not tainted 5.3.0-rc5-01209-gad9238e45ea0-dirty #759
> Workqueue: events_unbound call_usermodehelper_exec_work
> $ 0   : 0000000000000000 ffffffff94001ce0 0000000000000000 0000000000000000
> $ 4   : a80000003bb4c000 00000000005882b0 15b6db6e4b198e00 0000000000000201
> $ 8   : a8000000006d8000 a8000000006d8000 ffffffffffffffff ffffffffffffff7f
> $12   : ffffffff94001ce1 000000001000001e 0000000000000002 0000000000000000
> $16   : a80000003bb4f800 fffffffffc800000 15b6db6e4b198000 0000000000000000
> $20   : a80000000003fcb8 a80000000014c554 a80000000206d940 0000000000000000
> $24   : 0000000000000000 0000000000770000                                  
> $28   : a80000003bb4c000 a80000003bb4f7a0 a80000000206d940 a800000000026700
> Hi    : fb49249249405dec
> Lo    : 90b6db6db6e4b198
> epc   : a80000000002e824 do_ade+0x314/0x7d0
> ra    : a800000000026700 handle_ades_int+0x2c/0x4c
> Status: 94001ce3	KX SX UX KERNEL EXL IE 
> Cause : 00008014 (ExcCode 05)
> BadVA : 15b6db6e4b198000
> PrId  : 00000e23 (R12000)
> Modules linked in:
> Process kworker/u17:1 (pid: 52, threadinfo=(____ptrval____), task=(____ptrval____), tls=0000000000000000)
> Stack : 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>         6db6db6db6db6db7 a80000000206da20 a800000000000000 a800000000780000
>         fffffffffffffff0 a80000000206d940 a80000000206d940 a800000000026700
>         0000000000000000 ffffffff94001ce0 0000000000000030 a80000003bb51c90
>         15b6db6e4b198000 0000000000000004 15b6db6e4b198e00 0000000000000201
>         a8000000006d8000 a8000000006d8000 ffffffffffffffff ffffffffffffff7f
>         a80000000206da28 a80000000078f110 0000000000000002 0000000000000000
>         6db6db6db6db6db7 a80000000206da20 a800000000000000 a800000000780000
>         fffffffffffffff0 a80000000206d940 a80000000206d940 0000000000000000
>         0000000000000000 0000000000770000 0000000000000001 a8000000006d8000
>         ...
> Call Trace:
> [<a80000000002e824>] do_ade+0x314/0x7d0
> [<a800000000026700>] handle_ades_int+0x2c/0x4c
> [<a80000000014c554>] kernel_init_free_pages+0xcc/0x138
> [<a80000000014c77c>] prep_new_page+0x154/0x160
> [<a800000000150e08>] get_page_from_freelist+0xab8/0x11c8
> [<a800000000151c80>] __alloc_pages_nodemask+0x140/0xe68
> [<a80000000004a338>] copy_process+0x210/0x1728
> [<a80000000004ba60>] _do_fork+0x90/0x2e8
> [<a80000000004bd28>] kernel_thread+0x50/0x60
> [<a800000000066540>] call_usermodehelper_exec_work+0x40/0x100
> [<a80000000006bb0c>] process_one_work+0x25c/0x4c0
> [<a80000000006bf30>] worker_thread+0x1c0/0x690
> [<a800000000072da8>] kthread+0x148/0x178
> [<a800000000025b08>] ret_from_kernel_thread+0x14/0x1c
> Code: 000210f8  0202102d  dc420000 <b2420000> b6420007  24120000  5640ffd1  02002025  1000ff88 
> 
> Unhandled kernel unaligned access[#2]:
> ---[ end trace 8dd03d5368f266cc ]---
> 
> -- 
> SUSE Software Solutions Germany GmbH
> HRB 247165 (AG München)
> Geschäftsführer: Felix Imendörffer

-- 
Sincerely yours,
Mike.
