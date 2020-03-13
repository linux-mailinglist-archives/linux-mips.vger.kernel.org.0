Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A68C1840CC
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2020 07:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgCMGQo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Mar 2020 02:16:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54086 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725809AbgCMGQo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Mar 2020 02:16:44 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL94uJWteyRIaAA--.11S2;
        Fri, 13 Mar 2020 14:16:14 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Armijn Hemel <armijn@tjaldur.nl>,
        Allison Randal <allison@lohutok.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Add header files reference with path prefix
Date:   Fri, 13 Mar 2020 02:16:14 -0400
Message-Id: <1584080174-11257-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxL94uJWteyRIaAA--.11S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AF17JF1fJFW8CF4rtw48tFb_yoW3CFyxpa
        nrAa4kXFZ8urW7CFyFyrn29r43tws8Kr4YkayYg3W2y3Z7X3WUXan3Krn8Jr18XF4DKa48
        WryfW3W5Xan2vw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7CJmUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are some common header files which are referenced locally
with #includenext method, includenext is tricky method and only
used on mips platform.

This patech removes includenext method, replace it with defailed
pathname prefix for header files.

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/include/asm/mach-ar7/irq.h           | 2 +-
 arch/mips/include/asm/mach-ath79/irq.h         | 2 +-
 arch/mips/include/asm/mach-emma2rh/irq.h       | 2 +-
 arch/mips/include/asm/mach-ip27/irq.h          | 2 +-
 arch/mips/include/asm/mach-ip30/irq.h          | 2 +-
 arch/mips/include/asm/mach-lantiq/falcon/irq.h | 2 +-
 arch/mips/include/asm/mach-lantiq/xway/irq.h   | 2 +-
 arch/mips/include/asm/mach-lasat/irq.h         | 2 +-
 arch/mips/include/asm/mach-loongson64/irq.h    | 2 +-
 arch/mips/include/asm/mach-malta/irq.h         | 2 +-
 arch/mips/include/asm/mach-pic32/irq.h         | 2 +-
 arch/mips/include/asm/mach-pistachio/irq.h     | 2 +-
 arch/mips/include/asm/mach-ralink/irq.h        | 2 +-
 arch/mips/include/asm/mach-rm/mc146818rtc.h    | 2 +-
 arch/mips/include/asm/mach-vr41xx/irq.h        | 2 +-
 arch/mips/include/asm/mach-xilfpga/irq.h       | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/mach-ar7/irq.h b/arch/mips/include/asm/mach-ar7/irq.h
index 7ad10e3..46bb730 100644
--- a/arch/mips/include/asm/mach-ar7/irq.h
+++ b/arch/mips/include/asm/mach-ar7/irq.h
@@ -11,6 +11,6 @@
 
 #define NR_IRQS 256
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif /* __ASM_AR7_IRQ_H */
diff --git a/arch/mips/include/asm/mach-ath79/irq.h b/arch/mips/include/asm/mach-ath79/irq.h
index 2df1abf..882534b 100644
--- a/arch/mips/include/asm/mach-ath79/irq.h
+++ b/arch/mips/include/asm/mach-ath79/irq.h
@@ -27,6 +27,6 @@
 #define ATH79_IP3_IRQ_COUNT     3
 #define ATH79_IP3_IRQ(_x)       (ATH79_IP3_IRQ_BASE + (_x))
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif /* __ASM_MACH_ATH79_IRQ_H */
diff --git a/arch/mips/include/asm/mach-emma2rh/irq.h b/arch/mips/include/asm/mach-emma2rh/irq.h
index 2f7155d..d327367 100644
--- a/arch/mips/include/asm/mach-emma2rh/irq.h
+++ b/arch/mips/include/asm/mach-emma2rh/irq.h
@@ -10,6 +10,6 @@
 
 #define NR_IRQS 256
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif /* __ASM_MACH_EMMA2RH_IRQ_H */
diff --git a/arch/mips/include/asm/mach-ip27/irq.h b/arch/mips/include/asm/mach-ip27/irq.h
index fd91c58..f45d799 100644
--- a/arch/mips/include/asm/mach-ip27/irq.h
+++ b/arch/mips/include/asm/mach-ip27/irq.h
@@ -12,7 +12,7 @@
 
 #define NR_IRQS 256
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #define IP27_HUB_PEND0_IRQ	(MIPS_CPU_IRQ_BASE + 2)
 #define IP27_HUB_PEND1_IRQ	(MIPS_CPU_IRQ_BASE + 3)
diff --git a/arch/mips/include/asm/mach-ip30/irq.h b/arch/mips/include/asm/mach-ip30/irq.h
index e5c3dd9..27ba899 100644
--- a/arch/mips/include/asm/mach-ip30/irq.h
+++ b/arch/mips/include/asm/mach-ip30/irq.h
@@ -76,7 +76,7 @@
  */
 #define IP30_POWER_IRQ		HEART_L2_INT_POWER_BTN
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #define IP30_HEART_L0_IRQ	(MIPS_CPU_IRQ_BASE + 2)
 #define IP30_HEART_L1_IRQ	(MIPS_CPU_IRQ_BASE + 3)
