Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF0E3197730
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729827AbgC3I7Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:59:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33330 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728759AbgC3I7X (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:59:23 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb2jntIFeI5khAA--.27S2;
        Mon, 30 Mar 2020 16:59:19 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 19/39] MIPS: ip30: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:59:19 -0400
Message-Id: <1585558759-18419-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxb2jntIFeI5khAA--.27S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw15tFy7AF15GFWfZrWrXwb_yoW7uFWxpa
        n2y3Z5Gr45urW5AryDZFy7Kr43Ja1DGrWjvrWYg347Z3WSq3WUJFs3t3s8Ar97AF4Dtay0
        gFW3WF1DJF4kuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r
        4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
        IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUq_MaDUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-ip30
to arch/mips/sgi-ip30/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/sgi-ip30/Platform                                             | 2 +-
 .../asm/mach-ip30 => sgi-ip30/include/mach}/cpu-feature-overrides.h     | 0
 arch/mips/sgi-ip30/include/mach/ioremap.h                               | 2 ++
 arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/irq.h        | 0
 .../asm/mach-ip30 => sgi-ip30/include/mach}/kernel-entry-init.h         | 0
 arch/mips/sgi-ip30/include/mach/kmalloc.h                               | 2 ++
 .../mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/mangle-port.h | 0
 arch/mips/sgi-ip30/include/mach/mc146818rtc.h                           | 2 ++
 arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/spaces.h     | 0
 arch/mips/sgi-ip30/include/mach/topology.h                              | 2 ++
 arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/war.h        | 0
 12 files changed, 10 insertions(+), 1 deletion(-)
 rename arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/sgi-ip30/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/irq.h (100%)
 rename arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/kernel-entry-init.h (100%)
 create mode 100644 arch/mips/sgi-ip30/include/mach/kmalloc.h
 rename arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/mangle-port.h (100%)
 create mode 100644 arch/mips/sgi-ip30/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/spaces.h (100%)
 create mode 100644 arch/mips/sgi-ip30/include/mach/topology.h
 rename arch/mips/{include/asm/mach-ip30 => sgi-ip30/include/mach}/war.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 48fd625..6a6cf8c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -798,6 +798,7 @@ config SGI_IP30
 	select SYS_SUPPORTS_SMP
 	select MIPS_L1_CACHE_SHIFT_7
 	select ARC_MEMORY
+	select HAVE_MACH_HEAD_FILES
 	help
 	  These are the SGI Octane and Octane2 graphics workstations.  To
 	  compile a Linux kernel that runs on these, say Y here.
diff --git a/arch/mips/sgi-ip30/Platform b/arch/mips/sgi-ip30/Platform
index 2b5695c..38433a5 100644
--- a/arch/mips/sgi-ip30/Platform
+++ b/arch/mips/sgi-ip30/Platform
@@ -3,6 +3,6 @@
 #
 ifdef CONFIG_SGI_IP30
 platform-$(CONFIG_SGI_IP30)		+= sgi-ip30/
-cflags-$(CONFIG_SGI_IP30)		+= -I$(srctree)/arch/mips/include/asm/mach-ip30
+cflags-$(CONFIG_SGI_IP30)		+= -I$(srctree)/arch/mips/sgi-ip30/include
 load-$(CONFIG_SGI_IP30)			+= 0xa800000020004000
 endif
diff --git a/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h b/arch/mips/sgi-ip30/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
rename to arch/mips/sgi-ip30/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/sgi-ip30/include/mach/ioremap.h b/arch/mips/sgi-ip30/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/sgi-ip30/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-ip30/irq.h b/arch/mips/sgi-ip30/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip30/irq.h
rename to arch/mips/sgi-ip30/include/mach/irq.h
diff --git a/arch/mips/include/asm/mach-ip30/kernel-entry-init.h b/arch/mips/sgi-ip30/include/mach/kernel-entry-init.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip30/kernel-entry-init.h
rename to arch/mips/sgi-ip30/include/mach/kernel-entry-init.h
diff --git a/arch/mips/sgi-ip30/include/mach/kmalloc.h b/arch/mips/sgi-ip30/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/sgi-ip30/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/include/asm/mach-ip30/mangle-port.h b/arch/mips/sgi-ip30/include/mach/mangle-port.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip30/mangle-port.h
rename to arch/mips/sgi-ip30/include/mach/mangle-port.h
diff --git a/arch/mips/sgi-ip30/include/mach/mc146818rtc.h b/arch/mips/sgi-ip30/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/sgi-ip30/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-ip30/spaces.h b/arch/mips/sgi-ip30/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip30/spaces.h
rename to arch/mips/sgi-ip30/include/mach/spaces.h
diff --git a/arch/mips/sgi-ip30/include/mach/topology.h b/arch/mips/sgi-ip30/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/sgi-ip30/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/sgi-ip30/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip30/war.h
rename to arch/mips/sgi-ip30/include/mach/war.h
-- 
1.8.3.1

