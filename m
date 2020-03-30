Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE4101976A7
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729741AbgC3IjC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:39:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56774 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726017AbgC3IjB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:39:01 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2ofsIFeJZchAA--.18S2;
        Mon, 30 Mar 2020 16:38:55 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/39] MIPS: loongson32: Add header files path prefix
Date:   Mon, 30 Mar 2020 04:38:55 -0400
Message-Id: <1585557535-21072-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxr2ofsIFeJZchAA--.18S2
X-Coremail-Antispam: 1UD129KBjvAXoW3Kr1rXw17KF1xXr18ZF1rCrg_yoW8AryDto
        Z2yFnrGr48JFWUJF4jgF45A3yxWFnYqF4ay3yfA398JFZIv3srJFy09rnFqF18Cryxtwnx
        GrWrurW8Xrs7taykn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY07k0a2IF6w4xM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7
        xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
        64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26r
        4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
        CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jDwIDUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-loongson32
to arch/mips/loongson32/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                              |  1 +
 arch/mips/loongson32/Platform                                  |  2 +-
 arch/mips/loongson32/common/irq.c                              |  4 ++--
 arch/mips/loongson32/common/platform.c                         | 10 +++++-----
 arch/mips/loongson32/common/prom.c                             |  2 +-
 arch/mips/loongson32/common/reset.c                            |  2 +-
 arch/mips/loongson32/common/time.c                             |  4 ++--
 arch/mips/loongson32/include/mach/cpu-feature-overrides.h      |  2 ++
 .../asm/mach-loongson32 => loongson32/include/mach}/cpufreq.h  |  0
 .../asm/mach-loongson32 => loongson32/include/mach}/dma.h      |  0
 arch/mips/loongson32/include/mach/ioremap.h                    |  2 ++
 .../asm/mach-loongson32 => loongson32/include/mach}/irq.h      |  0
 arch/mips/loongson32/include/mach/kernel-entry-init.h          |  2 ++
 arch/mips/loongson32/include/mach/kmalloc.h                    |  2 ++
 .../mach-loongson32 => loongson32/include/mach}/loongson1.h    | 10 +++++-----
 arch/mips/loongson32/include/mach/mangle-port.h                |  2 ++
 .../asm/mach-loongson32 => loongson32/include/mach}/nand.h     |  0
 .../asm/mach-loongson32 => loongson32/include/mach}/platform.h |  4 ++--
 .../asm/mach-loongson32 => loongson32/include/mach}/regs-clk.h |  0
 .../asm/mach-loongson32 => loongson32/include/mach}/regs-mux.h |  0
 .../asm/mach-loongson32 => loongson32/include/mach}/regs-pwm.h |  0
 .../asm/mach-loongson32 => loongson32/include/mach}/regs-rtc.h |  0
 .../asm/mach-loongson32 => loongson32/include/mach}/regs-wdt.h |  0
 arch/mips/loongson32/include/mach/spaces.h                     |  2 ++
 arch/mips/loongson32/include/mach/topology.h                   |  2 ++
 arch/mips/loongson32/include/mach/war.h                        |  2 ++
 arch/mips/loongson32/ls1b/board.c                              |  8 ++++----
 arch/mips/loongson32/ls1c/board.c                              |  2 +-
 drivers/clk/loongson1/clk-loongson1b.c                         |  2 +-
 drivers/clk/loongson1/clk-loongson1c.c                         |  2 +-
 drivers/cpufreq/loongson1-cpufreq.c                            |  4 ++--
 drivers/rtc/rtc-ls1x.c                                         |  2 +-
 drivers/watchdog/loongson1_wdt.c                               |  2 +-
 33 files changed, 47 insertions(+), 30 deletions(-)
 create mode 100644 arch/mips/loongson32/include/mach/cpu-feature-overrides.h
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/cpufreq.h (100%)
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/dma.h (100%)
 create mode 100644 arch/mips/loongson32/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/loongson32/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/loongson32/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/loongson1.h (91%)
 create mode 100644 arch/mips/loongson32/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/nand.h (100%)
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/platform.h (95%)
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/regs-clk.h (100%)
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/regs-mux.h (100%)
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/regs-pwm.h (100%)
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/regs-rtc.h (100%)
 rename arch/mips/{include/asm/mach-loongson32 => loongson32/include/mach}/regs-wdt.h (100%)
 create mode 100644 arch/mips/loongson32/include/mach/spaces.h
 create mode 100644 arch/mips/loongson32/include/mach/topology.h
 create mode 100644 arch/mips/loongson32/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8645207..3c38202 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -447,6 +447,7 @@ config LASAT
 config MACH_LOONGSON32
 	bool "Loongson 32-bit family of machines"
 	select SYS_SUPPORTS_ZBOOT
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for the Loongson-1 family of machines.
 
