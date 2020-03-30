Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 523161976AD
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbgC3IjM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:39:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56874 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729743AbgC3IjL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:39:11 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT2gosIFeLpchAA--.19S2;
        Mon, 30 Mar 2020 16:39:04 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/39] MIPS: alchemy: Add header files path prefix
Date:   Mon, 30 Mar 2020 04:39:04 -0400
Message-Id: <1585557544-25442-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxT2gosIFeLpchAA--.19S2
X-Coremail-Antispam: 1UD129KBjvAXoWftF4fuw1kJF1Dtw4UJw1DKFg_yoWrXF1fWo
        WxtFn7KryrtFW5GF18GFyjka4xXrn2qa13Jwn5JFZxAasrA347ArW09w1UKa43Gr1xtwnx
        C3yrZryDJr1vgFykn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY07k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
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
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bI2NNUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-au1x00
to arch/mips/alchemy/common/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                      |  1 +
 arch/mips/alchemy/Platform                             |  3 +--
 arch/mips/alchemy/board-gpr.c                          |  6 +++---
 arch/mips/alchemy/board-mtx1.c                         |  8 ++++----
 arch/mips/alchemy/board-xxs1500.c                      |  4 ++--
 arch/mips/alchemy/common/clock.c                       |  2 +-
 arch/mips/alchemy/common/dbdma.c                       |  4 ++--
 arch/mips/alchemy/common/dma.c                         |  4 ++--
 arch/mips/alchemy/common/gpiolib.c                     |  4 ++--
 arch/mips/alchemy/common/irq.c                         |  4 ++--
 arch/mips/alchemy/common/platform.c                    | 10 +++++-----
 arch/mips/alchemy/common/power.c                       |  2 +-
 arch/mips/alchemy/common/setup.c                       |  2 +-
 arch/mips/alchemy/common/time.c                        |  2 +-
 arch/mips/alchemy/common/usb.c                         |  2 +-
 arch/mips/alchemy/common/vss.c                         |  2 +-
 arch/mips/alchemy/devboards/bcsr.c                     |  2 +-
 arch/mips/alchemy/devboards/db1000.c                   | 12 ++++++------
 arch/mips/alchemy/devboards/db1200.c                   | 14 +++++++-------
 arch/mips/alchemy/devboards/db1300.c                   | 16 ++++++++--------
 arch/mips/alchemy/devboards/db1550.c                   | 18 +++++++++---------
 arch/mips/alchemy/devboards/db1xxx.c                   |  4 ++--
 arch/mips/alchemy/devboards/platform.c                 |  6 +++---
 arch/mips/alchemy/devboards/pm.c                       |  6 +++---
 .../asm/mach-au1x00 => alchemy/include/mach}/au1000.h  |  0
 .../mach-au1x00 => alchemy/include/mach}/au1000_dma.h  |  0
 .../mach-au1x00 => alchemy/include/mach}/au1100_mmc.h  |  0
 .../mach-au1x00 => alchemy/include/mach}/au1200fb.h    |  0
 .../mach-au1x00 => alchemy/include/mach}/au1550_spi.h  |  0
 .../mach-au1x00 => alchemy/include/mach}/au1550nd.h    |  0
 .../include/mach}/au1xxx_dbdma.h                       |  0
 .../mach-au1x00 => alchemy/include/mach}/au1xxx_eth.h  |  0
 .../mach-au1x00 => alchemy/include/mach}/au1xxx_psc.h  |  0
 .../include/mach}/cpu-feature-overrides.h              |  0
 .../mach-db1x00 => alchemy/include/mach/db1x00}/bcsr.h |  0
 .../mach-db1x00 => alchemy/include/mach/db1x00}/irq.h  |  0
 arch/mips/alchemy/include/mach/floppy.h                |  2 ++
 .../mach-au1x00 => alchemy/include/mach}/gpio-au1000.h |  2 +-
 .../mach-au1x00 => alchemy/include/mach}/gpio-au1300.h |  2 +-
 arch/mips/alchemy/include/mach/ide.h                   |  2 ++
 .../asm/mach-au1x00 => alchemy/include/mach}/ioremap.h |  0
 arch/mips/alchemy/include/mach/irq.h                   |  6 ++++++
 arch/mips/alchemy/include/mach/kernel-entry-init.h     |  2 ++
 arch/mips/alchemy/include/mach/kmalloc.h               |  2 ++
 arch/mips/alchemy/include/mach/mangle-port.h           |  2 ++
 arch/mips/alchemy/include/mach/mc146818rtc.h           |  2 ++
 .../asm/mach-au1x00 => alchemy/include/mach}/prom.h    |  0
 arch/mips/alchemy/include/mach/spaces.h                |  2 ++
 arch/mips/alchemy/include/mach/topology.h              |  2 ++
 arch/mips/alchemy/include/mach/war.h                   |  2 ++
 arch/mips/boot/compressed/uart-alchemy.c               |  2 +-
 arch/mips/pci/pci-alchemy.c                            |  2 +-
 drivers/i2c/busses/i2c-au1550.c                        |  4 ++--
 drivers/mmc/host/au1xmmc.c                             |  6 +++---
 drivers/mtd/nand/raw/au1550nd.c                        |  4 ++--
 drivers/net/ethernet/amd/au1000_eth.c                  |  6 +++---
 drivers/pcmcia/db1xxx_ss.c                             |  4 ++--
 drivers/pcmcia/xxs1500_ss.c                            |  2 +-
 drivers/rtc/rtc-au1xxx.c                               |  2 +-
 drivers/spi/spi-au1550.c                               |  8 ++++----
 drivers/video/fbdev/au1100fb.c                         |  2 +-
 drivers/video/fbdev/au1100fb.h                         |  2 +-
 drivers/video/fbdev/au1200fb.c                         |  4 ++--
 drivers/watchdog/mtx-1_wdt.c                           |  2 +-
 sound/soc/au1x/ac97c.c                                 |  2 +-
 sound/soc/au1x/db1000.c                                |  4 ++--
 sound/soc/au1x/db1200.c                                |  8 ++++----
 sound/soc/au1x/dbdma2.c                                |  6 +++---
 sound/soc/au1x/dma.c                                   |  4 ++--
 sound/soc/au1x/i2sc.c                                  |  2 +-
 sound/soc/au1x/psc-ac97.c                              |  4 ++--
 sound/soc/au1x/psc-i2s.c                               |  4 ++--
 72 files changed, 137 insertions(+), 113 deletions(-)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1000.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1000_dma.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1100_mmc.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1200fb.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1550_spi.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1550nd.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1xxx_dbdma.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1xxx_eth.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/au1xxx_psc.h (100%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-db1x00 => alchemy/include/mach/db1x00}/bcsr.h (100%)
 rename arch/mips/{include/asm/mach-db1x00 => alchemy/include/mach/db1x00}/irq.h (100%)
 create mode 100644 arch/mips/alchemy/include/mach/floppy.h
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/gpio-au1000.h (99%)
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/gpio-au1300.h (99%)
 create mode 100644 arch/mips/alchemy/include/mach/ide.h
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/ioremap.h (100%)
 create mode 100644 arch/mips/alchemy/include/mach/irq.h
 create mode 100644 arch/mips/alchemy/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/alchemy/include/mach/kmalloc.h
 create mode 100644 arch/mips/alchemy/include/mach/mangle-port.h
 create mode 100644 arch/mips/alchemy/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-au1x00 => alchemy/include/mach}/prom.h (100%)
 create mode 100644 arch/mips/alchemy/include/mach/spaces.h
 create mode 100644 arch/mips/alchemy/include/mach/topology.h
 create mode 100644 arch/mips/alchemy/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 069fa94..6915e97 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -163,6 +163,7 @@ config MIPS_ALCHEMY
 	select GPIOLIB
 	select SYS_SUPPORTS_ZBOOT
 	select COMMON_CLK
