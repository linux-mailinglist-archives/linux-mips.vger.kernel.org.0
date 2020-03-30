Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBCA8197739
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbgC3I7s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:59:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33488 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729897AbgC3I7s (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:59:48 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL2j+tIFeN5khAA--.15S2;
        Mon, 30 Mar 2020 16:59:42 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 23/39] MIPS: lantiq: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:59:42 -0400
Message-Id: <1585558782-24357-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxL2j+tIFeN5khAA--.15S2
X-Coremail-Antispam: 1UD129KBjvAXoWftw13tw4rZFykXry5XFWkZwb_yoW5WF4UXo
        WxtF17Wr1vqFW7JF13WFW7Ca4xZwn2qrs5Xa4aq39rtF97A39Fyr1v9w1jyF15CryxtwsF
        k3y5Z34rXr95KFykn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY07k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
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

For lantiq falcon platform, remove header files from directory
arch/mips/include/asm/mach-lantiq/falcon to
arch/mips/lantiq/falcon/include/mach

For lantiq xway platform, remove header files from directory
arch/mips/include/asm/mach-lantiq/xway to
arch/mips/lantiq/xway/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                   | 1 +
 arch/mips/lantiq/Platform                                           | 5 ++---
 arch/mips/lantiq/clk.c                                              | 2 +-
 arch/mips/lantiq/early_printk.c                                     | 2 +-
 .../falcon => lantiq/falcon/include/mach}/cpu-feature-overrides.h   | 0
 .../mach-lantiq/falcon => lantiq/falcon/include/mach}/falcon_irq.h  | 0
 arch/mips/lantiq/falcon/include/mach/ioremap.h                      | 2 ++
 .../asm/mach-lantiq/falcon => lantiq/falcon/include/mach}/irq.h     | 0
 arch/mips/lantiq/falcon/include/mach/kernel-entry-init.h            | 2 ++
 arch/mips/lantiq/falcon/include/mach/kmalloc.h                      | 2 ++
 .../asm/mach-lantiq => lantiq/falcon/include/mach}/lantiq.h         | 0
 .../mach-lantiq => lantiq/falcon/include/mach}/lantiq_platform.h    | 0
 .../mach-lantiq/falcon => lantiq/falcon/include/mach}/lantiq_soc.h  | 0
 arch/mips/lantiq/falcon/include/mach/mangle-port.h                  | 2 ++
 arch/mips/lantiq/falcon/include/mach/mc146818rtc.h                  | 2 ++
 arch/mips/lantiq/falcon/include/mach/spaces.h                       | 2 ++
 arch/mips/lantiq/falcon/include/mach/topology.h                     | 2 ++
 arch/mips/lantiq/falcon/include/mach/war.h                          | 2 ++
 arch/mips/lantiq/falcon/prom.c                                      | 2 +-
 arch/mips/lantiq/falcon/reset.c                                     | 2 +-
 arch/mips/lantiq/falcon/sysctrl.c                                   | 2 +-
 arch/mips/lantiq/irq.c                                              | 4 ++--
 arch/mips/lantiq/prom.c                                             | 2 +-
 arch/mips/lantiq/xway/clk.c                                         | 2 +-
 arch/mips/lantiq/xway/dcdc.c                                        | 2 +-
 arch/mips/lantiq/xway/dma.c                                         | 4 ++--
 arch/mips/lantiq/xway/gptu.c                                        | 2 +-
 arch/mips/lantiq/xway/include/mach/cpu-feature-overrides.h          | 2 ++
 arch/mips/lantiq/xway/include/mach/ioremap.h                        | 2 ++
 .../asm/mach-lantiq/xway => lantiq/xway/include/mach}/irq.h         | 2 +-
 arch/mips/lantiq/xway/include/mach/kernel-entry-init.h              | 2 ++
 arch/mips/lantiq/xway/include/mach/kmalloc.h                        | 2 ++
 .../{include/asm/mach-lantiq => lantiq/xway/include/mach}/lantiq.h  | 0
 .../asm/mach-lantiq/xway => lantiq/xway/include/mach}/lantiq_irq.h  | 0
 .../asm/mach-lantiq => lantiq/xway/include/mach}/lantiq_platform.h  | 0
 .../asm/mach-lantiq/xway => lantiq/xway/include/mach}/lantiq_soc.h  | 2 +-
 arch/mips/lantiq/xway/include/mach/mangle-port.h                    | 2 ++
 arch/mips/lantiq/xway/include/mach/mc146818rtc.h                    | 2 ++
 arch/mips/lantiq/xway/include/mach/spaces.h                         | 2 ++
 arch/mips/lantiq/xway/include/mach/topology.h                       | 2 ++
 arch/mips/lantiq/xway/include/mach/war.h                            | 2 ++
 .../asm/mach-lantiq/xway => lantiq/xway/include/mach}/xway_dma.h    | 0
 arch/mips/lantiq/xway/prom.c                                        | 2 +-
 arch/mips/lantiq/xway/sysctrl.c                                     | 2 +-
 arch/mips/lantiq/xway/vmmc.c                                        | 2 +-
 arch/mips/pci/ops-lantiq.c                                          | 2 +-
 arch/mips/pci/pci-lantiq.c                                          | 4 ++--
 drivers/gpio/gpio-mm-lantiq.c                                       | 2 +-
 drivers/hwmon/ltq-cputemp.c                                         | 2 +-
 drivers/mtd/maps/lantiq-flash.c                                     | 2 +-
 drivers/mtd/nand/raw/xway_nand.c                                    | 2 +-
 drivers/net/ethernet/lantiq_etop.c                                  | 6 +++---
 drivers/pinctrl/pinctrl-falcon.c                                    | 2 +-
 drivers/pinctrl/pinctrl-xway.c                                      | 2 +-
 drivers/soc/lantiq/fpi-bus.c                                        | 2 +-
 drivers/spi/spi-falcon.c                                            | 2 +-
 drivers/spi/spi-lantiq-ssc.c                                        | 2 +-
 drivers/watchdog/lantiq_wdt.c                                       | 2 +-
 include/linux/lantiq.h                                              | 2 +-
 59 files changed, 72 insertions(+), 38 deletions(-)
 rename arch/mips/{include/asm/mach-lantiq/falcon => lantiq/falcon/include/mach}/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-lantiq/falcon => lantiq/falcon/include/mach}/falcon_irq.h (100%)
 create mode 100644 arch/mips/lantiq/falcon/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-lantiq/falcon => lantiq/falcon/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/lantiq/falcon/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/lantiq/falcon/include/mach/kmalloc.h
 copy arch/mips/{include/asm/mach-lantiq => lantiq/falcon/include/mach}/lantiq.h (100%)
 copy arch/mips/{include/asm/mach-lantiq => lantiq/falcon/include/mach}/lantiq_platform.h (100%)
 rename arch/mips/{include/asm/mach-lantiq/falcon => lantiq/falcon/include/mach}/lantiq_soc.h (100%)
 create mode 100644 arch/mips/lantiq/falcon/include/mach/mangle-port.h
 create mode 100644 arch/mips/lantiq/falcon/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/lantiq/falcon/include/mach/spaces.h
 create mode 100644 arch/mips/lantiq/falcon/include/mach/topology.h
 create mode 100644 arch/mips/lantiq/falcon/include/mach/war.h
 create mode 100644 arch/mips/lantiq/xway/include/mach/cpu-feature-overrides.h
 create mode 100644 arch/mips/lantiq/xway/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-lantiq/xway => lantiq/xway/include/mach}/irq.h (88%)
 create mode 100644 arch/mips/lantiq/xway/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/lantiq/xway/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-lantiq => lantiq/xway/include/mach}/lantiq.h (100%)
 rename arch/mips/{include/asm/mach-lantiq/xway => lantiq/xway/include/mach}/lantiq_irq.h (100%)
 rename arch/mips/{include/asm/mach-lantiq => lantiq/xway/include/mach}/lantiq_platform.h (100%)
 rename arch/mips/{include/asm/mach-lantiq/xway => lantiq/xway/include/mach}/lantiq_soc.h (99%)
 create mode 100644 arch/mips/lantiq/xway/include/mach/mangle-port.h
 create mode 100644 arch/mips/lantiq/xway/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/lantiq/xway/include/mach/spaces.h
 create mode 100644 arch/mips/lantiq/xway/include/mach/topology.h
 create mode 100644 arch/mips/lantiq/xway/include/mach/war.h
 rename arch/mips/{include/asm/mach-lantiq/xway => lantiq/xway/include/mach}/xway_dma.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6a6d2e2..738863fc 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -437,6 +437,7 @@ config LANTIQ
 	select PINCTRL_LANTIQ
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
+	select HAVE_MACH_HEAD_FILES
 
 config LASAT
 	bool "LASAT Networks platforms"
