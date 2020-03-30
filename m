Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89CF619774E
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgC3JAu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33912 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729816AbgC3JAt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:49 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX2o8tYFeCZohAA--.38S2;
        Mon, 30 Mar 2020 17:00:45 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 33/39] MIPS: ralink: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:44 -0400
Message-Id: <1585558844-14320-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxX2o8tYFeCZohAA--.38S2
X-Coremail-Antispam: 1UD129KBjvAXoWfJF48uFWDKF43Gr1xZw47urg_yoW8CFyxZo
        Z7tFn7Kr4fJFW7JFy3ZFy3Aay8Zr92qFWrXw15XrZ8GasrZ3srJw1F9w4jqF15Gr1ftw17
        GrWrZryUXryfKaykn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYe7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjc
        xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr
        0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
        1lIxAIcVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY
        6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU59iSJUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-ralink
to arch/mips/ralink/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                          |  1 +
 arch/mips/pci/pci-mt7620.c                                 |  4 ++--
 arch/mips/pci/pci-rt3883.c                                 |  4 ++--
 arch/mips/ralink/Platform                                  |  7 +------
 arch/mips/ralink/cevt-rt3352.c                             |  2 +-
 arch/mips/ralink/ill_acc.c                                 |  2 +-
 arch/mips/ralink/include/mach/cpu-feature-overrides.h      | 14 ++++++++++++++
 arch/mips/ralink/include/mach/ide.h                        |  2 ++
 arch/mips/ralink/include/mach/ioremap.h                    |  2 ++
 .../{include/asm/mach-ralink => ralink/include/mach}/irq.h |  0
 arch/mips/ralink/include/mach/kernel-entry-init.h          |  2 ++
 arch/mips/ralink/include/mach/kmalloc.h                    |  2 ++
 arch/mips/ralink/include/mach/mangle-port.h                |  2 ++
 arch/mips/ralink/include/mach/mc146818rtc.h                |  2 ++
 .../asm/mach-ralink => ralink/include/mach}/mt7620.h       |  0
 .../include/mach}/mt7620/cpu-feature-overrides.h           |  0
 .../asm/mach-ralink => ralink/include/mach}/mt7621.h       |  0
 .../include/mach}/mt7621/cpu-feature-overrides.h           |  0
 .../asm/mach-ralink => ralink/include/mach}/pinmux.h       |  0
 .../asm/mach-ralink => ralink/include/mach}/ralink_regs.h  |  0
 .../asm/mach-ralink => ralink/include/mach}/rt288x.h       |  0
 .../include/mach}/rt288x/cpu-feature-overrides.h           |  0
 .../asm/mach-ralink => ralink/include/mach}/rt305x.h       |  0
 .../include/mach}/rt305x/cpu-feature-overrides.h           |  0
 .../asm/mach-ralink => ralink/include/mach}/rt3883.h       |  0
 .../include/mach}/rt3883/cpu-feature-overrides.h           |  0
 arch/mips/ralink/include/mach/spaces.h                     |  2 ++
 arch/mips/ralink/include/mach/topology.h                   |  2 ++
 arch/mips/ralink/include/mach/war.h                        |  2 ++
 arch/mips/ralink/mt7620.c                                  |  6 +++---
 arch/mips/ralink/mt7621.c                                  |  4 ++--
 arch/mips/ralink/prom.c                                    |  2 +-
 arch/mips/ralink/reset.c                                   |  2 +-
 arch/mips/ralink/rt288x.c                                  |  6 +++---
 arch/mips/ralink/rt305x.c                                  |  6 +++---
 arch/mips/ralink/rt3883.c                                  |  6 +++---
 arch/mips/ralink/timer.c                                   |  2 +-
 37 files changed, 57 insertions(+), 29 deletions(-)
 create mode 100644 arch/mips/ralink/include/mach/cpu-feature-overrides.h
 create mode 100644 arch/mips/ralink/include/mach/ide.h
 create mode 100644 arch/mips/ralink/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/ralink/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/ralink/include/mach/kmalloc.h
 create mode 100644 arch/mips/ralink/include/mach/mangle-port.h
 create mode 100644 arch/mips/ralink/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/mt7620.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/mt7620/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/mt7621.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/mt7621/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/pinmux.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/ralink_regs.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/rt288x.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/rt288x/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/rt305x.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/rt305x/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/rt3883.h (100%)
 rename arch/mips/{include/asm/mach-ralink => ralink/include/mach}/rt3883/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/ralink/include/mach/spaces.h
 create mode 100644 arch/mips/ralink/include/mach/topology.h
 create mode 100644 arch/mips/ralink/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 7a4ff6c..0687b94 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -682,6 +682,7 @@ config RALINK
 	select CLKDEV_LOOKUP
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
+	select HAVE_MACH_HEAD_FILES
 
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
diff --git a/arch/mips/pci/pci-mt7620.c b/arch/mips/pci/pci-mt7620.c
index d360616..1fe6829 100644
--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -18,8 +18,8 @@
 #include <linux/reset.h>
 #include <linux/platform_device.h>
 
