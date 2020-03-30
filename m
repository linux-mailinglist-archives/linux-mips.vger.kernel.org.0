Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12C09197744
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729736AbgC3JAb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33710 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729399AbgC3JAa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:30 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax9ukXtYFe9pkhAA--.30S2;
        Mon, 30 Mar 2020 17:00:07 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 27/39] MIPS: pmcs-msp71xx: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:07 -0400
Message-Id: <1585558807-23418-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Ax9ukXtYFe9pkhAA--.30S2
X-Coremail-Antispam: 1UD129KBjvAXoW3Cr1xXrWxAr1xAFWDuryUJrb_yoW8Cw43Ko
        Z2yFn7K348JFZrJFy7CFy3Gw1rXryDtr4rt34rtrZrJF9rZ347Jr1S9rs2q3WUCFWft347
        GrZavrW5Cr10yFWxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYn7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7
        xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr
        0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
        CI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUq_MaDUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-pmcs-msp71xx
to arch/mips/pmcs-msp71xx/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                              |  1 +
 arch/mips/pci/fixup-pmcmsp.c                                   |  4 ++--
 arch/mips/pci/ops-pmcmsp.c                                     | 10 +++++-----
 arch/mips/pmcs-msp71xx/Platform                                |  2 +-
 .../include/mach}/cpu-feature-overrides.h                      |  0
 arch/mips/pmcs-msp71xx/include/mach/ioremap.h                  |  2 ++
 arch/mips/pmcs-msp71xx/include/mach/irq.h                      |  2 ++
 arch/mips/pmcs-msp71xx/include/mach/kernel-entry-init.h        |  2 ++
 arch/mips/pmcs-msp71xx/include/mach/kmalloc.h                  |  2 ++
 arch/mips/pmcs-msp71xx/include/mach/mangle-port.h              |  2 ++
 arch/mips/pmcs-msp71xx/include/mach/mc146818rtc.h              |  2 ++
 .../include/mach}/msp_cic_int.h                                |  0
 .../include/mach}/msp_gpio_macros.h                            |  4 ++--
 .../mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_int.h  |  0
 .../mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_pci.h  |  0
 .../mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_prom.h |  0
 .../include/mach}/msp_regops.h                                 |  0
 .../mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_regs.h |  0
 .../include/mach}/msp_slp_int.h                                |  0
 .../mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_usb.h  |  0
 arch/mips/pmcs-msp71xx/include/mach/spaces.h                   |  2 ++
 arch/mips/pmcs-msp71xx/include/mach/topology.h                 |  2 ++
 .../asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/war.h  |  0
 arch/mips/pmcs-msp71xx/msp_elb.c                               |  2 +-
 arch/mips/pmcs-msp71xx/msp_eth.c                               |  6 +++---
 arch/mips/pmcs-msp71xx/msp_hwbutton.c                          |  6 +++---
 arch/mips/pmcs-msp71xx/msp_irq.c                               |  2 +-
 arch/mips/pmcs-msp71xx/msp_irq_cic.c                           |  4 ++--
 arch/mips/pmcs-msp71xx/msp_irq_per.c                           |  4 ++--
 arch/mips/pmcs-msp71xx/msp_irq_slp.c                           |  4 ++--
 arch/mips/pmcs-msp71xx/msp_pci.c                               |  4 ++--
 arch/mips/pmcs-msp71xx/msp_prom.c                              |  4 ++--
 arch/mips/pmcs-msp71xx/msp_serial.c                            |  6 +++---
 arch/mips/pmcs-msp71xx/msp_setup.c                             |  6 +++---
 arch/mips/pmcs-msp71xx/msp_time.c                              |  6 +++---
 arch/mips/pmcs-msp71xx/msp_usb.c                               |  8 ++++----
 drivers/mtd/maps/pmcmsp-flash.c                                |  4 ++--
 37 files changed, 60 insertions(+), 43 deletions(-)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/pmcs-msp71xx/include/mach/ioremap.h
 create mode 100644 arch/mips/pmcs-msp71xx/include/mach/irq.h
 create mode 100644 arch/mips/pmcs-msp71xx/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/pmcs-msp71xx/include/mach/kmalloc.h
 create mode 100644 arch/mips/pmcs-msp71xx/include/mach/mangle-port.h
 create mode 100644 arch/mips/pmcs-msp71xx/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_cic_int.h (100%)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_gpio_macros.h (99%)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_int.h (100%)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_pci.h (100%)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_prom.h (100%)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_regops.h (100%)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_regs.h (100%)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_slp_int.h (100%)
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/msp_usb.h (100%)
 create mode 100644 arch/mips/pmcs-msp71xx/include/mach/spaces.h
 create mode 100644 arch/mips/pmcs-msp71xx/include/mach/topology.h
 rename arch/mips/{include/asm/mach-pmcs-msp71xx => pmcs-msp71xx/include/mach}/war.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f5f144f..56d6519 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -657,6 +657,7 @@ config PMC_MSP
 	select SERIAL_8250_CONSOLE
 	select USB_EHCI_BIG_ENDIAN_MMIO
 	select USB_EHCI_BIG_ENDIAN_DESC
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This adds support for the PMC-Sierra family of Multi-Service
 	  Processor System-On-A-Chips.  These parts include a number
