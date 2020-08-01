Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8D52351FA
	for <lists+linux-mips@lfdr.de>; Sat,  1 Aug 2020 14:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbgHAMFP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Aug 2020 08:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728505AbgHAMFP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 1 Aug 2020 08:05:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CEC1F20716;
        Sat,  1 Aug 2020 12:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596283514;
        bh=1BrXyqpNBXN0t5LTJZRcxmLAcMJojIbD0JvYdRM4VFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JftyJtXy1xaxZ60BrOrxoCfAsbYPrO/mQz+EH6tI1wYgd+R0yDo41TBWbNx0MGz5b
         DneKLWOLL50FTYeawjCcoZOBwDZuYzMZ3LvzvEhss782zUv7FvH1h3BTbwTHkFaNDi
         3oCdbuVG0wuQMUYllmq7Qs49Fjs7bl9Wqpql96/U=
Date:   Sat, 1 Aug 2020 14:04:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     stable@vger.kernel.org, linux-mips@vger.kernel.org,
        chenhc@lemote.com
Subject: Re: [PATCH stable] MIPS: Loongson: Introduce and use
 loongson_llsc_mb()
Message-ID: <20200801120459.GA506427@kroah.com>
References: <20200801063443.1438289-1-jiaxun.yang@flygoat.com>
 <20200801102646.GA3046974@kroah.com>
 <5E555C31-EA38-456E-BB5D-263A54647873@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5E555C31-EA38-456E-BB5D-263A54647873@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 01, 2020 at 07:48:48PM +0800, Jiaxun Yang wrote:
> 
> 
> 于 2020年8月1日 GMT+08:00 下午6:26:46, Greg KH <gregkh@linuxfoundation.org> 写到:
> >On Sat, Aug 01, 2020 at 02:34:43PM +0800, Jiaxun Yang wrote:
> >> From: Huacai Chen <chenhc@lemote.com>
> >> 
> >> commit e02e07e3127d8aec1f4bcdfb2fc52a2d99b4859e upstream.
> >> 
> >> On the Loongson-2G/2H/3A/3B there is a hardware flaw that ll/sc and
> >> lld/scd is very weak ordering. We should add sync instructions "before
> >> each ll/lld" and "at the branch-target between ll/sc" to workaround.
> >> Otherwise, this flaw will cause deadlock occasionally (e.g. when doing
> >> heavy load test with LTP).
> >> 
> >> Below is the explaination of CPU designer:
> >> 
> >> "For Loongson 3 family, when a memory access instruction (load, store,
> >> or prefetch)'s executing occurs between the execution of LL and SC, the
> >> success or failure of SC is not predictable. Although programmer would
> >> not insert memory access instructions between LL and SC, the memory
> >> instructions before LL in program-order, may dynamically executed
> >> between the execution of LL/SC, so a memory fence (SYNC) is needed
> >> before LL/LLD to avoid this situation.
> >> 
> >> Since Loongson-3A R2 (3A2000), we have improved our hardware design to
> >> handle this case. But we later deduce a rarely circumstance that some
> >> speculatively executed memory instructions due to branch misprediction
> >> between LL/SC still fall into the above case, so a memory fence (SYNC)
> >> at branch-target (if its target is not between LL/SC) is needed for
> >> Loongson 3A1000, 3B1500, 3A2000 and 3A3000.
> >> 
> >> Our processor is continually evolving and we aim to to remove all these
> >> workaround-SYNCs around LL/SC for new-come processor."
> >> 
> >> Here is an example:
> >> 
> >> Both cpu1 and cpu2 simutaneously run atomic_add by 1 on same atomic var,
> >> this bug cause both 'sc' run by two cpus (in atomic_add) succeed at same
> >> time('sc' return 1), and the variable is only *added by 1*, sometimes,
> >> which is wrong and unacceptable(it should be added by 2).
> >> 
> >> Why disable fix-loongson3-llsc in compiler?
> >> Because compiler fix will cause problems in kernel's __ex_table section.
> >> 
> >> This patch fix all the cases in kernel, but:
> >> 
> >> +. the fix at the end of futex_atomic_cmpxchg_inatomic is for branch-target
> >> of 'bne', there other cases which smp_mb__before_llsc() and smp_llsc_mb() fix
> >> the ll and branch-target coincidently such as atomic_sub_if_positive/
> >> cmpxchg/xchg, just like this one.
> >> 
> >> +. Loongson 3 does support CONFIG_EDAC_ATOMIC_SCRUB, so no need to touch
> >> edac.h
> >> 
> >> +. local_ops and cmpxchg_local should not be affected by this bug since
> >> only the owner can write.
> >> 
> >> +. mips_atomic_set for syscall.c is deprecated and rarely used, just let
> >> it go
> >> 
> >> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> >> [paul.burton@mips.com:
> >>   - Simplify the addition of -mno-fix-loongson3-llsc to cflags, and add
> >>     a comment describing why it's there.
> >>   - Make loongson_llsc_mb() a no-op when
> >>     CONFIG_CPU_LOONGSON3_WORKAROUNDS=n, rather than a compiler memory
> >>     barrier.
> >>   - Add a comment describing the bug & how loongson_llsc_mb() helps
> >>     in asm/barrier.h.]
> >> Signed-off-by: Paul Burton <paul.burton@mips.com>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> Cc: Ralf Baechle <ralf@linux-mips.org>
> >> Cc: ambrosehua@gmail.com
> >> Cc: Steven J . Hill <Steven.Hill@cavium.com>
> >> Cc: linux-mips@linux-mips.org
> >> Cc: Fuxin Zhang <zhangfx@lemote.com>
> >> Cc: Zhangjin Wu <wuzhangjin@gmail.com>
> >> Cc: Li Xuefeng <lixuefeng@loongson.cn>
> >> Cc: Xu Chenghua <xuchenghua@loongson.cn>
> >> Cc: stable@vger.kernel.org # 4.19
> >> 
> >> ---
> >> Backport to stable according to request from Debian downstream.
> >
> >What do you mean by "request"?
> 
> Debian guys asked us to backport this to ensure the system stability on "buster" release if possible.

Who is "Debian guys"?  And why can't they just add this to their kernel?

> >This feels like a new feature, why can't people just use the 5.4 kernel
> >or newer?  Given that this issue has been fixed upstream for 1 1/2
> >years, why does it need to go to the 4.19.y stable kernel now?
> 
> It is a workaround of certain hardware bug...
> Just because we've been asked by downstren why 4.19 can't run flawlessly on certain systems...

What is wrong with those affected users running 5.0 or newer kernels?

So is this a bugfix or a new feature, I can't determine this...

It feels "big" for a 4.19.y kernel patch at this point in time, don't
you think?

thanks,

greg k-h