-#include <asm/mach-ralink/ralink_regs.h>
-#include <asm/mach-ralink/mt7620.h>
+#include <mach/ralink_regs.h>
+#include <mach/mt7620.h>
 
 #define RALINK_PCI_IO_MAP_BASE		0x10160000
 #define RALINK_PCI_MEMORY_BASE		0x0
diff --git a/arch/mips/pci/pci-rt3883.c b/arch/mips/pci/pci-rt3883.c
index 0ac6346..241cbe9 100644
--- a/arch/mips/pci/pci-rt3883.c
+++ b/arch/mips/pci/pci-rt3883.c
@@ -18,8 +18,8 @@
 #include <linux/of_pci.h>
 #include <linux/platform_device.h>
 
-#include <asm/mach-ralink/rt3883.h>
-#include <asm/mach-ralink/ralink_regs.h>
+#include <mach/rt3883.h>
+#include <mach/ralink_regs.h>
 
 #define RT3883_MEMORY_BASE		0x00000000
 #define RT3883_MEMORY_SIZE		0x02000000
diff --git a/arch/mips/ralink/Platform b/arch/mips/ralink/Platform
index 6095fcc..35e8b1b 100644
--- a/arch/mips/ralink/Platform
+++ b/arch/mips/ralink/Platform
@@ -2,33 +2,28 @@
 # Ralink SoC common stuff
 #
 core-$(CONFIG_RALINK)		+= arch/mips/ralink/
-cflags-$(CONFIG_RALINK)		+= -I$(srctree)/arch/mips/include/asm/mach-ralink
+cflags-$(CONFIG_RALINK)		+= -I$(srctree)/arch/mips/ralink/include
 
 #
 # Ralink RT288x
 #
 load-$(CONFIG_SOC_RT288X)	+= 0xffffffff88000000
-cflags-$(CONFIG_SOC_RT288X)	+= -I$(srctree)/arch/mips/include/asm/mach-ralink/rt288x
 
 #
 # Ralink RT305x
 #
 load-$(CONFIG_SOC_RT305X)	+= 0xffffffff80000000
-cflags-$(CONFIG_SOC_RT305X)	+= -I$(srctree)/arch/mips/include/asm/mach-ralink/rt305x
 
 #
 # Ralink RT3883
 #
 load-$(CONFIG_SOC_RT3883)	+= 0xffffffff80000000
-cflags-$(CONFIG_SOC_RT3883)	+= -I$(srctree)/arch/mips/include/asm/mach-ralink/rt3883
 
 #
 # Ralink MT7620
 #
 load-$(CONFIG_SOC_MT7620)	+= 0xffffffff80000000
-cflags-$(CONFIG_SOC_MT7620)	+= -I$(srctree)/arch/mips/include/asm/mach-ralink/mt7620
 
 # Ralink MT7621
 #
 load-$(CONFIG_SOC_MT7621)	+= 0xffffffff80001000
-cflags-$(CONFIG_SOC_MT7621)	+= -I$(srctree)/arch/mips/include/asm/mach-ralink/mt7621
diff --git a/arch/mips/ralink/cevt-rt3352.c b/arch/mips/ralink/cevt-rt3352.c
index 269d4877..1522581 100644
--- a/arch/mips/ralink/cevt-rt3352.c
+++ b/arch/mips/ralink/cevt-rt3352.c
@@ -16,7 +16,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 
-#include <asm/mach-ralink/ralink_regs.h>
+#include <mach/ralink_regs.h>
 
 #define SYSTICK_FREQ		(50 * 1000)
 
diff --git a/arch/mips/ralink/ill_acc.c b/arch/mips/ralink/ill_acc.c
index bdf5380..43948e9 100644
--- a/arch/mips/ralink/ill_acc.c
+++ b/arch/mips/ralink/ill_acc.c
@@ -8,7 +8,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_irq.h>
 