+	select HAVE_MACH_HEAD_FILES
 
 config AR7
 	bool "Texas Instruments AR7"
diff --git a/arch/mips/alchemy/Platform b/arch/mips/alchemy/Platform
index 33c9da3..c70eb25 100644
--- a/arch/mips/alchemy/Platform
+++ b/arch/mips/alchemy/Platform
@@ -9,7 +9,6 @@ platform-$(CONFIG_MIPS_ALCHEMY) += alchemy/common/
 #             Db1550/Pb1550/Db1200/Pb1200/Db1300
 #
 platform-$(CONFIG_MIPS_DB1XXX)	+= alchemy/devboards/
-cflags-$(CONFIG_MIPS_DB1XXX)	+= -I$(srctree)/arch/mips/include/asm/mach-db1x00
 load-$(CONFIG_MIPS_DB1XXX)	+= 0xffffffff80100000
 
 #
@@ -35,4 +34,4 @@ load-$(CONFIG_MIPS_GPR)		+= 0xffffffff80100000
 # compiler picks the board one.	 If they don't, it will make sure
 # the alchemy generic gpio header is picked up.
 
-cflags-$(CONFIG_MIPS_ALCHEMY)	+= -I$(srctree)/arch/mips/include/asm/mach-au1x00
+cflags-$(CONFIG_MIPS_ALCHEMY)	+= -I$(srctree)/arch/mips/alchemy/include
diff --git a/arch/mips/alchemy/board-gpr.c b/arch/mips/alchemy/board-gpr.c
index 6c47318..663bcaa9 100644
--- a/arch/mips/alchemy/board-gpr.c
+++ b/arch/mips/alchemy/board-gpr.c
@@ -22,9 +22,9 @@
 #include <asm/idle.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/gpio-au1000.h>
