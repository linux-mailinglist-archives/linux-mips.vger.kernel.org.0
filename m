Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9491E32D170
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 12:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239335AbhCDLCX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 06:02:23 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59820 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239166AbhCDLBv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 06:01:51 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn_DpvUBgUFAUAA--.3851S4;
        Thu, 04 Mar 2021 19:01:02 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration to loongson.h
Date:   Thu,  4 Mar 2021 19:00:57 +0800
Message-Id: <20210304110057.22144-3-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304110057.22144-1-zhangqing@loongson.cn>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn_DpvUBgUFAUAA--.3851S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1UAFy8Cw47XrW5Jr45trb_yoW5WF1fpa
        nxC3Wvgr45ur13ArnIyrW0kr1rAa98KFZrKFW2gF1Y9F9rX34UXFn8KF1kArs2yFs0gFyU
        uryfKF4fGF4DCr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
        c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0dcTPUUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The purpose of separating loongson_system_configuration from boot_param.h
is to keep the other structure consistent with the firmware.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
---
 .../include/asm/mach-loongson64/boot_param.h   | 18 ------------------
 .../include/asm/mach-loongson64/loongson.h     | 18 ++++++++++++++++++
 drivers/irqchip/irq-loongson-liointc.c         |  2 +-
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 1c1cdf57137e..035b1a69e2d0 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -198,24 +198,6 @@ enum loongson_bridge_type {
 	VIRTUAL = 3
 };
 
-struct loongson_system_configuration {
-	u32 nr_cpus;
-	u32 nr_nodes;
-	int cores_per_node;
-	int cores_per_package;
-	u16 boot_cpu_id;
-	u16 reserved_cpus_mask;
-	enum loongson_cpu_type cputype;
-	enum loongson_bridge_type bridgetype;
-	u64 restart_addr;
-	u64 poweroff_addr;
-	u64 suspend_addr;
-	u64 vgabios_addr;
-	u32 dma_mask_bits;
-	u64 workarounds;
-	void (*early_config)(void);
-};
-
 extern struct efi_memory_map_loongson *loongson_memmap;
 extern struct loongson_system_configuration loongson_sysconf;
 
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index ac1c20e172a2..6189deb188cf 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -12,6 +12,24 @@
 #include <linux/irq.h>
 #include <boot_param.h>
 
+/* machine-specific boot configuration */
+struct loongson_system_configuration {
+	u32 nr_cpus;
+	u32 nr_nodes;
+	int cores_per_node;
+	int cores_per_package;
+	u16 boot_cpu_id;
+	u16 reserved_cpus_mask;
+	enum loongson_cpu_type cputype;
+	enum loongson_bridge_type bridgetype;
+	u64 restart_addr;
+	u64 poweroff_addr;
+	u64 suspend_addr;
+	u64 vgabios_addr;
+	u32 dma_mask_bits;
+	u64 workarounds;
+	void (*early_config)(void);
+};
 
 /* machine-specific reboot/halt operation */
 extern void mach_prepare_reboot(void);
diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 09b91b81851c..249566a23cc4 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -16,7 +16,7 @@
 #include <linux/smp.h>
 #include <linux/irqchip/chained_irq.h>
 
-#include <boot_param.h>
+#include <loongson.h>
 
 #define LIOINTC_CHIP_IRQ	32
 #define LIOINTC_NUM_PARENT 4
-- 
2.20.1

