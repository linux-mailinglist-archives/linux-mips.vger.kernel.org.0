Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6CC33046C
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 21:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbhCGUGx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 15:06:53 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:55708 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbhCGUGg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 15:06:36 -0500
Date:   Sun, 7 Mar 2021 23:06:12 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] MIPS: kernel: Reserve exception base early to prevent
 corruption
Message-ID: <20210307200612.6ftvptnj4txaf2uy@mobilestation>
References: <20210306082910.3472-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210306082910.3472-1-tsbogend@alpha.franken.de>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas.
I thought we'd discuss it in v1, but since you've sent v2 please see
my comment below.

On Sat, Mar 06, 2021 at 09:29:09AM +0100, Thomas Bogendoerfer wrote:
> BMIPS is one of the few platforms that do change the exception base.
> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> with kernel_end") we started seeing BMIPS boards fail to boot with the
> built-in FDT being corrupted.
> 
> Before the cited commit, early allocations would be in the [kernel_end,
> RAM_END] range, but after commit they would be within [RAM_START +
> PAGE_SIZE, RAM_END].
> 
> The custom exception base handler that is installed by
> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> memory region allocated by unflatten_and_copy_device_tree() thus
> corrupting the FDT used by the kernel.
> 
> To fix this, we need to perform an early reservation of the custom
> exception space. So we reserve it already in cpu_probe() for the CPUs
> where this is fixed. For CPU with an ebase config register allocation
> of exception space will be done in trap_init().
> 
> Huge thanks to Serget for analysing and proposing a solution to this
> issue.
> 
> Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v2:
>  - do only memblock reservation in reserve_exception_space()
>  - reserve 0..0x400 for all CPUs without ebase register and
>    to addtional reserve_exception_space for BMIPS CPUs
> 
>  arch/mips/include/asm/traps.h    |  3 +++
>  arch/mips/kernel/cpu-probe.c     |  7 +++++++
>  arch/mips/kernel/cpu-r3k-probe.c |  3 +++
>  arch/mips/kernel/traps.c         | 10 +++++-----
>  4 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
> index 6aa8f126a43d..b710e76c9c65 100644
> --- a/arch/mips/include/asm/traps.h
> +++ b/arch/mips/include/asm/traps.h
> @@ -24,8 +24,11 @@ extern void (*board_ebase_setup)(void);
>  extern void (*board_cache_error_setup)(void);
>  
>  extern int register_nmi_notifier(struct notifier_block *nb);
> +extern void reserve_exception_space(phys_addr_t addr, unsigned long size);
>  extern char except_vec_nmi[];
>  
> +#define VECTORSPACING 0x100	/* for EI/VI mode */
> +
>  #define nmi_notifier(fn, pri)						\
>  ({									\
>  	static struct notifier_block fn##_nb = {			\
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 9a89637b4ecf..b565bc4b900d 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -26,6 +26,7 @@
>  #include <asm/elf.h>
>  #include <asm/pgtable-bits.h>
>  #include <asm/spram.h>
> +#include <asm/traps.h>
>  #include <linux/uaccess.h>
>  
>  #include "fpu-probe.h"
> @@ -1628,6 +1629,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  		c->cputype = CPU_BMIPS3300;
>  		__cpu_name[cpu] = "Broadcom BMIPS3300";
>  		set_elf_platform(cpu, "bmips3300");
> +		reserve_exception_space(0x400, VECTORSPACING * 64);
>  		break;
>  	case PRID_IMP_BMIPS43XX: {
>  		int rev = c->processor_id & PRID_REV_MASK;
> @@ -1638,6 +1640,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS4380";
>  			set_elf_platform(cpu, "bmips4380");
>  			c->options |= MIPS_CPU_RIXI;
> +			reserve_exception_space(0x400, VECTORSPACING * 64);
>  		} else {
>  			c->cputype = CPU_BMIPS4350;
>  			__cpu_name[cpu] = "Broadcom BMIPS4350";
> @@ -1654,6 +1657,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS5000";
>  		set_elf_platform(cpu, "bmips5000");
>  		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
> +		reserve_exception_space(0x1000, VECTORSPACING * 64);
>  		break;
>  	}
>  }
> @@ -2133,6 +2137,9 @@ void cpu_probe(void)
>  	if (cpu == 0)
>  		__ua_limit = ~((1ull << cpu_vmbits) - 1);
>  #endif

> +
> +	if (cpu_has_mips_r2_r6)
> +		reserve_exception_space(0, 0x400);

Are you sure it shouldn't be (!cpu_has_mips_r2_r6)?. What I see here
contradicts to what is said in Changelog v2.

Anyway regarding the problem in general. AFAICS the next code uses the
lowest memory to place some specific exception handlers:
board_cache_error_setup pointer:
  arch/mips/mm/c-r4k.c: r4k_cache_error_setup() - SiByte CPUs: CPU_SB1, CPU_SB1A (up to 0x180)
  arch/mips/mm/c-octeon.c: octeon_cache_error_setup() - Cavium CPU: CPU_CAVIUM_OCTEON (up to 0x180)
board_nmi_handler_setup pointer:
  arch/mips/kernel/smp-bmips.c: bmips_nmi_handler_setup() - Broadcom CPU: CPU_BMIPS (up to 0x400)
  arch/mips/loongson2ef/common/init.c: mips_nmi_setup() - Loongson 2E CPU: MACH_LOONGSON2EF (up to 0x400)
  arch/mips/loongson64/init.c: mips_nmi_setup() - Loongson 64 CPU: MACH_LOONGSON64 (up to 0x400, VEIC:0xB00)
  arch/mips/mti-malta/malta-init.c: mips_nmi_setup() - Malta CPU: MIPS_MALTA (up to 0x400, VEIC: 0xB00)
  arch/mips/pistachio/init.c: mips_nmi_setup() - Pistachio CPU: MACH_PISTACHIO (up to 0x400, VEIC: 0xB00)
board_ejtag_handler_setup:
  arch/mips/mti-malta/malta-init.c: mips_ejtag_setup() - Malta CPU: MIPS_MALTA (up to 0x380, VEIC: 0xa80)
  arch/mips/pistachio/init.c: mips_ejtag_setup() - Pistachio CPU: MACH_PISTACHIO (up to 0x380, VEIC: 0xa80)
bmips_ebase_setup:
  arch/mips/kernel/smp-bmips.c: bmips_ebase_setup() - Broadcom CPU: CPU_BMIPS (up to 0x400 - NMI/reset, and 0x1000 - normal)
plat_mem_setup:
  arch/mips/bmips/setup.c: bcm63xx_fixup_cpu1() - Broadcom CPU: CPU_BMIPS (up to 0x220)
  

Are you sure all of them have "cpu_has_mips_r2_r6" macro returning
true (false) in order to safely use the lowest region in accordance
with the conditional statement you've added? Moreover some of them rely on
having a memory reserved up to 0x1000, which seems like not covered
by the reservations added in this patch. For instance in accordance
with the log provided by Florian in the bug-report, Broadcom CPU 5000
has cpu_has_mips_r2_r6 macro returning false. So if you are sure in
having the positive conditional statement in (cpu_has_mips_r2_r6)
we'll end up having unreserved the lowest memory region there.
As I said in a comment to v1 of course it doesn't matter for the early
allocations since memblock expels first memory page from
allocation-procedure. But we can't be sure that won't get changed in
future, and I don't really know whether the buddy allocator omits that
memory too. So IMHO at least for consistency we need to reserve it.

I've just realized me and Paul already had a discussion related with
this problem in a framework of a patch submitted by me about two years
ago:
https://lore.kernel.org/lkml/20190423224748.3765-6-fancer.lancer@gmail.com/T/#m39dff0410543cac23f5c215a537a8fd0f11057cc
To say it shortly that's how the memory below the kernel stopped being
reserved and the reservation in trap_init() was added:
https://lore.kernel.org/linux-mips/20190430225216.7164-1-paul.burton@mips.com/T/#m455942ee26de86aa9eaee37bf45bb49e75388d80
Although we didn't realize it wasn't enough... So in two years the
problem manifested itself.

I don't really know a firm solution in this case. At least SiByte,
Loongson 2E/F and Broadcom won't have MIPS R2-R6 ISA support/flag set,
so they need to have a memory below 0x400 or 0x1000 reserved. Moreover
Malta and Pistachio CPUs have MIPS R2(-R6) support so they will
allocate a memory for vectored exceptions, but at the same time they
set fixed vectors for NMI and eJTAG below 0x400 or 0x1000 phys memory
(Though they may reserve that memory via /memreserve/ DT node).
God knows how many older CPUs also relied on having the lowest memory
range reserved. All of that makes me thinking, that I shouldn't have
just removed the reservation of the memory below kernel. Instead it
might have been better to at least reserve the lowest page for each
CPU or at least reserve a whole page for (!cpu_has_mips_r2_r6) CPUs
as Paul originally suggested:
https://lore.kernel.org/lkml/20190423224748.3765-6-fancer.lancer@gmail.com/T/#m0ca7ee2af4558e249cfe6d724e913b9cd629484e
but for some reason changed to 1KB (0x400) in his series. What do you
think?

-Sergey

>  }
>  
>  void cpu_report(void)
> diff --git a/arch/mips/kernel/cpu-r3k-probe.c b/arch/mips/kernel/cpu-r3k-probe.c
> index abdbbe8c5a43..af654771918c 100644
> --- a/arch/mips/kernel/cpu-r3k-probe.c
> +++ b/arch/mips/kernel/cpu-r3k-probe.c
> @@ -21,6 +21,7 @@
>  #include <asm/fpu.h>
>  #include <asm/mipsregs.h>
>  #include <asm/elf.h>
> +#include <asm/traps.h>
>  
>  #include "fpu-probe.h"
>  
> @@ -158,6 +159,8 @@ void cpu_probe(void)
>  		cpu_set_fpu_opts(c);
>  	else
>  		cpu_set_nofpu_opts(c);
> +
> +	reserve_exception_space(0, 0x400);
>  }
>  
>  void cpu_report(void)
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index e0352958e2f7..808b8b61ded1 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2009,13 +2009,16 @@ void __noreturn nmi_exception_handler(struct pt_regs *regs)
>  	nmi_exit();
>  }
>  
> -#define VECTORSPACING 0x100	/* for EI/VI mode */
> -
>  unsigned long ebase;
>  EXPORT_SYMBOL_GPL(ebase);
>  unsigned long exception_handlers[32];
>  unsigned long vi_handlers[64];
>  
> +void reserve_exception_space(phys_addr_t addr, unsigned long size)
> +{
> +	memblock_reserve(addr, size);
> +}
> +
>  void __init *set_except_vector(int n, void *addr)
>  {
>  	unsigned long handler = (unsigned long) addr;
> @@ -2367,10 +2370,7 @@ void __init trap_init(void)
>  
>  	if (!cpu_has_mips_r2_r6) {
>  		ebase = CAC_BASE;
> -		ebase_pa = virt_to_phys((void *)ebase);
>  		vec_size = 0x400;
> -
> -		memblock_reserve(ebase_pa, vec_size);
>  	} else {
>  		if (cpu_has_veic || cpu_has_vint)
>  			vec_size = 0x200 + VECTORSPACING*64;
> -- 
> 2.29.2
> 
