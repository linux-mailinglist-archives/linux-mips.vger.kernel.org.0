Return-Path: <linux-mips+bounces-1767-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045C86852D
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 01:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB594285988
	for <lists+linux-mips@lfdr.de>; Tue, 27 Feb 2024 00:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9CC1848;
	Tue, 27 Feb 2024 00:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlb2FLF+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903CF1FBB;
	Tue, 27 Feb 2024 00:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708994992; cv=none; b=DyQvT10liL2o3T/zNAyayvYrcglm7J4GM8Kmuc11DaAGRr3jfBvXPEVxfEWA0bJTLoegW28oYxxDKpIpfiNk13CkYq2zEdc3gPArFyWEtQ8I/JfjqstadwaXI6ojNCJsK6w1K636Ki1ABhF99EboDzuelRakqJVBPe56hSDN9J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708994992; c=relaxed/simple;
	bh=rccfFAsIXXB1qR3NT1VIdPRPtfwefb4SHiEfUqybo3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyVe1AWUtNkX4XIzXrbZSlR3zFfADp7K2XwAgmaldN4lXLLLEIFePd3FAvUZjS1xoO0vNKm12deZnAOSBPAnpgrvxvITXI13Y1phGGu9/DmCgCbGA2ruvXwxjDfD4FLLw/KTQfOuQBmMjESnYd8xKqWfaX8i1OZew+RWNDC1oIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlb2FLF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479AEC433C7;
	Tue, 27 Feb 2024 00:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708994992;
	bh=rccfFAsIXXB1qR3NT1VIdPRPtfwefb4SHiEfUqybo3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hlb2FLF+7oSLe2uaiQD1GRNrdcUcZ76jkMNefv7y9z0d4avyL6FJ+ec7MgIsVWa5P
	 wvDYvR10b8lFqBOgHmiA20/osMi1ld0TZqLNPYid52p2q5f1QA1scVPKtHhKfIDhrC
	 q/svMK1Zm8VDLDLUYcDNUcNYAUTAdB82AhjafWTXrSI4iDZBqMRFNL534Smb8NdazI
	 ymraKhDbxXSVTEhoYUArpoXZ2r5dqvW0+L+n8D1lFNRcYqnhaZWc3vUmQ45go8B2dM
	 9JaWRnD/n3enlV67RX51LMpQ6+Gmgkk/xvPrcP0vyLUs5JSJ74i3u0JV/RpiWY7fzr
	 YOZ11VkXCa1NQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512ff385589so1786960e87.1;
        Mon, 26 Feb 2024 16:49:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUL2H/9qLNg9ghEsHysIi2pSBx8g110T6W4htxb07diDwGkjhgO0C5SvBamz45mlcNBYQzOIAD9mcpVP0+5JY0sa0HBFD0dhnGXuU2ZjJzGCdHnExBH1A7LkhcDEZnDEQFPd6NUFbTS4JG/27vG6SzDykbCbHW77GyuS4sG0f1WQ4trIbp81LZaUk1mjX29iIlooXb/ztRwNBXWfdvEydiBauuJgTuOioMq6/XGkx6CfFQ5WjddznMjerrCPDegmvSUyrt/8ld9bhok5Rz+OuVrC2WNiB/iFyWNIDEoQOo+PxFNLteoE7vWc0dL5VoBO7djT/ygT6+mIsA+cqDTi8dtfa7pMrpINuoMiFeDEGA4g+i4D2Qr3Q/4dK0VMl3lqwFmW7FfsqMbnOw5OO2LlvDI2mjTy54+9sB2C9BxOvCPelg/MOTu5HaanKXmtd9E+gE=
X-Gm-Message-State: AOJu0YxvKPec0nDwMIKX+y0As+neFhtPqWmuDlUlcKTejKWmgjPkXhlG
	9l+268ErD2WCZHqJb/kouQTzEoANIkk9Y69CfExGBG6Hqbjo3eJsM1pKK8DwuANGfWX8Yn9jgJY
	7lwzjMDZmfQTHTpd+kLJyfswO8sE=
