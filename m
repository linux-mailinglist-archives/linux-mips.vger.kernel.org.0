Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C0F197734
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbgC3I7g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:59:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33408 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729543AbgC3I7g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:59:36 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9zytIFeKZkhAA--.35S2;
        Mon, 30 Mar 2020 16:59:30 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 21/39] MIPS: jazz: Add header file path prefix
Date:   Mon, 30 Mar 2020 04:59:30 -0400
Message-Id: <1585558770-21032-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxn9zytIFeKZkhAA--.35S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1xtr18KFWDJr4rJF1UZFb_yoWxJFyfpa
        1DA3Z5GF4kuryUArn3uFy7tr43tan8GrZ093y5u34UZ3WSqFyUJrs3trZ0yr97Ja1DKa18
        W39xWr15trsYvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r
        4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
        87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU56wZ3UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-jazz
to arch/mips/jazz/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                    | 1 +
 arch/mips/jazz/Platform                                              | 2 +-
 arch/mips/jazz/include/mach/cpu-feature-overrides.h                  | 2 ++
 arch/mips/{include/asm/mach-jazz => jazz/include/mach}/floppy.h      | 0
 arch/mips/jazz/include/mach/ioremap.h                                | 2 ++
 arch/mips/jazz/include/mach/irq.h                                    | 2 ++
 arch/mips/jazz/include/mach/kernel-entry-init.h                      | 2 ++
 arch/mips/jazz/include/mach/kmalloc.h                                | 2 ++
 arch/mips/jazz/include/mach/mangle-port.h                            | 2 ++
 arch/mips/{include/asm/mach-jazz => jazz/include/mach}/mc146818rtc.h | 0
 arch/mips/jazz/include/mach/spaces.h                                 | 2 ++
 arch/mips/jazz/include/mach/topology.h                               | 2 ++
 arch/mips/jazz/include/mach/war.h                                    | 2 ++
 13 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/jazz/include/mach/cpu-feature-overrides.h
 rename arch/mips/{include/asm/mach-jazz => jazz/include/mach}/floppy.h (100%)
 create mode 100644 arch/mips/jazz/include/mach/ioremap.h
 create mode 100644 arch/mips/jazz/include/mach/irq.h
 create mode 100644 arch/mips/jazz/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/jazz/include/mach/kmalloc.h
 create mode 100644 arch/mips/jazz/include/mach/mangle-port.h
 rename arch/mips/{include/asm/mach-jazz => jazz/include/mach}/mc146818rtc.h (100%)
 create mode 100644 arch/mips/jazz/include/mach/spaces.h
 create mode 100644 arch/mips/jazz/include/mach/topology.h
 create mode 100644 arch/mips/jazz/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index af3dddf..9a8ff2d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -391,6 +391,7 @@ config MACH_JAZZ
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_64BIT_KERNEL
 	select SYS_SUPPORTS_100HZ
+	select HAVE_MACH_HEAD_FILES
 	help
 	  This a family of machines based on the MIPS R4030 chipset which was
 	  used by several vendors to build RISC/os and Windows NT workstations.
diff --git a/arch/mips/jazz/Platform b/arch/mips/jazz/Platform
index 3373788..7c35bac 100644
--- a/arch/mips/jazz/Platform
+++ b/arch/mips/jazz/Platform
@@ -2,5 +2,5 @@
 # Acer PICA 61, Mips Magnum 4000 and Olivetti M700.
 #
 platform-$(CONFIG_MACH_JAZZ)	+= jazz/
-cflags-$(CONFIG_MACH_JAZZ)	+= -I$(srctree)/arch/mips/include/asm/mach-jazz
+cflags-$(CONFIG_MACH_JAZZ)	+= -I$(srctree)/arch/mips/jazz/include
 load-$(CONFIG_MACH_JAZZ)	+= 0xffffffff80080000
diff --git a/arch/mips/jazz/include/mach/cpu-feature-overrides.h b/arch/mips/jazz/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/jazz/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/include/asm/mach-jazz/floppy.h b/arch/mips/jazz/include/mach/floppy.h
similarity index 100%
rename from arch/mips/include/asm/mach-jazz/floppy.h
rename to arch/mips/jazz/include/mach/floppy.h
diff --git a/arch/mips/jazz/include/mach/ioremap.h b/arch/mips/jazz/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/jazz/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/jazz/include/mach/irq.h b/arch/mips/jazz/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/jazz/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/jazz/include/mach/kernel-entry-init.h b/arch/mips/jazz/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/jazz/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/jazz/include/mach/kmalloc.h b/arch/mips/jazz/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/jazz/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/jazz/include/mach/mangle-port.h b/arch/mips/jazz/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/jazz/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/include/asm/mach-jazz/mc146818rtc.h b/arch/mips/jazz/include/mach/mc146818rtc.h
similarity index 100%
rename from arch/mips/include/asm/mach-jazz/mc146818rtc.h
rename to arch/mips/jazz/include/mach/mc146818rtc.h
diff --git a/arch/mips/jazz/include/mach/spaces.h b/arch/mips/jazz/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/jazz/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/jazz/include/mach/topology.h b/arch/mips/jazz/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/jazz/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/jazz/include/mach/war.h b/arch/mips/jazz/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/jazz/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
-- 
1.8.3.1

