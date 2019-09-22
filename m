Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B4ABA036
	for <lists+linux-mips@lfdr.de>; Sun, 22 Sep 2019 04:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfIVCQk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Sep 2019 22:16:40 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38700 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbfIVCQk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Sep 2019 22:16:40 -0400
Received: by mail-io1-f67.google.com with SMTP id u8so3684441iom.5
        for <linux-mips@vger.kernel.org>; Sat, 21 Sep 2019 19:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kn6fTJ+EBool/zp8vvAcG4bDOsS7Q3JrCWlM0fUArhY=;
        b=Jz4dEUFd2lZ1n4Sr89OnMqry1i/ZUdipWS/WCKEXCIWUreFfztsGrMHhP8dhmpAcq5
         84iA2uFFGX+qSid54RC8l8T9Fh4eiGfBQjjQDOrm692RP6eFp3+OkwRFIpen168m/Yio
         bsBH0gkXJ3hjtTcYXjcqEQmigL1ERLmXUsTpyzV/7j3S6GlwkAsZipeRxG3LhULUBcaK
         yQgyn2+tXwU9HSxcpA9J8Rx3foo/TJv+UM4nqUuAyldcTHR9w4oIc2ULWRXPVlNvUikz
         TeYyomFKwvkCiNIqHJMEqZ87DHHRu5WXtGW8zki1HJVtpQjOjmMT896zdOJ3kstM2VqP
         470A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kn6fTJ+EBool/zp8vvAcG4bDOsS7Q3JrCWlM0fUArhY=;
        b=qQfS/SucRrrrjdtHMf7KbHuonAhNC5zLDEBOXm52TMCTTua9xWs+ucxkMMnqeMtiUA
         Q2J+S5GRl7oXFbivRxeGwMA8R1nr0ipbx6XhKUyb3RDE5jvUgzlz0XCFbt+muKdC7C2Q
         Im8n87PpJmlu4ba4wt4Duzh6P9CC2zKCR1whkFx0xbaVEpGyUQEr4To6NKGeHh3BGuTZ
         /AeTtDhYAurk+ih5QNlTeacGN2CBoj1GS6l2MDsjPyHMHCEX9Itgo/qSjplDCprgc2h0
         bjX5OJ9NpgLFew8bJT+KCrWed3ybceSxAgu6kebvcaD6LETB+GCNjSHK1xv92IUO3z9/
         Hk9A==
X-Gm-Message-State: APjAAAXzwf0LczjZ3aAMshJggupGmVnwSqU6cfjzPs8H5XGTU+Bnvnlw
        K4bNR+FUIFdsp+7NeTHn8fOvQ9lWk3QBJtioQL0=
X-Google-Smtp-Source: APXvYqxc7RD+HvfnSd/PdIRHgdZOrPon3dOfmb1LgXVDi98G5Xr5ZVVA1oKn2/+4FUj0LmAd7RtdKhIIi8HUc+JeEAM=
X-Received: by 2002:a02:55c4:: with SMTP id e187mr29473421jab.32.1569118599139;
 Sat, 21 Sep 2019 19:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <1568000558-11823-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1568000558-11823-1-git-send-email-chenhc@lemote.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Sun, 22 Sep 2019 10:21:29 +0800
Message-ID: <CAAhV-H7u3s8mYxR7+4=mXGB=5gJ5zwtfyTkYphm96r+H6bd45A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson: remove unnecessary loongson_llsc_mb()
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huang Pei <huangpei@loongson.cn>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ping?