diff --git a/arch/mips/lantiq/Platform b/arch/mips/lantiq/Platform
index b3ec498..3434d85 100644
--- a/arch/mips/lantiq/Platform
+++ b/arch/mips/lantiq/Platform
@@ -3,7 +3,6 @@
 #
 
 platform-$(CONFIG_LANTIQ)	+= lantiq/
-cflags-$(CONFIG_LANTIQ)		+= -I$(srctree)/arch/mips/include/asm/mach-lantiq
 load-$(CONFIG_LANTIQ)		= 0xffffffff80002000
-cflags-$(CONFIG_SOC_TYPE_XWAY)	+= -I$(srctree)/arch/mips/include/asm/mach-lantiq/xway
-cflags-$(CONFIG_SOC_FALCON)	+= -I$(srctree)/arch/mips/include/asm/mach-lantiq/falcon
+cflags-$(CONFIG_SOC_TYPE_XWAY)	+= -I$(srctree)/arch/mips/lantiq/xway/include
+cflags-$(CONFIG_SOC_FALCON)	+= -I$(srctree)/arch/mips/lantiq/falcon/include
diff --git a/arch/mips/lantiq/clk.c b/arch/mips/lantiq/clk.c
index dd819e3..8c715fb 100644
--- a/arch/mips/lantiq/clk.c
+++ b/arch/mips/lantiq/clk.c
@@ -18,7 +18,7 @@
 #include <asm/irq.h>
 #include <asm/div64.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #include "clk.h"
 #include "prom.h"
