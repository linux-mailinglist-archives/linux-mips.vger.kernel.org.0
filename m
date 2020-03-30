Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3103E1976AF
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729798AbgC3IjS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:39:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56912 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729785AbgC3IjR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:39:17 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf94tsIFeMZchAA--.6S2;
        Mon, 30 Mar 2020 16:39:09 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/39] MIPS: bcm63xx: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:39:09 -0400
Message-Id: <1585557549-29555-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxf94tsIFeMZchAA--.6S2
X-Coremail-Antispam: 1UD129KBjvAXoWfuF4DCryftr13Zr48GryrXrb_yoW5KrW3Xo
        Z7tFnrGw10gFWrAF17WFnxCa10yF1qqws5Gw43GrWDGF9rA347Cr1Fgr4FkFyUWw1fta47
        WrWrZFyDGr18JFykn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYe7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7
        xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
        64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26F
        4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
        1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY
        6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5RVbJUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-bcm63xx
to arch/mips/bcm63xx/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                  |  1 +
 arch/mips/bcm63xx/Platform                         |  2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c          | 28 +++++++++++-----------
 arch/mips/bcm63xx/clk.c                            |  8 +++----
 arch/mips/bcm63xx/cpu.c                            |  8 +++----
 arch/mips/bcm63xx/cs.c                             |  8 +++----
 arch/mips/bcm63xx/dev-enet.c                       |  6 ++---
 arch/mips/bcm63xx/dev-flash.c                      |  8 +++----
 arch/mips/bcm63xx/dev-hsspi.c                      |  6 ++---
 arch/mips/bcm63xx/dev-pcmcia.c                     | 10 ++++----
 arch/mips/bcm63xx/dev-rng.c                        |  2 +-
 arch/mips/bcm63xx/dev-spi.c                        |  6 ++---
 arch/mips/bcm63xx/dev-uart.c                       |  2 +-
 arch/mips/bcm63xx/dev-usb-usbd.c                   |  4 ++--
 arch/mips/bcm63xx/dev-wdt.c                        |  2 +-
 arch/mips/bcm63xx/early_printk.c                   |  2 +-
 arch/mips/bcm63xx/gpio.c                           |  8 +++----
 .../include/mach}/bcm63xx_board.h                  |  0
 .../include/mach}/bcm63xx_cpu.h                    |  0
 .../include/mach}/bcm63xx_cs.h                     |  0
 .../include/mach}/bcm63xx_dev_enet.h               |  2 +-
 .../include/mach}/bcm63xx_dev_flash.h              |  0
 .../include/mach}/bcm63xx_dev_hsspi.h              |  0
 .../include/mach}/bcm63xx_dev_pci.h                |  0
 .../include/mach}/bcm63xx_dev_pcmcia.h             |  0
 .../include/mach}/bcm63xx_dev_spi.h                |  4 ++--
 .../include/mach}/bcm63xx_dev_uart.h               |  0
 .../include/mach}/bcm63xx_dev_usb_usbd.h           |  0
 .../include/mach}/bcm63xx_gpio.h                   |  2 +-
 .../include/mach}/bcm63xx_io.h                     |  2 +-
 .../include/mach}/bcm63xx_irq.h                    |  2 +-
 .../include/mach}/bcm63xx_iudma.h                  |  0
 .../include/mach}/bcm63xx_nvram.h                  |  0
 .../include/mach}/bcm63xx_regs.h                   |  0
 .../include/mach}/bcm63xx_reset.h                  |  0
 .../include/mach}/bcm63xx_timer.h                  |  0
 .../include/mach}/board_bcm963xx.h                 |  4 ++--
 .../include/mach}/cpu-feature-overrides.h          |  2 +-
 .../include/mach}/ioremap.h                        |  2 +-
 .../mach-bcm63xx => bcm63xx/include/mach}/irq.h    |  0
 arch/mips/bcm63xx/include/mach/kernel-entry-init.h |  2 ++
 arch/mips/bcm63xx/include/mach/kmalloc.h           |  2 ++
 arch/mips/bcm63xx/include/mach/mangle-port.h       |  2 ++
 .../mach-bcm63xx => bcm63xx/include/mach}/spaces.h |  0
 arch/mips/bcm63xx/include/mach/topology.h          |  2 ++
 arch/mips/bcm63xx/include/mach/war.h               |  2 ++
 arch/mips/bcm63xx/irq.c                            |  8 +++----
 arch/mips/bcm63xx/nvram.c                          |  2 +-
 arch/mips/bcm63xx/prom.c                           |  8 +++----
 arch/mips/bcm63xx/reset.c                          |  8 +++----
 arch/mips/bcm63xx/setup.c                          | 10 ++++----
 arch/mips/bcm63xx/timer.c                          |  8 +++----
 arch/mips/pci/fixup-bcm63xx.c                      |  2 +-
 arch/mips/pci/pci-bcm63xx.c                        |  2 +-
 arch/mips/pci/pci-bcm63xx.h                        |  8 +++----
 drivers/net/ethernet/broadcom/bcm63xx_enet.c       |  2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.h       |  6 ++---
 drivers/pcmcia/bcm63xx_pcmcia.c                    |  4 ++--
 drivers/pcmcia/bcm63xx_pcmcia.h                    |  2 +-
 drivers/usb/gadget/udc/bcm63xx_udc.c               | 10 ++++----
 drivers/watchdog/bcm63xx_wdt.c                     |  8 +++----
 61 files changed, 120 insertions(+), 109 deletions(-)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_board.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_cpu.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_cs.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_dev_enet.h (98%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_dev_flash.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_dev_hsspi.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_dev_pci.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_dev_pcmcia.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_dev_spi.h (75%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_dev_uart.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_dev_usb_usbd.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_gpio.h (95%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_io.h (99%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_irq.h (92%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_iudma.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_nvram.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_regs.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_reset.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/bcm63xx_timer.h (100%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/board_bcm963xx.h (93%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/cpu-feature-overrides.h (97%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/ioremap.h (97%)
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/bcm63xx/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/bcm63xx/include/mach/kmalloc.h
 create mode 100644 arch/mips/bcm63xx/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-bcm63xx => bcm63xx/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/bcm63xx/include/mach/topology.h
 create mode 100644 arch/mips/bcm63xx/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index aced6d4..e8e6f2b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -306,6 +306,7 @@ config BCM63XX
 	select HAVE_CLK
 	select MIPS_L1_CACHE_SHIFT_4
 	select CLKDEV_LOOKUP
+	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for BCM63XX based boards
 
diff --git a/arch/mips/bcm63xx/Platform b/arch/mips/bcm63xx/Platform
index 5f86b2f..03d2452 100644
--- a/arch/mips/bcm63xx/Platform
+++ b/arch/mips/bcm63xx/Platform
@@ -3,5 +3,5 @@
 #
 platform-$(CONFIG_BCM63XX)	+= bcm63xx/
 cflags-$(CONFIG_BCM63XX)	+=					\
-		-I$(srctree)/arch/mips/include/asm/mach-bcm63xx/
+		-I$(srctree)/arch/mips/bcm63xx/include
 load-$(CONFIG_BCM63XX)		:= 0xffffffff80010000
diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 36ec3dc..d0e131f 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -15,20 +15,20 @@
 #include <linux/platform_device.h>
 #include <linux/ssb/ssb.h>
 #include <asm/addrspace.h>
-#include <bcm63xx_board.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_dev_uart.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_nvram.h>
-#include <bcm63xx_dev_pci.h>
-#include <bcm63xx_dev_enet.h>
-#include <bcm63xx_dev_flash.h>
-#include <bcm63xx_dev_hsspi.h>
-#include <bcm63xx_dev_pcmcia.h>
-#include <bcm63xx_dev_spi.h>
-#include <bcm63xx_dev_usb_usbd.h>
-#include <board_bcm963xx.h>
+#include <mach/bcm63xx_board.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_dev_uart.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_nvram.h>
+#include <mach/bcm63xx_dev_pci.h>
+#include <mach/bcm63xx_dev_enet.h>
+#include <mach/bcm63xx_dev_flash.h>
+#include <mach/bcm63xx_dev_hsspi.h>
+#include <mach/bcm63xx_dev_pcmcia.h>
+#include <mach/bcm63xx_dev_spi.h>
+#include <mach/bcm63xx_dev_usb_usbd.h>
+#include <mach/board_bcm963xx.h>
 
 #include <uapi/linux/bcm933xx_hcs.h>
 
diff --git a/arch/mips/bcm63xx/clk.c b/arch/mips/bcm63xx/clk.c
index 1641159..57be153 100644
--- a/arch/mips/bcm63xx/clk.c
+++ b/arch/mips/bcm63xx/clk.c
@@ -13,10 +13,10 @@
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/delay.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_reset.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_reset.h>
 
 struct clk {
 	void		(*set)(struct clk *, int);
diff --git a/arch/mips/bcm63xx/cpu.c b/arch/mips/bcm63xx/cpu.c
index f61c16f..7af12d2 100644
--- a/arch/mips/bcm63xx/cpu.c
+++ b/arch/mips/bcm63xx/cpu.c
@@ -13,10 +13,10 @@
 #include <asm/cpu.h>
 #include <asm/cpu-info.h>
 #include <asm/mipsregs.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_irq.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_irq.h>
 
 const unsigned long *bcm63xx_regs_base;
 EXPORT_SYMBOL(bcm63xx_regs_base);
diff --git a/arch/mips/bcm63xx/cs.c b/arch/mips/bcm63xx/cs.c
index 29205ba..8e20fa6 100644
--- a/arch/mips/bcm63xx/cs.c
+++ b/arch/mips/bcm63xx/cs.c
@@ -11,10 +11,10 @@
 #include <linux/export.h>
 #include <linux/spinlock.h>
 #include <linux/log2.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_cs.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_cs.h>
 
 static DEFINE_SPINLOCK(bcm63xx_cs_lock);
 
diff --git a/arch/mips/bcm63xx/dev-enet.c b/arch/mips/bcm63xx/dev-enet.c
index 8e73d65..19ad2d8 100644
--- a/arch/mips/bcm63xx/dev-enet.c
+++ b/arch/mips/bcm63xx/dev-enet.c
@@ -10,9 +10,9 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/export.h>
-#include <bcm63xx_dev_enet.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_dev_enet.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
 
 static const unsigned long bcm6348_regs_enetdmac[] = {
 	[ENETDMAC_CHANCFG]	= ENETDMAC_CHANCFG_REG,
diff --git a/arch/mips/bcm63xx/dev-flash.c b/arch/mips/bcm63xx/dev-flash.c
index a109393..fbef9e7 100644
--- a/arch/mips/bcm63xx/dev-flash.c
+++ b/arch/mips/bcm63xx/dev-flash.c
@@ -17,10 +17,10 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_dev_flash.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_io.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_dev_flash.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_io.h>
 
 static struct mtd_partition mtd_partitions[] = {
 	{
diff --git a/arch/mips/bcm63xx/dev-hsspi.c b/arch/mips/bcm63xx/dev-hsspi.c
index 696abc4..4e30e08 100644
--- a/arch/mips/bcm63xx/dev-hsspi.c
+++ b/arch/mips/bcm63xx/dev-hsspi.c
@@ -10,9 +10,9 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_dev_hsspi.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_dev_hsspi.h>
+#include <mach/bcm63xx_regs.h>
 
 static struct resource spi_resources[] = {
 	{
diff --git a/arch/mips/bcm63xx/dev-pcmcia.c b/arch/mips/bcm63xx/dev-pcmcia.c
index 9496cd2..031ad1c 100644
--- a/arch/mips/bcm63xx/dev-pcmcia.c
+++ b/arch/mips/bcm63xx/dev-pcmcia.c
@@ -10,11 +10,11 @@
 #include <linux/kernel.h>
 #include <asm/bootinfo.h>
 #include <linux/platform_device.h>
-#include <bcm63xx_cs.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_dev_pcmcia.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_cs.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_dev_pcmcia.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
 
 static struct resource pcmcia_resources[] = {
 	/* pcmcia registers */
diff --git a/arch/mips/bcm63xx/dev-rng.c b/arch/mips/bcm63xx/dev-rng.c
index d277b4d..5aced04 100644
--- a/arch/mips/bcm63xx/dev-rng.c
+++ b/arch/mips/bcm63xx/dev-rng.c
@@ -9,7 +9,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
-#include <bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 static struct resource rng_resources[] = {
 	{
diff --git a/arch/mips/bcm63xx/dev-spi.c b/arch/mips/bcm63xx/dev-spi.c
index 2323854..d0af4ec 100644
--- a/arch/mips/bcm63xx/dev-spi.c
+++ b/arch/mips/bcm63xx/dev-spi.c
@@ -14,9 +14,9 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_dev_spi.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_dev_spi.h>
+#include <mach/bcm63xx_regs.h>
 
 static struct resource spi_resources[] = {
 	{
diff --git a/arch/mips/bcm63xx/dev-uart.c b/arch/mips/bcm63xx/dev-uart.c
index 3bc7f3b..106b8d2 100644
--- a/arch/mips/bcm63xx/dev-uart.c
+++ b/arch/mips/bcm63xx/dev-uart.c
@@ -9,7 +9,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
-#include <bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 static struct resource uart0_resources[] = {
 	{
diff --git a/arch/mips/bcm63xx/dev-usb-usbd.c b/arch/mips/bcm63xx/dev-usb-usbd.c
index 508bd9d..42e9ae9 100644
--- a/arch/mips/bcm63xx/dev-usb-usbd.c
+++ b/arch/mips/bcm63xx/dev-usb-usbd.c
@@ -12,8 +12,8 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_dev_usb_usbd.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_dev_usb_usbd.h>
 
 #define NUM_MMIO		2
 #define NUM_IRQ			7
diff --git a/arch/mips/bcm63xx/dev-wdt.c b/arch/mips/bcm63xx/dev-wdt.c
index 2a2346a..33c752ca 100644
--- a/arch/mips/bcm63xx/dev-wdt.c
+++ b/arch/mips/bcm63xx/dev-wdt.c
@@ -9,7 +9,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
-#include <bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 static struct resource wdt_resources[] = {
 	{
diff --git a/arch/mips/bcm63xx/early_printk.c b/arch/mips/bcm63xx/early_printk.c
index 9e9ec27..82cdf21 100644
--- a/arch/mips/bcm63xx/early_printk.c
+++ b/arch/mips/bcm63xx/early_printk.c
@@ -6,7 +6,7 @@
  * Copyright (C) 2008 Maxime Bizon <mbizon@freebox.fr>
  */
 
-#include <bcm63xx_io.h>
+#include <mach/bcm63xx_io.h>
 #include <linux/serial_bcm63xx.h>
 #include <asm/setup.h>
 
diff --git a/arch/mips/bcm63xx/gpio.c b/arch/mips/bcm63xx/gpio.c
index 16f353a..36cbb5e 100644
--- a/arch/mips/bcm63xx/gpio.c
+++ b/arch/mips/bcm63xx/gpio.c
@@ -13,10 +13,10 @@
 #include <linux/platform_device.h>
 #include <linux/gpio/driver.h>
 
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_gpio.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_gpio.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
 
 static u32 gpio_out_low_reg;
 
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_board.h b/arch/mips/bcm63xx/include/mach/bcm63xx_board.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_board.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_board.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_cpu.h b/arch/mips/bcm63xx/include/mach/bcm63xx_cpu.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_cpu.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_cpu.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_cs.h b/arch/mips/bcm63xx/include/mach/bcm63xx_cs.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_cs.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_cs.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_enet.h b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_enet.h
similarity index 98%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_enet.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_dev_enet.h
index da39e4d..fc91b33 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_enet.h
+++ b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_enet.h
@@ -5,7 +5,7 @@
 #include <linux/if_ether.h>
 #include <linux/init.h>
 
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_regs.h>
 
 /*
  * on board ethernet platform data
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_flash.h b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_flash.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_flash.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_dev_flash.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_hsspi.h b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_hsspi.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_hsspi.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_dev_hsspi.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_pci.h b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_pci.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_pci.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_dev_pci.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_pcmcia.h b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_pcmcia.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_pcmcia.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_dev_pcmcia.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_spi.h b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_spi.h
similarity index 75%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_spi.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_dev_spi.h
index 0ab7505..2ff8a54 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_spi.h
+++ b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_spi.h
@@ -3,8 +3,8 @@
 #define BCM63XX_DEV_SPI_H
 
 #include <linux/types.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
 
 int __init bcm63xx_spi_register(void);
 
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_uart.h b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_uart.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_uart.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_dev_uart.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_usb_usbd.h b/arch/mips/bcm63xx/include/mach/bcm63xx_dev_usb_usbd.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_dev_usb_usbd.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_dev_usb_usbd.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h b/arch/mips/bcm63xx/include/mach/bcm63xx_gpio.h
similarity index 95%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_gpio.h
index 8fe88c2..c4632a5 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h
+++ b/arch/mips/bcm63xx/include/mach/bcm63xx_gpio.h
@@ -3,7 +3,7 @@
 #define BCM63XX_GPIO_H
 
 #include <linux/init.h>
-#include <bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 int __init bcm63xx_gpio_init(void);
 
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_io.h b/arch/mips/bcm63xx/include/mach/bcm63xx_io.h
similarity index 99%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_io.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_io.h
index 31c6924..5086a6e 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_io.h
+++ b/arch/mips/bcm63xx/include/mach/bcm63xx_io.h
@@ -2,7 +2,7 @@
 #ifndef BCM63XX_IO_H_
 #define BCM63XX_IO_H_
 
-#include <asm/mach-bcm63xx/bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 /*
  * Physical memory map, RAM is mapped at 0x0.
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_irq.h b/arch/mips/bcm63xx/include/mach/bcm63xx_irq.h
similarity index 92%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_irq.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_irq.h
index 7887bc6..2da3cc3 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_irq.h
+++ b/arch/mips/bcm63xx/include/mach/bcm63xx_irq.h
@@ -2,7 +2,7 @@
 #ifndef BCM63XX_IRQ_H_
 #define BCM63XX_IRQ_H_
 
-#include <bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 #define IRQ_INTERNAL_BASE		8
 #define IRQ_EXTERNAL_BASE		100
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_iudma.h b/arch/mips/bcm63xx/include/mach/bcm63xx_iudma.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_iudma.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_iudma.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h b/arch/mips/bcm63xx/include/mach/bcm63xx_nvram.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_nvram.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h b/arch/mips/bcm63xx/include/mach/bcm63xx_regs.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_regs.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_reset.h b/arch/mips/bcm63xx/include/mach/bcm63xx_reset.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_reset.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_reset.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_timer.h b/arch/mips/bcm63xx/include/mach/bcm63xx_timer.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/bcm63xx_timer.h
rename to arch/mips/bcm63xx/include/mach/bcm63xx_timer.h
diff --git a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h b/arch/mips/bcm63xx/include/mach/board_bcm963xx.h
similarity index 93%
rename from arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
rename to arch/mips/bcm63xx/include/mach/board_bcm963xx.h
index 830f53f..8cb92fb 100644
--- a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
+++ b/arch/mips/bcm63xx/include/mach/board_bcm963xx.h
@@ -5,8 +5,8 @@
 #include <linux/types.h>
 #include <linux/gpio.h>
 #include <linux/leds.h>
-#include <bcm63xx_dev_enet.h>
-#include <bcm63xx_dev_usb_usbd.h>
+#include <mach/bcm63xx_dev_enet.h>
+#include <mach/bcm63xx_dev_usb_usbd.h>
 
 /*
  * flash mapping
diff --git a/arch/mips/include/asm/mach-bcm63xx/cpu-feature-overrides.h b/arch/mips/bcm63xx/include/mach/cpu-feature-overrides.h
similarity index 97%
rename from arch/mips/include/asm/mach-bcm63xx/cpu-feature-overrides.h
rename to arch/mips/bcm63xx/include/mach/cpu-feature-overrides.h
index 0ebecbd..d84d8c2 100644
--- a/arch/mips/include/asm/mach-bcm63xx/cpu-feature-overrides.h
+++ b/arch/mips/bcm63xx/include/mach/cpu-feature-overrides.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_MACH_BCM963XX_CPU_FEATURE_OVERRIDES_H
 #define __ASM_MACH_BCM963XX_CPU_FEATURE_OVERRIDES_H
 
-#include <bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 #define cpu_has_tlb			1
 #define cpu_has_4kex			1
diff --git a/arch/mips/include/asm/mach-bcm63xx/ioremap.h b/arch/mips/bcm63xx/include/mach/ioremap.h
similarity index 97%
rename from arch/mips/include/asm/mach-bcm63xx/ioremap.h
rename to arch/mips/bcm63xx/include/mach/ioremap.h
index 8cd261e..82d60da 100644
--- a/arch/mips/include/asm/mach-bcm63xx/ioremap.h
+++ b/arch/mips/bcm63xx/include/mach/ioremap.h
@@ -2,7 +2,7 @@
 #ifndef BCM63XX_IOREMAP_H_
 #define BCM63XX_IOREMAP_H_
 
-#include <bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 static inline phys_addr_t fixup_bigphys_addr(phys_addr_t phys_addr, phys_addr_t size)
 {
diff --git a/arch/mips/include/asm/mach-bcm63xx/irq.h b/arch/mips/bcm63xx/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/irq.h
rename to arch/mips/bcm63xx/include/mach/irq.h
diff --git a/arch/mips/bcm63xx/include/mach/kernel-entry-init.h b/arch/mips/bcm63xx/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/bcm63xx/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/bcm63xx/include/mach/kmalloc.h b/arch/mips/bcm63xx/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/bcm63xx/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/bcm63xx/include/mach/mangle-port.h b/arch/mips/bcm63xx/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/bcm63xx/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-bcm63xx/spaces.h b/arch/mips/bcm63xx/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-bcm63xx/spaces.h
rename to arch/mips/bcm63xx/include/mach/spaces.h
diff --git a/arch/mips/bcm63xx/include/mach/topology.h b/arch/mips/bcm63xx/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/bcm63xx/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/bcm63xx/include/mach/war.h b/arch/mips/bcm63xx/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/bcm63xx/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/bcm63xx/irq.c b/arch/mips/bcm63xx/irq.c
index 2548013..b73cf80 100644
--- a/arch/mips/bcm63xx/irq.c
+++ b/arch/mips/bcm63xx/irq.c
@@ -14,10 +14,10 @@
 #include <linux/spinlock.h>
 #include <asm/irq_cpu.h>
 #include <asm/mipsregs.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_irq.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_irq.h>
 
 
 static DEFINE_SPINLOCK(ipic_lock);
diff --git a/arch/mips/bcm63xx/nvram.c b/arch/mips/bcm63xx/nvram.c
index 05757ae..1f8ce18 100644
--- a/arch/mips/bcm63xx/nvram.c
+++ b/arch/mips/bcm63xx/nvram.c
@@ -17,7 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/if_ether.h>
 
-#include <bcm63xx_nvram.h>
+#include <mach/bcm63xx_nvram.h>
 
 #define BCM63XX_DEFAULT_PSI_SIZE	64
 
diff --git a/arch/mips/bcm63xx/prom.c b/arch/mips/bcm63xx/prom.c
index df69eaa..1d8869c 100644
--- a/arch/mips/bcm63xx/prom.c
+++ b/arch/mips/bcm63xx/prom.c
@@ -13,10 +13,10 @@
 #include <asm/bmips.h>
 #include <asm/smp-ops.h>
 #include <asm/mipsregs.h>
-#include <bcm63xx_board.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_board.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
 
 void __init prom_init(void)
 {
diff --git a/arch/mips/bcm63xx/reset.c b/arch/mips/bcm63xx/reset.c
index 64574e7..28f0834 100644
--- a/arch/mips/bcm63xx/reset.c
+++ b/arch/mips/bcm63xx/reset.c
@@ -12,10 +12,10 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_reset.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_reset.h>
 
 #define __GEN_RESET_BITS_TABLE(__cpu)					\
 	[BCM63XX_RESET_SPI]		= BCM## __cpu ##_RESET_SPI,	\
diff --git a/arch/mips/bcm63xx/setup.c b/arch/mips/bcm63xx/setup.c
index e28ee9a..fd30e17 100644
--- a/arch/mips/bcm63xx/setup.c
+++ b/arch/mips/bcm63xx/setup.c
@@ -16,11 +16,11 @@
 #include <asm/time.h>
 #include <asm/reboot.h>
 #include <asm/cacheflush.h>
-#include <bcm63xx_board.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_gpio.h>
+#include <mach/bcm63xx_board.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_gpio.h>
 
 void bcm63xx_machine_halt(void)
 {
diff --git a/arch/mips/bcm63xx/timer.c b/arch/mips/bcm63xx/timer.c
index a860658..f633ef5 100644
--- a/arch/mips/bcm63xx/timer.c
+++ b/arch/mips/bcm63xx/timer.c
@@ -13,10 +13,10 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/clk.h>
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_timer.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_timer.h>
+#include <mach/bcm63xx_regs.h>
 
 static DEFINE_RAW_SPINLOCK(timer_reg_lock);
 static DEFINE_RAW_SPINLOCK(timer_data_lock);
diff --git a/arch/mips/pci/fixup-bcm63xx.c b/arch/mips/pci/fixup-bcm63xx.c
index 3408630..f997274 100644
--- a/arch/mips/pci/fixup-bcm63xx.c
+++ b/arch/mips/pci/fixup-bcm63xx.c
@@ -8,7 +8,7 @@
 
 #include <linux/types.h>
 #include <linux/pci.h>
-#include <bcm63xx_cpu.h>
+#include <mach/bcm63xx_cpu.h>
 
 int pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 {
diff --git a/arch/mips/pci/pci-bcm63xx.c b/arch/mips/pci/pci-bcm63xx.c
index 5548365..8e40aca 100644
--- a/arch/mips/pci/pci-bcm63xx.c
+++ b/arch/mips/pci/pci-bcm63xx.c
@@ -14,7 +14,7 @@
 #include <linux/clk.h>
 #include <asm/bootinfo.h>
 
-#include <bcm63xx_reset.h>
+#include <mach/bcm63xx_reset.h>
 
 #include "pci-bcm63xx.h"
 
diff --git a/arch/mips/pci/pci-bcm63xx.h b/arch/mips/pci/pci-bcm63xx.h
index 214def1..47bbbe9 100644
--- a/arch/mips/pci/pci-bcm63xx.h
+++ b/arch/mips/pci/pci-bcm63xx.h
@@ -2,10 +2,10 @@
 #ifndef PCI_BCM63XX_H_
 #define PCI_BCM63XX_H_
 
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_dev_pci.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_dev_pci.h>
 
 /*
  * Cardbus shares  the PCI bus, but has	 no IDSEL, so a	 special id is
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 620cd3f..f5aa8bc 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -18,7 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/if_vlan.h>
 
-#include <bcm63xx_dev_enet.h>
+#include <mach/bcm63xx_dev_enet.h>
 #include "bcm63xx_enet.h"
 
 static char bcm_enet_driver_name[] = "bcm63xx_enet";
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
index 1d3c917..72c00f7 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
@@ -8,9 +8,9 @@
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 
-#include <bcm63xx_regs.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_iudma.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_iudma.h>
 
 /* default number of descriptor */
 #define BCMENET_DEF_RX_DESC	64
diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index 16f5731..463a1dc 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -16,8 +16,8 @@
 #include <linux/pci.h>
 #include <linux/gpio.h>
 
-#include <bcm63xx_regs.h>
-#include <bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_io.h>
 #include "bcm63xx_pcmcia.h"
 
 #define PFX	"bcm63xx_pcmcia: "
diff --git a/drivers/pcmcia/bcm63xx_pcmcia.h b/drivers/pcmcia/bcm63xx_pcmcia.h
index 2122c59..2b7e1a5 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.h
+++ b/drivers/pcmcia/bcm63xx_pcmcia.h
@@ -5,7 +5,7 @@
 #include <linux/types.h>
 #include <linux/timer.h>
 #include <pcmcia/ss.h>
-#include <bcm63xx_dev_pcmcia.h>
+#include <mach/bcm63xx_dev_pcmcia.h>
 
 /* socket polling rate in ms */
 #define BCM63XX_PCMCIA_POLL_RATE	500
diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index 5450181..dc2654a 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -30,11 +30,11 @@
 #include <linux/usb/gadget.h>
 #include <linux/workqueue.h>
 
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_iudma.h>
-#include <bcm63xx_dev_usb_usbd.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_iudma.h>
+#include <mach/bcm63xx_dev_usb_usbd.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
 
 #define DRV_MODULE_NAME		"bcm63xx_udc"
 
diff --git a/drivers/watchdog/bcm63xx_wdt.c b/drivers/watchdog/bcm63xx_wdt.c
index 7cdb2536..7cf0545 100644
--- a/drivers/watchdog/bcm63xx_wdt.c
+++ b/drivers/watchdog/bcm63xx_wdt.c
@@ -27,10 +27,10 @@
 #include <linux/resource.h>
 #include <linux/platform_device.h>
 
-#include <bcm63xx_cpu.h>
-#include <bcm63xx_io.h>
-#include <bcm63xx_regs.h>
-#include <bcm63xx_timer.h>
+#include <mach/bcm63xx_cpu.h>
+#include <mach/bcm63xx_io.h>
+#include <mach/bcm63xx_regs.h>
+#include <mach/bcm63xx_timer.h>
 
 #define PFX KBUILD_MODNAME
 
-- 
1.8.3.1

