Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF95432AF7C
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237605AbhCCAYs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:24:48 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:45950 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376682AbhCBNiq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 08:38:46 -0500
Date:   Tue, 2 Mar 2021 16:08:21 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Roman Gushchin <guro@fb.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-mm@kvack.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        <iamjoonsoo.kim@lge.com>, <riel@surriel.com>,
        Michal Hocko <mhocko@kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-team@fb.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] memblock: do not start bottom-up allocations with
 kernel_end
Message-ID: <20210302130821.m6uw7wajumaxjxyj@mobilestation>
References: <20201217201214.3414100-1-guro@fb.com>
 <20201217201214.3414100-2-guro@fb.com>
 <23fc1ef9-7342-8bc2-d184-d898107c52b2@gmail.com>
 <20210228090041.GO1447004@kernel.org>
 <8cbafe95-0f8c-a9b7-2dc9-cded846622fd@gmail.com>
 <20210228230811.wdae7oaaf3mbpgwl@mobilestation>
 <2e973fa8-5f2b-6840-0874-9c15fa0ebea0@gmail.com>
 <YDy3xo3bMCqFtDhI@kernel.org>
 <YD23KbTlOzl60mqS@carbon.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YD23KbTlOzl60mqS@carbon.dhcp.thefacebook.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 07:55:21PM -0800, Roman Gushchin wrote:
> On Mon, Mar 01, 2021 at 11:45:42AM +0200, Mike Rapoport wrote:
> > On Sun, Feb 28, 2021 at 07:50:45PM -0800, Florian Fainelli wrote:
> > > Hi Serge,
> > > 
> > > On 2/28/2021 3:08 PM, Serge Semin wrote:
> > > > Hi folks,
> > > > What you've got here seems a more complicated problem than it
> > > > could originally look like. Please, see my comments below.
> > > > 
> > > > (Note I've discarded some of the email logs, which of no interest
> > > > to the discovered problem. Please also note that I haven't got any
> > > > Broadcom hardware to test out a solution suggested below.)
> > > > 
> > > > On Sun, Feb 28, 2021 at 10:19:51AM -0800, Florian Fainelli wrote:
> > > >> Hi Mike,
> > > >>
> > > >> On 2/28/2021 1:00 AM, Mike Rapoport wrote:
> > > >>> Hi Florian,
> > > >>>
> > > >>> On Sat, Feb 27, 2021 at 08:18:47PM -0800, Florian Fainelli wrote:
> > > >>>>
> > > > 
> > > >>>> [...]
> > > > 
> > > >>>>
> > > >>>> Hi Roman, Thomas and other linux-mips folks,
> > > >>>>
> > > >>>> Kamal and myself have been unable to boot v5.11 on MIPS since this
> > > >>>> commit, reverting it makes our MIPS platforms boot successfully. We do
> > > >>>> not see a warning like this one in the commit message, instead what
> > > >>>> happens appear to be a corrupted Device Tree which prevents the parsing
> > > >>>> of the "rdb" node and leading to the interrupt controllers not being
> > > >>>> registered, and the system eventually not booting.
> > > >>>>
> > > >>>> The Device Tree is built-into the kernel image and resides at
> > > >>>> arch/mips/boot/dts/brcm/bcm97435svmb.dts.
> > > >>>>
> > > >>>> Do you have any idea what could be wrong with MIPS specifically here?
> > > > 
> > > > Most likely the problem you've discovered has been there for quite
> > > > some time. The patch you are referring to just caused it to be
> > > > triggered by extending the early allocation range. See before that
> > > > patch was accepted the early memory allocations had been performed
> > > > in the range:
> > > > [kernel_end, RAM_END].
> > > > The patch changed that, so the early allocations are done within
> > > > [RAM_START + PAGE_SIZE, RAM_END].
> > > > 
> > > > In normal situations it's safe to do that as long as all the critical
> > > > memory regions (including the memory residing a space below the
> > > > kernel) have been reserved. But as soon as a memory with some critical
> > > > structures haven't been reserved, the kernel may allocate it to be used
> > > > for instance for early initializations with obviously unpredictable but
> > > > most of the times unpleasant consequences.
> > > > 
> > > >>>
> > > >>> Apparently there is a memblock allocation in one of the functions called
> > > >>> from arch_mem_init() between plat_mem_setup() and
> > > >>> early_init_fdt_reserve_self().
> > > > 
> > > > Mike, alas according to the log provided by Florian that's not the reason
> > > > of the problem. Please, see my considerations below.
> > > > 
> > > >> [...]
> > > >>
> > > >> [    0.000000] Linux version 5.11.0-g5695e5161974 (florian@localhost)
> > > >> (mipsel-linux-gcc (GCC) 8.3.0, GNU ld (GNU Binutils) 2.32) #84 SMP Sun
> > > >> Feb 28 10:01:50 PST 2021
> > > >> [    0.000000] CPU0 revision is: 00025b00 (Broadcom BMIPS5200)
> > > >> [    0.000000] FPU revision is: 00130001
> > > > 
> > > >> [    0.000000] memblock_add: [0x00000000-0x0fffffff]
> > > >> early_init_dt_scan_memory+0x160/0x1e0
> > > >> [    0.000000] memblock_add: [0x20000000-0x4fffffff]
> > > >> early_init_dt_scan_memory+0x160/0x1e0
> > > >> [    0.000000] memblock_add: [0x90000000-0xcfffffff]
> > > >> early_init_dt_scan_memory+0x160/0x1e0
> > > > 
> > > > Here the memory has been added to the memblock allocator.
> > > > 
> > > >> [    0.000000] MIPS: machine is Broadcom BCM97435SVMB
> > > >> [    0.000000] earlycon: ns16550a0 at MMIO32 0x10406b00 (options '')
> > > >> [    0.000000] printk: bootconsole [ns16550a0] enabled
> > > > 
> > > >> [    0.000000] memblock_reserve: [0x00aa7600-0x00aaa0a0]
> > > >> setup_arch+0x128/0x69c
> > > > 
> > > > Here the fdt memory has been reserved. (Note it's built into the
> > > > kernel.)
> > > > 
> > > >> [    0.000000] memblock_reserve: [0x00010000-0x018313cf]
> > > >> setup_arch+0x1f8/0x69c
> > > > 
> > > > Here the kernel itself together with built-in dtb have been reserved.
> > > > So far so good.
> > > > 
> > > >> [    0.000000] Initrd not found or empty - disabling initrd
> > > > 
> > > >> [    0.000000] memblock_alloc_try_nid: 10913 bytes align=0x40 nid=-1
> > > >> from=0x00000000 max_addr=0x00000000
> > > >> early_init_dt_alloc_memory_arch+0x40/0x84
> > > >> [    0.000000] memblock_reserve: [0x00001000-0x00003aa0]
> > > >> memblock_alloc_range_nid+0xf8/0x198
> > > >> [    0.000000] memblock_alloc_try_nid: 32680 bytes align=0x4 nid=-1
> > > >> from=0x00000000 max_addr=0x00000000
> > > >> early_init_dt_alloc_memory_arch+0x40/0x84
> > > >> [    0.000000] memblock_reserve: [0x00003aa4-0x0000ba4b]
> > > >> memblock_alloc_range_nid+0xf8/0x198
> > > > 
> > > > The log above most likely belongs to the call-chain:
> > > > setup_arch()
> > > > +-> arch_mem_init()
> > > >     +-> device_tree_init() - BMIPS specific method
> > > >         +-> unflatten_and_copy_device_tree()
> > > > 
> > > > So to speak here we've copied the fdt from the original space
> > > > [0x00aa7600-0x00aaa0a0] into [0x00001000-0x00003aa0] and unflattened
> > > > it to [0x00003aa4-0x0000ba4b].
> > > > 
> > > > The problem is that a bit later the next call-chain is performed:
> > > > setup_arch()
> > > > +-> plat_smp_setup()
> > > >     +-> mp_ops->smp_setup(); - registered by prom_init()->register_bmips_smp_ops();
> > > >         +-> if (!board_ebase_setup)
> > > >                  board_ebase_setup = &bmips_ebase_setup;
> > > > 
> > > > So at the moment of the CPU traps initialization the bmips_ebase_setup()
> > > > method is called. What trap_init() does isn't compatible with the
> > > > allocation performed by the unflatten_and_copy_device_tree() method.
> > > > See the next comment.
> > > > 
> > > >> [    0.000000] memblock_alloc_try_nid: 25 bytes align=0x4 nid=-1
> > > >> from=0x00000000 max_addr=0x00000000
> > > >> early_init_dt_alloc_memory_arch+0x40/0x84
> > 
> > ...
> > 
> > > >> [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536
> > > >> bytes, linear)
> > > > 
> > > >> [    0.000000] memblock_reserve: [0x00000000-0x000003ff]
> > > >> trap_init+0x70/0x4e8
> > > > 
> > > > Most likely someplace here the corruption has happened. The log above
> > > > has just reserved a memory for NMI/reset vectors:
> > > > arch/mips/kernel/traps.c: trap_init(void): Line 2373.
> > > > 
> > > > But then the board_ebase_setup() pointer is dereferenced and called,
> > > > which has been initialized with bmips_ebase_setup() earlier and which
> > > > overwrites the ebase variable with: 0x80001000 as this is
> > > > CPU_BMIPS5000 CPU. So any further calls of the functions like
> > > > set_handler()/set_except_vector()/set_vi_srs_handler()/etc may cause a
> > > > corruption of the memory above 0x80001000, which as we have discovered
> > > > belongs to fdt and unflattened device tree.
> > > > 
> > > >> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> > > >> [    0.000000] Memory: 2045268K/2097152K available (8226K kernel code,
> > > >> 1070K rwdata, 1336K rodata, 13808K init, 260K bss, 51884K reserved, 0K
> > > >> cma-reserved, 1835008K highmem)
> > > >> [    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> > > >> [    0.000000] rcu: Hierarchical RCU implementation.
> > > >> [    0.000000] rcu:     RCU event tracing is enabled.
> > > >> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
> > > >> is 25 jiffies.
> > > >> [    0.000000] NR_IRQS: 256
> > > > 
> > > >> [    0.000000] OF: Bad cell count for /rdb
> > > >> [    0.000000] irq_bcm7038_l1: failed to remap intc L1 registers
> > > >> [    0.000000] OF: of_irq_init: children remain, but no parents
> > > > 
> > > > So here is the first time we have got the consequence of the corruption
> > > > popped up. Luckily it's just the "Bad cells count" error. We could have
> > > > got much less obvious log here up to getting a crash at some place
> > > > further...
> > > > 
> > > >> [    0.000000] random: get_random_bytes called from
> > > >> start_kernel+0x444/0x654 with crng_init=0
> > > >> [    0.000000] sched_clock: 32 bits at 250 Hz, resolution 4000000ns,
> > > >> wraps every 8589934590000000ns
> > > > 
> > > >>
> > > >> and with your patch applied which unfortunately did not work we have the
> > > >> following:
> > > >>
> > > >> [...]
> > > > 
> > > > So a patch like this shall workaround the corruption:
> > > > 
> > > > --- a/arch/mips/bmips/setup.c
> > > > +++ b/arch/mips/bmips/setup.c
> > > > @@ -174,6 +174,8 @@ void __init plat_mem_setup(void)
> > > >  
> > > >  	__dt_setup_arch(dtb);
> > > >  
> > > > +	memblock_reserve(0x0, 0x1000 + 0x100*64);
> > > > +
> > > >  	for (q = bmips_quirk_list; q->quirk_fn; q++) {
> > > >  		if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
> > > >  					     q->compatible)) {
> > > 
> > > This patch works, thanks a lot for the troubleshooting and analysis! How
> > > about the following which would be more generic and works as well and
> > > should be more universal since it does not require each architecture to
> > > provide an appropriate call to memblock_reserve():
> > > 
> > > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > > index e0352958e2f7..b0a173b500e8 100644
> > > --- a/arch/mips/kernel/traps.c
> > > +++ b/arch/mips/kernel/traps.c
> > > @@ -2367,10 +2367,7 @@ void __init trap_init(void)
> > > 
> > >         if (!cpu_has_mips_r2_r6) {
> > >                 ebase = CAC_BASE;
> > > -               ebase_pa = virt_to_phys((void *)ebase);
> > >                 vec_size = 0x400;
> > > -
> > > -               memblock_reserve(ebase_pa, vec_size);
> > >         } else {
> > >                 if (cpu_has_veic || cpu_has_vint)
> > >                         vec_size = 0x200 + VECTORSPACING*64;
> > > @@ -2410,6 +2407,14 @@ void __init trap_init(void)
> > > 
> > >         if (board_ebase_setup)
> > >                 board_ebase_setup();
> > > +
> > > +       /* board_ebase_setup() can change the exception base address
> > > +        * reserve it now after changes were made.
> > > +        */
> > > +       if (!cpu_has_mips_r2_r6) {
> > > +               ebase_pa = virt_to_phys((void *)ebase);
> > > +               memblock_reserve(ebase_pa, vec_size);
> > > +       }
> 
> Hi folks!
> 
> First, I'm really sorry for breaking things and also being silent for last
> couple of days: I was almost completely offline. Thank you for working on
> this!
> 
> > 
> > With this it's still possible to have memblock allocations around ebase_pa
> > before it is reserved.
> > 
> > I think we have two options here to solve it in more or less generic way:
> > 
> > * split the reservation of ebase from traps_init() and move it earlier to
> > setup_arch(). I didn't check what board_ebase_setup() do, if they need to
> > allocate memory it would not work.
> 

> It seems that it doesn't allocate any memory, so it sounds like a good option.
> But doesn't the ebase initialization depend on the memblock allocator?
> 
> I see in trap_init():
>     if (!cpu_has_mips_r2_r6) {
>         ...
>     } else {
>         ...
> 	ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
> 	...
> 	if (!IS_ENABLED(CONFIG_EVA) && !WARN_ON(ebase_pa >= 0x20000000))
> 	    ebase = CKSEG0ADDR(ebase_pa);
>         else
>             ebase = (unsigned long)phys_to_virt(ebase_pa);

Yeap, this seems like the best option for now. Of course we need to
reserve the memory only if the system needs that like in case of non
MIPS R2-R5 archs. In addition a custom ebase value must be taken into
account. The later is the hardest part to achieve. ebase is a global
variable. So we need to thoroughly scan all the MIPS platforms which
update it and make sure it's done before the reservation is
performed. 

> 
> 
> > 
> > * add an API to memblock to set lower limit for allocations and then set
> > the lower limit, to e.g. kernel load address in arch_mem_init(). This may
> > add complexity for configurations with relocatable kernel and kaslr.
> 
> This option looks more like a workaround to me, but maybe it's ok too.

Agree. The first one is better.

-Sergey

> 
> Thanks!