diff --git a/arch/mips/lantiq/early_printk.c b/arch/mips/lantiq/early_printk.c
index 4e4a28b..94c8641 100644
--- a/arch/mips/lantiq/early_printk.c
+++ b/arch/mips/lantiq/early_printk.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/cpu.h>
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 #include <asm/setup.h>
 
 #define ASC_BUF		1024
diff --git a/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h b/arch/mips/lantiq/falcon/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h
rename to arch/mips/lantiq/falcon/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-lantiq/falcon/falcon_irq.h b/arch/mips/lantiq/falcon/include/mach/falcon_irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-lantiq/falcon/falcon_irq.h
rename to arch/mips/lantiq/falcon/include/mach/falcon_irq.h
diff --git a/arch/mips/lantiq/falcon/include/mach/ioremap.h b/arch/mips/lantiq/falcon/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/lantiq/falcon/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-lantiq/falcon/irq.h b/arch/mips/lantiq/falcon/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-lantiq/falcon/irq.h
rename to arch/mips/lantiq/falcon/include/mach/irq.h
diff --git a/arch/mips/lantiq/falcon/include/mach/kernel-entry-init.h b/arch/mips/lantiq/falcon/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/lantiq/falcon/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/lantiq/falcon/include/mach/kmalloc.h b/arch/mips/lantiq/falcon/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/lantiq/falcon/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-lantiq/lantiq.h b/arch/mips/lantiq/falcon/include/mach/lantiq.h
similarity index 100%
copy from arch/mips/include/asm/mach-lantiq/lantiq.h
copy to arch/mips/lantiq/falcon/include/mach/lantiq.h
diff --git a/arch/mips/include/asm/mach-lantiq/lantiq_platform.h b/arch/mips/lantiq/falcon/include/mach/lantiq_platform.h
similarity index 100%
copy from arch/mips/include/asm/mach-lantiq/lantiq_platform.h
copy to arch/mips/lantiq/falcon/include/mach/lantiq_platform.h
diff --git a/arch/mips/include/asm/mach-lantiq/falcon/lantiq_soc.h b/arch/mips/lantiq/falcon/include/mach/lantiq_soc.h
similarity index 100%
rename from arch/mips/include/asm/mach-lantiq/falcon/lantiq_soc.h
rename to arch/mips/lantiq/falcon/include/mach/lantiq_soc.h
diff --git a/arch/mips/lantiq/falcon/include/mach/mangle-port.h b/arch/mips/lantiq/falcon/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/lantiq/falcon/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/lantiq/falcon/include/mach/mc146818rtc.h b/arch/mips/lantiq/falcon/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/lantiq/falcon/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/lantiq/falcon/include/mach/spaces.h b/arch/mips/lantiq/falcon/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/lantiq/falcon/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/lantiq/falcon/include/mach/topology.h b/arch/mips/lantiq/falcon/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/lantiq/falcon/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/lantiq/falcon/include/mach/war.h b/arch/mips/lantiq/falcon/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/lantiq/falcon/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/lantiq/falcon/prom.c b/arch/mips/lantiq/falcon/prom.c
index 7b98def..7df6fd4 100644
--- a/arch/mips/lantiq/falcon/prom.c
+++ b/arch/mips/lantiq/falcon/prom.c
@@ -10,7 +10,7 @@
 #include <asm/traps.h>
 #include <asm/io.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #include "../prom.h"
 
