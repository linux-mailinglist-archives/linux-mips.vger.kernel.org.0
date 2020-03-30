Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 646E21976AE
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgC3IjN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:39:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56894 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729769AbgC3IjM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:39:12 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_94rsIFeMJchAA--.24S2;
        Mon, 30 Mar 2020 16:39:07 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/39] MIPS: bcm47xx: Add header files path prefix
Date:   Mon, 30 Mar 2020 04:39:07 -0400
Message-Id: <1585557547-27640-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dx_94rsIFeMJchAA--.24S2
X-Coremail-Antispam: 1UD129KBjvJXoW3uF1DCF13urWkAFy5Ww1kuFg_yoWkAF4fpa
        nrA3Z5Ka1DuryUJFy5ZFyIvr43Ja98KrWqqa4jga4UZ3W2g3WxJrZakr90y348XF4vq3Wf
        WrWfuw15Xr4vvw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_Cr
        0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
        CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUyEfoUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-bcm47xx
to arch/mips/bcm47xx/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                     | 1 +
 arch/mips/bcm47xx/Platform                                            | 2 +-
 arch/mips/bcm47xx/board.c                                             | 4 ++--
 arch/mips/bcm47xx/buttons.c                                           | 4 ++--
 .../mips/{include/asm/mach-bcm47xx => bcm47xx/include/mach}/bcm47xx.h | 0
 .../asm/mach-bcm47xx => bcm47xx/include/mach}/bcm47xx_board.h         | 0
 .../asm/mach-bcm47xx => bcm47xx/include/mach}/cpu-feature-overrides.h | 0
 arch/mips/bcm47xx/include/mach/ioremap.h                              | 2 ++
 arch/mips/bcm47xx/include/mach/irq.h                                  | 2 ++
 arch/mips/bcm47xx/include/mach/kernel-entry-init.h                    | 2 ++
 arch/mips/bcm47xx/include/mach/kmalloc.h                              | 2 ++
 arch/mips/bcm47xx/include/mach/mangle-port.h                          | 2 ++
 arch/mips/bcm47xx/include/mach/spaces.h                               | 2 ++
 arch/mips/bcm47xx/include/mach/topology.h                             | 2 ++
 arch/mips/bcm47xx/include/mach/war.h                                  | 2 ++
 arch/mips/bcm47xx/irq.c                                               | 2 +-
 arch/mips/bcm47xx/leds.c                                              | 2 +-
 arch/mips/bcm47xx/prom.c                                              | 4 ++--
 arch/mips/bcm47xx/serial.c                                            | 2 +-
 arch/mips/bcm47xx/setup.c                                             | 4 ++--
 arch/mips/bcm47xx/time.c                                              | 4 ++--
 arch/mips/bcm47xx/workarounds.c                                       | 4 ++--
 arch/mips/pci/pci-bcm47xx.c                                           | 2 +-
 drivers/net/wireless/broadcom/b43/bus.c                               | 2 +-
 24 files changed, 35 insertions(+), 18 deletions(-)
 rename arch/mips/{include/asm/mach-bcm47xx => bcm47xx/include/mach}/bcm47xx.h (100%)
 rename arch/mips/{include/asm/mach-bcm47xx => bcm47xx/include/mach}/bcm47xx_board.h (100%)
 rename arch/mips/{include/asm/mach-bcm47xx => bcm47xx/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/bcm47xx/include/mach/ioremap.h
 create mode 100644 arch/mips/bcm47xx/include/mach/irq.h
 create mode 100644 arch/mips/bcm47xx/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/bcm47xx/include/mach/kmalloc.h
 create mode 100644 arch/mips/bcm47xx/include/mach/mangle-port.h
 create mode 100644 arch/mips/bcm47xx/include/mach/spaces.h
 create mode 100644 arch/mips/bcm47xx/include/mach/topology.h
 create mode 100644 arch/mips/bcm47xx/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6915e97..aced6d4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -286,6 +286,7 @@ config BCM47XX
 	select BCM47XX_NVRAM
 	select BCM47XX_SPROM
 	select BCM47XX_SSB if !BCM47XX_BCMA
+	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for BCM47XX based boards
 
diff --git a/arch/mips/bcm47xx/Platform b/arch/mips/bcm47xx/Platform
index 70783b7..6298638 100644
--- a/arch/mips/bcm47xx/Platform
+++ b/arch/mips/bcm47xx/Platform
@@ -3,6 +3,6 @@
 #
 platform-$(CONFIG_BCM47XX)	+= bcm47xx/
 cflags-$(CONFIG_BCM47XX)	+=					\
-		-I$(srctree)/arch/mips/include/asm/mach-bcm47xx
+		-I$(srctree)/arch/mips/bcm47xx/include
 load-$(CONFIG_BCM47XX)		:= 0xffffffff80001000
 zload-$(CONFIG_BCM47XX)		+= 0xffffffff80400000
diff --git a/arch/mips/bcm47xx/board.c b/arch/mips/bcm47xx/board.c
index 35266a7..25a9b09 100644
--- a/arch/mips/bcm47xx/board.c
+++ b/arch/mips/bcm47xx/board.c
@@ -2,8 +2,8 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/string.h>
-#include <bcm47xx.h>
-#include <bcm47xx_board.h>
+#include <mach/bcm47xx.h>
+#include <mach/bcm47xx_board.h>
 
 struct bcm47xx_board_type {
 	const enum bcm47xx_board board;
diff --git a/arch/mips/bcm47xx/buttons.c b/arch/mips/bcm47xx/buttons.c
index 535d84a..6be4f28 100644
--- a/arch/mips/bcm47xx/buttons.c
+++ b/arch/mips/bcm47xx/buttons.c
@@ -4,8 +4,8 @@
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
 #include <linux/interrupt.h>
-#include <bcm47xx_board.h>
-#include <bcm47xx.h>
+#include <mach/bcm47xx_board.h>
+#include <mach/bcm47xx.h>
 
 /**************************************************
  * Database
diff --git a/arch/mips/include/asm/mach-bcm47xx/bcm47xx.h b/arch/mips/bcm47xx/include/mach/bcm47xx.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm47xx/bcm47xx.h
rename to arch/mips/bcm47xx/include/mach/bcm47xx.h
diff --git a/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h b/arch/mips/bcm47xx/include/mach/bcm47xx_board.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
rename to arch/mips/bcm47xx/include/mach/bcm47xx_board.h
diff --git a/arch/mips/include/asm/mach-bcm47xx/cpu-feature-overrides.h b/arch/mips/bcm47xx/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm47xx/cpu-feature-overrides.h
rename to arch/mips/bcm47xx/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/bcm47xx/include/mach/ioremap.h b/arch/mips/bcm47xx/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/bcm47xx/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/bcm47xx/include/mach/irq.h b/arch/mips/bcm47xx/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/bcm47xx/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/bcm47xx/include/mach/kernel-entry-init.h b/arch/mips/bcm47xx/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/bcm47xx/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/bcm47xx/include/mach/kmalloc.h b/arch/mips/bcm47xx/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/bcm47xx/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/bcm47xx/include/mach/mangle-port.h b/arch/mips/bcm47xx/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/bcm47xx/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/bcm47xx/include/mach/spaces.h b/arch/mips/bcm47xx/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/bcm47xx/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/bcm47xx/include/mach/topology.h b/arch/mips/bcm47xx/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/bcm47xx/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/bcm47xx/include/mach/war.h b/arch/mips/bcm47xx/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/bcm47xx/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/bcm47xx/irq.c b/arch/mips/bcm47xx/irq.c
index 21b4497..80fb752 100644
--- a/arch/mips/bcm47xx/irq.c
+++ b/arch/mips/bcm47xx/irq.c
@@ -29,7 +29,7 @@
 #include <linux/irq.h>
 #include <asm/setup.h>
 #include <asm/irq_cpu.h>
-#include <bcm47xx.h>
+#include <mach/bcm47xx.h>
 
 asmlinkage void plat_irq_dispatch(void)
 {
diff --git a/arch/mips/bcm47xx/leds.c b/arch/mips/bcm47xx/leds.c
index 167c42c..e7cce2a 100644
--- a/arch/mips/bcm47xx/leds.c
+++ b/arch/mips/bcm47xx/leds.c
@@ -2,7 +2,7 @@
 #include "bcm47xx_private.h"
 
 #include <linux/leds.h>
-#include <bcm47xx_board.h>
+#include <mach/bcm47xx_board.h>
 
 /**************************************************
  * Database
diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 135a540..1afecfb 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -32,8 +32,8 @@
 #include <linux/ssb/ssb_regs.h>
 #include <linux/smp.h>
 #include <asm/bootinfo.h>
-#include <bcm47xx.h>
-#include <bcm47xx_board.h>
+#include <mach/bcm47xx.h>
+#include <mach/bcm47xx_board.h>
 
 static char bcm47xx_system_type[20] = "Broadcom BCM47XX";
 
diff --git a/arch/mips/bcm47xx/serial.c b/arch/mips/bcm47xx/serial.c
index e3c9872..6179486 100644
--- a/arch/mips/bcm47xx/serial.c
+++ b/arch/mips/bcm47xx/serial.c
@@ -13,7 +13,7 @@
 #include <linux/serial.h>
 #include <linux/serial_8250.h>
 #include <linux/ssb/ssb.h>
-#include <bcm47xx.h>
+#include <mach/bcm47xx.h>
 
 static struct plat_serial8250_port uart8250_data[5];
 
diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index 82627c2..f5b29b5 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -42,8 +42,8 @@
 #include <asm/prom.h>
 #include <asm/reboot.h>
 #include <asm/time.h>
-#include <bcm47xx.h>
-#include <bcm47xx_board.h>
+#include <mach/bcm47xx.h>
+#include <mach/bcm47xx_board.h>
 
 union bcm47xx_bus bcm47xx_bus;
 EXPORT_SYMBOL(bcm47xx_bus);
diff --git a/arch/mips/bcm47xx/time.c b/arch/mips/bcm47xx/time.c
index 74224cf..ae6e38e 100644
--- a/arch/mips/bcm47xx/time.c
+++ b/arch/mips/bcm47xx/time.c
@@ -25,8 +25,8 @@
 #include <linux/init.h>
 #include <linux/ssb/ssb.h>
 #include <asm/time.h>
-#include <bcm47xx.h>
-#include <bcm47xx_board.h>
+#include <mach/bcm47xx.h>
+#include <mach/bcm47xx_board.h>
 
 void __init plat_time_init(void)
 {
diff --git a/arch/mips/bcm47xx/workarounds.c b/arch/mips/bcm47xx/workarounds.c
index 0ab95dd..3daa37c 100644
--- a/arch/mips/bcm47xx/workarounds.c
+++ b/arch/mips/bcm47xx/workarounds.c
@@ -2,8 +2,8 @@
 #include "bcm47xx_private.h"
 
 #include <linux/gpio.h>
-#include <bcm47xx_board.h>
-#include <bcm47xx.h>
+#include <mach/bcm47xx_board.h>
+#include <mach/bcm47xx.h>
 
 static void __init bcm47xx_workarounds_enable_usb_power(int usb_power)
 {
diff --git a/arch/mips/pci/pci-bcm47xx.c b/arch/mips/pci/pci-bcm47xx.c
index 230d7dd..0fb8572 100644
--- a/arch/mips/pci/pci-bcm47xx.c
+++ b/arch/mips/pci/pci-bcm47xx.c
@@ -26,7 +26,7 @@
 #include <linux/pci.h>
 #include <linux/ssb/ssb.h>
 #include <linux/bcma/bcma.h>
-#include <bcm47xx.h>
+#include <mach/bcm47xx.h>
 
 int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 {
diff --git a/drivers/net/wireless/broadcom/b43/bus.c b/drivers/net/wireless/broadcom/b43/bus.c
index fdb1c82..c1442148 100644
--- a/drivers/net/wireless/broadcom/b43/bus.c
+++ b/drivers/net/wireless/broadcom/b43/bus.c
@@ -10,7 +10,7 @@
 */
 
 #ifdef CONFIG_BCM47XX_BCMA
-#include <asm/mach-bcm47xx/bcm47xx.h>
+#include <mach/bcm47xx.h>
 #endif
 
 #include "b43.h"
-- 
1.8.3.1

