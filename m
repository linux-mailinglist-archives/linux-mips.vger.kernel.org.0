Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456E43B526E
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 09:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhF0Hkk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 03:40:40 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60092 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229519AbhF0Hkj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 03:40:39 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb0DfKthgFewYAA--.29429S2;
        Sun, 27 Jun 2021 15:38:07 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: Loongson64: Add Loongson-2K1000 reset support
Date:   Sun, 27 Jun 2021 15:38:06 +0800
Message-Id: <20210627073806.32564-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb0DfKthgFewYAA--.29429S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw17Wr1UWrWrAF1UCFWDCFg_yoW5Cw4xpr
        9xC3WDKFWfuw18ZF1rtFyUtrWUuF9xArsrAFW2gF17G3sxW3s3tws5JFy8tF1kArW7ua4j
        9rWrGrW8CF4fu3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4xMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jewZ7UUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add power management register operations to support reboot and poweroff.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---

v1-v2:
- Add pm block node

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 569e814def83..929e8ddf86eb 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -101,6 +101,14 @@ uart0: serial@1fe00000 {
 			no-loopback-test;
 		};
 
+		pm: power-controller {
+			device_type = "power management";
+			reg = <0 0x1fe0700c 0 0x8>,
+				<0 0x1fe07014 0 0x8>,
+				<0 0x1fe07030 0 0x8>;
+			reg-names = "pm1_sts", "pm1_cnt", "rst_cnt";
+		};
+
 		pci@1a000000 {
 			compatible = "loongson,ls2k-pci";
 			device_type = "pci";
diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index c97bfdc8c922..ea125e925d44 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/kexec.h>
+#include <linux/of_address.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 
@@ -20,12 +21,50 @@
 #include <loongson.h>
 #include <boot_param.h>
 
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
+static int  __init loongson_fdt_reset_init(void)
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
+	of_node_put(np);
+	return 0;
+}
+arch_initcall(loongson_fdt_reset_init);
+
 static void loongson_restart(char *command)
 {
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
+		writel(0x1, (void *)pm_reg_name[2]);
+	} else {
+		void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
 
-	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
+		fw_restart();
+	}
 
-	fw_restart();
 	while (1) {
 		if (cpu_wait)
 			cpu_wait();
@@ -34,9 +73,18 @@ static void loongson_restart(char *command)
 
 static void loongson_poweroff(void)
 {
-	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
+		/* Clear */
+		writel((readl((void *)pm_reg_name[0]) & 0xffffffff), (void *)pm_reg_name[0]);
+		/* Sleep Enable | Soft Off*/
+		writel(GENMASK(12, 10)|BIT(13), (void *)pm_reg_name[1]);
+	} else {
+
+		void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
+
+		fw_poweroff();
+	}
 
-	fw_poweroff();
 	while (1) {
 		if (cpu_wait)
 			cpu_wait();
-- 
2.31.0

