Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7C02D8087
	for <lists+linux-mips@lfdr.de>; Fri, 11 Dec 2020 22:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395123AbgLKVKq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Dec 2020 16:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395162AbgLKVKe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Dec 2020 16:10:34 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9F6C0613D6;
        Fri, 11 Dec 2020 13:09:53 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id q75so9829097wme.2;
        Fri, 11 Dec 2020 13:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=T6ILMHZ/NNQpPvj6XySo3XOAP6NvPOD+6q4GIJdVrMM=;
        b=PRHEdigbGI9VPoorUh55pbYfdSTfg/QwxYzUZTaBUn4wxB+JivzIx1EWddM9FbTpvA
         No11iqN+w0nKD7eEbpfdGFtJrF1KmAm0EG4ssfzjYKvx9WuJkZUk2cTI2vmmHrTzts7c
         O4eIGYoQlu9edjhJ46nEhE0vTFwmlZfPZE53MeSQn8V0N4WLpYRwONMVLONyt4lbi2Ew
         8Ha0KkgOnD0fQ55IFrqAkspv8Vne0uD+rR+LKc2TFYTdWH7p9GG77jUeuZQ4DnDfOQ/M
         764WE5Y9MHMHWQEUVlJx98Jmk9KChkDYZVBs0Um3uyMH9XkVQXkknN5lR9ZNGibRGqJA
         km8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=T6ILMHZ/NNQpPvj6XySo3XOAP6NvPOD+6q4GIJdVrMM=;
        b=XrY8SEItX+jh39+CKPE9tvmgXdaNobzp2/DWL+iOMCgXuYp9TlOkOOYrzwF2/3r9Je
         CsCG2gSIBqp559j7Jl+2d6YgnAea2cOXy4HjjvGp9Y3ePZH7y5J9dqDaaAEIwj70E+iA
         gIbFY/FjVwCbMn6cHyqmXhIWE7lLSyW5BGw9sAwFMQz1ae1saCTYTWyP10bITtP2lDfG
         MB2Nx2ZKFnpT55R4SxmIhtLIm3XQ9w0Didn79QSjAyu5vBvuLmIlRO9En8tSZ4Q0HYiP
         tOCtyCUI5VCq+cSUv9lcjrTDvW7zcedNFZzzm8HV8t9lqxlwxabDlrWC2MN7+X6Z9itn
         NbTA==
X-Gm-Message-State: AOAM530jXgWntM3dWDCEQKovvNgg0aqheFDcSIkxUS2Vjdq2yJIv8kFf
        5Qg7XLyvvTJGz2JXr7mMShg=
X-Google-Smtp-Source: ABdhPJzm6wwtrpZF0aZ69wRze6eVctVQ9PK2JIwaAzhtlY6C9zc5/Jg8E6o4YKkzvrPLonanBMK1pw==
X-Received: by 2002:a05:600c:2116:: with SMTP id u22mr15431517wml.174.1607720992520;
        Fri, 11 Dec 2020 13:09:52 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id t1sm18065810wro.27.2020.12.11.13.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 13:09:52 -0800 (PST)
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>
Cc:     Dave Martin <Dave.Martin@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Subject: [RFC] cacheflush.2: Document different prototypes for different
 architectures
Message-ID: <c284e55d-98e9-ae53-b6ca-f331b73841c7@gmail.com>
Date:   Fri, 11 Dec 2020 22:09:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Michael,

Continuing with the changes in this thread:
https://lore.kernel.org/linux-man/747d56e0-c102-ab40-add4-530a48a43a4d@gmx.de/T/#t

I researched the architectures that have this syscall.  I found some
that clearly provide the syscall, and some that seem to have something,
but I didn't find a definition in the kernel (i.e., ARM, MicroBlaze
(glibc only)?)

Research:

