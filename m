Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5862F197740
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729788AbgC3JAH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:07 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33632 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729543AbgC3JAG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:06 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv2sRtYFegZkhAA--.13S2;
        Mon, 30 Mar 2020 17:00:01 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 26/39] MIPS: pistachio: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:01 -0400
Message-Id: <1585558801-16498-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxv2sRtYFegZkhAA--.13S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKFyfAFyrWF4fuw1ruFykZrb_yoWxWryfpa
        1kAwn7GF40934jya1fZ3W7Zr43tws5GrWj9ry5Ww1UZ3ZIgF1UXrs5trZ8Z34xJFW2ya1r
        ur9xWr1Utr4kZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJV
        W8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVWUCVW8JwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
        z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07beWl9UUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-pistachio
to arch/mips/pistachio/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                      | 1 +
 arch/mips/include/asm/eva.h                                            | 2 +-
 arch/mips/pistachio/Platform                                           | 2 +-
 arch/mips/pistachio/include/mach/cpu-feature-overrides.h               | 2 ++
 arch/mips/pistachio/include/mach/ioremap.h                             | 2 ++
 arch/mips/{include/asm/mach-pistachio => pistachio/include/mach}/irq.h | 0
 arch/mips/pistachio/include/mach/kernel-entry-init.h                   | 2 ++
 arch/mips/pistachio/include/mach/kmalloc.h                             | 2 ++
 arch/mips/pistachio/include/mach/mangle-port.h                         | 2 ++
 arch/mips/pistachio/include/mach/mc146818rtc.h                         | 2 ++
 arch/mips/pistachio/include/mach/spaces.h                              | 2 ++
 arch/mips/pistachio/include/mach/topology.h                            | 2 ++
 arch/mips/pistachio/include/mach/war.h                                 | 2 ++
 13 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/pistachio/include/mach/cpu-feature-overrides.h
 create mode 100644 arch/mips/pistachio/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-pistachio => pistachio/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/pistachio/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/pistachio/include/mach/kmalloc.h
 create mode 100644 arch/mips/pistachio/include/mach/mangle-port.h
 create mode 100644 arch/mips/pistachio/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/pistachio/include/mach/spaces.h
 create mode 100644 arch/mips/pistachio/include/mach/topology.h
 create mode 100644 arch/mips/pistachio/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ce1b5e3..f5f144f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -541,6 +541,7 @@ config MACH_PISTACHIO
 	select SYS_HAS_EARLY_PRINTK
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select USE_OF
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This enables support for the IMG Pistachio SoC platform.
 
diff --git a/arch/mips/include/asm/eva.h b/arch/mips/include/asm/eva.h
index a3d1807..45034a5 100644
--- a/arch/mips/include/asm/eva.h
+++ b/arch/mips/include/asm/eva.h
@@ -11,7 +11,7 @@
 #ifndef _ASM_EVA_H
 #define _ASM_EVA_H
 
-#include <kernel-entry-init.h>
+#include <mach/kernel-entry-init.h>
 
 #ifdef __ASSEMBLY__
 
diff --git a/arch/mips/pistachio/Platform b/arch/mips/pistachio/Platform
index c3592b37..22580e9 100644
--- a/arch/mips/pistachio/Platform
+++ b/arch/mips/pistachio/Platform
@@ -3,7 +3,7 @@
 #
 platform-$(CONFIG_MACH_PISTACHIO)	+= pistachio/
 cflags-$(CONFIG_MACH_PISTACHIO)		+=				\
-		-I$(srctree)/arch/mips/include/asm/mach-pistachio
+		-I$(srctree)/arch/mips/pistachio/include
 load-$(CONFIG_MACH_PISTACHIO)		+= 0xffffffff80400000
 zload-$(CONFIG_MACH_PISTACHIO)		+= 0xffffffff81000000
 all-$(CONFIG_MACH_PISTACHIO)		:= uImage.gz
diff --git a/arch/mips/pistachio/include/mach/cpu-feature-overrides.h b/arch/mips/pistachio/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/pistachio/include/mach/ioremap.h b/arch/mips/pistachio/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-pistachio/irq.h b/arch/mips/pistachio/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-pistachio/irq.h
rename to arch/mips/pistachio/include/mach/irq.h
diff --git a/arch/mips/pistachio/include/mach/kernel-entry-init.h b/arch/mips/pistachio/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/pistachio/include/mach/kmalloc.h b/arch/mips/pistachio/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/pistachio/include/mach/mangle-port.h b/arch/mips/pistachio/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/pistachio/include/mach/mc146818rtc.h b/arch/mips/pistachio/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/pistachio/include/mach/spaces.h b/arch/mips/pistachio/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/pistachio/include/mach/topology.h b/arch/mips/pistachio/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/pistachio/include/mach/war.h b/arch/mips/pistachio/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/pistachio/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
-- 
1.8.3.1

