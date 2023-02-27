Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472796A414A
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 13:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjB0MBB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 07:01:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB0MBA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 07:01:00 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 97016E046
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 04:00:58 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pWcBd-00027t-00; Mon, 27 Feb 2023 13:00:57 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2DC10C0920; Mon, 27 Feb 2023 12:59:59 +0100 (CET)
Date:   Mon, 27 Feb 2023 12:59:59 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
Message-ID: <20230227115959.GA13590@alpha.franken.de>
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
 <20230225221008.8520-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225221008.8520-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 25, 2023 at 10:10:07PM +0000, Jiaxun Yang wrote:
> CP0_CMGCRBASE is not always available on CPS enabled system
> such as early proAptiv.
> 
> We patch the entry of CPS NMI vector to inject CMGCR address
> directly into register during early core bringup.
> 
> For VPE bringup as the core is already coherenct at that point
> we just read the variable to obtain the address.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/smp-cps.h |  4 ++++
>  arch/mips/kernel/cps-vec.S      | 35 ++++++++++++++-------------------
>  arch/mips/kernel/smp-cps.c      |  2 ++
>  3 files changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/mips/include/asm/smp-cps.h b/arch/mips/include/asm/smp-cps.h
> index 7e5b9411faee..22a572b70fe3 100644
> --- a/arch/mips/include/asm/smp-cps.h
> +++ b/arch/mips/include/asm/smp-cps.h
> @@ -7,6 +7,8 @@
>  #ifndef __MIPS_ASM_SMP_CPS_H__
>  #define __MIPS_ASM_SMP_CPS_H__
>  
> +#define CPS_ENTRY_PATCH_INSNS	6
> +
>  #ifndef __ASSEMBLY__
>  
>  struct vpe_boot_config {
> @@ -30,6 +32,8 @@ extern void mips_cps_boot_vpes(struct core_boot_config *cfg, unsigned vpe);
>  extern void mips_cps_pm_save(void);
>  extern void mips_cps_pm_restore(void);
>  
> +extern void *mips_cps_core_entry_patch_end;
> +
>  #ifdef CONFIG_MIPS_CPS
>  
>  extern bool mips_cps_smp_in_use(void);
> diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
> index 975343240148..fece0cca5548 100644
> --- a/arch/mips/kernel/cps-vec.S
> +++ b/arch/mips/kernel/cps-vec.S
> @@ -13,6 +13,7 @@
>  #include <asm/mipsregs.h>
>  #include <asm/mipsmtregs.h>
>  #include <asm/pm.h>
> +#include <asm/smp-cps.h>
>  
>  #define GCR_CPC_BASE_OFS	0x0088
>  #define GCR_CL_COHERENCE_OFS	0x2008
> @@ -80,25 +81,20 @@
>  	 nop
>  	.endm
>  
> -	/* Calculate an uncached address for the CM GCRs */
> -	.macro	cmgcrb	dest
> -	.set	push
> -	.set	noat
> -	MFC0	$1, CP0_CMGCRBASE
> -	PTR_SLL	$1, $1, 4
> -	PTR_LI	\dest, UNCAC_BASE
> -	PTR_ADDU \dest, \dest, $1
> -	.set	pop
> -	.endm
>  
>  .balign 0x1000
>  
>  LEAF(mips_cps_core_entry)
>  	/*
> -	 * These first 4 bytes will be patched by cps_smp_setup to load the
> -	 * CCA to use into register s0.
> +	 * These first several instructions will be patched by cps_smp_setup to load the
> +	 * CCA to use into register s0 and GCR base address to register s1.
>  	 */
> -	.word	0
> +	.rept   CPS_ENTRY_PATCH_INSNS
> +    nop
> +   .endr
> +
> +	.global mips_cps_core_entry_patch_end
> +mips_cps_core_entry_patch_end:
>  
>  	/* Check whether we're here due to an NMI */
>  	mfc0	k0, CP0_STATUS
> @@ -121,8 +117,7 @@ not_nmi:
>  	mtc0	t0, CP0_STATUS
>  
>  	/* Skip cache & coherence setup if we're already coherent */
> -	cmgcrb	v1
> -	lw	s7, GCR_CL_COHERENCE_OFS(v1)
> +	lw	s7, GCR_CL_COHERENCE_OFS(s1)
>  	bnez	s7, 1f
>  	 nop
>  
> @@ -132,7 +127,7 @@ not_nmi:
>  
>  	/* Enter the coherent domain */
>  	li	t0, 0xff
> -	sw	t0, GCR_CL_COHERENCE_OFS(v1)
> +	sw	t0, GCR_CL_COHERENCE_OFS(s1)
>  	ehb
>  
>  	/* Set Kseg0 CCA to that in s0 */
> @@ -305,8 +300,7 @@ LEAF(mips_cps_core_init)
>   */
>  LEAF(mips_cps_get_bootcfg)
>  	/* Calculate a pointer to this cores struct core_boot_config */
> -	cmgcrb	t0
> -	lw	t0, GCR_CL_ID_OFS(t0)
> +	lw	t0, GCR_CL_ID_OFS(s1)
>  	li	t1, COREBOOTCFG_SIZE
>  	mul	t0, t0, t1
>  	PTR_LA	t1, mips_cps_core_bootcfg
> @@ -366,8 +360,9 @@ LEAF(mips_cps_boot_vpes)
>  	has_vp	t0, 5f
>  
>  	/* Find base address of CPC */
> -	cmgcrb	t3
> -	PTR_L	t1, GCR_CPC_BASE_OFS(t3)
> +	PTR_LA	t1, mips_gcr_base
> +	PTR_L	t1, 0(t1)
> +	PTR_L	t1, GCR_CPC_BASE_OFS(t1)
>  	PTR_LI	t2, ~0x7fff
>  	and	t1, t1, t2
>  	PTR_LI	t2, UNCAC_BASE
> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> index f2df0cae1b4d..4fc288bb85b9 100644
> --- a/arch/mips/kernel/smp-cps.c
> +++ b/arch/mips/kernel/smp-cps.c
> @@ -162,6 +162,8 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
>  	 */
>  	entry_code = (u32 *)&mips_cps_core_entry;
>  	uasm_i_addiu(&entry_code, 16, 0, cca);
> +	UASM_i_LA(&entry_code, 17, (long)mips_gcr_base);
> +	BUG_ON((void *)entry_code > (void *)&mips_cps_core_entry_patch_end);
>  	blast_dcache_range((unsigned long)&mips_cps_core_entry,
>  			   (unsigned long)entry_code);
>  	bc_wback_inv((unsigned long)&mips_cps_core_entry,

why do you need to patch that in ? Would replacing cmgcrb by a
PTR_LA  t1, mips_gcr_base in arch/mips/kernel/cps-vec.S do the same thing ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
