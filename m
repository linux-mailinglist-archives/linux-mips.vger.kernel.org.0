Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18EE96DB3D1
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 21:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbjDGS7r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 14:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjDGS7b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 14:59:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53515114
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 11:57:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 332E264AE8
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 18:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4759EC433EF;
        Fri,  7 Apr 2023 18:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680893845;
        bh=08+PB7IhGQqaFjr+KLD52Zlv7Sd6C4hfxKhbAzJO4IU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NCSMEZw4LDCwlX9jKhErbWA1BZySwMKpH7aSQvPvWo9oxScgqaE4B5WvU1TVmkDtV
         3/uRxzD6Uq+kh0l6Ibr4jCat2pXYuk0iWKQZX9OhDj+10S3cUBWDEAlYca95WWUsdy
         Q6DNCYxozyN48JFLMavgFVdorPxdbkvIauL33MLpi9EjQmFVMjmRyV0vWvQod/sROe
         l/DhDW3yVrpDtK14vUt0BAgO/fY4r2KTFk6UycD5xdq8HQgA4k8rWW51c59SRyLB+C
         nvM8E1qlD7BsxHwSNS51sKKIf/+BLZnLdC6P0OeZaUsln7iPKCKvyvas609fBIEMNw
         T9AbRB6tzm6ig==
Date:   Fri, 7 Apr 2023 11:57:23 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        tsbogend@alpha.franken.de, ndesaulniers@google.com
Subject: Re: [PATCH 1/5] MIPS: Move various toolchain ASE check to Kconfig
Message-ID: <20230407185723.GA1511753@dev-arch.thelio-3990X>
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
 <20230407102721.14814-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407102721.14814-2-jiaxun.yang@flygoat.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Fri, Apr 07, 2023 at 11:27:17AM +0100, Jiaxun Yang wrote:
> Use Kconfig to perform Kconfig toolchain feature check, so we will
> be able to have toolchain feature availablility information in Kconfig
> to guard relevant options.
> 

First of all, thank you a lot for this series! I applied them on top of
mips-next and my allnoconfig issue appears to be gone. However, with
this change, 32r1{,el}_defconfig is broken for arch/mips/kernel/traps.c.

$ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux-gnu- LLVM=1 LLVM_IAS=0 O=build mrproper 32r1_defconfig arch/mips/kernel/traps.o
...
/tmp/traps-f8ea56.s: Assembler messages:
/tmp/traps-f8ea56.s:8227: Error: `fp=64' used with a 32-bit fpu
/tmp/traps-f8ea56.s:8228: Error: `fp=64' used with a 32-bit fpu
/tmp/traps-f8ea56.s:8228: Warning: the `msa' extension requires MIPS32 revision 2 or greater
clang: error: assembler command failed with exit code 1 (use -v to see invocation)
...

In case it matters:

$ clang --version | head -1
ClangBuiltLinux clang version 16.0.1

$ mips-linux-gnu-as --version | head -1
GNU assembler (GNU Binutils) 2.40

A few comments below, I have not tested anything beyond this.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig                | 27 +++++++++++++++++++++++++++
>  arch/mips/Makefile               | 29 +++--------------------------
>  arch/mips/crypto/crc32-mips.c    |  4 ++--
>  arch/mips/include/asm/asmmacro.h |  8 ++++----
>  arch/mips/include/asm/ginvt.h    |  2 +-
>  arch/mips/include/asm/mipsregs.h | 10 +++++-----
>  arch/mips/include/asm/msa.h      |  4 ++--
>  7 files changed, 44 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 770d098b11bf..c52401c155a4 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3157,6 +3157,12 @@ config MIPS32_N32
>  
>  	  If unsure, say N.
>  
> +config CC_HAS_SMARTMIPS
> +	def_bool $(cc-option,-mmicromips)

-msmartmips?

> +
> +config CC_HAS_MICROMIPS
> +	def_bool $(cc-option,-mmicromips)

Neither of these configurations are used in this change. Should they be
moved to the next change in the series?

>  config CC_HAS_MNO_BRANCH_LIKELY
>  	def_bool y
>  	depends on $(cc-option,-mno-branch-likely)
> @@ -3165,6 +3171,27 @@ config CC_HAS_MNO_BRANCH_LIKELY
>  config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
>  	def_bool y if CC_IS_CLANG
>  
> +config AS_HAS_MSA
> +	def_bool $(cc-option,-Wa$(comma)-mmsa)
> +
> +config AS_HAS_VIRT
> +	def_bool $(cc-option,-Wa$(comma)-mvirt)
> +
> +# For -mmicromips, use -Wa,-fatal-warnings to catch unsupported -mxpa which
> +# only warns
> +config AS_HAS_XPA
> +	def_bool $(cc-option,-Wa$(comma)-mxpa) if !CPU_MICROMIPS
> +	def_bool $(cc-option,-mmicromips -Wa$(comma)-fatal-warnings -Wa$(comma)-mxpa) if CPU_MICROMIPS
> +
> +config AS_HAS_CRC
> +	def_bool $(cc-option,-Wa$(comma)-mcrc)
> +
> +config AS_HAS_DSP
> +	def_bool $(cc-option,-Wa$(comma)-mdsp)
> +
> +config AS_HAS_GINV
> +	def_bool $(cc-option,-Wa$(comma)-mginv)
> +
>  menu "Power management options"
>  
>  config ARCH_HIBERNATION_POSSIBLE
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index a7a4ee66a9d3..3aa0f9d4ceb6 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -233,32 +233,9 @@ cflags-$(CONFIG_CPU_LOONGSON64)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson
>  # Pass -Wa,--no-warn to disable all assembler warnings until the kernel code has
>  # been fixed properly.
>  mips-cflags				:= $(cflags-y)
> -ifeq ($(CONFIG_CPU_HAS_SMARTMIPS),y)
> -smartmips-ase				:= $(call cc-option-yn,$(mips-cflags) -msmartmips)
> -cflags-$(smartmips-ase)			+= -msmartmips -Wa,--no-warn
> -endif
> -ifeq ($(CONFIG_CPU_MICROMIPS),y)
> -micromips-ase				:= $(call cc-option-yn,$(mips-cflags) -mmicromips)
> -cflags-$(micromips-ase)			+= -mmicromips
> -endif
> -ifeq ($(CONFIG_CPU_HAS_MSA),y)
> -toolchain-msa				:= $(call cc-option-yn,$(mips-cflags) -mhard-float -mfp64 -Wa$(comma)-mmsa)
> -cflags-$(toolchain-msa)			+= -DTOOLCHAIN_SUPPORTS_MSA
> -endif
> -toolchain-virt				:= $(call cc-option-yn,$(mips-cflags) -mvirt)
> -cflags-$(toolchain-virt)		+= -DTOOLCHAIN_SUPPORTS_VIRT
> -# For -mmicromips, use -Wa,-fatal-warnings to catch unsupported -mxpa which
> -# only warns
> -xpa-cflags-y				:= $(mips-cflags)
> -xpa-cflags-$(micromips-ase)		+= -mmicromips -Wa$(comma)-fatal-warnings
> -toolchain-xpa				:= $(call cc-option-yn,$(xpa-cflags-y) -mxpa)
> -cflags-$(toolchain-xpa)			+= -DTOOLCHAIN_SUPPORTS_XPA
> -toolchain-crc				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mcrc)
> -cflags-$(toolchain-crc)			+= -DTOOLCHAIN_SUPPORTS_CRC
> -toolchain-dsp				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mdsp)
> -cflags-$(toolchain-dsp)			+= -DTOOLCHAIN_SUPPORTS_DSP
> -toolchain-ginv				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mginv)
> -cflags-$(toolchain-ginv)		+= -DTOOLCHAIN_SUPPORTS_GINV
> +
> +cflags-$(CONFIG_CPU_HAS_SMARTMIPS)	+= -msmartmips -Wa,--no-warn
> +cflags-$(CONFIG_CPU_MICROMIPS)		+= -mmicromips
>  
>  #
>  # Firmware support
> diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
> index 3e4f5ba104f8..54bbcfae06d5 100644
> --- a/arch/mips/crypto/crc32-mips.c
> +++ b/arch/mips/crypto/crc32-mips.c
> @@ -27,7 +27,7 @@ enum crc_type {
>  	crc32c,
>  };
>  
> -#ifndef TOOLCHAIN_SUPPORTS_CRC
> +#ifndef CONFIG_AS_HAS_CRC
>  #define _ASM_SET_CRC(OP, SZ, TYPE)					  \
>  _ASM_MACRO_3R(OP, rt, rs, rt2,						  \
>  	".ifnc	\\rt, \\rt2\n\t"					  \
> @@ -38,7 +38,7 @@ _ASM_MACRO_3R(OP, rt, rs, rt2,						  \
>  	_ASM_INSN32_IF_MM(0x00000030 | (__rs << 16) | (__rt << 21) |	  \
>  			  ((SZ) << 14) | ((TYPE) << 3)))
>  #define _ASM_UNSET_CRC(op, SZ, TYPE) ".purgem " #op "\n\t"
> -#else /* !TOOLCHAIN_SUPPORTS_CRC */
> +#else /* !CONFIG_AS_HAS_CRC */
>  #define _ASM_SET_CRC(op, SZ, TYPE) ".set\tcrc\n\t"
>  #define _ASM_UNSET_CRC(op, SZ, TYPE)
>  #endif
> diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
> index 067a635d3bc8..74c2dedc55b4 100644
> --- a/arch/mips/include/asm/asmmacro.h
> +++ b/arch/mips/include/asm/asmmacro.h
> @@ -239,7 +239,7 @@
>  	 .word	0x41800000 | (\rt << 16) | (\rd << 11) | (\u << 5) | (\sel)
>  	.endm
>  
> -#ifdef TOOLCHAIN_SUPPORTS_MSA
> +#ifdef CONFIG_AS_HAS_MSA
>  	.macro	_cfcmsa	rd, cs
>  	.set	push
>  	.set	mips32r2
> @@ -507,7 +507,7 @@
>  	.endm
>  #endif
>  
> -#ifdef TOOLCHAIN_SUPPORTS_MSA
> +#ifdef CONFIG_AS_HAS_MSA
>  #define FPR_BASE_OFFS	THREAD_FPR0
>  #define FPR_BASE	$1
>  #else
> @@ -518,7 +518,7 @@
>  	.macro	msa_save_all	thread
>  	.set	push
>  	.set	noat
> -#ifdef TOOLCHAIN_SUPPORTS_MSA
> +#ifdef CONFIG_AS_HAS_MSA
>  	PTR_ADDU FPR_BASE, \thread, FPR_BASE_OFFS
>  #endif
>  	st_d	 0, THREAD_FPR0  - FPR_BASE_OFFS, FPR_BASE
> @@ -565,7 +565,7 @@
>  	.set	hardfloat
>  	lw	$1, THREAD_MSA_CSR(\thread)
>  	_ctcmsa	MSA_CSR, $1
> -#ifdef TOOLCHAIN_SUPPORTS_MSA
> +#ifdef CONFIG_AS_HAS_MSA
>  	PTR_ADDU FPR_BASE, \thread, FPR_BASE_OFFS
>  #endif
>  	ld_d	 0, THREAD_FPR0  - FPR_BASE_OFFS, FPR_BASE
> diff --git a/arch/mips/include/asm/ginvt.h b/arch/mips/include/asm/ginvt.h
> index 87b2974ffc53..20244a622552 100644
> --- a/arch/mips/include/asm/ginvt.h
> +++ b/arch/mips/include/asm/ginvt.h
> @@ -10,7 +10,7 @@ enum ginvt_type {
>  	GINVT_MMID,
>  };
>  
> -#ifdef TOOLCHAIN_SUPPORTS_GINV
> +#ifdef CONFIG_AS_HAS_GINV
>  # define _ASM_SET_GINV	".set	ginv\n"
>  # define _ASM_UNSET_GINV
>  #else
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index 2d53704d9f24..8f0ebc399338 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -1604,7 +1604,7 @@ do {									\
>  	local_irq_restore(__flags);					\
>  } while (0)
>  
> -#ifndef TOOLCHAIN_SUPPORTS_XPA
> +#ifndef CONFIG_AS_HAS_XPA
>  #define _ASM_SET_MFHC0							\
>  	_ASM_MACRO_2R_1S(mfhc0, rt, rs, sel,				\
>  			 _ASM_INSN_IF_MIPS(0x40400000 | __rt << 16 | __rs << 11 | \\sel)	\
> @@ -1615,7 +1615,7 @@ do {									\
>  			 _ASM_INSN_IF_MIPS(0x40c00000 | __rt << 16 | __rd << 11 | \\sel)	\
>  			 _ASM_INSN32_IF_MM(0x000002f4 | __rt << 21 | __rd << 16 | \\sel << 11))
>  #define _ASM_UNSET_MTHC0 ".purgem mthc0\n\t"
> -#else	/* !TOOLCHAIN_SUPPORTS_XPA */
> +#else	/* !CONFIG_AS_HAS_XPA */
>  #define _ASM_SET_MFHC0 ".set\txpa\n\t"
>  #define _ASM_SET_MTHC0 ".set\txpa\n\t"
>  #define _ASM_UNSET_MFHC0
> @@ -2040,7 +2040,7 @@ do {									\
>   * Macros to access the guest system control coprocessor
>   */
>  
> -#ifndef TOOLCHAIN_SUPPORTS_VIRT
> +#ifndef CONFIG_AS_HAS_VIRT
>  #define _ASM_SET_MFGC0							\
>  	_ASM_MACRO_2R_1S(mfgc0, rt, rs, sel,				\
>  			 _ASM_INSN_IF_MIPS(0x40600000 | __rt << 16 | __rs << 11 | \\sel)	\
> @@ -2077,7 +2077,7 @@ do {									\
>  #define __tlbginvf()							\
>  		_ASM_INSN_IF_MIPS(0x4200000c)				\
>  		_ASM_INSN32_IF_MM(0x0000517c)
> -#else	/* !TOOLCHAIN_SUPPORTS_VIRT */
> +#else	/* !CONFIG_AS_HAS_VIRT */
>  #define _ASM_SET_VIRT ".set\tvirt\n\t"
>  #define _ASM_SET_MFGC0	_ASM_SET_VIRT
>  #define _ASM_SET_DMFGC0	_ASM_SET_VIRT
> @@ -2395,7 +2395,7 @@ do {									\
>  	: : "r" (val));							\
>  } while (0)
>  
> -#ifdef TOOLCHAIN_SUPPORTS_DSP
> +#ifdef CONFIG_AS_HAS_DSP
>  #define rddsp(mask)							\
>  ({									\
>  	unsigned int __dspctl;						\
> diff --git a/arch/mips/include/asm/msa.h b/arch/mips/include/asm/msa.h
> index 236a49ee2e3e..a9ca57e3f780 100644
> --- a/arch/mips/include/asm/msa.h
> +++ b/arch/mips/include/asm/msa.h
> @@ -156,7 +156,7 @@ static inline void init_msa_upper(void)
>  	_init_msa_upper();
>  }
>  
> -#ifndef TOOLCHAIN_SUPPORTS_MSA
> +#ifndef CONFIG_AS_HAS_MSA
>  /*
>   * Define assembler macros using .word for the c[ft]cmsa instructions in order
>   * to allow compilation with toolchains that do not support MSA. Once all
> @@ -173,7 +173,7 @@ static inline void init_msa_upper(void)
>  		      _ASM_INSN_IF_MIPS(0x783e0019 | __rs << 11 | __cd << 6)	\
>  		      _ASM_INSN32_IF_MM(0x583e0016 | __rs << 11 | __cd << 6))
>  #define _ASM_UNSET_CTCMSA ".purgem ctcmsa\n\t"
> -#else /* TOOLCHAIN_SUPPORTS_MSA */
> +#else /* CONFIG_AS_HAS_MSA */
>  #define _ASM_SET_CFCMSA						\
>  		".set\tfp=64\n\t"				\
>  		".set\tmsa\n\t"
> -- 
> 2.39.2 (Apple Git-143)
> 
