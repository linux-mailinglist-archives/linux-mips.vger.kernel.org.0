Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E4E1976B6
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729654AbgC3Ija (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:39:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56806 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729731AbgC3IjD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:39:03 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf94hsIFeKJchAA--.5S2;
        Mon, 30 Mar 2020 16:38:57 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/39] MIPS: ar7: Add header files path prefix
Date:   Mon, 30 Mar 2020 04:38:57 -0400
Message-Id: <1585557537-21355-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxf94hsIFeKJchAA--.5S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw1fCrWxGr1rKrykKw13CFg_yoWDGFy3pa
        1DA3WkGr4Uuw1UArWxZF9F9r43tan0grWDKFyUW34UZ3Waq3WUJrs5JrnxAr97JFWkt3WF
        gFZxXr45Jwsavw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYIeHPUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-ar7
to arch/mips/ar7/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                             | 1 +
 arch/mips/ar7/Platform                                        | 2 +-
 arch/mips/ar7/clock.c                                         | 2 +-
 arch/mips/ar7/gpio.c                                          | 2 +-
 arch/mips/{include/asm/mach-ar7 => ar7/include/mach}/ar7.h    | 0
 arch/mips/ar7/include/mach/cpu-feature-overrides.h            | 2 ++
 arch/mips/ar7/include/mach/ioremap.h                          | 2 ++
 arch/mips/{include/asm/mach-ar7 => ar7/include/mach}/irq.h    | 0
 arch/mips/ar7/include/mach/kernel-entry-init.h                | 2 ++
 arch/mips/ar7/include/mach/kmalloc.h                          | 2 ++
 arch/mips/ar7/include/mach/mangle-port.h                      | 2 ++
 arch/mips/{include/asm/mach-ar7 => ar7/include/mach}/prom.h   | 0
 arch/mips/{include/asm/mach-ar7 => ar7/include/mach}/spaces.h | 0
 arch/mips/ar7/include/mach/topology.h                         | 2 ++
 arch/mips/ar7/include/mach/war.h                              | 2 ++
 arch/mips/ar7/irq.c                                           | 2 +-
 arch/mips/ar7/memory.c                                        | 2 +-
 arch/mips/ar7/platform.c                                      | 4 ++--
 arch/mips/ar7/prom.c                                          | 4 ++--
 arch/mips/ar7/setup.c                                         | 4 ++--
 arch/mips/ar7/time.c                                          | 2 +-
 drivers/net/ethernet/ti/cpmac.c                               | 2 +-
 drivers/watchdog/ar7_wdt.c                                    | 2 +-
 23 files changed, 29 insertions(+), 14 deletions(-)
 rename arch/mips/{include/asm/mach-ar7 => ar7/include/mach}/ar7.h (100%)
 create mode 100644 arch/mips/ar7/include/mach/cpu-feature-overrides.h
 create mode 100644 arch/mips/ar7/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-ar7 => ar7/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/ar7/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/ar7/include/mach/kmalloc.h
 create mode 100644 arch/mips/ar7/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-ar7 => ar7/include/mach}/prom.h (100%)
 rename arch/mips/{include/asm/mach-ar7 => ar7/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/ar7/include/mach/topology.h
 create mode 100644 arch/mips/ar7/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 3c38202..2bb678d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -182,6 +182,7 @@ config AR7
 	select GPIOLIB
 	select VLYNQ
 	select HAVE_CLK
+	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for the Texas Instruments AR7 System-on-a-Chip
 	  family: TNETD7100, 7200 and 7300.
diff --git a/arch/mips/ar7/Platform b/arch/mips/ar7/Platform
index 21f9102..1491003 100644
--- a/arch/mips/ar7/Platform
+++ b/arch/mips/ar7/Platform
@@ -2,5 +2,5 @@
 # Texas Instruments AR7
 #
 platform-$(CONFIG_AR7)		+= ar7/
-cflags-$(CONFIG_AR7)		+= -I$(srctree)/arch/mips/include/asm/mach-ar7
+cflags-$(CONFIG_AR7)		+= -I$(srctree)/arch/mips/ar7/include
 load-$(CONFIG_AR7)		+= 0xffffffff94100000
diff --git a/arch/mips/ar7/clock.c b/arch/mips/ar7/clock.c
index 95def94..2be9dd4 100644
--- a/arch/mips/ar7/clock.c
+++ b/arch/mips/ar7/clock.c
@@ -16,7 +16,7 @@
 #include <linux/clk.h>
 
 #include <asm/addrspace.h>
-#include <asm/mach-ar7/ar7.h>
+#include <mach/ar7.h>
 
 #define BOOT_PLL_SOURCE_MASK	0x3
 #define CPU_PLL_SOURCE_SHIFT	16
diff --git a/arch/mips/ar7/gpio.c b/arch/mips/ar7/gpio.c
index 8b006ad..b95ae9f 100644
--- a/arch/mips/ar7/gpio.c
+++ b/arch/mips/ar7/gpio.c
@@ -9,7 +9,7 @@
 #include <linux/export.h>
 #include <linux/gpio.h>
 
-#include <asm/mach-ar7/ar7.h>
+#include <mach/ar7.h>
 
 #define AR7_GPIO_MAX 32
 #define TITAN_GPIO_MAX 51
diff --git a/arch/mips/include/asm/mach-ar7/ar7.h b/arch/mips/ar7/include/mach/ar7.h
similarity index 100%
rename from arch/mips/include/asm/mach-ar7/ar7.h
rename to arch/mips/ar7/include/mach/ar7.h
diff --git a/arch/mips/ar7/include/mach/cpu-feature-overrides.h b/arch/mips/ar7/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/ar7/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/ar7/include/mach/ioremap.h b/arch/mips/ar7/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/ar7/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-ar7/irq.h b/arch/mips/ar7/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-ar7/irq.h
rename to arch/mips/ar7/include/mach/irq.h
diff --git a/arch/mips/ar7/include/mach/kernel-entry-init.h b/arch/mips/ar7/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/ar7/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/ar7/include/mach/kmalloc.h b/arch/mips/ar7/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/ar7/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/ar7/include/mach/mangle-port.h b/arch/mips/ar7/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/ar7/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-ar7/prom.h b/arch/mips/ar7/include/mach/prom.h
similarity index 100%
rename from arch/mips/include/asm/mach-ar7/prom.h
rename to arch/mips/ar7/include/mach/prom.h
diff --git a/arch/mips/include/asm/mach-ar7/spaces.h b/arch/mips/ar7/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-ar7/spaces.h
rename to arch/mips/ar7/include/mach/spaces.h
diff --git a/arch/mips/ar7/include/mach/topology.h b/arch/mips/ar7/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/ar7/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/ar7/include/mach/war.h b/arch/mips/ar7/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/ar7/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/ar7/irq.c b/arch/mips/ar7/irq.c
index f0a7942..7b177f0 100644
--- a/arch/mips/ar7/irq.c
+++ b/arch/mips/ar7/irq.c
@@ -10,7 +10,7 @@
 
 #include <asm/irq_cpu.h>
 #include <asm/mipsregs.h>
-#include <asm/mach-ar7/ar7.h>
+#include <mach/ar7.h>
 
 #define EXCEPT_OFFSET	0x80
 #define PACE_OFFSET	0xA0
diff --git a/arch/mips/ar7/memory.c b/arch/mips/ar7/memory.c
index ad6efb3..28c3bfc 100644
--- a/arch/mips/ar7/memory.c
+++ b/arch/mips/ar7/memory.c
@@ -15,7 +15,7 @@
 #include <asm/page.h>
 #include <asm/sections.h>
 
-#include <asm/mach-ar7/ar7.h>
+#include <mach/ar7.h>
 
 static int __init memsize(void)
 {
diff --git a/arch/mips/ar7/platform.c b/arch/mips/ar7/platform.c
index 215149a..1eb816c 100644
--- a/arch/mips/ar7/platform.c
+++ b/arch/mips/ar7/platform.c
@@ -24,8 +24,8 @@
 #include <linux/clk.h>
 
 #include <asm/addrspace.h>
-#include <asm/mach-ar7/ar7.h>
-#include <asm/mach-ar7/prom.h>
+#include <mach/ar7.h>
+#include <mach/prom.h>
 
 /*****************************************************************************
  * VLYNQ Bus
diff --git a/arch/mips/ar7/prom.c b/arch/mips/ar7/prom.c
index 5810d39..7ac39fd 100644
--- a/arch/mips/ar7/prom.c
+++ b/arch/mips/ar7/prom.c
@@ -15,8 +15,8 @@
 #include <asm/bootinfo.h>
 #include <asm/setup.h>
 
-#include <asm/mach-ar7/ar7.h>
-#include <asm/mach-ar7/prom.h>
+#include <mach/ar7.h>
+#include <mach/prom.h>
 
 #define MAX_ENTRY 80
 
diff --git a/arch/mips/ar7/setup.c b/arch/mips/ar7/setup.c
index b3ffe7c..3134dfa 100644
--- a/arch/mips/ar7/setup.c
+++ b/arch/mips/ar7/setup.c
@@ -9,8 +9,8 @@
 #include <linux/time.h>
 
 #include <asm/reboot.h>
-#include <asm/mach-ar7/ar7.h>
-#include <asm/mach-ar7/prom.h>
+#include <mach/ar7.h>
+#include <mach/prom.h>
 
 static void ar7_machine_restart(char *command)
 {
diff --git a/arch/mips/ar7/time.c b/arch/mips/ar7/time.c
index 72aa77d..3f08a79 100644
--- a/arch/mips/ar7/time.c
+++ b/arch/mips/ar7/time.c
@@ -12,7 +12,7 @@
 #include <linux/clk.h>
 
 #include <asm/time.h>
-#include <asm/mach-ar7/ar7.h>
+#include <mach/ar7.h>
 
 void __init plat_time_init(void)
 {
diff --git a/drivers/net/ethernet/ti/cpmac.c b/drivers/net/ethernet/ti/cpmac.c
index a530afe..09aec63 100644
--- a/drivers/net/ethernet/ti/cpmac.c
+++ b/drivers/net/ethernet/ti/cpmac.c
@@ -29,7 +29,7 @@
 #include <linux/gpio.h>
 #include <linux/atomic.h>
 
-#include <asm/mach-ar7/ar7.h>
+#include <mach/ar7.h>
 
 MODULE_AUTHOR("Eugene Konev <ejka@imfi.kspu.ru>");
 MODULE_DESCRIPTION("TI AR7 ethernet driver (CPMAC)");
diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
index c087027..d1cb477 100644
--- a/drivers/watchdog/ar7_wdt.c
+++ b/drivers/watchdog/ar7_wdt.c
@@ -26,7 +26,7 @@
 #include <linux/clk.h>
 
 #include <asm/addrspace.h>
-#include <asm/mach-ar7/ar7.h>
+#include <mach/ar7.h>
 
 #define LONGNAME "TI AR7 Watchdog Timer"
 
-- 
1.8.3.1

