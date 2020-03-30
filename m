Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 794BE197748
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 11:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgC3JAe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 05:00:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33780 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729768AbgC3JAd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 05:00:33 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv90ltYFeAZohAA--.24S2;
        Mon, 30 Mar 2020 17:00:21 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 29/39] MIPS: vr41xx: Add header file path prefix
Date:   Mon, 30 Mar 2020 05:00:21 -0400
Message-Id: <1585558821-5350-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxv90ltYFeAZohAA--.24S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GF1xtw48AryrZFyrXw4DCFg_yoWxJw1rpa
        nrA3WkKF4UuryjkryrZFy2qr43Jan8GrWq9ry5u3WUZ3WSqF1UJFs5Ar90yFyxXF45t3WF
        gFZIgr1Utw4v9aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r
        4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
        87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8IeHDUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-vr41xx
to arch/mips/vr41xx/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                | 1 +
 arch/mips/vr41xx/Platform                                        | 2 +-
 arch/mips/vr41xx/include/mach/cpu-feature-overrides.h            | 2 ++
 arch/mips/vr41xx/include/mach/ide.h                              | 2 ++
 arch/mips/vr41xx/include/mach/ioremap.h                          | 2 ++
 arch/mips/{include/asm/mach-vr41xx => vr41xx/include/mach}/irq.h | 0
 arch/mips/vr41xx/include/mach/kernel-entry-init.h                | 2 ++
 arch/mips/vr41xx/include/mach/kmalloc.h                          | 2 ++
 arch/mips/vr41xx/include/mach/mangle-port.h                      | 2 ++
 arch/mips/vr41xx/include/mach/mc146818rtc.h                      | 2 ++
 arch/mips/vr41xx/include/mach/spaces.h                           | 2 ++
 arch/mips/vr41xx/include/mach/topology.h                         | 2 ++
 arch/mips/vr41xx/include/mach/war.h                              | 2 ++
 13 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/vr41xx/include/mach/cpu-feature-overrides.h
 create mode 100644 arch/mips/vr41xx/include/mach/ide.h
 create mode 100644 arch/mips/vr41xx/include/mach/ioremap.h
 rename arch/mips/{include/asm/mach-vr41xx => vr41xx/include/mach}/irq.h (100%)
 create mode 100644 arch/mips/vr41xx/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/vr41xx/include/mach/kmalloc.h
 create mode 100644 arch/mips/vr41xx/include/mach/mangle-port.h
 create mode 100644 arch/mips/vr41xx/include/mach/mc146818rtc.h
 create mode 100644 arch/mips/vr41xx/include/mach/spaces.h
 create mode 100644 arch/mips/vr41xx/include/mach/topology.h
 create mode 100644 arch/mips/vr41xx/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9a149e7..30b520c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -625,6 +625,7 @@ config MACH_VR41XX
 	select SYS_HAS_CPU_VR41XX
 	select SYS_SUPPORTS_MIPS16
 	select GPIOLIB
+	select HAVE_MACH_HEAD_FILES
 
 config NXP_STB220
 	bool "NXP STB220 board"
diff --git a/arch/mips/vr41xx/Platform b/arch/mips/vr41xx/Platform
index b6c8d5c..d21dcc60 100644
--- a/arch/mips/vr41xx/Platform
+++ b/arch/mips/vr41xx/Platform
@@ -2,7 +2,7 @@
 # NEC VR4100 series based machines
 #
 platform-$(CONFIG_MACH_VR41XX)	+= vr41xx/common/
-cflags-$(CONFIG_MACH_VR41XX)	+= -I$(srctree)/arch/mips/include/asm/mach-vr41xx
+cflags-$(CONFIG_MACH_VR41XX)	+= -I$(srctree)/arch/mips/vr41xx/include
 
 #
 # CASIO CASSIPEIA E-55/65 (VR4111)
diff --git a/arch/mips/vr41xx/include/mach/cpu-feature-overrides.h b/arch/mips/vr41xx/include/mach/cpu-feature-overrides.h
new file mode 100644
index 0000000..f3e0e12
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/cpu-feature-overrides.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/cpu-feature-overrides.h>
diff --git a/arch/mips/vr41xx/include/mach/ide.h b/arch/mips/vr41xx/include/mach/ide.h
new file mode 100644
index 0000000..1251c0c
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/ide.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ide.h>
diff --git a/arch/mips/vr41xx/include/mach/ioremap.h b/arch/mips/vr41xx/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/include/asm/mach-vr41xx/irq.h b/arch/mips/vr41xx/include/mach/irq.h
similarity index 100%
rename from arch/mips/include/asm/mach-vr41xx/irq.h
rename to arch/mips/vr41xx/include/mach/irq.h
diff --git a/arch/mips/vr41xx/include/mach/kernel-entry-init.h b/arch/mips/vr41xx/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/vr41xx/include/mach/kmalloc.h b/arch/mips/vr41xx/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/vr41xx/include/mach/mangle-port.h b/arch/mips/vr41xx/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/vr41xx/include/mach/mc146818rtc.h b/arch/mips/vr41xx/include/mach/mc146818rtc.h
new file mode 100644
index 0000000..7284af8
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/mc146818rtc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mc146818rtc.h>
diff --git a/arch/mips/vr41xx/include/mach/spaces.h b/arch/mips/vr41xx/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/vr41xx/include/mach/topology.h b/arch/mips/vr41xx/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/vr41xx/include/mach/war.h b/arch/mips/vr41xx/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/vr41xx/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
-- 
1.8.3.1

