Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83AD41B9F7C
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 11:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgD0JMK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 05:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgD0JMK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 05:12:10 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8AAC0610D5
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2020 02:12:10 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id i19so18008072ioh.12
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2020 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b3PWbx/+myCxjImQX4mhyb15/CrcXhB+ZwdiW1eMk+w=;
        b=rJEqVc0/wYq59IQqlCA3pg0WU3ViaAYWGKjz76kcurCpHDz71ba3KPLNgQjHaQZSU4
         PQa4fLnmyIptXneB/oIzSeop2QT0d3VfhgtG24gmqOJ086+NnH5d+HgF+SoogmuxJwXq
         HsSgjCr3TfwZg0spIgHhjOvMSHmg/KKvkX/XQJHOy9rviH2gx1DDF9PxOEFI1Kk2lH1k
         PAohZS+/3F11Q95h8dyZvnvDj+eFXlI0HT3OzWuWSIrabZZSFI3xkfSyJbj7o5Sx9NBb
         wzfkT82aSrQVvqM6S2ZnxJTPjQDY4eucUMnNWnNAebS0KShAOxfKMBjCmAgi26LL+5el
         3oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b3PWbx/+myCxjImQX4mhyb15/CrcXhB+ZwdiW1eMk+w=;
        b=EMDJKsmpBKZftbUvXZZGerRD+nmH7xPVc5IJsSfvjePEdbge6SBA5lVd89tECZjTcY
         znPw15BbgOqdp+038s7ot6iuH8lCJEvkCIZgw3Rx3F/cxU/tlxUJGsdcVG3QdXRN1pXW
         FX/TwyLArg4INXpXUmk2CcVBTWz79L6t9lyKI8KmbrAlO4mFZoGWIgrp8dYCzCE2vzzo
         oVmgukKewvwtX5m5ilfP2mi7ly7yF2uNTdstlS5zRPRxLVCQsbGomGxjXTb79+8op5/1
         M+Jcy2PrlRcTmviPMb9Pp+6h/6tQbPvl+vzNVovjEi44kR8PBymbjSGvsUpU3jm7QNbY
         KLkw==
X-Gm-Message-State: AGi0PuYND5Ga7s37OrMn9t17n2K44eb9bcIUsFy5yk3HozpQiKtGKkY/
        jhuI7zAi0+mBD+sh1PlNm0VGouRro687B5XIk/M=
X-Google-Smtp-Source: APiQypJsqOhAT5VRv5C3L/2AKNH/KYPoxqepj33Hd19TYeMQmAtGMx+907PEJBGgrw7vRJFIj7bianb/Ruhy2Ew4r34=
X-Received: by 2002:a05:6638:401:: with SMTP id q1mr19046619jap.50.1587978729332;
 Mon, 27 Apr 2020 02:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <1584006083-28936-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1584006083-28936-1-git-send-email-chenhc@lemote.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Mon, 27 Apr 2020 17:19:36 +0800
Message-ID: <CAAhV-H6Jy_7N99XmBwjSEX=Fx16AY4Azt_fUNvPBZNiqxhJ_zQ@mail.gmail.com>
Subject: Re: [PATCH Resend] MIPS: Add syscall auditing support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@redhat.com>, linux-audit@redhat.com
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CC audit maintainers and audit mail-list.

Huacai

