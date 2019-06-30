Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEFCA5AE94
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2019 07:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbfF3FBU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Jun 2019 01:01:20 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43061 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbfF3FBT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Jun 2019 01:01:19 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1hhRxl-0007q6-3n; Sun, 30 Jun 2019 07:01:17 +0200
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1hhRxh-00010K-Jn; Sun, 30 Jun 2019 07:01:13 +0200
Date:   Sun, 30 Jun 2019 07:01:13 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Yafang Shao <laoar.shao@gmail.com>, linux-mips@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: MIPS: ath79: regression after patch: sched/fair: do not expose
 some tracepoints to user if CONFIG_SCHEDSTATS is not set
Message-ID: <20190630050113.tw6nhflejq2ve3k6@pengutronix.de>
References: <20190613063057.szrvmvpauzagxf62@pengutronix.de>
 <CALOAHbBd2nv=qAy4b4rP_vxtsTAc-eLrozfzzyVhXVQXrpMvtg@mail.gmail.com>
 <CALOAHbCp_=_W_0jxkXmvb1b_CTEi_B45DOipM20mWPcYUWQamw@mail.gmail.com>
 <20190613160214.7df3tnfgtexvdy3y@pengutronix.de>
 <CALOAHbAMNNL6=-Mw5KTZSL0B-it-jGByqY_65iCjH+vAshYRxA@mail.gmail.com>
 <20190614083419.stgronjpyglnxjbo@pengutronix.de>
 <CALOAHbBLK=sQS+OyOOaEh=Ef-BKjrJ9TGC64EaypzktbnH=BLg@mail.gmail.com>
 <20190626083748.07c1f204@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626083748.07c1f204@gandalf.local.home>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:54:04 up 43 days, 11:12, 45 users,  load average: 0.00, 0.00,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 26, 2019 at 08:37:48AM -0400, Steven Rostedt wrote:

Hi,