X-Google-Smtp-Source: AGHT+IHMbxJ3SiFOofcXhuN9irkVPuqdMkmTsNwCqv7uyX1PBMjHMV5Lrsk8D9faur3ryNh+qAv630nq+LkptA51b9c=
X-Received: by 2002:a05:6512:10d2:b0:512:cef7:4754 with SMTP id
 k18-20020a05651210d200b00512cef74754mr6391328lfg.5.1708994969841; Mon, 26 Feb
 2024 16:49:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226161414.2316610-1-arnd@kernel.org> <20240226161414.2316610-4-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-4-arnd@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 27 Feb 2024 08:49:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSCdXtCib2Wv_DQQSJ5srhDwHH6B3xgdrr1-SQECUL1VA@mail.gmail.com>
Message-ID: <CAJF2gTSCdXtCib2Wv_DQQSJ5srhDwHH6B3xgdrr1-SQECUL1VA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <keescook@chromium.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 12:15=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/alpha/Kconfig                 | 1 +
>  arch/alpha/include/asm/page.h      | 2 +-
>  arch/arm/Kconfig                   | 1 +
>  arch/arm/include/asm/page.h        | 2 +-
>  arch/csky/Kconfig                  | 1 +
>  arch/csky/include/asm/page.h       | 2 +-
>  arch/m68k/Kconfig                  | 3 +++
>  arch/m68k/Kconfig.cpu              | 2 ++
>  arch/m68k/include/asm/page.h       | 6 +-----
>  arch/microblaze/Kconfig            | 1 +
>  arch/microblaze/include/asm/page.h | 2 +-
>  arch/nios2/Kconfig                 | 1 +
>  arch/nios2/include/asm/page.h      | 2 +-
>  arch/openrisc/Kconfig              | 1 +
>  arch/openrisc/include/asm/page.h   | 2 +-
>  arch/riscv/Kconfig                 | 1 +
>  arch/riscv/include/asm/page.h      | 2 +-
>  arch/s390/Kconfig                  | 1 +
>  arch/s390/include/asm/page.h       | 2 +-
>  arch/sparc/Kconfig                 | 2 ++
>  arch/sparc/include/asm/page_32.h   | 2 +-
>  arch/sparc/include/asm/page_64.h   | 3 +--
>  arch/um/Kconfig                    | 1 +
>  arch/um/include/asm/page.h         | 2 +-
>  arch/x86/Kconfig                   | 1 +
>  arch/x86/include/asm/page_types.h  | 2 +-
>  arch/xtensa/Kconfig                | 1 +
>  arch/xtensa/include/asm/page.h     | 2 +-
>  28 files changed, 32 insertions(+), 19 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index d6968d090d49..4f490250d323 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -14,6 +14,7 @@ config ALPHA
>         select PCI_DOMAINS if PCI
>         select PCI_SYSCALL if PCI
>         select HAVE_ASM_MODVERSIONS
> +       select HAVE_PAGE_SIZE_8KB
>         select HAVE_PCSPKR_PLATFORM
>         select HAVE_PERF_EVENTS
>         select NEED_DMA_MAP_STATE
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.=
h
> index 4db1ebc0ed99..70419e6be1a3 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -6,7 +6,7 @@
>  #include <asm/pal.h>
>
>  /* PAGE_SHIFT determines the page size */
> -#define PAGE_SHIFT     13
> +#define PAGE_SHIFT     CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE      (_AC(1,UL) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE-1))
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 0af6709570d1..9d52ba3a8ad1 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -116,6 +116,7 @@ config ARM
>         select HAVE_MOD_ARCH_SPECIFIC
>         select HAVE_NMI
>         select HAVE_OPTPROBES if !THUMB2_KERNEL
> +       select HAVE_PAGE_SIZE_4KB
>         select HAVE_PCI if MMU
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_REGS
> diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
> index 119aa85d1feb..62af9f7f9e96 100644
> --- a/arch/arm/include/asm/page.h
> +++ b/arch/arm/include/asm/page.h
> @@ -8,7 +8,7 @@
>  #define _ASMARM_PAGE_H
>
>  /* PAGE_SHIFT determines the page size */
> -#define PAGE_SHIFT             12
> +#define PAGE_SHIFT             CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE              (_AC(1,UL) << PAGE_SHIFT)
>  #define PAGE_MASK              (~((1 << PAGE_SHIFT) - 1))
>
> diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
> index cf2a6fd7dff8..9c2723ab1c94 100644
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@ -89,6 +89,7 @@ config CSKY
>         select HAVE_KPROBES if !CPU_CK610
>         select HAVE_KPROBES_ON_FTRACE if !CPU_CK610
>         select HAVE_KRETPROBES if !CPU_CK610
> +       select HAVE_PAGE_SIZE_4KB
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_REGS
>         select HAVE_PERF_USER_STACK_DUMP
> diff --git a/arch/csky/include/asm/page.h b/arch/csky/include/asm/page.h
> index 4a0502e324a6..f70f37402d75 100644
> --- a/arch/csky/include/asm/page.h
> +++ b/arch/csky/include/asm/page.h
> @@ -10,7 +10,7 @@
>  /*
>   * PAGE_SHIFT determines the page size: 4KB
>   */
> -#define PAGE_SHIFT     12
> +#define PAGE_SHIFT     CONFIG_PAGE_SHIFT
LGTM, thx.
Acked-by: Guo Ren <guoren@kernel.org>

