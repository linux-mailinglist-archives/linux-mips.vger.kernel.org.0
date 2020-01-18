Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9B414183E
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2020 16:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgARPNn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Jan 2020 10:13:43 -0500
Received: from forward500j.mail.yandex.net ([5.45.198.250]:44754 "EHLO
        forward500j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726579AbgARPNn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 18 Jan 2020 10:13:43 -0500
Received: from mxback15g.mail.yandex.net (mxback15g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:94])
        by forward500j.mail.yandex.net (Yandex) with ESMTP id 7EC8B11C20D6;
        Sat, 18 Jan 2020 18:13:39 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback15g.mail.yandex.net (mxback/Yandex) with ESMTP id m90U1rFpu7-Dc0GCiUb;
        Sat, 18 Jan 2020 18:13:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1579360418;
        bh=ZoXC1DLL7WylrhdCfNxl3JfKrRId2po347YFBtlU9GM=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=o6cGJB2aQzULdf9J+rMTHXDWGft4ekM+YqWY3TzTUyagrSnHPI/GTGlY4uRe+267c
         QGDjviFuPJefPF4NHe382gqaomFjGPHyjpPdPy250+reyvg0GoEtChzaLiYbAl17jP
         Bo/UxgDYDDxyFw1xloxF1RAivokT1ZlD3vxYEZV8=
Authentication-Results: mxback15g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas1-ac0cb6954dcf.qloud-c.yandex.net with HTTP;
        Sat, 18 Jan 2020 18:13:38 +0300
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Envelope-From: yjx@flygoat.com
To:     =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        open list <linux-kernel@vger.kernel.org>
In-Reply-To: <CAAdtpL4a8GJOKT5uqGpd=zPRCOZHcQBOW18frkww0L8e04nC8A@mail.gmail.com>
References: <20200114122343.163685-1-jiaxun.yang@flygoat.com> <CAAdtpL4a8GJOKT5uqGpd=zPRCOZHcQBOW18frkww0L8e04nC8A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Introduce aligned IO memory operations
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Sat, 18 Jan 2020 23:13:38 +0800
Message-Id: <7302971579360418@sas1-ac0cb6954dcf.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



18.01.2020, 22:41, "Philippe Mathieu-Daudé" <f4bug@amsat.org>:
> Hi Jiaxun,
>
> On Tue, Jan 14, 2020 at 1:24 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>  Some platforms, such as Loongson64 or QEMU/KVM, don't support unaligned
>>  instructions like lwl or lwr in IO memory access. However, our current
>>  IO memcpy/memset is wired to the generic implementation, which leads
>>  to a fatal result.
>
> Do you have a handy reproducer to try with QEMU/KVM?

It was triggered by QXL DRM driver when I was working on KVM for Loongson
with Huacai.

See arch/mips/kvm/emulate.c, we didn't have unaligned instructions trap
emulation for MMIO. You can construct a simple unaligned memcpy_fromio
case to reproduce it.

Thanks.

