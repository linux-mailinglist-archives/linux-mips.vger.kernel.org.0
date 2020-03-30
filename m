Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2F1197737
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgC3I7m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:59:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33456 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729543AbgC3I7m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:59:42 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH2n4tIFeL5khAA--.20S2;
        Mon, 30 Mar 2020 16:59:36 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 22/39] MIPS: jz4740: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:59:36 -0400
Message-Id: <1585558776-21953-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxH2n4tIFeL5khAA--.20S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF4DGryruF4kKF1fXF43Wrg_yoW3trWxpa
        nrZ3Z5WF48ury8AFWxZFy7tF45Jws0grZ0kFW5uw1UZ3WagF1UXrs5tr98Ar97JF4Dta4I
        ga9IqF15Jrs5uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r
        4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
        87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU56wZ3UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-jz4740
to arch/mips/jz4740/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                     | 1 +
 arch/mips/jz4740/Platform                                             | 2 +-
 arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/base.h     | 0
 .../asm/mach-jz4740 => jz4740/include/mach}/cpu-feature-overrides.h   | 0
 arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/dma.h      | 0
 arch/mips/jz4740/include/mach/ioremap.h                               | 2 ++
 arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/irq.h      | 0
 arch/mips/jz4740/include/mach/kernel-entry-init.h                     | 2 ++
 arch/mips/jz4740/include/mach/kmalloc.h                               | 2 ++
 arch/mips/jz4740/include/mach/mangle-port.h                           | 2 ++
 arch/mips/jz4740/include/mach/mc146818rtc.h                           | 2 ++
 arch/mips/jz4740/include/mach/spaces.h                                | 2 ++
 arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/timer.h    | 0
 arch/mips/jz4740/include/mach/topology.h                              | 2 ++
 arch/mips/jz4740/include/mach/war.h                                   | 2 ++
 arch/mips/jz4740/time.c                                               | 2 +-
 arch/mips/jz4740/timer.c                                              | 4 ++--
 drivers/pwm/pwm-jz4740.c                                              | 2 +-
 18 files changed, 22 insertions(+), 5 deletions(-)
 rename arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/base.h (100%)
 rename arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/dma.h (100%)
 create mode 100644 arch/mips/jz4740/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/jz4740/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/jz4740/include/mach/kmalloc.h
 create mode 100644 arch/mips/jz4740/include/mach/mangle-port.h
 create mode 100644 arch/mips/jz4740/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/jz4740/include/mach/spaces.h
 rename arch/mips/{include/asm/mach-jz4740 => jz4740/include/mach}/timer.h (100%)
 create mode 100644 arch/mips/jz4740/include/mach/topology.h
 create mode 100644 arch/mips/jz4740/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9a8ff2d..6a6d2e2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -412,6 +412,7 @@ config MACH_INGENIC
 	select GENERIC_IRQ_CHIP
 	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
 	select USE_OF
+	select HAVE_MACH_HEAD_FILES
 
 config LANTIQ
 	bool "Lantiq based platforms"
diff --git a/arch/mips/jz4740/Platform b/arch/mips/jz4740/Platform
index a2a5a85..937b7fa 100644
--- a/arch/mips/jz4740/Platform
+++ b/arch/mips/jz4740/Platform
@@ -1,4 +1,4 @@
 platform-$(CONFIG_MACH_INGENIC)	+= jz4740/
-cflags-$(CONFIG_MACH_INGENIC)	+= -I$(srctree)/arch/mips/include/asm/mach-jz4740
+cflags-$(CONFIG_MACH_INGENIC)	+= -I$(srctree)/arch/mips/jz4740/include
 load-$(CONFIG_MACH_INGENIC)	+= 0xffffffff80010000
 zload-$(CONFIG_MACH_INGENIC)	+= 0xffffffff81000000
diff --git a/arch/mips/include/asm/mach-jz4740/base.h b/arch/mips/jz4740/include/mach/base.h
similarity index 100%
rename from arch/mips/include/asm/mach-jz4740/base.h
rename to arch/mips/jz4740/include/mach/base.h
diff --git a/arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h b/arch/mips/jz4740/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
rename to arch/mips/jz4740/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-jz4740/dma.h b/arch/mips/jz4740/include/mach/dma.h
similarity index 100%
rename from arch/mips/include/asm/mach-jz4740/dma.h
rename to arch/mips/jz4740/include/mach/dma.h
diff --git a/arch/mips/jz4740/include/mach/ioremap.h b/arch/mips/jz4740/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/jz4740/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-jz4740/irq.h b/arch/mips/jz4740/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-jz4740/irq.h
rename to arch/mips/jz4740/include/mach/irq.h
diff --git a/arch/mips/jz4740/include/mach/kernel-entry-init.h b/arch/mips/jz4740/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/jz4740/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/jz4740/include/mach/kmalloc.h b/arch/mips/jz4740/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/jz4740/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/jz4740/include/mach/mangle-port.h b/arch/mips/jz4740/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/jz4740/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/jz4740/include/mach/mc146818rtc.h b/arch/mips/jz4740/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/jz4740/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/jz4740/include/mach/spaces.h b/arch/mips/jz4740/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/jz4740/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/include/asm/mach-jz4740/timer.h b/arch/mips/jz4740/include/mach/timer.h
similarity index 100%
rename from arch/mips/include/asm/mach-jz4740/timer.h
rename to arch/mips/jz4740/include/mach/timer.h
diff --git a/arch/mips/jz4740/include/mach/topology.h b/arch/mips/jz4740/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/jz4740/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/jz4740/include/mach/war.h b/arch/mips/jz4740/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/jz4740/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
index 605a84a..64a5a19 100644
--- a/arch/mips/jz4740/time.c
+++ b/arch/mips/jz4740/time.c
@@ -7,7 +7,7 @@
 #include <linux/clocksource.h>
 #include <linux/of_clk.h>
 
-#include <asm/mach-jz4740/timer.h>
+#include <mach/timer.h>
 
 void __init plat_time_init(void)
 {
diff --git a/arch/mips/jz4740/timer.c b/arch/mips/jz4740/timer.c
index 5c9f82d..a473d49 100644
--- a/arch/mips/jz4740/timer.c
+++ b/arch/mips/jz4740/timer.c
@@ -9,8 +9,8 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 
-#include <asm/mach-jz4740/base.h>
-#include <asm/mach-jz4740/timer.h>
+#include <mach/base.h>
+#include <mach/timer.h>
 
 void __iomem *jz4740_timer_base;
 EXPORT_SYMBOL_GPL(jz4740_timer_base);
diff --git a/drivers/pwm/pwm-jz4740.c b/drivers/pwm/pwm-jz4740.c
index 9d78cc2..bb9d266 100644
--- a/drivers/pwm/pwm-jz4740.c
+++ b/drivers/pwm/pwm-jz4740.c
@@ -18,7 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
 
-#include <asm/mach-jz4740/timer.h>
+#include <mach/timer.h>
 
 #define NUM_PWM 8
 
-- 
1.8.3.1

