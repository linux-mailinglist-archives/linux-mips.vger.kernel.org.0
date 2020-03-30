Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCCE19774C
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgC3JAn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33882 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729816AbgC3JAm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:42 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxfes2tYFeB5ohAA--.28S2;
        Mon, 30 Mar 2020 17:00:38 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 32/39] MIPS: rb532: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:38 -0400
Message-Id: <1585558838-12570-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxfes2tYFeB5ohAA--.28S2
X-Coremail-Antispam: 1UD129KBjv3XoW7WryDtFyktw1DJoXrpr43ur47pa1DAa1kGr
        4Uur1jkF15ZrW7Kr43Jan8ury5KFWF9347Z3Waq3WUJrs3Jrn0yryktF4DKFy09rW3XF4D
        Ja1qvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy29KBjDU0x
        BIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF
        04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1V
        AKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvE
        c7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2js
        IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
        5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx
        8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k20xvY0x0E
        wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
        80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
        I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6x
        AIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
        c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUgTKuUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-rc32434
to arch/mips/rb532/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                        |  1 +
 arch/mips/pci/fixup-rc32434.c                            |  4 ++--
 arch/mips/pci/ops-rc32434.c                              |  4 ++--
 arch/mips/pci/pci-rc32434.c                              |  4 ++--
 arch/mips/rb532/Platform                                 |  2 +-
 arch/mips/rb532/devices.c                                | 16 ++++++++--------
 arch/mips/rb532/gpio.c                                   |  4 ++--
 .../include/mach}/cpu-feature-overrides.h                |  0
 .../asm/mach-rc32434 => rb532/include/mach}/ddr.h        |  2 +-
 .../asm/mach-rc32434 => rb532/include/mach}/dma.h        |  2 +-
 .../asm/mach-rc32434 => rb532/include/mach}/dma_v.h      |  4 ++--
 .../asm/mach-rc32434 => rb532/include/mach}/eth.h        |  0
 .../asm/mach-rc32434 => rb532/include/mach}/gpio.h       |  0
 arch/mips/rb532/include/mach/ide.h                       |  2 ++
 .../asm/mach-rc32434 => rb532/include/mach}/integ.h      |  2 +-
 arch/mips/rb532/include/mach/ioremap.h                   |  2 ++
 .../asm/mach-rc32434 => rb532/include/mach}/irq.h        |  2 +-
 arch/mips/rb532/include/mach/kernel-entry-init.h         |  2 ++
 arch/mips/rb532/include/mach/kmalloc.h                   |  2 ++
 arch/mips/rb532/include/mach/mangle-port.h               |  2 ++
 arch/mips/rb532/include/mach/mc146818rtc.h               |  2 ++
 .../asm/mach-rc32434 => rb532/include/mach}/pci.h        |  0
 .../asm/mach-rc32434 => rb532/include/mach}/prom.h       |  0
 .../asm/mach-rc32434 => rb532/include/mach}/rb.h         |  0
 .../asm/mach-rc32434 => rb532/include/mach}/rc32434.h    |  0
 arch/mips/rb532/include/mach/spaces.h                    |  2 ++
 .../asm/mach-rc32434 => rb532/include/mach}/timer.h      |  2 +-
 arch/mips/rb532/include/mach/topology.h                  |  2 ++
 .../asm/mach-rc32434 => rb532/include/mach}/war.h        |  0
 arch/mips/rb532/irq.c                                    |  4 ++--
 arch/mips/rb532/prom.c                                   |  4 ++--
 arch/mips/rb532/serial.c                                 |  2 +-
 arch/mips/rb532/setup.c                                  |  4 ++--
 arch/mips/rb532/time.c                                   |  2 +-
 drivers/ata/pata_rb532_cf.c                              |  2 +-
 drivers/input/misc/rb532_button.c                        |  4 ++--
 drivers/leds/leds-rb532.c                                |  4 ++--
 drivers/net/ethernet/korina.c                            |  8 ++++----
 drivers/watchdog/rc32434_wdt.c                           |  2 +-
 39 files changed, 59 insertions(+), 42 deletions(-)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/ddr.h (99%)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/dma.h (98%)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/dma_v.h (93%)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/eth.h (100%)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/gpio.h (100%)
 create mode 100644 arch/mips/rb532/include/mach/ide.h
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/integ.h (98%)
 create mode 100644 arch/mips/rb532/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/irq.h (96%)
 create mode 100644 arch/mips/rb532/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/rb532/include/mach/kmalloc.h
 create mode 100644 arch/mips/rb532/include/mach/mangle-port.h
 create mode 100644 arch/mips/rb532/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/pci.h (100%)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/prom.h (100%)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/rb.h (100%)
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/rc32434.h (100%)
 create mode 100644 arch/mips/rb532/include/mach/spaces.h
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/timer.h (98%)
 create mode 100644 arch/mips/rb532/include/mach/topology.h
 rename arch/mips/{include/asm/mach-rc32434 => rb532/include/mach}/war.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 30b520c..7a4ff6c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -981,6 +981,7 @@ config MIKROTIK_RB532
 	select BOOT_RAW
 	select GPIOLIB
 	select MIPS_L1_CACHE_SHIFT_4
