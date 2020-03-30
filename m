Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1A2197757
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729901AbgC3JBO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:01:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34032 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729816AbgC3JBO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:01:14 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxfetVtYFeF5ohAA--.30S2;
        Mon, 30 Mar 2020 17:01:09 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 37/39] MIPS: malta: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:01:09 -0400
Message-Id: <1585558869-32180-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxfetVtYFeF5ohAA--.30S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw18XFWxKryDAF4kGrWDCFg_yoWfAw1rpF
        4qy3Z7KF4ruFyUuF1rZrW7Kr43tws5GrW5ta4Ygw48Z3ZaqF15Jrs5Grn0yryxJFWqqF18
        uFySqF13Jw4kuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Remove header files from arch/mips/include/asm/mach-malta
to arch/mips/mti-malta/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/include/asm/rtlx.h                                            | 2 +-
 arch/mips/mti-malta/Platform                                            | 2 +-
 .../asm/mach-malta => mti-malta/include/mach}/cpu-feature-overrides.h   | 0
 arch/mips/mti-malta/include/mach/floppy.h                               | 2 ++
 arch/mips/mti-malta/include/mach/ide.h                                  | 2 ++
 arch/mips/mti-malta/include/mach/ioremap.h                              | 2 ++
 arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/irq.h      | 0
 .../asm/mach-malta => mti-malta/include/mach}/kernel-entry-init.h       | 0
 arch/mips/mti-malta/include/mach/kmalloc.h                              | 2 ++
 .../{include/asm/mach-malta => mti-malta/include/mach}/mach-gt64120.h   | 0
 .../{include/asm/mach-malta => mti-malta/include/mach}/malta-dtshim.h   | 0
 arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/malta-pm.h | 0
 arch/mips/mti-malta/include/mach/mangle-port.h                          | 2 ++
 .../{include/asm/mach-malta => mti-malta/include/mach}/mc146818rtc.h    | 0
 arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/spaces.h   | 0
 arch/mips/mti-malta/include/mach/topology.h                             | 2 ++
 arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/war.h      | 0
 arch/mips/mti-malta/malta-setup.c                                       | 2 +-
 19 files changed, 16 insertions(+), 3 deletions(-)
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/mti-malta/include/mach/floppy.h
 create mode 100644 arch/mips/mti-malta/include/mach/ide.h
 create mode 100644 arch/mips/mti-malta/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/irq.h (100%)
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/kernel-entry-init.h (100%)
 create mode 100644 arch/mips/mti-malta/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/mach-gt64120.h (100%)
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/malta-dtshim.h (100%)
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/malta-pm.h (100%)
 create mode 100644 arch/mips/mti-malta/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/mc146818rtc.h (100%)
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/mti-malta/include/mach/topology.h
 rename arch/mips/{include/asm/mach-malta => mti-malta/include/mach}/war.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e539ff3..898e875 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -598,6 +598,7 @@ config MIPS_MALTA
 	select SYS_SUPPORTS_ZBOOT
 	select USE_OF
 	select ZONE_DMA32 if 64BIT
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for the MIPS Technologies Malta evaluation
 	  board.
diff --git a/arch/mips/include/asm/rtlx.h b/arch/mips/include/asm/rtlx.h
index c102065..8ec9ca6 100644
--- a/arch/mips/include/asm/rtlx.h
+++ b/arch/mips/include/asm/rtlx.h
@@ -9,7 +9,7 @@
 #ifndef __ASM_RTLX_H_
 #define __ASM_RTLX_H_
 
-#include <irq.h>
+#include <mach/irq.h>
 
 #define RTLX_MODULE_NAME "rtlx"
 
diff --git a/arch/mips/mti-malta/Platform b/arch/mips/mti-malta/Platform
index 2cc72c9..3a0e361 100644
--- a/arch/mips/mti-malta/Platform
+++ b/arch/mips/mti-malta/Platform
@@ -2,7 +2,7 @@
 # MIPS Malta board
 #
 platform-$(CONFIG_MIPS_MALTA)	+= mti-malta/
-cflags-$(CONFIG_MIPS_MALTA)	+= -I$(srctree)/arch/mips/include/asm/mach-malta
+cflags-$(CONFIG_MIPS_MALTA)	+= -I$(srctree)/arch/mips/mti-malta/include
 ifdef CONFIG_KVM_GUEST
     load-$(CONFIG_MIPS_MALTA)	+= 0x0000000040100000
 else
diff --git a/arch/mips/include/asm/mach-malta/cpu-feature-overrides.h b/arch/mips/mti-malta/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/cpu-feature-overrides.h
rename to arch/mips/mti-malta/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/mti-malta/include/mach/floppy.h b/arch/mips/mti-malta/include/mach/floppy.h
new file mode 100644
index 0000000..8e17183
--- /dev/null
+++ b/arch/mips/mti-malta/include/mach/floppy.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/floppy.h>
diff --git a/arch/mips/mti-malta/include/mach/ide.h b/arch/mips/mti-malta/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/mti-malta/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/mti-malta/include/mach/ioremap.h b/arch/mips/mti-malta/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/mti-malta/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-malta/irq.h b/arch/mips/mti-malta/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/irq.h
rename to arch/mips/mti-malta/include/mach/irq.h
diff --git a/arch/mips/include/asm/mach-malta/kernel-entry-init.h b/arch/mips/mti-malta/include/mach/kernel-entry-init.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/kernel-entry-init.h
rename to arch/mips/mti-malta/include/mach/kernel-entry-init.h
diff --git a/arch/mips/mti-malta/include/mach/kmalloc.h b/arch/mips/mti-malta/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/mti-malta/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-malta/mach-gt64120.h b/arch/mips/mti-malta/include/mach/mach-gt64120.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/mach-gt64120.h
rename to arch/mips/mti-malta/include/mach/mach-gt64120.h
diff --git a/arch/mips/include/asm/mach-malta/malta-dtshim.h b/arch/mips/mti-malta/include/mach/malta-dtshim.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/malta-dtshim.h
rename to arch/mips/mti-malta/include/mach/malta-dtshim.h
diff --git a/arch/mips/include/asm/mach-malta/malta-pm.h b/arch/mips/mti-malta/include/mach/malta-pm.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/malta-pm.h
rename to arch/mips/mti-malta/include/mach/malta-pm.h
diff --git a/arch/mips/mti-malta/include/mach/mangle-port.h b/arch/mips/mti-malta/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/mti-malta/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-malta/mc146818rtc.h b/arch/mips/mti-malta/include/mach/mc146818rtc.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/mc146818rtc.h
rename to arch/mips/mti-malta/include/mach/mc146818rtc.h
diff --git a/arch/mips/include/asm/mach-malta/spaces.h b/arch/mips/mti-malta/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/spaces.h
rename to arch/mips/mti-malta/include/mach/spaces.h
diff --git a/arch/mips/mti-malta/include/mach/topology.h b/arch/mips/mti-malta/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/mti-malta/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-malta/war.h b/arch/mips/mti-malta/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-malta/war.h
rename to arch/mips/mti-malta/include/mach/war.h
diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index c4ad5a9..5571b5d 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -16,7 +16,7 @@
 
 #include <asm/dma-coherence.h>
 #include <asm/fw/fw.h>
-#include <asm/mach-malta/malta-dtshim.h>
+#include <mach/malta-dtshim.h>
 #include <asm/mips-cps.h>
 #include <asm/mips-boards/generic.h>
 #include <asm/mips-boards/malta.h>
-- 
1.8.3.1