diff --git a/arch/mips/loongson32/Platform b/arch/mips/loongson32/Platform
index 7f8e342..b3f061a 100644
--- a/arch/mips/loongson32/Platform
+++ b/arch/mips/loongson32/Platform
@@ -1,4 +1,4 @@
 cflags-$(CONFIG_CPU_LOONGSON32)		+= -march=mips32r2 -Wa,--trap
 platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
-cflags-$(CONFIG_MACH_LOONGSON32)	+= -I$(srctree)/arch/mips/include/asm/mach-loongson32
+cflags-$(CONFIG_MACH_LOONGSON32)	+= -I$(srctree)/arch/mips/loongson32/include
 load-$(CONFIG_CPU_LOONGSON32)		+= 0xffffffff80200000
diff --git a/arch/mips/loongson32/common/irq.c b/arch/mips/loongson32/common/irq.c
index 9a50070..0e82336 100644
--- a/arch/mips/loongson32/common/irq.c
+++ b/arch/mips/loongson32/common/irq.c
@@ -7,8 +7,8 @@
 #include <linux/irq.h>
 #include <asm/irq_cpu.h>
 
-#include <loongson1.h>
-#include <irq.h>
+#include <mach/loongson1.h>
+#include <mach/irq.h>
 
 #define LS1X_INTC_REG(n, x) \
 		((void __iomem *)KSEG1ADDR(LS1X_INTC_BASE + (n * 0x18) + (x)))
diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
index 794c96c..9a783f8 100644
--- a/arch/mips/loongson32/common/platform.c
+++ b/arch/mips/loongson32/common/platform.c
@@ -13,11 +13,11 @@
 #include <linux/stmmac.h>
 #include <linux/usb/ehci_pdriver.h>
 
-#include <platform.h>
-#include <loongson1.h>
-#include <cpufreq.h>
-#include <dma.h>
-#include <nand.h>
+#include <mach/platform.h>
+#include <mach/loongson1.h>
+#include <mach/cpufreq.h>
+#include <mach/dma.h>
+#include <mach/nand.h>
 
 /* 8250/16550 compatible UART */
 #define LS1X_UART(_id)						\
diff --git a/arch/mips/loongson32/common/prom.c b/arch/mips/loongson32/common/prom.c
index fd76114..9b7dfc6 100644
--- a/arch/mips/loongson32/common/prom.c
+++ b/arch/mips/loongson32/common/prom.c
@@ -11,7 +11,7 @@
 #include <asm/bootinfo.h>
 #include <asm/fw/fw.h>
 
-#include <loongson1.h>
+#include <mach/loongson1.h>
 
 unsigned long memsize;
 
diff --git a/arch/mips/loongson32/common/reset.c b/arch/mips/loongson32/common/reset.c
index 0c7399b..3e44b7f 100644
--- a/arch/mips/loongson32/common/reset.c
+++ b/arch/mips/loongson32/common/reset.c
@@ -9,7 +9,7 @@
 #include <asm/idle.h>
 #include <asm/reboot.h>
 
-#include <loongson1.h>
+#include <mach/loongson1.h>
 
 static void __iomem *wdt_reg_base;
 
diff --git a/arch/mips/loongson32/common/time.c b/arch/mips/loongson32/common/time.c
index 459b15c..7313eaa 100644
--- a/arch/mips/loongson32/common/time.c
+++ b/arch/mips/loongson32/common/time.c
@@ -8,8 +8,8 @@
 #include <linux/sizes.h>
 #include <asm/time.h>
 
-#include <loongson1.h>
-#include <platform.h>
+#include <mach/loongson1.h>
+#include <mach/platform.h>
 
 #ifdef CONFIG_CEVT_CSRC_LS1X
 
