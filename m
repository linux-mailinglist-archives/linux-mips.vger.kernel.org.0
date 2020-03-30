Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB8E19770F
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgC3Iw7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:52:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60156 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729812AbgC3Iw7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:52:59 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax1ulls4FemZghAA--.17S2;
        Mon, 30 Mar 2020 16:52:53 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/39] MIPS: cavium-octeon: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:52:53 -0400
Message-Id: <1585558373-1897-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Ax1ulls4FemZghAA--.17S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFW7tr4xCw1kAFy8Ww13XFb_yoW7urWrpa
        ykAan5CrWxuryrAF12vr4Ik3yDtan8Gr4jka45W3WUu3W3WF1jvFs5KrnYyry8GF4qyF1S
        grZaqr48Gws2vaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVWxJV
        W8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
        z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jIsjbUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-cavium-octeon
to arch/mips/cavium-octeon/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/cavium-octeon/Platform                                        | 2 +-
 .../include/mach}/cpu-feature-overrides.h                               | 0
 arch/mips/cavium-octeon/include/mach/ioremap.h                          | 2 ++
 .../asm/mach-cavium-octeon => cavium-octeon/include/mach}/irq.h         | 0
 .../include/mach}/kernel-entry-init.h                                   | 0
 arch/mips/cavium-octeon/include/mach/kmalloc.h                          | 2 ++
 .../asm/mach-cavium-octeon => cavium-octeon/include/mach}/mangle-port.h | 0
 .../asm/mach-cavium-octeon => cavium-octeon/include/mach}/spaces.h      | 0
 arch/mips/cavium-octeon/include/mach/topology.h                         | 2 ++
 .../asm/mach-cavium-octeon => cavium-octeon/include/mach}/war.h         | 0
 11 files changed, 8 insertions(+), 1 deletion(-)
 rename arch/mips/{include/asm/mach-cavium-octeon => cavium-octeon/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/cavium-octeon/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-cavium-octeon => cavium-octeon/include/mach}/irq.h (100%)
 rename arch/mips/{include/asm/mach-cavium-octeon => cavium-octeon/include/mach}/kernel-entry-init.h (100%)
 create mode 100644 arch/mips/cavium-octeon/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-cavium-octeon => cavium-octeon/include/mach}/mangle-port.h (100%)
 rename arch/mips/{include/asm/mach-cavium-octeon => cavium-octeon/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/cavium-octeon/include/mach/topology.h
 rename arch/mips/{include/asm/mach-cavium-octeon => cavium-octeon/include/mach}/war.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1ee88a2..f31ff10 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1782,6 +1782,7 @@ config CPU_CAVIUM_OCTEON
 	select USB_OHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select MIPS_L1_CACHE_SHIFT_7
 	select HAVE_KVM
+	select HAVE_MACH_HEAD_FILES
 	help
 	  The Cavium Octeon processor is a highly integrated chip containing
 	  many ethernet hardware widgets for networking tasks. The processor
diff --git a/arch/mips/cavium-octeon/Platform b/arch/mips/cavium-octeon/Platform
index 45be853..cb9ae89 100644
--- a/arch/mips/cavium-octeon/Platform
+++ b/arch/mips/cavium-octeon/Platform
@@ -3,5 +3,5 @@
 #
 platform-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon/
 cflags-$(CONFIG_CAVIUM_OCTEON_SOC)	+=				\
-		-I$(srctree)/arch/mips/include/asm/mach-cavium-octeon
+		-I$(srctree)/arch/mips/cavium-octeon/include
 load-$(CONFIG_CAVIUM_OCTEON_SOC)	+= 0xffffffff81100000
diff --git a/arch/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h b/arch/mips/cavium-octeon/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h
rename to arch/mips/cavium-octeon/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/cavium-octeon/include/mach/ioremap.h b/arch/mips/cavium-octeon/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/cavium-octeon/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-cavium-octeon/irq.h b/arch/mips/cavium-octeon/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-cavium-octeon/irq.h
rename to arch/mips/cavium-octeon/include/mach/irq.h
diff --git a/arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h b/arch/mips/cavium-octeon/include/mach/kernel-entry-init.h
similarity index 100%
rename from arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h
rename to arch/mips/cavium-octeon/include/mach/kernel-entry-init.h
diff --git a/arch/mips/cavium-octeon/include/mach/kmalloc.h b/arch/mips/cavium-octeon/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/cavium-octeon/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h b/arch/mips/cavium-octeon/include/mach/mangle-port.h
similarity index 100%
rename from arch/mips/include/asm/mach-cavium-octeon/mangle-port.h
rename to arch/mips/cavium-octeon/include/mach/mangle-port.h
diff --git a/arch/mips/include/asm/mach-cavium-octeon/spaces.h b/arch/mips/cavium-octeon/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-cavium-octeon/spaces.h
rename to arch/mips/cavium-octeon/include/mach/spaces.h
diff --git a/arch/mips/cavium-octeon/include/mach/topology.h b/arch/mips/cavium-octeon/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/cavium-octeon/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/cavium-octeon/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-cavium-octeon/war.h
rename to arch/mips/cavium-octeon/include/mach/war.h
-- 
1.8.3.1

