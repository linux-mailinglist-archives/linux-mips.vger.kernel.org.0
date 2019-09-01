Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D941CA4A4A
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfIAPzT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:55:19 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58118 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfIAPzT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:55:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7D7824036B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:55:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QPxdjR66tP6B for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:55:14 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 881F63FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:55:14 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:55:14 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 048/120] MIPS: Define and use cpu_relax_forever() for various
 halting loops
Message-ID: <bc2a33e1a99ff0b32f837c08d9bb43f1e3adacc3.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Using cpu_relax_forever() can lower processor energy consumption when
halting indefinitely.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/alchemy/board-gpr.c          |  7 +++----
 arch/mips/alchemy/board-mtx1.c         |  7 ++-----
 arch/mips/alchemy/board-xxs1500.c      |  7 ++-----
 arch/mips/alchemy/devboards/platform.c |  4 ++--
 arch/mips/ar7/setup.c                  |  4 ++--
 arch/mips/ath79/setup.c                |  8 +++-----
 arch/mips/bcm47xx/setup.c              |  9 +++++----
 arch/mips/bcm63xx/setup.c              | 12 ++++++------
 arch/mips/boot/compressed/decompress.c |  4 ++--
 arch/mips/cavium-octeon/smp.c          |  4 ++--
 arch/mips/cobalt/reset.c               |  5 +----
 arch/mips/emma/markeins/setup.c        |  5 +++--
 arch/mips/fw/arc/init.c                |  4 ++--
 arch/mips/include/asm/processor.h      |  6 ++++++
 arch/mips/jz4740/reset.c               |  9 ++-------
 arch/mips/loongson64/common/reset.c    | 16 ++++------------
 arch/mips/mm/cerr-sb1.c                |  4 ++--
 arch/mips/pic32/common/reset.c         |  9 ++-------
 arch/mips/pnx833x/common/reset.c       |  5 ++---
 arch/mips/sgi-ip22/ip22-reset.c        |  3 ++-
 arch/mips/sgi-ip27/ip27-berr.c         |  4 ++--
 arch/mips/sgi-ip27/ip27-reset.c        | 13 ++++---------
 arch/mips/sgi-ip32/ip32-berr.c         |  4 ++--
 arch/mips/sgi-ip32/ip32-irq.c          |  3 ++-
 arch/mips/sibyte/common/cfe.c          |  3 ++-
 arch/mips/txx9/rbtx4939/setup.c        |  4 ++--
 arch/mips/vr41xx/common/pmu.c          |  2 +-
 27 files changed, 70 insertions(+), 95 deletions(-)

diff --git a/arch/mips/alchemy/board-gpr.c b/arch/mips/alchemy/board-gpr.c
index 6c47318946e4..5247dfc1e0ed 100644
--- a/arch/mips/alchemy/board-gpr.c
+++ b/arch/mips/alchemy/board-gpr.c
@@ -20,6 +20,7 @@
 #include <linux/gpio/machine.h>
 #include <asm/bootinfo.h>
 #include <asm/idle.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
 #include <asm/mach-au1x00/au1000.h>
@@ -65,14 +66,12 @@ static void gpr_reset(char *c)
 	alchemy_gpio_direction_output(1, 0);
 	udelay(1);
 	alchemy_gpio_set_value(1, 1);
-	while (1)
-		cpu_wait();
+	cpu_relax_forever();
 }
 
 static void gpr_power_off(void)
 {
-	while (1)
-		cpu_wait();
+	cpu_relax_forever();
 }
 
 void __init board_setup(void)
diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index 23093535399f..2025ba4ebfdd 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -18,6 +18,7 @@
 #include <linux/mtd/physmap.h>
 #include <mtd/mtd-abi.h>
 #include <asm/bootinfo.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
 #include <asm/mach-au1x00/au1000.h>
@@ -60,11 +61,7 @@ static void mtx1_reset(char *c)
 
 static void mtx1_power_off(void)
 {
-	while (1)
-		asm volatile (
-		"	.set	mips32					\n"
-		"	wait						\n"
-		"	.set	mips0					\n");
+	cpu_relax_forever();
 }
 
 void __init board_setup(void)
