Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355283B9210
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jul 2021 15:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbhGANQm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 09:16:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40240 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236567AbhGANQl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Jul 2021 09:16:41 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0OZv91gKz8bAA--.11066S2;
        Thu, 01 Jul 2021 21:14:02 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/3] MIPS: Loongson64: Add Loongson-2K1000 reset platform driver
Date:   Thu,  1 Jul 2021 21:13:58 +0800
Message-Id: <20210701131400.4699-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0OZv91gKz8bAA--.11066S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFW3tw4fAw18Zr1DAw48Crg_yoW5Wry5pF
        Z8Cw43Ar4rWa12gw4fJFyUuFW5Zwn3tFWUuFy2v34UZas8WFZ5J3WUta4FvF9rWr17JFWa
        qrsYqFW5CF4F9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUAV
        WUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAK
        I48JMxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvE
        x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x07b2a0PUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add power management register operations to support reboot and poweroff.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v7-v8:
delete unnecessary pointer casts
---
 drivers/platform/mips/Kconfig      |  6 ++++
 drivers/platform/mips/Makefile     |  1 +
 drivers/platform/mips/ls2k-reset.c | 53 ++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 drivers/platform/mips/ls2k-reset.c

diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kconfig
index 8ac149173c64..d421e1482395 100644
--- a/drivers/platform/mips/Kconfig
+++ b/drivers/platform/mips/Kconfig
@@ -30,4 +30,10 @@ config RS780E_ACPI
 	help
 	  Loongson RS780E PCH ACPI Controller driver.
 
+config LS2K_RESET
+	bool "Loongson-2K1000 Reset Controller"
+	depends on MACH_LOONGSON64 || COMPILE_TEST
+	help
+	  Loongson-2K1000 Reset Controller driver.
+
 endif # MIPS_PLATFORM_DEVICES
diff --git a/drivers/platform/mips/Makefile b/drivers/platform/mips/Makefile
index 178149098777..4c71444e453a 100644
--- a/drivers/platform/mips/Makefile
+++ b/drivers/platform/mips/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CPU_HWMON) += cpu_hwmon.o
 obj-$(CONFIG_RS780E_ACPI) += rs780e-acpi.o
+obj-$(CONFIG_LS2K_RESET) += ls2k-reset.o
diff --git a/drivers/platform/mips/ls2k-reset.c b/drivers/platform/mips/ls2k-reset.c
new file mode 100644
index 000000000000..b70e7b8a092c
--- /dev/null
+++ b/drivers/platform/mips/ls2k-reset.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2021, Qing Zhang <zhangqing@loongson.cn>
+ *  Loongson-2K1000 reset support
+ */
+
+#include <linux/of_address.h>
+#include <linux/pm.h>
+#include <asm/reboot.h>
+
+#define	PM1_STS		0x0c /* Power Management 1 Status Register */
+#define	PM1_CNT		0x14 /* Power Management 1 Control Register */
+#define	RST_CNT		0x30 /* Reset Control Register */
+
+static void __iomem *base;
+
+static void ls2k_restart(char *command)
+{
+	writel(0x1, base + RST_CNT);
+}
+
+static void ls2k_poweroff(void)
+{
+	/* Clear */
+	writel((readl(base + PM1_STS) & 0xffffffff), base + PM1_STS);
+	/* Sleep Enable | Soft Off*/
+	writel(GENMASK(12, 10) | BIT(13), base + PM1_CNT);
+}
+
+static int ls2k_reset_init(void)
+{
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "loongson,ls2k-pm");
+	if (!np) {
+		pr_info("Failed to get PM node\n");
+		return -ENODEV;
+	}
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_info("Failed to map PM register base address\n");
+		return -ENOMEM;
+	}
+
+	_machine_restart = ls2k_restart;
+	pm_power_off = ls2k_poweroff;
+
+	of_node_put(np);
+	return 0;
+}
+
+arch_initcall(ls2k_reset_init);
-- 
2.31.0