+	select HAVE_MACH_HEAD_FILES
 	help
 	  Support the Mikrotik(tm) RouterBoard 532 series,
 	  based on the IDT RC32434 SoC.
diff --git a/arch/mips/pci/fixup-rc32434.c b/arch/mips/pci/fixup-rc32434.c
index 7fcafd5..c1334b5 100644
--- a/arch/mips/pci/fixup-rc32434.c
+++ b/arch/mips/pci/fixup-rc32434.c
@@ -28,8 +28,8 @@
 #include <linux/pci.h>
 #include <linux/kernel.h>
 
-#include <asm/mach-rc32434/rc32434.h>
-#include <asm/mach-rc32434/irq.h>
+#include <mach/rc32434.h>
+#include <mach/irq.h>
 
 static int irq_map[2][12] = {
 	{0, 0, 2, 3, 2, 3, 0, 0, 0, 0, 0, 1},
diff --git a/arch/mips/pci/ops-rc32434.c b/arch/mips/pci/ops-rc32434.c
index 874ed6d..8a1fe0e 100644
--- a/arch/mips/pci/ops-rc32434.c
+++ b/arch/mips/pci/ops-rc32434.c
@@ -31,8 +31,8 @@
 #include <linux/types.h>
 
 #include <asm/cpu.h>
-#include <asm/mach-rc32434/rc32434.h>
-#include <asm/mach-rc32434/pci.h>
+#include <mach/rc32434.h>
+#include <mach/pci.h>
 
 #define PCI_ACCESS_READ	 0
 #define PCI_ACCESS_WRITE 1
diff --git a/arch/mips/pci/pci-rc32434.c b/arch/mips/pci/pci-rc32434.c
index 7f6ce6d..6cda27d 100644
--- a/arch/mips/pci/pci-rc32434.c
+++ b/arch/mips/pci/pci-rc32434.c
@@ -30,8 +30,8 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 
-#include <asm/mach-rc32434/rc32434.h>
-#include <asm/mach-rc32434/pci.h>
+#include <mach/rc32434.h>
+#include <mach/pci.h>
 
 #define PCI_ACCESS_READ	 0
 #define PCI_ACCESS_WRITE 1
diff --git a/arch/mips/rb532/Platform b/arch/mips/rb532/Platform
index aeec45a..20bd9db 100644
--- a/arch/mips/rb532/Platform
+++ b/arch/mips/rb532/Platform
@@ -3,5 +3,5 @@
 #
 platform-$(CONFIG_MIKROTIK_RB532)	+= rb532/
 cflags-$(CONFIG_MIKROTIK_RB532)		+=				\
-		-I$(srctree)/arch/mips/include/asm/mach-rc32434
+		-I$(srctree)/arch/mips/rb532/include
 load-$(CONFIG_MIKROTIK_RB532)		+= 0xffffffff80101000
diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index dd34f1b..5b2694b 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -21,14 +21,14 @@
 
 #include <asm/bootinfo.h>
 
-#include <asm/mach-rc32434/rc32434.h>
-#include <asm/mach-rc32434/dma.h>
-#include <asm/mach-rc32434/dma_v.h>
-#include <asm/mach-rc32434/eth.h>
-#include <asm/mach-rc32434/rb.h>
-#include <asm/mach-rc32434/integ.h>
-#include <asm/mach-rc32434/gpio.h>
-#include <asm/mach-rc32434/irq.h>
+#include <mach/rc32434.h>
+#include <mach/dma.h>
+#include <mach/dma_v.h>
+#include <mach/eth.h>
+#include <mach/rb.h>
+#include <mach/integ.h>
+#include <mach/gpio.h>
+#include <mach/irq.h>
 
 #define ETH0_RX_DMA_ADDR  (DMA0_BASE_ADDR + 0 * DMA_CHAN_OFFSET)
 #define ETH0_TX_DMA_ADDR  (DMA0_BASE_ADDR + 1 * DMA_CHAN_OFFSET)
diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index 94f02ad..0225d42 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -34,8 +34,8 @@
 #include <linux/platform_device.h>
 #include <linux/gpio/driver.h>
 
-#include <asm/mach-rc32434/rb.h>
-#include <asm/mach-rc32434/gpio.h>
+#include <mach/rb.h>
+#include <mach/gpio.h>
 
 struct rb532_gpio_chip {
 	struct gpio_chip chip;
diff --git a/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h b/arch/mips/rb532/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h
rename to arch/mips/rb532/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-rc32434/ddr.h b/arch/mips/rb532/include/mach/ddr.h
similarity index 99%
rename from arch/mips/include/asm/mach-rc32434/ddr.h
rename to arch/mips/rb532/include/mach/ddr.h
index e1cad0c..c24b2b5 100644
--- a/arch/mips/include/asm/mach-rc32434/ddr.h
+++ b/arch/mips/rb532/include/mach/ddr.h
@@ -29,7 +29,7 @@
 #ifndef _ASM_RC32434_DDR_H_
 #define _ASM_RC32434_DDR_H_
 
-#include <asm/mach-rc32434/rb.h>
+#include <mach/rb.h>
 
 /* DDR register structure */
 struct ddr_ram {
diff --git a/arch/mips/include/asm/mach-rc32434/dma.h b/arch/mips/rb532/include/mach/dma.h
similarity index 98%
rename from arch/mips/include/asm/mach-rc32434/dma.h
rename to arch/mips/rb532/include/mach/dma.h
index 44dc87b..e4ef0c3 100644
--- a/arch/mips/include/asm/mach-rc32434/dma.h
+++ b/arch/mips/rb532/include/mach/dma.h
@@ -12,7 +12,7 @@
 #ifndef __ASM_RC32434_DMA_H
 #define __ASM_RC32434_DMA_H
 
-#include <asm/mach-rc32434/rb.h>
+#include <mach/rb.h>
 
 #define DMA0_BASE_ADDR			0x18040000
 
diff --git a/arch/mips/include/asm/mach-rc32434/dma_v.h b/arch/mips/rb532/include/mach/dma_v.h
similarity index 93%
rename from arch/mips/include/asm/mach-rc32434/dma_v.h
rename to arch/mips/rb532/include/mach/dma_v.h
index 37d73b9..d675fb1 100644
--- a/arch/mips/include/asm/mach-rc32434/dma_v.h
+++ b/arch/mips/rb532/include/mach/dma_v.h
@@ -12,8 +12,8 @@
 #ifndef _ASM_RC32434_DMA_V_H_
 #define _ASM_RC32434_DMA_V_H_
 
-#include  <asm/mach-rc32434/dma.h>
-#include  <asm/mach-rc32434/rc32434.h>
+#include  <mach/dma.h>
+#include  <mach/rc32434.h>
 
 #define DMA_CHAN_OFFSET		0x14
 #define IS_DMA_USED(X)		(((X) & \
diff --git a/arch/mips/include/asm/mach-rc32434/eth.h b/arch/mips/rb532/include/mach/eth.h
similarity index 100%
rename from arch/mips/include/asm/mach-rc32434/eth.h
rename to arch/mips/rb532/include/mach/eth.h
diff --git a/arch/mips/include/asm/mach-rc32434/gpio.h b/arch/mips/rb532/include/mach/gpio.h
similarity index 100%
rename from arch/mips/include/asm/mach-rc32434/gpio.h
rename to arch/mips/rb532/include/mach/gpio.h
diff --git a/arch/mips/rb532/include/mach/ide.h b/arch/mips/rb532/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/rb532/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/include/asm/mach-rc32434/integ.h b/arch/mips/rb532/include/mach/integ.h
similarity index 98%
rename from arch/mips/include/asm/mach-rc32434/integ.h
rename to arch/mips/rb532/include/mach/integ.h
index fa65bc3..b270514 100644
--- a/arch/mips/include/asm/mach-rc32434/integ.h
+++ b/arch/mips/rb532/include/mach/integ.h
@@ -29,7 +29,7 @@
 #ifndef __RC32434_INTEG_H__
 #define __RC32434_INTEG_H__
 
-#include <asm/mach-rc32434/rb.h>
+#include <mach/rb.h>
 
 #define INTEG0_BASE_ADDR	0x18030030
 
diff --git a/arch/mips/rb532/include/mach/ioremap.h b/arch/mips/rb532/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/rb532/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-rc32434/irq.h b/arch/mips/rb532/include/mach/irq.h
similarity index 96%
rename from arch/mips/include/asm/mach-rc32434/irq.h
rename to arch/mips/rb532/include/mach/irq.h
index ebe32bd..e1902b4 100644
--- a/arch/mips/include/asm/mach-rc32434/irq.h
+++ b/arch/mips/rb532/include/mach/irq.h
@@ -5,7 +5,7 @@
 #define NR_IRQS 256
 
 #include <asm/mach-generic/irq.h>
-#include <asm/mach-rc32434/rb.h>
+#include <mach/rb.h>
 
 /* Interrupt Controller */
 #define IC_GROUP0_PEND		(REGBASE + 0x38000)
diff --git a/arch/mips/rb532/include/mach/kernel-entry-init.h b/arch/mips/rb532/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/rb532/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/rb532/include/mach/kmalloc.h b/arch/mips/rb532/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/rb532/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/rb532/include/mach/mangle-port.h b/arch/mips/rb532/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/rb532/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/rb532/include/mach/mc146818rtc.h b/arch/mips/rb532/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/rb532/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-rc32434/pci.h b/arch/mips/rb532/include/mach/pci.h
similarity index 100%
rename from arch/mips/include/asm/mach-rc32434/pci.h
rename to arch/mips/rb532/include/mach/pci.h
diff --git a/arch/mips/include/asm/mach-rc32434/prom.h b/arch/mips/rb532/include/mach/prom.h
similarity index 100%
rename from arch/mips/include/asm/mach-rc32434/prom.h
rename to arch/mips/rb532/include/mach/prom.h
diff --git a/arch/mips/include/asm/mach-rc32434/rb.h b/arch/mips/rb532/include/mach/rb.h
similarity index 100%
rename from arch/mips/include/asm/mach-rc32434/rb.h
rename to arch/mips/rb532/include/mach/rb.h
diff --git a/arch/mips/include/asm/mach-rc32434/rc32434.h b/arch/mips/rb532/include/mach/rc32434.h
similarity index 100%
rename from arch/mips/include/asm/mach-rc32434/rc32434.h
rename to arch/mips/rb532/include/mach/rc32434.h
diff --git a/arch/mips/rb532/include/mach/spaces.h b/arch/mips/rb532/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/rb532/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/include/asm/mach-rc32434/timer.h b/arch/mips/rb532/include/mach/timer.h
similarity index 98%
rename from arch/mips/include/asm/mach-rc32434/timer.h
rename to arch/mips/rb532/include/mach/timer.h
index cda26bb9..f4f1500 100644
--- a/arch/mips/include/asm/mach-rc32434/timer.h
+++ b/arch/mips/rb532/include/mach/timer.h
@@ -29,7 +29,7 @@
 #ifndef __ASM_RC32434_TIMER_H
 #define __ASM_RC32434_TIMER_H
 
-#include <asm/mach-rc32434/rb.h>
+#include <mach/rb.h>
 
 #define TIMER0_BASE_ADDR		0x18028000
 #define TIMER_COUNT			3
diff --git a/arch/mips/rb532/include/mach/topology.h b/arch/mips/rb532/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/rb532/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-rc32434/war.h b/arch/mips/rb532/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-rc32434/war.h
rename to arch/mips/rb532/include/mach/war.h
diff --git a/arch/mips/rb532/irq.c b/arch/mips/rb532/irq.c
index 25cc250..7a2af1c 100644
--- a/arch/mips/rb532/irq.c
+++ b/arch/mips/rb532/irq.c
@@ -42,8 +42,8 @@
 #include <asm/time.h>
 #include <asm/mipsregs.h>
 
-#include <asm/mach-rc32434/irq.h>
-#include <asm/mach-rc32434/gpio.h>
+#include <mach/irq.h>
+#include <mach/gpio.h>
 
 struct intr_group {
 	u32 mask;	/* mask of valid bits in pending/mask registers */
diff --git a/arch/mips/rb532/prom.c b/arch/mips/rb532/prom.c
index 303cc3d..6c4755e 100644
--- a/arch/mips/rb532/prom.c
+++ b/arch/mips/rb532/prom.c
@@ -19,8 +19,8 @@
 #include <linux/blkdev.h>
 
 #include <asm/bootinfo.h>
-#include <asm/mach-rc32434/ddr.h>
-#include <asm/mach-rc32434/prom.h>
+#include <mach/ddr.h>
+#include <mach/prom.h>
 
 unsigned int idt_cpu_freq = 132000000;
 EXPORT_SYMBOL(idt_cpu_freq);
diff --git a/arch/mips/rb532/serial.c b/arch/mips/rb532/serial.c
index 7048254..8af04a1 100644
--- a/arch/mips/rb532/serial.c
+++ b/arch/mips/rb532/serial.c
@@ -32,7 +32,7 @@
 #include <linux/irq.h>
 
 #include <asm/serial.h>
-#include <asm/mach-rc32434/rb.h>
+#include <mach/rb.h>
 
 extern unsigned int idt_cpu_freq;
 
diff --git a/arch/mips/rb532/setup.c b/arch/mips/rb532/setup.c
index 51af9d3..d8f7b0b 100644
--- a/arch/mips/rb532/setup.c
+++ b/arch/mips/rb532/setup.c
@@ -11,8 +11,8 @@
 #include <asm/time.h>
 #include <linux/ioport.h>
 
-#include <asm/mach-rc32434/rb.h>
-#include <asm/mach-rc32434/pci.h>
+#include <mach/rb.h>
+#include <mach/pci.h>
 
 struct pci_reg __iomem *pci_reg;
 EXPORT_SYMBOL(pci_reg);
diff --git a/arch/mips/rb532/time.c b/arch/mips/rb532/time.c
index 68713dd..0ccb5414 100644
--- a/arch/mips/rb532/time.c
+++ b/arch/mips/rb532/time.c
@@ -17,7 +17,7 @@
 
 #include <asm/mipsregs.h>
 #include <asm/time.h>
-#include <asm/mach-rc32434/rc32434.h>
+#include <mach/rc32434.h>
 
 extern unsigned int idt_cpu_freq;
 
diff --git a/drivers/ata/pata_rb532_cf.c b/drivers/ata/pata_rb532_cf.c
index 479c4b2..90ba838 100644
--- a/drivers/ata/pata_rb532_cf.c
+++ b/drivers/ata/pata_rb532_cf.c
@@ -28,7 +28,7 @@
 #include <linux/libata.h>
 #include <scsi/scsi_host.h>
 
-#include <asm/mach-rc32434/rb.h>
+#include <mach/rb.h>
 
 #define DRV_NAME	"pata-rb532-cf"
 #define DRV_VERSION	"0.1.0"
diff --git a/drivers/input/misc/rb532_button.c b/drivers/input/misc/rb532_button.c
index 190a80e..5d2f2f0 100644
--- a/drivers/input/misc/rb532_button.c
+++ b/drivers/input/misc/rb532_button.c
@@ -10,8 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 
-#include <asm/mach-rc32434/gpio.h>
-#include <asm/mach-rc32434/rb.h>
+#include <mach/gpio.h>
+#include <mach/rb.h>
 
 #define DRV_NAME "rb532-button"
 
diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
index b6447c1..413ef32 100644
--- a/drivers/leds/leds-rb532.c
+++ b/drivers/leds/leds-rb532.c
@@ -13,8 +13,8 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include <asm/mach-rc32434/gpio.h>
-#include <asm/mach-rc32434/rb.h>
+#include <mach/gpio.h>
+#include <mach/rb.h>
 
 static void rb532_led_set(struct led_classdev *cdev,
 			  enum led_brightness brightness)
diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index f1d8492..b3ee4c8 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -60,10 +60,10 @@
 #include <asm/io.h>
 #include <asm/dma.h>
 
-#include <asm/mach-rc32434/rb.h>
-#include <asm/mach-rc32434/rc32434.h>
-#include <asm/mach-rc32434/eth.h>
-#include <asm/mach-rc32434/dma_v.h>
+#include <mach/rb.h>
+#include <mach/rc32434.h>
+#include <mach/eth.h>
+#include <mach/dma_v.h>
 
 #define DRV_NAME	"korina"
 #define DRV_VERSION	"0.20"
diff --git a/drivers/watchdog/rc32434_wdt.c b/drivers/watchdog/rc32434_wdt.c
index aee3c2e..555bab4 100644
--- a/drivers/watchdog/rc32434_wdt.c
+++ b/drivers/watchdog/rc32434_wdt.c
@@ -28,7 +28,7 @@
 #include <linux/uaccess.h>		/* For copy_to_user/put_user/... */
 #include <linux/io.h>			/* For devm_ioremap */
 
-#include <asm/mach-rc32434/integ.h>	/* For the Watchdog registers */
+#include <mach/integ.h>	/* For the Watchdog registers */
 
 #define VERSION "1.0"
 
-- 
1.8.3.1