diff --git a/arch/mips/alchemy/board-xxs1500.c b/arch/mips/alchemy/board-xxs1500.c
index c67dfe1f4997..6189efe70e65 100644
--- a/arch/mips/alchemy/board-xxs1500.c
+++ b/arch/mips/alchemy/board-xxs1500.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <asm/bootinfo.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
 #include <asm/mach-au1x00/au1000.h>
@@ -56,11 +57,7 @@ static void xxs1500_reset(char *c)
 
 static void xxs1500_power_off(void)
 {
-	while (1)
-		asm volatile (
-		"	.set	mips32					\n"
-		"	wait						\n"
-		"	.set	mips0					\n");
+	cpu_relax_forever();
 }
 
 void __init board_setup(void)
diff --git a/arch/mips/alchemy/devboards/platform.c b/arch/mips/alchemy/devboards/platform.c
index 8d4b65c3268a..2203fddc42d8 100644
--- a/arch/mips/alchemy/devboards/platform.c
+++ b/arch/mips/alchemy/devboards/platform.c
@@ -13,6 +13,7 @@
 
 #include <asm/bootinfo.h>
 #include <asm/idle.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
 #include <asm/mach-au1x00/au1000.h>
@@ -56,8 +57,7 @@ static void db1x_power_off(void)
 {
 	bcsr_write(BCSR_RESETS, 0);
 	bcsr_write(BCSR_SYSTEM, BCSR_SYSTEM_PWROFF | BCSR_SYSTEM_RESET);
-	while (1)		/* sit and spin */
-		cpu_wait();
+	cpu_relax_forever();	/* sit and spin */
 }
 
 static void db1x_reset(char *c)
diff --git a/arch/mips/ar7/setup.c b/arch/mips/ar7/setup.c
index b3ffe7c898eb..2649ee848921 100644
--- a/arch/mips/ar7/setup.c
+++ b/arch/mips/ar7/setup.c
@@ -8,6 +8,7 @@
 #include <linux/pm.h>
 #include <linux/time.h>
 
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/mach-ar7/ar7.h>
 #include <asm/mach-ar7/prom.h>
@@ -21,8 +22,7 @@ static void ar7_machine_restart(char *command)
 
 static void ar7_machine_halt(void)
 {
-	while (1)
-		;
+	cpu_relax_forever();
 }
 
 static void ar7_machine_power_off(void)
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index ea385a865781..ad1d0fab5dad 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -24,6 +24,7 @@
 #include <asm/time.h>		/* for mips_hpt_frequency */
 #include <asm/reboot.h>		/* for _machine_{restart,halt} */
 #include <asm/mips_machine.h>
+#include <asm/processor.h>
 #include <asm/prom.h>
 #include <asm/fw/fw.h>
 
@@ -39,15 +40,12 @@ static void ath79_restart(char *command)
 {
 	local_irq_disable();
 	ath79_device_reset_set(AR71XX_RESET_FULL_CHIP);
-	for (;;)
-		if (cpu_wait)
-			cpu_wait();
+	cpu_relax_forever();
 }
 
 static void ath79_halt(void)
 {
-	while (1)
-		cpu_wait();
+	cpu_relax_forever();
 }
 
 static void __init ath79_detect_sys_type(void)
diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index 82627c264964..7ae2462ff3ae 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -39,6 +39,7 @@
 #include <linux/bcma/bcma_soc.h>
 #include <asm/bootinfo.h>
 #include <asm/idle.h>
+#include <asm/processor.h>
 #include <asm/prom.h>
 #include <asm/reboot.h>
 #include <asm/time.h>
@@ -77,8 +78,8 @@ static void bcm47xx_machine_restart(char *command)
 		break;
 #endif
 	}
-	while (1)
-		cpu_relax();
+
+	cpu_relax_forever();
 }
 
 static void bcm47xx_machine_halt(void)
@@ -97,8 +98,8 @@ static void bcm47xx_machine_halt(void)
 		break;
 #endif
 	}
-	while (1)
-		cpu_relax();
+
+	cpu_relax_forever();
 }
 
 #ifdef CONFIG_BCM47XX_SSB