> 
> Sorry for the late response, I was on PTO.
> 
> On Mon, 17 Jun 2019 10:04:46 +0800
> Yafang Shao <laoar.shao@gmail.com> wrote:
> 
> > On Fri, Jun 14, 2019 at 4:34 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> > >
> > > On Fri, Jun 14, 2019 at 01:56:04PM +0800, Yafang Shao wrote:  
> > > > On Fri, Jun 14, 2019 at 12:02 AM Oleksij Rempel <o.rempel@pengutronix.de> wrote:  
> > > > >
> > > > > On Thu, Jun 13, 2019 at 04:12:57PM +0800, Yafang Shao wrote:  
> > > > > > On Thu, Jun 13, 2019 at 4:08 PM Yafang Shao <laoar.shao@gmail.com> wrote:  
> > > > > > >
> > > > > > > On Thu, Jun 13, 2019 at 2:30 PM Oleksij Rempel <o.rempel@pengutronix.de> wrote:  
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > After patch:
> > > > > > > > -----------------------------------------------------
> > > > > > > > commit 2a09b5de235a6b5f76193a2ed46546a2944f98bf
> > > > > > > > Author: Yafang Shao <laoar.shao@gmail.com>
> > > > > > > > Date:   Tue Mar 26 20:13:10 2019 +0800
> > > > > > > >     sched/fair: do not expose some tracepoints to user if CONFIG_SCHEDSTATS is not set
> > > > > > > >
> > > > > > > >     The tracepoints trace_sched_stat_{iowait, blocked, wait, sleep} should
> > > > > > > >     be not exposed to user if CONFIG_SCHEDSTATS is not set.
> > > > > > > >
> > > > > > > >     Link: http://lkml.kernel.org/r/1553602391-11926-3-git-send-email-laoar.shao@gmail.com
> > > > > > > >
> 
> This commit should not modify the function tracing (mcount) code.
> 
> Trace events and function tracing are two separate systems, that do not
> rely on each other.
> 
> > > > > > > >     Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > > > > > >     Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > > > > > >     Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> > > > > > > > -----------------------------------------------------
> > > > > > > >
> > > > > > > > i can't boot kernel on MIPS based system Atheros ar9331. The boot
> > > > > > > > process ends with following oops:
> > > > > > > > -----------------------------------------------------
> > > > > > > > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16256                                                                                                [0/1518]
> > > > > > > > [    0.000000] Kernel command line:   ip=dhcp root=/dev/nfs nfsroot=192.168.23.4:/home/ore/nfsroot/dpt-module,v3,tcp
> > > > > > > > [    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> > > > > > > > [    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> > > > > > > > [    0.000000] Writing ErrCtl register=00000000
> > > > > > > > [    0.000000] Readback ErrCtl register=00000000
> > > > > > > > [    0.000000] Memory: 56376K/65536K available (5376K kernel code, 437K rwdata, 1068K rodata, 1432K init, 214K bss, 9160K reserved, 0K cma-reserved)
> > > > > > > > [    0.000000] random: get_random_u32 called from cache_random_seq_create+0x9c/0x170 with crng_init=0
> > > > > > > > [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> > > > > > > > [    0.000000] ftrace: allocating 18167 entries in 36 pages
> > > > > > > > [    0.000000] CPU 0 Unable to handle kernel paging request at virtual address 00000000, epc == 00000000, ra == 00000000
> > > > > > > > [    0.000000] Oops[#1]:
> > > > > > > > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.0-rc4+ #308
> > > > > > > > [    0.000000] $ 0   : 00000000 8007e5fc 00000003 00000002
> > > > > > > > [    0.000000] $ 4   : 00000001 00000000 00000000 83c22470
> > > > > > > > [    0.000000] $ 8   : 00000000 00000000 00000000 00000000
> > > > > > > > [    0.000000] $12   : 806afe04 00000000 00000001 00000000
> > > > > > > > [    0.000000] $16   : 800adc0c 800adc00 00000000 00000000
> > > > > > > > [    0.000000] $20   : 00000000 0000048e 00000000 806c0000
> > > > > > > > [    0.000000] $24   : 00000003 800619e4
> > > > > > > > [    0.000000] $28   : 806ae000 806afe10 808b0000 00000000
> > > > > > > > [    0.000000] Hi    : 00000000
> > > > > > > > [    0.000000] Lo    : 00000000
> > > > > > > > [    0.000000] epc   : 00000000 0x0
> > > > > > > > [    0.000000] ra    : 00000000 0x0
> > > > > > > > [    0.000000] Status: 10000002 KERNEL EXL
> > > > > > > > [    0.000000] Cause : 10800008 (ExcCode 02)
> > > > > > > > [    0.000000] BadVA : 00000000
> > > > > > > > [    0.000000] PrId  : 00019374 (MIPS 24Kc)
> > > > > > > > [    0.000000] Modules linked in:
> > > > > > > > [    0.000000] Process swapper (pid: 0, threadinfo=(ptrval), task=(ptrval), tls=00000000)
> > > > > > > > [    0.000000] Stack : 00000002 8007e784 806ca284 00000000 800adc0c 00000000 80070eb0 8007108c
> > > > > > > > [    0.000000]         83c03c00 801ab7d8 83c03b80 00000000 00000000 83c03b80 00000000 801109cc
> > > > > > > > [    0.000000]         00000001 80880000 80880000 800c1318 00000000 ffffffff 806b0000 806b0000
> > > > > > > > [    0.000000]         83c22470 0000048e 8075eb00 807706dc 806b0000 80753158 806b0000 80755209
> > > > > > > > [    0.000000]         00000001 80880000 80880000 80726cc8 ffffffff 000046f7 00000024 00000003
> > > > > > > > [    0.000000]         ...
> > > > > > > > [    0.000000] Call Trace:
> > > > > > > > [    0.000000]
> > > > > > > > [    0.000000] [<8007e784>] r4k_flush_icache_range+0x10/0x18
> > > > > > > > [    0.000000] [<800adc0c>] preempt_count_sub+0x10/0xe4
> > > > > > > > [    0.000000] [<80070eb0>] ftrace_caller+0x0/0x54
> > > > > > > > [    0.000000] [<8007108c>] ftrace_make_nop+0x8c/0x94
> > > > > > > > [    0.000000] [<801ab7d8>] __get_free_pages+0x2c/0x60
> > > > > > > > [    0.000000] [<801109cc>] ftrace_process_locs+0x364/0x3ec
> > > > > > > > [    0.000000] [<800c1318>] vprintk_default+0x34/0x40
> > > > > > > > [    0.000000] [<80726cc8>] ftrace_init+0xb8/0x138
> > > > > > > > [    0.000000] [<8071ac98>] start_kernel+0x290/0x584
> > > > > > > > [    0.000000] [<8071a368>] unknown_bootoption+0x0/0x270
> > > > > > > > [    0.000000]
> > > > > > > > [    0.000000] Code: (Bad address in epc)
> > > > > > > > [    0.000000]
> > > > > > > > [    0.000000] ---[ end trace 64e6fa591c4a277c ]---
> > > > > > > > [    0.000000] Kernel panic - not syncing: Fatal exception
> > > > > > > > [    0.000000] Rebooting in
> > > > > > > > -----------------------------------------------------
> > > > > > > >
> > > > > > > > After reverting this patch I can normally boot the kernel.
> > > > > > > > The kernel is build with CONFIG_SCHEDSTATS not set.
> > > > > > > >
> > > > > > > > --
> > > > > > > > Pengutronix e.K.                           |                             |
> > > > > > > > Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> > > > > > > > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> > > > > > > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |  
> > > > > > >
> > > > > > > Hi Oleksij,
> > > > > > >
> > > > > > > This really makes me confused.
> > > > > > > If CONFIG_SCHEDSTATS is not set,  trace_sched_stat_{iowait, blocked,
> > > > > > > wait, sleep} will be optimized out by
> > > > > > > the compiler. That should not effect other codes.
> > > > > > >
> > > > > > > Would you pls. try bellow command on your build server?
> > > > > > > $ objdump -dr kernel/sched/fair.o | awk '/>:$/ { F=$2 } /sched_stat/ {
> > > > > > > print F " " $0 }'
> > > > > > >  
> > > > > >
> > > > > > Plus, could you pls. show me the  difference on the objdump of these
> > > > > > two vmlinux (with and without my patch) ?  
> > > > >
> > > > > Both files are in attachment.
> > > > >  
> > > >
> > > > Hi Oleksij,
> > > >
> > > > Unfortunately I don't have a mips toolchain on hand.
> > > > It would be better if you could give me the  disassembled code of
> > > > these two vmlinuxs.
> > > > I will try to build a cross toolchain for MIPS 24Kc, that may take some time.  
> > >
> > > disassembled code is in attachment.
> > >
> > > --  
> > 
> > + Steve,
> > 
> > Hi Oleksij,
> > 
> > I guess this issue is related with __mcount_loc, but I don't have a
> > clear idea how to fix it yet.
> > It would be better if you could share your .config file as well.
> > 
> > Hi Steve,
> > 
> > Do you have any suggestion on this issue?
> > My guess is when we define a tracepoint as nop, there's something
> > wrong in __mcount_loc,
> >  which will be used by MIPS and then this oops occurs.
> > 
> 
> Are you positive this is the bad commit? It could be that the problem
> is someplace else, and this commit just makes the compiler do something
> slightly different to trigger the issue.
> 
> Have you tried compiling and booting this commit, make sure it crashes,
> and then remove the commit:
> 
>  $ git show | patch -p1 -R
> 
> compile and make sure it boots?

Yes.

here are two logs. With clean 2a09b5de235a and reverted change as you
suggested:

Loading ELF '/mnt/tftp/ore-linux-dpt-module'                             
Loading devicetree from '/mnt/tftp/ore-oftree-dpt-module'  
Starting application at 0x80770000, dts 0x837d56e0...                                                                   
[    0.000000] Linux version 5.1.0-rc3-00018-g2a09b5de235a (ptxdist@ptxdist) (gcc version 8.2.1 20181130 (OSELAS.Toolchai
n-2018.12.0 8-20181130)) #411 PREEMPT 2019-06-30T04:43:00+00:00                          
[    0.000000] printk: bootconsole [early0] enabled       
[    0.000000] CPU0 revision is: 00019374 (MIPS 24Kc)     
[    0.000000] MIPS: machine is DPTechnics DPT-Module      
[    0.000000] SoC: Atheros AR9330 rev 1                  
[    0.000000] Determined physical RAM map:               
[    0.000000]  memory: 04000000 @ 80000000 (usable)      
[    0.000000]  memory: 04000000 @ 00000000 (usable)
[    0.000000] Primary instruction cache 64kB, VIPT, 4-way, linesize 32 bytes.
[    0.000000] Primary data cache 32kB, 4-way, VIPT, cache aliases, linesize 32 bytes
[    0.000000] Zone ranges:              
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000003ffffff]
[    0.000000] Movable zone start for each node    
[    0.000000] Early memory node ranges                   
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000003ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000003ffffff]
[    0.000000] random: get_random_bytes called from start_kernel+0xc4/0x574 with crng_init=0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16256
[    0.000000] Kernel command line:   ip=dhcp root=/dev/nfs nfsroot=192.168.23.4:/home/ore/nfsroot/dpt-module,v3,tcp
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Writing ErrCtl register=00000000
[    0.000000] Readback ErrCtl register=00000000
[    0.000000] Memory: 56052K/65536K available (5354K kernel code, 434K rwdata, 1028K rodata, 1432K init, 216K bss, 9484
 reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] ftrace: allocating 18021 entries in 36 pages
[    0.000000] CPU 0 Unable to handle kernel paging request at virtual address 2a8097f4, epc == 2a8097f5, ra == 2a8097f5
[    0.000000] Oops[#1]:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.1.0-rc3-00018-g2a09b5de235a #411
[    0.000000] $ 0   : 00000000 8007e42c 00000003 00000002
[    0.000000] $ 4   : 00000001 00000000 00000000 83c22418
[    0.000000] $ 8   : 00000000 00000000 00000000 00000000
[    0.000000] $12   : 8069fe04 00000000 a6c9bf67 4fa04c02
[    0.000000] $16   : 800ad734 800ad720 00000000 00000000
[    0.000000] $20   : 00000000 00000483 00000000 806c0000
[    0.000000] $24   : 00000003 800619cc
[    0.000000] $28   : 8069e000 8069fe10 808a0000 2a8097f5
[    0.000000] Hi    : 00000000
[    0.000000] Lo    : 00000000
[    0.000000] epc   : 2a8097f5 0x2a8097f5
[    0.000000] ra    : 2a8097f5 0x2a8097f5
[    0.000000] Status: 10000002 KERNEL EXL
[    0.000000] Cause : 10800008 (ExcCode 02)
[    0.000000] BadVA : 2a8097f4
[    0.000000] PrId  : 00019374 (MIPS 24Kc)
[    0.000000] Modules linked in:
[    0.000000] Process swapper (pid: 0, threadinfo=(ptrval), task=(ptrval), tls=00000000)
[    0.000000] Stack : 00000002 8007e5b4 806bac04 00000000 800ad734 00000000 80070e80 8007105c
[    0.000000]         83c03c00 8016c818 83c03b80 2a8097f5 00000000 83c03b80 00000000 8010eed8
[    0.000000]         80870000 80870000 837d06fc 800c0e4c 00000000 800bdaf4 806a0000 806a0000
[    0.000000]         83c22418 00000483 8074dfa0 8075f934 806a0000 807425f8 806a0000 80744658
[    0.000000]         80870000 80870000 837d06fc 80716928 00000001 00004665 00000024 00000003


Loading ELF '/mnt/tftp/ore-linux-dpt-module'                                                                            
Loading devicetree from '/mnt/tftp/ore-oftree-dpt-module'
Starting application at 0x80770000, dts 0x837d56e0...                                                                   
[    0.000000] Linux version 5.1.0-rc3-00018-g2a09b5de235a-dirty (ptxdist@ptxdist) (gcc version 8.2.1 20181130 (OSELAS.To
olchain-2018.12.0 8-20181130)) #412 PREEMPT 2019-06-30T04:48:15+00:00                                                   
[    0.000000] printk: bootconsole [early0] enabled                                                                     
[    0.000000] CPU0 revision is: 00019374 (MIPS 24Kc)                                                                   
[    0.000000] MIPS: machine is DPTechnics DPT-Module                                                                   
[    0.000000] SoC: Atheros AR9330 rev 1                                                                                
[    0.000000] Determined physical RAM map:                                                                             
[    0.000000]  memory: 04000000 @ 80000000 (usable)                                                                    
[    0.000000]  memory: 04000000 @ 00000000 (usable)                                                                    
[    0.000000] Primary instruction cache 64kB, VIPT, 4-way, linesize 32 bytes.                                          
[    0.000000] Primary data cache 32kB, 4-way, VIPT, cache aliases, linesize 32 bytes                                   
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000003ffffff]                                                   
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000003ffffff]                                                  
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000003ffffff]                                         
[    0.000000] random: get_random_bytes called from start_kernel+0xc4/0x574 with crng_init=0                            
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 16256                                             
[    0.000000] Kernel command line:   ip=dhcp root=/dev/nfs nfsroot=192.168.23.4:/home/ore/nfsroot/dpt-module,v3,tcp    
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)                                            
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)                                             
[    0.000000] Writing ErrCtl register=00000000
[    0.000000] Readback ErrCtl register=00000000
[    0.000000] Memory: 56052K/65536K available (5355K kernel code, 433K rwdata, 1028K rodata, 1432K init, 216K bss, 9484K
 reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] ftrace: allocating 18021 entries in 36 pages
