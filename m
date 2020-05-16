Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60F81D5DD8
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 04:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgEPCQB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 22:16:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39076 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726290AbgEPCQA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 22:16:00 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX93WTL9e81M1AA--.61S3;
        Sat, 16 May 2020 10:15:51 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 2/2] MIPS: Remove not used 8250-platform.c
Date:   Sat, 16 May 2020 10:15:49 +0800
Message-Id: <1589595349-31656-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1589595349-31656-1-git-send-email-yangtiezhu@loongson.cn>
References: <1589595349-31656-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxX93WTL9e81M1AA--.61S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZw1UXF1rGrWUXr4kuF1UGFg_yoW5AFW3pw
        nIkan7GrW8WF4Ut395JrWv9ry5AanFqrWj9F1DCw18Jas8ZrykXrn7t3Z3tryqqryqya40
        gryfWr12yFs5ZwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr1l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYSdyUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When CONFIG_HAVE_STD_PC_SERIAL_PORT is set, there exists build errors
of 8250-platform.c due to linux/module.h is not included.

CONFIG_HAVE_STD_PC_SERIAL_PORT is not used in arch/mips for many years,
8250-platform.c is also not built and used, so it is not necessary to
fix the build errors, just remove the not used file 8250-platform.c and
the related code in Kconfig and Makefile.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2:
  - No changes

v3:
  - Remove not used 8250-platform.c

 arch/mips/Kconfig                |  3 ---
 arch/mips/kernel/8250-platform.c | 46 ----------------------------------------
 arch/mips/kernel/Makefile        |  2 --
 3 files changed, 51 deletions(-)
 delete mode 100644 arch/mips/kernel/8250-platform.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index bfa9cd9..b2ff77f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1358,9 +1358,6 @@ config MIPS_L1_CACHE_SHIFT
 	default "4" if MIPS_L1_CACHE_SHIFT_4
 	default "5"
 
-config HAVE_STD_PC_SERIAL_PORT
-	bool
-
 config ARC_CMDLINE_ONLY
 	bool
 
diff --git a/arch/mips/kernel/8250-platform.c b/arch/mips/kernel/8250-platform.c
deleted file mode 100644
index 5c6b2ab..0000000
--- a/arch/mips/kernel/8250-platform.c
+++ /dev/null
@@ -1,46 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2007 Ralf Baechle (ralf@linux-mips.org)
- */
-#include <linux/init.h>
-#include <linux/serial_8250.h>
-
-#define PORT(base, int)							\
-{									\
-	.iobase		= base,						\
-	.irq		= int,						\
-	.uartclk	= 1843200,					\
-	.iotype		= UPIO_PORT,					\
-	.flags		= UPF_BOOT_AUTOCONF | UPF_SKIP_TEST,		\
-	.regshift	= 0,						\
-}
-
-static struct plat_serial8250_port uart8250_data[] = {
-	PORT(0x3F8, 4),
-	PORT(0x2F8, 3),
-	PORT(0x3E8, 4),
-	PORT(0x2E8, 3),
-	{ },
-};
-
-static struct platform_device uart8250_device = {
-	.name			= "serial8250",
-	.id			= PLAT8250_DEV_PLATFORM,
-	.dev			= {
-		.platform_data	= uart8250_data,
-	},
-};
-
-static int __init uart8250_init(void)
-{
-	return platform_device_register(&uart8250_device);
-}
-
-module_init(uart8250_init);
-
-MODULE_AUTHOR("Ralf Baechle <ralf@linux-mips.org>");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Generic 8250 UART probe driver");
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index d6e97df..8c7a043 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -98,8 +98,6 @@ obj-$(CONFIG_MIPSR2_TO_R6_EMULATOR)	+= mips-r2-to-r6-emul.o
 
 CFLAGS_cpu-bugs64.o	= $(shell if $(CC) $(KBUILD_CFLAGS) -Wa,-mdaddi -c -o /dev/null -x c /dev/null >/dev/null 2>&1; then echo "-DHAVE_AS_SET_DADDI"; fi)
 
-obj-$(CONFIG_HAVE_STD_PC_SERIAL_PORT)	+= 8250-platform.o
-
 obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
 obj-$(CONFIG_HW_PERF_EVENTS)	+= perf_event_mipsxx.o
 
-- 
2.1.0