diff --git a/arch/mips/bcm63xx/setup.c b/arch/mips/bcm63xx/setup.c
index e28ee9a7cc7e..342ca32c0ae2 100644
--- a/arch/mips/bcm63xx/setup.c
+++ b/arch/mips/bcm63xx/setup.c
@@ -14,6 +14,7 @@
 #include <linux/pm.h>
 #include <asm/bootinfo.h>
 #include <asm/time.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/cacheflush.h>
 #include <bcm63xx_board.h>
@@ -25,8 +26,8 @@
 void bcm63xx_machine_halt(void)
 {
 	pr_info("System halted\n");
-	while (1)
-		;
+
+	cpu_relax_forever();
 }
 
 static void bcm6348_a1_reboot(void)
@@ -58,8 +59,8 @@ static void bcm6348_a1_reboot(void)
 		"jr\t%0"
 		:
 		: "r" (0xbfc00000));
-	while (1)
-		;
+
+	cpu_relax_forever();
 }
 
 void bcm63xx_machine_reboot(void)
@@ -118,8 +119,7 @@ void bcm63xx_machine_reboot(void)
 		reg |= SYS_PLL_SOFT_RESET;
 		bcm_perf_writel(reg, PERF_SYS_PLL_CTL_REG);
 	}
-	while (1)
-		;
+	cpu_relax_forever();
 }
 
 static void __bcm63xx_machine_reboot(char *p)
diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index 88f5d637b1c4..27e9c13614ee 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -13,6 +13,7 @@
 #include <linux/libfdt.h>
 
 #include <asm/addrspace.h>
+#include <asm/processor.h>
 
 /*
  * These two variables specify the free mem region
@@ -41,8 +42,7 @@ void error(char *x)
 	puts(x);
 	puts("\n\n -- System halted");
 
-	while (1)
-		;	/* Halt */
+	cpu_relax_forever();	/* Halt */
 }
 
 /* activate the code for pre-boot environment */
diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 076db9a06b5e..cb397b413967 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -18,6 +18,7 @@
 #include <linux/kexec.h>
 
 #include <asm/mmu_context.h>
+#include <asm/processor.h>
 #include <asm/time.h>
 #include <asm/setup.h>
 
@@ -354,8 +355,7 @@ void play_dead(void)
 
 	mb();
 
-	while (1)	/* core will be reset here */
-		;
+	cpu_relax_forever();	/* core will be reset here */
 }
 
 static void start_after_reset(void)
diff --git a/arch/mips/cobalt/reset.c b/arch/mips/cobalt/reset.c
index 4eedd481dd00..13f67197193a 100644
--- a/arch/mips/cobalt/reset.c
+++ b/arch/mips/cobalt/reset.c
@@ -37,10 +37,7 @@ void cobalt_machine_halt(void)
 	led_trigger_event(power_off_led_trigger, LED_FULL);
 
 	local_irq_disable();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
+	cpu_relax_forever();
 }
 
 void cobalt_machine_restart(char *command)
diff --git a/arch/mips/emma/markeins/setup.c b/arch/mips/emma/markeins/setup.c
index c8a91c2a63bc..c12e4e6ceb76 100644
--- a/arch/mips/emma/markeins/setup.c
+++ b/arch/mips/emma/markeins/setup.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 
+#include <asm/processor.h>
 #include <asm/time.h>
 #include <asm/reboot.h>
 
