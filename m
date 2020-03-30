Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB017197713
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729800AbgC3IxQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:53:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60222 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729812AbgC3IxP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:53:15 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT2hxs4FenJghAA--.30S2;
        Mon, 30 Mar 2020 16:53:06 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/39] MIPS: cobalt: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:53:05 -0400
Message-Id: <1585558385-2974-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxT2hxs4FenJghAA--.30S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JF4UJr45Gr48GFWxWry7GFg_yoWfKFyfpa
        nru3Z5GF409ry0yF4fuFW2vr43Xan8GrZFkFy5W34UZ3WSqF1UJrZ5tr9xAry8JF4Dta48
        WFWSqr1Utrs29w7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVWxJV
        W8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
        87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5RVbJUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-cobalt
to arch/mips/cobalt/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                     | 1 +
 arch/mips/cobalt/Platform                                             | 2 +-
 arch/mips/{include/asm/mach-cobalt => cobalt/include/mach}/cobalt.h   | 0
 .../asm/mach-cobalt => cobalt/include/mach}/cpu-feature-overrides.h   | 0
 arch/mips/cobalt/include/mach/ioremap.h                               | 2 ++
 arch/mips/{include/asm/mach-cobalt => cobalt/include/mach}/irq.h      | 0
 arch/mips/cobalt/include/mach/kernel-entry-init.h                     | 2 ++
 arch/mips/cobalt/include/mach/kmalloc.h                               | 2 ++
 .../{include/asm/mach-cobalt => cobalt/include/mach}/mach-gt64120.h   | 0
 arch/mips/cobalt/include/mach/mangle-port.h                           | 2 ++
 arch/mips/cobalt/include/mach/mc146818rtc.h                           | 2 ++
 arch/mips/cobalt/include/mach/spaces.h                                | 2 ++
 arch/mips/cobalt/include/mach/topology.h                              | 2 ++
 arch/mips/cobalt/include/mach/war.h                                   | 2 ++
 arch/mips/cobalt/irq.c                                                | 2 +-
 arch/mips/cobalt/led.c                                                | 2 +-
 arch/mips/cobalt/reset.c                                              | 2 +-
 arch/mips/cobalt/serial.c                                             | 4 ++--
 arch/mips/cobalt/setup.c                                              | 2 +-
 arch/mips/include/asm/gt64120.h                                       | 2 +-
 arch/mips/pci/fixup-cobalt.c                                          | 4 ++--
 21 files changed, 27 insertions(+), 10 deletions(-)
 rename arch/mips/{include/asm/mach-cobalt => cobalt/include/mach}/cobalt.h (100%)
 rename arch/mips/{include/asm/mach-cobalt => cobalt/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/cobalt/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-cobalt => cobalt/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/cobalt/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/cobalt/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-cobalt => cobalt/include/mach}/mach-gt64120.h (100%)
 create mode 100644 arch/mips/cobalt/include/mach/mangle-port.h
 create mode 100644 arch/mips/cobalt/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/cobalt/include/mach/spaces.h
 create mode 100644 arch/mips/cobalt/include/mach/topology.h
 create mode 100644 arch/mips/cobalt/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f31ff10..ba7e065 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -329,6 +329,7 @@ config MIPS_COBALT
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select USE_GENERIC_EARLY_PRINTK_8250
+	select HAVE_MACH_HEAD_FILES
 
 config MACH_DECSTATION
 	bool "DECstations"
diff --git a/arch/mips/cobalt/Platform b/arch/mips/cobalt/Platform
index 34123ef..db48e5b 100644
--- a/arch/mips/cobalt/Platform
+++ b/arch/mips/cobalt/Platform
@@ -2,5 +2,5 @@
 # Cobalt Server
 #
 platform-$(CONFIG_MIPS_COBALT)	+= cobalt/
-cflags-$(CONFIG_MIPS_COBALT)	+= -I$(srctree)/arch/mips/include/asm/mach-cobalt
+cflags-$(CONFIG_MIPS_COBALT)	+= -I$(srctree)/arch/mips/cobalt/include
 load-$(CONFIG_MIPS_COBALT)	+= 0xffffffff80080000
