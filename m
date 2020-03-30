Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66B62197752
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbgC3JBC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:01:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33972 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729816AbgC3JBC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:01:02 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxT+hItYFeDZohAA--.37S2;
        Mon, 30 Mar 2020 17:00:56 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 35/39] MIPS: paravirt: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:56 -0400
Message-Id: <1585558856-17317-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9AxT+hItYFeDZohAA--.37S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw47CF15Wr43Gr4fCFWxZwb_yoWxCry7pa
        1DA3WkWa1UuFyUArs5uF47Cr43Jan8GFWjyr15Ww1YvasFq3Wjqrs5Grs8AryfAF4qy3W8
        WrZxXr4UJws7Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Remove header files from arch/mips/include/asm/mach-paravirt
to arch/mips/paravirt/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/paravirt/Platform                                             | 2 +-
 .../asm/mach-paravirt => paravirt/include/mach}/cpu-feature-overrides.h | 0
 arch/mips/paravirt/include/mach/floppy.h                                | 2 ++
 arch/mips/paravirt/include/mach/ide.h                                   | 2 ++
 arch/mips/paravirt/include/mach/ioremap.h                               | 2 ++
 arch/mips/{include/asm/mach-paravirt => paravirt/include/mach}/irq.h    | 0
 .../asm/mach-paravirt => paravirt/include/mach}/kernel-entry-init.h     | 0
 arch/mips/paravirt/include/mach/kmalloc.h                               | 2 ++
 arch/mips/paravirt/include/mach/mangle-port.h                           | 2 ++
 arch/mips/paravirt/include/mach/mc146818rtc.h                           | 2 ++
 arch/mips/paravirt/include/mach/spaces.h                                | 2 ++
 arch/mips/paravirt/include/mach/topology.h                              | 2 ++
 arch/mips/paravirt/include/mach/war.h                                   | 2 ++
 14 files changed, 20 insertions(+), 1 deletion(-)
 rename arch/mips/{include/asm/mach-paravirt => paravirt/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/paravirt/include/mach/floppy.h
 create mode 100644 arch/mips/paravirt/include/mach/ide.h
 create mode 100644 arch/mips/paravirt/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-paravirt => paravirt/include/mach}/irq.h (100%)
 rename arch/mips/{include/asm/mach-paravirt => paravirt/include/mach}/kernel-entry-init.h (100%)
 create mode 100644 arch/mips/paravirt/include/mach/kmalloc.h
 create mode 100644 arch/mips/paravirt/include/mach/mangle-port.h
 create mode 100644 arch/mips/paravirt/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/paravirt/include/mach/spaces.h
 create mode 100644 arch/mips/paravirt/include/mach/topology.h
 create mode 100644 arch/mips/paravirt/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 19fbcfa..862306c9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1100,6 +1100,7 @@ config MIPS_PARAVIRT
 	select SYS_HAS_CPU_CAVIUM_OCTEON
 	select HAVE_PCI
 	select SWAP_IO_SPACE
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This option supports guest running under ????
 
diff --git a/arch/mips/paravirt/Platform b/arch/mips/paravirt/Platform
index 7e76ef2..ca91528 100644
--- a/arch/mips/paravirt/Platform
+++ b/arch/mips/paravirt/Platform
@@ -3,6 +3,6 @@
 #
 platform-$(CONFIG_MIPS_PARAVIRT)	+= paravirt/
 cflags-$(CONFIG_MIPS_PARAVIRT)		+=				\
-		-I$(srctree)/arch/mips/include/asm/mach-paravirt
+		-I$(srctree)/arch/mips/paravirt/include
 
 load-$(CONFIG_MIPS_PARAVIRT)	= 0xffffffff80010000
diff --git a/arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h b/arch/mips/paravirt/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h
rename to arch/mips/paravirt/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/paravirt/include/mach/floppy.h b/arch/mips/paravirt/include/mach/floppy.h
new file mode 100644
index 0000000..8e17183
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/floppy.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/floppy.h>
diff --git a/arch/mips/paravirt/include/mach/ide.h b/arch/mips/paravirt/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/paravirt/include/mach/ioremap.h b/arch/mips/paravirt/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-paravirt/irq.h b/arch/mips/paravirt/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-paravirt/irq.h
rename to arch/mips/paravirt/include/mach/irq.h
diff --git a/arch/mips/include/asm/mach-paravirt/kernel-entry-init.h b/arch/mips/paravirt/include/mach/kernel-entry-init.h
similarity index 100%
rename from arch/mips/include/asm/mach-paravirt/kernel-entry-init.h
rename to arch/mips/paravirt/include/mach/kernel-entry-init.h
diff --git a/arch/mips/paravirt/include/mach/kmalloc.h b/arch/mips/paravirt/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/paravirt/include/mach/mangle-port.h b/arch/mips/paravirt/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/paravirt/include/mach/mc146818rtc.h b/arch/mips/paravirt/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/paravirt/include/mach/spaces.h b/arch/mips/paravirt/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/paravirt/include/mach/topology.h b/arch/mips/paravirt/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/paravirt/include/mach/war.h b/arch/mips/paravirt/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/paravirt/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
-- 
1.8.3.1

