Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B32485146
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jan 2022 11:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239466AbiAEKmf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jan 2022 05:42:35 -0500
Received: from elvis.franken.de ([193.175.24.41]:58472 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239464AbiAEKmb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 Jan 2022 05:42:31 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1n53kT-0007Hx-02; Wed, 05 Jan 2022 11:42:29 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5B1B6C0E31; Wed,  5 Jan 2022 11:39:44 +0100 (CET)
Date:   Wed, 5 Jan 2022 11:39:44 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH 4/4] MIPS: retire "asm/llsc.h"
Message-ID: <20220105103944.GC7009@alpha.franken.de>
References: <20211215084500.24444-1-huangpei@loongson.cn>
 <20211215084500.24444-5-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215084500.24444-5-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 15, 2021 at 04:45:00PM +0800, Huang Pei wrote:
> all that "asm/llsc.h" does is just to help inline asm, which can be
> stringifyed from "asm/asm.h"
> 
> +. Since "asm/asm.h" has all we need, retire "asm/llsc.h"
> 
> +. remove unused header file
> 
> Inspired-by:   Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/include/asm/asm.h      |  4 +++
>  arch/mips/include/asm/atomic.h   | 10 +++-----
>  arch/mips/include/asm/bitops.h   | 24 ++++++++----------
>  arch/mips/include/asm/cmpxchg.h  |  8 +++---
>  arch/mips/include/asm/kvm_host.h | 12 ++++-----
>  arch/mips/include/asm/llsc.h     | 43 --------------------------------
>  6 files changed, 28 insertions(+), 73 deletions(-)
>  delete mode 100644 arch/mips/include/asm/llsc.h
> 
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index f3302b13d3e0..ed74a6032ec8 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -182,6 +182,8 @@ symbol		=	value
>  #define INT_SRLV	srlv
>  #define INT_SRA		sra
>  #define INT_SRAV	srav
> +#define LONG_INS	ins
> +#define LONG_EXT	ext
>  #endif
>  
>  #if (_MIPS_SZINT == 64)
> @@ -199,6 +201,8 @@ symbol		=	value
>  #define INT_SRLV	dsrlv
>  #define INT_SRA		dsra
>  #define INT_SRAV	dsrav
> +#define LONG_INS	dins
> +#define LONG_EXT	dext
>  #endif

this is the wrong place for the defines. I wonder how you compiled it
as it blew up a loongson64 build.

> diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
> index a0b9e7c1e4fc..77ba1e36701f 100644
> --- a/arch/mips/include/asm/atomic.h
> +++ b/arch/mips/include/asm/atomic.h
> @@ -20,9 +20,7 @@
>  #include <asm/compiler.h>
>  #include <asm/cpu-features.h>
>  #include <asm/cmpxchg.h>
> -#include <asm/llsc.h>
>  #include <asm/sync.h>
> -#include <asm/war.h>

I've added an #include <asm/asm.h> as this file is now using defines
out of it.

> diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
> index 66a8b293fd80..b47a5e49f519 100644
> --- a/arch/mips/include/asm/cmpxchg.h
> +++ b/arch/mips/include/asm/cmpxchg.h
> @@ -11,9 +11,7 @@
>  #include <linux/bug.h>
>  #include <linux/irqflags.h>
>  #include <asm/compiler.h>
> -#include <asm/llsc.h>
>  #include <asm/sync.h>
> -#include <asm/war.h>

same here. This also caused compile errors...

applied to mips-next with the compile fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
