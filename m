Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8731976B9
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729732AbgC3IjA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:39:00 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56756 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729077AbgC3Ii7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:38:59 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz2gdsIFeI5chAA--.13S2;
        Mon, 30 Mar 2020 16:38:53 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/39] MIPS: loongson2ef: Add header files path prefix
Date:   Mon, 30 Mar 2020 04:38:53 -0400
Message-Id: <1585557533-20193-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxz2gdsIFeI5chAA--.13S2
X-Coremail-Antispam: 1UD129KBjvAXoWfArykJFW5Ar4UXry5tF4UCFg_yoW5Gw4fKo
        WIvFnrKr4rWFW7AFy2qFy5Ja4kKFnYqr4Yy34xArZrJ3sIy3srJFW09F17tr1YkF1xt3Z3
        G3yF9rW8XFn7Jay8n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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

Remove header files from arch/mips/include/asm/mach-loongson2ef
to arch/mips/loongson2ef/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                   | 1 +
 arch/mips/loongson2ef/Platform                                      | 2 +-
 arch/mips/loongson2ef/common/bonito-irq.c                           | 2 +-
 arch/mips/loongson2ef/common/cs5536/cs5536_acc.c                    | 4 ++--
 arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c                   | 4 ++--
 arch/mips/loongson2ef/common/cs5536/cs5536_ide.c                    | 4 ++--
 arch/mips/loongson2ef/common/cs5536/cs5536_isa.c                    | 4 ++--
 arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c                  | 2 +-
 arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c                   | 4 ++--
 arch/mips/loongson2ef/common/cs5536/cs5536_pci.c                    | 4 ++--
 arch/mips/loongson2ef/common/env.c                                  | 2 +-
 arch/mips/loongson2ef/common/init.c                                 | 2 +-
 arch/mips/loongson2ef/common/irq.c                                  | 2 +-
 arch/mips/loongson2ef/common/machtype.c                             | 4 ++--
 arch/mips/loongson2ef/common/mem.c                                  | 6 +++---
 arch/mips/loongson2ef/common/pci.c                                  | 4 ++--
 arch/mips/loongson2ef/common/pm.c                                   | 2 +-
 arch/mips/loongson2ef/common/reset.c                                | 2 +-
 arch/mips/loongson2ef/common/serial.c                               | 4 ++--
 arch/mips/loongson2ef/common/setup.c                                | 2 +-
 arch/mips/loongson2ef/common/time.c                                 | 4 ++--
 arch/mips/loongson2ef/common/uart_base.c                            | 2 +-
 arch/mips/loongson2ef/fuloong-2e/irq.c                              | 2 +-
 arch/mips/loongson2ef/fuloong-2e/reset.c                            | 2 +-
 .../include/mach}/cpu-feature-overrides.h                           | 0
 .../mach-loongson2ef => loongson2ef/include/mach}/cs5536/cs5536.h   | 0
 .../include/mach}/cs5536/cs5536_mfgpt.h                             | 4 ++--
 .../include/mach}/cs5536/cs5536_pci.h                               | 0
 .../include/mach}/cs5536/cs5536_vsm.h                               | 0
 arch/mips/loongson2ef/include/mach/ioremap.h                        | 2 ++
 arch/mips/loongson2ef/include/mach/irq.h                            | 2 ++
 arch/mips/loongson2ef/include/mach/kernel-entry-init.h              | 2 ++
 arch/mips/loongson2ef/include/mach/kmalloc.h                        | 2 ++
 .../asm/mach-loongson2ef => loongson2ef/include/mach}/loongson.h    | 0
 .../asm/mach-loongson2ef => loongson2ef/include/mach}/machine.h     | 0
 arch/mips/loongson2ef/include/mach/mangle-port.h                    | 2 ++
 .../asm/mach-loongson2ef => loongson2ef/include/mach}/mc146818rtc.h | 0
 .../asm/mach-loongson2ef => loongson2ef/include/mach}/mem.h         | 0
 .../asm/mach-loongson2ef => loongson2ef/include/mach}/pci.h         | 0
 .../asm/mach-loongson2ef => loongson2ef/include/mach}/spaces.h      | 0
 arch/mips/loongson2ef/include/mach/topology.h                       | 2 ++
 arch/mips/loongson2ef/include/mach/war.h                            | 2 ++
 arch/mips/loongson2ef/lemote-2f/clock.c                             | 2 +-
 arch/mips/loongson2ef/lemote-2f/irq.c                               | 4 ++--
 arch/mips/loongson2ef/lemote-2f/machtype.c                          | 2 +-
 arch/mips/loongson2ef/lemote-2f/pm.c                                | 4 ++--
 arch/mips/loongson2ef/lemote-2f/reset.c                             | 4 ++--
 arch/mips/oprofile/op_model_loongson2.c                             | 2 +-
 arch/mips/pci/fixup-lemote2f.c                                      | 6 +++---
 arch/mips/pci/ops-loongson2.c                                       | 6 +++---
 50 files changed, 67 insertions(+), 52 deletions(-)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/cs5536/cs5536.h (100%)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/cs5536/cs5536_mfgpt.h (91%)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/cs5536/cs5536_pci.h (100%)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/cs5536/cs5536_vsm.h (100%)
 create mode 100644 arch/mips/loongson2ef/include/mach/ioremap.h
 create mode 100644 arch/mips/loongson2ef/include/mach/irq.h
 create mode 100644 arch/mips/loongson2ef/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/loongson2ef/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/loongson.h (100%)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/machine.h (100%)
 create mode 100644 arch/mips/loongson2ef/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/mc146818rtc.h (100%)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/mem.h (100%)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/pci.h (100%)
 rename arch/mips/{include/asm/mach-loongson2ef => loongson2ef/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/loongson2ef/include/mach/topology.h
 create mode 100644 arch/mips/loongson2ef/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a7f821d..8645207 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -457,6 +457,7 @@ config MACH_LOONGSON32
 config MACH_LOONGSON2EF
 	bool "Loongson-2E/F family of machines"
 	select SYS_SUPPORTS_ZBOOT
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables the support of early Loongson-2E/F family of machines.
 
diff --git a/arch/mips/loongson2ef/Platform b/arch/mips/loongson2ef/Platform
index 3aca429..7d80671 100644
--- a/arch/mips/loongson2ef/Platform
+++ b/arch/mips/loongson2ef/Platform
@@ -27,6 +27,6 @@ endif
 #
 
 platform-$(CONFIG_MACH_LOONGSON2EF) += loongson2ef/
-cflags-$(CONFIG_MACH_LOONGSON2EF) += -I$(srctree)/arch/mips/include/asm/mach-loongson2ef -mno-branch-likely
+cflags-$(CONFIG_MACH_LOONGSON2EF) += -I$(srctree)/arch/mips/loongson2ef/include -mno-branch-likely
 load-$(CONFIG_LEMOTE_FULOONG2E) += 0xffffffff80100000
 load-$(CONFIG_LEMOTE_MACH2F) += 0xffffffff80200000
diff --git a/arch/mips/loongson2ef/common/bonito-irq.c b/arch/mips/loongson2ef/common/bonito-irq.c
index c06ad41..2bb1d61 100644
--- a/arch/mips/loongson2ef/common/bonito-irq.c
+++ b/arch/mips/loongson2ef/common/bonito-irq.c
@@ -10,7 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/compiler.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 static inline void bonito_irq_enable(struct irq_data *d)
 {
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_acc.c b/arch/mips/loongson2ef/common/cs5536/cs5536_acc.c
index ff50aae..242b162 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_acc.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_acc.c
@@ -9,8 +9,8 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 
-#include <cs5536/cs5536.h>
-#include <cs5536/cs5536_pci.h>
+#include <mach/cs5536/cs5536.h>
+#include <mach/cs5536/cs5536_pci.h>
 
 void pci_acc_write_reg(int reg, u32 value)
 {
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c
index bd4c39f..16c9886 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c
@@ -9,8 +9,8 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 
-#include <cs5536/cs5536.h>
-#include <cs5536/cs5536_pci.h>
+#include <mach/cs5536/cs5536.h>
+#include <mach/cs5536/cs5536_pci.h>
 
 void pci_ehci_write_reg(int reg, u32 value)
 {
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_ide.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ide.c
index bb93329..d6b46e9 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_ide.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_ide.c
@@ -9,8 +9,8 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 
-#include <cs5536/cs5536.h>
-#include <cs5536/cs5536_pci.h>
+#include <mach/cs5536/cs5536.h>
+#include <mach/cs5536/cs5536_pci.h>
 
 void pci_ide_write_reg(int reg, u32 value)
 {
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c b/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
index 5ad38f8..35cb825 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
@@ -10,8 +10,8 @@
  */
 
 #include <linux/pci.h>
-#include <cs5536/cs5536.h>
-#include <cs5536/cs5536_pci.h>
+#include <mach/cs5536/cs5536.h>
+#include <mach/cs5536/cs5536_pci.h>
 
 /* common variables for PCI_ISA_READ/WRITE_BAR */
 static const u32 divil_msr_reg[6] = {
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c b/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
index f21a540..69677d5 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
@@ -21,7 +21,7 @@
 
 #include <asm/time.h>
 
-#include <cs5536/cs5536_mfgpt.h>
+#include <mach/cs5536/cs5536_mfgpt.h>
 
 static DEFINE_RAW_SPINLOCK(mfgpt_lock);
 
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c
index 71a52b1..c11e380 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c
@@ -9,8 +9,8 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 
-#include <cs5536/cs5536.h>
-#include <cs5536/cs5536_pci.h>
+#include <mach/cs5536/cs5536.h>
+#include <mach/cs5536/cs5536_pci.h>
 
 void pci_ohci_write_reg(int reg, u32 value)
 {
diff --git a/arch/mips/loongson2ef/common/cs5536/cs5536_pci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_pci.c
index 202c89b..03b0cf2 100644
--- a/arch/mips/loongson2ef/common/cs5536/cs5536_pci.c
+++ b/arch/mips/loongson2ef/common/cs5536/cs5536_pci.c
@@ -17,8 +17,8 @@
  */
 
 #include <linux/types.h>
-#include <cs5536/cs5536_pci.h>
-#include <cs5536/cs5536_vsm.h>
+#include <mach/cs5536/cs5536_pci.h>
+#include <mach/cs5536/cs5536_vsm.h>
 
 enum {
 	CS5536_FUNC_START = -1,
diff --git a/arch/mips/loongson2ef/common/env.c b/arch/mips/loongson2ef/common/env.c
index 6f20bdf..18231a9 100644
--- a/arch/mips/loongson2ef/common/env.c
+++ b/arch/mips/loongson2ef/common/env.c
@@ -16,7 +16,7 @@
 #include <linux/export.h>
 #include <asm/bootinfo.h>
 #include <asm/fw/fw.h>
-#include <loongson.h>
+#include <mach/loongson.h>
 
 u32 cpu_clock_freq;
 EXPORT_SYMBOL(cpu_clock_freq);
diff --git a/arch/mips/loongson2ef/common/init.c b/arch/mips/loongson2ef/common/init.c
index 4551217..1849abb 100644
--- a/arch/mips/loongson2ef/common/init.c
+++ b/arch/mips/loongson2ef/common/init.c
@@ -11,7 +11,7 @@
 #include <asm/cacheflush.h>
 #include <asm/fw/fw.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 /* Loongson CPU address windows config space base address */
 unsigned long __maybe_unused _loongson_addrwincfg_base;
diff --git a/arch/mips/loongson2ef/common/irq.c b/arch/mips/loongson2ef/common/irq.c
index 0ea93c1..99be75b 100644
--- a/arch/mips/loongson2ef/common/irq.c
+++ b/arch/mips/loongson2ef/common/irq.c
@@ -6,7 +6,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 /*
  * the first level int-handler will jump here if it is a bonito irq
  */
diff --git a/arch/mips/loongson2ef/common/machtype.c b/arch/mips/loongson2ef/common/machtype.c
index 82f6de4..4a108b9 100644
--- a/arch/mips/loongson2ef/common/machtype.c
+++ b/arch/mips/loongson2ef/common/machtype.c
@@ -8,8 +8,8 @@
 #include <linux/errno.h>
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
-#include <machine.h>
+#include <mach/loongson.h>
+#include <mach/machine.h>
 
 /* please ensure the length of the machtype string is less than 50 */
 #define MACHTYPE_LEN 50
diff --git a/arch/mips/loongson2ef/common/mem.c b/arch/mips/loongson2ef/common/mem.c
index ae21f1c..93cb052 100644
--- a/arch/mips/loongson2ef/common/mem.c
+++ b/arch/mips/loongson2ef/common/mem.c
@@ -8,9 +8,9 @@
 
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
-#include <mem.h>
-#include <pci.h>
+#include <mach/loongson.h>
+#include <mach/mem.h>
+#include <mach/pci.h>
 
 
 u32 memsize, highmemsize;
diff --git a/arch/mips/loongson2ef/common/pci.c b/arch/mips/loongson2ef/common/pci.c
index 2009169..6ce8bf3 100644
--- a/arch/mips/loongson2ef/common/pci.c
+++ b/arch/mips/loongson2ef/common/pci.c
@@ -5,8 +5,8 @@
  */
 #include <linux/pci.h>
 
-#include <pci.h>
-#include <loongson.h>
+#include <mach/pci.h>
+#include <mach/loongson.h>
 
 static struct resource loongson_pci_mem_resource = {
 	.name	= "pci memory space",
diff --git a/arch/mips/loongson2ef/common/pm.c b/arch/mips/loongson2ef/common/pm.c
index bcb7ae9..7282017 100644
--- a/arch/mips/loongson2ef/common/pm.c
+++ b/arch/mips/loongson2ef/common/pm.c
@@ -12,7 +12,7 @@
 #include <asm/i8259.h>
 #include <asm/mipsregs.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 static unsigned int __maybe_unused cached_master_mask;	/* i8259A */
 static unsigned int __maybe_unused cached_slave_mask;
diff --git a/arch/mips/loongson2ef/common/reset.c b/arch/mips/loongson2ef/common/reset.c
index e49c406..ff9131c 100644
--- a/arch/mips/loongson2ef/common/reset.c
+++ b/arch/mips/loongson2ef/common/reset.c
@@ -12,7 +12,7 @@
 #include <asm/idle.h>
 #include <asm/reboot.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 static inline void loongson_reboot(void)
 {
diff --git a/arch/mips/loongson2ef/common/serial.c b/arch/mips/loongson2ef/common/serial.c
index ac4f6e3..7f2a3ea 100644
--- a/arch/mips/loongson2ef/common/serial.c
+++ b/arch/mips/loongson2ef/common/serial.c
@@ -16,8 +16,8 @@
 
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
-#include <machine.h>
+#include <mach/loongson.h>
+#include <mach/machine.h>
 
 #define PORT(int, clk)			\
 {								\
diff --git a/arch/mips/loongson2ef/common/setup.c b/arch/mips/loongson2ef/common/setup.c
index 4fd27f4..6fb9f9f 100644
--- a/arch/mips/loongson2ef/common/setup.c
+++ b/arch/mips/loongson2ef/common/setup.c
@@ -9,7 +9,7 @@
 #include <asm/wbflush.h>
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 static void wbflush_loongson(void)
 {
diff --git a/arch/mips/loongson2ef/common/time.c b/arch/mips/loongson2ef/common/time.c
index 585741a..0248eb51 100644
--- a/arch/mips/loongson2ef/common/time.c
+++ b/arch/mips/loongson2ef/common/time.c
@@ -10,8 +10,8 @@
 #include <asm/time.h>
 #include <asm/hpet.h>
 
-#include <loongson.h>
-#include <cs5536/cs5536_mfgpt.h>
+#include <mach/loongson.h>
+#include <mach/cs5536/cs5536_mfgpt.h>
 
 void __init plat_time_init(void)
 {
diff --git a/arch/mips/loongson2ef/common/uart_base.c b/arch/mips/loongson2ef/common/uart_base.c
index 522bea6..25e8cee 100644
--- a/arch/mips/loongson2ef/common/uart_base.c
+++ b/arch/mips/loongson2ef/common/uart_base.c
@@ -8,7 +8,7 @@
 #include <asm/bootinfo.h>
 #include <asm/setup.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 /* raw */
 unsigned long loongson_uart_base;
diff --git a/arch/mips/loongson2ef/fuloong-2e/irq.c b/arch/mips/loongson2ef/fuloong-2e/irq.c
index 305aa2e..340acad 100644
--- a/arch/mips/loongson2ef/fuloong-2e/irq.c
+++ b/arch/mips/loongson2ef/fuloong-2e/irq.c
@@ -8,7 +8,7 @@
 #include <asm/irq_cpu.h>
 #include <asm/i8259.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 static void i8259_irqdispatch(void)
 {
diff --git a/arch/mips/loongson2ef/fuloong-2e/reset.c b/arch/mips/loongson2ef/fuloong-2e/reset.c
index 8273de1..7fb45cb 100644
--- a/arch/mips/loongson2ef/fuloong-2e/reset.c
+++ b/arch/mips/loongson2ef/fuloong-2e/reset.c
@@ -6,7 +6,7 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 void mach_prepare_reboot(void)
 {
diff --git a/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h b/arch/mips/loongson2ef/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
rename to arch/mips/loongson2ef/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536.h b/arch/mips/loongson2ef/include/mach/cs5536/cs5536.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536.h
rename to arch/mips/loongson2ef/include/mach/cs5536/cs5536.h
diff --git a/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h b/arch/mips/loongson2ef/include/mach/cs5536/cs5536_mfgpt.h
similarity index 91%
rename from arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h
rename to arch/mips/loongson2ef/include/mach/cs5536/cs5536_mfgpt.h
index 52e8bb0..c8903b2 100644
--- a/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h
+++ b/arch/mips/loongson2ef/include/mach/cs5536/cs5536_mfgpt.h
@@ -6,8 +6,8 @@
 #ifndef _CS5536_MFGPT_H
 #define _CS5536_MFGPT_H
 
-#include <cs5536/cs5536.h>
-#include <cs5536/cs5536_pci.h>
+#include <mach/cs5536/cs5536.h>
+#include <mach/cs5536/cs5536_pci.h>
 
 #ifdef CONFIG_CS5536_MFGPT
 extern void setup_mfgpt0_timer(void);
diff --git a/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h b/arch/mips/loongson2ef/include/mach/cs5536/cs5536_pci.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h
rename to arch/mips/loongson2ef/include/mach/cs5536/cs5536_pci.h
diff --git a/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_vsm.h b/arch/mips/loongson2ef/include/mach/cs5536/cs5536_vsm.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_vsm.h
rename to arch/mips/loongson2ef/include/mach/cs5536/cs5536_vsm.h
diff --git a/arch/mips/loongson2ef/include/mach/ioremap.h b/arch/mips/loongson2ef/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/loongson2ef/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/loongson2ef/include/mach/irq.h b/arch/mips/loongson2ef/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/loongson2ef/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/loongson2ef/include/mach/kernel-entry-init.h b/arch/mips/loongson2ef/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/loongson2ef/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/loongson2ef/include/mach/kmalloc.h b/arch/mips/loongson2ef/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/loongson2ef/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h b/arch/mips/loongson2ef/include/mach/loongson.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/loongson.h
rename to arch/mips/loongson2ef/include/mach/loongson.h
diff --git a/arch/mips/include/asm/mach-loongson2ef/machine.h b/arch/mips/loongson2ef/include/mach/machine.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/machine.h
rename to arch/mips/loongson2ef/include/mach/machine.h
diff --git a/arch/mips/loongson2ef/include/mach/mangle-port.h b/arch/mips/loongson2ef/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/loongson2ef/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h b/arch/mips/loongson2ef/include/mach/mc146818rtc.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
rename to arch/mips/loongson2ef/include/mach/mc146818rtc.h
diff --git a/arch/mips/include/asm/mach-loongson2ef/mem.h b/arch/mips/loongson2ef/include/mach/mem.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/mem.h
rename to arch/mips/loongson2ef/include/mach/mem.h
diff --git a/arch/mips/include/asm/mach-loongson2ef/pci.h b/arch/mips/loongson2ef/include/mach/pci.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/pci.h
rename to arch/mips/loongson2ef/include/mach/pci.h
diff --git a/arch/mips/include/asm/mach-loongson2ef/spaces.h b/arch/mips/loongson2ef/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson2ef/spaces.h
rename to arch/mips/loongson2ef/include/mach/spaces.h
diff --git a/arch/mips/loongson2ef/include/mach/topology.h b/arch/mips/loongson2ef/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/loongson2ef/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/loongson2ef/include/mach/war.h b/arch/mips/loongson2ef/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/loongson2ef/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/loongson2ef/lemote-2f/clock.c b/arch/mips/loongson2ef/lemote-2f/clock.c
index 414f282..af1978e 100644
--- a/arch/mips/loongson2ef/lemote-2f/clock.c
+++ b/arch/mips/loongson2ef/lemote-2f/clock.c
@@ -15,7 +15,7 @@
 #include <linux/spinlock.h>
 
 #include <asm/clock.h>
-#include <asm/mach-loongson2ef/loongson.h>
+#include <mach/loongson.h>
 
 static LIST_HEAD(clock_list);
 static DEFINE_SPINLOCK(clock_lock);
diff --git a/arch/mips/loongson2ef/lemote-2f/irq.c b/arch/mips/loongson2ef/lemote-2f/irq.c
index 6f00579..f13dd71 100644
--- a/arch/mips/loongson2ef/lemote-2f/irq.c
+++ b/arch/mips/loongson2ef/lemote-2f/irq.c
@@ -12,8 +12,8 @@
 #include <asm/i8259.h>
 #include <asm/mipsregs.h>
 
-#include <loongson.h>
-#include <machine.h>
+#include <mach/loongson.h>
+#include <mach/machine.h>
 
 #define LOONGSON_TIMER_IRQ	(MIPS_CPU_IRQ_BASE + 7) /* cpu timer */
 #define LOONGSON_NORTH_BRIDGE_IRQ	(MIPS_CPU_IRQ_BASE + 6) /* bonito */
diff --git a/arch/mips/loongson2ef/lemote-2f/machtype.c b/arch/mips/loongson2ef/lemote-2f/machtype.c
index 9462a3a..0948f8f 100644
--- a/arch/mips/loongson2ef/lemote-2f/machtype.c
+++ b/arch/mips/loongson2ef/lemote-2f/machtype.c
@@ -5,7 +5,7 @@
  */
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 void __init mach_prom_init_machtype(void)
 {
diff --git a/arch/mips/loongson2ef/lemote-2f/pm.c b/arch/mips/loongson2ef/lemote-2f/pm.c
index 3d00272..91b2c9f 100644
--- a/arch/mips/loongson2ef/lemote-2f/pm.c
+++ b/arch/mips/loongson2ef/lemote-2f/pm.c
@@ -16,9 +16,9 @@
 #include <asm/mipsregs.h>
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
-#include <cs5536/cs5536_mfgpt.h>
+#include <mach/cs5536/cs5536_mfgpt.h>
 #include "ec_kb3310b.h"
 
 #define I8042_KBD_IRQ		1
diff --git a/arch/mips/loongson2ef/lemote-2f/reset.c b/arch/mips/loongson2ef/lemote-2f/reset.c
index 197dae4..a97ab01 100644
--- a/arch/mips/loongson2ef/lemote-2f/reset.c
+++ b/arch/mips/loongson2ef/lemote-2f/reset.c
@@ -13,9 +13,9 @@
 
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
-#include <cs5536/cs5536.h>
+#include <mach/cs5536/cs5536.h>
 #include "ec_kb3310b.h"
 
 static void reset_cpu(void)
diff --git a/arch/mips/oprofile/op_model_loongson2.c b/arch/mips/oprofile/op_model_loongson2.c
index b249ec0..b8ca331 100644
--- a/arch/mips/oprofile/op_model_loongson2.c
+++ b/arch/mips/oprofile/op_model_loongson2.c
@@ -13,7 +13,7 @@
 #include <linux/oprofile.h>
 #include <linux/interrupt.h>
 
-#include <loongson.h>			/* LOONGSON2_PERFCNT_IRQ */
+#include <mach/loongson.h>			/* LOONGSON2_PERFCNT_IRQ */
 #include "op_impl.h"
 
 #define LOONGSON2_CPU_TYPE	"mips/loongson2"
diff --git a/arch/mips/pci/fixup-lemote2f.c b/arch/mips/pci/fixup-lemote2f.c
index 632ff2d..955dcbc 100644
--- a/arch/mips/pci/fixup-lemote2f.c
+++ b/arch/mips/pci/fixup-lemote2f.c
@@ -10,9 +10,9 @@
 #include <linux/init.h>
 #include <linux/pci.h>
 
-#include <loongson.h>
-#include <cs5536/cs5536.h>
-#include <cs5536/cs5536_pci.h>
+#include <mach/loongson.h>
+#include <mach/cs5536/cs5536.h>
+#include <mach/cs5536/cs5536_pci.h>
 
 /* PCI interrupt pins
  *
diff --git a/arch/mips/pci/ops-loongson2.c b/arch/mips/pci/ops-loongson2.c
index 0d1b36b..d6f9b15 100644
--- a/arch/mips/pci/ops-loongson2.c
+++ b/arch/mips/pci/ops-loongson2.c
@@ -13,11 +13,11 @@
 #include <linux/kernel.h>
 #include <linux/export.h>
 
-#include <loongson.h>
+#include <mach/loongson.h>
 
 #ifdef CONFIG_CS5536
-#include <cs5536/cs5536_pci.h>
-#include <cs5536/cs5536.h>
+#include <mach/cs5536/cs5536_pci.h>
+#include <mach/cs5536/cs5536.h>
 #endif
 
 #define PCI_ACCESS_READ	 0
-- 
1.8.3.1

