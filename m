Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886C1197707
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbgC3Iwk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:52:40 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60066 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728759AbgC3Iwk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:52:40 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx72pSs4Fek5ghAA--.15S2;
        Mon, 30 Mar 2020 16:52:34 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/39] MIPS: bmips: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:52:33 -0400
Message-Id: <1585558353-13665-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dx72pSs4Fek5ghAA--.15S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw17Xr1ruF1UJry8XFW3GFg_yoW7WrWfpa
        1DA3Z5Kr4j9ryUAFy5ZFyxKr43Ja1DGrWqkFWYgw17Z3WaqF1UJrs3trs8AryxJF4qy3WF
        grWfXr4Utrsavw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVWxJV
        W8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAI
        cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bzCJdUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-bmips
to arch/mips/bmips/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/bmips/Platform                                                | 2 +-
 .../asm/mach-bmips => bmips/include/mach}/cpu-feature-overrides.h       | 0
 arch/mips/{include/asm/mach-bmips => bmips/include/mach}/ioremap.h      | 0
 arch/mips/bmips/include/mach/irq.h                                      | 2 ++
 arch/mips/bmips/include/mach/kernel-entry-init.h                        | 2 ++
 arch/mips/bmips/include/mach/kmalloc.h                                  | 2 ++
 arch/mips/bmips/include/mach/mangle-port.h                              | 2 ++
 arch/mips/{include/asm/mach-bmips => bmips/include/mach}/spaces.h       | 0
 arch/mips/bmips/include/mach/topology.h                                 | 2 ++
 arch/mips/bmips/include/mach/war.h                                      | 2 ++
 11 files changed, 14 insertions(+), 1 deletion(-)
 rename arch/mips/{include/asm/mach-bmips => bmips/include/mach}/cpu-feature-overrides.h (100%)
 rename arch/mips/{include/asm/mach-bmips => bmips/include/mach}/ioremap.h (100%)
 create mode 100644 arch/mips/bmips/include/mach/irq.h
 create mode 100644 arch/mips/bmips/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/bmips/include/mach/kmalloc.h
 create mode 100644 arch/mips/bmips/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-bmips => bmips/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/bmips/include/mach/topology.h
 create mode 100644 arch/mips/bmips/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e8e6f2b..1ee88a2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -259,6 +259,7 @@ config BMIPS_GENERIC
 	select USB_OHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_OHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select HARDIRQS_SW_RESEND
+	select HAVE_MACH_HEAD_FILES
 	help
 	  Build a generic DT-based kernel image that boots on select
 	  BCM33xx cable modem chips, BCM63xx DSL chips, and BCM7xxx set-top
diff --git a/arch/mips/bmips/Platform b/arch/mips/bmips/Platform
index 5f127fd..8b9574f 100644
--- a/arch/mips/bmips/Platform
+++ b/arch/mips/bmips/Platform
@@ -3,5 +3,5 @@
 #
 platform-$(CONFIG_BMIPS_GENERIC)	+= bmips/
 cflags-$(CONFIG_BMIPS_GENERIC)		+=				\
-		-I$(srctree)/arch/mips/include/asm/mach-bmips/
+		-I$(srctree)/arch/mips/bmips/include
 load-$(CONFIG_BMIPS_GENERIC)		:= 0xffffffff80010000
diff --git a/arch/mips/include/asm/mach-bmips/cpu-feature-overrides.h b/arch/mips/bmips/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-bmips/cpu-feature-overrides.h
rename to arch/mips/bmips/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/include/asm/mach-bmips/ioremap.h b/arch/mips/bmips/include/mach/ioremap.h
similarity index 100%
rename from arch/mips/include/asm/mach-bmips/ioremap.h
rename to arch/mips/bmips/include/mach/ioremap.h
diff --git a/arch/mips/bmips/include/mach/irq.h b/arch/mips/bmips/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/bmips/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/bmips/include/mach/kernel-entry-init.h b/arch/mips/bmips/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/bmips/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/bmips/include/mach/kmalloc.h b/arch/mips/bmips/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/bmips/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/bmips/include/mach/mangle-port.h b/arch/mips/bmips/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/bmips/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-bmips/spaces.h b/arch/mips/bmips/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-bmips/spaces.h
rename to arch/mips/bmips/include/mach/spaces.h
diff --git a/arch/mips/bmips/include/mach/topology.h b/arch/mips/bmips/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/bmips/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/bmips/include/mach/war.h b/arch/mips/bmips/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/bmips/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
-- 
1.8.3.1

