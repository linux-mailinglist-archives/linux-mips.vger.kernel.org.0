Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154822F682D
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 18:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbhANRtY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 12:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhANRtX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jan 2021 12:49:23 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA335C061574
        for <linux-mips@vger.kernel.org>; Thu, 14 Jan 2021 09:48:42 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id z21so4275673pgj.4
        for <linux-mips@vger.kernel.org>; Thu, 14 Jan 2021 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1o9uWR5TsphyYxa9rKGSc/bmltnz4js3z2K7w6fMWLk=;
        b=bQbHRL+Am1n08gsjfV07vt9wArK+maBZn6xrX/G81BgvtvbNAXnz1JzYlxESGbMf0x
         PTiiXr0F/0K0mq1B6eGWhXr27VZ42XxknFd3n/Yqr3pdn997CElDuCCHfj3Q5kOJiJj9
         /kBdDMOKAFKMf+2bJqRj63REooxnD2ey+QBc0kR96BuKcxzJRHQ1Byj9bJ9NuqbnnEqc
         I8OD8PD4NC4qywyYX6SdPFAo+WgAdd+GhnSrgYB4/fKS3pJaSuU0BOvsUZ0tvgy46m2r
         uQZzV+6fbQ8jF3lq60j5twRoBSSMMIgx/6P1efTitmjjB9CkSee5Px4M6YhRVeb9kaWN
         Y8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1o9uWR5TsphyYxa9rKGSc/bmltnz4js3z2K7w6fMWLk=;
        b=mTVc1VySbgg6MonzNrWr8HICmu+tVLMj5Lp779UDRSqz4uCU9PRSAAdufEPqBQPUo7
         vXikg4ZK3RmxUwPSQR3kmfCCxUItdhAB1bMmH1hHh7xYHEnnX87XIJ42wIU8fOZzdah2
         ez/H5nmqa/O6eYXd/njxdO8+W9f1iEl4srh8R9rvBISfqd8lsFNaEuAqX79wa95lHISw
         kVdSPmW5zswDqDVLVV8fRuMDP8VDLqsjb4aA0cmIzX8vN2s8UpSD+vCCgGv3m0falrJY
         imPR878TBBjoxR9hwqzF5pWDaEvrm4dBBDZYd/FYPtPetBQFmRCXBQqbnYl63hTMQecp
         52mg==
X-Gm-Message-State: AOAM530MwNvOA6hlnWVgFXe+NgRyVoat8aTyOnur3p+HToXl0Nd9SMxc
        DNnZkOWrM98Aojh37WKAfg9IYbWS10GKgXUlVCMR1w==
X-Google-Smtp-Source: ABdhPJwOEtg9pv6KP9LOFZJYxGb8ZxP97402s4gYYlAaW2uBV8Xz63PfE19Vmi4w20aZydshBfD6yrVGl/0Ay1B7CvM=
X-Received: by 2002:a63:1f47:: with SMTP id q7mr8646560pgm.10.1610646522288;
 Thu, 14 Jan 2021 09:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20210114173416.738455-1-natechancellor@gmail.com>
In-Reply-To: <20210114173416.738455-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 14 Jan 2021 09:48:31 -0800
Message-ID: <CAKwvOdmiWhtr6qkKDFnVXqLZhyFU4bfhjTyQ6BKiLYup+qasMQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Compare __SYNC_loongson3_war against 0
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 14, 2021 at 9:34 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When building with clang when CONFIG_CPU_LOONGSON3_WORKAROUNDS is
> enabled:
>
>  In file included from lib/errseq.c:4:
>  In file included from ./include/linux/atomic.h:7:
>  ./arch/mips/include/asm/atomic.h:52:1: warning: converting the result of
>  '<<' to a boolean always evaluates to true
>  [-Wtautological-constant-compare]
>  ATOMIC_OPS(atomic64, s64)
>  ^
>  ./arch/mips/include/asm/atomic.h:40:9: note: expanded from macro
>  'ATOMIC_OPS'
>          return cmpxchg(&v->counter, o, n);
>                 ^
>  ./arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro
>  'cmpxchg'
>          if (!__SYNC_loongson3_war)
>               ^
>  ./arch/mips/include/asm/sync.h:147:34: note: expanded from macro
>  '__SYNC_loongson3_war'
>  # define __SYNC_loongson3_war   (1 << 31)
>                                     ^
>
> While it is not wrong that the result of this shift is always true in a
> boolean context, it is not a problem here. Regardless, the warning is
> really noisy so rather than making the shift a boolean implicitly, use
> it in an equality comparison so the shift is used as an integer value.
>
> Fixes: 4d1dbfe6cbec ("MIPS: atomic: Emit Loongson3 sync workarounds within asm")
> Fixes: a91f2a1dba44 ("MIPS: cmpxchg: Omit redundant barriers for Loongson3")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/mips/include/asm/atomic.h  | 2 +-
>  arch/mips/include/asm/cmpxchg.h | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
> index f904084fcb1f..27ad76791539 100644
> --- a/arch/mips/include/asm/atomic.h
> +++ b/arch/mips/include/asm/atomic.h
> @@ -248,7 +248,7 @@ static __inline__ int pfx##_sub_if_positive(type i, pfx##_t * v)    \
>          * bltz that can branch to code outside of the LL/SC loop. As   \
>          * such, we don't need to emit another barrier here.            \
>          */                                                             \
> -       if (!__SYNC_loongson3_war)                                      \
> +       if (__SYNC_loongson3_war == 0)                                  \
>                 smp_mb__after_atomic();                                 \
>                                                                         \
>         return result;                                                  \
> diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
> index 5b0b3a6777ea..ed8f3f3c4304 100644
> --- a/arch/mips/include/asm/cmpxchg.h
> +++ b/arch/mips/include/asm/cmpxchg.h
> @@ -99,7 +99,7 @@ unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
>          * contains a completion barrier prior to the LL, so we don't   \
>          * need to emit an extra one here.                              \
>          */                                                             \
> -       if (!__SYNC_loongson3_war)                                      \
> +       if (__SYNC_loongson3_war == 0)                                  \
>                 smp_mb__before_llsc();                                  \
>                                                                         \
>         __res = (__typeof__(*(ptr)))                                    \
> @@ -191,7 +191,7 @@ unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
>          * contains a completion barrier prior to the LL, so we don't   \
>          * need to emit an extra one here.                              \
>          */                                                             \
> -       if (!__SYNC_loongson3_war)                                      \
> +       if (__SYNC_loongson3_war == 0)                                  \
>                 smp_mb__before_llsc();                                  \
>                                                                         \
>         __res = cmpxchg_local((ptr), (old), (new));                     \
> @@ -201,7 +201,7 @@ unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
>          * contains a completion barrier after the SC, so we don't      \
>          * need to emit an extra one here.                              \
>          */                                                             \
> -       if (!__SYNC_loongson3_war)                                      \
> +       if (__SYNC_loongson3_war == 0)                                  \
>                 smp_llsc_mb();                                          \
>                                                                         \
>         __res;                                                          \
>
> base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837

^ is this "base-commit" something you manually added, or can git
format generate that?

-- 
Thanks,
~Nick Desaulniers
