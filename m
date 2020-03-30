Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5EC197742
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbgC3JAZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33744 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729768AbgC3JAZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:25 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL94etYFe_JkhAA--.20S2;
        Mon, 30 Mar 2020 17:00:14 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 28/39] MIPS: pnx833x: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:14 -0400
Message-Id: <1585558814-31302-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxL94etYFe_JkhAA--.20S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Cw15GF15KF4DuFyUtw4Utwb_yoWkXF47pa
        1DC3Wvkr4j9w1Uur1fZFy2vwsxJan8GrZ0yryF9340v3Waq3W5JFs5Jrs8Ar97XFWqg3W8
        uFW3Xr1UJrsYvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Remove header files from arch/mips/include/asm/mach-pnx833x
to arch/mips/pnx833x/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                   | 1 +
 arch/mips/pnx833x/Platform                                          | 2 +-
 arch/mips/pnx833x/common/interrupts.c                               | 6 +++---
 arch/mips/pnx833x/common/platform.c                                 | 6 +++---
 arch/mips/pnx833x/common/reset.c                                    | 2 +-
 arch/mips/pnx833x/common/setup.c                                    | 4 ++--
 arch/mips/pnx833x/include/mach/cpu-feature-overrides.h              | 2 ++
 arch/mips/{include/asm/mach-pnx833x => pnx833x/include/mach}/gpio.h | 2 +-
 arch/mips/pnx833x/include/mach/ioremap.h                            | 2 ++
 .../asm/mach-pnx833x => pnx833x/include/mach}/irq-mapping.h         | 2 +-
 arch/mips/{include/asm/mach-pnx833x => pnx833x/include/mach}/irq.h  | 0
 arch/mips/pnx833x/include/mach/kernel-entry-init.h                  | 2 ++
 arch/mips/pnx833x/include/mach/kmalloc.h                            | 2 ++
 arch/mips/pnx833x/include/mach/mangle-port.h                        | 2 ++
 arch/mips/pnx833x/include/mach/mc146818rtc.h                        | 2 ++
 .../{include/asm/mach-pnx833x => pnx833x/include/mach}/pnx833x.h    | 0
 arch/mips/pnx833x/include/mach/spaces.h                             | 2 ++
 arch/mips/pnx833x/include/mach/topology.h                           | 2 ++
 arch/mips/pnx833x/include/mach/war.h                                | 2 ++
 arch/mips/pnx833x/stb22x/board.c                                    | 4 ++--
 drivers/watchdog/pnx833x_wdt.c                                      | 2 +-
 21 files changed, 34 insertions(+), 15 deletions(-)
 create mode 100644 arch/mips/pnx833x/include/mach/cpu-feature-overrides.h
 rename arch/mips/{include/asm/mach-pnx833x => pnx833x/include/mach}/gpio.h (99%)
 create mode 100644 arch/mips/pnx833x/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-pnx833x => pnx833x/include/mach}/irq-mapping.h (99%)
 rename arch/mips/{include/asm/mach-pnx833x => pnx833x/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/pnx833x/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/pnx833x/include/mach/kmalloc.h
 create mode 100644 arch/mips/pnx833x/include/mach/mangle-port.h
 create mode 100644 arch/mips/pnx833x/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-pnx833x => pnx833x/include/mach}/pnx833x.h (100%)
 create mode 100644 arch/mips/pnx833x/include/mach/spaces.h
 create mode 100644 arch/mips/pnx833x/include/mach/topology.h
 create mode 100644 arch/mips/pnx833x/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 56d6519..9a149e7 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1386,6 +1386,7 @@ config SOC_PNX833X
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_MIPS16
 	select CPU_MIPSR2_IRQ_VI
+	select HAVE_MACH_HEAD_FILES
 
 config SOC_PNX8335
 	bool
