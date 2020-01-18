Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0C9141812
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2020 15:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgAROlT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Jan 2020 09:41:19 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:35120 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgAROlT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 18 Jan 2020 09:41:19 -0500
Received: by mail-yb1-f194.google.com with SMTP id q190so7574642ybq.2;
        Sat, 18 Jan 2020 06:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uZ9iq/bu+yq+FuI7V62nZkVFQemM11DhL70hTsJlYjw=;
        b=VPYjjiT+JkyyhtlQlh0wc7a7izSbvYLq8owaGT9iwzAr4cEPrFRcxo3xnaSaPvZoQN
         erJqNtqVepuxQX2HjKZopOo2xPEyNLC6HyOp46TWnic+qvyMdKP6CuMbKBCQvQ/aVsMO
         /z9MPjFgen4EXnPJS3+f1KzMaApC+KBsjLO8EQlEExsaXjfFZ08X5v/kqbTGGQsI3ee1
         m4mpvV24Y4L9B0GqwmziMJwOfQAHJlk73D1i9w+HIa7JNzz++HSoMV1dsK4TvQNzawvj
         OyIdvSFTJaKKITi9yi1u2l8lbOXLjE8dHUFIVh3jSxaDB08ZXn1US67uHdC3Gm90fQ69
         XI7g==
X-Gm-Message-State: APjAAAW67NM1WGMu9nyU0947UvCzDuznmjBWftKHxk3i+FK5Dmg58LPU
        O4LbgrXr6TDdnNfBh32pwYkLyYPInAyreUxlJOPvl5l2
X-Google-Smtp-Source: APXvYqxKgQUdNvtWlKdZzdvS2aewjVMJbQuA/mzykriUn5BS06w8fhsTDJhVBVNh4kw6BRZ8iEBexF5VMbLxiJYOP7M=
X-Received: by 2002:a25:5555:: with SMTP id j82mr35927628ybb.376.1579358478273;
 Sat, 18 Jan 2020 06:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20200114122343.163685-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20200114122343.163685-1-jiaxun.yang@flygoat.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Sat, 18 Jan 2020 15:41:07 +0100
Message-ID: <CAAdtpL4a8GJOKT5uqGpd=zPRCOZHcQBOW18frkww0L8e04nC8A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Introduce aligned IO memory operations
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Tue, Jan 14, 2020 at 1:24 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Some platforms, such as Loongson64 or QEMU/KVM, don't support unaligned
> instructions like lwl or lwr in IO memory access. However, our current
> IO memcpy/memset is wired to the generic implementation, which leads
> to a fatal result.