diff --git a/arch/mips/include/asm/mach-cobalt/cobalt.h b/arch/mips/cobalt/include/mach/cobalt.h
similarity index 100%
rename from arch/mips/include/asm/mach-cobalt/cobalt.h
rename to arch/mips/cobalt/include/mach/cobalt.h
diff --git a/arch/mips/include/asm/mach-cobalt/cpu-feature-overrides.h b/arch/mips/cobalt/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-cobalt/cpu-feature-overrides.h
rename to arch/mips/cobalt/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/cobalt/include/mach/ioremap.h b/arch/mips/cobalt/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/cobalt/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-cobalt/irq.h b/arch/mips/cobalt/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-cobalt/irq.h
rename to arch/mips/cobalt/include/mach/irq.h
diff --git a/arch/mips/cobalt/include/mach/kernel-entry-init.h b/arch/mips/cobalt/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/cobalt/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/cobalt/include/mach/kmalloc.h b/arch/mips/cobalt/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/cobalt/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-cobalt/mach-gt64120.h b/arch/mips/cobalt/include/mach/mach-gt64120.h
similarity index 100%
rename from arch/mips/include/asm/mach-cobalt/mach-gt64120.h
rename to arch/mips/cobalt/include/mach/mach-gt64120.h
diff --git a/arch/mips/cobalt/include/mach/mangle-port.h b/arch/mips/cobalt/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/cobalt/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/cobalt/include/mach/mc146818rtc.h b/arch/mips/cobalt/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/cobalt/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/cobalt/include/mach/spaces.h b/arch/mips/cobalt/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/cobalt/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/cobalt/include/mach/topology.h b/arch/mips/cobalt/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/cobalt/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/cobalt/include/mach/war.h b/arch/mips/cobalt/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/cobalt/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/cobalt/irq.c b/arch/mips/cobalt/irq.c
index ead5ae4..f490116 100644
--- a/arch/mips/cobalt/irq.c
+++ b/arch/mips/cobalt/irq.c
@@ -18,7 +18,7 @@
 #include <asm/irq_gt641xx.h>
 #include <asm/gt64120.h>
 
-#include <irq.h>
+#include <mach/irq.h>
 
 asmlinkage void plat_irq_dispatch(void)
 {
diff --git a/arch/mips/cobalt/led.c b/arch/mips/cobalt/led.c
index 196660c..191d5c6 100644
--- a/arch/mips/cobalt/led.c
+++ b/arch/mips/cobalt/led.c
@@ -9,7 +9,7 @@
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
 
-#include <cobalt.h>
+#include <mach/cobalt.h>
 
 static struct resource cobalt_led_resource __initdata = {
 	.start	= 0x1c000000,
diff --git a/arch/mips/cobalt/reset.c b/arch/mips/cobalt/reset.c
index 4eedd48..9333e56 100644
--- a/arch/mips/cobalt/reset.c
+++ b/arch/mips/cobalt/reset.c
@@ -15,7 +15,7 @@
 #include <asm/idle.h>
 #include <asm/processor.h>
 
-#include <cobalt.h>
+#include <mach/cobalt.h>
 
 #define RESET_PORT	((void __iomem *)CKSEG1ADDR(0x1c000000))
 #define RESET		0x0f
diff --git a/arch/mips/cobalt/serial.c b/arch/mips/cobalt/serial.c
index 5fb6767..56a6532 100644
--- a/arch/mips/cobalt/serial.c
+++ b/arch/mips/cobalt/serial.c
@@ -10,8 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/serial_8250.h>
 
-#include <cobalt.h>
-#include <irq.h>
+#include <mach/cobalt.h>
+#include <mach/irq.h>
 
 static struct resource cobalt_uart_resource[] __initdata = {
 	{
diff --git a/arch/mips/cobalt/setup.c b/arch/mips/cobalt/setup.c
index c136a18..ab4d587 100644
--- a/arch/mips/cobalt/setup.c
+++ b/arch/mips/cobalt/setup.c
@@ -20,7 +20,7 @@
 #include <asm/setup.h>
 #include <asm/gt64120.h>
 
-#include <cobalt.h>
+#include <mach/cobalt.h>
 
 extern void cobalt_machine_restart(char *command);
 extern void cobalt_machine_halt(void);
diff --git a/arch/mips/include/asm/gt64120.h b/arch/mips/include/asm/gt64120.h
index 5d68d72..953ab1a 100644
--- a/arch/mips/include/asm/gt64120.h
+++ b/arch/mips/include/asm/gt64120.h
@@ -547,7 +547,7 @@
  *		  full gt64120 cascade interrupt support is in place
  */
 
-#include <mach-gt64120.h>
+#include <mach/mach-gt64120.h>
 
 /*
  * Because of an error/peculiarity in the Galileo chip, we need to swap the
diff --git a/arch/mips/pci/fixup-cobalt.c b/arch/mips/pci/fixup-cobalt.c
index 44be65c..96badb1 100644
--- a/arch/mips/pci/fixup-cobalt.c
+++ b/arch/mips/pci/fixup-cobalt.c
@@ -16,8 +16,8 @@
 #include <asm/io.h>
 #include <asm/gt64120.h>
 
-#include <cobalt.h>
-#include <irq.h>
+#include <mach/cobalt.h>
+#include <mach/irq.h>
 
 /*
  * PCI slot numbers
-- 
1.8.3.1