-#include <asm/mach-ralink/ralink_regs.h>
+#include <mach/ralink_regs.h>
 
 #define REG_ILL_ACC_ADDR	0x10
 #define REG_ILL_ACC_TYPE	0x14
diff --git a/arch/mips/ralink/include/mach/cpu-feature-overrides.h b/arch/mips/ralink/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..2a1c986
--- /dev/null
+++ b/arch/mips/ralink/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifdef CONFIG_SOC_RT288X
+#include <mach/rt288x/cpu-feature-overrides.h>
+#elif defined(CONFIG_SOC_RT305X)
+#include <mach/rt305x/cpu-feature-overrides.h>
+#elif defined(CONFIG_SOC_RT3883)
+#include <mach/rt3883/cpu-feature-overrides.h>
+#elif defined(CONFIG_SOC_MT7620)
+#include <mach/mt7620/cpu-feature-overrides.h>
+#elif defined(CONFIG_SOC_MT7621)
+#include <mach/mt7621/cpu-feature-overrides.h>
+#else
+#include <asm/mach-generic/cpu-feature-overrides.h>
+#endif
diff --git a/arch/mips/ralink/include/mach/ide.h b/arch/mips/ralink/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/ralink/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/ralink/include/mach/ioremap.h b/arch/mips/ralink/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/ralink/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-ralink/irq.h b/arch/mips/ralink/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/irq.h
rename to arch/mips/ralink/include/mach/irq.h
diff --git a/arch/mips/ralink/include/mach/kernel-entry-init.h b/arch/mips/ralink/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/ralink/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/ralink/include/mach/kmalloc.h b/arch/mips/ralink/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/ralink/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/ralink/include/mach/mangle-port.h b/arch/mips/ralink/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/ralink/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/ralink/include/mach/mc146818rtc.h b/arch/mips/ralink/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/ralink/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-ralink/mt7620.h b/arch/mips/ralink/include/mach/mt7620.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/mt7620.h
rename to arch/mips/ralink/include/mach/mt7620.h
diff --git a/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h b/arch/mips/ralink/include/mach/mt7620/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h
rename to arch/mips/ralink/include/mach/mt7620/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-ralink/mt7621.h b/arch/mips/ralink/include/mach/mt7621.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/mt7621.h
rename to arch/mips/ralink/include/mach/mt7621.h
diff --git a/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h b/arch/mips/ralink/include/mach/mt7621/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h
rename to arch/mips/ralink/include/mach/mt7621/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-ralink/pinmux.h b/arch/mips/ralink/include/mach/pinmux.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/pinmux.h
rename to arch/mips/ralink/include/mach/pinmux.h
diff --git a/arch/mips/include/asm/mach-ralink/ralink_regs.h b/arch/mips/ralink/include/mach/ralink_regs.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/ralink_regs.h
rename to arch/mips/ralink/include/mach/ralink_regs.h
diff --git a/arch/mips/include/asm/mach-ralink/rt288x.h b/arch/mips/ralink/include/mach/rt288x.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/rt288x.h
rename to arch/mips/ralink/include/mach/rt288x.h
diff --git a/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h b/arch/mips/ralink/include/mach/rt288x/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h
rename to arch/mips/ralink/include/mach/rt288x/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-ralink/rt305x.h b/arch/mips/ralink/include/mach/rt305x.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/rt305x.h
rename to arch/mips/ralink/include/mach/rt305x.h
diff --git a/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h b/arch/mips/ralink/include/mach/rt305x/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h
rename to arch/mips/ralink/include/mach/rt305x/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-ralink/rt3883.h b/arch/mips/ralink/include/mach/rt3883.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/rt3883.h
rename to arch/mips/ralink/include/mach/rt3883.h
diff --git a/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h b/arch/mips/ralink/include/mach/rt3883/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h
rename to arch/mips/ralink/include/mach/rt3883/cpu-feature-overrides.h
diff --git a/arch/mips/ralink/include/mach/spaces.h b/arch/mips/ralink/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/ralink/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/ralink/include/mach/topology.h b/arch/mips/ralink/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/ralink/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/ralink/include/mach/war.h b/arch/mips/ralink/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/ralink/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/ralink/mt7620.c b/arch/mips/ralink/mt7620.c
index fcf0100..0b911f8 100644
--- a/arch/mips/ralink/mt7620.c
+++ b/arch/mips/ralink/mt7620.c
@@ -13,9 +13,9 @@
 #include <linux/bug.h>
 
 #include <asm/mipsregs.h>
