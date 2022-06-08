Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333A254272F
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jun 2022 08:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiFHEq0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jun 2022 00:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbiFHEpL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Jun 2022 00:45:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7701B4198CB;
        Tue,  7 Jun 2022 19:35:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D0DDB617D6;
        Wed,  8 Jun 2022 02:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C190C341CA;
        Wed,  8 Jun 2022 02:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654655755;
        bh=SsXZJYgOIiq3A17Q+1LSuSeQwqdZ3RvoyU5+MSq3/LM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hwqjLkrKWHkFDtCdFJXvrJO61AzN2gPLJfiQvkuHhgiVdZ8sUQSu/YfFpp+6aBJPs
         Oki7MSq35lmOIJUgjYcADtHTvZC3u9VTL/6NDTKTHa1EoZg4gnBCvvVNdbpLKEuVQ5
         AkLdpdZT/+cy9w3yTEuVgFr2nDLuuzR7gRhbFROelL03jXqzAavUjhJ1fIEWLVtALX
         VyYA9rG4HlDIZr6YAq9X0Bqw7swLUoEocSDZUj4+aHcxdE0sqDFV+zTPDOMCyZhjWU
         B9CvPMC9RSZtjVr1PwAzvYDjeXwuiV9gFxlP/47+XrvtGq8bv5klL1pqgyrRwspYBI
         mZJS0Im9kOtPQ==
Received: by mail-ua1-f46.google.com with SMTP id i4so210699uaq.4;
        Tue, 07 Jun 2022 19:35:55 -0700 (PDT)
X-Gm-Message-State: AOAM531k5FXPAMDFOXvfQOCYkIilHKdw0wpa9z9igxJpTn67QZzMcMGT
        TqPMy7THKxdyTfSDMl3IL7a09zdnuaT5nuZglvU=
X-Google-Smtp-Source: ABdhPJyjCmP1RPYunONAfpy4OyLHTzEfFhrDDXKMrX2YQBASxWdxJ/Evlwtfy/6oB2o8tbfMXpKm3bYIRsx+JIom78Y=
X-Received: by 2002:ab0:2747:0:b0:373:5408:d086 with SMTP id
 c7-20020ab02747000000b003735408d086mr18503167uap.12.1654655753666; Tue, 07
 Jun 2022 19:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com>
In-Reply-To: <20220608000014.3054333-1-jarkko@profian.com>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 8 Jun 2022 10:35:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
Message-ID: <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To:     Jarkko Sakkinen <jarkko@profian.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathaniel McCallum <nathaniel@profian.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Marco Elver <elver@google.com>,
        Dan Li <ashimida@linux.alibaba.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song Liu <song@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen Zhongjin <chenzhongjin@huawei.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Mark Brown <broonie@kernel.org>,
        Luis Machado <luis.machado@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Dave Anglin <dave.anglin@bell.net>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alexei Starovoitov <ast@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Daniel Axtens <dja@axtens.net>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Jordan Niethe <jniethe5@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Changbin Du <changbin.du@intel.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Liao Chang <liaochang1@huawei.com>,
        Philipp Tomsich <philipp.tomsich@vrull.eu>,
        Wu Caize <zepan@sipeed.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Alexander Egorenkov <egorenar@linux.ibm.com>,
        Thomas Richter <tmricht@linux.ibm.com>,
        Tobias Huschle <huschle@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Michael Roth <michael.roth@amd.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Miroslav Benes <mbenes@suse.cz>,
        =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

.