>  #define PAGE_SIZE      (_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE - 1))
>  #define THREAD_SIZE    (PAGE_SIZE * 2)
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 4b3e93cac723..7b709453d5e7 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -84,12 +84,15 @@ config MMU
>
>  config MMU_MOTOROLA
>         bool
> +       select HAVE_PAGE_SIZE_4KB
>
>  config MMU_COLDFIRE
> +       select HAVE_PAGE_SIZE_8KB
>         bool
>
>  config MMU_SUN3
>         bool
> +       select HAVE_PAGE_SIZE_8KB
>         depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
>
>  config ARCH_SUPPORTS_KEXEC
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 9dcf245c9cbf..c777a129768a 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -30,6 +30,7 @@ config COLDFIRE
>         select GENERIC_CSUM
>         select GPIOLIB
>         select HAVE_LEGACY_CLK
> +       select HAVE_PAGE_SIZE_8KB if !MMU
>
>  endchoice
>
> @@ -45,6 +46,7 @@ config M68000
>         select GENERIC_CSUM
>         select CPU_NO_EFFICIENT_FFS
>         select HAVE_ARCH_HASH
> +       select HAVE_PAGE_SIZE_4KB
>         select LEGACY_TIMER_TICK
>         help
>           The Freescale (was Motorola) 68000 CPU is the first generation =
of
> diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
> index a5993ad83ed8..8cfb84b49975 100644
> --- a/arch/m68k/include/asm/page.h
> +++ b/arch/m68k/include/asm/page.h
> @@ -7,11 +7,7 @@
>  #include <asm/page_offset.h>
>
>  /* PAGE_SHIFT determines the page size */
> -#if defined(CONFIG_SUN3) || defined(CONFIG_COLDFIRE)
> -#define PAGE_SHIFT     13
> -#else
> -#define PAGE_SHIFT     12
> -#endif
> +#define PAGE_SHIFT     CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE      (_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE-1))
>  #define PAGE_OFFSET    (PAGE_OFFSET_RAW)
> diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
> index 211f338d6235..f18ec02ddeb2 100644
> --- a/arch/microblaze/Kconfig
> +++ b/arch/microblaze/Kconfig
> @@ -31,6 +31,7 @@ config MICROBLAZE
>         select HAVE_FTRACE_MCOUNT_RECORD
>         select HAVE_FUNCTION_GRAPH_TRACER
>         select HAVE_FUNCTION_TRACER
> +       select HAVE_PAGE_SIZE_4KB
>         select HAVE_PCI
>         select IRQ_DOMAIN
>         select XILINX_INTC
> diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include=
/asm/page.h
> index 86a4ce07c192..8810f4f1c3b0 100644
> --- a/arch/microblaze/include/asm/page.h
> +++ b/arch/microblaze/include/asm/page.h
> @@ -20,7 +20,7 @@
>  #ifdef __KERNEL__
>
>  /* PAGE_SHIFT determines the page size */
> -#define PAGE_SHIFT             12
> +#define PAGE_SHIFT     CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE      (ASM_CONST(1) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE-1))
>
> diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
> index 58d9565dc2c7..79d3039b29f1 100644
> --- a/arch/nios2/Kconfig
> +++ b/arch/nios2/Kconfig
> @@ -15,6 +15,7 @@ config NIOS2
>         select GENERIC_IRQ_SHOW
>         select HAVE_ARCH_TRACEHOOK
>         select HAVE_ARCH_KGDB
> +       select HAVE_PAGE_SIZE_4KB
>         select IRQ_DOMAIN
>         select LOCK_MM_AND_FIND_VMA
>         select MODULES_USE_ELF_RELA
> diff --git a/arch/nios2/include/asm/page.h b/arch/nios2/include/asm/page.=
h
> index 0ae7d9ce369b..0722f88e63cc 100644
> --- a/arch/nios2/include/asm/page.h
> +++ b/arch/nios2/include/asm/page.h
> @@ -21,7 +21,7 @@
>  /*
>   * PAGE_SHIFT determines the page size
>   */
> -#define PAGE_SHIFT     12
> +#define PAGE_SHIFT     CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE      (_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE - 1))
>
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index fd9bb76a610b..3586cda55bde 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -25,6 +25,7 @@ config OPENRISC
>         select GENERIC_CPU_DEVICES
>         select HAVE_PCI
>         select HAVE_UID16
> +       select HAVE_PAGE_SIZE_8KB
>         select GENERIC_ATOMIC64
>         select GENERIC_CLOCKEVENTS_BROADCAST
>         select GENERIC_SMP_IDLE_THREAD
> diff --git a/arch/openrisc/include/asm/page.h b/arch/openrisc/include/asm=
/page.h
> index 44fc1fd56717..7925ce09ab5a 100644
> --- a/arch/openrisc/include/asm/page.h
> +++ b/arch/openrisc/include/asm/page.h
> @@ -18,7 +18,7 @@
>
>  /* PAGE_SHIFT determines the page size */
>
> -#define PAGE_SHIFT      13
> +#define PAGE_SHIFT      CONFIG_PAGE_SHIFT
>  #ifdef __ASSEMBLY__
>  #define PAGE_SIZE       (1 << PAGE_SHIFT)
>  #else
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bffbd869a068..792a337548f6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -136,6 +136,7 @@ config RISCV
>         select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>         select HAVE_MOVE_PMD
>         select HAVE_MOVE_PUD
> +       select HAVE_PAGE_SIZE_4KB
>         select HAVE_PCI
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_REGS
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.=
h
> index 57e887bfa34c..2947423b5082 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -12,7 +12,7 @@
>  #include <linux/pfn.h>
>  #include <linux/const.h>
>
> -#define PAGE_SHIFT     (12)
> +#define PAGE_SHIFT     CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE      (_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE - 1))
>
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index fe565f3a3a91..b61c74c10050 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -199,6 +199,7 @@ config S390
>         select HAVE_MOD_ARCH_SPECIFIC
>         select HAVE_NMI
>         select HAVE_NOP_MCOUNT
> +       select HAVE_PAGE_SIZE_4KB
>         select HAVE_PCI
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_REGS
> diff --git a/arch/s390/include/asm/page.h b/arch/s390/include/asm/page.h
> index 73b9c3bf377f..ded9548d11d9 100644
> --- a/arch/s390/include/asm/page.h
> +++ b/arch/s390/include/asm/page.h
> @@ -11,7 +11,7 @@
>  #include <linux/const.h>
>  #include <asm/types.h>
>
> -#define _PAGE_SHIFT    12
> +#define _PAGE_SHIFT    CONFIG_PAGE_SHIFT
>  #define _PAGE_SIZE     (_AC(1, UL) << _PAGE_SHIFT)
>  #define _PAGE_MASK     (~(_PAGE_SIZE - 1))
>
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index 204c43cb3d43..7e6bc6fff76b 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -58,6 +58,7 @@ config SPARC32
>         select DMA_DIRECT_REMAP
>         select GENERIC_ATOMIC64
>         select HAVE_UID16
> +       select HAVE_PAGE_SIZE_4KB
>         select LOCK_MM_AND_FIND_VMA
>         select OLD_SIGACTION
>         select ZONE_DMA
> @@ -75,6 +76,7 @@ config SPARC64
>         select HAVE_ARCH_TRANSPARENT_HUGEPAGE
>         select HAVE_DYNAMIC_FTRACE
>         select HAVE_FTRACE_MCOUNT_RECORD
> +       select HAVE_PAGE_SIZE_8KB
>         select HAVE_SYSCALL_TRACEPOINTS
>         select HAVE_CONTEXT_TRACKING_USER
>         select HAVE_TIF_NOHZ
> diff --git a/arch/sparc/include/asm/page_32.h b/arch/sparc/include/asm/pa=
ge_32.h
> index 6be6f683f98f..9977c77374cd 100644
> --- a/arch/sparc/include/asm/page_32.h
> +++ b/arch/sparc/include/asm/page_32.h
> @@ -11,7 +11,7 @@
>
>  #include <linux/const.h>
>
> -#define PAGE_SHIFT   12
> +#define PAGE_SHIFT   CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE    (_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK    (~(PAGE_SIZE-1))
>
> diff --git a/arch/sparc/include/asm/page_64.h b/arch/sparc/include/asm/pa=
ge_64.h
> index 254dffd85fb1..e9bd24821c93 100644
> --- a/arch/sparc/include/asm/page_64.h
> +++ b/arch/sparc/include/asm/page_64.h
> @@ -4,8 +4,7 @@
>
>  #include <linux/const.h>
>
> -#define PAGE_SHIFT   13
> -
> +#define PAGE_SHIFT   CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE    (_AC(1,UL) << PAGE_SHIFT)
>  #define PAGE_MASK    (~(PAGE_SIZE-1))
>
> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> index b5e179360534..93a5a8999b07 100644
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -20,6 +20,7 @@ config UML
>         select HAVE_UID16
>         select HAVE_DEBUG_KMEMLEAK
>         select HAVE_DEBUG_BUGVERBOSE
> +       select HAVE_PAGE_SIZE_4KB
>         select NO_DMA if !UML_DMA_EMULATION
>         select OF_EARLY_FLATTREE if OF
>         select GENERIC_IRQ_SHOW
> diff --git a/arch/um/include/asm/page.h b/arch/um/include/asm/page.h
> index 84866127d074..9ef9a8aedfa6 100644
> --- a/arch/um/include/asm/page.h
> +++ b/arch/um/include/asm/page.h
> @@ -10,7 +10,7 @@
>  #include <linux/const.h>
>
>  /* PAGE_SHIFT determines the page size */
> -#define PAGE_SHIFT     12
> +#define PAGE_SHIFT     CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE      (_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE-1))
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 5edec175b9bf..ba57eb362ec8 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -255,6 +255,7 @@ config X86
>         select HAVE_NOINSTR_VALIDATION          if HAVE_OBJTOOL
>         select HAVE_OBJTOOL                     if X86_64
>         select HAVE_OPTPROBES
> +       select HAVE_PAGE_SIZE_4KB
>         select HAVE_PCSPKR_PLATFORM
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_EVENTS_NMI
> diff --git a/arch/x86/include/asm/page_types.h b/arch/x86/include/asm/pag=
e_types.h
> index 86bd4311daf8..9da9c8a2f1df 100644
> --- a/arch/x86/include/asm/page_types.h
> +++ b/arch/x86/include/asm/page_types.h
> @@ -7,7 +7,7 @@
>  #include <linux/mem_encrypt.h>
>
>  /* PAGE_SHIFT determines the page size */
> -#define PAGE_SHIFT             12
> +#define PAGE_SHIFT             CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE              (_AC(1,UL) << PAGE_SHIFT)
>  #define PAGE_MASK              (~(PAGE_SIZE-1))
>
> diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
> index 6f248d87e496..87ec35b3363b 100644
> --- a/arch/xtensa/Kconfig
> +++ b/arch/xtensa/Kconfig
> @@ -44,6 +44,7 @@ config XTENSA
>         select HAVE_GCC_PLUGINS if GCC_VERSION >=3D 120000
>         select HAVE_HW_BREAKPOINT if PERF_EVENTS
>         select HAVE_IRQ_TIME_ACCOUNTING
> +       select HAVE_PAGE_SIZE_4KB
>         select HAVE_PCI
>         select HAVE_PERF_EVENTS
>         select HAVE_STACKPROTECTOR
> diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/pag=
e.h
> index a77d04972eb9..4db56ef052d2 100644
> --- a/arch/xtensa/include/asm/page.h
> +++ b/arch/xtensa/include/asm/page.h
> @@ -22,7 +22,7 @@
>   * PAGE_SHIFT determines the page size
>   */
>
> -#define PAGE_SHIFT     12
> +#define PAGE_SHIFT     CONFIG_PAGE_SHIFT
>  #define PAGE_SIZE      (__XTENSA_UL_CONST(1) << PAGE_SHIFT)
>  #define PAGE_MASK      (~(PAGE_SIZE-1))
>
> --
> 2.39.2
>


--=20
Best Regards
 Guo Ren

