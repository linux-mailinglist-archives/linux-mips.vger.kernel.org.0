Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7A319774A
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729928AbgC3JAb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33804 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729829AbgC3JAb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:31 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax1ukrtYFeA5ohAA--.23S2;
        Mon, 30 Mar 2020 17:00:27 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 30/39] MIPS: txx9: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:26 -0400
Message-Id: <1585558826-12235-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Ax1ukrtYFeA5ohAA--.23S2
X-Coremail-Antispam: 1UD129KBjvAXoW3ZryUXFWxtF47CrW3ur13CFg_yoW8JrWkto
        Z3KF1DKr4xJFZ3JF45uFy3CF18Zr1vqrsYq34rXrWUJasxZa47Aw1IgF1jgF4YkF1xJwnr
        WrW5ZryDJwnYqFWkn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYn7k0a2IF6w4xM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjc
        xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr
        0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
        CI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUccTmDUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-tx39xx
to arch/mips/txx9/tx39xx/include/mach on tx39xx platform.

Remove header files from arch/mips/include/asm/mach-tx49xx
to arch/mips/txx9/tx49xx/include/mach on tx49xx platform.

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/include/asm/txx9irq.h                                       | 2 +-
 arch/mips/txx9/Kconfig                                                | 2 ++
 arch/mips/txx9/Platform                                               | 4 ++--
 arch/mips/txx9/tx39xx/include/mach/cpu-feature-overrides.h            | 2 ++
 arch/mips/txx9/tx39xx/include/mach/ide.h                              | 2 ++
 .../{include/asm/mach-tx39xx => txx9/tx39xx/include/mach}/ioremap.h   | 0
 arch/mips/txx9/tx39xx/include/mach/irq.h                              | 2 ++
 arch/mips/txx9/tx39xx/include/mach/kernel-entry-init.h                | 2 ++
 arch/mips/txx9/tx39xx/include/mach/kmalloc.h                          | 2 ++
 .../asm/mach-tx39xx => txx9/tx39xx/include/mach}/mangle-port.h        | 0
 arch/mips/txx9/tx39xx/include/mach/mc146818rtc.h                      | 2 ++
 .../{include/asm/mach-tx39xx => txx9/tx39xx/include/mach}/spaces.h    | 0
 arch/mips/txx9/tx39xx/include/mach/topology.h                         | 2 ++
 arch/mips/txx9/tx39xx/include/mach/war.h                              | 2 ++
 .../mach-tx49xx => txx9/tx49xx/include/mach}/cpu-feature-overrides.h  | 0
 arch/mips/txx9/tx49xx/include/mach/ide.h                              | 2 ++
 .../{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/ioremap.h   | 0
 arch/mips/txx9/tx49xx/include/mach/irq.h                              | 2 ++
 arch/mips/txx9/tx49xx/include/mach/kernel-entry-init.h                | 2 ++
 .../{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/kmalloc.h   | 0
 .../asm/mach-tx49xx => txx9/tx49xx/include/mach}/mangle-port.h        | 0
 arch/mips/txx9/tx49xx/include/mach/mc146818rtc.h                      | 2 ++
 .../{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/spaces.h    | 0
 arch/mips/txx9/tx49xx/include/mach/topology.h                         | 2 ++
 arch/mips/{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/war.h | 0
 25 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/txx9/tx39xx/include/mach/cpu-feature-overrides.h
 create mode 100644 arch/mips/txx9/tx39xx/include/mach/ide.h
 rename arch/mips/{include/asm/mach-tx39xx => txx9/tx39xx/include/mach}/ioremap.h (100%)
 create mode 100644 arch/mips/txx9/tx39xx/include/mach/irq.h
 create mode 100644 arch/mips/txx9/tx39xx/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/txx9/tx39xx/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-tx39xx => txx9/tx39xx/include/mach}/mangle-port.h (100%)
 create mode 100644 arch/mips/txx9/tx39xx/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-tx39xx => txx9/tx39xx/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/txx9/tx39xx/include/mach/topology.h
 create mode 100644 arch/mips/txx9/tx39xx/include/mach/war.h
 rename arch/mips/{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/txx9/tx49xx/include/mach/ide.h
 rename arch/mips/{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/ioremap.h (100%)
 create mode 100644 arch/mips/txx9/tx49xx/include/mach/irq.h
 create mode 100644 arch/mips/txx9/tx49xx/include/mach/kernel-entry-init.h
 rename arch/mips/{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/kmalloc.h (100%)
 rename arch/mips/{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/mangle-port.h (100%)
 create mode 100644 arch/mips/txx9/tx49xx/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/txx9/tx49xx/include/mach/topology.h
 rename arch/mips/{include/asm/mach-tx49xx => txx9/tx49xx/include/mach}/war.h (100%)

diff --git a/arch/mips/include/asm/txx9irq.h b/arch/mips/include/asm/txx9irq.h
index 68a6650..d45b837 100644
--- a/arch/mips/include/asm/txx9irq.h
+++ b/arch/mips/include/asm/txx9irq.h
@@ -9,7 +9,7 @@
 #ifndef __ASM_TXX9IRQ_H
 #define __ASM_TXX9IRQ_H
 
-#include <irq.h>
+#include <mach/irq.h>
 
 #ifdef CONFIG_IRQ_MIPS_CPU
 #define TXX9_IRQ_BASE	(MIPS_CPU_IRQ_BASE + 8)
diff --git a/arch/mips/txx9/Kconfig b/arch/mips/txx9/Kconfig
index 9a22a18..12dbce7 100644
--- a/arch/mips/txx9/Kconfig
+++ b/arch/mips/txx9/Kconfig
@@ -3,6 +3,7 @@ config MACH_TX39XX
 	bool
 	select MACH_TXX9
 	select SYS_HAS_CPU_TX39XX
+	select HAVE_MACH_HEAD_FILES
 
 config MACH_TX49XX
 	bool
@@ -12,6 +13,7 @@ config MACH_TX49XX
 	select IRQ_MIPS_CPU
 	select SYS_HAS_CPU_TX49XX
 	select SYS_SUPPORTS_64BIT_KERNEL
+	select HAVE_MACH_HEAD_FILES
 
 config MACH_TXX9
 	bool
diff --git a/arch/mips/txx9/Platform b/arch/mips/txx9/Platform
index a176d1fd..e17141d 100644
--- a/arch/mips/txx9/Platform
+++ b/arch/mips/txx9/Platform
@@ -2,9 +2,9 @@ platform-$(CONFIG_MACH_TX39XX)	+= txx9/
 platform-$(CONFIG_MACH_TX49XX)	+= txx9/
 
 cflags-$(CONFIG_MACH_TX39XX)	+=					\
-		-I$(srctree)/arch/mips/include/asm/mach-tx39xx
+		-I$(srctree)/arch/mips/txx9/tx39xx/include
 cflags-$(CONFIG_MACH_TX49XX)	+=					\
-		 -I$(srctree)/arch/mips/include/asm/mach-tx49xx
+		 -I$(srctree)/arch/mips/txx9/tx49xx/include
 
 load-$(CONFIG_MACH_TX39XX)	+= 0xffffffff80050000
 load-$(CONFIG_MACH_TX49XX)	+= 0xffffffff80100000
diff --git a/arch/mips/txx9/tx39xx/include/mach/cpu-feature-overrides.h b/arch/mips/txx9/tx39xx/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/txx9/tx39xx/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/txx9/tx39xx/include/mach/ide.h b/arch/mips/txx9/tx39xx/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/txx9/tx39xx/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/include/asm/mach-tx39xx/ioremap.h b/arch/mips/txx9/tx39xx/include/mach/ioremap.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx39xx/ioremap.h
rename to arch/mips/txx9/tx39xx/include/mach/ioremap.h
diff --git a/arch/mips/txx9/tx39xx/include/mach/irq.h b/arch/mips/txx9/tx39xx/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/txx9/tx39xx/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/txx9/tx39xx/include/mach/kernel-entry-init.h b/arch/mips/txx9/tx39xx/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/txx9/tx39xx/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/txx9/tx39xx/include/mach/kmalloc.h b/arch/mips/txx9/tx39xx/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/txx9/tx39xx/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-tx39xx/mangle-port.h b/arch/mips/txx9/tx39xx/include/mach/mangle-port.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx39xx/mangle-port.h
rename to arch/mips/txx9/tx39xx/include/mach/mangle-port.h
diff --git a/arch/mips/txx9/tx39xx/include/mach/mc146818rtc.h b/arch/mips/txx9/tx39xx/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/txx9/tx39xx/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-tx39xx/spaces.h b/arch/mips/txx9/tx39xx/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx39xx/spaces.h
rename to arch/mips/txx9/tx39xx/include/mach/spaces.h
diff --git a/arch/mips/txx9/tx39xx/include/mach/topology.h b/arch/mips/txx9/tx39xx/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/txx9/tx39xx/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/txx9/tx39xx/include/mach/war.h b/arch/mips/txx9/tx39xx/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/txx9/tx39xx/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/include/asm/mach-tx49xx/cpu-feature-overrides.h b/arch/mips/txx9/tx49xx/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx49xx/cpu-feature-overrides.h
rename to arch/mips/txx9/tx49xx/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/txx9/tx49xx/include/mach/ide.h b/arch/mips/txx9/tx49xx/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/txx9/tx49xx/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/include/asm/mach-tx49xx/ioremap.h b/arch/mips/txx9/tx49xx/include/mach/ioremap.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx49xx/ioremap.h
rename to arch/mips/txx9/tx49xx/include/mach/ioremap.h
diff --git a/arch/mips/txx9/tx49xx/include/mach/irq.h b/arch/mips/txx9/tx49xx/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/txx9/tx49xx/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/txx9/tx49xx/include/mach/kernel-entry-init.h b/arch/mips/txx9/tx49xx/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/txx9/tx49xx/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/include/asm/mach-tx49xx/kmalloc.h b/arch/mips/txx9/tx49xx/include/mach/kmalloc.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx49xx/kmalloc.h
rename to arch/mips/txx9/tx49xx/include/mach/kmalloc.h
diff --git a/arch/mips/include/asm/mach-tx49xx/mangle-port.h b/arch/mips/txx9/tx49xx/include/mach/mangle-port.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx49xx/mangle-port.h
rename to arch/mips/txx9/tx49xx/include/mach/mangle-port.h
diff --git a/arch/mips/txx9/tx49xx/include/mach/mc146818rtc.h b/arch/mips/txx9/tx49xx/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/txx9/tx49xx/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-tx49xx/spaces.h b/arch/mips/txx9/tx49xx/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx49xx/spaces.h
rename to arch/mips/txx9/tx49xx/include/mach/spaces.h
diff --git a/arch/mips/txx9/tx49xx/include/mach/topology.h b/arch/mips/txx9/tx49xx/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/txx9/tx49xx/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-tx49xx/war.h b/arch/mips/txx9/tx49xx/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-tx49xx/war.h
rename to arch/mips/txx9/tx49xx/include/mach/war.h
-- 
1.8.3.1