diff --git a/arch/mips/lantiq/falcon/reset.c b/arch/mips/lantiq/falcon/reset.c
index 261996c..e9a3048 100644
--- a/arch/mips/lantiq/falcon/reset.c
+++ b/arch/mips/lantiq/falcon/reset.c
@@ -11,7 +11,7 @@
 #include <asm/reboot.h>
 #include <linux/export.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 /*
  * Dummy implementation.  Used to allow platform code to find out what
diff --git a/arch/mips/lantiq/falcon/sysctrl.c b/arch/mips/lantiq/falcon/sysctrl.c
index 42222f8..0c6e1c1 100644
--- a/arch/mips/lantiq/falcon/sysctrl.c
+++ b/arch/mips/lantiq/falcon/sysctrl.c
@@ -11,7 +11,7 @@
 #include <linux/of_address.h>
 #include <asm/delay.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #include "../clk.h"
 
diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index df8eed3..934d773 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -16,8 +16,8 @@
 #include <asm/bootinfo.h>
 #include <asm/irq_cpu.h>
 
-#include <lantiq_soc.h>
-#include <irq.h>
+#include <mach/lantiq_soc.h>
+#include <mach/irq.h>
 
 /* register definitions - internal irqs */
 #define LTQ_ICU_ISR		0x0000
diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 51a218f..e40e781 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -13,7 +13,7 @@
 #include <asm/time.h>
 #include <asm/prom.h>
 
-#include <lantiq.h>
+#include <mach/lantiq.h>
 
 #include "prom.h"
 #include "clk.h"
diff --git a/arch/mips/lantiq/xway/clk.c b/arch/mips/lantiq/xway/clk.c
index 47ad214..b5f93e9 100644
--- a/arch/mips/lantiq/xway/clk.c
+++ b/arch/mips/lantiq/xway/clk.c
@@ -13,7 +13,7 @@
 #include <asm/irq.h>
 #include <asm/div64.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #include "../clk.h"
 
