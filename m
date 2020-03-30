Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3541E19772D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgC3I7S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:59:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33304 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728759AbgC3I7S (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:59:18 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax9unhtIFeIpkhAA--.22S2;
        Mon, 30 Mar 2020 16:59:13 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 18/39] MIPS: ip27: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:59:13 -0400
Message-Id: <1585558753-18285-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Ax9unhtIFeIpkhAA--.22S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XrW3Cr48KFW8uF4DWF1rZwb_yoWxGFWxpa
        1DA3WkGws09ryUAw17ZFZFgF4ftw4DWrZIvrWYgr1UZ3ZagF1UXFs3Krn8Ar95AF4kt3WI
        gFW3u3W5trs7uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
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
        jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU7ZXoDUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-ip27
o arch/mips/sgi-ip27/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/sgi-ip27/Platform                                             | 2 +-
 .../asm/mach-ip27 => sgi-ip27/include/mach}/cpu-feature-overrides.h     | 0
 arch/mips/sgi-ip27/include/mach/ioremap.h                               | 2 ++
 arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/irq.h        | 0
 .../asm/mach-ip27 => sgi-ip27/include/mach}/kernel-entry-init.h         | 0
 arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/kmalloc.h    | 0
 .../mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/mangle-port.h | 0
 arch/mips/sgi-ip27/include/mach/mc146818rtc.h                           | 2 ++
 arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/mmzone.h     | 0
 arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/spaces.h     | 0
 arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/topology.h   | 0
 arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/war.h        | 0
 13 files changed, 6 insertions(+), 1 deletion(-)
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/sgi-ip27/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/irq.h (100%)
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/kernel-entry-init.h (100%)
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/kmalloc.h (100%)
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/mangle-port.h (100%)
 create mode 100644 arch/mips/sgi-ip27/include/mach/mc146818rtc.h
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/mmzone.h (100%)
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/spaces.h (100%)
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/topology.h (100%)
 rename arch/mips/{include/asm/mach-ip27 => sgi-ip27/include/mach}/war.h (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index aad4a68..48fd625 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -735,6 +735,7 @@ config SGI_IP27
 	select SYS_SUPPORTS_NUMA
 	select SYS_SUPPORTS_SMP
 	select MIPS_L1_CACHE_SHIFT_7
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
 	  workstations.  To compile a Linux kernel that runs on these, say Y
diff --git a/arch/mips/sgi-ip27/Platform b/arch/mips/sgi-ip27/Platform
index 1fb9c2e..5d37446 100644
--- a/arch/mips/sgi-ip27/Platform
+++ b/arch/mips/sgi-ip27/Platform
@@ -7,7 +7,7 @@
 #
 ifdef CONFIG_SGI_IP27
 platform-$(CONFIG_SGI_IP27)	+= sgi-ip27/
-cflags-$(CONFIG_SGI_IP27)	+= -I$(srctree)/arch/mips/include/asm/mach-ip27
+cflags-$(CONFIG_SGI_IP27)	+= -I$(srctree)/arch/mips/sgi-ip27/include
 ifdef CONFIG_MAPPED_KERNEL
 load-$(CONFIG_SGI_IP27)		+= 0xc00000004001c000
 OBJCOPYFLAGS			:= --change-addresses=0x3fffffff80000000
diff --git a/arch/mips/include/asm/mach-ip27/cpu-feature-overrides.h b/arch/mips/sgi-ip27/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/cpu-feature-overrides.h
rename to arch/mips/sgi-ip27/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/sgi-ip27/include/mach/ioremap.h b/arch/mips/sgi-ip27/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/sgi-ip27/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-ip27/irq.h b/arch/mips/sgi-ip27/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/irq.h
rename to arch/mips/sgi-ip27/include/mach/irq.h
diff --git a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h b/arch/mips/sgi-ip27/include/mach/kernel-entry-init.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/kernel-entry-init.h
rename to arch/mips/sgi-ip27/include/mach/kernel-entry-init.h
diff --git a/arch/mips/include/asm/mach-ip27/kmalloc.h b/arch/mips/sgi-ip27/include/mach/kmalloc.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/kmalloc.h
rename to arch/mips/sgi-ip27/include/mach/kmalloc.h
diff --git a/arch/mips/include/asm/mach-ip27/mangle-port.h b/arch/mips/sgi-ip27/include/mach/mangle-port.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/mangle-port.h
rename to arch/mips/sgi-ip27/include/mach/mangle-port.h
diff --git a/arch/mips/sgi-ip27/include/mach/mc146818rtc.h b/arch/mips/sgi-ip27/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/sgi-ip27/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/sgi-ip27/include/mach/mmzone.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/mmzone.h
rename to arch/mips/sgi-ip27/include/mach/mmzone.h
diff --git a/arch/mips/include/asm/mach-ip27/spaces.h b/arch/mips/sgi-ip27/include/mach/spaces.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/spaces.h
rename to arch/mips/sgi-ip27/include/mach/spaces.h
diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/sgi-ip27/include/mach/topology.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/topology.h
rename to arch/mips/sgi-ip27/include/mach/topology.h
diff --git a/arch/mips/include/asm/mach-ip27/war.h b/arch/mips/sgi-ip27/include/mach/war.h
similarity index 100%
rename from arch/mips/include/asm/mach-ip27/war.h
rename to arch/mips/sgi-ip27/include/mach/war.h
-- 
1.8.3.1

