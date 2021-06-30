Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A56AA3B7DA3
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jun 2021 08:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhF3Gxk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Jun 2021 02:53:40 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50560 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232518AbhF3Gxj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Jun 2021 02:53:39 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn0BYFNxgj64aAA--.10153S2;
        Wed, 30 Jun 2021 14:51:04 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] MIPS: Loongson64: Add Loongson-2K1000 reset platform driver
Date:   Wed, 30 Jun 2021 14:51:02 +0800
Message-Id: <20210630065103.23665-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn0BYFNxgj64aAA--.10153S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFW3tw4fAw18Zr1DAw48Crg_yoW5WF15pF
        Z8Kw4fAr4rZa17Kw4fJa4UuFW5Z3Z3tFWUuF12v345Zas8WFWkJ3WDta4YyF9rGr1xJFya
        qrsYqFW5CF4ruw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GF1l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5_wIPUUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add power management register operations to support reboot and poweroff.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v5-v6:
Calculate others by base
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
index 000000000000..286d47bf6964
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
+#define	PM1_STS		0x0c /* Power Management1 Status Register */
+#define	PM1_CNT		0x14 /* Power Management 1 Control Register */
+#define	RST_CNT		0x30 /* Reset Control Register */
+
+static void __iomem *base;
+
+static void ls2k_restart(char *command)
+{
+	writel(0x1, (void *)base + RST_CNT);
+}
+
+static void ls2k_poweroff(void)
+{
+	/* Clear */
+	writel((readl((void *)base + PM1_STS) & 0xffffffff), (void *)base + PM1_STS);
+	/* Sleep Enable | Soft Off*/
+	writel(GENMASK(12, 10)|BIT(13), (void *)base + PM1_CNT);
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