diff --git a/arch/mips/lantiq/xway/dcdc.c b/arch/mips/lantiq/xway/dcdc.c
index 4960bee..65b3d9b 100644
--- a/arch/mips/lantiq/xway/dcdc.c
+++ b/arch/mips/lantiq/xway/dcdc.c
@@ -8,7 +8,7 @@
 #include <linux/ioport.h>
 #include <linux/of_platform.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 /* Bias and regulator Setup Register */
 #define DCDC_BIAS_VREG0	0xa
diff --git a/arch/mips/lantiq/xway/dma.c b/arch/mips/lantiq/xway/dma.c
index aeb1b98..1e66592 100644
--- a/arch/mips/lantiq/xway/dma.c
+++ b/arch/mips/lantiq/xway/dma.c
@@ -13,8 +13,8 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 
-#include <lantiq_soc.h>
-#include <xway_dma.h>
+#include <mach/lantiq_soc.h>
+#include <mach/xway_dma.h>
 
 #define LTQ_DMA_ID		0x08
 #define LTQ_DMA_CTRL		0x10
diff --git a/arch/mips/lantiq/xway/gptu.c b/arch/mips/lantiq/xway/gptu.c
index 3d5683e..f57f6f3 100644
--- a/arch/mips/lantiq/xway/gptu.c
+++ b/arch/mips/lantiq/xway/gptu.c
@@ -11,7 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_irq.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 #include "../clk.h"
 
 /* the magic ID byte of the core */
diff --git a/arch/mips/lantiq/xway/include/mach/cpu-feature-overrides.h b/arch/mips/lantiq/xway/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/lantiq/xway/include/mach/ioremap.h b/arch/mips/lantiq/xway/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-lantiq/xway/irq.h b/arch/mips/lantiq/xway/include/mach/irq.h
similarity index 88%
rename from arch/mips/include/asm/mach-lantiq/xway/irq.h
rename to arch/mips/lantiq/xway/include/mach/irq.h
index 2980e77..6b1e6e4 100644
--- a/arch/mips/include/asm/mach-lantiq/xway/irq.h
+++ b/arch/mips/lantiq/xway/include/mach/irq.h
@@ -7,7 +7,7 @@
 #ifndef __LANTIQ_IRQ_H
 #define __LANTIQ_IRQ_H
 
-#include <lantiq_irq.h>
+#include <mach/lantiq_irq.h>
 
 #define NR_IRQS 256
 
diff --git a/arch/mips/lantiq/xway/include/mach/kernel-entry-init.h b/arch/mips/lantiq/xway/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/lantiq/xway/include/mach/kmalloc.h b/arch/mips/lantiq/xway/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-lantiq/lantiq.h b/arch/mips/lantiq/xway/include/mach/lantiq.h
similarity index 100%
rename from arch/mips/include/asm/mach-lantiq/lantiq.h
rename to arch/mips/lantiq/xway/include/mach/lantiq.h
diff --git a/arch/mips/include/asm/mach-lantiq/xway/lantiq_irq.h b/arch/mips/lantiq/xway/include/mach/lantiq_irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-lantiq/xway/lantiq_irq.h
rename to arch/mips/lantiq/xway/include/mach/lantiq_irq.h
diff --git a/arch/mips/include/asm/mach-lantiq/lantiq_platform.h b/arch/mips/lantiq/xway/include/mach/lantiq_platform.h
similarity index 100%
rename from arch/mips/include/asm/mach-lantiq/lantiq_platform.h
rename to arch/mips/lantiq/xway/include/mach/lantiq_platform.h
diff --git a/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h b/arch/mips/lantiq/xway/include/mach/lantiq_soc.h
similarity index 99%
rename from arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
rename to arch/mips/lantiq/xway/include/mach/lantiq_soc.h
index 4790cfa..45ad252 100644
--- a/arch/mips/include/asm/mach-lantiq/xway/lantiq_soc.h
+++ b/arch/mips/lantiq/xway/include/mach/lantiq_soc.h
@@ -9,7 +9,7 @@
 
 #ifdef CONFIG_SOC_TYPE_XWAY
 
