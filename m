Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C57451976AB
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgC3IjI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:39:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56830 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729754AbgC3IjF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:39:05 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT2gjsIFeLJchAA--.18S2;
        Mon, 30 Mar 2020 16:39:00 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/39] MIPS: ath25: Add header files path prefix
Date:   Mon, 30 Mar 2020 04:38:59 -0400
Message-Id: <1585557539-22068-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxT2gjsIFeLJchAA--.18S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GrWxWryUAFyUuFWDCr4rKrg_yoW3AFWDpa
        1DA3WkCrsrur1jy3sxuFy7tr43Jan8WrWq9FyrW34DZa4aqF18JFs5KryqvFyxJF4DK3Wr
        Wry3Wr4UJa1vvaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMI
        IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYIeHPUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove header files from arch/mips/include/asm/mach-ath25
to arch/mips/ath25/include/mach

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/Kconfig                                                       | 1 +
 arch/mips/ath25/Platform                                                | 2 +-
 arch/mips/ath25/ar2315.c                                                | 2 +-
 arch/mips/ath25/ar5312.c                                                | 2 +-
 arch/mips/ath25/board.c                                                 | 2 +-
 arch/mips/ath25/devices.c                                               | 2 +-
 .../{include/asm/mach-ath25 => ath25/include/mach}/ath25_platform.h     | 0
 .../asm/mach-ath25 => ath25/include/mach}/cpu-feature-overrides.h       | 0
 arch/mips/ath25/include/mach/ioremap.h                                  | 2 ++
 arch/mips/ath25/include/mach/irq.h                                      | 2 ++
 arch/mips/ath25/include/mach/kernel-entry-init.h                        | 2 ++
 arch/mips/ath25/include/mach/kmalloc.h                                  | 2 ++
 arch/mips/ath25/include/mach/mangle-port.h                              | 2 ++
 arch/mips/ath25/include/mach/spaces.h                                   | 2 ++
 arch/mips/ath25/include/mach/topology.h                                 | 2 ++
 arch/mips/ath25/include/mach/war.h                                      | 2 ++
 drivers/net/wireless/ath/ath5k/ahb.c                                    | 2 +-
 17 files changed, 23 insertions(+), 6 deletions(-)
 rename arch/mips/{include/asm/mach-ath25 => ath25/include/mach}/ath25_platform.h (100%)
 rename arch/mips/{include/asm/mach-ath25 => ath25/include/mach}/cpu-feature-overrides.h (100%)
 create mode 100644 arch/mips/ath25/include/mach/ioremap.h
 create mode 100644 arch/mips/ath25/include/mach/irq.h
 create mode 100644 arch/mips/ath25/include/mach/kernel-entry-init.h
 create mode 100644 arch/mips/ath25/include/mach/kmalloc.h
 create mode 100644 arch/mips/ath25/include/mach/mangle-port.h
 create mode 100644 arch/mips/ath25/include/mach/spaces.h
 create mode 100644 arch/mips/ath25/include/mach/topology.h
 create mode 100644 arch/mips/ath25/include/mach/war.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2bb678d..7fec160 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -198,6 +198,7 @@ config ATH25
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_HAS_EARLY_PRINTK
+	select HAVE_MACH_HEAD_FILES
 	help
 	  Support for Atheros AR231x and Atheros AR531x based boards
 
diff --git a/arch/mips/ath25/Platform b/arch/mips/ath25/Platform
index ef3f81f..a4fddcc 100644
--- a/arch/mips/ath25/Platform
+++ b/arch/mips/ath25/Platform
@@ -2,5 +2,5 @@
 # Atheros AR531X/AR231X WiSoC
 #
 platform-$(CONFIG_ATH25)	+= ath25/
-cflags-$(CONFIG_ATH25)		+= -I$(srctree)/arch/mips/include/asm/mach-ath25
+cflags-$(CONFIG_ATH25)		+= -I$(srctree)/arch/mips/ath25/include
 load-$(CONFIG_ATH25)		+= 0xffffffff80041000
diff --git a/arch/mips/ath25/ar2315.c b/arch/mips/ath25/ar2315.c
index e7b53e3..e435ccc 100644
--- a/arch/mips/ath25/ar2315.c
+++ b/arch/mips/ath25/ar2315.c
@@ -25,7 +25,7 @@
 #include <asm/reboot.h>
 #include <asm/time.h>
 
-#include <ath25_platform.h>
+#include <mach/ath25_platform.h>
 
 #include "devices.h"
 #include "ar2315.h"
diff --git a/arch/mips/ath25/ar5312.c b/arch/mips/ath25/ar5312.c
index 42bf2af..2f1a8b1 100644
--- a/arch/mips/ath25/ar5312.c
+++ b/arch/mips/ath25/ar5312.c
@@ -26,7 +26,7 @@
 #include <asm/reboot.h>
 #include <asm/time.h>
 
