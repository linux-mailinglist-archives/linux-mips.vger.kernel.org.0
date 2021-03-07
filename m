Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D920932FF75
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 08:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhCGHVc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 02:21:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:49938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230390AbhCGHUw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 02:20:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2785765015;
        Sun,  7 Mar 2021 07:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615101651;
        bh=v9O/9s2c/T6FOkPxcEi7kBADpgM081nbxSddhFLI9wY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FGOfNc+C61bQljCWUO9i7SoOadDK9R+ZYnoZnwevQM149jH6erWJFpT8gt5xYUZUJ
         kVni/Xo1E0SKP3CK1UR0xjSJQkL4OFZaVWUUCBOlQqVIN/esSoT3QMiA1y4OONSb/9
         yIJei+rTpP/99L4p0AY5DU8VXG8JgVeKO2mXyaWJRXin5ckSc7oh0mj3wPUlXr6jwe
         QGlsT0rac9eaOxMa2QzO+IZTl8DS6RgglfiRn9EaTBr9kXmODaAZ2eQPAkRXDg71FL
         AowHf+OrcavIIV/LdlB3lsikSE6NJ7sS1zoJProY5snbTHZuslKDd80kDfBIUcnS1q
         8tzLaytFCxrNw==
Date:   Sun, 7 Mar 2021 09:20:44 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v2] MIPS: kernel: Reserve exception base early to prevent
 corruption
Message-ID: <YER+zN0C8dvR41IS@kernel.org>
References: <20210306082910.3472-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210306082910.3472-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

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

-- 
Sincerely yours,
Mike.
