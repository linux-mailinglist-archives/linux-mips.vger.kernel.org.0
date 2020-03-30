Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0C931976B1
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbgC3IjK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:39:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56858 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729763AbgC3IjK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:39:10 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv9smsIFeLZchAA--.9S2;
        Mon, 30 Mar 2020 16:39:02 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/39] MIPS: ath79: Add header files path prefix
Date:   Mon, 30 Mar 2020 04:39:02 -0400
Message-Id: <1585557542-23310-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxv9smsIFeLZchAA--.9S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr43ArWkXrWkCw1kXr4ktFb_yoWfurWrpa
        1DAa4kGr4UuryUAr13Zry2vr45Xan8uFWj9ry5W347Za4SqF15JFs5K34kAry8tF4DK3Wr
        WFW3Xr45Jws29aUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYIeHPUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-ath79
to arch/mips/ath79/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                   | 1 +
 arch/mips/ath79/Platform                                            | 2 +-
 arch/mips/ath79/clock.c                                             | 4 ++--
 arch/mips/ath79/common.c                                            | 4 ++--
 arch/mips/ath79/early_printk.c                                      | 6 +++---
 .../{include/asm/mach-ath79 => ath79/include/mach}/ar71xx_regs.h    | 0
 .../{include/asm/mach-ath79 => ath79/include/mach}/ar933x_uart.h    | 0
 arch/mips/{include/asm/mach-ath79 => ath79/include/mach}/ath79.h    | 0
 .../asm/mach-ath79 => ath79/include/mach}/cpu-feature-overrides.h   | 0
 arch/mips/ath79/include/mach/ioremap.h                              | 2 ++
 arch/mips/{include/asm/mach-ath79 => ath79/include/mach}/irq.h      | 0
 .../asm/mach-ath79 => ath79/include/mach}/kernel-entry-init.h       | 0
 arch/mips/ath79/include/mach/kmalloc.h                              | 2 ++
 arch/mips/ath79/include/mach/mangle-port.h                          | 2 ++
 arch/mips/ath79/include/mach/spaces.h                               | 2 ++
 arch/mips/ath79/include/mach/topology.h                             | 2 ++
 arch/mips/ath79/include/mach/war.h                                  | 2 ++
 arch/mips/ath79/setup.c                                             | 4 ++--
 drivers/irqchip/irq-ath79-cpu.c                                     | 2 +-
 drivers/tty/serial/ar933x_uart.c                                    | 2 +-
 20 files changed, 25 insertions(+), 12 deletions(-)
 rename arch/mips/{include/asm/mach-ath79 => ath79/include/mach}/ar71xx_regs.h (100%)
 rename arch/mips/{include/asm/mach-ath79 => ath79/include/mach}/ar933x_uart.h (100%)
 rename arch/mips/{include/asm/mach-ath79 => ath79/include/mach}/ath79.h (100%)
 rename arch/mips/{include/asm/mach-ath79 => ath79/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/ath79/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-ath79 => ath79/include/mach}/irq.h (100%)
 rename arch/mips/{include/asm/mach-ath79 => ath79/include/mach}/kernel-entry-init.h (100%)
 create mode 100644 arch/mips/ath79/include/mach/kmalloc.h
 create mode 100644 arch/mips/ath79/include/mach/mangle-port.h
 create mode 100644 arch/mips/ath79/include/mach/spaces.h
 create mode 100644 arch/mips/ath79/include/mach/topology.h
 create mode 100644 arch/mips/ath79/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 7fec160..069fa94 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -223,6 +223,7 @@ config ATH79
 	select SYS_SUPPORTS_ZBOOT_UART_PROM
 	select USE_OF
 	select USB_EHCI_ROOT_HUB_TT if USB_EHCI_HCD_PLATFORM
+	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for the Atheros AR71XX/AR724X/AR913X SoCs.
 
diff --git a/arch/mips/ath79/Platform b/arch/mips/ath79/Platform
index 2bd6636..c423827 100644
--- a/arch/mips/ath79/Platform
+++ b/arch/mips/ath79/Platform
@@ -3,5 +3,5 @@
 #
 
 platform-$(CONFIG_ATH79)	+= ath79/
-cflags-$(CONFIG_ATH79)		+= -I$(srctree)/arch/mips/include/asm/mach-ath79
+cflags-$(CONFIG_ATH79)		+= -I$(srctree)/arch/mips/ath79/include
 load-$(CONFIG_ATH79)		= 0xffffffff80060000
diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f655..d84f119 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -21,8 +21,8 @@
 
 #include <asm/div64.h>
 
-#include <asm/mach-ath79/ath79.h>
-#include <asm/mach-ath79/ar71xx_regs.h>
+#include <mach/ath79.h>
+#include <mach/ar71xx_regs.h>
 #include "common.h"
 
 #define AR71XX_BASE_FREQ	40000000