>
>>  Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>  ---
>>   arch/mips/Kconfig | 4 ++
>>   arch/mips/include/asm/io.h | 10 ++++
>>   arch/mips/kernel/Makefile | 2 +-
>>   arch/mips/kernel/io.c | 98 ++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 113 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/mips/kernel/io.c
>>
>>  diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>  index 8b0cd692a43f..15a331aa23a2 100644
>>  --- a/arch/mips/Kconfig
>>  +++ b/arch/mips/Kconfig
>>  @@ -1450,6 +1450,7 @@ config CPU_LOONGSON64
>>          select CPU_SUPPORTS_HIGHMEM
>>          select CPU_SUPPORTS_HUGEPAGES
>>          select CPU_SUPPORTS_MSA
>>  + select CPU_NEEDS_ALIGNED_IO
>>          select CPU_HAS_LOAD_STORE_LR
>>          select CPU_DIEI_BROKEN if !LOONGSON3_ENHANCEMENT
>>          select CPU_MIPSR2_IRQ_VI
>>  @@ -2598,6 +2599,9 @@ config CPU_HAS_LOAD_STORE_LR
>>            LWL, LWR, SWL, SWR (Load/store word left/right).
>>            LDL, LDR, SDL, SDR (Load/store doubleword left/right, for 64bit systems).
>>
>>  +config CPU_NEEDS_ALIGNED_IO
>>  + bool
>>  +
>>   #
>>   # Vectored interrupt mode is an R2 feature
>>   #
>>  diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
>>  index 3f6ce74335b4..3b0eb4941f23 100644
>>  --- a/arch/mips/include/asm/io.h
>>  +++ b/arch/mips/include/asm/io.h
>>  @@ -577,6 +577,15 @@ BUILDSTRING(l, u32)
>>   BUILDSTRING(q, u64)
>>   #endif
>>
>>  +#if defined(CONFIG_CPU_NEEDS_ALIGNED_IO)
>>  +extern void __memcpy_fromio(void *, const volatile void __iomem *, size_t);
>>  +extern void __memcpy_toio(volatile void __iomem *, const void *, size_t);
>>  +extern void __memset_io(volatile void __iomem *, int, size_t);
>>  +
>>  +#define memset_io(c, v, l) __memset_io((c), (v), (l))
>>  +#define memcpy_fromio(a, c, l) __memcpy_fromio((a), (c), (l))
>>  +#define memcpy_toio(c, a, l) __memcpy_toio((c), (a), (l))
>>  +#else
>>   static inline void memset_io(volatile void __iomem *addr, unsigned char val, int count)
>>   {
>>          memset((void __force *) addr, val, count);
>>  @@ -589,6 +598,7 @@ static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int
>>   {
>>          memcpy((void __force *) dst, src, count);
>>   }
>>  +#endif
>>
>>   /*
>>    * The caches on some architectures aren't dma-coherent and have need to
>>  diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
>>  index d6e97df51cfb..b07b97b9385e 100644
>>  --- a/arch/mips/kernel/Makefile
>>  +++ b/arch/mips/kernel/Makefile
>>  @@ -8,7 +8,7 @@ extra-y := head.o vmlinux.lds
>>   obj-y += cmpxchg.o cpu-probe.o branch.o elf.o entry.o genex.o idle.o irq.o \
>>                     process.o prom.o ptrace.o reset.o setup.o signal.o \
>>                     syscall.o time.o topology.o traps.o unaligned.o watch.o \
>>  - vdso.o cacheinfo.o
>>  + vdso.o cacheinfo.o io.o
>>
>>   ifdef CONFIG_FUNCTION_TRACER
>>   CFLAGS_REMOVE_ftrace.o = -pg
>>  diff --git a/arch/mips/kernel/io.c b/arch/mips/kernel/io.c
>>  new file mode 100644
>>  index 000000000000..ca105aa76d4d
>>  --- /dev/null
>>  +++ b/arch/mips/kernel/io.c
>>  @@ -0,0 +1,98 @@
>>  +// SPDX-License-Identifier: GPL-2.0-or-later
>>  +
>>  +#include <linux/export.h>
>>  +#include <linux/types.h>
>>  +#include <linux/io.h>
>>  +
>>  +#if defined(CONFIG_CPU_NEEDS_ALIGNED_IO)
>>  +
>>  +#if defined(CONFIG_64BIT)
>>  +#define IO_LONG_READ __raw_readq
>>  +#define IO_LONG_WRITE __raw_writeq
>>  +#define IO_LONG_SIZE 8
>>  +#else
>>  +#define IO_LONG_READ __raw_readl
>>  +#define IO_LONG_WRITE __raw_writel
>>  +#define IO_LONG_SIZE 4
>>  +#endif
>>  +
>>  +void __memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
>>  +{
>>  + while (count && !IS_ALIGNED((unsigned long)from, IO_LONG_SIZE) &&
>>  + !IS_ALIGNED((unsigned long)to, IO_LONG_SIZE)) {
>>  + *(u8 *)to = __raw_readb(from);
>>  + from++;
>>  + to++;
>>  + count--;
>>  + }
>>  +
>>  + while (count >= IO_LONG_SIZE) {
>>  + *(unsigned long *)to = IO_LONG_READ(from);
>>  + from += IO_LONG_SIZE;
>>  + to += IO_LONG_SIZE;
>>  + count -= IO_LONG_SIZE;
>>  + }
>>  +
>>  + while (count) {
>>  + *(u8 *)to = __raw_readb(from);
>>  + from++;
>>  + to++;
>>  + count--;
>>  + }
>>  +}
>>  +EXPORT_SYMBOL(__memcpy_fromio);
>>  +
>>  +void __memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
>>  +{
>>  + while (count && !IS_ALIGNED((unsigned long)from, IO_LONG_SIZE) &&
>>  + !IS_ALIGNED((unsigned long)to, IO_LONG_SIZE)) {
>>  + __raw_writeb(*(u8 *)from, to);
>>  + from++;
>>  + to++;
>>  + count--;
>>  + }
>>  +
>>  + while (count >= IO_LONG_SIZE) {
>>  + IO_LONG_WRITE(*(unsigned long *)from, to);
>>  + from += IO_LONG_SIZE;
>>  + to += IO_LONG_SIZE;
>>  + count -= IO_LONG_SIZE;
>>  + }
>>  +
>>  + while (count) {
>>  + __raw_writeb(*(u8 *)from, to);
>>  + from++;
>>  + to++;
>>  + count--;
>>  + }
>>  +}
>>  +EXPORT_SYMBOL(__memcpy_toio);
>>  +
>>  +void __memset_io(volatile void __iomem *dst, int c, size_t count)
>>  +{
>>  + unsigned long lc = (u8)c;
>>  + int i;
>>  +
>>  + for (i = 1; i < IO_LONG_SIZE; i++)
>>  + lc |= (u8)c << (i * BITS_PER_BYTE);
>>  +
>>  + while (count && !IS_ALIGNED((unsigned long)dst, IO_LONG_SIZE)) {
>>  + __raw_writeb((u8)c, dst);
>>  + dst++;
>>  + count--;
>>  + }
>>  +
>>  + while (count >= IO_LONG_SIZE) {
>>  + IO_LONG_WRITE(lc, dst);
>>  + dst += IO_LONG_SIZE;
>>  + count -= IO_LONG_SIZE;
>>  + }
>>  +
>>  + while (count) {
>>  + __raw_writeb(c, dst);
>>  + dst++;
>>  + count--;
>>  + }
>>  +}
>>  +EXPORT_SYMBOL(__memset_io);
>>  +#endif
>>  --
>>  2.24.1
