Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609DD3EE406
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 03:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbhHQB7g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 21:59:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:41514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233238AbhHQB7g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Aug 2021 21:59:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B510E60F39;
        Tue, 17 Aug 2021 01:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629165544;
        bh=iBob8UvzYvMxmIw7mBaviKChAwkVHytVKD2I0NLriA4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=czWjn7imJZW6KX+MtUeCuw5HcZolu+dgdD1l6cf2zbMJv9m4a9YtMyHlI0kAdCpiy
         akoane4e/B52MiDXMC8k+ILaval+8Duf0QNrVNRF2FnO2wiEgaxouDa7ObQjaO85Bt
         ZthPxtKySfZB5uCQ86NGASLsL9jiNj+actkOnimDaJvDXBoZ3CkxZ9oPuoA+ydb0R8
         xcUzpl0p+235YsMsp/lvukQm2mXbBPCrfLkv+3vWnjqqcd2gFORSU+1Xp7vnLTEd3w
         sup6g8ZY6tEk/vgvNtoqWvPFPTQdJxuMt6ETyAidp9gDdBbcyfjjnSJqZAYk3iMc11
         xVqOCWzpfiNcA==
Subject: Re: [PATCH 1/7] MIPS: replace cc-option-yn uses with cc-option
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-2-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <10d51e35-fc80-ba8f-6843-74d83e9e47b7@kernel.org>
Date:   Mon, 16 Aug 2021 18:59:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817002109.2736222-2-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> cc-option-yn can be replaced with cc-option. ie.
> Checking for support:
> ifeq ($(call cc-option-yn,$(FLAG)),y)
> becomes:
> ifneq ($(call cc-option,$(FLAG)),)
> 
> Checking for lack of support:
> ifeq ($(call cc-option-yn,$(FLAG)),n)
> becomes:
> ifeq ($(call cc-option,$(FLAG)),)
> 
> This allows us to pursue removing cc-option-yn.
> 
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>   arch/mips/Makefile          | 44 ++++++++++++++++++-------------------
>   arch/mips/sgi-ip22/Platform |  4 ++--
>   2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index ea3cd080a1c7..f4b9850f17fa 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -58,9 +58,7 @@ endif
>   
>   ifdef CONFIG_FUNCTION_GRAPH_TRACER
>     ifndef KBUILD_MCOUNT_RA_ADDRESS
> -    ifeq ($(call cc-option-yn,-mmcount-ra-address), y)
> -      cflags-y += -mmcount-ra-address -DKBUILD_MCOUNT_RA_ADDRESS
> -    endif
> +    cflags-y += $(call cc-option,-mmcount-ra-address -DKBUILD_MCOUNT_RA_ADDRESS)
>     endif
>   endif
>   cflags-y += $(call cc-option, -mno-check-zero-division)
> @@ -208,31 +206,33 @@ cflags-$(CONFIG_CPU_DADDI_WORKAROUNDS)	+= $(call cc-option,-mno-daddi,)
>   # been fixed properly.
>   mips-cflags				:= $(cflags-y)
>   ifeq ($(CONFIG_CPU_HAS_SMARTMIPS),y)
> -smartmips-ase				:= $(call cc-option-yn,$(mips-cflags) -msmartmips)
> -cflags-$(smartmips-ase)			+= -msmartmips -Wa,--no-warn
> +cflags-y	+= $(call cc-option,-msmartmips -Wa$(comma)--no-warn)

I do not think this diff and most of the ones that follow are 
equivalent, as you are no longer including the previously checked flags 
in the cc-option invocation, which could change the result (options that 
follow may depend on a prior selected flag).

I think that as long as you add $(cflags-y) to all of the cc-option 
tests, it should be fine. I guess cflags-y could be eliminated but it 
looks like this variable exists so that the flags can be added to both 
KBUILD_CFLAGS and KBUILD_AFLAGS at the same time so removing it would 
duplicate a lot of things.

>   endif
>   ifeq ($(CONFIG_CPU_MICROMIPS),y)
> -micromips-ase				:= $(call cc-option-yn,$(mips-cflags) -mmicromips)
> -cflags-$(micromips-ase)			+= -mmicromips
> +cflags-y	+= $(call cc-option,-mmicromips)
>   endif
>   ifeq ($(CONFIG_CPU_HAS_MSA),y)
> -toolchain-msa				:= $(call cc-option-yn,$(mips-cflags) -mhard-float -mfp64 -Wa$(comma)-mmsa)
> -cflags-$(toolchain-msa)			+= -DTOOLCHAIN_SUPPORTS_MSA
> +ifneq ($(call cc-option,-mhard-float -mfp64 -Wa$(comma)-mmsa),)
> +cflags-y	+= -DTOOLCHAIN_SUPPORTS_MSA
> +endif
> +endif
> +ifneq ($(call cc-option,-mvirt),)
> +cflags-y	+= -DTOOLCHAIN_SUPPORTS_VIRT
>   endif
> -toolchain-virt				:= $(call cc-option-yn,$(mips-cflags) -mvirt)
> -cflags-$(toolchain-virt)		+= -DTOOLCHAIN_SUPPORTS_VIRT
>   # For -mmicromips, use -Wa,-fatal-warnings to catch unsupported -mxpa which
>   # only warns
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
> +ifneq ($(call cc-option,-mmicromips -Wa$(comma)-fatal-warnings -mxpa),)
> +cflags-y	+= -DTOOLCHAIN_SUPPORTS_XPA
> +endif
> +ifneq ($(call cc-option,-Wa$(comma)-mcrc),)
> +cflags-y	+= -DTOOLCHAIN_SUPPORTS_CRC
> +endif
> +ifneq ($(call cc-option,-Wa$(comma)-mdsp),)
> +cflags-y	+= -DTOOLCHAIN_SUPPORTS_DSP
> +endif
> +ifneq ($(call cc-option,-Wa$(comma)-mginv),)
> +cflags-y	+= -DTOOLCHAIN_SUPPORTS_GINV
> +endif
>   
>   #
>   # Firmware support
> @@ -277,7 +277,7 @@ ifdef CONFIG_64BIT
>       endif
>     endif
>   
> -  ifeq ($(KBUILD_SYM32)$(call cc-option-yn,-msym32), yy)
> +  ifeq ($(KBUILD_SYM32)$(call cc-option,-msym32), y-msym32)
>       cflags-y += -msym32 -DKBUILD_64BIT_SYM32
>     else
>       ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
> diff --git a/arch/mips/sgi-ip22/Platform b/arch/mips/sgi-ip22/Platform
> index 62fa30bb959e..fd8f1d01c867 100644
> --- a/arch/mips/sgi-ip22/Platform
> +++ b/arch/mips/sgi-ip22/Platform
> @@ -24,8 +24,8 @@ endif
>   # Simplified: what IP22 does at 128MB+ in ksegN, IP28 does at 512MB+ in xkphys
>   #
>   ifdef CONFIG_SGI_IP28
> -  ifeq ($(call cc-option-yn,-march=r10000 -mr10k-cache-barrier=store), n)
> -      $(error gcc doesn't support needed option -mr10k-cache-barrier=store)
> +  ifeq ($(call cc-option,-march=r10000 -mr10k-cache-barrier=store),)
> +      $(error $(CC) doesn't support needed option -mr10k-cache-barrier=store)

Heh :)

>     endif
>   endif
>   cflags-$(CONFIG_SGI_IP28)	+= -mr10k-cache-barrier=store -I$(srctree)/arch/mips/include/asm/mach-ip28
> 
