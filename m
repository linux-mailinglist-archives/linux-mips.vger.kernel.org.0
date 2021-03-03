Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEE232C88F
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240126AbhCDAuv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 19:50:51 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:48796 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1581486AbhCCVP5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 16:15:57 -0500
Date:   Thu, 4 Mar 2021 00:14:55 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH] MIPS: kernel: Reserve exception base early to prevent
 corruption
Message-ID: <20210303211455.5d3vedv7ewk2d4ns@mobilestation>
References: <20210303185713.122531-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210303185713.122531-1-tsbogend@alpha.franken.de>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello  Thomas,
Thanks for the patch. My comments are below.

On Wed, Mar 03, 2021 at 07:57:13PM +0100, Thomas Bogendoerfer wrote:
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

> Fixes: Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")

Fixes tag is used twice.

> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>

I'd switch these tags order. First it was reported, then the
problem was debugged. I suppose it would be also nice to add
Florian under the second Reported-by tag if he doesn't mind. I haven't
seen any Kamal' email message, but a report posted by Florian only.

> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/traps.h    |  4 ++++
>  arch/mips/kernel/cpu-probe.c     |  7 +++++++
>  arch/mips/kernel/cpu-r3k-probe.c |  3 +++
>  arch/mips/kernel/smp-bmips.c     |  9 +--------
>  arch/mips/kernel/traps.c         | 31 ++++++++++++++++---------------
>  5 files changed, 31 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
> index 6aa8f126a43d..d74d829e1655 100644
> --- a/arch/mips/include/asm/traps.h
> +++ b/arch/mips/include/asm/traps.h
> @@ -24,7 +24,11 @@ extern void (*board_ebase_setup)(void);
>  extern void (*board_cache_error_setup)(void);
>  
>  extern int register_nmi_notifier(struct notifier_block *nb);
> +extern void reserve_exception_space(unsigned long addr, unsigned long size);
>  extern char except_vec_nmi[];
> +extern unsigned long ebase_size;
> +
> +#define VECTORSPACING 0x100	/* for EI/VI mode */
>  
>  #define nmi_notifier(fn, pri)						\
>  ({									\
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 9a89637b4ecf..effc45cbb351 100644
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
> +		reserve_exception_space(0x80000400, VECTORSPACING * 64);
>  		break;
>  	case PRID_IMP_BMIPS43XX: {
>  		int rev = c->processor_id & PRID_REV_MASK;
> @@ -1638,6 +1640,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS4380";
>  			set_elf_platform(cpu, "bmips4380");
>  			c->options |= MIPS_CPU_RIXI;
> +			reserve_exception_space(0x80000400, VECTORSPACING * 64);
>  		} else {
>  			c->cputype = CPU_BMIPS4350;
>  			__cpu_name[cpu] = "Broadcom BMIPS4350";
> @@ -1654,6 +1657,7 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
>  			__cpu_name[cpu] = "Broadcom BMIPS5000";
>  		set_elf_platform(cpu, "bmips5000");
>  		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
> +		reserve_exception_space(0x80001000, VECTORSPACING * 64);
>  		break;
>  	}
>  }
> @@ -2133,6 +2137,9 @@ void cpu_probe(void)
>  	if (cpu == 0)
>  		__ua_limit = ~((1ull << cpu_vmbits) - 1);
>  #endif
> +
> +	if (ebase_size == 0 && !cpu_has_mips_r2_r6)
> +		reserve_exception_space(CAC_BASE, 0x400);
>  }
>  
>  void cpu_report(void)
> diff --git a/arch/mips/kernel/cpu-r3k-probe.c b/arch/mips/kernel/cpu-r3k-probe.c
> index abdbbe8c5a43..6e3f4c17b810 100644
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
> +	reserve_exception_space(CAC_BASE, 0x400);
>  }
>  
>  void cpu_report(void)
> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
> index b6ef5f7312cf..ad3f2282a65a 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -528,10 +528,6 @@ static void bmips_set_reset_vec(int cpu, u32 val)
>  
>  void bmips_ebase_setup(void)
>  {
> -	unsigned long new_ebase = ebase;
> -
> -	BUG_ON(ebase != CKSEG0);
> -
>  	switch (current_cpu_type()) {
>  	case CPU_BMIPS4350:
>  		/*

> @@ -554,7 +550,6 @@ void bmips_ebase_setup(void)
>  		 * 0x8000_0000: reset/NMI (initially in kseg1)
>  		 * 0x8000_0400: normal vectors
>  		 */
> -		new_ebase = 0x80000400;
>  		bmips_set_reset_vec(0, RESET_FROM_KSEG0);
>  		break;
>  	case CPU_BMIPS5000:
> @@ -562,16 +557,14 @@ void bmips_ebase_setup(void)
>  		 * 0x8000_0000: reset/NMI (initially in kseg1)
>  		 * 0x8000_1000: normal vectors
>  		 */
> -		new_ebase = 0x80001000;
>  		bmips_set_reset_vec(0, RESET_FROM_KSEG0);
> -		write_c0_ebase(new_ebase);
> +		write_c0_ebase(ebase);
>  		break;
>  	default:
>  		return;
>  	}
>  
>  	board_nmi_handler_setup = &bmips_nmi_handler_setup;

I've just realized that Broadcom MIPS actually needs to reserve a
space above 0x80000000 too. See the in-situ comment here, 0x8000_0000
is said to be a space for reset/NMI. That space is then rewritten by
the method bmips_nmi_handler_setup() called in trap_init(). Of course
memblock allocates a memory starting from PAGE_SIZE so we are on safe
side at boot-stage. At the same time memblock doesn't mark the lowest
region as reserved. Thus we can't be sure that the buddy allocator
won't ever try to use that physical memory. AFAICS bcm63xx
also copies some vector to 0xa0000200.

Similar thing concerns all the platforms, which initialize the
pointers: board_nmi_handler_setup and board_ejtag_handler_setup. All
of them rewrite some lowest memory space with NMI/eJTAG vectors and
most likely expects that data being left unchanged too.

I am a bit surprised we haven't got any bug report in that matter so
far, because AFAIR the MIPS arch's stopped reserving memory below the
kernel since bootmem allocator was removed. Anyway at least for the
sake of consistency the lowest page should be reserved in the affected
platforms.

-Sergey

> -	ebase = new_ebase;
>  }
>  
>  asmlinkage void __weak plat_wired_tlb_setup(void)
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index e0352958e2f7..670b824b05a0 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2009,13 +2009,19 @@ void __noreturn nmi_exception_handler(struct pt_regs *regs)
>  	nmi_exit();
>  }
>  
> -#define VECTORSPACING 0x100	/* for EI/VI mode */
> -
>  unsigned long ebase;
>  EXPORT_SYMBOL_GPL(ebase);
> +unsigned long ebase_size;
>  unsigned long exception_handlers[32];
>  unsigned long vi_handlers[64];
>  
> +void reserve_exception_space(unsigned long addr, unsigned long size)
> +{
> +	ebase = addr;
> +	ebase_size = size;
> +	memblock_reserve(__pa((void *)ebase), ebase_size);
> +}
> +
>  void __init *set_except_vector(int n, void *addr)
>  {
>  	unsigned long handler = (unsigned long) addr;
> @@ -2360,27 +2366,22 @@ void __init trap_init(void)
>  	extern char except_vec3_generic;
>  	extern char except_vec4;
>  	extern char except_vec3_r4000;
> -	unsigned long i, vec_size;
>  	phys_addr_t ebase_pa;
> +	unsigned long i;
>  
>  	check_wait();
>  
> -	if (!cpu_has_mips_r2_r6) {
> -		ebase = CAC_BASE;
> -		ebase_pa = virt_to_phys((void *)ebase);
> -		vec_size = 0x400;
> -
> -		memblock_reserve(ebase_pa, vec_size);
> -	} else {
> +	if (cpu_has_mips_r2_r6) {
>  		if (cpu_has_veic || cpu_has_vint)
> -			vec_size = 0x200 + VECTORSPACING*64;
> +			ebase_size = 0x200 + VECTORSPACING*64;
>  		else
> -			vec_size = PAGE_SIZE;
> +			ebase_size = PAGE_SIZE;
>  
> -		ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
> +		ebase_pa = memblock_phys_alloc(ebase_size,
> +					       1 << fls(ebase_size));
>  		if (!ebase_pa)
>  			panic("%s: Failed to allocate %lu bytes align=0x%x\n",
> -			      __func__, vec_size, 1 << fls(vec_size));
> +			      __func__, ebase_size, 1 << fls(ebase_size));
>  
>  		/*
>  		 * Try to ensure ebase resides in KSeg0 if possible.
> @@ -2534,7 +2535,7 @@ void __init trap_init(void)
>  	else
>  		set_handler(0x080, &except_vec3_generic, 0x80);
>  
> -	local_flush_icache_range(ebase, ebase + vec_size);
> +	local_flush_icache_range(ebase, ebase + ebase_size);
>  
>  	sort_extable(__start___dbe_table, __stop___dbe_table);
>  
> -- 
> 2.29.2
> 
