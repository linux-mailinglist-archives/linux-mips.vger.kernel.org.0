Return-Path: <linux-mips+bounces-1758-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8843867D71
	for <lists+linux-mips@lfdr.de>; Mon, 26 Feb 2024 18:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D5A628A719
	for <lists+linux-mips@lfdr.de>; Mon, 26 Feb 2024 17:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B6F12BF0D;
	Mon, 26 Feb 2024 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eIpG+p8O"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B6212F5B7
	for <linux-mips@vger.kernel.org>; Mon, 26 Feb 2024 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966518; cv=none; b=qFDtHwKbAwCBRA81MyuHaqHn7NygafOWODQqjExI6ZOBfrLby+o2r8+qjdUKAxK+o04dXjQQN1R2fFK3GeAi34EcmQj5DEzgKNjEYZTGc1+BNrC3T2oMRaTIztggMtGEnF8I1a7mtROAwvULSjCNFuFh0tHlbToxA0eS6w9xxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966518; c=relaxed/simple;
	bh=efqSYWlmPvvmoW5hTpteGQgbaViN1str2LnrNPJgrD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCAdY3ifL0k8GfgJn2oQZpjtolxrVDu2mVr7VY8/rv86MQK+Cmmxbt8Q6xLAUfeAnto0BGLY++ko7xgHAo85OeZUM5ICJp3OD5v8RDC6xq2fwvQJIRf7l/NsFqFIh28BpGX8HbcROuwXu6b/NjSy+twM2375eHeGjkKJ7EIaS0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=eIpG+p8O; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7c7b8fb8ba6so77231739f.2
        for <linux-mips@vger.kernel.org>; Mon, 26 Feb 2024 08:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708966516; x=1709571316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YapG2Iuz3DeMuojGrZ4IACVCP3buEgPcxL/agJvMeoI=;
        b=eIpG+p8Ov/rRaNeI6uaoNEoiYBVxOHKyiRlBtWJu2YvdUhbCuZtqkdDm4a56GJy2rl
         nr1kusUTL0Wl7M9Ji9Ua9DtzmR6hHbt5OlBxcUSmFZCT03axU42bBVhU1HGSMIMyOO0f
         sbTz+A9TH0p/ARPuqtbkKPLG5u5lynUcIdQiCImUzTN3k9DDK2aJti8Yd8R+nR5lnzZZ
         tf9Qw7vKBeKHeeYuR5NoWOqRIeWfAXJoR5RBRkvloBlBcjIFPoqjQz0fp/ddbnmPa0Cl
         JGvzU0+WJVMNaw5gb8FVTL4VrrmUoyB+DXEqhk669C/mUXRYlnP2dLjCxqXojz2F2tpX
         Uitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708966516; x=1709571316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YapG2Iuz3DeMuojGrZ4IACVCP3buEgPcxL/agJvMeoI=;
        b=NPGkVyWpRLu+BIuAbIq6vT23fGmK8R2Q1xlvWrcun3Y0+f/g5KwHJ66jbLBHPoN3fE
         b2Xesr2rJ0IpkIurXRK2H9IfMnzHngUyFIzz7EZ5aofO6cVQA5SXipOhX27+2JEcKbk+
         JZIFogUXOdnsRFk8qDkm8ThUhBJNRW4ocfCgVkLTNg2pkhzuDqri5rPRD03Fsiuk63Fp
         UQaC+GABbuWdPDFIKa0bCzW+DJc9tntbtPe2vWljikWXauZkk9QQg0cbL5H4gWGzwzR7
         kanRvFPemaP9njZwnsbM4bvU/riEEEGClpMZ+cfD27ia2pL4IfT3sUWhOfho4+YUxIqQ
         9OOg==
X-Forwarded-Encrypted: i=1; AJvYcCXyFMfyGgYFCel75CQ52uw6gAtX+dPIlodVvBB/qGfaINp3Oi5DQS62g3YNGNggEpKXGWHAIHKYmi/U28/ttyKmkpmJ+2ATccpCYA==
X-Gm-Message-State: AOJu0Yxp9htrbAjKHp/sONCdFIj/lzDlI444Ovxx5sRDANyv/E2Rrfax
	DdrRI2iBzeRtgAPoSu7DOrGjlKBYEyps07WvOxZAA+uCKUPwGrdIl4LqucuZXNQ=
X-Google-Smtp-Source: AGHT+IHuaCs5d/f2oApxcwZJ00c0VtAfeY0TQXQD6OLSfI1tJf749yVYK76BLp2wH1JUJFxCC31KGw==
X-Received: by 2002:a5e:c819:0:b0:7c7:247e:34c7 with SMTP id y25-20020a5ec819000000b007c7247e34c7mr9575536iol.9.1708966515786;
        Mon, 26 Feb 2024 08:55:15 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.200])
        by smtp.gmail.com with ESMTPSA id f23-20020a6be817000000b007c7938867adsm1309067ioh.33.2024.02.26.08.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 08:55:15 -0800 (PST)
Message-ID: <764fafb0-2206-4ab1-84ea-ebb7848c8ff2@sifive.com>
Date: Mon, 26 Feb 2024 10:55:11 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB
 definitions
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller
 <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240226161414.2316610-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-02-26 10:14 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> These four architectures define the same Kconfig symbols for configuring
