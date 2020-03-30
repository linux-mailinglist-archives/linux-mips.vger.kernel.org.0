Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4B3519773B
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbgC3I7z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:59:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33518 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729543AbgC3I7y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:59:54 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz2gFtYFeO5khAA--.23S2;
        Mon, 30 Mar 2020 16:59:49 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 24/39] MIPS: lasat: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:59:48 -0400
Message-Id: <1585558788-32476-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxz2gFtYFeO5khAA--.23S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr4Uuw1rCrW8XFWftFy5Arb_yoWxurWfpa
        1kA3Z5WF45ua4jkr1rZay7XF4fJan8G3yYkFyYg34UZ3ZaqF1UXan3tr98Ar97JFs8t3Wx
        W3yfXF4Utr4vvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Remove header files from arch/mips/include/asm/mach-lasat
to arch/mips/lasat/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/lasat/Platform                                                | 2 +-
 arch/mips/lasat/include/mach/cpu-feature-overrides.h                    | 2 ++
 arch/mips/lasat/include/mach/ioremap.h                                  | 2 ++
 arch/mips/{include/asm/mach-lasat => lasat/include/mach}/irq.h          | 0
 arch/mips/lasat/include/mach/kernel-entry-init.h                        | 2 ++
 arch/mips/lasat/include/mach/kmalloc.h                                  | 2 ++
 arch/mips/{include/asm/mach-lasat => lasat/include/mach}/mach-gt64120.h | 0
 arch/mips/lasat/include/mach/mangle-port.h                              | 2 ++
 arch/mips/lasat/include/mach/mc146818rtc.h                              | 2 ++
 arch/mips/lasat/include/mach/spaces.h                                   | 2 ++
 arch/mips/lasat/include/mach/topology.h                                 | 2 ++
 arch/mips/lasat/include/mach/war.h                                      | 2 ++
 arch/mips/lasat/interrupt.c                                             | 2 +-
 arch/mips/pci/pci-lasat.c                                               | 2 +-
 15 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/lasat/include/mach/cpu-feature-overrides.h
 create mode 100644 arch/mips/lasat/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-lasat => lasat/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/lasat/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/lasat/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-lasat => lasat/include/mach}/mach-gt64120.h (100%)
 create mode 100644 arch/mips/lasat/include/mach/mangle-port.h
 create mode 100644 arch/mips/lasat/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/lasat/include/mach/spaces.h
 create mode 100644 arch/mips/lasat/include/mach/topology.h
 create mode 100644 arch/mips/lasat/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 738863fc..37d4d48 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -455,6 +455,7 @@ config LASAT
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL if BROKEN
 	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select HAVE_MACH_HEAD_FILES
 
 config MACH_LOONGSON32
 	bool "Loongson 32-bit family of machines"
diff --git a/arch/mips/lasat/Platform b/arch/mips/lasat/Platform
index 7602528..9bd958b 100644
--- a/arch/mips/lasat/Platform
+++ b/arch/mips/lasat/Platform
@@ -3,5 +3,5 @@
 #
 platform-$(CONFIG_LASAT)	+= lasat/
 cflags-$(CONFIG_LASAT)		+=					\
-		-I$(srctree)/arch/mips/include/asm/mach-lasat
+		-I$(srctree)/arch/mips/lasat/include
 load-$(CONFIG_LASAT)		+= 0xffffffff80000000
diff --git a/arch/mips/lasat/include/mach/cpu-feature-overrides.h b/arch/mips/lasat/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/lasat/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/lasat/include/mach/ioremap.h b/arch/mips/lasat/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/lasat/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-lasat/irq.h b/arch/mips/lasat/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-lasat/irq.h
rename to arch/mips/lasat/include/mach/irq.h
diff --git a/arch/mips/lasat/include/mach/kernel-entry-init.h b/arch/mips/lasat/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/lasat/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/lasat/include/mach/kmalloc.h b/arch/mips/lasat/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/lasat/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-lasat/mach-gt64120.h b/arch/mips/lasat/include/mach/mach-gt64120.h
similarity index 100%
rename from arch/mips/include/asm/mach-lasat/mach-gt64120.h
rename to arch/mips/lasat/include/mach/mach-gt64120.h
diff --git a/arch/mips/lasat/include/mach/mangle-port.h b/arch/mips/lasat/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/lasat/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/lasat/include/mach/mc146818rtc.h b/arch/mips/lasat/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/lasat/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/lasat/include/mach/spaces.h b/arch/mips/lasat/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/lasat/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/lasat/include/mach/topology.h b/arch/mips/lasat/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/lasat/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/lasat/include/mach/war.h b/arch/mips/lasat/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/lasat/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/arch/mips/lasat/interrupt.c b/arch/mips/lasat/interrupt.c
index 7965bbd..6d48e33 100644
--- a/arch/mips/lasat/interrupt.c
+++ b/arch/mips/lasat/interrupt.c
@@ -14,7 +14,7 @@
 #include <asm/lasat/lasat.h>
 #include <asm/lasat/lasatint.h>
 
-#include <irq.h>
+#include <mach/irq.h>
 
 static volatile int *lasat_int_status;
 static volatile int *lasat_int_mask;
diff --git a/arch/mips/pci/pci-lasat.c b/arch/mips/pci/pci-lasat.c
index 47f4ee6..a20a1b9 100644
--- a/arch/mips/pci/pci-lasat.c
+++ b/arch/mips/pci/pci-lasat.c
@@ -12,7 +12,7 @@
 
 #include <asm/lasat/lasat.h>
 
-#include <irq.h>
+#include <mach/irq.h>
 
 extern struct pci_ops nile4_pci_ops;
 extern struct pci_ops gt64xxx_pci0_ops;
-- 
1.8.3.1

