Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12EDA19774B
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgC3JAi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33844 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728759AbgC3JAh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:37 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2gxtYFeBZohAA--.15S2;
        Mon, 30 Mar 2020 17:00:33 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 31/39] MIPS: sibyte: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:33 -0400
Message-Id: <1585558833-12425-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxP2gxtYFeBZohAA--.15S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFy8AF45JrWrtr4rXw18Xwb_yoWxXFW3pa
        1DA3WkKF4ruryUAw4rZF47WF43Ka98WrWjvFyYg34UZ3WIq3WUJrsayr98A34xJay8Ka18
        WrZxXF1rtw4kZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJV
        WxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        CI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUcYL9UUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-sibyte
to arch/mips/sibyte/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/sibyte/Platform                                         | 8 ++++----
 .../mach-sibyte => sibyte/include/mach}/cpu-feature-overrides.h   | 0
 arch/mips/sibyte/include/mach/ide.h                               | 2 ++
 arch/mips/sibyte/include/mach/ioremap.h                           | 2 ++
 arch/mips/sibyte/include/mach/irq.h                               | 2 ++
 arch/mips/sibyte/include/mach/kernel-entry-init.h                 | 2 ++
 arch/mips/sibyte/include/mach/kmalloc.h                           | 2 ++
 arch/mips/sibyte/include/mach/mangle-port.h                       | 2 ++
 arch/mips/sibyte/include/mach/mc146818rtc.h                       | 2 ++
 arch/mips/sibyte/include/mach/spaces.h                            | 2 ++
 arch/mips/sibyte/include/mach/topology.h                          | 2 ++
 arch/mips/{include/asm/mach-sibyte => sibyte/include/mach}/war.h  | 0
 12 files changed, 22 insertions(+), 4 deletions(-)
 rename arch/mips/{include/asm/mach-sibyte => sibyte/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/sibyte/include/mach/ide.h
 create mode 100644 arch/mips/sibyte/include/mach/ioremap.h
 create mode 100644 arch/mips/sibyte/include/mach/irq.h
 create mode 100644 arch/mips/sibyte/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/sibyte/include/mach/kmalloc.h
 create mode 100644 arch/mips/sibyte/include/mach/mangle-port.h
 create mode 100644 arch/mips/sibyte/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/sibyte/include/mach/spaces.h
 create mode 100644 arch/mips/sibyte/include/mach/topology.h
 rename arch/mips/{include/asm/mach-sibyte => sibyte/include/mach}/war.h (100%)

diff --git a/arch/mips/sibyte/Platform b/arch/mips/sibyte/Platform
index af11733..8b5c39e 100644
--- a/arch/mips/sibyte/Platform
+++ b/arch/mips/sibyte/Platform
@@ -10,19 +10,19 @@ platform-$(CONFIG_SIBYTE_BCM1x80)	+= sibyte/
 # Sibyte SB1250 / BCM1480 family of SOCs
 #
 cflags-$(CONFIG_SIBYTE_BCM112X) +=					\
-		-I$(srctree)/arch/mips/include/asm/mach-sibyte		\
+		-I$(srctree)/arch/mips/sibyte/include			\
 		-DSIBYTE_HDR_FEATURES=SIBYTE_HDR_FMASK_1250_112x_ALL
 
 cflags-$(CONFIG_SIBYTE_SB1250)	+=					\
-		-I$(srctree)/arch/mips/include/asm/mach-sibyte		\
+		-I$(srctree)/arch/mips/sibyte/include			\
 		-DSIBYTE_HDR_FEATURES=SIBYTE_HDR_FMASK_1250_112x_ALL
 
 cflags-$(CONFIG_SIBYTE_BCM1x55) +=					\
-		-I$(srctree)/arch/mips/include/asm/mach-sibyte		\
+		-I$(srctree)/arch/mips/sibyte/include			\
 		-DSIBYTE_HDR_FEATURES=SIBYTE_HDR_FMASK_1480_ALL
 
 cflags-$(CONFIG_SIBYTE_BCM1x80) +=					\
-		-I$(srctree)/arch/mips/include/asm/mach-sibyte		\
+		-I$(srctree)/arch/mips/sibyte/include			\
 		-DSIBYTE_HDR_FEATURES=SIBYTE_HDR_FMASK_1480_ALL
 
 #
diff --git a/arch/mips/include/asm/mach-sibyte/cpu-feature-overrides.h b/arch/mips/sibyte/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-sibyte/cpu-feature-overrides.h
rename to arch/mips/sibyte/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/sibyte/include/mach/ide.h b/arch/mips/sibyte/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/sibyte/include/mach/ioremap.h b/arch/mips/sibyte/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/sibyte/include/mach/irq.h b/arch/mips/sibyte/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/sibyte/include/mach/kernel-entry-init.h b/arch/mips/sibyte/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/sibyte/include/mach/kmalloc.h b/arch/mips/sibyte/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/sibyte/include/mach/mangle-port.h b/arch/mips/sibyte/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/sibyte/include/mach/mc146818rtc.h b/arch/mips/sibyte/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/sibyte/include/mach/spaces.h b/arch/mips/sibyte/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/sibyte/include/mach/topology.h b/arch/mips/sibyte/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/sibyte/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-sibyte/war.h b/arch/mips/sibyte/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-sibyte/war.h
rename to arch/mips/sibyte/include/mach/war.h
-- 
1.8.3.1