> the page size. Move the logic into a common place where it can be shared
> with all other architectures.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/Kconfig                      | 58 +++++++++++++++++++++++++++++--
>  arch/hexagon/Kconfig              | 25 +++----------
>  arch/hexagon/include/asm/page.h   |  6 +---
>  arch/loongarch/Kconfig            | 21 ++++-------
>  arch/loongarch/include/asm/page.h | 10 +-----
>  arch/mips/Kconfig                 | 58 +++----------------------------
>  arch/mips/include/asm/page.h      | 16 +--------
>  arch/sh/include/asm/page.h        | 13 +------
>  arch/sh/mm/Kconfig                | 42 +++++++---------------
>  9 files changed, 88 insertions(+), 161 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index a5af0edd3eb8..237cea01ed9b 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1078,17 +1078,71 @@ config HAVE_ARCH_COMPAT_MMAP_BASES
>  	  and vice-versa 32-bit applications to call 64-bit mmap().
>  	  Required for applications doing different bitness syscalls.
>  
> +config HAVE_PAGE_SIZE_4KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_8KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_16KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_32KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_64KB
> +	bool
> +
> +config HAVE_PAGE_SIZE_256KB
> +	bool
> +
> +choice
> +	prompt "MMU page size"

Should this have some generic help text (at least a warning about compatibility)?

> +
> +config PAGE_SIZE_4KB
> +	bool "4KB pages"
> +	depends on HAVE_PAGE_SIZE_4KB
> +
> +config PAGE_SIZE_8KB
> +	bool "8KB pages"
> +	depends on HAVE_PAGE_SIZE_8KB
> +
> +config PAGE_SIZE_16KB
> +	bool "16KB pages"
> +	depends on HAVE_PAGE_SIZE_16KB
> +
> +config PAGE_SIZE_32KB
> +	bool "32KB pages"
> +	depends on HAVE_PAGE_SIZE_32KB
> +
> +config PAGE_SIZE_64KB
> +	bool "64KB pages"
> +	depends on HAVE_PAGE_SIZE_64KB
> +
> +config PAGE_SIZE_256KB
> +	bool "256KB pages"
> +	depends on HAVE_PAGE_SIZE_256KB
> +
> +endchoice
> +
>  config PAGE_SIZE_LESS_THAN_64KB
>  	def_bool y
> -	depends on !ARM64_64K_PAGES
>  	depends on !PAGE_SIZE_64KB
> -	depends on !PARISC_PAGE_SIZE_64KB
>  	depends on PAGE_SIZE_LESS_THAN_256KB
>  
>  config PAGE_SIZE_LESS_THAN_256KB
>  	def_bool y
>  	depends on !PAGE_SIZE_256KB
>  
> +config PAGE_SHIFT
> +	int
> +	default 12 if PAGE_SIZE_4KB
> +	default 13 if PAGE_SIZE_8KB
> +	default 14 if PAGE_SIZE_16KB
> +	default 15 if PAGE_SIZE_32KB
> +	default 16 if PAGE_SIZE_64KB
> +	default 18 if PAGE_SIZE_256KB
> +
>  # This allows to use a set of generic functions to determine mmap base
>  # address by giving priority to top-down scheme only if the process
>  # is not in legacy mode (compat task, unlimited stack size or
> diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
> index a880ee067d2e..aac46ee1a000 100644
> --- a/arch/hexagon/Kconfig
> +++ b/arch/hexagon/Kconfig
> @@ -8,6 +8,11 @@ config HEXAGON
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select ARCH_NO_PREEMPT
>  	select DMA_GLOBAL_POOL
> +	select FRAME_POINTER

Looks like a paste error.

> +	select HAVE_PAGE_SIZE_4KB
> +	select HAVE_PAGE_SIZE_16KB
> +	select HAVE_PAGE_SIZE_64KB
> +	select HAVE_PAGE_SIZE_256KB
>  	# Other pending projects/to-do items.
>  	# select HAVE_REGS_AND_STACK_ACCESS_API
>  	# select HAVE_HW_BREAKPOINT if PERF_EVENTS
> @@ -120,26 +125,6 @@ config NR_CPUS
>  	  This is purely to save memory - each supported CPU adds
>  	  approximately eight kilobytes to the kernel image.
>  
> -choice
> -	prompt "Kernel page size"
> -	default PAGE_SIZE_4KB
> -	help
> -	  Changes the default page size; use with caution.
> -
> -config PAGE_SIZE_4KB
> -	bool "4KB"
> -
> -config PAGE_SIZE_16KB
> -	bool "16KB"
> -
> -config PAGE_SIZE_64KB
> -	bool "64KB"
> -
> -config PAGE_SIZE_256KB
> -	bool "256KB"
> -
> -endchoice
> -
>  source "kernel/Kconfig.hz"
>  
>  endmenu
> diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
> index 10f1bc07423c..65c9bac639fa 100644
> --- a/arch/hexagon/include/asm/page.h
> +++ b/arch/hexagon/include/asm/page.h
> @@ -13,27 +13,22 @@
>  /*  This is probably not the most graceful way to handle this.  */
>  
>  #ifdef CONFIG_PAGE_SIZE_4KB
> -#define PAGE_SHIFT 12
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_4KB
>  #endif
>  
>  #ifdef CONFIG_PAGE_SIZE_16KB
> -#define PAGE_SHIFT 14
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_16KB
>  #endif
>  
>  #ifdef CONFIG_PAGE_SIZE_64KB
> -#define PAGE_SHIFT 16
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_64KB
>  #endif
>  
>  #ifdef CONFIG_PAGE_SIZE_256KB
> -#define PAGE_SHIFT 18
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_256KB
>  #endif
>  
>  #ifdef CONFIG_PAGE_SIZE_1MB
> -#define PAGE_SHIFT 20
>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_1MB
>  #endif

The corresponding Kconfig option does not exist (and did not exist before this
patch).

>  
> @@ -50,6 +45,7 @@
>  #define HVM_HUGEPAGE_SIZE 0x5
>  #endif
>  
> +#define PAGE_SHIFT CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE  (1UL << PAGE_SHIFT)
>  #define PAGE_MASK  (~((1 << PAGE_SHIFT) - 1))
>  