diff --git a/arch/mips/pci/fixup-pmcmsp.c b/arch/mips/pci/fixup-pmcmsp.c
index 4ad2ef0..45cf610 100644
--- a/arch/mips/pci/fixup-pmcmsp.c
+++ b/arch/mips/pci/fixup-pmcmsp.c
@@ -37,8 +37,8 @@
 
 #include <asm/byteorder.h>
 
-#include <msp_pci.h>
-#include <msp_cic_int.h>
+#include <mach/msp_pci.h>
+#include <mach/msp_cic_int.h>
 
 /* PCI interrupt pins */
 #define IRQ4	MSP_INT_EXT4
diff --git a/arch/mips/pci/ops-pmcmsp.c b/arch/mips/pci/ops-pmcmsp.c
index ad5dd71..b4d44ad 100644
--- a/arch/mips/pci/ops-pmcmsp.c
+++ b/arch/mips/pci/ops-pmcmsp.c
@@ -30,11 +30,11 @@
 #include <asm/mipsmtregs.h>
 #endif
 
-#include <msp_prom.h>
-#include <msp_cic_int.h>
-#include <msp_pci.h>
-#include <msp_regs.h>
-#include <msp_regops.h>
+#include <mach/msp_prom.h>
+#include <mach/msp_cic_int.h>
+#include <mach/msp_pci.h>
+#include <mach/msp_regs.h>
+#include <mach/msp_regops.h>
 
 #define PCI_ACCESS_READ		0
 #define PCI_ACCESS_WRITE	1
diff --git a/arch/mips/pmcs-msp71xx/Platform b/arch/mips/pmcs-msp71xx/Platform
index 7af0734..a15f576 100644
--- a/arch/mips/pmcs-msp71xx/Platform
+++ b/arch/mips/pmcs-msp71xx/Platform
@@ -2,6 +2,6 @@
 # PMC-Sierra MSP SOCs
 #
 platform-$(CONFIG_PMC_MSP)	+= pmcs-msp71xx/
