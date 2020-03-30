Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE61197716
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgC3Ixu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:53:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60338 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729595AbgC3Ixu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:53:50 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx32qUs4Feq5ghAA--.18S2;
        Mon, 30 Mar 2020 16:53:40 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 14/39] MIPS: dec: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:53:40 -0400
Message-Id: <1585558420-936-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dx32qUs4Feq5ghAA--.18S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKFyDCw1rWF1DKw4DGry3Jwb_yoWxJr43pa
        1DA3Z5WF4Dury8Awn5ZFyIyr43Ja98WrWjkry5Wa47Z3ZaqF1UtrZ3Jr98AryxAF4DK3Wx
        WrZxW3yUtws2vaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVWxJV
        W8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
        87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0I385UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-dec
to arch/mips/dec/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/dec/Platform                                                  | 2 +-
 .../{include/asm/mach-dec => dec/include/mach}/cpu-feature-overrides.h  | 0
 arch/mips/dec/include/mach/ioremap.h                                    | 2 ++
 arch/mips/dec/include/mach/irq.h                                        | 2 ++
 arch/mips/dec/include/mach/kernel-entry-init.h                          | 2 ++
 arch/mips/dec/include/mach/kmalloc.h                                    | 2 ++
 arch/mips/dec/include/mach/mangle-port.h                                | 2 ++
 arch/mips/{include/asm/mach-dec => dec/include/mach}/mc146818rtc.h      | 0
 arch/mips/dec/include/mach/spaces.h                                     | 2 ++
 arch/mips/dec/include/mach/topology.h                                   | 2 ++
 arch/mips/dec/include/mach/war.h                                        | 2 ++
 arch/mips/include/asm/dec/interrupts.h                                  | 2 +-
 13 files changed, 19 insertions(+), 2 deletions(-)
 rename arch/mips/{include/asm/mach-dec => dec/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/dec/include/mach/ioremap.h
 create mode 100644 arch/mips/dec/include/mach/irq.h
 create mode 100644 arch/mips/dec/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/dec/include/mach/kmalloc.h
 create mode 100644 arch/mips/dec/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-dec => dec/include/mach}/mc146818rtc.h (100%)
 create mode 100644 arch/mips/dec/include/mach/spaces.h
 create mode 100644 arch/mips/dec/include/mach/topology.h
 create mode 100644 arch/mips/dec/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ba7e065..17e1131 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -353,6 +353,7 @@ config MACH_DECSTATION
 	select SYS_SUPPORTS_256HZ
 	select SYS_SUPPORTS_1024HZ
 	select MIPS_L1_CACHE_SHIFT_4
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for DEC's MIPS based workstations.  For details
 	  see the Linux/MIPS FAQ on <http://www.linux-mips.org/> and the
diff --git a/arch/mips/dec/Platform b/arch/mips/dec/Platform
index cf55a6f..f450c99 100644
--- a/arch/mips/dec/Platform
+++ b/arch/mips/dec/Platform
@@ -3,6 +3,6 @@
 #
 platform-$(CONFIG_MACH_DECSTATION)	+= dec/
 cflags-$(CONFIG_MACH_DECSTATION)	+= \
-			-I$(srctree)/arch/mips/include/asm/mach-dec
+			-I$(srctree)/arch/mips/dec/include
 libs-$(CONFIG_MACH_DECSTATION)		+= arch/mips/dec/prom/
 load-$(CONFIG_MACH_DECSTATION)		+= 0xffffffff80040000
diff --git a/arch/mips/include/asm/mach-dec/cpu-feature-overrides.h b/arch/mips/dec/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-dec/cpu-feature-overrides.h
rename to arch/mips/dec/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/dec/include/mach/ioremap.h b/arch/mips/dec/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/dec/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/dec/include/mach/irq.h b/arch/mips/dec/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/dec/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/dec/include/mach/kernel-entry-init.h b/arch/mips/dec/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/dec/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/dec/include/mach/kmalloc.h b/arch/mips/dec/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/dec/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/dec/include/mach/mangle-port.h b/arch/mips/dec/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/dec/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-dec/mc146818rtc.h b/arch/mips/dec/include/mach/mc146818rtc.h
similarity index 100%
rename from arch/mips/include/asm/mach-dec/mc146818rtc.h
rename to arch/mips/dec/include/mach/mc146818rtc.h
diff --git a/arch/mips/dec/include/mach/spaces.h b/arch/mips/dec/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/dec/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/dec/include/mach/topology.h b/arch/mips/dec/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/dec/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/dec/include/mach/war.h b/arch/mips/dec/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/dec/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/include/asm/dec/interrupts.h b/arch/mips/include/asm/dec/interrupts.h
index e10d341..a2206e1 100644
--- a/arch/mips/include/asm/dec/interrupts.h
+++ b/arch/mips/include/asm/dec/interrupts.h
@@ -14,7 +14,7 @@
 #ifndef __ASM_DEC_INTERRUPTS_H
 #define __ASM_DEC_INTERRUPTS_H
 
-#include <irq.h>
+#include <mach/irq.h>
 #include <asm/mipsregs.h>
 
 
-- 
1.8.3.1