-#include <asm/mach-ralink/ralink_regs.h>
-#include <asm/mach-ralink/mt7620.h>
-#include <asm/mach-ralink/pinmux.h>
+#include <mach/ralink_regs.h>
+#include <mach/mt7620.h>
+#include <mach/pinmux.h>
 
 #include "common.h"
 
diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index 0accb80..b9f68c6 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -13,8 +13,8 @@
 #include <asm/mipsregs.h>
 #include <asm/smp-ops.h>
 #include <asm/mips-cps.h>
-#include <asm/mach-ralink/ralink_regs.h>
-#include <asm/mach-ralink/mt7621.h>
+#include <mach/ralink_regs.h>
+#include <mach/mt7621.h>
 
 #include <pinmux.h>
 
diff --git a/arch/mips/ralink/prom.c b/arch/mips/ralink/prom.c
index 02e7878..9672735 100644
--- a/arch/mips/ralink/prom.c
+++ b/arch/mips/ralink/prom.c
@@ -13,7 +13,7 @@
 #include <asm/bootinfo.h>
 #include <asm/addrspace.h>
 
-#include <asm/mach-ralink/ralink_regs.h>
+#include <mach/ralink_regs.h>
 
 #include "common.h"
 
diff --git a/arch/mips/ralink/reset.c b/arch/mips/ralink/reset.c
index 8126f12..40ed566 100644
--- a/arch/mips/ralink/reset.c
+++ b/arch/mips/ralink/reset.c
@@ -14,7 +14,7 @@
 
 #include <asm/reboot.h>
 
-#include <asm/mach-ralink/ralink_regs.h>
+#include <mach/ralink_regs.h>
 
 /* Reset Control */
 #define SYSC_REG_RESET_CTRL	0x034
diff --git a/arch/mips/ralink/rt288x.c b/arch/mips/ralink/rt288x.c
index 3f09689..f92a8791 100644
--- a/arch/mips/ralink/rt288x.c
+++ b/arch/mips/ralink/rt288x.c
@@ -12,9 +12,9 @@
 #include <linux/init.h>
 
 #include <asm/mipsregs.h>
-#include <asm/mach-ralink/ralink_regs.h>
-#include <asm/mach-ralink/rt288x.h>
-#include <asm/mach-ralink/pinmux.h>
+#include <mach/ralink_regs.h>
+#include <mach/rt288x.h>
+#include <mach/pinmux.h>
 
 #include "common.h"
 
diff --git a/arch/mips/ralink/rt305x.c b/arch/mips/ralink/rt305x.c
index 496f966..a4cba53 100644
--- a/arch/mips/ralink/rt305x.c
+++ b/arch/mips/ralink/rt305x.c
@@ -14,9 +14,9 @@
 
 #include <asm/io.h>
 #include <asm/mipsregs.h>
-#include <asm/mach-ralink/ralink_regs.h>
-#include <asm/mach-ralink/rt305x.h>
-#include <asm/mach-ralink/pinmux.h>
+#include <mach/ralink_regs.h>
+#include <mach/rt305x.h>
+#include <mach/pinmux.h>
 
 #include "common.h"
 
diff --git a/arch/mips/ralink/rt3883.c b/arch/mips/ralink/rt3883.c
index 8f3fe31..61786c5 100644
--- a/arch/mips/ralink/rt3883.c
+++ b/arch/mips/ralink/rt3883.c
@@ -12,9 +12,9 @@
 #include <linux/init.h>
 
 #include <asm/mipsregs.h>
-#include <asm/mach-ralink/ralink_regs.h>
-#include <asm/mach-ralink/rt3883.h>
-#include <asm/mach-ralink/pinmux.h>
+#include <mach/ralink_regs.h>
+#include <mach/rt3883.h>
+#include <mach/pinmux.h>
 
 #include "common.h"
 
diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
index 652424d..e8d42c3 100644
--- a/arch/mips/ralink/timer.c
+++ b/arch/mips/ralink/timer.c
@@ -12,7 +12,7 @@
 #include <linux/of_gpio.h>
 #include <linux/clk.h>
 
-#include <asm/mach-ralink/ralink_regs.h>
+#include <mach/ralink_regs.h>
 
 #define TIMER_REG_TMRSTAT		0x00
 #define TIMER_REG_TMR0LOAD		0x10
-- 
1.8.3.1