-cflags-$(CONFIG_PMC_MSP)	+= -I$(srctree)/arch/mips/include/asm/mach-pmcs-msp71xx \
+cflags-$(CONFIG_PMC_MSP)	+= -I$(srctree)/arch/mips/pmcs-msp71xx/include \
 					-mno-branch-likely
 load-$(CONFIG_PMC_MSP)		+= 0xffffffff80100000
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/cpu-feature-overrides.h b/arch/mips/pmcs-msp71xx/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/cpu-feature-overrides.h
rename to arch/mips/pmcs-msp71xx/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/pmcs-msp71xx/include/mach/ioremap.h b/arch/mips/pmcs-msp71xx/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/pmcs-msp71xx/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/pmcs-msp71xx/include/mach/irq.h b/arch/mips/pmcs-msp71xx/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/pmcs-msp71xx/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/pmcs-msp71xx/include/mach/kernel-entry-init.h b/arch/mips/pmcs-msp71xx/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/pmcs-msp71xx/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/pmcs-msp71xx/include/mach/kmalloc.h b/arch/mips/pmcs-msp71xx/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/pmcs-msp71xx/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/pmcs-msp71xx/include/mach/mangle-port.h b/arch/mips/pmcs-msp71xx/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/pmcs-msp71xx/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/pmcs-msp71xx/include/mach/mc146818rtc.h b/arch/mips/pmcs-msp71xx/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/pmcs-msp71xx/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_cic_int.h b/arch/mips/pmcs-msp71xx/include/mach/msp_cic_int.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_cic_int.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_cic_int.h
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_gpio_macros.h b/arch/mips/pmcs-msp71xx/include/mach/msp_gpio_macros.h
similarity index 99%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_gpio_macros.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_gpio_macros.h
index daacebb..2176203 100644
--- a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_gpio_macros.h
+++ b/arch/mips/pmcs-msp71xx/include/mach/msp_gpio_macros.h
@@ -29,8 +29,8 @@
 #ifndef __MSP_GPIO_MACROS_H__
 #define __MSP_GPIO_MACROS_H__
 
