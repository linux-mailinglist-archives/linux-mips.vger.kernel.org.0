Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB9E3B6BFC
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jun 2021 03:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhF2BVq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 21:21:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46398 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230287AbhF2BVq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 21:21:46 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0ERddpgWAYaAA--.9325S2;
        Tue, 29 Jun 2021 09:19:13 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] MIPS: Loongson64: Add Loongson-2K1000 reset platform driver
Date:   Tue, 29 Jun 2021 09:19:12 +0800
Message-Id: <20210629011913.18611-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0ERddpgWAYaAA--.9325S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1DAFyUWrWDur4UCF1Utrb_yoW5AF4rpF
        Z8Gw4fCrWrGF17Kw4fta4UuFW5Z3Z3tFWjkFW2v34UZasxWFZ8Jws8tFyrArnrGrW7AFW3
        ZFsYgFW8CF4rZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6w4l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqCPSUUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add power management register operations to support reboot and poweroff.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v5-v6:
No change

 drivers/platform/mips/Kconfig      |  6 +++
 drivers/platform/mips/Makefile     |  1 +
 drivers/platform/mips/ls2k-reset.c | 60 ++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
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
index 000000000000..c5f073c82c5e
--- /dev/null
+++ b/drivers/platform/mips/ls2k-reset.c
@@ -0,0 +1,60 @@
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
+static char *pm_reg_name[] = {"pm1_sts", "pm1_cnt", "rst_cnt"};
+
+static void __iomem *get_reg_byname(struct device_node *node, const char *name)
+{
+	int index = of_property_match_string(node, "reg-names", name);
+
+	if (index < 0)
+		return NULL;
+
+	return of_iomap(node, index);
+}
+
+static void ls2k_restart(char *command)
+{
+	writel(0x1, (void *)pm_reg_name[2]);
+}
+
+static void ls2k_poweroff(void)
+{
+	/* Clear */
+	writel((readl((void *)pm_reg_name[0]) & 0xffffffff), (void *)pm_reg_name[0]);
+	/* Sleep Enable | Soft Off*/
+	writel(GENMASK(12, 10)|BIT(13), (void *)pm_reg_name[1]);
+}
+
+static int ls2k_reset_init(void)
+{
+	struct device_node *np;
+	int i;
+
+	np = of_find_node_by_type(NULL, "power management");
+	if (!np) {
+		pr_info("Failed to get PM node\n");
+		return -ENODEV;
+	}
+
+	for (i = 0; i < sizeof(pm_reg_name)/sizeof(char *); i++) {
+		pm_reg_name[i] = get_reg_byname(np, pm_reg_name[i]);
+		if (!pm_reg_name[i])
+			iounmap(pm_reg_name[i]);
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