On Thu, Mar 12, 2020 at 5:33 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> From: Ralf Baechle <ralf@linux-mips.org>
>
> The original patch is from Ralf. I have maintained it for more than six
> years on Loongson platform, and it works perfectly. Most of the commit
> messages are written by Ralf.
>
> MIPS doesn't quite fit into the existing pattern of other architectures
> and I'd appreciate your comments and maybe even an Acked-by.
>
>  - Linux on MIPS extends the traditional syscall table used by older UNIX
>    implementations.  This is why 32-bit Linux syscalls are starting from
>    4000; the native 64-bit syscalls start from 5000 and the N32 compat ABI
>    from 6000.  The existing syscall bitmap is only large enough for at most
>    2048 syscalls, so I had to increase AUDIT_BITMASK_SIZE to 256 which
>    provides enough space for 8192 syscalls.  Because include/uapi/linux/
>    audit.h and AUDIT_BITMASK_SIZE are exported to userspace I've used an
>    #ifdef __mips__ for this.
>
>  - The code treats the little endian MIPS architecture as separate from
>    big endian.  Combined with the 3 ABIs that's 6 combinations.  I tried
>    to sort of follow the example set by ARM which explicitly lists the
>    (rare) big endian architecture variant - but it doesn't seem to very
>    useful so I wonder if this could be squashed to just the three ABIs
>    without consideration of endianess?
>
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/Kconfig                   | 13 +++++
>  arch/mips/include/asm/abi.h         |  1 +
>  arch/mips/include/asm/unistd.h      | 10 ++++
>  arch/mips/include/uapi/asm/unistd.h | 21 ++++----
>  arch/mips/kernel/Makefile           |  4 ++
>  arch/mips/kernel/audit-n32.c        | 58 ++++++++++++++++++++++
>  arch/mips/kernel/audit-native.c     | 97 +++++++++++++++++++++++++++++++++++++
>  arch/mips/kernel/audit-o32.c        | 60 +++++++++++++++++++++++
>  arch/mips/kernel/signal.c           | 18 +++++++
>  arch/mips/kernel/signal_n32.c       |  8 +++
>  arch/mips/kernel/signal_o32.c       |  8 +++
>  include/uapi/linux/audit.h          | 10 ++++
>  kernel/auditsc.c                    | 13 +++++
>  13 files changed, 312 insertions(+), 9 deletions(-)
>  create mode 100644 arch/mips/kernel/audit-n32.c
>  create mode 100644 arch/mips/kernel/audit-native.c
>  create mode 100644 arch/mips/kernel/audit-o32.c
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 27f800f..ac71fb0 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -17,6 +17,7 @@ config MIPS
>         select ARCH_USE_QUEUED_SPINLOCKS
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select ARCH_WANT_IPC_PARSE_VERSION
> +       select AUDIT_ARCH
>         select BUILDTIME_TABLE_SORT
>         select CLONE_BACKWARDS
>         select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
> @@ -40,6 +41,7 @@ config MIPS
>         select GENERIC_TIME_VSYSCALL
>         select GUP_GET_PTE_LOW_HIGH if CPU_MIPS32 && PHYS_ADDR_T_64BIT
>         select HANDLE_DOMAIN_IRQ
> +       select HAVE_ARCH_AUDITSYSCALL
>         select HAVE_ARCH_COMPILER_H
>         select HAVE_ARCH_JUMP_LABEL
>         select HAVE_ARCH_KGDB
> @@ -1121,6 +1123,15 @@ config FW_ARC
>  config ARCH_MAY_HAVE_PC_FDC
>         bool
>
> +config AUDIT_ARCH
> +       bool
> +
> +config AUDITSYSCALL_O32
> +       bool
> +
> +config AUDITSYSCALL_N32
> +       bool
> +
>  config BOOT_RAW
>         bool
>
> @@ -3192,6 +3203,7 @@ config MIPS32_O32
>         select COMPAT
>         select MIPS32_COMPAT
>         select SYSVIPC_COMPAT if SYSVIPC
> +       select AUDITSYSCALL_O32 if AUDITSYSCALL
>         help
>           Select this option if you want to run o32 binaries.  These are pure
>           32-bit binaries as used by the 32-bit Linux/MIPS port.  Most of
> @@ -3206,6 +3218,7 @@ config MIPS32_N32
>         select COMPAT
>         select MIPS32_COMPAT
>         select SYSVIPC_COMPAT if SYSVIPC
> +       select AUDITSYSCALL_N32 if AUDITSYSCALL
>         help
>           Select this option if you want to run n32 binaries.  These are
>           64-bit binaries using 32-bit quantities for addressing and certain
> diff --git a/arch/mips/include/asm/abi.h b/arch/mips/include/asm/abi.h
> index dba7f4b..6e717a4a 100644
> --- a/arch/mips/include/asm/abi.h
> +++ b/arch/mips/include/asm/abi.h
> @@ -21,6 +21,7 @@ struct mips_abi {
>         int (* const setup_rt_frame)(void *sig_return, struct ksignal *ksig,
>                                      struct pt_regs *regs, sigset_t *set);
>         const unsigned long     restart;
> +       const int audit_arch;
>
>         unsigned        off_sc_fpregs;
>         unsigned        off_sc_fpc_csr;
> diff --git a/arch/mips/include/asm/unistd.h b/arch/mips/include/asm/unistd.h
> index 5d70bab..80f5b5b 100644
> --- a/arch/mips/include/asm/unistd.h
> +++ b/arch/mips/include/asm/unistd.h
> @@ -59,4 +59,14 @@
>
>  #endif /* !__ASSEMBLY__ */
>
> +#ifdef CONFIG_MIPS32_N32
> +#define NR_syscalls    (__NR_N32_Linux + __NR_N32_Linux_syscalls)
> +#elif defined(CONFIG_64BIT)
> +#define NR_syscalls    (__NR_64_Linux  + __NR_64_Linux_syscalls)
> +#elif defined(CONFIG_32BIT)
> +#define NR_syscalls    (__NR_O32_Linux + __NR_O32_Linux_syscalls)
> +#else
> +#error Must know ABIs in use to define NR_syscalls
> +#endif
> +
>  #endif /* _ASM_UNISTD_H */
> diff --git a/arch/mips/include/uapi/asm/unistd.h b/arch/mips/include/uapi/asm/unistd.h
> index 4abe387..b501ea1 100644
> --- a/arch/mips/include/uapi/asm/unistd.h
> +++ b/arch/mips/include/uapi/asm/unistd.h
> @@ -6,34 +6,37 @@
>   *
>   * Copyright (C) 1995, 96, 97, 98, 99, 2000 by Ralf Baechle
>   * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
> - *
> - * Changed system calls macros _syscall5 - _syscall7 to push args 5 to 7 onto
> - * the stack. Robin Farine for ACN S.A, Copyright (C) 1996 by ACN S.A
>   */
>  #ifndef _UAPI_ASM_UNISTD_H
>  #define _UAPI_ASM_UNISTD_H
>
>  #include <asm/sgidefs.h>
>
> -#if _MIPS_SIM == _MIPS_SIM_ABI32
> +#if (defined(__WANT_SYSCALL_NUMBERS) &&                                        \
> +       (__WANT_SYSCALL_NUMBERS == _MIPS_SIM_ABI32)) ||                 \
> +       (!defined(__WANT_SYSCALL_NUMBERS) && _MIPS_SIM == _MIPS_SIM_ABI32)
>
>  #define __NR_Linux     4000
>  #include <asm/unistd_o32.h>
>
> -#endif /* _MIPS_SIM == _MIPS_SIM_ABI32 */
> +#endif /* Want O32 || _MIPS_SIM == _MIPS_SIM_ABI32  */
>
> -#if _MIPS_SIM == _MIPS_SIM_ABI64
> +#if (defined(__WANT_SYSCALL_NUMBERS) &&                                        \
> +       (__WANT_SYSCALL_NUMBERS == _MIPS_SIM_ABI64)) ||                 \
> +       (!defined(__WANT_SYSCALL_NUMBERS) && _MIPS_SIM == _MIPS_SIM_ABI64)
>
>  #define __NR_Linux     5000
>  #include <asm/unistd_n64.h>
>
> -#endif /* _MIPS_SIM == _MIPS_SIM_ABI64 */
> +#endif /* Want N64 || _MIPS_SIM == _MIPS_SIM_ABI64  */
>
> -#if _MIPS_SIM == _MIPS_SIM_NABI32
> +#if (defined(__WANT_SYSCALL_NUMBERS) &&                                        \
> +       (__WANT_SYSCALL_NUMBERS == _MIPS_SIM_NABI32)) ||                \
> +       (!defined(__WANT_SYSCALL_NUMBERS) && _MIPS_SIM == _MIPS_SIM_NABI32)
>
>  #define __NR_Linux     6000
>  #include <asm/unistd_n32.h>
>
> -#endif /* _MIPS_SIM == _MIPS_SIM_NABI32 */
> +#endif /* Want N32 || _MIPS_SIM == _MIPS_SIM_NABI32  */
>
>  #endif /* _UAPI_ASM_UNISTD_H */
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index d6e97df..a7ac38d 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -106,6 +106,10 @@ obj-$(CONFIG_HW_PERF_EVENTS)       += perf_event_mipsxx.o
>  obj-$(CONFIG_JUMP_LABEL)       += jump_label.o
>  obj-$(CONFIG_UPROBES)          += uprobes.o
>
> +obj-$(CONFIG_AUDITSYSCALL_O32) += audit-o32.o
> +obj-$(CONFIG_AUDITSYSCALL_N32) += audit-n32.o
> +obj-$(CONFIG_AUDITSYSCALL)     += audit-native.o
> +
>  obj-$(CONFIG_MIPS_CM)          += mips-cm.o
>  obj-$(CONFIG_MIPS_CPC)         += mips-cpc.o
>
> diff --git a/arch/mips/kernel/audit-n32.c b/arch/mips/kernel/audit-n32.c
> new file mode 100644
> index 00000000..2248badc
> --- /dev/null
> +++ b/arch/mips/kernel/audit-n32.c
> @@ -0,0 +1,58 @@
> +#define __WANT_SYSCALL_NUMBERS _MIPS_SIM_NABI32
> +
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/audit.h>
> +#include <asm/unistd.h>
> +
> +static unsigned dir_class_n32[] = {
> +#include <asm-generic/audit_dir_write.h>
> +~0U
> +};
> +
> +static unsigned read_class_n32[] = {
> +#include <asm-generic/audit_read.h>
> +~0U
> +};
> +
> +static unsigned write_class_n32[] = {
> +#include <asm-generic/audit_write.h>
> +~0U
> +};
> +
> +static unsigned chattr_class_n32[] = {
> +#include <asm-generic/audit_change_attr.h>
> +~0U
> +};
> +
> +static unsigned signal_class_n32[] = {
> +#include <asm-generic/audit_signal.h>
> +~0U
> +};
> +
> +int audit_classify_syscall_n32(int abi, unsigned syscall)
> +{
> +       switch (syscall) {
> +       case __NR_open:
> +               return 2;
> +       case __NR_openat:
> +               return 3;
> +       case __NR_execve:
> +               return 5;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static int __init audit_classes_n32_init(void)
> +{
> +       audit_register_class(AUDIT_CLASS_WRITE_N32, write_class_n32);
> +       audit_register_class(AUDIT_CLASS_READ_N32, read_class_n32);
> +       audit_register_class(AUDIT_CLASS_DIR_WRITE_N32, dir_class_n32);
> +       audit_register_class(AUDIT_CLASS_CHATTR_N32, chattr_class_n32);
> +       audit_register_class(AUDIT_CLASS_SIGNAL_N32, signal_class_n32);
> +
> +       return 0;
> +}
> +
> +__initcall(audit_classes_n32_init);
> diff --git a/arch/mips/kernel/audit-native.c b/arch/mips/kernel/audit-native.c
> new file mode 100644
> index 00000000..09ae3db
> --- /dev/null
> +++ b/arch/mips/kernel/audit-native.c
> @@ -0,0 +1,97 @@
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/audit.h>
> +#include <asm/unistd.h>
> +
> +static unsigned dir_class[] = {
> +#include <asm-generic/audit_dir_write.h>
> +~0U
> +};
> +
> +static unsigned read_class[] = {
> +#include <asm-generic/audit_read.h>
> +~0U
> +};
> +
> +static unsigned write_class[] = {
> +#include <asm-generic/audit_write.h>
> +~0U
> +};
> +
> +static unsigned chattr_class[] = {
> +#include <asm-generic/audit_change_attr.h>
> +~0U
> +};
> +
> +static unsigned signal_class[] = {
> +#include <asm-generic/audit_signal.h>
> +~0U
> +};
> +
> +
> +/*
> + * Pretend to be a single architecture
> + */
> +int audit_classify_arch(int arch)
> +{
> +       return 0;
> +}
> +
> +extern int audit_classify_syscall_o32(int abi, unsigned syscall);
> +extern int audit_classify_syscall_n32(int abi, unsigned syscall);
> +
> +int audit_classify_syscall(int abi, unsigned syscall)
> +{
> +       int res;
> +
> +       switch (syscall) {
> +       case __NR_open:
> +               res = 2;
> +               break;
> +
> +       case __NR_openat:
> +               res = 3;
> +               break;
> +
> +#ifdef __NR_socketcall         /* Only exists on O32 */
> +       case __NR_socketcall:
> +               res = 4;
> +               break;
> +#endif
> +       case __NR_execve:
> +               res = 5;
> +               break;
> +       default:
> +#ifdef CONFIG_AUDITSYSCALL_O32
> +               res = audit_classify_syscall_o32(abi, syscall);
> +               if (res)
> +                       break;
> +#endif
> +#ifdef CONFIG_AUDITSYSCALL_N32
> +               res = audit_classify_syscall_n32(abi, syscall);
> +               if (res)
> +                       break;
> +#endif
> +               if (abi == AUDIT_ARCH_MIPS || abi == AUDIT_ARCH_MIPSEL)
> +                       res = 1;
> +               else if (abi == AUDIT_ARCH_MIPS64 || abi == AUDIT_ARCH_MIPSEL64)
> +                       res = 0;
> +               else if (abi == AUDIT_ARCH_MIPS64N32 || abi == AUDIT_ARCH_MIPSEL64N32)
> +                       res = 6;
> +       }
> +
> +       return res;
> +}
> +
> +static int __init audit_classes_init(void)
> +{
> +       audit_register_class(AUDIT_CLASS_WRITE, write_class);
> +       audit_register_class(AUDIT_CLASS_READ, read_class);
> +       audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
> +       audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
> +       audit_register_class(AUDIT_CLASS_SIGNAL, signal_class);
> +
> +       return 0;
> +}
> +
> +__initcall(audit_classes_init);
> diff --git a/arch/mips/kernel/audit-o32.c b/arch/mips/kernel/audit-o32.c
> new file mode 100644
> index 00000000..e8b9b50
> --- /dev/null
> +++ b/arch/mips/kernel/audit-o32.c
> @@ -0,0 +1,60 @@
> +#define __WANT_SYSCALL_NUMBERS _MIPS_SIM_ABI32
> +
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/audit.h>
> +#include <linux/unistd.h>
> +
> +static unsigned dir_class_o32[] = {
> +#include <asm-generic/audit_dir_write.h>
> +~0U
> +};
> +
> +static unsigned read_class_o32[] = {
> +#include <asm-generic/audit_read.h>
> +~0U
> +};
> +
> +static unsigned write_class_o32[] = {
> +#include <asm-generic/audit_write.h>
> +~0U
> +};
> +
> +static unsigned chattr_class_o32[] = {
> +#include <asm-generic/audit_change_attr.h>
> +~0U
> +};
> +
> +static unsigned signal_class_o32[] = {
> +#include <asm-generic/audit_signal.h>
> +~0U
> +};
> +
> +int audit_classify_syscall_o32(int abi, unsigned syscall)
> +{
> +       switch (syscall) {
> +       case __NR_open:
> +               return 2;
> +       case __NR_openat:
> +               return 3;
> +       case __NR_socketcall:
> +               return 4;
> +       case __NR_execve:
> +               return 5;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static int __init audit_classes_o32_init(void)
> +{
> +       audit_register_class(AUDIT_CLASS_WRITE_32, write_class_o32);
> +       audit_register_class(AUDIT_CLASS_READ_32, read_class_o32);
> +       audit_register_class(AUDIT_CLASS_DIR_WRITE_32, dir_class_o32);
> +       audit_register_class(AUDIT_CLASS_CHATTR_32, chattr_class_o32);
> +       audit_register_class(AUDIT_CLASS_SIGNAL_32, signal_class_o32);
> +
> +       return 0;
> +}
> +
> +__initcall(audit_classes_o32_init);
> diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
> index f6efabc..b79d9a9 100644
> --- a/arch/mips/kernel/signal.c
> +++ b/arch/mips/kernel/signal.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
>   * Copyright (C) 2014, Imagination Technologies Ltd.
>   */
> +#include <linux/audit.h>
>  #include <linux/cache.h>
>  #include <linux/context_tracking.h>
>  #include <linux/irqflags.h>
> @@ -790,6 +791,23 @@ struct mips_abi mips_abi = {
>  #endif
>         .setup_rt_frame = setup_rt_frame,
>         .restart        = __NR_restart_syscall,
> +#ifdef CONFIG_64BIT
> +# ifdef __BIG_ENDIAN
> +       .audit_arch     = AUDIT_ARCH_MIPS64,
> +# elif defined(__LITTLE_ENDIAN)
> +       .audit_arch     = AUDIT_ARCH_MIPSEL64,
> +# else
> +#  error "Neither big nor little endian ???"
> +# endif
> +#else
> +# ifdef __BIG_ENDIAN
> +       .audit_arch     = AUDIT_ARCH_MIPS,
> +# elif defined(__LITTLE_ENDIAN)
> +       .audit_arch     = AUDIT_ARCH_MIPSEL,
> +# else
> +#  error "Neither big nor little endian ???"
> +# endif
> +#endif
>
>         .off_sc_fpregs = offsetof(struct sigcontext, sc_fpregs),
>         .off_sc_fpc_csr = offsetof(struct sigcontext, sc_fpc_csr),
> diff --git a/arch/mips/kernel/signal_n32.c b/arch/mips/kernel/signal_n32.c
> index 7bd00fa..ed03ea1 100644
> --- a/arch/mips/kernel/signal_n32.c
> +++ b/arch/mips/kernel/signal_n32.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (C) 2003 Broadcom Corporation
>   */
> +#include <linux/audit.h>
>  #include <linux/cache.h>
>  #include <linux/sched.h>
>  #include <linux/mm.h>
> @@ -140,6 +141,13 @@ static int setup_rt_frame_n32(void *sig_return, struct ksignal *ksig,
>  struct mips_abi mips_abi_n32 = {
>         .setup_rt_frame = setup_rt_frame_n32,
>         .restart        = __NR_N32_restart_syscall,
> +#ifdef __BIG_ENDIAN
> +       .audit_arch     = AUDIT_ARCH_MIPS64N32,
> +#elif defined(__LITTLE_ENDIAN)
> +       .audit_arch     = AUDIT_ARCH_MIPSEL64N32,
> +#else
> +# error "Neither big nor little endian ???"
> +#endif
>
>         .off_sc_fpregs = offsetof(struct sigcontext, sc_fpregs),
>         .off_sc_fpc_csr = offsetof(struct sigcontext, sc_fpc_csr),
> diff --git a/arch/mips/kernel/signal_o32.c b/arch/mips/kernel/signal_o32.c
> index 299a7a2..9f4ad0a 100644
> --- a/arch/mips/kernel/signal_o32.c
> +++ b/arch/mips/kernel/signal_o32.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
>   * Copyright (C) 2016, Imagination Technologies Ltd.
>   */
> +#include <linux/audit.h>
>  #include <linux/compiler.h>
>  #include <linux/errno.h>
>  #include <linux/signal.h>
> @@ -244,6 +245,13 @@ struct mips_abi mips_abi_32 = {
>         .setup_frame    = setup_frame_32,
>         .setup_rt_frame = setup_rt_frame_32,
>         .restart        = __NR_O32_restart_syscall,
> +#ifdef __BIG_ENDIAN
> +       .audit_arch     = AUDIT_ARCH_MIPS,
> +#elif defined(__LITTLE_ENDIAN)
> +       .audit_arch     = AUDIT_ARCH_MIPSEL,
> +#else
> +# error "Neither big nor little endian ???"
> +#endif
>
>         .off_sc_fpregs = offsetof(struct sigcontext32, sc_fpregs),
>         .off_sc_fpc_csr = offsetof(struct sigcontext32, sc_fpc_csr),
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index a534d71..336c1eb 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -179,7 +179,11 @@
>   * AUDIT_LIST commands must be implemented. */
>  #define AUDIT_MAX_FIELDS   64
>  #define AUDIT_MAX_KEY_LEN  256
> +#ifdef __mips__
> +#define AUDIT_BITMASK_SIZE 256
> +#else
>  #define AUDIT_BITMASK_SIZE 64
> +#endif
>  #define AUDIT_WORD(nr) ((__u32)((nr)/32))
>  #define AUDIT_BIT(nr)  (1 << ((nr) - AUDIT_WORD(nr)*32))
>
> @@ -195,6 +199,12 @@
>  #define AUDIT_CLASS_SIGNAL 8
>  #define AUDIT_CLASS_SIGNAL_32 9
>
> +#define AUDIT_CLASS_DIR_WRITE_N32      10
> +#define AUDIT_CLASS_CHATTR_N32         11
> +#define AUDIT_CLASS_READ_N32           12
> +#define AUDIT_CLASS_WRITE_N32          13
> +#define AUDIT_CLASS_SIGNAL_N32         14
> +
>  /* This bitmask is used to validate user input.  It represents all bits that
>   * are currently used in an audit field constant understood by the kernel.
>   * If you are adding a new #define AUDIT_<whatever>, please ensure that
> diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> index 4effe01..cf223c0 100644
> --- a/kernel/auditsc.c
> +++ b/kernel/auditsc.c
> @@ -168,6 +168,19 @@ static int audit_match_perm(struct audit_context *ctx, int mask)
>                 return ((mask & AUDIT_PERM_WRITE) && ctx->argv[0] == SYS_BIND);
>         case 5: /* execve */
>                 return mask & AUDIT_PERM_EXEC;
> +#ifdef CONFIG_MIPS
> +       case 6: /* for N32 */
> +               if ((mask & AUDIT_PERM_WRITE) &&
> +                    audit_match_class(AUDIT_CLASS_WRITE_N32, n))
> +                       return 1;
> +               if ((mask & AUDIT_PERM_READ) &&
> +                    audit_match_class(AUDIT_CLASS_READ_N32, n))
> +                       return 1;
> +               if ((mask & AUDIT_PERM_ATTR) &&
> +                    audit_match_class(AUDIT_CLASS_CHATTR_N32, n))
> +                       return 1;
> +               return 0;
> +#endif
>         default:
>                 return 0;
>         }
> --
> 2.7.0
>
