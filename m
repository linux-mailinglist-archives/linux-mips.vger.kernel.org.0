Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6323623044C
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 09:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgG1HmT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 03:42:19 -0400
Received: from [115.28.160.31] ([115.28.160.31]:56638 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726933AbgG1HmT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 03:42:19 -0400
Received: from hanazono.local (unknown [116.236.177.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5F41660130;
        Tue, 28 Jul 2020 15:40:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1595922052; bh=vHFhWKvgLMmmMRFI66ls5Kh8aPKsY6ouyAZJsKO/jJo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=J5QTwyw0vfZF/Mx33OXJMO34bE03AiWcYW6U6Oc9bEJNqGwnAssl0ratbDYGv865R
         Lwk1tbuxByrz2cKTnE+bZV+6BkNIMEs3kzsw1nU7atQNMpnzHHt8txdiEsGprnHaCK
         I4ad8RpQkeUVEOxyWyInfpnN9Ba/pdnPlll6N2Js=
Subject: Re: [PATCH v3 3/3] MIPS: handle Loongson-specific GSExc exception
To:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200727165108.2378227-1-git@xen0n.name>
 <20200727165108.2378227-4-git@xen0n.name>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <cca0cb1d-31f5-ce9c-dbcf-aab25674f8e7@xen0n.name>
Date:   Tue, 28 Jul 2020 15:40:51 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:80.0)
 Gecko/20100101 Thunderbird/80.0a1
MIME-Version: 1.0
In-Reply-To: <20200727165108.2378227-4-git@xen0n.name>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020/7/28 00:51, WANG Xuerui wrote:
> Newer Loongson cores (Loongson-3A R2 and newer) use the
> implementation-dependent ExcCode 16 to signal Loongson-specific
> exceptions. The extended cause is put in the non-standard CP0.Diag1
> register which is CP0 Register 22 Select 1, called GSCause in Loongson
> manuals. Inside is an exception code bitfield called GSExcCode, only
> codes 0 to 6 inclusive are documented (so far, in the Loongson 3A3000
> User Manual, Volume 2).
>
> During experiments, it was found that some undocumented unprivileged
> instructions can trigger the also-undocumented GSExcCode 8 on Loongson
> 3A4000. Processor state is not corrupted, but we cannot continue without
> further knowledge, and Loongson is not providing that information as of
> this writing. So we send SIGILL on seeing this exception code to thwart
> easy local DoS attacks.
>
> Other exception codes are made fatal, partly because of insufficient
> knowledge, also partly because they are not as easily reproduced. None
> of them are encountered in the wild with upstream kernels and userspace
> so far.
>
> Some older cores (Loongson-3A1000 and Loongson-3B1500) have ExcCode 16
> too, but the semantic is equivalent to GSExcCode 0. Because the
> respective manuals did not mention the CP0.Diag1 register or its read
> behavior, these cores are not covered in this patch, as MFC0 from
> non-existent CP0 registers is UNDEFINED according to the MIPS
> architecture spec.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Cc: Huacai Chen <chenhc@lemote.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/cpu-features.h |  4 ++++
>  arch/mips/include/asm/cpu.h          |  1 +
>  arch/mips/include/asm/mipsregs.h     |  3 +++
>  arch/mips/kernel/cpu-probe.c         |  3 +++
>  arch/mips/kernel/genex.S             |  7 ++++++
>  arch/mips/kernel/traps.c             | 35 ++++++++++++++++++++++++++++
>  6 files changed, 53 insertions(+)
>
> diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
> index 0b1bc7ed913b..78cf7e300f12 100644
> --- a/arch/mips/include/asm/cpu-features.h
> +++ b/arch/mips/include/asm/cpu-features.h
> @@ -572,6 +572,10 @@
>  # define cpu_has_ftlbparex	__opt(MIPS_CPU_FTLBPAREX)
>  #endif
>  
> +#ifndef cpu_has_gsexcex
> +# define cpu_has_gsexcex	__opt(MIPS_CPU_GSEXCEX)
> +#endif
> +
>  #ifdef CONFIG_SMP
>  /*
>   * Some systems share FTLB RAMs between threads within a core (siblings in
> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
> index 3a4773714b29..1b4a67c84538 100644
> --- a/arch/mips/include/asm/cpu.h
> +++ b/arch/mips/include/asm/cpu.h
> @@ -426,6 +426,7 @@ enum cpu_type_enum {
>  #define MIPS_CPU_MM_FULL	BIT_ULL(59)	/* CPU supports write-through full merge */
>  #define MIPS_CPU_MAC_2008_ONLY	BIT_ULL(60)	/* CPU Only support MAC2008 Fused multiply-add instruction */
>  #define MIPS_CPU_FTLBPAREX	BIT_ULL(61)	/* CPU has FTLB parity exception */
> +#define MIPS_CPU_GSEXCEX	BIT_ULL(62)	/* CPU has GSExc exception */
>  
>  /*
>   * CPU ASE encodings
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index 5ba268266d16..4ddc12e4444a 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -474,6 +474,9 @@
>  /* Implementation specific trap codes used by MIPS cores */
>  #define MIPS_EXCCODE_TLBPAR	16	/* TLB parity error exception */
>  
> +/* Implementation specific trap codes used by Loongson cores */
> +#define LOONGSON_EXCCODE_GSEXC	16	/* Loongson-specific exception */
> +
>  /*
>   * Bits in the coprocessor 0 config register.
>   */
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 9e325862e810..9bb4a8732847 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -2043,6 +2043,9 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>  {
>  	decode_configs(c);
>  
> +	/* All Loongson processors covered here define ExcCode 16 as GSExc. */
> +	c->options |= MIPS_CPU_GSEXCEX;
> +
>  	switch (c->processor_id & PRID_IMP_MASK) {
>  	case PRID_IMP_LOONGSON_64R: /* Loongson-64 Reduced */
>  		switch (c->processor_id & PRID_REV_MASK) {
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index a1b966f3578e..a7fe30363dda 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -498,6 +498,12 @@ NESTED(nmi_handler, PT_SIZE, sp)
>  	KMODE
>  	.endm
>  
> +	.macro __build_clear_gsexc
> +	MFC0	a1, CP0_DIAGNOSTIC1

This should be "mfc0" as the register is 32-bit. I'll send v4 soon;
sorry for not noticing this.

> +	TRACE_IRQS_ON
> +	STI
> +	.endm
> +
>  	.macro	__BUILD_silent exception
>  	.endm
>  
> @@ -556,6 +562,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
>  	BUILD_HANDLER fpe fpe fpe silent		/* #15 */
>  #endif
>  	BUILD_HANDLER ftlb ftlb none silent		/* #16 */
> +	BUILD_HANDLER gsexc gsexc gsexc silent		/* #16 */
>  	BUILD_HANDLER msa msa sti silent		/* #21 */
>  	BUILD_HANDLER mdmx mdmx sti silent		/* #22 */
>  #ifdef	CONFIG_HARDWARE_WATCHPOINTS
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 25a8a0d441be..fdb51e1f5f84 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -90,6 +90,7 @@ extern asmlinkage void handle_tr(void);
>  extern asmlinkage void handle_msa_fpe(void);
>  extern asmlinkage void handle_fpe(void);
>  extern asmlinkage void handle_ftlb(void);
> +extern asmlinkage void handle_gsexc(void);
>  extern asmlinkage void handle_msa(void);
>  extern asmlinkage void handle_mdmx(void);
>  extern asmlinkage void handle_watch(void);
> @@ -1900,6 +1901,37 @@ asmlinkage void do_ftlb(void)
>  	cache_parity_error();
>  }
>  
> +asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1)
> +{
> +	u32 exccode = (diag1 & LOONGSON_DIAG1_EXCCODE) >>
> +			LOONGSON_DIAG1_EXCCODE_SHIFT;
> +	enum ctx_state prev_state;
> +
> +	prev_state = exception_enter();
> +
> +	switch (exccode) {
> +	case 0x08:
> +		/* Undocumented exception, will trigger on certain
> +		 * also-undocumented instructions accessible from userspace.
> +		 * Processor state is not otherwise corrupted, but currently
> +		 * we don't know how to proceed. Maybe there is some
> +		 * undocumented control flag to enable the instructions?
> +		 */
> +		force_sig(SIGILL);
> +		break;
> +
> +	default:
> +		/* None of the other exceptions, documented or not, have
> +		 * further details given; none are encountered in the wild
> +		 * either. Panic in case some of them turn out to be fatal.
> +		 */
> +		show_regs(regs);
> +		panic("Unhandled Loongson exception - GSCause = %08x", diag1);
> +	}
> +
> +	exception_exit(prev_state);
> +}
> +
>  /*
>   * SDBBP EJTAG debug exception handler.
>   * We skip the instruction and return to the next instruction.
> @@ -2457,6 +2489,9 @@ void __init trap_init(void)
>  	if (cpu_has_ftlbparex)
>  		set_except_vector(MIPS_EXCCODE_TLBPAR, handle_ftlb);
>  
> +	if (cpu_has_gsexcex)
> +		set_except_vector(LOONGSON_EXCCODE_GSEXC, handle_gsexc);
> +
>  	if (cpu_has_rixiex) {
>  		set_except_vector(EXCCODE_TLBRI, tlb_do_page_fault_0);
>  		set_except_vector(EXCCODE_TLBXI, tlb_do_page_fault_0);
