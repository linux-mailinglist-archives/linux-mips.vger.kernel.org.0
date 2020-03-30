Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78452197750
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbgC3JA4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33946 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729816AbgC3JAz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:55 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax1ulDtYFeCpohAA--.24S2;
        Mon, 30 Mar 2020 17:00:51 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 34/39] MIPS: sni: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:50 -0400
Message-Id: <1585558850-15693-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Ax1ulDtYFeCpohAA--.24S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFyDZFyDtw13Jw1UCrWfZrb_yoWxCFy3pa
        1DA3WkGF4ruryUA3s3Za47WF43JwsxGrWq9Fy5W342v3WSqF1UJrs3tr98AryxJF4Dt3W0
        gay3ur1Utr4vvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Remove header files from arch/mips/include/asm/mach-rm
to arch/mips/sni/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/pci/fixup-sni.c                                               | 2 +-
 arch/mips/sni/Platform                                                  | 2 +-
 .../{include/asm/mach-rm => sni/include/mach}/cpu-feature-overrides.h   | 0
 arch/mips/sni/include/mach/floppy.h                                     | 2 ++
 arch/mips/sni/include/mach/ide.h                                        | 2 ++
 arch/mips/sni/include/mach/ioremap.h                                    | 2 ++
 arch/mips/sni/include/mach/irq.h                                        | 2 ++
 arch/mips/sni/include/mach/kernel-entry-init.h                          | 2 ++
 arch/mips/sni/include/mach/kmalloc.h                                    | 2 ++
 arch/mips/sni/include/mach/mangle-port.h                                | 2 ++
 arch/mips/{include/asm/mach-rm => sni/include/mach}/mc146818rtc.h       | 0
 arch/mips/sni/include/mach/spaces.h                                     | 2 ++
 arch/mips/sni/include/mach/topology.h                                   | 2 ++
 arch/mips/{include/asm/mach-rm => sni/include/mach}/war.h               | 0
 15 files changed, 21 insertions(+), 2 deletions(-)
 rename arch/mips/{include/asm/mach-rm => sni/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/sni/include/mach/floppy.h
 create mode 100644 arch/mips/sni/include/mach/ide.h
 create mode 100644 arch/mips/sni/include/mach/ioremap.h
 create mode 100644 arch/mips/sni/include/mach/irq.h
 create mode 100644 arch/mips/sni/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/sni/include/mach/kmalloc.h
 create mode 100644 arch/mips/sni/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-rm => sni/include/mach}/mc146818rtc.h (100%)
 create mode 100644 arch/mips/sni/include/mach/spaces.h
 create mode 100644 arch/mips/sni/include/mach/topology.h
 rename arch/mips/{include/asm/mach-rm => sni/include/mach}/war.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0687b94..19fbcfa 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -956,6 +956,7 @@ config SNI_RM
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select HAVE_MACH_HEAD_FILES
 	help
 	  The SNI RM200/300/400 are MIPS-based machines manufactured by
 	  Siemens Nixdorf Informationssysteme (SNI), parent company of Pyramid
diff --git a/arch/mips/pci/fixup-sni.c b/arch/mips/pci/fixup-sni.c
index adb9a58..3ccbd46 100644
--- a/arch/mips/pci/fixup-sni.c
+++ b/arch/mips/pci/fixup-sni.c
@@ -14,7 +14,7 @@
 #include <asm/mipsregs.h>
 #include <asm/sni.h>
 
-#include <irq.h>
+#include <mach/irq.h>
 
 /*
  * PCIMT Shortcuts ...
diff --git a/arch/mips/sni/Platform b/arch/mips/sni/Platform
index 2644a9d..925ed55 100644
--- a/arch/mips/sni/Platform
+++ b/arch/mips/sni/Platform
@@ -2,7 +2,7 @@
 # SNI RM
 #
 platform-$(CONFIG_SNI_RM)		+= sni/
-cflags-$(CONFIG_SNI_RM)		+= -I$(srctree)/arch/mips/include/asm/mach-rm
+cflags-$(CONFIG_SNI_RM)		+= -I$(srctree)/arch/mips/sni/include
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 load-$(CONFIG_SNI_RM)		+= 0xffffffff80600000
 else
diff --git a/arch/mips/include/asm/mach-rm/cpu-feature-overrides.h b/arch/mips/sni/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-rm/cpu-feature-overrides.h
rename to arch/mips/sni/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/sni/include/mach/floppy.h b/arch/mips/sni/include/mach/floppy.h
new file mode 100644
index 0000000..8e17183
--- /dev/null
+++ b/arch/mips/sni/include/mach/floppy.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/floppy.h>
diff --git a/arch/mips/sni/include/mach/ide.h b/arch/mips/sni/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/sni/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/sni/include/mach/ioremap.h b/arch/mips/sni/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/sni/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/sni/include/mach/irq.h b/arch/mips/sni/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/sni/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/sni/include/mach/kernel-entry-init.h b/arch/mips/sni/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/sni/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/sni/include/mach/kmalloc.h b/arch/mips/sni/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/sni/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/sni/include/mach/mangle-port.h b/arch/mips/sni/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/sni/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-rm/mc146818rtc.h b/arch/mips/sni/include/mach/mc146818rtc.h
similarity index 100%
rename from arch/mips/include/asm/mach-rm/mc146818rtc.h
rename to arch/mips/sni/include/mach/mc146818rtc.h
diff --git a/arch/mips/sni/include/mach/spaces.h b/arch/mips/sni/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/sni/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/sni/include/mach/topology.h b/arch/mips/sni/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/sni/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-rm/war.h b/arch/mips/sni/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-rm/war.h
rename to arch/mips/sni/include/mach/war.h
-- 
1.8.3.1