$ grep -rn cacheflush glibc/
glibc/sysdeps/unix/sysv/linux/m68k/m680x0/libc.abilist:324:GLIBC_2.0
cacheflush F
glibc/sysdeps/unix/sysv/linux/m68k/Versions:13:    cacheflush;
glibc/sysdeps/unix/sysv/linux/m68k/arch-syscall.h:17:#define
__NR_cacheflush 123
glibc/sysdeps/unix/sysv/linux/m68k/syscalls.list:18:cacheflush	EXTRA
cacheflush	i:iiii	__cacheflush	cacheflush
glibc/sysdeps/unix/sysv/linux/m68k/coldfire/libc.abilist:744:GLIBC_2.4
cacheflush F
glibc/sysdeps/unix/sysv/linux/arc/Versions:10:    cacheflush;
glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:1:/* cacheflush - flush
contents of instruction and/or data cache.
glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:30:extern int
cacheflush (void *__addr, int __nbytes, int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/arc/arch-syscall.h:13:#define
__NR_cacheflush 244
glibc/sysdeps/unix/sysv/linux/arc/syscalls.list:3:cacheflush	-
cacheflush	i:pii	_flush_cache	cacheflush
glibc/sysdeps/unix/sysv/linux/arc/Makefile:10:# MIPS/Tile-style
cacheflush routine
glibc/sysdeps/unix/sysv/linux/arc/Makefile:12:sysdep_routines += cacheflush
glibc/sysdeps/unix/sysv/linux/arc/libc.abilist:574:GLIBC_2.32 cacheflush F
glibc/sysdeps/unix/sysv/linux/csky/Versions:3:    cacheflush;
glibc/sysdeps/unix/sysv/linux/csky/sys/cachectl.h:30:extern int
cacheflush (void *__addr, const int __nbytes,
glibc/sysdeps/unix/sysv/linux/csky/arch-syscall.h:10:#define
__NR_cacheflush 245
glibc/sysdeps/unix/sysv/linux/csky/syscalls.list:2:cacheflush	-
cacheflush	i:pii	_flush_cache	cacheflush
glibc/sysdeps/unix/sysv/linux/csky/Makefile:2:sysdep_routines += cacheflush
glibc/sysdeps/unix/sysv/linux/csky/libc.abilist:594:GLIBC_2.29 cacheflush F
glibc/sysdeps/unix/sysv/linux/mips/mips32/fpu/libc.abilist:322:GLIBC_2.0
cacheflush F
glibc/sysdeps/unix/sysv/linux/mips/mips32/arch-syscall.h:19:#define
__NR_cacheflush 4147
glibc/sysdeps/unix/sysv/linux/mips/mips32/nofpu/libc.abilist:322:GLIBC_2.0
cacheflush F
glibc/sysdeps/unix/sysv/linux/mips/Versions:19:    cachectl; cacheflush;
glibc/sysdeps/unix/sysv/linux/mips/sys/cachectl.h:35:extern int
cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/mips/mips64/n64/arch-syscall.h:16:#define
__NR_cacheflush 5197
glibc/sysdeps/unix/sysv/linux/mips/mips64/n64/libc.abilist:320:GLIBC_2.0
cacheflush F
glibc/sysdeps/unix/sysv/linux/mips/mips64/n32/arch-syscall.h:16:#define
__NR_cacheflush 6197
glibc/sysdeps/unix/sysv/linux/mips/mips64/n32/libc.abilist:322:GLIBC_2.0
cacheflush F
glibc/sysdeps/unix/sysv/linux/mips/syscalls.list:8:cacheflush	-
cacheflush	i:pii	_flush_cache	cacheflush
glibc/sysdeps/unix/sysv/linux/mips/Makefile:6:sysdep_routines +=
cachectl cacheflush sysmips _test_and_set
glibc/sysdeps/unix/sysv/linux/sh/arch-syscall.h:16:#define
__NR_cacheflush 123
glibc/sysdeps/unix/sysv/linux/nios2/Versions:4:    cacheflush;
glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:1:/* cacheflush -
flush contents of instruction and/or data cache.
glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:extern int
cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
glibc/sysdeps/unix/sysv/linux/nios2/arch-syscall.h:10:#define
__NR_cacheflush 244
glibc/sysdeps/unix/sysv/linux/nios2/cacheflush.c:1:/* cacheflush system
call for Nios II Linux.
glibc/sysdeps/unix/sysv/linux/nios2/cacheflush.c:27:  return
INLINE_SYSCALL (cacheflush, 3, addr, nbytes, op);
glibc/sysdeps/unix/sysv/linux/nios2/cacheflush.c:29:weak_alias
(_flush_cache, cacheflush)
glibc/sysdeps/unix/sysv/linux/nios2/Makefile:6:# MIPS-style cacheflush
routine
glibc/sysdeps/unix/sysv/linux/nios2/Makefile:8:sysdep_routines += cacheflush
glibc/sysdeps/unix/sysv/linux/nios2/libc.abilist:663:GLIBC_2.21 cacheflush F
glibc/sysdeps/unix/sysv/linux/arm/dl-machine.h:23:
INTERNAL_SYSCALL_CALL (cacheflush, (BEG), (END), 0)
glibc/sysdeps/unix/sysv/linux/arm/arch-syscall.h:17:#define
__NR_cacheflush 983042
glibc/sysdeps/unix/sysv/linux/arm/fixup-asm-unistd.h:19:#ifndef
__NR_cacheflush
glibc/sysdeps/unix/sysv/linux/arm/fixup-asm-unistd.h:20:# define
__NR_cacheflush __ARM_NR_cacheflush
glibc/sysdeps/unix/sysv/linux/microblaze/syscalls.list:3:cacheflush
EXTRA	cacheflush	i:iiii	__cacheflush	cacheflush
glibc/sysdeps/unix/sysv/linux/syscall-names.list:60:cacheflush
glibc/benchtests/strcoll-inputs/filelist#en_US.UTF-8:1417:cacheflush.c
glibc/benchtests/strcoll-inputs/filelist#en_US.UTF-8:1744:cacheflush.c
glibc/ChangeLog.old/ChangeLog.7:7489:	* sysdeps/mach/mips/cacheflush.c:
Likewise.
glibc/ChangeLog.old/ChangeLog.7:9422:	*
sysdeps/unix/sysv/linux/m68k/syscalls.list: Add cacheflush.
glibc/ChangeLog.old/ChangeLog.4:205:	* sysdeps/mach/mips/cacheflush.c:
New file.
glibc/ChangeLog.old/ChangeLog.18:40858:	*
sysdeps/unix/sysv/linux/nios2/cacheflush.c: New file.
glibc/ChangeLog.old/ChangeLog.ports-tile:700:	*
sysdeps/unix/sysv/linux/tile/cacheflush.c: New file.
grep: glibc/.git/index: binary file matches

$ grep -rn -e 'sys_cacheflush' -e 'SYSCALL_DEFINE.(cacheflush,' linux/ |
grep -v -e '/arc/' -e '/csky/' -e '/mips/' -e '/nios2/'
tools/testing/selftests/futex/functional/usr/include/linux/capability.h:251:/*
Allow flushing all cache on m68k (sys_cacheflush) */
include/uapi/linux/capability.h:253:/* Allow flushing all cache on m68k
(sys_cacheflush) */
arch/m68k/kernel/sys_m68k.c:376:/* sys_cacheflush -- flush (part of) the
processor cache.  */
arch/m68k/kernel/sys_m68k.c:378:sys_cacheflush (unsigned long addr, int
scope, int cache, unsigned long len)
arch/m68k/kernel/sys_m68k.c:531:/* sys_cacheflush -- flush (part of) the
processor cache.  */
arch/m68k/kernel/sys_m68k.c:533:sys_cacheflush (unsigned long addr, int
scope, int cache, unsigned long len)
arch/m68k/kernel/syscalls/syscall.tbl:133:123	common	cacheflush		
sys_cacheflush
arch/sh/kernel/sys_sh.c:57:/* sys_cacheflush -- flush (part of) the
processor cache.  */
arch/sh/kernel/sys_sh.c:58:asmlinkage int sys_cacheflush(unsigned long
addr, unsigned long len, int op)
arch/sh/kernel/syscalls/syscall.tbl:133:123	common	cacheflush		
sys_cacheflush
arch/arm/include/asm/cacheflush.h:263: * This is used for the ARM
private sys_cacheflush system call.
arch/nds32/include/uapi/asm/unistd.h:15:__SYSCALL(__NR_cacheflush,
sys_cacheflush)
arch/nds32/include/asm/syscalls.h:7:asmlinkage long
sys_cacheflush(unsigned long addr, unsigned long len, unsigned int op);
arch/nds32/kernel/sys_nds32.c:29:SYSCALL_DEFINE3(cacheflush, unsigned
int, start, unsigned int, end, int, cache)