@@ -34,13 +35,13 @@ static void markeins_machine_halt(void)
 {
 	printk("EMMA2RH Mark-eins halted.\n");
 	markeins_led("halted.");
-	while (1) ;
+	cpu_relax_forever();
 }
 
 static void markeins_machine_power_off(void)
 {
 	markeins_led("poweroff.");
-	while (1) ;
+	cpu_relax_forever();
 }
 
 static unsigned long __initdata emma2rh_clock[4] = {
diff --git a/arch/mips/fw/arc/init.c b/arch/mips/fw/arc/init.c
index 008555969534..90fa8ed75a50 100644
--- a/arch/mips/fw/arc/init.c
+++ b/arch/mips/fw/arc/init.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 
 #include <asm/bootinfo.h>
+#include <asm/processor.h>
 #include <asm/sgialib.h>
 #include <asm/smp-ops.h>
 
@@ -34,8 +35,7 @@ void __init prom_init(void)
 	if (pb->magic != 0x53435241) {
 		printk(KERN_CRIT "Aieee, bad prom vector magic %08lx\n",
 		       (unsigned long) pb->magic);
-		while(1)
-			;
+		cpu_relax_forever();
 	}
 
 	prom_init_cmdline();
diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index aca909bd7841..e1e4cb7833a6 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -405,6 +405,12 @@ unsigned long get_wchan(struct task_struct *p);
 #define cpu_relax()	barrier()
 #endif
 
+static inline void __noreturn cpu_relax_forever(void)
+{
+	for (;;)
+		cpu_relax();
+}
+
 /*
  * Return_address is a replacement for __builtin_return_address(count)
  * which on certain architectures cannot reasonably be implemented in GCC
diff --git a/arch/mips/jz4740/reset.c b/arch/mips/jz4740/reset.c
index 1f9f02e54085..c6703d32edb9 100644
--- a/arch/mips/jz4740/reset.c
+++ b/arch/mips/jz4740/reset.c
@@ -3,19 +3,14 @@
  *  Copyright (C) 2010, Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <asm/processor.h>
 #include <asm/reboot.h>
 
 #include "reset.h"
 
 static void jz4740_halt(void)
 {
-	while (1) {
-		__asm__(".set push;\n"
-			".set mips3;\n"
-			"wait;\n"
-			".set pop;\n"
-		);
-	}
+	cpu_relax_forever();
 }
 
 void jz4740_reset_init(void)
diff --git a/arch/mips/loongson64/common/reset.c b/arch/mips/loongson64/common/reset.c
index ce39e918e4d5..e91137922373 100644
--- a/arch/mips/loongson64/common/reset.c
+++ b/arch/mips/loongson64/common/reset.c
@@ -10,6 +10,7 @@
 #include <linux/pm.h>
 
 #include <asm/idle.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 
 #include <loongson.h>
@@ -45,10 +46,7 @@ static void loongson_restart(char *command)
 	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
 
 	fw_restart();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
+	cpu_relax_forever();
 #endif
 }
 
@@ -66,20 +64,14 @@ static void loongson_poweroff(void)
 	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
 
 	fw_poweroff();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
+	cpu_relax_forever();
 #endif
 }
 
 static void loongson_halt(void)
 {
 	pr_notice("\n\n** You can safely turn off the power now **\n\n");
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
+	cpu_relax_forever();
 }
 
 static int __init mips_reboot_setup(void)
diff --git a/arch/mips/mm/cerr-sb1.c b/arch/mips/mm/cerr-sb1.c
index a3c02df19f6f..c0a6acea532c 100644
--- a/arch/mips/mm/cerr-sb1.c
+++ b/arch/mips/mm/cerr-sb1.c
@@ -4,6 +4,7 @@
  */
 #include <linux/sched.h>
 #include <asm/mipsregs.h>
+#include <asm/processor.h>
 #include <asm/sibyte/sb1250.h>
 #include <asm/sibyte/sb1250_regs.h>
 
@@ -244,8 +245,7 @@ asmlinkage void sb1_cache_error(void)
 	 * undesirable.
 	 */
 #ifdef CONFIG_SB1_CERR_STALL
-	while (1)
-		;
+	cpu_relax_forever();
 #else
 	panic("unhandled cache error");
 #endif
diff --git a/arch/mips/pic32/common/reset.c b/arch/mips/pic32/common/reset.c
index a5fd7a8e2800..32dcda98aa15 100644
--- a/arch/mips/pic32/common/reset.c
+++ b/arch/mips/pic32/common/reset.c
@@ -5,6 +5,7 @@
  */
 #include <linux/init.h>
 #include <linux/pm.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/mach-pic32/pic32.h>
 
@@ -12,13 +13,7 @@
 
 static void pic32_halt(void)
 {
-	while (1) {
-		__asm__(".set push;\n"
-			".set arch=r4000;\n"
-			"wait;\n"
-			".set pop;\n"
-		);
-	}
+	cpu_relax_forever();
 }
 
 static void pic32_machine_restart(char *command)
diff --git a/arch/mips/pnx833x/common/reset.c b/arch/mips/pnx833x/common/reset.c
index b48e83bf912b..8f8b79994dae 100644
--- a/arch/mips/pnx833x/common/reset.c
+++ b/arch/mips/pnx833x/common/reset.c
@@ -10,6 +10,7 @@
  *	Nikita Youshchenko <yoush@debian.org>, based on PNX8550 code.
  */
 #include <linux/reboot.h>
+#include <asm/processor.h>
 #include <pnx833x.h>
 
 void pnx833x_machine_restart(char *command)
@@ -20,9 +21,7 @@ void pnx833x_machine_restart(char *command)
 
 void pnx833x_machine_halt(void)
 {
-	while (1)
-		__asm__ __volatile__ ("wait");
-
+	cpu_relax_forever();
 }
 
 void pnx833x_machine_power_off(void)
diff --git a/arch/mips/sgi-ip22/ip22-reset.c b/arch/mips/sgi-ip22/ip22-reset.c
index c374f3ceec38..5355c96a2b89 100644
--- a/arch/mips/sgi-ip22/ip22-reset.c
+++ b/arch/mips/sgi-ip22/ip22-reset.c
@@ -17,6 +17,7 @@
 
 #include <asm/io.h>
 #include <asm/irq.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/sgialib.h>
 #include <asm/sgi/ioc.h>
@@ -72,7 +73,7 @@ static void __noreturn sgi_machine_restart(char *command)
 	if (machine_state & MACHINE_SHUTTING_DOWN)
 		sgi_machine_power_off();
 	sgimc->cpuctrl0 |= SGIMC_CCTRL0_SYSINIT;
-	while (1);
+	cpu_relax_forever();
 }
 
 static void __noreturn sgi_machine_halt(void)
