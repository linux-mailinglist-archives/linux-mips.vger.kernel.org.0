Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3A019772C
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729841AbgC3I7L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:59:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33284 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728759AbgC3I7L (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:59:11 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9_btIFeH5khAA--.19S2;
        Mon, 30 Mar 2020 16:59:07 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 17/39] MIPS: ip28: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:59:07 -0400
Message-Id: <1585558747-13522-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxj9_btIFeH5khAA--.19S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WryDGr15tF1Utr4xAr1rCrg_yoWxGF47pa
        yqy3WkWFsa9ryUCw1rZFy2gr4Sqw4DC3y0kr1Ygw17u3WIgFy5JrZYgryDur95AF4Dt3W0
        gFyS93WUtr4kuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r
        4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
        IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUqXTQUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-ip28
to arch/mips/sgi-ip22/ip28/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/sgi-ip22/Platform                                             | 2 +-
 .../mach-ip28 => sgi-ip22/ip28/include/mach}/cpu-feature-overrides.h    | 0
 arch/mips/sgi-ip22/ip28/include/mach/ioremap.h                          | 2 ++
 arch/mips/sgi-ip22/ip28/include/mach/irq.h                              | 2 ++
 arch/mips/sgi-ip22/ip28/include/mach/kernel-entry-init.h                | 2 ++
 arch/mips/sgi-ip22/ip28/include/mach/kmalloc.h                          | 2 ++
 arch/mips/sgi-ip22/ip28/include/mach/mangle-port.h                      | 2 ++
 arch/mips/sgi-ip22/ip28/include/mach/mc146818rtc.h                      | 2 ++
 .../mips/{include/asm/mach-ip28 => sgi-ip22/ip28/include/mach}/spaces.h | 0
 arch/mips/sgi-ip22/ip28/include/mach/topology.h                         | 2 ++
 arch/mips/{include/asm/mach-ip28 => sgi-ip22/ip28/include/mach}/war.h   | 0
 12 files changed, 16 insertions(+), 1 deletion(-)
 rename arch/mips/{include/asm/mach-ip28 => sgi-ip22/ip28/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/sgi-ip22/ip28/include/mach/ioremap.h
 create mode 100644 arch/mips/sgi-ip22/ip28/include/mach/irq.h
 create mode 100644 arch/mips/sgi-ip22/ip28/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/sgi-ip22/ip28/include/mach/kmalloc.h
 create mode 100644 arch/mips/sgi-ip22/ip28/include/mach/mangle-port.h
 create mode 100644 arch/mips/sgi-ip22/ip28/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-ip28 => sgi-ip22/ip28/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/sgi-ip22/ip28/include/mach/topology.h
 rename arch/mips/{include/asm/mach-ip28 => sgi-ip22/ip28/include/mach}/war.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d394542..aad4a68 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -769,6 +769,7 @@ config SGI_IP28
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select MIPS_L1_CACHE_SHIFT_7
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This is the SGI Indigo2 with R10000 processor.  To compile a Linux
 	  kernel that runs on these, say Y here.
diff --git a/arch/mips/sgi-ip22/Platform b/arch/mips/sgi-ip22/Platform
index 539b305..ef1db85 100644
--- a/arch/mips/sgi-ip22/Platform
+++ b/arch/mips/sgi-ip22/Platform
@@ -30,5 +30,5 @@ ifdef CONFIG_SGI_IP28
   endif
 endif
 platform-$(CONFIG_SGI_IP28)		+= sgi-ip22/
-cflags-$(CONFIG_SGI_IP28)	+= -mr10k-cache-barrier=store -I$(srctree)/arch/mips/include/asm/mach-ip28
+cflags-$(CONFIG_SGI_IP28)	+= -mr10k-cache-barrier=store -I$(srctree)/arch/mips/sgi-ip22/ip28/include
 load-$(CONFIG_SGI_IP28)		+= 0xa800000020004000
diff --git a/arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h b/arch/mips/sgi-ip22/ip28/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h
rename to arch/mips/sgi-ip22/ip28/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/sgi-ip22/ip28/include/mach/ioremap.h b/arch/mips/sgi-ip22/ip28/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/sgi-ip22/ip28/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/sgi-ip22/ip28/include/mach/irq.h b/arch/mips/sgi-ip22/ip28/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/sgi-ip22/ip28/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/sgi-ip22/ip28/include/mach/kernel-entry-init.h b/arch/mips/sgi-ip22/ip28/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/sgi-ip22/ip28/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/sgi-ip22/ip28/include/mach/kmalloc.h b/arch/mips/sgi-ip22/ip28/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/sgi-ip22/ip28/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/sgi-ip22/ip28/include/mach/mangle-port.h b/arch/mips/sgi-ip22/ip28/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/sgi-ip22/ip28/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/sgi-ip22/ip28/include/mach/mc146818rtc.h b/arch/mips/sgi-ip22/ip28/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/sgi-ip22/ip28/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-ip28/spaces.h b/arch/mips/sgi-ip22/ip28/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip28/spaces.h
rename to arch/mips/sgi-ip22/ip28/include/mach/spaces.h
diff --git a/arch/mips/sgi-ip22/ip28/include/mach/topology.h b/arch/mips/sgi-ip22/ip28/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/sgi-ip22/ip28/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-ip28/war.h b/arch/mips/sgi-ip22/ip28/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip28/war.h
rename to arch/mips/sgi-ip22/ip28/include/mach/war.h
-- 
1.8.3.1