diff --git a/arch/mips/loongson32/include/mach/cpu-feature-overrides.h b/arch/mips/loongson32/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/loongson32/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/include/asm/mach-loongson32/cpufreq.h b/arch/mips/loongson32/include/mach/cpufreq.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/cpufreq.h
rename to arch/mips/loongson32/include/mach/cpufreq.h
diff --git a/arch/mips/include/asm/mach-loongson32/dma.h b/arch/mips/loongson32/include/mach/dma.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/dma.h
rename to arch/mips/loongson32/include/mach/dma.h
diff --git a/arch/mips/loongson32/include/mach/ioremap.h b/arch/mips/loongson32/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/loongson32/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-loongson32/irq.h b/arch/mips/loongson32/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/irq.h
rename to arch/mips/loongson32/include/mach/irq.h
diff --git a/arch/mips/loongson32/include/mach/kernel-entry-init.h b/arch/mips/loongson32/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/loongson32/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/loongson32/include/mach/kmalloc.h b/arch/mips/loongson32/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/loongson32/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-loongson32/loongson1.h b/arch/mips/loongson32/include/mach/loongson1.h
similarity index 91%
rename from arch/mips/include/asm/mach-loongson32/loongson1.h
rename to arch/mips/loongson32/include/mach/loongson1.h
index eb3ddbe..8b53f47 100644
--- a/arch/mips/include/asm/mach-loongson32/loongson1.h
+++ b/arch/mips/loongson32/include/mach/loongson1.h
@@ -45,10 +45,10 @@
 #define LS1X_NAND_BASE			0x1fe78000
 #define LS1X_CLK_BASE			0x1fe78030
 
-#include <regs-clk.h>
-#include <regs-mux.h>
-#include <regs-pwm.h>
-#include <regs-rtc.h>
-#include <regs-wdt.h>
+#include <mach/regs-clk.h>
+#include <mach/regs-mux.h>
+#include <mach/regs-pwm.h>
+#include <mach/regs-rtc.h>
+#include <mach/regs-wdt.h>
 
 #endif /* __ASM_MACH_LOONGSON32_LOONGSON1_H */
diff --git a/arch/mips/loongson32/include/mach/mangle-port.h b/arch/mips/loongson32/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/loongson32/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-loongson32/nand.h b/arch/mips/loongson32/include/mach/nand.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/nand.h
rename to arch/mips/loongson32/include/mach/nand.h
diff --git a/arch/mips/include/asm/mach-loongson32/platform.h b/arch/mips/loongson32/include/mach/platform.h
similarity index 95%
rename from arch/mips/include/asm/mach-loongson32/platform.h
rename to arch/mips/loongson32/include/mach/platform.h
index eb83e27..e2f8ac7 100644
--- a/arch/mips/include/asm/mach-loongson32/platform.h
+++ b/arch/mips/loongson32/include/mach/platform.h
@@ -8,8 +8,8 @@
 
 #include <linux/platform_device.h>
 
-#include <dma.h>
-#include <nand.h>
+#include <mach/dma.h>
+#include <mach/nand.h>
 
 extern struct platform_device ls1x_uart_pdev;
 extern struct platform_device ls1x_cpufreq_pdev;
diff --git a/arch/mips/include/asm/mach-loongson32/regs-clk.h b/arch/mips/loongson32/include/mach/regs-clk.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/regs-clk.h
rename to arch/mips/loongson32/include/mach/regs-clk.h
diff --git a/arch/mips/include/asm/mach-loongson32/regs-mux.h b/arch/mips/loongson32/include/mach/regs-mux.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/regs-mux.h
rename to arch/mips/loongson32/include/mach/regs-mux.h
diff --git a/arch/mips/include/asm/mach-loongson32/regs-pwm.h b/arch/mips/loongson32/include/mach/regs-pwm.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/regs-pwm.h
rename to arch/mips/loongson32/include/mach/regs-pwm.h
diff --git a/arch/mips/include/asm/mach-loongson32/regs-rtc.h b/arch/mips/loongson32/include/mach/regs-rtc.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/regs-rtc.h
rename to arch/mips/loongson32/include/mach/regs-rtc.h
diff --git a/arch/mips/include/asm/mach-loongson32/regs-wdt.h b/arch/mips/loongson32/include/mach/regs-wdt.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson32/regs-wdt.h
rename to arch/mips/loongson32/include/mach/regs-wdt.h
diff --git a/arch/mips/loongson32/include/mach/spaces.h b/arch/mips/loongson32/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/loongson32/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/loongson32/include/mach/topology.h b/arch/mips/loongson32/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/loongson32/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/loongson32/include/mach/war.h b/arch/mips/loongson32/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/loongson32/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson32/ls1b/board.c
index 727e067..555449e 100644
--- a/arch/mips/loongson32/ls1b/board.c
+++ b/arch/mips/loongson32/ls1b/board.c
@@ -7,10 +7,10 @@
 #include <linux/mtd/partitions.h>
 #include <linux/sizes.h>
 