-#include <prom.h>
+#include <mach/au1000.h>
+#include <mach/gpio-au1000.h>
+#include <mach/prom.h>
 
 const char *get_system_type(void)
 {
diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index 2309353..c5c89a3 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -20,10 +20,10 @@
 #include <asm/bootinfo.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/gpio-au1000.h>
-#include <asm/mach-au1x00/au1xxx_eth.h>
-#include <prom.h>
+#include <mach/au1000.h>
+#include <mach/gpio-au1000.h>
+#include <mach/au1xxx_eth.h>
+#include <mach/prom.h>
 
 const char *get_system_type(void)
 {
diff --git a/arch/mips/alchemy/board-xxs1500.c b/arch/mips/alchemy/board-xxs1500.c
index c67dfe1..e0f1f5d 100644
--- a/arch/mips/alchemy/board-xxs1500.c
+++ b/arch/mips/alchemy/board-xxs1500.c
@@ -17,8 +17,8 @@
 #include <asm/bootinfo.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <prom.h>
+#include <mach/au1000.h>
+#include <mach/prom.h>
 
 const char *get_system_type(void)
 {
diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index a95a894..5d51ce9 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -42,7 +42,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 /* Base clock: 12MHz is the default in all databooks, and I haven't
  * found any board yet which uses a different rate.
diff --git a/arch/mips/alchemy/common/dbdma.c b/arch/mips/alchemy/common/dbdma.c
index 4ca2c28..28c40ad 100644
--- a/arch/mips/alchemy/common/dbdma.c
+++ b/arch/mips/alchemy/common/dbdma.c
@@ -37,8 +37,8 @@
 #include <linux/interrupt.h>
 #include <linux/export.h>
 #include <linux/syscore_ops.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_dbdma.h>
 
 /*
  * The Descriptor Based DMA supports up to 16 channels.
diff --git a/arch/mips/alchemy/common/dma.c b/arch/mips/alchemy/common/dma.c
index 973049b..f71a4df 100644
--- a/arch/mips/alchemy/common/dma.c
+++ b/arch/mips/alchemy/common/dma.c
@@ -37,8 +37,8 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1000_dma.h>
+#include <mach/au1000.h>
+#include <mach/au1000_dma.h>
 
 /*
  * A note on resource allocation:
diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index 7d5da5e..7eb525d 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -34,8 +34,8 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/gpio.h>
-#include <asm/mach-au1x00/gpio-au1000.h>
-#include <asm/mach-au1x00/gpio-au1300.h>
+#include <mach/gpio-au1000.h>
+#include <mach/gpio-au1300.h>
 
 static int gpio2_get(struct gpio_chip *chip, unsigned offset)
 {
diff --git a/arch/mips/alchemy/common/irq.c b/arch/mips/alchemy/common/irq.c
index da9f922..16cc3fe 100644
--- a/arch/mips/alchemy/common/irq.c
+++ b/arch/mips/alchemy/common/irq.c
@@ -32,8 +32,8 @@
 #include <linux/syscore_ops.h>
 
 #include <asm/irq_cpu.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/gpio-au1300.h>
+#include <mach/au1000.h>
+#include <mach/gpio-au1300.h>
 
 /* Interrupt Controller register offsets */
 #define IC_CFG0RD	0x40
diff --git a/arch/mips/alchemy/common/platform.c b/arch/mips/alchemy/common/platform.c
index b8f3397..b7f5d0f 100644
--- a/arch/mips/alchemy/common/platform.c
+++ b/arch/mips/alchemy/common/platform.c
@@ -21,12 +21,12 @@
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
 
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
-#include <asm/mach-au1x00/au1100_mmc.h>
-#include <asm/mach-au1x00/au1xxx_eth.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_dbdma.h>
+#include <mach/au1100_mmc.h>
+#include <mach/au1xxx_eth.h>
 
-#include <prom.h>
+#include <mach/prom.h>
 
 static void alchemy_8250_pm(struct uart_port *port, unsigned int state,
 			    unsigned int old_state)
diff --git a/arch/mips/alchemy/common/power.c b/arch/mips/alchemy/common/power.c
index 303257b..93afa0f 100644
--- a/arch/mips/alchemy/common/power.c
+++ b/arch/mips/alchemy/common/power.c
@@ -34,7 +34,7 @@
 #include <linux/jiffies.h>
 
 #include <linux/uaccess.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 /*
  * We need to save/restore a bunch of core registers that are
diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index 7faaa6d..f7b47ff 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -31,7 +31,7 @@
 #include <asm/dma-coherence.h>
 #include <asm/mipsregs.h>
 
-#include <au1000.h>
+#include <mach/au1000.h>
 
 extern void __init board_setup(void);
 extern void __init alchemy_set_lpj(void);
diff --git a/arch/mips/alchemy/common/time.c b/arch/mips/alchemy/common/time.c
index d794ffb..478a2ad 100644
--- a/arch/mips/alchemy/common/time.c
+++ b/arch/mips/alchemy/common/time.c
@@ -27,7 +27,7 @@
 #include <asm/idle.h>
 #include <asm/processor.h>
 #include <asm/time.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 /* 32kHz clock enabled and detected */
 #define CNTR_OK (SYS_CNTRL_E0 | SYS_CNTRL_32S)
diff --git a/arch/mips/alchemy/common/usb.c b/arch/mips/alchemy/common/usb.c
index 5d61854..a223695 100644
--- a/arch/mips/alchemy/common/usb.c
+++ b/arch/mips/alchemy/common/usb.c
@@ -17,7 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
 #include <asm/cpu.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 /* control register offsets */
 #define AU1000_OHCICFG	0x7fffc
diff --git a/arch/mips/alchemy/common/vss.c b/arch/mips/alchemy/common/vss.c
index 3d0d468..cf3cf12 100644
--- a/arch/mips/alchemy/common/vss.c
+++ b/arch/mips/alchemy/common/vss.c
@@ -9,7 +9,7 @@
 
 #include <linux/export.h>
 #include <linux/spinlock.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 #define VSS_GATE	0x00	/* gate wait timers */
 #define VSS_CLKRST	0x04	/* clock/block control */
diff --git a/arch/mips/alchemy/devboards/bcsr.c b/arch/mips/alchemy/devboards/bcsr.c
index 8df0ccd..b654950 100644
--- a/arch/mips/alchemy/devboards/bcsr.c
+++ b/arch/mips/alchemy/devboards/bcsr.c
@@ -16,7 +16,7 @@
 #include <linux/irq.h>
 #include <asm/addrspace.h>
 #include <asm/io.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/db1x00/bcsr.h>
 
 static struct bcsr_reg {
 	void __iomem *raddr;
diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 2c52ee2..0b84a76 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -20,13 +20,13 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi_gpio.h>
 #include <linux/spi/ads7846.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/gpio-au1000.h>
-#include <asm/mach-au1x00/au1000_dma.h>
-#include <asm/mach-au1x00/au1100_mmc.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/au1000.h>
+#include <mach/gpio-au1000.h>
+#include <mach/au1000_dma.h>
+#include <mach/au1100_mmc.h>
+#include <mach/db1x00/bcsr.h>
 #include <asm/reboot.h>
-#include <prom.h>
+#include <mach/prom.h>
 #include "platform.h"
 
 #define F_SWAPPED (bcsr_read(BCSR_STATUS) & BCSR_STATUS_DB1000_SWAPBOOT)
diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index 421d651..80cd4dd 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -23,13 +23,13 @@
 #include <linux/spi/flash.h>
 #include <linux/smc91x.h>
 #include <linux/ata_platform.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1100_mmc.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
-#include <asm/mach-au1x00/au1200fb.h>
-#include <asm/mach-au1x00/au1550_spi.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/au1000.h>
+#include <mach/au1100_mmc.h>
+#include <mach/au1xxx_dbdma.h>
+#include <mach/au1xxx_psc.h>
+#include <mach/au1200fb.h>
+#include <mach/au1550_spi.h>
+#include <mach/db1x00/bcsr.h>
 
 #include "platform.h"
 
diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index 8ac1f56..b548d80 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -24,14 +24,14 @@
 #include <linux/smsc911x.h>
 #include <linux/wm97xx.h>
 
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/gpio-au1300.h>
-#include <asm/mach-au1x00/au1100_mmc.h>
-#include <asm/mach-au1x00/au1200fb.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
-#include <asm/mach-db1x00/bcsr.h>
-#include <asm/mach-au1x00/prom.h>
+#include <mach/au1000.h>
+#include <mach/gpio-au1300.h>
+#include <mach/au1100_mmc.h>
+#include <mach/au1200fb.h>
+#include <mach/au1xxx_dbdma.h>
+#include <mach/au1xxx_psc.h>
+#include <mach/db1x00/bcsr.h>
+#include <mach/prom.h>
 
 #include "platform.h"
 
diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index 3e0c75c..5cbd7c2 100644
--- a/arch/mips/alchemy/devboards/db1550.c
+++ b/arch/mips/alchemy/devboards/db1550.c
@@ -19,15 +19,15 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/flash.h>
 #include <asm/bootinfo.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/gpio-au1000.h>
-#include <asm/mach-au1x00/au1xxx_eth.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
-#include <asm/mach-au1x00/au1550_spi.h>
-#include <asm/mach-au1x00/au1550nd.h>
-#include <asm/mach-db1x00/bcsr.h>
-#include <prom.h>
+#include <mach/au1000.h>
+#include <mach/gpio-au1000.h>
+#include <mach/au1xxx_eth.h>
+#include <mach/au1xxx_dbdma.h>
+#include <mach/au1xxx_psc.h>
+#include <mach/au1550_spi.h>
+#include <mach/au1550nd.h>
+#include <mach/db1x00/bcsr.h>
+#include <mach/prom.h>
 #include "platform.h"
 
 static void __init db1550_hw_setup(void)
diff --git a/arch/mips/alchemy/devboards/db1xxx.c b/arch/mips/alchemy/devboards/db1xxx.c
index e6d25aa..7921fb2 100644
--- a/arch/mips/alchemy/devboards/db1xxx.c
+++ b/arch/mips/alchemy/devboards/db1xxx.c
@@ -4,8 +4,8 @@
  */
 
 #include <asm/prom.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/au1000.h>
+#include <mach/db1x00/bcsr.h>
 
 int __init db1000_board_setup(void);
 int __init db1000_dev_setup(void);
diff --git a/arch/mips/alchemy/devboards/platform.c b/arch/mips/alchemy/devboards/platform.c
index 8d4b65c..683c329 100644
--- a/arch/mips/alchemy/devboards/platform.c
+++ b/arch/mips/alchemy/devboards/platform.c
@@ -15,10 +15,10 @@
 #include <asm/idle.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/au1000.h>
+#include <mach/db1x00/bcsr.h>
 
-#include <prom.h>
+#include <mach/prom.h>
 
 void __init prom_init(void)
 {
diff --git a/arch/mips/alchemy/devboards/pm.c b/arch/mips/alchemy/devboards/pm.c
index 73c7781..2199128 100644
--- a/arch/mips/alchemy/devboards/pm.c
+++ b/arch/mips/alchemy/devboards/pm.c
@@ -9,9 +9,9 @@
 #include <linux/kobject.h>
 #include <linux/suspend.h>
 #include <linux/sysfs.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/gpio-au1000.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/au1000.h>
+#include <mach/gpio-au1000.h>
+#include <mach/db1x00/bcsr.h>
 
 /*
  * Generic suspend userspace interface for Alchemy development boards.
diff --git a/arch/mips/include/asm/mach-au1x00/au1000.h b/arch/mips/alchemy/include/mach/au1000.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1000.h
rename to arch/mips/alchemy/include/mach/au1000.h
diff --git a/arch/mips/include/asm/mach-au1x00/au1000_dma.h b/arch/mips/alchemy/include/mach/au1000_dma.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1000_dma.h
rename to arch/mips/alchemy/include/mach/au1000_dma.h
diff --git a/arch/mips/include/asm/mach-au1x00/au1100_mmc.h b/arch/mips/alchemy/include/mach/au1100_mmc.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1100_mmc.h
rename to arch/mips/alchemy/include/mach/au1100_mmc.h
diff --git a/arch/mips/include/asm/mach-au1x00/au1200fb.h b/arch/mips/alchemy/include/mach/au1200fb.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1200fb.h
rename to arch/mips/alchemy/include/mach/au1200fb.h
diff --git a/arch/mips/include/asm/mach-au1x00/au1550_spi.h b/arch/mips/alchemy/include/mach/au1550_spi.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1550_spi.h
rename to arch/mips/alchemy/include/mach/au1550_spi.h
diff --git a/arch/mips/include/asm/mach-au1x00/au1550nd.h b/arch/mips/alchemy/include/mach/au1550nd.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1550nd.h
rename to arch/mips/alchemy/include/mach/au1550nd.h
diff --git a/arch/mips/include/asm/mach-au1x00/au1xxx_dbdma.h b/arch/mips/alchemy/include/mach/au1xxx_dbdma.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1xxx_dbdma.h
rename to arch/mips/alchemy/include/mach/au1xxx_dbdma.h
diff --git a/arch/mips/include/asm/mach-au1x00/au1xxx_eth.h b/arch/mips/alchemy/include/mach/au1xxx_eth.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1xxx_eth.h
rename to arch/mips/alchemy/include/mach/au1xxx_eth.h
diff --git a/arch/mips/include/asm/mach-au1x00/au1xxx_psc.h b/arch/mips/alchemy/include/mach/au1xxx_psc.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/au1xxx_psc.h
rename to arch/mips/alchemy/include/mach/au1xxx_psc.h
diff --git a/arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h b/arch/mips/alchemy/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h
rename to arch/mips/alchemy/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-db1x00/bcsr.h b/arch/mips/alchemy/include/mach/db1x00/bcsr.h
similarity index 100%
rename from arch/mips/include/asm/mach-db1x00/bcsr.h
rename to arch/mips/alchemy/include/mach/db1x00/bcsr.h
diff --git a/arch/mips/include/asm/mach-db1x00/irq.h b/arch/mips/alchemy/include/mach/db1x00/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-db1x00/irq.h
rename to arch/mips/alchemy/include/mach/db1x00/irq.h
diff --git a/arch/mips/alchemy/include/mach/floppy.h b/arch/mips/alchemy/include/mach/floppy.h
new file mode 100644
index 0000000..8e17183
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/floppy.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/floppy.h>
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/alchemy/include/mach/gpio-au1000.h
similarity index 99%
rename from arch/mips/include/asm/mach-au1x00/gpio-au1000.h
rename to arch/mips/alchemy/include/mach/gpio-au1000.h
index adde1fa..5f33432 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
+++ b/arch/mips/alchemy/include/mach/gpio-au1000.h
@@ -9,7 +9,7 @@
 #ifndef _ALCHEMY_GPIO_AU1000_H_
 #define _ALCHEMY_GPIO_AU1000_H_
 
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 /* The default GPIO numberspace as documented in the Alchemy manuals.
  * GPIO0-31 from GPIO1 block,	GPIO200-215 from GPIO2 block.
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/alchemy/include/mach/gpio-au1300.h
similarity index 99%
rename from arch/mips/include/asm/mach-au1x00/gpio-au1300.h
rename to arch/mips/alchemy/include/mach/gpio-au1300.h
index d25846a..f491e1c 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
+++ b/arch/mips/alchemy/include/mach/gpio-au1300.h
@@ -10,7 +10,7 @@
 
 #include <asm/addrspace.h>
 #include <asm/io.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 struct gpio;
 struct gpio_chip;
diff --git a/arch/mips/alchemy/include/mach/ide.h b/arch/mips/alchemy/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/include/asm/mach-au1x00/ioremap.h b/arch/mips/alchemy/include/mach/ioremap.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/ioremap.h
rename to arch/mips/alchemy/include/mach/ioremap.h
diff --git a/arch/mips/alchemy/include/mach/irq.h b/arch/mips/alchemy/include/mach/irq.h
new file mode 100644
index 0000000..abd4433
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/irq.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifdef CONFIG_MIPS_DB1XXX
+#include <mach/db1x00/irq.h>
+#else
+#include <asm/mach-generic/irq.h>
+#endif
diff --git a/arch/mips/alchemy/include/mach/kernel-entry-init.h b/arch/mips/alchemy/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/alchemy/include/mach/kmalloc.h b/arch/mips/alchemy/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/alchemy/include/mach/mangle-port.h b/arch/mips/alchemy/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/alchemy/include/mach/mc146818rtc.h b/arch/mips/alchemy/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-au1x00/prom.h b/arch/mips/alchemy/include/mach/prom.h
similarity index 100%
rename from arch/mips/include/asm/mach-au1x00/prom.h
rename to arch/mips/alchemy/include/mach/prom.h
diff --git a/arch/mips/alchemy/include/mach/spaces.h b/arch/mips/alchemy/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/alchemy/include/mach/topology.h b/arch/mips/alchemy/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/alchemy/include/mach/war.h b/arch/mips/alchemy/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/alchemy/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/boot/compressed/uart-alchemy.c b/arch/mips/boot/compressed/uart-alchemy.c
index 8ec63011e..2535e69 100644
--- a/arch/mips/boot/compressed/uart-alchemy.c
+++ b/arch/mips/boot/compressed/uart-alchemy.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 void putc(char c)
 {
diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 01a2af8..8e7a7ec 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -19,7 +19,7 @@
 #include <linux/vmalloc.h>
 
 #include <asm/dma-coherence.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 #include <asm/tlbmisc.h>
 
 #ifdef CONFIG_PCI_DEBUG
diff --git a/drivers/i2c/busses/i2c-au1550.c b/drivers/i2c/busses/i2c-au1550.c
index 22aed92..4376ee6 100644
--- a/drivers/i2c/busses/i2c-au1550.c
+++ b/drivers/i2c/busses/i2c-au1550.c
@@ -22,8 +22,8 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_psc.h>
 
 #define PSC_SEL		0x00
 #define PSC_CTRL	0x04
diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
index 8823680..7579860 100644
--- a/drivers/mmc/host/au1xmmc.c
+++ b/drivers/mmc/host/au1xmmc.c
@@ -44,9 +44,9 @@
 #include <linux/slab.h>
 
 #include <asm/io.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
-#include <asm/mach-au1x00/au1100_mmc.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_dbdma.h>
+#include <mach/au1100_mmc.h>
 
 #define DRIVER_NAME "au1xxx-mmc"
 
diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 75eb3e9..f7d5aa3 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -11,8 +11,8 @@
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
 #include <asm/io.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1550nd.h>
+#include <mach/au1000.h>
+#include <mach/au1550nd.h>
 
 
 struct au1550nd_ctx {
diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 089a4fb..904eafa 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -46,9 +46,9 @@
 #include <asm/irq.h>
 #include <asm/processor.h>
 
-#include <au1000.h>
-#include <au1xxx_eth.h>
-#include <prom.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_eth.h>
+#include <mach/prom.h>
 
 #include "au1000_eth.h"
 
diff --git a/drivers/pcmcia/db1xxx_ss.c b/drivers/pcmcia/db1xxx_ss.c
index 590e594..78fb089 100644
--- a/drivers/pcmcia/db1xxx_ss.c
+++ b/drivers/pcmcia/db1xxx_ss.c
@@ -34,8 +34,8 @@
 
 #include <pcmcia/ss.h>
 
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/au1000.h>
+#include <mach/db1x00/bcsr.h>
 
 #define MEM_MAP_SIZE	0x400000
 #define IO_MAP_SIZE	0x1000
diff --git a/drivers/pcmcia/xxs1500_ss.c b/drivers/pcmcia/xxs1500_ss.c
index b11c7ab..82b8404 100644
--- a/drivers/pcmcia/xxs1500_ss.c
+++ b/drivers/pcmcia/xxs1500_ss.c
@@ -23,7 +23,7 @@
 #include <pcmcia/cistpl.h>
 
 #include <asm/irq.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 #define MEM_MAP_SIZE	0x400000
 #define IO_MAP_SIZE	0x1000
diff --git a/drivers/rtc/rtc-au1xxx.c b/drivers/rtc/rtc-au1xxx.c
index 7c5530c..a3ed8d5 100644
--- a/drivers/rtc/rtc-au1xxx.c
+++ b/drivers/rtc/rtc-au1xxx.c
@@ -23,7 +23,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 /* 32kHz clock enabled and detected */
 #define CNTR_OK (SYS_CNTRL_E0 | SYS_CNTRL_32S)
diff --git a/drivers/spi/spi-au1550.c b/drivers/spi/spi-au1550.c
index dfb7196f..746bbd0 100644
--- a/drivers/spi/spi-au1550.c
+++ b/drivers/spi/spi-au1550.c
@@ -20,11 +20,11 @@
 #include <linux/spi/spi_bitbang.h>
 #include <linux/dma-mapping.h>
 #include <linux/completion.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_psc.h>
+#include <mach/au1xxx_dbdma.h>
 
-#include <asm/mach-au1x00/au1550_spi.h>
+#include <mach/au1550_spi.h>
 
 static unsigned usedma = 1;
 module_param(usedma, uint, 0644);
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 37a6512..d60e55d 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -55,7 +55,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 #define DEBUG 0
 
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index e7239bc..079cf90 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -30,7 +30,7 @@
 #ifndef _AU1100LCD_H
 #define _AU1100LCD_H
 
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 #define print_err(f, arg...) printk(KERN_ERR DRIVER_NAME ": " f "\n", ## arg)
 #define print_warn(f, arg...) printk(KERN_WARNING DRIVER_NAME ": " f "\n", ## arg)
diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index c00e01a..a1aaec1 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -45,8 +45,8 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1200fb.h>	/* platform_data */
+#include <mach/au1000.h>
+#include <mach/au1200fb.h>	/* platform_data */
 #include "au1200fb.h"
 
 #define DRIVER_NAME "au1200fb"
diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
index 8aa1cb4a..927c051 100644
--- a/drivers/watchdog/mtx-1_wdt.c
+++ b/drivers/watchdog/mtx-1_wdt.c
@@ -41,7 +41,7 @@
 #include <linux/uaccess.h>
 #include <linux/gpio/consumer.h>
 
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 #define MTX1_WDT_INTERVAL	(5 * HZ)
 
diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index 3b1700e..2a7fa5c 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -20,7 +20,7 @@
 #include <sound/pcm.h>
 #include <sound/initval.h>
 #include <sound/soc.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 #include "psc.h"
 
diff --git a/sound/soc/au1x/db1000.c b/sound/soc/au1x/db1000.c
index c0e105a..e2a726d 100644
--- a/sound/soc/au1x/db1000.c
+++ b/sound/soc/au1x/db1000.c
@@ -14,8 +14,8 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/au1000.h>
+#include <mach/db1x00/bcsr.h>
 
 #include "psc.h"
 
diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index d6b692f..0eb8418 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -14,10 +14,10 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
-#include <asm/mach-db1x00/bcsr.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_psc.h>
+#include <mach/au1xxx_dbdma.h>
+#include <mach/db1x00/bcsr.h>
 
 #include "../codecs/wm8731.h"
 #include "psc.h"
diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 8f855644..3099972 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -20,9 +20,9 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_dbdma.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_dbdma.h>
+#include <mach/au1xxx_psc.h>
 
 #include "psc.h"
 
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index c9a038a..f5364f4 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -17,8 +17,8 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1000_dma.h>
+#include <mach/au1000.h>
+#include <mach/au1000_dma.h>
 
 #include "psc.h"
 
diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 7fd08fa..f3d4e28 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -15,7 +15,7 @@
 #include <sound/pcm.h>
 #include <sound/initval.h>
 #include <sound/soc.h>
-#include <asm/mach-au1x00/au1000.h>
+#include <mach/au1000.h>
 
 #include "psc.h"
 
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 0227993..f7427aa 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -19,8 +19,8 @@
 #include <sound/pcm.h>
 #include <sound/initval.h>
 #include <sound/soc.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_psc.h>
 
 #include "psc.h"
 
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index 767ce95..ab11900 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -18,8 +18,8 @@
 #include <sound/pcm.h>
 #include <sound/initval.h>
 #include <sound/soc.h>
-#include <asm/mach-au1x00/au1000.h>
-#include <asm/mach-au1x00/au1xxx_psc.h>
+#include <mach/au1000.h>
+#include <mach/au1xxx_psc.h>
 
 #include "psc.h"
 
-- 
1.8.3.1