-#include <msp_regops.h>
-#include <msp_regs.h>
+#include <mach/msp_regops.h>
+#include <mach/msp_regs.h>
 
 #ifdef CONFIG_PMC_MSP7120_GW
 #define MSP_NUM_GPIOS		20
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_int.h b/arch/mips/pmcs-msp71xx/include/mach/msp_int.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_int.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_int.h
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_pci.h b/arch/mips/pmcs-msp71xx/include/mach/msp_pci.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_pci.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_pci.h
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_prom.h b/arch/mips/pmcs-msp71xx/include/mach/msp_prom.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_prom.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_prom.h
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_regops.h b/arch/mips/pmcs-msp71xx/include/mach/msp_regops.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_regops.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_regops.h
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_regs.h b/arch/mips/pmcs-msp71xx/include/mach/msp_regs.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_regs.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_regs.h
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_slp_int.h b/arch/mips/pmcs-msp71xx/include/mach/msp_slp_int.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_slp_int.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_slp_int.h
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/msp_usb.h b/arch/mips/pmcs-msp71xx/include/mach/msp_usb.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/msp_usb.h
rename to arch/mips/pmcs-msp71xx/include/mach/msp_usb.h
diff --git a/arch/mips/pmcs-msp71xx/include/mach/spaces.h b/arch/mips/pmcs-msp71xx/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/pmcs-msp71xx/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/pmcs-msp71xx/include/mach/topology.h b/arch/mips/pmcs-msp71xx/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/pmcs-msp71xx/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-pmcs-msp71xx/war.h b/arch/mips/pmcs-msp71xx/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-pmcs-msp71xx/war.h
rename to arch/mips/pmcs-msp71xx/include/mach/war.h
diff --git a/arch/mips/pmcs-msp71xx/msp_elb.c b/arch/mips/pmcs-msp71xx/msp_elb.c
index 3e96410..540217a 100644
--- a/arch/mips/pmcs-msp71xx/msp_elb.c
+++ b/arch/mips/pmcs-msp71xx/msp_elb.c
@@ -28,7 +28,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <msp_regs.h>
+#include <mach/msp_regs.h>
 
 static int __init msp_elb_setup(void)
 {
diff --git a/arch/mips/pmcs-msp71xx/msp_eth.c b/arch/mips/pmcs-msp71xx/msp_eth.c
index 15679b4..b86fb63 100644
--- a/arch/mips/pmcs-msp71xx/msp_eth.c
+++ b/arch/mips/pmcs-msp71xx/msp_eth.c
@@ -29,9 +29,9 @@
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <msp_regs.h>
-#include <msp_int.h>
-#include <msp_gpio_macros.h>
+#include <mach/msp_regs.h>
+#include <mach/msp_int.h>
+#include <mach/msp_gpio_macros.h>
 
 
 #define MSP_ETHERNET_GPIO0	14
diff --git a/arch/mips/pmcs-msp71xx/msp_hwbutton.c b/arch/mips/pmcs-msp71xx/msp_hwbutton.c
index bb57ed9..cf53cde 100644
--- a/arch/mips/pmcs-msp71xx/msp_hwbutton.c
+++ b/arch/mips/pmcs-msp71xx/msp_hwbutton.c
@@ -29,9 +29,9 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 
-#include <msp_int.h>
-#include <msp_regs.h>
-#include <msp_regops.h>
+#include <mach/msp_int.h>
+#include <mach/msp_regs.h>
+#include <mach/msp_regops.h>
 
 /* For hwbutton_interrupt->initial_state */
 #define HWBUTTON_HI	0x1
diff --git a/arch/mips/pmcs-msp71xx/msp_irq.c b/arch/mips/pmcs-msp71xx/msp_irq.c
index d525cc9..9026969 100644
--- a/arch/mips/pmcs-msp71xx/msp_irq.c
+++ b/arch/mips/pmcs-msp71xx/msp_irq.c
@@ -18,7 +18,7 @@
 #include <asm/irq_cpu.h>
 #include <asm/setup.h>
 
-#include <msp_int.h>
+#include <mach/msp_int.h>
 
 /* SLP bases systems */
 extern void msp_slp_irq_init(void);
diff --git a/arch/mips/pmcs-msp71xx/msp_irq_cic.c b/arch/mips/pmcs-msp71xx/msp_irq_cic.c
index 0706010..623fcd6 100644
--- a/arch/mips/pmcs-msp71xx/msp_irq_cic.c
+++ b/arch/mips/pmcs-msp71xx/msp_irq_cic.c
@@ -13,8 +13,8 @@
 
 #include <asm/mipsregs.h>
 
-#include <msp_cic_int.h>
-#include <msp_regs.h>
+#include <mach/msp_cic_int.h>
+#include <mach/msp_regs.h>
 
 /*
  * External API
diff --git a/arch/mips/pmcs-msp71xx/msp_irq_per.c b/arch/mips/pmcs-msp71xx/msp_irq_per.c
index b284412..3a62427 100644
--- a/arch/mips/pmcs-msp71xx/msp_irq_per.c
+++ b/arch/mips/pmcs-msp71xx/msp_irq_per.c
@@ -13,8 +13,8 @@
 
 #include <asm/mipsregs.h>
 
-#include <msp_cic_int.h>
-#include <msp_regs.h>
+#include <mach/msp_cic_int.h>
+#include <mach/msp_regs.h>
 
 
 /*
diff --git a/arch/mips/pmcs-msp71xx/msp_irq_slp.c b/arch/mips/pmcs-msp71xx/msp_irq_slp.c
index 097a5fd..38b74b3 100644
--- a/arch/mips/pmcs-msp71xx/msp_irq_slp.c
+++ b/arch/mips/pmcs-msp71xx/msp_irq_slp.c
@@ -13,8 +13,8 @@
 
 #include <asm/mipsregs.h>
 
-#include <msp_slp_int.h>
-#include <msp_regs.h>
+#include <mach/msp_slp_int.h>
+#include <mach/msp_regs.h>
 
 static inline void unmask_msp_slp_irq(struct irq_data *d)
 {
diff --git a/arch/mips/pmcs-msp71xx/msp_pci.c b/arch/mips/pmcs-msp71xx/msp_pci.c
index 428dea2..08bac78 100644
--- a/arch/mips/pmcs-msp71xx/msp_pci.c
+++ b/arch/mips/pmcs-msp71xx/msp_pci.c
@@ -26,8 +26,8 @@
 
 #include <linux/init.h>
 
-#include <msp_prom.h>
-#include <msp_regs.h>
+#include <mach/msp_prom.h>
+#include <mach/msp_regs.h>
 
 extern void msp_pci_init(void);
 
diff --git a/arch/mips/pmcs-msp71xx/msp_prom.c b/arch/mips/pmcs-msp71xx/msp_prom.c
index 800a21b..3f78ac8 100644
--- a/arch/mips/pmcs-msp71xx/msp_prom.c
+++ b/arch/mips/pmcs-msp71xx/msp_prom.c
@@ -47,8 +47,8 @@
 #include <asm-generic/sections.h>
 #include <asm/page.h>
 
-#include <msp_prom.h>
-#include <msp_regs.h>
+#include <mach/msp_prom.h>
+#include <mach/msp_regs.h>
 
 /* global PROM environment variables and pointers */
 int prom_argc;
diff --git a/arch/mips/pmcs-msp71xx/msp_serial.c b/arch/mips/pmcs-msp71xx/msp_serial.c
index 940c684..d804d78 100644
--- a/arch/mips/pmcs-msp71xx/msp_serial.c
+++ b/arch/mips/pmcs-msp71xx/msp_serial.c
@@ -35,9 +35,9 @@
 #include <asm/serial.h>
 #include <linux/serial_8250.h>
 
-#include <msp_prom.h>
-#include <msp_int.h>
-#include <msp_regs.h>
+#include <mach/msp_prom.h>
+#include <mach/msp_int.h>
+#include <mach/msp_regs.h>
 
 struct msp_uart_data {
 	int	last_lcr;
diff --git a/arch/mips/pmcs-msp71xx/msp_setup.c b/arch/mips/pmcs-msp71xx/msp_setup.c
index d1e59ce..c7725b3 100644
--- a/arch/mips/pmcs-msp71xx/msp_setup.c
+++ b/arch/mips/pmcs-msp71xx/msp_setup.c
@@ -16,11 +16,11 @@
 #include <asm/smp-ops.h>
 #include <asm/time.h>
 
-#include <msp_prom.h>
-#include <msp_regs.h>
+#include <mach/msp_prom.h>
+#include <mach/msp_regs.h>
 
 #if defined(CONFIG_PMC_MSP7120_GW)
-#include <msp_regops.h>
+#include <mach/msp_regops.h>
 #define MSP_BOARD_RESET_GPIO	9
 #endif
 
diff --git a/arch/mips/pmcs-msp71xx/msp_time.c b/arch/mips/pmcs-msp71xx/msp_time.c
index 9c62982..f8a1027 100644
--- a/arch/mips/pmcs-msp71xx/msp_time.c
+++ b/arch/mips/pmcs-msp71xx/msp_time.c
@@ -20,9 +20,9 @@
 #include <asm/mipsregs.h>
 #include <asm/time.h>
 
-#include <msp_prom.h>
-#include <msp_int.h>
-#include <msp_regs.h>
+#include <mach/msp_prom.h>
+#include <mach/msp_int.h>
+#include <mach/msp_regs.h>
 
 #define get_current_vpe()   \
 	((read_c0_tcbind() >> TCBIND_CURVPE_SHIFT) & TCBIND_CURVPE)
diff --git a/arch/mips/pmcs-msp71xx/msp_usb.c b/arch/mips/pmcs-msp71xx/msp_usb.c
index d38ac70..f12ce4e 100644
--- a/arch/mips/pmcs-msp71xx/msp_usb.c
+++ b/arch/mips/pmcs-msp71xx/msp_usb.c
@@ -31,10 +31,10 @@
 
 #include <asm/mipsregs.h>
 
-#include <msp_regs.h>
-#include <msp_int.h>
-#include <msp_prom.h>
-#include <msp_usb.h>
+#include <mach/msp_regs.h>
+#include <mach/msp_int.h>
+#include <mach/msp_prom.h>
+#include <mach/msp_usb.h>
 
 
 #if defined(CONFIG_USB_EHCI_HCD)
diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index 2051f28..8657034 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -38,8 +38,8 @@
 
 #include <asm/io.h>
 
-#include <msp_prom.h>
-#include <msp_regs.h>
+#include <mach/msp_prom.h>
+#include <mach/msp_regs.h>
 
 
 static struct mtd_info **msp_flash;
-- 
1.8.3.1