diff --git a/arch/mips/ath79/common.c b/arch/mips/ath79/common.c
index 137abbc..2fc96a5 100644
--- a/arch/mips/ath79/common.c
+++ b/arch/mips/ath79/common.c
@@ -14,8 +14,8 @@
 #include <linux/types.h>
 #include <linux/spinlock.h>
 
-#include <asm/mach-ath79/ath79.h>
-#include <asm/mach-ath79/ar71xx_regs.h>
+#include <mach/ath79.h>
+#include <mach/ar71xx_regs.h>
 #include "common.h"
 
 static DEFINE_SPINLOCK(ath79_device_reset_lock);
diff --git a/arch/mips/ath79/early_printk.c b/arch/mips/ath79/early_printk.c
index 782732c..f56d23b 100644
--- a/arch/mips/ath79/early_printk.c
+++ b/arch/mips/ath79/early_printk.c
@@ -12,9 +12,9 @@
 #include <asm/addrspace.h>
 #include <asm/setup.h>
 
-#include <asm/mach-ath79/ath79.h>
-#include <asm/mach-ath79/ar71xx_regs.h>
-#include <asm/mach-ath79/ar933x_uart.h>
+#include <mach/ath79.h>
+#include <mach/ar71xx_regs.h>
+#include <mach/ar933x_uart.h>
 
 static void (*_prom_putchar)(char);
 
diff --git a/arch/mips/include/asm/mach-ath79/ar71xx_regs.h b/arch/mips/ath79/include/mach/ar71xx_regs.h
similarity index 100%
rename from arch/mips/include/asm/mach-ath79/ar71xx_regs.h
rename to arch/mips/ath79/include/mach/ar71xx_regs.h
diff --git a/arch/mips/include/asm/mach-ath79/ar933x_uart.h b/arch/mips/ath79/include/mach/ar933x_uart.h
similarity index 100%
rename from arch/mips/include/asm/mach-ath79/ar933x_uart.h
rename to arch/mips/ath79/include/mach/ar933x_uart.h
diff --git a/arch/mips/include/asm/mach-ath79/ath79.h b/arch/mips/ath79/include/mach/ath79.h
similarity index 100%
rename from arch/mips/include/asm/mach-ath79/ath79.h
rename to arch/mips/ath79/include/mach/ath79.h
diff --git a/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h b/arch/mips/ath79/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h
rename to arch/mips/ath79/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/ath79/include/mach/ioremap.h b/arch/mips/ath79/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/ath79/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-ath79/irq.h b/arch/mips/ath79/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-ath79/irq.h
rename to arch/mips/ath79/include/mach/irq.h
diff --git a/arch/mips/include/asm/mach-ath79/kernel-entry-init.h b/arch/mips/ath79/include/mach/kernel-entry-init.h
similarity index 100%
rename from arch/mips/include/asm/mach-ath79/kernel-entry-init.h
rename to arch/mips/ath79/include/mach/kernel-entry-init.h
diff --git a/arch/mips/ath79/include/mach/kmalloc.h b/arch/mips/ath79/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/ath79/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/ath79/include/mach/mangle-port.h b/arch/mips/ath79/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/ath79/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/ath79/include/mach/spaces.h b/arch/mips/ath79/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/ath79/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/ath79/include/mach/topology.h b/arch/mips/ath79/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/ath79/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/ath79/include/mach/war.h b/arch/mips/ath79/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/ath79/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index acb4fd6..1b2226c 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -27,8 +27,8 @@
 #include <asm/prom.h>
 #include <asm/fw/fw.h>
 
-#include <asm/mach-ath79/ath79.h>
-#include <asm/mach-ath79/ar71xx_regs.h>
+#include <mach/ath79.h>
+#include <mach/ar71xx_regs.h>
 #include "common.h"
 
 #define ATH79_SYS_TYPE_LEN	64
diff --git a/drivers/irqchip/irq-ath79-cpu.c b/drivers/irqchip/irq-ath79-cpu.c
index 923e4bb..8f4ffcb 100644
--- a/drivers/irqchip/irq-ath79-cpu.c
+++ b/drivers/irqchip/irq-ath79-cpu.c
@@ -15,7 +15,7 @@
 #include <linux/of.h>
 
 #include <asm/irq_cpu.h>
-#include <asm/mach-ath79/ath79.h>
+#include <mach/ath79.h>
 
 /*
  * The IP2/IP3 lines are tied to a PCI/WMAC/USB device. Drivers for
diff --git a/drivers/tty/serial/ar933x_uart.c b/drivers/tty/serial/ar933x_uart.c
index 3bdd56a..5147f8e 100644
--- a/drivers/tty/serial/ar933x_uart.c
+++ b/drivers/tty/serial/ar933x_uart.c
@@ -27,7 +27,7 @@
 
 #include <asm/div64.h>
 
-#include <asm/mach-ath79/ar933x_uart.h>
+#include <mach/ar933x_uart.h>
 
 #define DRIVER_NAME "ar933x-uart"
 
-- 
1.8.3.1