diff --git a/arch/mips/pnx833x/Platform b/arch/mips/pnx833x/Platform
index 2872606..47b905e 100644
--- a/arch/mips/pnx833x/Platform
+++ b/arch/mips/pnx833x/Platform
@@ -1,5 +1,5 @@
 # NXP STB225
 platform-$(CONFIG_SOC_PNX833X)	+= pnx833x/
-cflags-$(CONFIG_SOC_PNX833X)	+= -I$(srctree)/arch/mips/include/asm/mach-pnx833x
+cflags-$(CONFIG_SOC_PNX833X)	+= -I$(srctree)/arch/mips/pnx833x/include
 load-$(CONFIG_NXP_STB220)	+= 0xffffffff80001000
 load-$(CONFIG_NXP_STB225)	+= 0xffffffff80001000
diff --git a/arch/mips/pnx833x/common/interrupts.c b/arch/mips/pnx833x/common/interrupts.c
index 2fbbabc..66f3a03 100644
--- a/arch/mips/pnx833x/common/interrupts.c
+++ b/arch/mips/pnx833x/common/interrupts.c
@@ -13,9 +13,9 @@
 #include <asm/mipsregs.h>
 #include <asm/irq_cpu.h>
 #include <asm/setup.h>
-#include <irq.h>
-#include <irq-mapping.h>
-#include <gpio.h>
+#include <mach/irq.h>
+#include <mach/irq-mapping.h>
+#include <mach/gpio.h>
 
 static int mips_cpu_timer_irq;
 
diff --git a/arch/mips/pnx833x/common/platform.c b/arch/mips/pnx833x/common/platform.c
index 5fa0373..fbaf109 100644
--- a/arch/mips/pnx833x/common/platform.c
+++ b/arch/mips/pnx833x/common/platform.c
@@ -19,9 +19,9 @@
 #include <linux/serial_pnx8xxx.h>
 #include <linux/mtd/platnand.h>
 
-#include <irq.h>
-#include <irq-mapping.h>
-#include <pnx833x.h>
+#include <mach/irq.h>
+#include <mach/irq-mapping.h>
+#include <mach/pnx833x.h>
 
 static u64 uart_dmamask	    = DMA_BIT_MASK(32);
 
diff --git a/arch/mips/pnx833x/common/reset.c b/arch/mips/pnx833x/common/reset.c
index b48e83b..9bd5b2a 100644
--- a/arch/mips/pnx833x/common/reset.c
+++ b/arch/mips/pnx833x/common/reset.c
@@ -10,7 +10,7 @@
  *	Nikita Youshchenko <yoush@debian.org>, based on PNX8550 code.
  */
 #include <linux/reboot.h>
