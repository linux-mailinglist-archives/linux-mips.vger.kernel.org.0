Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7A82D82F2
	for <lists+linux-mips@lfdr.de>; Sat, 12 Dec 2020 00:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403928AbgLKXyf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Dec 2020 18:54:35 -0500
Received: from mout.gmx.net ([212.227.17.20]:35649 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728288AbgLKXye (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Dec 2020 18:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1607730741;
        bh=YjpScPSitxhXrQ3d5WO7n4bnSfCv8HzesxFO/dspCQ0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=WmDES5BxB6dtzI0sk9tNGEoGn5fJrCNq8zuyT3gm1OnfcbY80WiYFsP5Gc2AXKWfS
         ArnVmg+Tv0czK8KtUUr2TgmEzfS/wJt9NQ17od+cb4556Owl3bJ7Aux02BquSZF7Rt
         /JROx9SX4MgRcx2HKGZ4gPH15yMSHf8YWe6DtPec=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([62.143.246.89]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ygY-1kivzO3wLm-006AOa; Sat, 12
 Dec 2020 00:52:21 +0100
Subject: Re: [RFC] cacheflush.2: Document different prototypes for different
 architectures
To:     "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>,
        "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>
Cc:     Dave Martin <Dave.Martin@arm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org
References: <c284e55d-98e9-ae53-b6ca-f331b73841c7@gmail.com>
From:   Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <20a8ebd5-ce04-1404-6113-02910cb21982@gmx.de>
Date:   Sat, 12 Dec 2020 00:52:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c284e55d-98e9-ae53-b6ca-f331b73841c7@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cwJLMvkrA8183TXhb+dAHxC64WyD7Ip4Gfxu1TYhvWFbKVbIRHJ
 pgW/OQBCMmMjmzmWz2IkF7ZxnrF2yDARk7coJf8VgrS4EQQOQ1ayynSi9cxC4IWaDyxTM07
 110v4LQi6bn85wluChQlGE5UCwR3johmWES0ADlTr+Xf/Pf9laJAuWpYDjV3TsgHh76T/4j
 z4PytjEeMWjtm0jjF8vRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q40XcGM0CuQ=:J8Fpt5B8U7V+dR17PvBHT1
 /e6QvUR6qWAK/4zw3P2x2bZ1wC9GTshgCBr+i2fPDe6NHMDHwkaTtTGYo4Ik3Cj1L5VZtDX9V
 CgnE2WH4H7EirtSRg9nLSE3EF8YCTJ5IjWhyUYz8E8bnZdMW71B17ER+EHCSGLLBEEtVZAG0A
 LxIJEKK92aounWRSqBDIrRM0zv/4uvGRHoIg15WU4fkhS4pgjQk26bvMxoNoXTRBUTadsd4Mv
 epYAqXXyCJypnHVigO7c57fnKN3hqalLnZZ0Z8ZcSA43JV9MvpNLswb2DGQUcTssEpDSO6mWW
 uenBk/xSlTasXtLUuxd2XMnAx59PTDwKUf2jLr4ZeI8iEPJtWRjjL9fUIy+Ik7IlfiBb92Yry
 ESYtOoPp6fjUnaEBYKo24LEIUYbgYLH8HEUF6X6FFqe+XV/qQY+SnN0ByzWbnKJjCIHV0vRgI
 0TdIueiHrqcHcbmtuLdGfjMGJxYUx6f1GVYihAz3PhMFfRsLM791yAYM/o2I5UxqsZ65g10Zq
 Nl/MvDg2P2LuHD3uqWxeqXZGsNTnBHjTTrrgQzNyuKGfW4086xjaoZ4lkT7WGZ1C9z8zFel72
 raxUoQh88G62A9DWR5OgZnWEWuAwIYp0FonPuMHkGJdmiX4XF8U1tm5Fm4NkzXWxUR/7TCvsT
 g0LSNlMWfGgxBywK0nWxjB7zWt7A4boNp4p5Upu81RDagHVZ8K2j180cjyFt+Qsrx78Gwlt3O
 JgPJMH8LcfJ04mqhM8iBZec9cSmvqChT2NXxF2YJ+Plh0hOEdxXJ876NrtpYsOWePhnWAtYvg
 x2+UblH8e52ji2mdl+h+eMMnOlD2Vy+yafVb/EWIZGCkm/HfFSrVC0qxgc57dSBjrxRHUGgWh
 g+gM3BOU4V+QIxmo3tKA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/11/20 10:09 PM, Alejandro Colomar (man-pages) wrote:
> Hi Michael,
>
> Continuing with the changes in this thread:
> https://lore.kernel.org/linux-man/747d56e0-c102-ab40-add4-530a48a43a4d@g=
mx.de/T/#t
>
> I researched the architectures that have this syscall.  I found some
> that clearly provide the syscall, and some that seem to have something,
> but I didn't find a definition in the kernel (i.e., ARM, MicroBlaze
> (glibc only)?)

arch/arm/include/uapi/asm/unistd.h:35:
#define __ARM_NR_cacheflush               (__ARM_NR_BASE+2)

arch/arm64/include/asm/unistd.h:37:
#define __ARM_NR_compat_cacheflush   (__ARM_NR_COMPAT_BASE + 2)

These syscalls are marked as private. So you should not use them from
user space.

The compilers seem not to care about these syscalls being private:

https://github.com/gcc-mirror/gcc/blob/master/libgcc/config/arm/lib1funcs.=
S#L1512
https://github.com/llvm-mirror/compiler-rt/blob/master/lib/builtins/clear_=
cache.c

Best regards

Heinrich

>
> Research:
>
> $ grep -rn cacheflush glibc/
> glibc/sysdeps/unix/sysv/linux/m68k/m680x0/libc.abilist:324:GLIBC_2.0
> cacheflush F
> glibc/sysdeps/unix/sysv/linux/m68k/Versions:13:    cacheflush;
> glibc/sysdeps/unix/sysv/linux/m68k/arch-syscall.h:17:#define
> __NR_cacheflush 123
> glibc/sysdeps/unix/sysv/linux/m68k/syscalls.list:18:cacheflush	EXTRA
> cacheflush	i:iiii	__cacheflush	cacheflush
> glibc/sysdeps/unix/sysv/linux/m68k/coldfire/libc.abilist:744:GLIBC_2.4
> cacheflush F
> glibc/sysdeps/unix/sysv/linux/arc/Versions:10:    cacheflush;
> glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:1:/* cacheflush - flush
> contents of instruction and/or data cache.
> glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:30:extern int
> cacheflush (void *__addr, int __nbytes, int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/arc/arch-syscall.h:13:#define
> __NR_cacheflush 244
> glibc/sysdeps/unix/sysv/linux/arc/syscalls.list:3:cacheflush	-
> cacheflush	i:pii	_flush_cache	cacheflush
> glibc/sysdeps/unix/sysv/linux/arc/Makefile:10:# MIPS/Tile-style
> cacheflush routine
> glibc/sysdeps/unix/sysv/linux/arc/Makefile:12:sysdep_routines +=3D cache=
flush
> glibc/sysdeps/unix/sysv/linux/arc/libc.abilist:574:GLIBC_2.32 cacheflush=
 F
> glibc/sysdeps/unix/sysv/linux/csky/Versions:3:    cacheflush;
> glibc/sysdeps/unix/sysv/linux/csky/sys/cachectl.h:30:extern int
> cacheflush (void *__addr, const int __nbytes,
> glibc/sysdeps/unix/sysv/linux/csky/arch-syscall.h:10:#define
> __NR_cacheflush 245
> glibc/sysdeps/unix/sysv/linux/csky/syscalls.list:2:cacheflush	-
> cacheflush	i:pii	_flush_cache	cacheflush
> glibc/sysdeps/unix/sysv/linux/csky/Makefile:2:sysdep_routines +=3D cache=
flush
> glibc/sysdeps/unix/sysv/linux/csky/libc.abilist:594:GLIBC_2.29 cacheflus=
h F
> glibc/sysdeps/unix/sysv/linux/mips/mips32/fpu/libc.abilist:322:GLIBC_2.0
> cacheflush F
> glibc/sysdeps/unix/sysv/linux/mips/mips32/arch-syscall.h:19:#define
> __NR_cacheflush 4147
> glibc/sysdeps/unix/sysv/linux/mips/mips32/nofpu/libc.abilist:322:GLIBC_2=
.0
> cacheflush F
> glibc/sysdeps/unix/sysv/linux/mips/Versions:19:    cachectl; cacheflush;
> glibc/sysdeps/unix/sysv/linux/mips/sys/cachectl.h:35:extern int
> cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/mips/mips64/n64/arch-syscall.h:16:#define
> __NR_cacheflush 5197
> glibc/sysdeps/unix/sysv/linux/mips/mips64/n64/libc.abilist:320:GLIBC_2.0
> cacheflush F
> glibc/sysdeps/unix/sysv/linux/mips/mips64/n32/arch-syscall.h:16:#define
> __NR_cacheflush 6197
> glibc/sysdeps/unix/sysv/linux/mips/mips64/n32/libc.abilist:322:GLIBC_2.0
> cacheflush F
> glibc/sysdeps/unix/sysv/linux/mips/syscalls.list:8:cacheflush	-
> cacheflush	i:pii	_flush_cache	cacheflush
> glibc/sysdeps/unix/sysv/linux/mips/Makefile:6:sysdep_routines +=3D
> cachectl cacheflush sysmips _test_and_set
> glibc/sysdeps/unix/sysv/linux/sh/arch-syscall.h:16:#define
> __NR_cacheflush 123
> glibc/sysdeps/unix/sysv/linux/nios2/Versions:4:    cacheflush;
> glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:1:/* cacheflush -
> flush contents of instruction and/or data cache.
> glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:extern int
> cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/nios2/arch-syscall.h:10:#define
> __NR_cacheflush 244
> glibc/sysdeps/unix/sysv/linux/nios2/cacheflush.c:1:/* cacheflush system
> call for Nios II Linux.
> glibc/sysdeps/unix/sysv/linux/nios2/cacheflush.c:27:  return
> INLINE_SYSCALL (cacheflush, 3, addr, nbytes, op);
> glibc/sysdeps/unix/sysv/linux/nios2/cacheflush.c:29:weak_alias
> (_flush_cache, cacheflush)
> glibc/sysdeps/unix/sysv/linux/nios2/Makefile:6:# MIPS-style cacheflush
> routine
> glibc/sysdeps/unix/sysv/linux/nios2/Makefile:8:sysdep_routines +=3D cach=
eflush
> glibc/sysdeps/unix/sysv/linux/nios2/libc.abilist:663:GLIBC_2.21 cacheflu=
sh F
> glibc/sysdeps/unix/sysv/linux/arm/dl-machine.h:23:
> INTERNAL_SYSCALL_CALL (cacheflush, (BEG), (END), 0)
> glibc/sysdeps/unix/sysv/linux/arm/arch-syscall.h:17:#define
> __NR_cacheflush 983042
> glibc/sysdeps/unix/sysv/linux/arm/fixup-asm-unistd.h:19:#ifndef
> __NR_cacheflush
> glibc/sysdeps/unix/sysv/linux/arm/fixup-asm-unistd.h:20:# define
> __NR_cacheflush __ARM_NR_cacheflush
> glibc/sysdeps/unix/sysv/linux/microblaze/syscalls.list:3:cacheflush
> EXTRA	cacheflush	i:iiii	__cacheflush	cacheflush
> glibc/sysdeps/unix/sysv/linux/syscall-names.list:60:cacheflush
> glibc/benchtests/strcoll-inputs/filelist#en_US.UTF-8:1417:cacheflush.c
> glibc/benchtests/strcoll-inputs/filelist#en_US.UTF-8:1744:cacheflush.c
> glibc/ChangeLog.old/ChangeLog.7:7489:	* sysdeps/mach/mips/cacheflush.c:
> Likewise.
> glibc/ChangeLog.old/ChangeLog.7:9422:	*
> sysdeps/unix/sysv/linux/m68k/syscalls.list: Add cacheflush.
> glibc/ChangeLog.old/ChangeLog.4:205:	* sysdeps/mach/mips/cacheflush.c:
> New file.
> glibc/ChangeLog.old/ChangeLog.18:40858:	*
> sysdeps/unix/sysv/linux/nios2/cacheflush.c: New file.
> glibc/ChangeLog.old/ChangeLog.ports-tile:700:	*
> sysdeps/unix/sysv/linux/tile/cacheflush.c: New file.
> grep: glibc/.git/index: binary file matches
>
> $ grep -rn -e 'sys_cacheflush' -e 'SYSCALL_DEFINE.(cacheflush,' linux/ |
> grep -v -e '/arc/' -e '/csky/' -e '/mips/' -e '/nios2/'
> tools/testing/selftests/futex/functional/usr/include/linux/capability.h:=
251:/*
> Allow flushing all cache on m68k (sys_cacheflush) */
> include/uapi/linux/capability.h:253:/* Allow flushing all cache on m68k
> (sys_cacheflush) */
> arch/m68k/kernel/sys_m68k.c:376:/* sys_cacheflush -- flush (part of) the
> processor cache.  */
> arch/m68k/kernel/sys_m68k.c:378:sys_cacheflush (unsigned long addr, int
> scope, int cache, unsigned long len)
> arch/m68k/kernel/sys_m68k.c:531:/* sys_cacheflush -- flush (part of) the
> processor cache.  */
> arch/m68k/kernel/sys_m68k.c:533:sys_cacheflush (unsigned long addr, int
> scope, int cache, unsigned long len)
> arch/m68k/kernel/syscalls/syscall.tbl:133:123	common	cacheflush
> sys_cacheflush
> arch/sh/kernel/sys_sh.c:57:/* sys_cacheflush -- flush (part of) the
> processor cache.  */
> arch/sh/kernel/sys_sh.c:58:asmlinkage int sys_cacheflush(unsigned long
> addr, unsigned long len, int op)
> arch/sh/kernel/syscalls/syscall.tbl:133:123	common	cacheflush
> sys_cacheflush
> arch/arm/include/asm/cacheflush.h:263: * This is used for the ARM
> private sys_cacheflush system call.
> arch/nds32/include/uapi/asm/unistd.h:15:__SYSCALL(__NR_cacheflush,
> sys_cacheflush)
> arch/nds32/include/asm/syscalls.h:7:asmlinkage long
> sys_cacheflush(unsigned long addr, unsigned long len, unsigned int op);
> arch/nds32/kernel/sys_nds32.c:29:SYSCALL_DEFINE3(cacheflush, unsigned
> int, start, unsigned int, end, int, cache)
>
> Rendered page (NOTES only):
>
> [
> NOTES
>     Architecture-specific variants
>         Glibc  provides a wrapper for this system call, with the pro=E2=
=80=90
>         totype shown in SYNOPSIS, for  the  following  architectures:
>         ARC, CSKY, MIPS, and NIOS2. // lowercase?
>
>         On  some other architectures, Linux provides this system call
>         with different arguments:
>
>         M68K:
>
>             int cacheflush(unsigned long addr, int scope, int cache,
>                            unsigned long len);
>
>         SH:
>
>             int cacheflush(unsigned long addr, unsigned long len, int op=
);
>
>         NDS32:
>
>             int cacheflush(unsigned int start, unsigned int end, int cac=
he);
>
>         // ARM??
>
>     GCC alternative
>         Unless you need the finer grained control  that  this  system
>         call  provides,  you  probably  want  to use the GCC built-in
>         function __builtin___clear_cache(), which provides a portable
>         interface  across  platforms  supported by GCC and compatible
>         compilers:
>
>             void __builtin___clear_cache(void *begin, void *end);
>
>         On platforms that don't require  instruction  cache  flushes,
>         __builtin___clear_cache() has no effect.
>
>         Note:  On  some  GCC-compatible compilers, such as clang, the
>         prototype for this function uses char * instead of void * for
>         the parameters.
>
> ]
>
> 'GCC alternative' is the name I gave to the NOTES from the other thread,
> which aren't yet merged (I'll send the patches after the weekend, probab=
ly).
>
> Subsections based on:
> fadvise64(2)
>
> Can you review this?
>
> Thanks,
>
> Alex
>