Do you have a handy reproducer to try with QEMU/KVM?

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig          |  4 ++
>  arch/mips/include/asm/io.h | 10 ++++
>  arch/mips/kernel/Makefile  |  2 +-
>  arch/mips/kernel/io.c      | 98 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/kernel/io.c
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 8b0cd692a43f..15a331aa23a2 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1450,6 +1450,7 @@ config CPU_LOONGSON64
>         select CPU_SUPPORTS_HIGHMEM
>         select CPU_SUPPORTS_HUGEPAGES
>         select CPU_SUPPORTS_MSA
> +       select CPU_NEEDS_ALIGNED_IO
>         select CPU_HAS_LOAD_STORE_LR
>         select CPU_DIEI_BROKEN if !LOONGSON3_ENHANCEMENT
>         select CPU_MIPSR2_IRQ_VI
> @@ -2598,6 +2599,9 @@ config CPU_HAS_LOAD_STORE_LR
>           LWL, LWR, SWL, SWR (Load/store word left/right).
>           LDL, LDR, SDL, SDR (Load/store doubleword left/right, for 64bit systems).
>
> +config CPU_NEEDS_ALIGNED_IO
> +       bool
> +
>  #
>  # Vectored interrupt mode is an R2 feature
>  #
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index 3f6ce74335b4..3b0eb4941f23 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -577,6 +577,15 @@ BUILDSTRING(l, u32)
>  BUILDSTRING(q, u64)
>  #endif
>
> +#if defined(CONFIG_CPU_NEEDS_ALIGNED_IO)
> +extern void __memcpy_fromio(void *, const volatile void __iomem *, size_t);
> +extern void __memcpy_toio(volatile void __iomem *, const void *, size_t);
> +extern void __memset_io(volatile void __iomem *, int, size_t);
> +
> +#define memset_io(c, v, l)     __memset_io((c), (v), (l))
> +#define memcpy_fromio(a, c, l) __memcpy_fromio((a), (c), (l))
> +#define memcpy_toio(c, a, l)   __memcpy_toio((c), (a), (l))
> +#else
>  static inline void memset_io(volatile void __iomem *addr, unsigned char val, int count)
>  {
>         memset((void __force *) addr, val, count);
> @@ -589,6 +598,7 @@ static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int
>  {
>         memcpy((void __force *) dst, src, count);
>  }
> +#endif
>
>  /*
>   * The caches on some architectures aren't dma-coherent and have need to
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index d6e97df51cfb..b07b97b9385e 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -8,7 +8,7 @@ extra-y         := head.o vmlinux.lds
>  obj-y          += cmpxchg.o cpu-probe.o branch.o elf.o entry.o genex.o idle.o irq.o \
>                    process.o prom.o ptrace.o reset.o setup.o signal.o \
>                    syscall.o time.o topology.o traps.o unaligned.o watch.o \
> -                  vdso.o cacheinfo.o
> +                  vdso.o cacheinfo.o io.o
>
>  ifdef CONFIG_FUNCTION_TRACER
>  CFLAGS_REMOVE_ftrace.o = -pg
> diff --git a/arch/mips/kernel/io.c b/arch/mips/kernel/io.c
> new file mode 100644
> index 000000000000..ca105aa76d4d
> --- /dev/null
> +++ b/arch/mips/kernel/io.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +#include <linux/io.h>
> +
> +#if defined(CONFIG_CPU_NEEDS_ALIGNED_IO)
> +
> +#if defined(CONFIG_64BIT)
> +#define IO_LONG_READ   __raw_readq
> +#define IO_LONG_WRITE  __raw_writeq
> +#define IO_LONG_SIZE   8
> +#else
> +#define IO_LONG_READ   __raw_readl
> +#define IO_LONG_WRITE  __raw_writel
> +#define IO_LONG_SIZE   4
> +#endif
> +
> +void __memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
> +{
> +       while (count && !IS_ALIGNED((unsigned long)from, IO_LONG_SIZE) &&
> +               !IS_ALIGNED((unsigned long)to, IO_LONG_SIZE)) {
> +               *(u8 *)to = __raw_readb(from);
> +               from++;
> +               to++;
> +               count--;
> +       }
> +
> +       while (count >= IO_LONG_SIZE) {
> +               *(unsigned long *)to = IO_LONG_READ(from);
> +               from += IO_LONG_SIZE;
> +               to += IO_LONG_SIZE;
> +               count -= IO_LONG_SIZE;
> +       }
> +
> +       while (count) {
> +               *(u8 *)to = __raw_readb(from);
> +               from++;
> +               to++;
> +               count--;
> +       }
> +}
> +EXPORT_SYMBOL(__memcpy_fromio);
> +
> +void __memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
> +{
> +       while (count && !IS_ALIGNED((unsigned long)from, IO_LONG_SIZE) &&
> +               !IS_ALIGNED((unsigned long)to, IO_LONG_SIZE)) {
> +               __raw_writeb(*(u8 *)from, to);
> +               from++;
> +               to++;
> +               count--;
> +       }
> +
> +       while (count >= IO_LONG_SIZE) {
> +               IO_LONG_WRITE(*(unsigned long *)from, to);
> +               from += IO_LONG_SIZE;
> +               to += IO_LONG_SIZE;
> +               count -= IO_LONG_SIZE;
> +       }
> +
> +       while (count) {
> +               __raw_writeb(*(u8 *)from, to);
> +               from++;
> +               to++;
> +               count--;
> +       }
> +}
> +EXPORT_SYMBOL(__memcpy_toio);
> +
> +void __memset_io(volatile void __iomem *dst, int c, size_t count)
> +{
> +       unsigned long lc = (u8)c;
> +       int i;
> +
> +       for (i = 1; i < IO_LONG_SIZE; i++)
> +               lc |= (u8)c << (i * BITS_PER_BYTE);
> +
> +       while (count && !IS_ALIGNED((unsigned long)dst, IO_LONG_SIZE)) {
> +               __raw_writeb((u8)c, dst);
> +               dst++;
> +               count--;
> +       }
> +
> +       while (count >= IO_LONG_SIZE) {
> +               IO_LONG_WRITE(lc, dst);
> +               dst += IO_LONG_SIZE;
> +               count -= IO_LONG_SIZE;
> +       }
> +
> +       while (count) {
> +               __raw_writeb(c, dst);
> +               dst++;
> +               count--;
> +       }
> +}
> +EXPORT_SYMBOL(__memset_io);
> +#endif
> --
> 2.24.1
>