[    0.000000] rcu: Preemptible hierarchical RCU implementation.  
[    0.000000]  Tasks RCU enabled.                                                                                       
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 51                                                          
[    0.000000] CPU clock: 400.000 MHz                                                                                   
[    0.000000] clocksource: MIPS: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 9556302233 ns
[    0.000014] sched_clock: 32 bits at 200MHz, resolution 5ns, wraps every 10737418237ns
[    0.007930] Calibrating delay loop... 265.42 BogoMIPS (lpj=1327104)
[    0.092751] pid_max: default: 32768 minimum: 301                        
[    0.097865] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.104012] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)                         
[    0.112313] *** VALIDATE proc ***                                                 
[    0.114679] *** VALIDATE cgroup1 ***         
[    0.117862] *** VALIDATE cgroup2 ***                              
[    0.123410] rcu: Hierarchical SRCU implementation.                                                                   
[    0.130151] devtmpfs: initialized                           
[    0.136105] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.145160] futex hash table entries: 256 (order: -1, 3072 bytes)                                                    
[    0.150868] pinctrl core: initialized pinctrl subsystem                                  
[    0.159475] NET: Registered protocol family 16                          
[    0.271281] clocksource: Switched to clocksource MIPS                                                            
[    2.310848] NET: Registered protocol family 2
[    2.316994] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes)
[    2.323420] TCP established hash table entries: 1024 (order: 0, 4096 bytes)
[    2.330190] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    2.336675] TCP: Hash tables configured (established 1024 bind 1024)


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
