Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0AF2F2631
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 05:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733117AbfKGECI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 23:02:08 -0500
Received: from forward105j.mail.yandex.net ([5.45.198.248]:38102 "EHLO
        forward105j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733102AbfKGECI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 23:02:08 -0500
Received: from mxback23o.mail.yandex.net (mxback23o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::74])
        by forward105j.mail.yandex.net (Yandex) with ESMTP id A47DFB210A2;
        Thu,  7 Nov 2019 07:02:03 +0300 (MSK)
Received: from sas8-93a22d3a76f4.qloud-c.yandex.net (sas8-93a22d3a76f4.qloud-c.yandex.net [2a02:6b8:c1b:2988:0:640:93a2:2d3a])
        by mxback23o.mail.yandex.net (mxback/Yandex) with ESMTP id Zmw3tl4Wu9-23gmnLqP;
        Thu, 07 Nov 2019 07:02:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573099323;
        bh=P15Sw7I1h/RWKLw9wOJ6KnB5UZn4/QNfOBBqbmEfUds=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=SiGudgcka41qXPUAZFUMuYUl/cTqTA3uWKdjBjpUj3bxirkhlOf4U/d2rnPxUZM3N
         0y33KV9SK2IBC/MmYBdhWupRvBsYKLNA9fMY0DDFeJMc4k+KlHkPaxOaqnbjuvqBXB
         NKxqRPEWrc0UMGfUpXWj151CtcOaXcLHdEftQCBY=
Authentication-Results: mxback23o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas8-93a22d3a76f4.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id Z8DeRIVREY-1xVm3Er8;
        Thu, 07 Nov 2019 07:02:01 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     paulburton@kernel.org, chenhe@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/5] MIPS: Loongson2ef: Convert to early_printk_8250
Date:   Thu,  7 Nov 2019 12:01:17 +0800
Message-Id: <20191107040118.10685-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
References: <20191107040118.10685-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

early_printk.c is doing the same with early_printk_8250.
Remove duplicated code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../include/asm/mach-loongson2ef/loongson.h   |  1 -
 arch/mips/loongson2ef/Kconfig                 |  2 +
 arch/mips/loongson2ef/common/Makefile         |  1 -
 arch/mips/loongson2ef/common/early_printk.c   | 38 -------------------
 arch/mips/loongson2ef/common/init.c           |  1 -
 arch/mips/loongson2ef/common/uart_base.c      |  2 +
 6 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 arch/mips/loongson2ef/common/early_printk.c

diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson.h
index 622456539add..5008af0a1a19 100644
--- a/arch/mips/include/asm/mach-loongson2ef/loongson.h
+++ b/arch/mips/include/asm/mach-loongson2ef/loongson.h
@@ -21,7 +21,6 @@ extern void mach_prepare_shutdown(void);
 /* environment arguments from bootloader */
 extern u32 cpu_clock_freq;
 extern u32 memsize, highmemsize;
-extern const struct plat_smp_ops loongson3_smp_ops;
 
 /* loongson-specific command line, env and memory initialization */
 extern void __init prom_init_memory(void);
diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
index 66a584a833e5..595dd48e1e4d 100644
--- a/arch/mips/loongson2ef/Kconfig
+++ b/arch/mips/loongson2ef/Kconfig
@@ -23,6 +23,7 @@ config LEMOTE_FULOONG2E
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_HAS_EARLY_PRINTK
+	select USE_GENERIC_EARLY_PRINTK_8250
 	select GENERIC_ISA_DMA_SUPPORT_BROKEN
 	select CPU_HAS_WB
 	select LOONGSON_MC146818
@@ -52,6 +53,7 @@ config LEMOTE_MACH2F
 	select ISA
 	select SYS_HAS_CPU_LOONGSON2F
 	select SYS_HAS_EARLY_PRINTK
+	select USE_GENERIC_EARLY_PRINTK_8250
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
diff --git a/arch/mips/loongson2ef/common/Makefile b/arch/mips/loongson2ef/common/Makefile
index 10dd009a20a0..d5ab3e543ea3 100644
--- a/arch/mips/loongson2ef/common/Makefile
+++ b/arch/mips/loongson2ef/common/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_PCI) += pci.o
 #
 # Serial port support
 #
-obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-$(CONFIG_LOONGSON_UART_BASE) += uart_base.o
 obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
 
diff --git a/arch/mips/loongson2ef/common/early_printk.c b/arch/mips/loongson2ef/common/early_printk.c
deleted file mode 100644
index d90c5e5a0e78..000000000000
--- a/arch/mips/loongson2ef/common/early_printk.c
+++ /dev/null
@@ -1,38 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*  early printk support
- *
- *  Copyright (c) 2009 Philippe Vachon <philippe@cowpig.ca>
- *  Copyright (c) 2009 Lemote Inc.
- *  Author: Wu Zhangjin, wuzhangjin@gmail.com
- */
-#include <linux/serial_reg.h>
-#include <asm/setup.h>
-
-#include <loongson.h>
-
-#define PORT(base, offset) (u8 *)(base + offset)
-
-static inline unsigned int serial_in(unsigned char *base, int offset)
-{
-	return readb(PORT(base, offset));
-}
-
-static inline void serial_out(unsigned char *base, int offset, int value)
-{
-	writeb(value, PORT(base, offset));
-}
-
-void prom_putchar(char c)
-{
-	int timeout;
-	unsigned char *uart_base;
-
-	uart_base = (unsigned char *)_loongson_uart_base;
-	timeout = 1024;
-
-	while (((serial_in(uart_base, UART_LSR) & UART_LSR_THRE) == 0) &&
-			(timeout-- > 0))
-		;
-
-	serial_out(uart_base, UART_TX, c);
-}
diff --git a/arch/mips/loongson2ef/common/init.c b/arch/mips/loongson2ef/common/init.c
index dab3ffda8b14..45512178be77 100644
--- a/arch/mips/loongson2ef/common/init.c
+++ b/arch/mips/loongson2ef/common/init.c
@@ -44,7 +44,6 @@ void __init prom_init(void)
 
 	/*init the uart base address */
 	prom_init_uart_base();
-	register_smp_ops(&loongson3_smp_ops);
 	board_nmi_handler_setup = mips_nmi_setup;
 }
 
diff --git a/arch/mips/loongson2ef/common/uart_base.c b/arch/mips/loongson2ef/common/uart_base.c
index bbfe1095a843..522bea6ad7b0 100644
--- a/arch/mips/loongson2ef/common/uart_base.c
+++ b/arch/mips/loongson2ef/common/uart_base.c
@@ -6,6 +6,7 @@
 
 #include <linux/export.h>
 #include <asm/bootinfo.h>
+#include <asm/setup.h>
 
 #include <loongson.h>
 
@@ -38,4 +39,5 @@ void prom_init_loongson_uart_base(void)
 	}
 
 	_loongson_uart_base = TO_UNCAC(loongson_uart_base);
+	setup_8250_early_printk_port(_loongson_uart_base, 0, 1024);
 }
-- 
2.20.1