-#include <loongson1.h>
-#include <dma.h>
-#include <nand.h>
-#include <platform.h>
+#include <mach/loongson1.h>
+#include <mach/dma.h>
+#include <mach/nand.h>
+#include <mach/platform.h>
 
 static const struct gpio_led ls1x_gpio_leds[] __initconst = {
 	{
diff --git a/arch/mips/loongson32/ls1c/board.c b/arch/mips/loongson32/ls1c/board.c
index e9de6da..481512b 100644
--- a/arch/mips/loongson32/ls1c/board.c
+++ b/arch/mips/loongson32/ls1c/board.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2016 Yang Ling <gnaygnil@gmail.com>
  */
 
-#include <platform.h>
+#include <mach/platform.h>
 
 static struct platform_device *ls1c_platform_devices[] __initdata = {
 	&ls1x_uart_pdev,
diff --git a/drivers/clk/loongson1/clk-loongson1b.c b/drivers/clk/loongson1/clk-loongson1b.c
index 13a2ca2..d590c1e 100644
--- a/drivers/clk/loongson1/clk-loongson1b.c
+++ b/drivers/clk/loongson1/clk-loongson1b.c
@@ -8,7 +8,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 
-#include <loongson1.h>
+#include <mach/loongson1.h>
 #include "clk.h"
 
 #define OSC		(33 * 1000000)
diff --git a/drivers/clk/loongson1/clk-loongson1c.c b/drivers/clk/loongson1/clk-loongson1c.c
index 703f876..c58c3ad 100644
--- a/drivers/clk/loongson1/clk-loongson1c.c
+++ b/drivers/clk/loongson1/clk-loongson1c.c
@@ -7,7 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 
-#include <loongson1.h>
+#include <mach/loongson1.h>
 #include "clk.h"
 
 #define OSC		(24 * 1000000)
diff --git a/drivers/cpufreq/loongson1-cpufreq.c b/drivers/cpufreq/loongson1-cpufreq.c
index 0ea8877..3de842e 100644
--- a/drivers/cpufreq/loongson1-cpufreq.c
+++ b/drivers/cpufreq/loongson1-cpufreq.c
@@ -18,8 +18,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include <cpufreq.h>
-#include <loongson1.h>
+#include <mach/cpufreq.h>
+#include <mach/loongson1.h>
 
 struct ls1x_cpufreq {
 	struct device *dev;
diff --git a/drivers/rtc/rtc-ls1x.c b/drivers/rtc/rtc-ls1x.c
index 8bd3405..4d9128b 100644
--- a/drivers/rtc/rtc-ls1x.c
+++ b/drivers/rtc/rtc-ls1x.c
@@ -13,7 +13,7 @@
 #include <linux/delay.h>
 #include <linux/types.h>
 #include <linux/io.h>
-#include <loongson1.h>
+#include <mach/loongson1.h>
 
 #define LS1X_RTC_REG_OFFSET	(LS1X_RTC_BASE + 0x20)
 #define LS1X_RTC_REGS(x) \
diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
index bb3d075c..fd6ef37 100644
--- a/drivers/watchdog/loongson1_wdt.c
+++ b/drivers/watchdog/loongson1_wdt.c
@@ -7,7 +7,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
-#include <loongson1.h>
+#include <mach/loongson1.h>
 
 #define DEFAULT_HEARTBEAT	30
 
-- 
1.8.3.1

