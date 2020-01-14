Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA6C13A92F
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2020 13:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgANMYL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 07:24:11 -0500
Received: from forward105p.mail.yandex.net ([77.88.28.108]:44172 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726053AbgANMYL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jan 2020 07:24:11 -0500
Received: from mxback1j.mail.yandex.net (mxback1j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10a])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id 1BE664D41932;
        Tue, 14 Jan 2020 15:24:07 +0300 (MSK)
Received: from iva2-18315b3f9ecc.qloud-c.yandex.net (iva2-18315b3f9ecc.qloud-c.yandex.net [2a02:6b8:c0c:1404:0:640:1831:5b3f])
        by mxback1j.mail.yandex.net (mxback/Yandex) with ESMTP id y5m3FK6K65-O6piEkfp;
        Tue, 14 Jan 2020 15:24:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1579004647;
        bh=Y+G5Lr09yCsF/0LzYGt2QYGSXAaHB6SYzR6VuIq7/PM=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=l31+T+c+7P18zDJYD4GzuqryorqyMWyJMM7MXAdkAqtDj16JnQDQ7ccbuCU2v3LeX
         aZJXpw9Vrg6HSFA1eycF8OFJJi1PAvLnOa3w7YPMOnVQECB3kcUc4+rRkgr7lp0YSc
         7p0/YkSrDOvZawc2ruEsveNKY+VrmBY8kB8uokiE=
Authentication-Results: mxback1j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva2-18315b3f9ecc.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id YR81iErVaf-NvW8RLJp;
        Tue, 14 Jan 2020 15:24:03 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Introduce aligned IO memory operations
Date:   Tue, 14 Jan 2020 20:23:43 +0800
Message-Id: <20200114122343.163685-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some platforms, such as Loongson64 or QEMU/KVM, don't support unaligned
instructions like lwl or lwr in IO memory access. However, our current
IO memcpy/memset is wired to the generic implementation, which leads
to a fatal result.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig          |  4 ++
 arch/mips/include/asm/io.h | 10 ++++
 arch/mips/kernel/Makefile  |  2 +-
 arch/mips/kernel/io.c      | 98 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/kernel/io.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8b0cd692a43f..15a331aa23a2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1450,6 +1450,7 @@ config CPU_LOONGSON64
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
 	select CPU_SUPPORTS_MSA
+	select CPU_NEEDS_ALIGNED_IO
 	select CPU_HAS_LOAD_STORE_LR
 	select CPU_DIEI_BROKEN if !LOONGSON3_ENHANCEMENT
 	select CPU_MIPSR2_IRQ_VI
@@ -2598,6 +2599,9 @@ config CPU_HAS_LOAD_STORE_LR
 	  LWL, LWR, SWL, SWR (Load/store word left/right).
 	  LDL, LDR, SDL, SDR (Load/store doubleword left/right, for 64bit systems).
 
+config CPU_NEEDS_ALIGNED_IO
+	bool
+
 #
 # Vectored interrupt mode is an R2 feature
 #
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 3f6ce74335b4..3b0eb4941f23 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -577,6 +577,15 @@ BUILDSTRING(l, u32)
 BUILDSTRING(q, u64)
 #endif
 