On Mon, Sep 9, 2019 at 11:41 AM Huacai Chen <chenhc@lemote.com> wrote:
>
> Commit 1c6c1ca318585f1 ("mips/atomic: Fix loongson_llsc_mb() wreckage")
> fix the description of Loongson-3's llsc bug and try to add all missing
> loongson_llsc_mb(). This is a good job but there are some unnecessary
> memory barries:
>
> loongson_llsc_mb() is a Loongson-specific problem. smp_llsc_mb(),
> smp_mb__before_llsc(), loongson_llsc_mb() and and other memory barriers
> are essentially the same thing on Loongson-3. So we don't need to add
> loongson_llsc_mb() if there is already a smp_mb__before_llsc() or other
> types of memory barriers.
>
> So, most of loongson_llsc_mb() in Peter's patch is superfluous and can
> be removed, except the one in test_and_set_bit_lock().
>
> mips_atomic_set() is not used on Loongson-3, and if in some cases we use
> it, the user-to-kernel context switching probably has the same effect of
> a memory barrier. But anyway, add a memory barrier in mips_atomic_set()
> is harmless, so I keep this one.
>
> For cmpxchg.h, the 32-bit version of cmpxchg64() doesn't need to be care
> about because Loongson64 can support 64-bit kernel only, cmpxchg() need
> memory barriers and it already has, cmpxchg_local() doesn't need memory
> barriers because only the local cpu can write, which is the same as all
> other local_t ops. So I remove all loongson_llsc_mb() in cmpxchg.h from
> Peter's patch.
>
> To summarize:
> I keep Peter's comments and also keep necessary loongson_llsc_mb() in
> test_and_set_bit_lock()/mips_atomic_set() from Peter's patch, but all
> superfluous memory barries are removed.
>
> Cc: Huang Pei <huangpei@loongson.cn>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/atomic.h  | 5 ++---
>  arch/mips/include/asm/bitops.h  | 4 ----
>  arch/mips/include/asm/cmpxchg.h | 5 -----
>  3 files changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
> index bb8658cc..4f6e538 100644
> --- a/arch/mips/include/asm/atomic.h
> +++ b/arch/mips/include/asm/atomic.h
> @@ -193,7 +193,6 @@ static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
>         if (kernel_uses_llsc) {
>                 int temp;
>
> -               loongson_llsc_mb();
>                 __asm__ __volatile__(
>                 "       .set    push                                    \n"
>                 "       .set    "MIPS_ISA_LEVEL"                        \n"
> @@ -201,12 +200,12 @@ static __inline__ int atomic_sub_if_positive(int i, atomic_t * v)
>                 "       .set    pop                                     \n"
>                 "       subu    %0, %1, %3                              \n"
>                 "       move    %1, %0                                  \n"
> -               "       bltz    %0, 2f                                  \n"
> +               "       bltz    %0, 1f                                  \n"
>                 "       .set    push                                    \n"
>                 "       .set    "MIPS_ISA_LEVEL"                        \n"
>                 "       sc      %1, %2                                  \n"
>                 "\t" __scbeqz " %1, 1b                                  \n"
> -               "2:                                                     \n"
> +               "1:                                                     \n"
>                 "       .set    pop                                     \n"
>                 : "=&r" (result), "=&r" (temp),
>                   "+" GCC_OFF_SMALL_ASM() (v->counter)
> diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
> index 985d6a0..5016b96 100644
> --- a/arch/mips/include/asm/bitops.h
> +++ b/arch/mips/include/asm/bitops.h
> @@ -257,7 +257,6 @@ static inline int test_and_set_bit(unsigned long nr,
>                 unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
>                 unsigned long temp;
>
> -               loongson_llsc_mb();
>                 do {
>                         __asm__ __volatile__(
>                         "       .set    push                            \n"
> @@ -374,7 +373,6 @@ static inline int test_and_clear_bit(unsigned long nr,
>                 unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
>                 unsigned long temp;
>
> -               loongson_llsc_mb();
>                 do {
>                         __asm__ __volatile__(
>                         "       " __LL  "%0, %1 # test_and_clear_bit    \n"
> @@ -390,7 +388,6 @@ static inline int test_and_clear_bit(unsigned long nr,
>                 unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
>                 unsigned long temp;
>
> -               loongson_llsc_mb();
>                 do {
>                         __asm__ __volatile__(
>                         "       .set    push                            \n"
> @@ -450,7 +447,6 @@ static inline int test_and_change_bit(unsigned long nr,
>                 unsigned long *m = ((unsigned long *) addr) + (nr >> SZLONG_LOG);
>                 unsigned long temp;
>
> -               loongson_llsc_mb();
>                 do {
>                         __asm__ __volatile__(
>                         "       .set    push                            \n"
> diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
> index 79bf34e..dd39bae 100644
> --- a/arch/mips/include/asm/cmpxchg.h
> +++ b/arch/mips/include/asm/cmpxchg.h
> @@ -46,7 +46,6 @@ extern unsigned long __xchg_called_with_bad_pointer(void)
>         __typeof(*(m)) __ret;                                           \
>                                                                         \
>         if (kernel_uses_llsc) {                                         \
> -               loongson_llsc_mb();                                     \
>                 __asm__ __volatile__(                                   \
>                 "       .set    push                            \n"     \
>                 "       .set    noat                            \n"     \
> @@ -118,7 +117,6 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
>         __typeof(*(m)) __ret;                                           \
>                                                                         \
>         if (kernel_uses_llsc) {                                         \
> -               loongson_llsc_mb();                                     \
>                 __asm__ __volatile__(                                   \
>                 "       .set    push                            \n"     \
>                 "       .set    noat                            \n"     \
> @@ -136,7 +134,6 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
>                 : "=&r" (__ret), "=" GCC_OFF_SMALL_ASM() (*m)           \
>                 : GCC_OFF_SMALL_ASM() (*m), "Jr" (old), "Jr" (new)      \
>                 : __LLSC_CLOBBER);                                      \
> -               loongson_llsc_mb();                                     \
>         } else {                                                        \
>                 unsigned long __flags;                                  \
>                                                                         \
> @@ -232,7 +229,6 @@ static inline unsigned long __cmpxchg64(volatile void *ptr,
>          */
>         local_irq_save(flags);
>
> -       loongson_llsc_mb();
>         asm volatile(
>         "       .set    push                            \n"
>         "       .set    " MIPS_ISA_ARCH_LEVEL "         \n"
> @@ -278,7 +274,6 @@ static inline unsigned long __cmpxchg64(volatile void *ptr,
>           "r" (old),
>           "r" (new)
>         : "memory");
> -       loongson_llsc_mb();
>
>         local_irq_restore(flags);
>         return ret;
> --
> 2.7.0
>