On Wed, Jun 8, 2022 at 8:02 AM Jarkko Sakkinen <jarkko@profian.com> wrote:
>
> Tracing with kprobes while running a monolithic kernel is currently
> impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> dependency is a result of kprobes code using the module allocator for the
> trampoline code.
>
> Detaching kprobes from modules helps to squeeze down the user space,
> e.g. when developing new core kernel features, while still having all
> the nice tracing capabilities.
>
> For kernel/ and arch/*, move module_alloc() and module_memfree() to
> module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> code with CONFIG_MODULES.
>
> As the result, kprobes can be used with a monolithic kernel.
It's strange when MODULES is n, but vmlinux still obtains module_alloc.

Maybe we need a kprobe_alloc, right?


>
> Signed-off-by: Jarkko Sakkinen <jarkko@profian.com>
> ---
> Tested with the help of BuildRoot and QEMU:
> - arm (function tracer)
> - arm64 (function tracer)
> - mips (function tracer)
> - powerpc (function tracer)
> - riscv (function tracer)
> - s390 (function tracer)
> - sparc (function tracer)
> - x86 (function tracer)
> - sh (function tracer, for the "pure" kernel/modules_alloc.c path)
> ---
>  arch/Kconfig                       |  1 -
>  arch/arm/kernel/Makefile           |  5 +++
>  arch/arm/kernel/module.c           | 32 ----------------
>  arch/arm/kernel/module_alloc.c     | 42 ++++++++++++++++++++
>  arch/arm64/kernel/Makefile         |  5 +++
>  arch/arm64/kernel/module.c         | 47 -----------------------
>  arch/arm64/kernel/module_alloc.c   | 57 ++++++++++++++++++++++++++++
>  arch/mips/kernel/Makefile          |  5 +++
>  arch/mips/kernel/module.c          |  9 -----
>  arch/mips/kernel/module_alloc.c    | 18 +++++++++
>  arch/parisc/kernel/Makefile        |  5 +++
>  arch/parisc/kernel/module.c        | 11 ------
>  arch/parisc/kernel/module_alloc.c  | 23 +++++++++++
>  arch/powerpc/kernel/Makefile       |  5 +++
>  arch/powerpc/kernel/module.c       | 37 ------------------
>  arch/powerpc/kernel/module_alloc.c | 47 +++++++++++++++++++++++
>  arch/riscv/kernel/Makefile         |  5 +++
>  arch/riscv/kernel/module.c         | 10 -----
>  arch/riscv/kernel/module_alloc.c   | 19 ++++++++++
>  arch/s390/kernel/Makefile          |  5 +++
>  arch/s390/kernel/module.c          | 17 ---------
>  arch/s390/kernel/module_alloc.c    | 33 ++++++++++++++++
>  arch/sparc/kernel/Makefile         |  5 +++
>  arch/sparc/kernel/module.c         | 30 ---------------
>  arch/sparc/kernel/module_alloc.c   | 39 +++++++++++++++++++
>  arch/x86/kernel/Makefile           |  5 +++
>  arch/x86/kernel/module.c           | 50 ------------------------
>  arch/x86/kernel/module_alloc.c     | 61 ++++++++++++++++++++++++++++++
>  kernel/Makefile                    |  5 +++
>  kernel/kprobes.c                   | 10 +++++
>  kernel/module/main.c               | 17 ---------
>  kernel/module_alloc.c              | 26 +++++++++++++
>  kernel/trace/trace_kprobe.c        | 10 ++++-
>  33 files changed, 434 insertions(+), 262 deletions(-)
>  create mode 100644 arch/arm/kernel/module_alloc.c
>  create mode 100644 arch/arm64/kernel/module_alloc.c
>  create mode 100644 arch/mips/kernel/module_alloc.c
>  create mode 100644 arch/parisc/kernel/module_alloc.c
>  create mode 100644 arch/powerpc/kernel/module_alloc.c
>  create mode 100644 arch/riscv/kernel/module_alloc.c
>  create mode 100644 arch/s390/kernel/module_alloc.c
>  create mode 100644 arch/sparc/kernel/module_alloc.c
>  create mode 100644 arch/x86/kernel/module_alloc.c
>  create mode 100644 kernel/module_alloc.c
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index fcf9a41a4ef5..e8e3e7998a2e 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -39,7 +39,6 @@ config GENERIC_ENTRY
>
>  config KPROBES
>         bool "Kprobes"
> -       depends on MODULES
>         depends on HAVE_KPROBES
>         select KALLSYMS
>         select TASKS_RCU if PREEMPTION
> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> index 553866751e1a..d2bb954cd54f 100644
> --- a/arch/arm/kernel/Makefile
> +++ b/arch/arm/kernel/Makefile
> @@ -44,6 +44,11 @@ obj-$(CONFIG_CPU_IDLE)               += cpuidle.o
>  obj-$(CONFIG_ISA_DMA_API)      += dma.o
>  obj-$(CONFIG_FIQ)              += fiq.o fiqasm.o
>  obj-$(CONFIG_MODULES)          += armksyms.o module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                          += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)          += module_alloc.o
> +endif
>  obj-$(CONFIG_ARM_MODULE_PLTS)  += module-plts.o
>  obj-$(CONFIG_ISA_DMA)          += dma-isa.o
>  obj-$(CONFIG_PCI)              += bios32.o isa.o
> diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
> index d59c36dc0494..054e799e7091 100644
> --- a/arch/arm/kernel/module.c
> +++ b/arch/arm/kernel/module.c
> @@ -22,38 +22,6 @@
>  #include <asm/unwind.h>
>  #include <asm/opcodes.h>
>
> -#ifdef CONFIG_XIP_KERNEL
> -/*
> - * The XIP kernel text is mapped in the module area for modules and
> - * some other stuff to work without any indirect relocations.
> - * MODULES_VADDR is redefined here and not in asm/memory.h to avoid
> - * recompiling the whole kernel when CONFIG_XIP_KERNEL is turned on/off.
> - */
> -#undef MODULES_VADDR
> -#define MODULES_VADDR  (((unsigned long)_exiprom + ~PMD_MASK) & PMD_MASK)
> -#endif
> -
> -#ifdef CONFIG_MMU
> -void *module_alloc(unsigned long size)
> -{
> -       gfp_t gfp_mask = GFP_KERNEL;
> -       void *p;
> -
> -       /* Silence the initial allocation */
> -       if (IS_ENABLED(CONFIG_ARM_MODULE_PLTS))
> -               gfp_mask |= __GFP_NOWARN;
> -
> -       p = __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> -                               gfp_mask, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> -                               __builtin_return_address(0));
> -       if (!IS_ENABLED(CONFIG_ARM_MODULE_PLTS) || p)
> -               return p;
> -       return __vmalloc_node_range(size, 1,  VMALLOC_START, VMALLOC_END,
> -                               GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> -                               __builtin_return_address(0));
> -}
> -#endif
> -
>  bool module_init_section(const char *name)
>  {
>         return strstarts(name, ".init") ||
> diff --git a/arch/arm/kernel/module_alloc.c b/arch/arm/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..c3cfb2b60575
> --- /dev/null
> +++ b/arch/arm/kernel/module_alloc.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2002 Russell King.
> + * Modified for nommu by Hyok S. Choi
> + *
> + * Module allocation method suggested by Andi Kleen.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/vmalloc.h>
> +
> +#ifdef CONFIG_XIP_KERNEL
> +/*
> + * The XIP kernel text is mapped in the module area for modules and
> + * some other stuff to work without any indirect relocations.
> + * MODULES_VADDR is redefined here and not in asm/memory.h to avoid
> + * recompiling the whole kernel when CONFIG_XIP_KERNEL is turned on/off.
> + */
> +#undef MODULES_VADDR
> +#define MODULES_VADDR  (((unsigned long)_exiprom + ~PMD_MASK) & PMD_MASK)
> +#endif
> +
> +#ifdef CONFIG_MMU
> +void *module_alloc(unsigned long size)
> +{
> +       gfp_t gfp_mask = GFP_KERNEL;
> +       void *p;
> +
> +       /* Silence the initial allocation */
> +       if (IS_ENABLED(CONFIG_ARM_MODULE_PLTS))
> +               gfp_mask |= __GFP_NOWARN;
> +
> +       p = __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> +                               gfp_mask, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +                               __builtin_return_address(0));
> +       if (!IS_ENABLED(CONFIG_ARM_MODULE_PLTS) || p)
> +               return p;
> +       return __vmalloc_node_range(size, 1,  VMALLOC_START, VMALLOC_END,
> +                               GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +                               __builtin_return_address(0));
> +}
> +#endif
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index fa7981d0d917..d61c02da857e 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -43,6 +43,11 @@ obj-$(CONFIG_COMPAT)                 += sigreturn32.o
>  obj-$(CONFIG_KUSER_HELPERS)            += kuser32.o
>  obj-$(CONFIG_FUNCTION_TRACER)          += ftrace.o entry-ftrace.o
>  obj-$(CONFIG_MODULES)                  += module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                                  += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)                  += module_alloc.o
> +endif
>  obj-$(CONFIG_ARM64_MODULE_PLTS)                += module-plts.o
>  obj-$(CONFIG_PERF_EVENTS)              += perf_regs.o perf_callchain.o
>  obj-$(CONFIG_HW_PERF_EVENTS)           += perf_event.o
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index f2d4bb14bfab..d2a979746da0 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -20,53 +20,6 @@
>  #include <asm/insn.h>
>  #include <asm/sections.h>
>
> -void *module_alloc(unsigned long size)
> -{
> -       u64 module_alloc_end = module_alloc_base + MODULES_VSIZE;
> -       gfp_t gfp_mask = GFP_KERNEL;
> -       void *p;
> -
> -       /* Silence the initial allocation */
> -       if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> -               gfp_mask |= __GFP_NOWARN;
> -
> -       if (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> -           IS_ENABLED(CONFIG_KASAN_SW_TAGS))
> -               /* don't exceed the static module region - see below */
> -               module_alloc_end = MODULES_END;
> -
> -       p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> -                               module_alloc_end, gfp_mask, PAGE_KERNEL, VM_DEFER_KMEMLEAK,
> -                               NUMA_NO_NODE, __builtin_return_address(0));
> -
> -       if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
> -           (IS_ENABLED(CONFIG_KASAN_VMALLOC) ||
> -            (!IS_ENABLED(CONFIG_KASAN_GENERIC) &&
> -             !IS_ENABLED(CONFIG_KASAN_SW_TAGS))))
> -               /*
> -                * KASAN without KASAN_VMALLOC can only deal with module
> -                * allocations being served from the reserved module region,
> -                * since the remainder of the vmalloc region is already
> -                * backed by zero shadow pages, and punching holes into it
> -                * is non-trivial. Since the module region is not randomized
> -                * when KASAN is enabled without KASAN_VMALLOC, it is even
> -                * less likely that the module region gets exhausted, so we
> -                * can simply omit this fallback in that case.
> -                */
> -               p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> -                               module_alloc_base + SZ_2G, GFP_KERNEL,
> -                               PAGE_KERNEL, 0, NUMA_NO_NODE,
> -                               __builtin_return_address(0));
> -
> -       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
> -               vfree(p);
> -               return NULL;
> -       }
> -
> -       /* Memory is intended to be executable, reset the pointer tag. */
> -       return kasan_reset_tag(p);
> -}
> -
>  enum aarch64_reloc_op {
>         RELOC_OP_NONE,
>         RELOC_OP_ABS,
> diff --git a/arch/arm64/kernel/module_alloc.c b/arch/arm64/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..0340c8c0b782
> --- /dev/null
> +++ b/arch/arm64/kernel/module_alloc.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2012 ARM Limited
> + *
> + * Author: Will Deacon <will.deacon@arm.com>
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void *module_alloc(unsigned long size)
> +{
> +       u64 module_alloc_end = module_alloc_base + MODULES_VSIZE;
> +       gfp_t gfp_mask = GFP_KERNEL;
> +       void *p;
> +
> +       /* Silence the initial allocation */
> +       if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> +               gfp_mask |= __GFP_NOWARN;
> +
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> +           IS_ENABLED(CONFIG_KASAN_SW_TAGS))
> +               /* don't exceed the static module region - see below */
> +               module_alloc_end = MODULES_END;
> +
> +       p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> +                               module_alloc_end, gfp_mask, PAGE_KERNEL, VM_DEFER_KMEMLEAK,
> +                               NUMA_NO_NODE, __builtin_return_address(0));
> +
> +       if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
> +           (IS_ENABLED(CONFIG_KASAN_VMALLOC) ||
> +            (!IS_ENABLED(CONFIG_KASAN_GENERIC) &&
> +             !IS_ENABLED(CONFIG_KASAN_SW_TAGS))))
> +               /*
> +                * KASAN without KASAN_VMALLOC can only deal with module
> +                * allocations being served from the reserved module region,
> +                * since the remainder of the vmalloc region is already
> +                * backed by zero shadow pages, and punching holes into it
> +                * is non-trivial. Since the module region is not randomized
> +                * when KASAN is enabled without KASAN_VMALLOC, it is even
> +                * less likely that the module region gets exhausted, so we
> +                * can simply omit this fallback in that case.
> +                */
> +               p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> +                               module_alloc_base + SZ_2G, GFP_KERNEL,
> +                               PAGE_KERNEL, 0, NUMA_NO_NODE,
> +                               __builtin_return_address(0));
> +
> +       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
> +               vfree(p);
> +               return NULL;
> +       }
> +
> +       /* Memory is intended to be executable, reset the pointer tag. */
> +       return kasan_reset_tag(p);
> +}
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index 7c96282bff2e..cb9297b613a1 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -38,6 +38,11 @@ obj-$(CONFIG_SYNC_R4K)               += sync-r4k.o
>  obj-$(CONFIG_DEBUG_FS)         += segment.o
>  obj-$(CONFIG_STACKTRACE)       += stacktrace.o
>  obj-$(CONFIG_MODULES)          += module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                          += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)          += module_alloc.o
> +endif
>
>  obj-$(CONFIG_FTRACE_SYSCALLS)  += ftrace.o
>  obj-$(CONFIG_FUNCTION_TRACER)  += mcount.o ftrace.o
> diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
> index 14f46d17500a..214b2d1868a5 100644
> --- a/arch/mips/kernel/module.c
> +++ b/arch/mips/kernel/module.c
> @@ -31,15 +31,6 @@ struct mips_hi16 {
>  static LIST_HEAD(dbe_list);
>  static DEFINE_SPINLOCK(dbe_lock);
>
> -#ifdef MODULE_START
> -void *module_alloc(unsigned long size)
> -{
> -       return __vmalloc_node_range(size, 1, MODULE_START, MODULE_END,
> -                               GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> -                               __builtin_return_address(0));
> -}
> -#endif
> -
>  static void apply_r_mips_32(u32 *location, u32 base, Elf_Addr v)
>  {
>         *location = base + v;
> diff --git a/arch/mips/kernel/module_alloc.c b/arch/mips/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..582ab5ed8916
> --- /dev/null
> +++ b/arch/mips/kernel/module_alloc.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Copyright (C) 2001 Rusty Russell.
> + *  Copyright (C) 2003, 2004 Ralf Baechle (ralf@linux-mips.org)
> + *  Copyright (C) 2005 Thiemo Seufer
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/vmalloc.h>
> +
> +#ifdef MODULE_START
> +void *module_alloc(unsigned long size)
> +{
> +       return __vmalloc_node_range(size, 1, MODULE_START, MODULE_END,
> +                               GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> +                               __builtin_return_address(0));
> +}
> +#endif
> diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
> index d0bfac89a842..cd38083ae077 100644
> --- a/arch/parisc/kernel/Makefile
> +++ b/arch/parisc/kernel/Makefile
> @@ -25,6 +25,11 @@ obj-$(CONFIG_SMP)    += smp.o
>  obj-$(CONFIG_PA11)     += pci-dma.o
>  obj-$(CONFIG_PCI)      += pci.o
>  obj-$(CONFIG_MODULES)  += module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                  += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)  += module_alloc.o
> +endif
>  obj-$(CONFIG_64BIT)    += sys_parisc32.o signal32.o
>  obj-$(CONFIG_STACKTRACE)+= stacktrace.o
>  obj-$(CONFIG_AUDIT)    += audit.o
> diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
> index 7df140545b22..c81e63e2549b 100644
> --- a/arch/parisc/kernel/module.c
> +++ b/arch/parisc/kernel/module.c
> @@ -192,17 +192,6 @@ static inline int reassemble_22(int as22)
>                 ((as22 & 0x0003ff) << 3));
>  }
>
> -void *module_alloc(unsigned long size)
> -{
> -       /* using RWX means less protection for modules, but it's
> -        * easier than trying to map the text, data, init_text and
> -        * init_data correctly */
> -       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> -                                   GFP_KERNEL,
> -                                   PAGE_KERNEL_RWX, 0, NUMA_NO_NODE,
> -                                   __builtin_return_address(0));
> -}
> -
>  #ifndef CONFIG_64BIT
>  static inline unsigned long count_gots(const Elf_Rela *rela, unsigned long n)
>  {
> diff --git a/arch/parisc/kernel/module_alloc.c b/arch/parisc/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..4e4e4ce1132e
> --- /dev/null
> +++ b/arch/parisc/kernel/module_alloc.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux/PA-RISC Project
> + * Copyright (C) 2003 Randolph Chung <tausq at debian . org>
> + * Copyright (C) 2008 Helge Deller <deller@gmx.de>
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void *module_alloc(unsigned long size)
> +{
> +       /*
> +        * Using RWX means less protection for modules, but it's
> +        * easier than trying to map the text, data, init_text and
> +        * init_data correctly.
> +        */
> +       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> +                                   GFP_KERNEL,
> +                                   PAGE_KERNEL_RWX, 0, NUMA_NO_NODE,
> +                                   __builtin_return_address(0));
> +}
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 2e2a2a9bcf43..5a811cdf230b 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -103,6 +103,11 @@ obj-$(CONFIG_HIBERNATION)  += swsusp_$(BITS).o
>  endif
>  obj64-$(CONFIG_HIBERNATION)    += swsusp_asm64.o
>  obj-$(CONFIG_MODULES)          += module.o module_$(BITS).o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                          += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)          += module_alloc.o
> +endif
>  obj-$(CONFIG_44x)              += cpu_setup_44x.o
>  obj-$(CONFIG_PPC_FSL_BOOK3E)   += cpu_setup_fsl_booke.o
>  obj-$(CONFIG_PPC_DOORBELL)     += dbell.o
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index f6d6ae0a1692..b30e00964a60 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -88,40 +88,3 @@ int module_finalize(const Elf_Ehdr *hdr,
>
>         return 0;
>  }
> -
> -static __always_inline void *
> -__module_alloc(unsigned long size, unsigned long start, unsigned long end, bool nowarn)
> -{
> -       pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
> -       gfp_t gfp = GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
> -
> -       /*
> -        * Don't do huge page allocations for modules yet until more testing
> -        * is done. STRICT_MODULE_RWX may require extra work to support this
> -        * too.
> -        */
> -       return __vmalloc_node_range(size, 1, start, end, gfp, prot,
> -                                   VM_FLUSH_RESET_PERMS,
> -                                   NUMA_NO_NODE, __builtin_return_address(0));
> -}
> -
> -void *module_alloc(unsigned long size)
> -{
> -#ifdef MODULES_VADDR
> -       unsigned long limit = (unsigned long)_etext - SZ_32M;
> -       void *ptr = NULL;
> -
> -       BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> -
> -       /* First try within 32M limit from _etext to avoid branch trampolines */
> -       if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> -               ptr = __module_alloc(size, limit, MODULES_END, true);
> -
> -       if (!ptr)
> -               ptr = __module_alloc(size, MODULES_VADDR, MODULES_END, false);
> -
> -       return ptr;
> -#else
> -       return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
> -#endif
> -}
> diff --git a/arch/powerpc/kernel/module_alloc.c b/arch/powerpc/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..48541c27ce46
> --- /dev/null
> +++ b/arch/powerpc/kernel/module_alloc.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Kernel module help for powerpc.
> + *  Copyright (C) 2001, 2003 Rusty Russell IBM Corporation.
> + *  Copyright (C) 2008 Freescale Semiconductor, Inc.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +static __always_inline void *
> +__module_alloc(unsigned long size, unsigned long start, unsigned long end, bool nowarn)
> +{
> +       pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
> +       gfp_t gfp = GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
> +
> +       /*
> +        * Don't do huge page allocations for modules yet until more testing
> +        * is done. STRICT_MODULE_RWX may require extra work to support this
> +        * too.
> +        */
> +       return __vmalloc_node_range(size, 1, start, end, gfp, prot,
> +                                   VM_FLUSH_RESET_PERMS,
> +                                   NUMA_NO_NODE, __builtin_return_address(0));
> +}
> +
> +void *module_alloc(unsigned long size)
> +{
> +#ifdef MODULES_VADDR
> +       unsigned long limit = (unsigned long)_etext - SZ_32M;
> +       void *ptr = NULL;
> +
> +       BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> +
> +       /* First try within 32M limit from _etext to avoid branch trampolines */
> +       if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> +               ptr = __module_alloc(size, limit, MODULES_END, true);
> +
> +       if (!ptr)
> +               ptr = __module_alloc(size, MODULES_VADDR, MODULES_END, false);
> +
> +       return ptr;
> +#else
> +       return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
> +#endif
> +}
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index c71d6591d539..7af346ae575e 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -61,6 +61,11 @@ obj-$(CONFIG_SMP)            += cpu_ops.o
>
>  obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
>  obj-$(CONFIG_MODULES)          += module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                          += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)          += module_alloc.o
> +endif
>  obj-$(CONFIG_MODULE_SECTIONS)  += module-sections.o
>
>  obj-$(CONFIG_CPU_PM)           += suspend_entry.o suspend.o
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 91fe16bfaa07..1621d5e458f7 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -419,16 +419,6 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>         return 0;
>  }
>
> -#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> -void *module_alloc(unsigned long size)
> -{
> -       return __vmalloc_node_range(size, 1, MODULES_VADDR,
> -                                   MODULES_END, GFP_KERNEL,
> -                                   PAGE_KERNEL, 0, NUMA_NO_NODE,
> -                                   __builtin_return_address(0));
> -}
> -#endif
> -
>  static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
>                                     const Elf_Shdr *sechdrs,
>                                     const char *name)
> diff --git a/arch/riscv/kernel/module_alloc.c b/arch/riscv/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..ed87ed048713
> --- /dev/null
> +++ b/arch/riscv/kernel/module_alloc.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Copyright (C) 2017 Zihao Yu
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +#include <asm/sections.h>
> +
> +#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> +void *module_alloc(unsigned long size)
> +{
> +       return __vmalloc_node_range(size, 1, MODULES_VADDR,
> +                                   MODULES_END, GFP_KERNEL,
> +                                   PAGE_KERNEL, 0, NUMA_NO_NODE,
> +                                   __builtin_return_address(0));
> +}
> +#endif
> diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
> index 27d6b3c7aa06..71e73e34b441 100644
> --- a/arch/s390/kernel/Makefile
> +++ b/arch/s390/kernel/Makefile
> @@ -48,6 +48,11 @@ obj-$(CONFIG_SYSFS)          += nospec-sysfs.o
>  CFLAGS_REMOVE_nospec-branch.o  += $(CC_FLAGS_EXPOLINE)
>
>  obj-$(CONFIG_MODULES)          += module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                          += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)          += module_alloc.o
> +endif
>  obj-$(CONFIG_SCHED_TOPOLOGY)   += topology.o
>  obj-$(CONFIG_NUMA)             += numa.o
>  obj-$(CONFIG_AUDIT)            += audit.o
> diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
> index 26125a9c436d..e15f09fa50e2 100644
> --- a/arch/s390/kernel/module.c
> +++ b/arch/s390/kernel/module.c
> @@ -35,23 +35,6 @@
>
>  #define PLT_ENTRY_SIZE 22
>
> -void *module_alloc(unsigned long size)
> -{
> -       gfp_t gfp_mask = GFP_KERNEL;
> -       void *p;
> -
> -       if (PAGE_ALIGN(size) > MODULES_LEN)
> -               return NULL;
> -       p = __vmalloc_node_range(size, MODULE_ALIGN, MODULES_VADDR, MODULES_END,
> -                                gfp_mask, PAGE_KERNEL_EXEC, VM_DEFER_KMEMLEAK, NUMA_NO_NODE,
> -                                __builtin_return_address(0));
> -       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
> -               vfree(p);
> -               return NULL;
> -       }
> -       return p;
> -}
> -
>  #ifdef CONFIG_FUNCTION_TRACER
>  void module_arch_cleanup(struct module *mod)
>  {
> diff --git a/arch/s390/kernel/module_alloc.c b/arch/s390/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..e4c4175fb759
> --- /dev/null
> +++ b/arch/s390/kernel/module_alloc.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  Kernel module help for s390.
> + *
> + *  S390 version
> + *    Copyright IBM Corp. 2002, 2003
> + *    Author(s): Arnd Bergmann (arndb@de.ibm.com)
> + *              Martin Schwidefsky (schwidefsky@de.ibm.com)
> + *
> + *  based on i386 version
> + *    Copyright (C) 2001 Rusty Russell.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void *module_alloc(unsigned long size)
> +{
> +       gfp_t gfp_mask = GFP_KERNEL;
> +       void *p;
> +
> +       if (PAGE_ALIGN(size) > MODULES_LEN)
> +               return NULL;
> +       p = __vmalloc_node_range(size, MODULE_ALIGN, MODULES_VADDR, MODULES_END,
> +                                gfp_mask, PAGE_KERNEL_EXEC, VM_DEFER_KMEMLEAK, NUMA_NO_NODE,
> +                                __builtin_return_address(0));
> +       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
> +               vfree(p);
> +               return NULL;
> +       }
> +       return p;
> +}
> diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
> index d3a0e072ebe8..53905c00a094 100644
> --- a/arch/sparc/kernel/Makefile
> +++ b/arch/sparc/kernel/Makefile
> @@ -89,6 +89,11 @@ obj-$(CONFIG_SUN_PM)      += apc.o pmc.o
>
>  obj-$(CONFIG_MODULES)     += module.o
>  obj-$(CONFIG_MODULES)     += sparc_ksyms.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                     += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)     += module_alloc.o
> +endif
>  obj-$(CONFIG_SPARC_LED)   += led.o
>  obj-$(CONFIG_KGDB)        += kgdb_$(BITS).o
>
> diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
> index df39580f398d..f2babc69f189 100644
> --- a/arch/sparc/kernel/module.c
> +++ b/arch/sparc/kernel/module.c
> @@ -21,36 +21,6 @@
>
>  #include "entry.h"
>
> -#ifdef CONFIG_SPARC64
> -
> -#include <linux/jump_label.h>
> -
> -static void *module_map(unsigned long size)
> -{
> -       if (PAGE_ALIGN(size) > MODULES_LEN)
> -               return NULL;
> -       return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> -                               GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> -                               __builtin_return_address(0));
> -}
> -#else
> -static void *module_map(unsigned long size)
> -{
> -       return vmalloc(size);
> -}
> -#endif /* CONFIG_SPARC64 */
> -
> -void *module_alloc(unsigned long size)
> -{
> -       void *ret;
> -
> -       ret = module_map(size);
> -       if (ret)
> -               memset(ret, 0, size);
> -
> -       return ret;
> -}
> -
>  /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */
>  int module_frob_arch_sections(Elf_Ehdr *hdr,
>                               Elf_Shdr *sechdrs,
> diff --git a/arch/sparc/kernel/module_alloc.c b/arch/sparc/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..4bacf8cff012
> --- /dev/null
> +++ b/arch/sparc/kernel/module_alloc.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Kernel module help for sparc64.
> + *
> + * Copyright (C) 2001 Rusty Russell.
> + * Copyright (C) 2002 David S. Miller.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +#ifdef CONFIG_SPARC64
> +#include <linux/jump_label.h>
> +
> +static void *module_map(unsigned long size)
> +{
> +       if (PAGE_ALIGN(size) > MODULES_LEN)
> +               return NULL;
> +       return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> +                               GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> +                               __builtin_return_address(0));
> +}
> +#else
> +static void *module_map(unsigned long size)
> +{
> +       return vmalloc(size);
> +}
> +#endif /* CONFIG_SPARC64 */
> +
> +void *module_alloc(unsigned long size)
> +{
> +       void *ret;
> +
> +       ret = module_map(size);
> +       if (ret)
> +               memset(ret, 0, size);
> +
> +       return ret;
> +}
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index 03364dc40d8d..1f0304140f44 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -108,6 +108,11 @@ obj-$(CONFIG_KEXEC_FILE)   += kexec-bzimage64.o
>  obj-$(CONFIG_CRASH_DUMP)       += crash_dump_$(BITS).o
>  obj-y                          += kprobes/
>  obj-$(CONFIG_MODULES)          += module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y                          += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)          += module_alloc.o
> +endif
>  obj-$(CONFIG_X86_32)           += doublefault_32.o
>  obj-$(CONFIG_KGDB)             += kgdb.o
>  obj-$(CONFIG_VM86)             += vm86_32.o
> diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> index b98ffcf4d250..40bb10b5a68d 100644
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c
> @@ -36,56 +36,6 @@ do {                                                 \
>  } while (0)
>  #endif
>
> -#ifdef CONFIG_RANDOMIZE_BASE
> -static unsigned long module_load_offset;
> -
> -/* Mutex protects the module_load_offset. */
> -static DEFINE_MUTEX(module_kaslr_mutex);
> -
> -static unsigned long int get_module_load_offset(void)
> -{
> -       if (kaslr_enabled()) {
> -               mutex_lock(&module_kaslr_mutex);
> -               /*
> -                * Calculate the module_load_offset the first time this
> -                * code is called. Once calculated it stays the same until
> -                * reboot.
> -                */
> -               if (module_load_offset == 0)
> -                       module_load_offset =
> -                               (get_random_int() % 1024 + 1) * PAGE_SIZE;
> -               mutex_unlock(&module_kaslr_mutex);
> -       }
> -       return module_load_offset;
> -}
> -#else
> -static unsigned long int get_module_load_offset(void)
> -{
> -       return 0;
> -}
> -#endif
> -
> -void *module_alloc(unsigned long size)
> -{
> -       gfp_t gfp_mask = GFP_KERNEL;
> -       void *p;
> -
> -       if (PAGE_ALIGN(size) > MODULES_LEN)
> -               return NULL;
> -
> -       p = __vmalloc_node_range(size, MODULE_ALIGN,
> -                                   MODULES_VADDR + get_module_load_offset(),
> -                                   MODULES_END, gfp_mask,
> -                                   PAGE_KERNEL, VM_DEFER_KMEMLEAK, NUMA_NO_NODE,
> -                                   __builtin_return_address(0));
> -       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
> -               vfree(p);
> -               return NULL;
> -       }
> -
> -       return p;
> -}
> -
>  #ifdef CONFIG_X86_32
>  int apply_relocate(Elf32_Shdr *sechdrs,
>                    const char *strtab,
> diff --git a/arch/x86/kernel/module_alloc.c b/arch/x86/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..a7df2af1467a
> --- /dev/null
> +++ b/arch/x86/kernel/module_alloc.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Kernel module help for x86.
> + *  Copyright (C) 2001 Rusty Russell.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/random.h>
> +#include <linux/vmalloc.h>
> +#include <asm/setup.h>
> +
> +#ifdef CONFIG_RANDOMIZE_BASE
> +static unsigned long module_load_offset;
> +
> +/* Mutex protects the module_load_offset. */
> +static DEFINE_MUTEX(module_kaslr_mutex);
> +
> +static unsigned long get_module_load_offset(void)
> +{
> +       if (kaslr_enabled()) {
> +               mutex_lock(&module_kaslr_mutex);
> +               /*
> +                * Calculate the module_load_offset the first time this
> +                * code is called. Once calculated it stays the same until
> +                * reboot.
> +                */
> +               if (module_load_offset == 0)
> +                       module_load_offset =
> +                               (get_random_int() % 1024 + 1) * PAGE_SIZE;
> +               mutex_unlock(&module_kaslr_mutex);
> +       }
> +       return module_load_offset;
> +}
> +#else
> +static unsigned long get_module_load_offset(void)
> +{
> +       return 0;
> +}
> +#endif
> +
> +void *module_alloc(unsigned long size)
> +{
> +       gfp_t gfp_mask = GFP_KERNEL;
> +       void *p;
> +
> +       if (PAGE_ALIGN(size) > MODULES_LEN)
> +               return NULL;
> +
> +       p = __vmalloc_node_range(size, MODULE_ALIGN,
> +                                   MODULES_VADDR + get_module_load_offset(),
> +                                   MODULES_END, gfp_mask,
> +                                   PAGE_KERNEL, VM_DEFER_KMEMLEAK, NUMA_NO_NODE,
> +                                   __builtin_return_address(0));
> +       if (p && (kasan_alloc_module_shadow(p, size, gfp_mask) < 0)) {
> +               vfree(p);
> +               return NULL;
> +       }
> +
> +       return p;
> +}
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 318789c728d3..2981fe42060d 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -53,6 +53,11 @@ obj-y += livepatch/
>  obj-y += dma/
>  obj-y += entry/
>  obj-$(CONFIG_MODULES) += module/
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y += module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES) += module_alloc.o
> +endif
>
>  obj-$(CONFIG_KCMP) += kcmp.o
>  obj-$(CONFIG_FREEZER) += freezer.o
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index f214f8c088ed..3f9876374cd3 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1569,6 +1569,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
>                 goto out;
>         }
>
> +#ifdef CONFIG_MODULES
>         /* Check if 'p' is probing a module. */
>         *probed_mod = __module_text_address((unsigned long) p->addr);
>         if (*probed_mod) {
> @@ -1592,6 +1593,8 @@ static int check_kprobe_address_safe(struct kprobe *p,
>                         ret = -ENOENT;
>                 }
>         }
> +#endif
> +
>  out:
>         preempt_enable();
>         jump_label_unlock();
> @@ -2475,6 +2478,7 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
>         return 0;
>  }
>
> +#ifdef CONFIG_MODULES
>  /* Remove all symbols in given area from kprobe blacklist */
>  static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
>  {
> @@ -2492,6 +2496,7 @@ static void kprobe_remove_ksym_blacklist(unsigned long entry)
>  {
>         kprobe_remove_area_blacklist(entry, entry + 1);
>  }
> +#endif /* CONFIG_MODULES */
>
>  int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
>                                    char *type, char *sym)
> @@ -2557,6 +2562,7 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
>         return ret ? : arch_populate_kprobe_blacklist();
>  }
>
> +#ifdef CONFIG_MODULES
>  static void add_module_kprobe_blacklist(struct module *mod)
>  {
>         unsigned long start, end;
> @@ -2658,6 +2664,7 @@ static struct notifier_block kprobe_module_nb = {
>         .notifier_call = kprobes_module_callback,
>         .priority = 0
>  };
> +#endif /* CONFIG_MODULES */
>
>  void kprobe_free_init_mem(void)
>  {
> @@ -2717,8 +2724,11 @@ static int __init init_kprobes(void)
>         err = arch_init_kprobes();
>         if (!err)
>                 err = register_die_notifier(&kprobe_exceptions_nb);
> +
> +#ifdef CONFIG_MODULES
>         if (!err)
>                 err = register_module_notifier(&kprobe_module_nb);
> +#endif
>
>         kprobes_initialized = (err == 0);
>         kprobe_sysctls_init();
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index fed58d30725d..7fa182b78550 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1121,16 +1121,6 @@ resolve_symbol_wait(struct module *mod,
>         return ksym;
>  }
>
> -void __weak module_memfree(void *module_region)
> -{
> -       /*
> -        * This memory may be RO, and freeing RO memory in an interrupt is not
> -        * supported by vmalloc.
> -        */
> -       WARN_ON(in_interrupt());
> -       vfree(module_region);
> -}
> -
>  void __weak module_arch_cleanup(struct module *mod)
>  {
>  }
> @@ -1606,13 +1596,6 @@ static void dynamic_debug_remove(struct module *mod, struct _ddebug *debug)
>                 ddebug_remove_module(mod->name);
>  }
>
> -void * __weak module_alloc(unsigned long size)
> -{
> -       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> -                       GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
> -                       NUMA_NO_NODE, __builtin_return_address(0));
> -}
> -
>  bool __weak module_init_section(const char *name)
>  {
>         return strstarts(name, ".init");
> diff --git a/kernel/module_alloc.c b/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..26a4c60998ad
> --- /dev/null
> +++ b/kernel/module_alloc.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2002 Richard Henderson
> + * Copyright (C) 2001 Rusty Russell, 2002, 2010 Rusty Russell IBM.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void * __weak module_alloc(unsigned long size)
> +{
> +       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> +                       GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
> +                       NUMA_NO_NODE, __builtin_return_address(0));
> +}
> +
> +void __weak module_memfree(void *module_region)
> +{
> +       /*
> +        * This memory may be RO, and freeing RO memory in an interrupt is not
> +        * supported by vmalloc.
> +        */
> +       WARN_ON(in_interrupt());
> +       vfree(module_region);
> +}
> diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> index 93507330462c..050b2975332e 100644
> --- a/kernel/trace/trace_kprobe.c
> +++ b/kernel/trace/trace_kprobe.c
> @@ -101,6 +101,7 @@ static nokprobe_inline bool trace_kprobe_has_gone(struct trace_kprobe *tk)
>         return kprobe_gone(&tk->rp.kp);
>  }
>
> +#ifdef CONFIG_MODULES
>  static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
>                                                  struct module *mod)
>  {
> @@ -109,11 +110,13 @@ static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
>
>         return strncmp(module_name(mod), name, len) == 0 && name[len] == ':';
>  }
> +#endif /* CONFIG_MODULES */
>
>  static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>  {
> +       bool ret = false;
> +#ifdef CONFIG_MODULES
>         char *p;
> -       bool ret;
>
>         if (!tk->symbol)
>                 return false;
> @@ -125,6 +128,7 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>         ret = !!find_module(tk->symbol);
>         rcu_read_unlock_sched();
>         *p = ':';
> +#endif /* CONFIG_MODULES */
>
>         return ret;
>  }
> @@ -668,6 +672,7 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
>         return ret;
>  }
>
> +#ifdef CONFIG_MODULES
>  /* Module notifier call back, checking event on the module */
>  static int trace_kprobe_module_callback(struct notifier_block *nb,
>                                        unsigned long val, void *data)
> @@ -702,6 +707,7 @@ static struct notifier_block trace_kprobe_module_nb = {
>         .notifier_call = trace_kprobe_module_callback,
>         .priority = 1   /* Invoked after kprobe module callback */
>  };
> +#endif /* CONFIG_MODULES */
>
>  static int __trace_kprobe_create(int argc, const char *argv[])
>  {
> @@ -1896,8 +1902,10 @@ static __init int init_kprobe_trace_early(void)
>         if (ret)
>                 return ret;
>
> +#ifdef CONFIG_MODULES
>         if (register_module_notifier(&trace_kprobe_module_nb))
>                 return -EINVAL;
> +#endif /* CONFIG_MODULES */
>
>         return 0;
>  }
> --
> 2.36.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
