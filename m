Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E7119773E
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729704AbgC3JAC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33562 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729543AbgC3JAC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:02 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT2gLtYFeP5khAA--.36S2;
        Mon, 30 Mar 2020 16:59:55 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 25/39] MIPS: pic32: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:59:55 -0400
Message-Id: <1585558795-8647-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxT2gLtYFeP5khAA--.36S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KF4xWrW3WFyfCFW7ZrW5KFg_yoWkXr4fpF
        4DAa4kGFWUur1UAF1xZFy2yr45XayDurWjg3409345Z3WaqFn8Ars3tr98AFn7AFWDt3Wr
        WrW3XFWUGr4kZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJV
        W8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVWUCVW8JwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
        z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07beWl9UUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-pic32
to arch/mips/pic32/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/pic32/Platform                                                | 2 +-
 arch/mips/pic32/common/reset.c                                          | 2 +-
 .../asm/mach-pic32 => pic32/include/mach}/cpu-feature-overrides.h       | 0
 arch/mips/pic32/include/mach/ioremap.h                                  | 2 ++
 arch/mips/{include/asm/mach-pic32 => pic32/include/mach}/irq.h          | 0
 arch/mips/pic32/include/mach/kernel-entry-init.h                        | 2 ++
 arch/mips/pic32/include/mach/kmalloc.h                                  | 2 ++
 arch/mips/pic32/include/mach/mangle-port.h                              | 2 ++
 arch/mips/pic32/include/mach/mc146818rtc.h                              | 2 ++
 arch/mips/{include/asm/mach-pic32 => pic32/include/mach}/pic32.h        | 0
 arch/mips/{include/asm/mach-pic32 => pic32/include/mach}/spaces.h       | 0
 arch/mips/pic32/include/mach/topology.h                                 | 2 ++
 arch/mips/pic32/include/mach/war.h                                      | 2 ++
 arch/mips/pic32/pic32mzda/config.c                                      | 2 +-
 arch/mips/pic32/pic32mzda/early_clk.c                                   | 2 +-
 arch/mips/pic32/pic32mzda/early_console.c                               | 2 +-
 drivers/clk/microchip/clk-core.c                                        | 2 +-
 drivers/irqchip/irq-pic32-evic.c                                        | 2 +-
 drivers/pinctrl/pinctrl-pic32.c                                         | 2 +-
 drivers/rtc/rtc-pic32.c                                                 | 2 +-
 drivers/tty/serial/pic32_uart.c                                         | 2 +-
 drivers/watchdog/pic32-dmt.c                                            | 2 +-
 drivers/watchdog/pic32-wdt.c                                            | 2 +-
 24 files changed, 27 insertions(+), 12 deletions(-)
 rename arch/mips/{include/asm/mach-pic32 => pic32/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/pic32/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-pic32 => pic32/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/pic32/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/pic32/include/mach/kmalloc.h
 create mode 100644 arch/mips/pic32/include/mach/mangle-port.h
 create mode 100644 arch/mips/pic32/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-pic32 => pic32/include/mach}/pic32.h (100%)
 rename arch/mips/{include/asm/mach-pic32 => pic32/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/pic32/include/mach/topology.h
 create mode 100644 arch/mips/pic32/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 37d4d48..ce1b5e3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -603,6 +603,7 @@ config MIPS_MALTA
 
 config MACH_PIC32
 	bool "Microchip PIC32 Family"
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for the Microchip PIC32 family of platforms.
 
diff --git a/arch/mips/pic32/Platform b/arch/mips/pic32/Platform
index cd2084f4..615ce0d 100644
--- a/arch/mips/pic32/Platform
+++ b/arch/mips/pic32/Platform
@@ -2,6 +2,6 @@
 # PIC32MZDA
 #
 platform-$(CONFIG_PIC32MZDA)	+= pic32/
-cflags-$(CONFIG_PIC32MZDA)	+= -I$(srctree)/arch/mips/include/asm/mach-pic32
+cflags-$(CONFIG_PIC32MZDA)	+= -I$(srctree)/arch/mips/pic32/include
 load-$(CONFIG_PIC32MZDA)	+= 0xffffffff88000000
 all-$(CONFIG_PIC32MZDA)		:= $(COMPRESSION_FNAME).bin
diff --git a/arch/mips/pic32/common/reset.c b/arch/mips/pic32/common/reset.c
index a5fd7a8..5fca663 100644
--- a/arch/mips/pic32/common/reset.c
+++ b/arch/mips/pic32/common/reset.c
@@ -6,7 +6,7 @@
 #include <linux/init.h>
 #include <linux/pm.h>
 #include <asm/reboot.h>
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 
 #define PIC32_RSWRST		0x10
 
diff --git a/arch/mips/include/asm/mach-pic32/cpu-feature-overrides.h b/arch/mips/pic32/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-pic32/cpu-feature-overrides.h
rename to arch/mips/pic32/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/pic32/include/mach/ioremap.h b/arch/mips/pic32/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/pic32/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-pic32/irq.h b/arch/mips/pic32/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-pic32/irq.h
rename to arch/mips/pic32/include/mach/irq.h
diff --git a/arch/mips/pic32/include/mach/kernel-entry-init.h b/arch/mips/pic32/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/pic32/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/pic32/include/mach/kmalloc.h b/arch/mips/pic32/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/pic32/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/pic32/include/mach/mangle-port.h b/arch/mips/pic32/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/pic32/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/pic32/include/mach/mc146818rtc.h b/arch/mips/pic32/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/pic32/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-pic32/pic32.h b/arch/mips/pic32/include/mach/pic32.h
similarity index 100%
rename from arch/mips/include/asm/mach-pic32/pic32.h
rename to arch/mips/pic32/include/mach/pic32.h
diff --git a/arch/mips/include/asm/mach-pic32/spaces.h b/arch/mips/pic32/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-pic32/spaces.h
rename to arch/mips/pic32/include/mach/spaces.h
diff --git a/arch/mips/pic32/include/mach/topology.h b/arch/mips/pic32/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/pic32/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/pic32/include/mach/war.h b/arch/mips/pic32/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/pic32/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/pic32/pic32mzda/config.c b/arch/mips/pic32/pic32mzda/config.c
index 36afe1b..5223be2 100644
--- a/arch/mips/pic32/pic32mzda/config.c
+++ b/arch/mips/pic32/pic32mzda/config.c
@@ -7,7 +7,7 @@
 #include <linux/io.h>
 #include <linux/of_platform.h>
 
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 
 #include "pic32mzda.h"
 
diff --git a/arch/mips/pic32/pic32mzda/early_clk.c b/arch/mips/pic32/pic32mzda/early_clk.c
index 6001e50..4ec52e7 100644
--- a/arch/mips/pic32/pic32mzda/early_clk.c
+++ b/arch/mips/pic32/pic32mzda/early_clk.c
@@ -3,7 +3,7 @@
  * Joshua Henderson <joshua.henderson@microchip.com>
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 
 #include "pic32mzda.h"
 
diff --git a/arch/mips/pic32/pic32mzda/early_console.c b/arch/mips/pic32/pic32mzda/early_console.c
index 25372e6..d05324d 100644
--- a/arch/mips/pic32/pic32mzda/early_console.c
+++ b/arch/mips/pic32/pic32mzda/early_console.c
@@ -3,7 +3,7 @@
  * Joshua Henderson <joshua.henderson@microchip.com>
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 #include <asm/fw/fw.h>
 #include <asm/setup.h>
 
diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 1b4f023..31b14902 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -9,7 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 #include <asm/traps.h>
 
 #include "clk-core.h"
diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evic.c
index 34c4b4f..0e2ce3d 100644
--- a/drivers/irqchip/irq-pic32-evic.c
+++ b/drivers/irqchip/irq-pic32-evic.c
@@ -16,7 +16,7 @@
 
 #include <asm/irq.h>
 #include <asm/traps.h>
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 
 #define REG_INTCON	0x0000
 #define REG_INTSTAT	0x0020
diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index e5d6d3f..bbfe124 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -20,7 +20,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 
 #include "pinctrl-utils.h"
 #include "pinctrl-pic32.h"
diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index 2b69467..c070c53 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -16,7 +16,7 @@
 #include <linux/rtc.h>
 #include <linux/bcd.h>
 
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 
 #define PIC32_RTCCON		0x00
 #define PIC32_RTCCON_ON		BIT(15)
diff --git a/drivers/tty/serial/pic32_uart.c b/drivers/tty/serial/pic32_uart.c
index 484b7e8..af62e34 100644
--- a/drivers/tty/serial/pic32_uart.c
+++ b/drivers/tty/serial/pic32_uart.c
@@ -24,7 +24,7 @@
 #include <linux/serial_core.h>
 #include <linux/delay.h>
 
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 #include "pic32_uart.h"
 
 /* UART name and device definitions */
diff --git a/drivers/watchdog/pic32-dmt.c b/drivers/watchdog/pic32-dmt.c
index f43062b..4aaf1c2 100644
--- a/drivers/watchdog/pic32-dmt.c
+++ b/drivers/watchdog/pic32-dmt.c
@@ -17,7 +17,7 @@
 #include <linux/pm.h>
 #include <linux/watchdog.h>
 
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 
 /* Deadman Timer Regs */
 #define DMTCON_REG	0x00
diff --git a/drivers/watchdog/pic32-wdt.c b/drivers/watchdog/pic32-wdt.c
index 41715d6..f4abc75 100644
--- a/drivers/watchdog/pic32-wdt.c
+++ b/drivers/watchdog/pic32-wdt.c
@@ -17,7 +17,7 @@
 #include <linux/pm.h>
 #include <linux/watchdog.h>
 
-#include <asm/mach-pic32/pic32.h>
+#include <mach/pic32.h>
 
 /* Watchdog Timer Registers */
 #define WDTCON_REG		0x00
-- 
1.8.3.1

