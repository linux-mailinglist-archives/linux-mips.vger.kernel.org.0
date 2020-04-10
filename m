Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6BF1A43A3
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2020 10:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgDJIma (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Apr 2020 04:42:30 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:54496 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgDJIma (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Apr 2020 04:42:30 -0400
X-Greylist: delayed 379 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 Apr 2020 04:42:30 EDT
Received: from flygoat-x1e (unknown [IPv6:240e:390:499:a20::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 26A9F2022B;
        Fri, 10 Apr 2020 08:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1586507771; bh=0pgFuS6hYGazgfoGgXda4UZJLUuB0sacJswLmnmRtd8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=szLRbkR91sIV3aJsYTHGrKj797pe2U+qLc4H0X0mMgiiM4K+wnMuEibbc33zdNCjj
         Z6sSYW+hbPxqYt5WhV41fSkx5xe5oCqb+k1duEO16E1fa/jqxLSMp0tgE8fMjhKgu0
         T42oAPfcQPPVy+ZOF/GzNJcz77ouKk9SDRNHYRsqxopLFqH5S0JDPKDJNfQ8G/Pg7X
         KXc0kNgRI7TnrICkl2uylVgk7GCqsuf47KyRshb2dZ5VcyHRC41qrG9O+QteikVA7p
         M5rrTtm0fxUWI4YDvRU3a+bKs/olJqsb2R/kQjQaunZkL4JpPIE8HRZBZkS9IVRVjw
         aQB3O0DIvVPkQ==
Date:   Fri, 10 Apr 2020 16:36:03 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH v2] MIPS: Limit check_bugs32() to affected platform
Message-ID: <20200410163603.22cc8b93@flygoat-x1e>
In-Reply-To: <1586488859-18715-1-git-send-email-yangtiezhu@loongson.cn>
References: <1586488859-18715-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 10 Apr 2020 11:20:59 +0800
Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> In the current code, check_bugs32() only handles MIPS32 CPU type
> CPU_34K, it is better to build and call it on the affected platform.
> 
> Move check_bugs32() to the new added 34k-bugs32.c to indicate the
> fact that the code is specific to the 34k CPU, and also add
> CONFIG_CPU_34K_BUGS32 to control whether or not check the bugs.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

+Maciej, that's basically what I want.

Thanks.

> ---
> 
> v2:
>   - Add new 34k-bugs32.c
>   - Rename check_errata() to check_errata32()
>   - Add CONFIG_CPU_34K_BUGS32
>   - Modify commit message
> 
>  arch/mips/Kconfig             |  4 ++++
>  arch/mips/include/asm/bugs.h  |  4 +++-
>  arch/mips/kernel/34k-bugs32.c | 29 +++++++++++++++++++++++++++++
>  arch/mips/kernel/Makefile     |  1 +
>  arch/mips/kernel/cpu-probe.c  | 25 -------------------------
>  5 files changed, 37 insertions(+), 26 deletions(-)
>  create mode 100644 arch/mips/kernel/34k-bugs32.c
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index a1f973c..d95dc18 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2619,6 +2619,10 @@ config CPU_R4X00_BUGS64
>  	bool
>  	default y if SYS_HAS_CPU_R4X00 && 64BIT && (TARGET_ISA_REV <
> 1) 
> +config CPU_34K_BUGS32
> +	bool
> +	default y if CPU_MIPS32_R2
> +
>  config MIPS_ASID_SHIFT
>  	int
>  	default 6 if CPU_R3000 || CPU_TX39XX
> diff --git a/arch/mips/include/asm/bugs.h
> b/arch/mips/include/asm/bugs.h index d72dc6e..bbf843a 100644
> --- a/arch/mips/include/asm/bugs.h
> +++ b/arch/mips/include/asm/bugs.h
> @@ -35,7 +35,9 @@ static inline void check_bugs(void)
>  	unsigned int cpu = smp_processor_id();
>  
>  	cpu_data[cpu].udelay_val = loops_per_jiffy;
> -	check_bugs32();
> +
> +	if (IS_ENABLED(CONFIG_CPU_34K_BUGS32))
> +		check_bugs32();
>  
>  	if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
>  		check_bugs64();
> diff --git a/arch/mips/kernel/34k-bugs32.c
> b/arch/mips/kernel/34k-bugs32.c new file mode 100644
> index 0000000..dc3ac01
> --- /dev/null
> +++ b/arch/mips/kernel/34k-bugs32.c
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <asm/cpu.h>
> +#include <asm/cpu-info.h>
> +#include <asm/cpu-type.h>
> +#include <asm/bugs.h>
> +
> +static inline void check_errata32(void)
> +{
> +	struct cpuinfo_mips *c = &current_cpu_data;
> +
> +	switch (current_cpu_type()) {
> +	case CPU_34K:
> +		/*
> +		 * Erratum "RPS May Cause Incorrect Instruction
> Execution"
> +		 * This code only handles VPE0, any SMP/RTOS code
> +		 * making use of VPE1 will be responsable for that
> VPE.
> +		 */
> +		if ((c->processor_id & PRID_REV_MASK) <=
> PRID_REV_34K_V1_0_2)
> +			write_c0_config7(read_c0_config7() |
> MIPS_CONF7_RPS);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +void __init check_bugs32(void)
> +{
> +	check_errata32();
> +}
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index d6e97df..c2fd191 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_PROC_FS)		+= proc.o
>  obj-$(CONFIG_MAGIC_SYSRQ)	+= sysrq.o
>  
>  obj-$(CONFIG_CPU_R4X00_BUGS64)	+= r4k-bugs64.o
> +obj-$(CONFIG_CPU_34K_BUGS32)	+= 34k-bugs32.o
>  
>  obj-$(CONFIG_I8253)		+= i8253.o
>  
> diff --git a/arch/mips/kernel/cpu-probe.c
> b/arch/mips/kernel/cpu-probe.c index f21a230..7179787 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -14,7 +14,6 @@
>  #include <linux/stddef.h>
>  #include <linux/export.h>
>  
> -#include <asm/bugs.h>
>  #include <asm/cpu.h>
>  #include <asm/cpu-features.h>
>  #include <asm/cpu-type.h>
> @@ -461,30 +460,6 @@ static inline void cpu_set_mt_per_tc_perf(struct
> cpuinfo_mips *c) c->options |= MIPS_CPU_MT_PER_TC_PERF_COUNTERS;
>  }
>  
> -static inline void check_errata(void)
> -{
> -	struct cpuinfo_mips *c = &current_cpu_data;
> -
> -	switch (current_cpu_type()) {
> -	case CPU_34K:
> -		/*
> -		 * Erratum "RPS May Cause Incorrect Instruction
> Execution"
> -		 * This code only handles VPE0, any SMP/RTOS code
> -		 * making use of VPE1 will be responsable for that
> VPE.
> -		 */
> -		if ((c->processor_id & PRID_REV_MASK) <=
> PRID_REV_34K_V1_0_2)
> -			write_c0_config7(read_c0_config7() |
> MIPS_CONF7_RPS);
> -		break;
> -	default:
> -		break;
> -	}
> -}
> -
> -void __init check_bugs32(void)
> -{
> -	check_errata();
> -}
> -
>  /*
>   * Probe whether cpu has config register by trying to play with
>   * alternate cache bit and see whether it matters.