diff --git a/arch/mips/sgi-ip27/ip27-berr.c b/arch/mips/sgi-ip27/ip27-berr.c
index 73ad29b180fb..81cd434cb9ae 100644
--- a/arch/mips/sgi-ip27/ip27-berr.c
+++ b/arch/mips/sgi-ip27/ip27-berr.c
@@ -14,6 +14,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/signal.h>
 
+#include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/sn/addrs.h>
 #include <asm/sn/arch.h>
@@ -73,8 +74,7 @@ int ip27_be_handler(struct pt_regs *regs, int is_fixup)
 	dump_hub_information(errst0, errst1);
 	show_regs(regs);
 	dump_tlb_all();
-	while(1);
-	force_sig(SIGBUS);
+	cpu_relax_forever();
 }
 
 void __init ip27_be_init(void)
diff --git a/arch/mips/sgi-ip27/ip27-reset.c b/arch/mips/sgi-ip27/ip27-reset.c
index e44a15d4f573..bc8c2507ba91 100644
--- a/arch/mips/sgi-ip27/ip27-reset.c
+++ b/arch/mips/sgi-ip27/ip27-reset.c
@@ -19,6 +19,7 @@
 
 #include <asm/io.h>
 #include <asm/irq.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/sgialib.h>
 #include <asm/sn/addrs.h>
@@ -26,12 +27,6 @@
 #include <asm/sn/gda.h>
 #include <asm/sn/sn0/hub.h>
 
-void machine_restart(char *command) __noreturn;
-void machine_halt(void) __noreturn;
-void machine_power_off(void) __noreturn;
-
-#define noreturn while(1);				/* Silence gcc.	 */
-
 /* XXX How to pass the reboot command to the firmware??? */
 static void ip27_machine_restart(char *command)
 {
@@ -50,7 +45,7 @@ static void ip27_machine_restart(char *command)
 #else
 	LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
 #endif
-	noreturn;
+	cpu_relax_forever();
 }
 
 static void ip27_machine_halt(void)
@@ -64,13 +59,13 @@ static void ip27_machine_halt(void)
 		REMOTE_HUB_S(COMPACT_TO_NASID_NODEID(i), PROMOP_REG,
 							PROMOP_RESTART);
 	LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
