Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 433A1197755
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgC3JBJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:01:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34010 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729816AbgC3JBJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:01:09 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxT+hOtYFeEJohAA--.38S2;
        Mon, 30 Mar 2020 17:01:03 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 36/39] MIPS: netlogic: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:01:02 -0400
Message-Id: <1585558862-24429-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9AxT+hOtYFeEJohAA--.38S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4xWr43CF1kGw13Ar18Xwb_yoWfJrW5pa
        ykA3WkKF47u34jyw1fZF4Iqr43Ja98WrWjkryY9w17Z3WSqF18Jrsakwn8AryfAFWDK3Wr
        WrZxXr13Jws5uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJV
        WxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        CI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUgTKuUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-netlogic
to arch/mips/netlogic/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 2 ++
 arch/mips/include/asm/netlogic/common.h                                 | 2 +-
 arch/mips/netlogic/Platform                                             | 2 +-
 .../asm/mach-netlogic => netlogic/include/mach}/cpu-feature-overrides.h | 0
 arch/mips/netlogic/include/mach/floppy.h                                | 2 ++
 arch/mips/netlogic/include/mach/ide.h                                   | 2 ++
 arch/mips/netlogic/include/mach/ioremap.h                               | 2 ++
 arch/mips/{include/asm/mach-netlogic => netlogic/include/mach}/irq.h    | 2 +-
 arch/mips/netlogic/include/mach/kernel-entry-init.h                     | 2 ++
 arch/mips/netlogic/include/mach/kmalloc.h                               | 2 ++
 arch/mips/netlogic/include/mach/mangle-port.h                           | 2 ++
 arch/mips/netlogic/include/mach/mc146818rtc.h                           | 2 ++
 .../{include/asm/mach-netlogic => netlogic/include/mach}/multi-node.h   | 0
 arch/mips/netlogic/include/mach/spaces.h                                | 2 ++
 arch/mips/netlogic/include/mach/topology.h                              | 2 ++
 arch/mips/netlogic/include/mach/war.h                                   | 2 ++
 16 files changed, 25 insertions(+), 3 deletions(-)
 rename arch/mips/{include/asm/mach-netlogic => netlogic/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/netlogic/include/mach/floppy.h
 create mode 100644 arch/mips/netlogic/include/mach/ide.h
 create mode 100644 arch/mips/netlogic/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-netlogic => netlogic/include/mach}/irq.h (91%)
 create mode 100644 arch/mips/netlogic/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/netlogic/include/mach/kmalloc.h
 create mode 100644 arch/mips/netlogic/include/mach/mangle-port.h
 create mode 100644 arch/mips/netlogic/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-netlogic => netlogic/include/mach}/multi-node.h (100%)
 create mode 100644 arch/mips/netlogic/include/mach/spaces.h
 create mode 100644 arch/mips/netlogic/include/mach/topology.h
 create mode 100644 arch/mips/netlogic/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 862306c9..e539ff3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1053,6 +1053,7 @@ config NLM_XLR_BOARD
 	select SYS_HAS_EARLY_PRINTK
 	select SYS_SUPPORTS_ZBOOT
 	select SYS_SUPPORTS_ZBOOT_UART16550
+	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for systems based on Netlogic XLR and XLS processors.
 	  Say Y here if you have a XLR or XLS based board.
@@ -1081,6 +1082,7 @@ config NLM_XLP_BOARD
 	select USE_OF
 	select SYS_SUPPORTS_ZBOOT
 	select SYS_SUPPORTS_ZBOOT_UART16550
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This board is based on Netlogic XLP Processor.
 	  Say Y here if you have a XLP based board.
diff --git a/arch/mips/include/asm/netlogic/common.h b/arch/mips/include/asm/netlogic/common.h
index 5761664..6bab414 100644
--- a/arch/mips/include/asm/netlogic/common.h
+++ b/arch/mips/include/asm/netlogic/common.h
@@ -54,7 +54,7 @@
 #include <linux/cpumask.h>
 #include <linux/spinlock.h>
 #include <asm/irq.h>
-#include <asm/mach-netlogic/multi-node.h>
+#include <mach/multi-node.h>
 
 struct irq_desc;
 void nlm_smp_function_ipi_handler(struct irq_desc *desc);
diff --git a/arch/mips/netlogic/Platform b/arch/mips/netlogic/Platform
index fb8eb4c..8086f28 100644
--- a/arch/mips/netlogic/Platform
+++ b/arch/mips/netlogic/Platform
@@ -1,7 +1,7 @@
 #
 # NETLOGIC includes
 #
-cflags-$(CONFIG_NLM_COMMON)	+= -I$(srctree)/arch/mips/include/asm/mach-netlogic
+cflags-$(CONFIG_NLM_COMMON)	+= -I$(srctree)/arch/mips/netlogic/include
 cflags-$(CONFIG_NLM_COMMON)	+= -I$(srctree)/arch/mips/include/asm/netlogic
 
 #
diff --git a/arch/mips/include/asm/mach-netlogic/cpu-feature-overrides.h b/arch/mips/netlogic/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-netlogic/cpu-feature-overrides.h
rename to arch/mips/netlogic/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/netlogic/include/mach/floppy.h b/arch/mips/netlogic/include/mach/floppy.h
new file mode 100644
index 0000000..8e17183
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/floppy.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/floppy.h>
diff --git a/arch/mips/netlogic/include/mach/ide.h b/arch/mips/netlogic/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/netlogic/include/mach/ioremap.h b/arch/mips/netlogic/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-netlogic/irq.h b/arch/mips/netlogic/include/mach/irq.h
similarity index 91%
rename from arch/mips/include/asm/mach-netlogic/irq.h
rename to arch/mips/netlogic/include/mach/irq.h
index c0dbd53..de9d4c5 100644
--- a/arch/mips/include/asm/mach-netlogic/irq.h
+++ b/arch/mips/netlogic/include/mach/irq.h
@@ -8,7 +8,7 @@
 #ifndef __ASM_NETLOGIC_IRQ_H
 #define __ASM_NETLOGIC_IRQ_H
 
-#include <asm/mach-netlogic/multi-node.h>
+#include <mach/multi-node.h>
 #define NLM_IRQS_PER_NODE	1024
 #define NR_IRQS			(NLM_IRQS_PER_NODE * NLM_NR_NODES)
 
diff --git a/arch/mips/netlogic/include/mach/kernel-entry-init.h b/arch/mips/netlogic/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/netlogic/include/mach/kmalloc.h b/arch/mips/netlogic/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/netlogic/include/mach/mangle-port.h b/arch/mips/netlogic/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/netlogic/include/mach/mc146818rtc.h b/arch/mips/netlogic/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-netlogic/multi-node.h b/arch/mips/netlogic/include/mach/multi-node.h
similarity index 100%
rename from arch/mips/include/asm/mach-netlogic/multi-node.h
rename to arch/mips/netlogic/include/mach/multi-node.h
diff --git a/arch/mips/netlogic/include/mach/spaces.h b/arch/mips/netlogic/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/netlogic/include/mach/topology.h b/arch/mips/netlogic/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/netlogic/include/mach/war.h b/arch/mips/netlogic/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/netlogic/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
-- 
1.8.3.1