Rendered page (NOTES only):

[
NOTES
   Architecture-specific variants
       Glibc  provides a wrapper for this system call, with the pro‐
       totype shown in SYNOPSIS, for  the  following  architectures:
       ARC, CSKY, MIPS, and NIOS2. // lowercase?

       On  some other architectures, Linux provides this system call
       with different arguments:

       M68K:

           int cacheflush(unsigned long addr, int scope, int cache,
                          unsigned long len);

       SH:

           int cacheflush(unsigned long addr, unsigned long len, int op);

       NDS32:

           int cacheflush(unsigned int start, unsigned int end, int cache);

       // ARM??

   GCC alternative
       Unless you need the finer grained control  that  this  system
       call  provides,  you  probably  want  to use the GCC built-in
       function __builtin___clear_cache(), which provides a portable
       interface  across  platforms  supported by GCC and compatible
       compilers:

           void __builtin___clear_cache(void *begin, void *end);

       On platforms that don't require  instruction  cache  flushes,
       __builtin___clear_cache() has no effect.

       Note:  On  some  GCC-compatible compilers, such as clang, the
       prototype for this function uses char * instead of void * for
       the parameters.

]

'GCC alternative' is the name I gave to the NOTES from the other thread,
which aren't yet merged (I'll send the patches after the weekend, probably).

Subsections based on:
fadvise64(2)

Can you review this?

Thanks,

Alex

-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es