+#if defined(CONFIG_CPU_NEEDS_ALIGNED_IO)
+extern void __memcpy_fromio(void *, const volatile void __iomem *, size_t);
+extern void __memcpy_toio(volatile void __iomem *, const void *, size_t);
+extern void __memset_io(volatile void __iomem *, int, size_t);
+
+#define memset_io(c, v, l)	__memset_io((c), (v), (l))
+#define memcpy_fromio(a, c, l)	__memcpy_fromio((a), (c), (l))
+#define memcpy_toio(c, a, l)	__memcpy_toio((c), (a), (l))
+#else
 static inline void memset_io(volatile void __iomem *addr, unsigned char val, int count)
 {
 	memset((void __force *) addr, val, count);
@@ -589,6 +598,7 @@ static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int
 {
 	memcpy((void __force *) dst, src, count);
 }
+#endif
 
 /*
  * The caches on some architectures aren't dma-coherent and have need to
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index d6e97df51cfb..b07b97b9385e 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -8,7 +8,7 @@ extra-y		:= head.o vmlinux.lds
 obj-y		+= cmpxchg.o cpu-probe.o branch.o elf.o entry.o genex.o idle.o irq.o \
 		   process.o prom.o ptrace.o reset.o setup.o signal.o \
 		   syscall.o time.o topology.o traps.o unaligned.o watch.o \
-		   vdso.o cacheinfo.o
+		   vdso.o cacheinfo.o io.o
 
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_ftrace.o = -pg
diff --git a/arch/mips/kernel/io.c b/arch/mips/kernel/io.c
new file mode 100644
index 000000000000..ca105aa76d4d
--- /dev/null
+++ b/arch/mips/kernel/io.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/export.h>
+#include <linux/types.h>
+#include <linux/io.h>
+
+#if defined(CONFIG_CPU_NEEDS_ALIGNED_IO)
+
+#if defined(CONFIG_64BIT)
+#define IO_LONG_READ	__raw_readq
+#define IO_LONG_WRITE	__raw_writeq
+#define IO_LONG_SIZE	8
+#else
+#define IO_LONG_READ	__raw_readl
+#define IO_LONG_WRITE	__raw_writel
+#define IO_LONG_SIZE	4
+#endif
+
+void __memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
+{
+	while (count && !IS_ALIGNED((unsigned long)from, IO_LONG_SIZE) &&
+		!IS_ALIGNED((unsigned long)to, IO_LONG_SIZE)) {
+		*(u8 *)to = __raw_readb(from);
+		from++;
+		to++;
+		count--;
+	}
+
+	while (count >= IO_LONG_SIZE) {
+		*(unsigned long *)to = IO_LONG_READ(from);
+		from += IO_LONG_SIZE;
+		to += IO_LONG_SIZE;
+		count -= IO_LONG_SIZE;
+	}
+
+	while (count) {
+		*(u8 *)to = __raw_readb(from);
+		from++;
+		to++;
+		count--;
+	}
+}
+EXPORT_SYMBOL(__memcpy_fromio);
+
+void __memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
+{
+	while (count && !IS_ALIGNED((unsigned long)from, IO_LONG_SIZE) &&
+		!IS_ALIGNED((unsigned long)to, IO_LONG_SIZE)) {
+		__raw_writeb(*(u8 *)from, to);
+		from++;
+		to++;
+		count--;
+	}
+
+	while (count >= IO_LONG_SIZE) {
+		IO_LONG_WRITE(*(unsigned long *)from, to);
+		from += IO_LONG_SIZE;
+		to += IO_LONG_SIZE;
+		count -= IO_LONG_SIZE;
+	}
+
+	while (count) {
+		__raw_writeb(*(u8 *)from, to);
+		from++;
+		to++;
+		count--;
+	}
+}
+EXPORT_SYMBOL(__memcpy_toio);
+
+void __memset_io(volatile void __iomem *dst, int c, size_t count)
+{
+	unsigned long lc = (u8)c;
+	int i;
+
+	for (i = 1; i < IO_LONG_SIZE; i++)
+		lc |= (u8)c << (i * BITS_PER_BYTE);
+
+	while (count && !IS_ALIGNED((unsigned long)dst, IO_LONG_SIZE)) {
+		__raw_writeb((u8)c, dst);
+		dst++;
+		count--;
+	}
+
+	while (count >= IO_LONG_SIZE) {
+		IO_LONG_WRITE(lc, dst);
+		dst += IO_LONG_SIZE;
+		count -= IO_LONG_SIZE;
+	}
+
+	while (count) {
+		__raw_writeb(c, dst);
+		dst++;
+		count--;
+	}
+}
+EXPORT_SYMBOL(__memset_io);
+#endif
-- 
2.24.1