diff --git a/arch/mips/include/asm/mach-lantiq/falcon/irq.h b/arch/mips/include/asm/mach-lantiq/falcon/irq.h
index 91d2bc0..c14312f 100644
--- a/arch/mips/include/asm/mach-lantiq/falcon/irq.h
+++ b/arch/mips/include/asm/mach-lantiq/falcon/irq.h
@@ -11,6 +11,6 @@
 
 #define NR_IRQS 328
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif
diff --git a/arch/mips/include/asm/mach-lantiq/xway/irq.h b/arch/mips/include/asm/mach-lantiq/xway/irq.h
index 76ebbf6..2980e77 100644
--- a/arch/mips/include/asm/mach-lantiq/xway/irq.h
+++ b/arch/mips/include/asm/mach-lantiq/xway/irq.h
@@ -11,6 +11,6 @@
 
 #define NR_IRQS 256
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif
diff --git a/arch/mips/include/asm/mach-lasat/irq.h b/arch/mips/include/asm/mach-lasat/irq.h
index d79cbe0..e899492 100644
--- a/arch/mips/include/asm/mach-lasat/irq.h
+++ b/arch/mips/include/asm/mach-lasat/irq.h
@@ -9,6 +9,6 @@
 
 #define NR_IRQS			24
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif /* _ASM_MACH_LASAT_IRQ_H */
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index 73a8991..0d39556 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -36,5 +36,5 @@
 extern void fixup_irqs(void);
 extern void loongson3_ipi_interrupt(struct pt_regs *regs);
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 #endif /* __ASM_MACH_LOONGSON64_IRQ_H_ */
diff --git a/arch/mips/include/asm/mach-malta/irq.h b/arch/mips/include/asm/mach-malta/irq.h
index af9eeea..344e61a 100644
--- a/arch/mips/include/asm/mach-malta/irq.h
+++ b/arch/mips/include/asm/mach-malta/irq.h
@@ -5,6 +5,6 @@
 
 #define NR_IRQS 256
 
-#include_next <irq.h>
+#include <mach/mach-generic/irq.h>
 
 #endif /* __ASM_MACH_MIPS_IRQ_H */
diff --git a/arch/mips/include/asm/mach-pic32/irq.h b/arch/mips/include/asm/mach-pic32/irq.h
index d239694..ddaf999 100644
--- a/arch/mips/include/asm/mach-pic32/irq.h
+++ b/arch/mips/include/asm/mach-pic32/irq.h
@@ -9,6 +9,6 @@
 #define NR_IRQS	256
 #define MIPS_CPU_IRQ_BASE 0
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif /* __ASM_MACH_PIC32_IRQ_H */
diff --git a/arch/mips/include/asm/mach-pistachio/irq.h b/arch/mips/include/asm/mach-pistachio/irq.h
index 93bc380..74ac016 100644
--- a/arch/mips/include/asm/mach-pistachio/irq.h
+++ b/arch/mips/include/asm/mach-pistachio/irq.h
@@ -10,6 +10,6 @@
 
 #define NR_IRQS 256
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif /* __ASM_MACH_PISTACHIO_IRQ_H */
diff --git a/arch/mips/include/asm/mach-ralink/irq.h b/arch/mips/include/asm/mach-ralink/irq.h
index 86473e3..2262243 100644
--- a/arch/mips/include/asm/mach-ralink/irq.h
+++ b/arch/mips/include/asm/mach-ralink/irq.h
@@ -5,6 +5,6 @@
 #define GIC_NUM_INTRS	64
 #define NR_IRQS 256
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif
diff --git a/arch/mips/include/asm/mach-rm/mc146818rtc.h b/arch/mips/include/asm/mach-rm/mc146818rtc.h
index 145bce0..a074f4f 100644
--- a/arch/mips/include/asm/mach-rm/mc146818rtc.h
+++ b/arch/mips/include/asm/mach-rm/mc146818rtc.h
@@ -16,6 +16,6 @@
 #define mc146818_decode_year(year) ((year) + 1980)
 #endif
 
-#include_next <mc146818rtc.h>
+#include <asm/mach-generic/mc146818rtc.h>
 
 #endif /* __ASM_MACH_RM_MC146818RTC_H */
diff --git a/arch/mips/include/asm/mach-vr41xx/irq.h b/arch/mips/include/asm/mach-vr41xx/irq.h
index 3d63afa..4281b2b 100644
--- a/arch/mips/include/asm/mach-vr41xx/irq.h
+++ b/arch/mips/include/asm/mach-vr41xx/irq.h
@@ -4,6 +4,6 @@
 
 #include <asm/vr41xx/irq.h> /* for MIPS_CPU_IRQ_BASE */
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif /* __ASM_MACH_VR41XX_IRQ_H */
diff --git a/arch/mips/include/asm/mach-xilfpga/irq.h b/arch/mips/include/asm/mach-xilfpga/irq.h
index b8e93fa..15ad29e 100644
--- a/arch/mips/include/asm/mach-xilfpga/irq.h
+++ b/arch/mips/include/asm/mach-xilfpga/irq.h
@@ -9,6 +9,6 @@
 
 #define NR_IRQS 32
 
-#include_next <irq.h>
+#include <asm/mach-generic/irq.h>
 
 #endif /* __MIPS_ASM_MACH_XILFPGA_IRQ_H__ */
-- 
1.8.3.1