-	noreturn;
+	cpu_relax_forever();
 }
 
 static void ip27_machine_power_off(void)
 {
 	/* To do ...  */
-	noreturn;
+	cpu_relax_forever();
 }
 
 void ip27_reboot_setup(void)
diff --git a/arch/mips/sgi-ip32/ip32-berr.c b/arch/mips/sgi-ip32/ip32-berr.c
index c860f95ab7ed..daa2036aeecc 100644
--- a/arch/mips/sgi-ip32/ip32-berr.c
+++ b/arch/mips/sgi-ip32/ip32-berr.c
@@ -15,6 +15,7 @@
 #include <asm/traps.h>
 #include <linux/uaccess.h>
 #include <asm/addrspace.h>
+#include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/tlbdebug.h>
 
@@ -28,8 +29,7 @@ static int ip32_be_handler(struct pt_regs *regs, int is_fixup)
 	printk("Got %cbe at 0x%lx\n", data ? 'd' : 'i', regs->cp0_epc);
 	show_regs(regs);
 	dump_tlb_all();
-	while(1);
-	force_sig(SIGBUS);
+	cpu_relax_forever();
 }
 
 void __init ip32_be_init(void)
diff --git a/arch/mips/sgi-ip32/ip32-irq.c b/arch/mips/sgi-ip32/ip32-irq.c
index a6a0ff7f5aed..d34a6b4f2096 100644
--- a/arch/mips/sgi-ip32/ip32-irq.c
+++ b/arch/mips/sgi-ip32/ip32-irq.c
@@ -22,6 +22,7 @@
 
 #include <asm/irq_cpu.h>
 #include <asm/mipsregs.h>
+#include <asm/processor.h>
 #include <asm/signal.h>
 #include <asm/time.h>
 #include <asm/ip32/crime.h>
@@ -355,7 +356,7 @@ static void ip32_unknown_interrupt(void)
 
 	printk("Please mail this report to linux-mips@linux-mips.org\n");
 	printk("Spinning...");
-	while(1) ;
+	cpu_relax_forever();
 }
 
 /* CRIME 1.1 appears to deliver all interrupts to this one pin. */
diff --git a/arch/mips/sibyte/common/cfe.c b/arch/mips/sibyte/common/cfe.c
index cbf5939ed53a..33143172a644 100644
--- a/arch/mips/sibyte/common/cfe.c
+++ b/arch/mips/sibyte/common/cfe.c
@@ -13,6 +13,7 @@
 #include <linux/smp.h>
 
 #include <asm/bootinfo.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/setup.h>
 #include <asm/sibyte/board.h>
@@ -65,7 +66,7 @@ static void __noreturn cfe_linux_exit(void *arg)
 		cfe_exit(warm, 0);
 		printk("cfe_exit returned??\n");
 	}
-	while (1);
+	cpu_relax_forever();
 }
 
 static void __noreturn cfe_linux_restart(char *command)
diff --git a/arch/mips/txx9/rbtx4939/setup.c b/arch/mips/txx9/rbtx4939/setup.c
index ef29a9c2ffd6..ec32d8a63d2e 100644
--- a/arch/mips/txx9/rbtx4939/setup.c
+++ b/arch/mips/txx9/rbtx4939/setup.c
@@ -21,6 +21,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/map.h>
+#include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/pci.h>
@@ -31,8 +32,7 @@ static void rbtx4939_machine_restart(char *command)
 	local_irq_disable();
 	writeb(1, rbtx4939_reseten_addr);
 	writeb(1, rbtx4939_softreset_addr);
-	while (1)
-		;
+	cpu_relax_forever();
 }
 
 static void __init rbtx4939_time_init(void)
diff --git a/arch/mips/vr41xx/common/pmu.c b/arch/mips/vr41xx/common/pmu.c
index 93cc7e0b30b1..d73178e3d910 100644
--- a/arch/mips/vr41xx/common/pmu.c
+++ b/arch/mips/vr41xx/common/pmu.c
@@ -72,7 +72,7 @@ static void vr41xx_restart(char *command)
 {
 	local_irq_disable();
 	software_reset();
-	while (1) ;
+	cpu_relax_forever();
 }
 
 static void vr41xx_halt(void)
-- 
2.21.0