-#include <lantiq.h>
+#include <mach/lantiq.h>
 
 /* Chip IDs */
 #define SOC_ID_DANUBE1		0x129
diff --git a/arch/mips/lantiq/xway/include/mach/mangle-port.h b/arch/mips/lantiq/xway/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/lantiq/xway/include/mach/mc146818rtc.h b/arch/mips/lantiq/xway/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/lantiq/xway/include/mach/spaces.h b/arch/mips/lantiq/xway/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/lantiq/xway/include/mach/topology.h b/arch/mips/lantiq/xway/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/lantiq/xway/include/mach/war.h b/arch/mips/lantiq/xway/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/lantiq/xway/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/include/asm/mach-lantiq/xway/xway_dma.h b/arch/mips/lantiq/xway/include/mach/xway_dma.h
similarity index 100%
rename from arch/mips/include/asm/mach-lantiq/xway/xway_dma.h
rename to arch/mips/lantiq/xway/include/mach/xway_dma.h
diff --git a/arch/mips/lantiq/xway/prom.c b/arch/mips/lantiq/xway/prom.c
index 5446197..33166ae 100644
--- a/arch/mips/lantiq/xway/prom.c
+++ b/arch/mips/lantiq/xway/prom.c
@@ -10,7 +10,7 @@
 #include <asm/bootinfo.h>
 #include <asm/time.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #include "../prom.h"
 
diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index aa37545..3aec430 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -13,7 +13,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #include "../clk.h"
 #include "../prom.h"
diff --git a/arch/mips/lantiq/xway/vmmc.c b/arch/mips/lantiq/xway/vmmc.c
index 7a14da8..9f64e0b 100644
--- a/arch/mips/lantiq/xway/vmmc.c
+++ b/arch/mips/lantiq/xway/vmmc.c
@@ -9,7 +9,7 @@
 #include <linux/of_gpio.h>
 #include <linux/dma-mapping.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 static unsigned int *cp1_base;
 
diff --git a/arch/mips/pci/ops-lantiq.c b/arch/mips/pci/ops-lantiq.c
index 7d71355..f695431 100644
--- a/arch/mips/pci/ops-lantiq.c
+++ b/arch/mips/pci/ops-lantiq.c
@@ -12,7 +12,7 @@
 #include <asm/addrspace.h>
 #include <linux/vmalloc.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #include "pci-lantiq.h"
 
diff --git a/arch/mips/pci/pci-lantiq.c b/arch/mips/pci/pci-lantiq.c
index 1ca42f4..c1faecb 100644
--- a/arch/mips/pci/pci-lantiq.c
+++ b/arch/mips/pci/pci-lantiq.c
@@ -19,8 +19,8 @@
 
 #include <asm/addrspace.h>
 
-#include <lantiq_soc.h>
-#include <lantiq_irq.h>
+#include <mach/lantiq_soc.h>
+#include <mach/lantiq_irq.h>
 
 #include "pci-lantiq.h"
 
diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index f460d71..4e153d3 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -15,7 +15,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 /*
  * By attaching hardware latches to the EBU it is possible to create output
diff --git a/drivers/hwmon/ltq-cputemp.c b/drivers/hwmon/ltq-cputemp.c
index 019e770..327c5e1 100644
--- a/drivers/hwmon/ltq-cputemp.c
+++ b/drivers/hwmon/ltq-cputemp.c
@@ -12,7 +12,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 /* gphy1 configuration register contains cpu temperature */
 #define CGU_GPHY1_CR   0x0040
diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 67a1dbf..9b0c3a5 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -19,7 +19,7 @@
 #include <linux/mtd/physmap.h>
 #include <linux/of.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 /*
  * The NOR flash is connected to the same external bus unit (EBU) as PCI.
diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 834f794..5bdeea2 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -9,7 +9,7 @@
 #include <linux/of_gpio.h>
 #include <linux/of_platform.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 /* nand registers */
 #define EBU_ADDSEL1		0x24
diff --git a/drivers/net/ethernet/lantiq_etop.c b/drivers/net/ethernet/lantiq_etop.c
index 2d0c52f..bae1c1e 100644
--- a/drivers/net/ethernet/lantiq_etop.c
+++ b/drivers/net/ethernet/lantiq_etop.c
@@ -28,9 +28,9 @@
 
 #include <asm/checksum.h>
 
-#include <lantiq_soc.h>
-#include <xway_dma.h>
-#include <lantiq_platform.h>
+#include <mach/lantiq_soc.h>
+#include <mach/xway_dma.h>
+#include <mach/lantiq_platform.h>
 
 #define LTQ_ETOP_MDIO		0x11804
 #define MDIO_REQUEST		0x80000000
diff --git a/drivers/pinctrl/pinctrl-falcon.c b/drivers/pinctrl/pinctrl-falcon.c
index a454f57..f7e66b1 100644
--- a/drivers/pinctrl/pinctrl-falcon.c
+++ b/drivers/pinctrl/pinctrl-falcon.c
@@ -21,7 +21,7 @@
 
 #include "pinctrl-lantiq.h"
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 /* Multiplexer Control Register */
 #define LTQ_PADC_MUX(x)         (x * 0x4)
diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 5e3f31b..cb7f92e 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -20,7 +20,7 @@
 
 #include "pinctrl-lantiq.h"
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 /* we have up to 4 banks of 16 bit each */
 #define PINS			16
diff --git a/drivers/soc/lantiq/fpi-bus.c b/drivers/soc/lantiq/fpi-bus.c
index dff1375..1d3f3d7 100644
--- a/drivers/soc/lantiq/fpi-bus.c
+++ b/drivers/soc/lantiq/fpi-bus.c
@@ -16,7 +16,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #define XBAR_ALWAYS_LAST	0x430
 #define XBAR_FPI_BURST_EN	BIT(1)
diff --git a/drivers/spi/spi-falcon.c b/drivers/spi/spi-falcon.c
index d3336a6..572b01d 100644
--- a/drivers/spi/spi-falcon.c
+++ b/drivers/spi/spi-falcon.c
@@ -12,7 +12,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #define DRV_NAME		"sflash-falcon"
 
diff --git a/drivers/spi/spi-lantiq-ssc.c b/drivers/spi/spi-lantiq-ssc.c
index 1fd7ee5..ad3c0b4 100644
--- a/drivers/spi/spi-lantiq-ssc.c
+++ b/drivers/spi/spi-lantiq-ssc.c
@@ -20,7 +20,7 @@
 #include <linux/spi/spi.h>
 
 #ifdef CONFIG_LANTIQ
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 #endif
 
 #define LTQ_SPI_RX_IRQ_NAME	"spi_rx"
diff --git a/drivers/watchdog/lantiq_wdt.c b/drivers/watchdog/lantiq_wdt.c
index 6fab504..f9c1850 100644
--- a/drivers/watchdog/lantiq_wdt.c
+++ b/drivers/watchdog/lantiq_wdt.c
@@ -16,7 +16,7 @@
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 
 #define LTQ_XRX_RCU_RST_STAT		0x0014
 #define LTQ_XRX_RCU_RST_STAT_WDT	BIT(31)
diff --git a/include/linux/lantiq.h b/include/linux/lantiq.h
index 6792116..1a9103f 100644
--- a/include/linux/lantiq.h
+++ b/include/linux/lantiq.h
@@ -4,7 +4,7 @@
 #define __LINUX_LANTIQ_H
 
 #ifdef CONFIG_LANTIQ
-#include <lantiq_soc.h>
+#include <mach/lantiq_soc.h>
 #else
 
 #ifndef LTQ_EARLY_ASC
-- 
1.8.3.1

