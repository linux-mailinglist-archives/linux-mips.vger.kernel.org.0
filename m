Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF4A35EA5B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 03:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhDNB04 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 21:26:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59296 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233140AbhDNB04 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 21:26:56 -0400
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxU+C+RHZgq8AHAA--.13946S2;
        Wed, 14 Apr 2021 09:26:23 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Add Loongson-2K1000 reset support
Date:   Wed, 14 Apr 2021 09:26:22 +0800
Message-Id: <20210414012622.23610-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxU+C+RHZgq8AHAA--.13946S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr1kXw4UXFyftFy3Xw1DZFb_yoW5Gw1Dp3
        Z3A3ZxKF43tw48AF1fJFyUur1rG393ArsrXF4aqr1UGasxJa4Fqwn3GF18Jr4jvFn5XFy2
        vrWfurW5KFsakw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVWkMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j00PfUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add power management register operations to support reboot and poweroff.

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 .../include/asm/mach-loongson64/loongson.h    |  8 ++++++
 arch/mips/loongson64/reset.c                  | 28 ++++++++++++++++---
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index f7c3ab6d724e..9d254a7b438a 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -263,4 +263,12 @@ extern u64 loongson_freqctrl[MAX_PACKAGES];
 #define LOONGSON_PCIMAP_WIN(WIN, ADDR)	\
 	((((ADDR)>>26) & LOONGSON_PCIMAP_PCIMAP_LO0) << ((WIN)*6))
 
+/* Loongson-2K1000 Power management related registers */
+#define	PM1_STS         0x0C /* Power Management1 Status Register */
+#define	PM1_CNT         0x14 /* Power Management 1 Control Register */
+#define	RST_CNT         0x30 /* Reset Control Register */
+#define	SLP_TYP		GENMASK(12, 10) /* Sleep Enable */
+#define	SLP_EN          BIT(13) /* Soft Off */
+#define	ACPI_OFF        0x7000
+
 #endif /* __ASM_MACH_LOONGSON64_LOONGSON_H */
diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index 3bb8a1ed9348..b4348bf50538 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -18,9 +18,16 @@
 static void loongson_restart(char *command)
 {
 
-	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
+		unsigned long base;
 
-	fw_restart();
+		base = CKSEG1ADDR(LOONGSON_REG_BASE) + ACPI_OFF;
+		writel(1, (void *)(base + RST_CNT));
+	} else {
+		void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
+
+		fw_restart();
+	}
 	while (1) {
 		if (cpu_wait)
 			cpu_wait();
@@ -29,9 +36,22 @@ static void loongson_restart(char *command)
 
 static void loongson_poweroff(void)
 {
-	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
 
-	fw_poweroff();
+	if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
+		unsigned long base;
+		unsigned int acpi_ctrl;
+
+		base = CKSEG1ADDR(LOONGSON_REG_BASE) + ACPI_OFF;
+		acpi_ctrl = readl((void *)(base + PM1_STS));
+		acpi_ctrl &= 0xffffffff;
+		writel(acpi_ctrl, (void *)(base + PM1_STS));
+		acpi_ctrl = SLP_EN | SLP_TYP;
+		writel(acpi_ctrl, (void *)(base + PM1_CNT));
+	} else {
+		void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
+
+		fw_poweroff();
+	}
 	while (1) {
 		if (cpu_wait)
 			cpu_wait();
-- 
2.31.0