-#include <pnx833x.h>
+#include <mach/pnx833x.h>
 
 void pnx833x_machine_restart(char *command)
 {
diff --git a/arch/mips/pnx833x/common/setup.c b/arch/mips/pnx833x/common/setup.c
index abf68d9..b188c66 100644
--- a/arch/mips/pnx833x/common/setup.c
+++ b/arch/mips/pnx833x/common/setup.c
@@ -15,8 +15,8 @@
 #include <linux/io.h>
 #include <linux/pci.h>
 #include <asm/reboot.h>
-#include <pnx833x.h>
-#include <gpio.h>
+#include <mach/pnx833x.h>
+#include <mach/gpio.h>
 
 extern void pnx833x_board_setup(void);
 extern void pnx833x_machine_restart(char *);
diff --git a/arch/mips/pnx833x/include/mach/cpu-feature-overrides.h b/arch/mips/pnx833x/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/include/asm/mach-pnx833x/gpio.h b/arch/mips/pnx833x/include/mach/gpio.h
similarity index 99%
rename from arch/mips/include/asm/mach-pnx833x/gpio.h
rename to arch/mips/pnx833x/include/mach/gpio.h
index 85b5b8e..c60decb0 100644
--- a/arch/mips/include/asm/mach-pnx833x/gpio.h
+++ b/arch/mips/pnx833x/include/mach/gpio.h
@@ -17,7 +17,7 @@
    - including locking between different uses
 */
 
-#include <asm/mach-pnx833x/pnx833x.h>
+#include <mach/pnx833x.h>
 
 #define SET_REG_BIT(reg, bit)		do { (reg |= (1 << (bit))); } while (0)
 #define CLEAR_REG_BIT(reg, bit)		do { (reg &= ~(1 << (bit))); } while (0)
diff --git a/arch/mips/pnx833x/include/mach/ioremap.h b/arch/mips/pnx833x/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-pnx833x/irq-mapping.h b/arch/mips/pnx833x/include/mach/irq-mapping.h
similarity index 99%
rename from arch/mips/include/asm/mach-pnx833x/irq-mapping.h
rename to arch/mips/pnx833x/include/mach/irq-mapping.h
index 32d8063..ebb2d66 100644
--- a/arch/mips/include/asm/mach-pnx833x/irq-mapping.h
+++ b/arch/mips/pnx833x/include/mach/irq-mapping.h
@@ -24,7 +24,7 @@
  * numbers 65..80 for (virtual) GPIO interrupts.
  *
  */
-#include <irq.h>
+#include <mach/irq.h>
 
 #define PNX833X_TIMER_IRQ				(MIPS_CPU_IRQ_BASE + 7)
 
diff --git a/arch/mips/include/asm/mach-pnx833x/irq.h b/arch/mips/pnx833x/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-pnx833x/irq.h
rename to arch/mips/pnx833x/include/mach/irq.h
diff --git a/arch/mips/pnx833x/include/mach/kernel-entry-init.h b/arch/mips/pnx833x/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/pnx833x/include/mach/kmalloc.h b/arch/mips/pnx833x/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/pnx833x/include/mach/mangle-port.h b/arch/mips/pnx833x/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/pnx833x/include/mach/mc146818rtc.h b/arch/mips/pnx833x/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-pnx833x/pnx833x.h b/arch/mips/pnx833x/include/mach/pnx833x.h
similarity index 100%
rename from arch/mips/include/asm/mach-pnx833x/pnx833x.h
rename to arch/mips/pnx833x/include/mach/pnx833x.h
diff --git a/arch/mips/pnx833x/include/mach/spaces.h b/arch/mips/pnx833x/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/pnx833x/include/mach/topology.h b/arch/mips/pnx833x/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/pnx833x/include/mach/war.h b/arch/mips/pnx833x/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/pnx833x/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/pnx833x/stb22x/board.c b/arch/mips/pnx833x/stb22x/board.c
index 93d8e7b..14c333c 100644
--- a/arch/mips/pnx833x/stb22x/board.c
+++ b/arch/mips/pnx833x/stb22x/board.c
@@ -12,8 +12,8 @@
 #include <linux/init.h>
 #include <asm/bootinfo.h>
 #include <linux/mm.h>
-#include <pnx833x.h>
-#include <gpio.h>
+#include <mach/pnx833x.h>
+#include <mach/gpio.h>
 
 /* endianess twiddlers */
 #define PNX8335_DEBUG0 0x4400
diff --git a/drivers/watchdog/pnx833x_wdt.c b/drivers/watchdog/pnx833x_wdt.c
index 4097d07..18bb8a5 100644
--- a/drivers/watchdog/pnx833x_wdt.c
+++ b/drivers/watchdog/pnx833x_wdt.c
@@ -26,7 +26,7 @@
 #include <linux/notifier.h>
 #include <linux/reboot.h>
 #include <linux/init.h>
-#include <asm/mach-pnx833x/pnx833x.h>
+#include <mach/pnx833x.h>
 
 #define WATCHDOG_TIMEOUT 30		/* 30 sec Maximum timeout */
 #define WATCHDOG_COUNT_FREQUENCY 68000000U /* Watchdog counts at 68MHZ. */
-- 
1.8.3.1