-#include <ath25_platform.h>
+#include <mach/ath25_platform.h>
 
 #include "devices.h"
 #include "ar5312.h"
diff --git a/arch/mips/ath25/board.c b/arch/mips/ath25/board.c
index cb99f97..5ec998b 100644
--- a/arch/mips/ath25/board.c
+++ b/arch/mips/ath25/board.c
@@ -16,7 +16,7 @@
 #include <asm/bootinfo.h>
 #include <asm/time.h>
 
-#include <ath25_platform.h>
+#include <mach/ath25_platform.h>
 #include "devices.h"
 #include "ar5312.h"
 #include "ar2315.h"
diff --git a/arch/mips/ath25/devices.c b/arch/mips/ath25/devices.c
index 301a902..bf5f737 100644
--- a/arch/mips/ath25/devices.c
+++ b/arch/mips/ath25/devices.c
@@ -5,7 +5,7 @@
 #include <linux/platform_device.h>
 #include <asm/bootinfo.h>
 
-#include <ath25_platform.h>
+#include <mach/ath25_platform.h>
 #include "devices.h"
 #include "ar5312.h"
 #include "ar2315.h"
diff --git a/arch/mips/include/asm/mach-ath25/ath25_platform.h b/arch/mips/ath25/include/mach/ath25_platform.h
similarity index 100%
rename from arch/mips/include/asm/mach-ath25/ath25_platform.h
rename to arch/mips/ath25/include/mach/ath25_platform.h
diff --git a/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h b/arch/mips/ath25/include/mach/cpu-feature-overrides.h
similarity index 100%
rename from arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
rename to arch/mips/ath25/include/mach/cpu-feature-overrides.h
diff --git a/arch/mips/ath25/include/mach/ioremap.h b/arch/mips/ath25/include/mach/ioremap.h
new file mode 100644
index 0000000..2369393
--- /dev/null
+++ b/arch/mips/ath25/include/mach/ioremap.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/ioremap.h>
diff --git a/arch/mips/ath25/include/mach/irq.h b/arch/mips/ath25/include/mach/irq.h
new file mode 100644
index 0000000..bb5ccce
--- /dev/null
+++ b/arch/mips/ath25/include/mach/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/irq.h>
diff --git a/arch/mips/ath25/include/mach/kernel-entry-init.h b/arch/mips/ath25/include/mach/kernel-entry-init.h
new file mode 100644
index 0000000..19b872be
--- /dev/null
+++ b/arch/mips/ath25/include/mach/kernel-entry-init.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kernel-entry-init.h>
diff --git a/arch/mips/ath25/include/mach/kmalloc.h b/arch/mips/ath25/include/mach/kmalloc.h
new file mode 100644
index 0000000..4f056db
--- /dev/null
+++ b/arch/mips/ath25/include/mach/kmalloc.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/kmalloc.h>
diff --git a/arch/mips/ath25/include/mach/mangle-port.h b/arch/mips/ath25/include/mach/mangle-port.h
new file mode 100644
index 0000000..b9736e3
--- /dev/null
+++ b/arch/mips/ath25/include/mach/mangle-port.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/mangle-port.h>
diff --git a/arch/mips/ath25/include/mach/spaces.h b/arch/mips/ath25/include/mach/spaces.h
new file mode 100644
index 0000000..39a4d72
--- /dev/null
+++ b/arch/mips/ath25/include/mach/spaces.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/spaces.h>
diff --git a/arch/mips/ath25/include/mach/topology.h b/arch/mips/ath25/include/mach/topology.h
new file mode 100644
index 0000000..86e585b
--- /dev/null
+++ b/arch/mips/ath25/include/mach/topology.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/topology.h>
diff --git a/arch/mips/ath25/include/mach/war.h b/arch/mips/ath25/include/mach/war.h
new file mode 100644
index 0000000..5b0422a
--- /dev/null
+++ b/arch/mips/ath25/include/mach/war.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/mach-generic/war.h>
diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wireless/ath/ath5k/ahb.c
index 2c9cec8..9281b36 100644
--- a/drivers/net/wireless/ath/ath5k/ahb.c
+++ b/drivers/net/wireless/ath/ath5k/ahb.c
@@ -20,7 +20,7 @@
 #include <linux/nl80211.h>
 #include <linux/platform_device.h>
 #include <linux/etherdevice.h>
-#include <ath25_platform.h>
+#include <mach/ath25_platform.h>
 #include "ath5k.h"
 #include "debug.h"
 #include "base.h"
-- 
1.8.3.1

