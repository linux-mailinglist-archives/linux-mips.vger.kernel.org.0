Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548154104F0
	for <lists+linux-mips@lfdr.de>; Sat, 18 Sep 2021 09:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235951AbhIRH7g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Sep 2021 03:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233741AbhIRH7g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 18 Sep 2021 03:59:36 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02263C061574;
        Sat, 18 Sep 2021 00:58:13 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso11633016pjh.5;
        Sat, 18 Sep 2021 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wOkJTKbuiVWEXXvXQeSXhHLjBO4ao3uuYbx6/RJ9/gc=;
        b=LvFt08Jx1KylQ2pp8L5oPxU1yOWiJS4r+tRYmsG1yz57/sie6RDohM1/xixhEz0kre
         9Yu1NnUDZ216HdJFfe0bOOPt+bq7I+ptRjPW6aPOVmnngfUFqYh9w9S1GxFe1UbZgapo
         aocD6zh9z2JeKA4C6JS0bz7mPGZsYNy8beR6yhi48X2gNbsQRAbrIHNapVHEak0LTCFx
         b6fh/srbWS3cBqmasXJcrfhbVVerq8y97ha5H4o7FNq8dG3ND38zTc95b8xi4g1u2xgx
         lE3jRIKUnaU2RrEO+mlC7S86j4T/uoym0EOiOa0RT6bhHbdnbvf2aYiblfQJm0Vt0aiM
         zvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wOkJTKbuiVWEXXvXQeSXhHLjBO4ao3uuYbx6/RJ9/gc=;
        b=U/WraHtA4u5kfhua+Y1T4SPjujdz3aavK3jxhNkqZ9z3615ngQMjeHkM21hEbESsT4
         cjJt9uc7CMLpyqjiqDb/WgizMfQ+HecIWb+Qs0ZoX0I5YxG3hBDwpnLwF8jmdkzhB7Mh
         RpepjKCL6GMlKtRUT7/EZz6MnAIrhh9PIPft/phQFkV82A02+keBpkTbWp7FtdRi4i1t
         d4ifOvg9dtdmEC+w02TKIR0yo4TmD7FViJEPZOqpTffSdz38KKccSinXiAgWBL5fLK9Q
         3RqPgyQ5va3MDhihWj+c0nuzU1PvVP81V62qrJz+MTTc6Wttvz2RIWFltoeeulfTWpy6
         zOzA==
X-Gm-Message-State: AOAM532ngzujDxSMIr/8nrGT7J85SOrVldoxy5nyUFAZKT8sldxDpep2
        Js6cYiQ47TD3cjgzZvvomaA=
X-Google-Smtp-Source: ABdhPJwpppRDqAVKrIqJIt6E9fEutPhUSCEj7GivkOL/YWxa/OC9GDA3z6ouq3xff62ndo0UMx4yTA==
X-Received: by 2002:a17:902:b789:b0:13b:90bc:f184 with SMTP id e9-20020a170902b78900b0013b90bcf184mr13367625pls.31.1631951892533;
        Sat, 18 Sep 2021 00:58:12 -0700 (PDT)
Received: from localhost.localdomain (mail.lemote.com. [222.92.8.138])
        by smtp.gmail.com with ESMTPSA id x19sm8434982pfa.104.2021.09.18.00.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 00:58:12 -0700 (PDT)
From:   Dian zheng <paniaguaholt597336@gmail.com>
X-Google-Original-From: Dian zheng <zhengd@lemote.com>
To:     jiaxun.yang@flygoat.com
Cc:     cand@gmx.com, chenhuacai@kernel.org, daniel.lezcano@linaro.org,
        drjones@redhat.com, fancer.lancer@gmail.com, huangll@lemote.com,
        john.garry@huawei.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, marcan@marcan.st,
        mgorman@techsingularity.net, ndesaulniers@google.com,
        paul@crapouillou.net, romain.naour@gmail.com,
        sudipm.mukherjee@gmail.com, sumanthk@linux.ibm.com,
        tanj@lemote.com, tglx@linutronix.de, tmricht@linux.ibm.com,
        tom.zanussi@linux.intel.com, tsbogend@alpha.franken.de,
        will@kernel.org, yangtiezhu@loongson.cn,
        zhangshaokun@hisilicon.com, zhengd@lemote.com,
        zhouyanjie@wanyeetech.com
Subject: [PATCH v1 3/3] clocksource: Loongson constant timer support Loongson constant timer is found in Loongson-3A4000 processor. It has a counter which is globally accessiable via rdhwr instruction, also each core has a clock event generator connected to this clock source sharing interrupt with MIPS cont & comapre cevt.
Date:   Sat, 18 Sep 2021 15:57:00 +0800
Message-Id: <20210918075700.96041-1-zhengd@lemote.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cf32762f-888a-b50b-9685-89b830049f6d@flygoat.com>
References: <cf32762f-888a-b50b-9685-89b830049f6d@flygoat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Dian Zheng <zhengd@lemote.com>

We add cevt, csrc, vdso, sched_clock support for this timer.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Dian Zheng <zhengd@lemote.com>
---
 .../include/asm/mach-loongson64/loongson.h    |   9 +
 .../asm/mach-loongson64/loongson_regs.h       |   7 +
 arch/mips/include/asm/mipsregs.h              |   2 +
 arch/mips/include/asm/vdso/clocksource.h      |   3 +-
 arch/mips/include/asm/vdso/gettimeofday.h     |  25 +-
 drivers/clocksource/Kconfig                   |  10 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/loongson_const_timer.c    | 249 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 9 files changed, 305 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clocksource/loongson_const_timer.c

diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index f7c3ab6d724e..8c7a85bce539 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -56,6 +56,15 @@ extern void *loongson_fdt_blob;
 extern void mach_irq_dispatch(unsigned int pending);
 extern int mach_i8259_irq(void);
 
+#ifdef CONFIG_LOONGSON_CONST_TIMER
+extern int __init constant_timer_init(void);
+#else
+static inline int constant_timer_init(void)
+{
+	return -ENODEV;
+}
+#endif
+
 /* We need this in some places... */
 #define delay() ({		\
 	int x;				\
diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
index 165993514762..229465060be2 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
@@ -88,6 +88,7 @@ static inline u32 read_cpucfg(u32 reg)
 #define LOONGSON_CFG2_LGFTP	BIT(19)
 #define LOONGSON_CFG2_LGFTPREV	GENMASK(22, 20)
 #define LOONGSON_CFG2_LLFTP	BIT(23)
+#define LOONGSON_CFG2_LLFTPREVB	24
 #define LOONGSON_CFG2_LLFTPREV	GENMASK(26, 24)
 #define LOONGSON_CFG2_LCSRP	BIT(27)
 #define LOONGSON_CFG2_LDISBLIKELY	BIT(28)
@@ -237,6 +238,12 @@ static inline void csr_writeq(u64 val, u32 reg)
 #define CSR_MAIL_SEND_BUF_SHIFT		32
 #define CSR_MAIL_SEND_H32_MASK		0xFFFFFFFF00000000ULL
 
+#define LOONGSON_CSR_TIMER_CFG		0x1060
+#define LOONGSON_CSR_TIMER_TICK		0x1070
+#define CONSTANT_TIMER_CFG_PERIODIC	(_ULCAST_(1) << 62)
+#define CONSTANT_TIMER_CFG_EN		(_ULCAST_(1) << 61)
+#define CONSTANT_TIMER_INITVAL_RESET	(_ULCAST_(0xffff) << 48)
+
 static inline u64 drdtime(void)
 {
 	int rID = 0;
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index acdf8c69220b..c16580a15336 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -699,6 +699,8 @@
 
 /* Config6 feature bits for proAptiv/P5600 */
 
+#define LOONGSON_CONF6_INTIMER	(_ULCAST_(1) << 6)
+#define LOONGSON_CONF6_EXTIMER	(_ULCAST_(1) << 7)
 /* Jump register cache prediction disable */
 #define MTI_CONF6_JRCD		(_ULCAST_(1) << 0)
 /* MIPSr6 extensions enable */
diff --git a/arch/mips/include/asm/vdso/clocksource.h b/arch/mips/include/asm/vdso/clocksource.h
index 510e1671d898..7fd43ca06eb1 100644
--- a/arch/mips/include/asm/vdso/clocksource.h
+++ b/arch/mips/include/asm/vdso/clocksource.h
@@ -4,6 +4,7 @@
 
 #define VDSO_ARCH_CLOCKMODES	\
 	VDSO_CLOCKMODE_R4K,	\
-	VDSO_CLOCKMODE_GIC
+	VDSO_CLOCKMODE_GIC,	\
+	VDSO_CLOCKMODE_CONST
 
 #endif /* __ASM_VDSOCLOCKSOURCE_H */
diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index 44a45f3fa4b0..2f860c1e3aa5 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -183,6 +183,24 @@ static __always_inline u64 read_gic_count(const struct vdso_data *data)
 
 #endif
 
+#ifdef CONFIG_LOONGSON_CONST_TIMER
+
+static __always_inline u64 read_const_timer(void)
+{
+	u64 count;
+
+	__asm__ __volatile__(
+	"	.set push\n"
+	"	.set mips32r2\n"
+	"	rdhwr %0, $30\n"
+	"	.set pop\n"
+	: "=r" (count));
+
+	return count;
+}
+
+#endif
+
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 						 const struct vdso_data *vd)
 {
@@ -193,6 +211,10 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 #ifdef CONFIG_CLKSRC_MIPS_GIC
 	if (clock_mode == VDSO_CLOCKMODE_GIC)
 		return read_gic_count(vd);
+#endif
+#ifdef CONFIG_LOONGSON_CONST_TIMER
+	if (clock_mode == VDSO_CLOCKMODE_CONST)
+		return read_const_timer();
 #endif
 	/*
 	 * Core checks mode already. So this raced against a concurrent
@@ -205,7 +227,8 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 static inline bool mips_vdso_hres_capable(void)
 {
 	return IS_ENABLED(CONFIG_CSRC_R4K) ||
-	       IS_ENABLED(CONFIG_CLKSRC_MIPS_GIC);
+	       IS_ENABLED(CONFIG_CLKSRC_MIPS_GIC) ||
+	       IS_ENABLED(CONFIG_LOONGSON_CONST_TIMER);
 }
 #define __arch_vdso_hres_capable mips_vdso_hres_capable
 
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 0f5e3983951a..d12e3e4bedd1 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -708,4 +708,14 @@ config MICROCHIP_PIT64B
 	  modes and high resolution. It is used as a clocksource
 	  and a clockevent.
 
+config LOONGSON_CONST_TIMER
+	bool "Loongson Constant Timer"
+	depends on MACH_LOONGSON64
+	default MACH_LOONGSON64
+	help
+	  This option enables Loongson constant timer for Loongson64
+	  systems. It supports the oneshot, the periodic modes and high
+	  resolution. It is used as a clocksource and a clockevent, it is
+	  also accessible in VDSO.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index c17ee32a7151..f717a1e06900 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -88,3 +88,4 @@ obj-$(CONFIG_CSKY_MP_TIMER)		+= timer-mp-csky.o
 obj-$(CONFIG_GX6605S_TIMER)		+= timer-gx6605s.o
 obj-$(CONFIG_HYPERV_TIMER)		+= hyperv_timer.o
 obj-$(CONFIG_MICROCHIP_PIT64B)		+= timer-microchip-pit64b.o
+obj-$(CONFIG_LOONGSON_CONST_TIMER)	+= loongson_const_timer.o
diff --git a/drivers/clocksource/loongson_const_timer.c b/drivers/clocksource/loongson_const_timer.c
new file mode 100644
index 000000000000..3921b8c37092
--- /dev/null
+++ b/drivers/clocksource/loongson_const_timer.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Loongson64 constant timer driver
+ *
+ * Copyright (C) 2020 Huacai Chen <chenhuacai@loongson.com>
+ * Copyright (C) 2020 Jiaxun Yang <jiaxun.yang@fluygoat.com>
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/clockchips.h>
+#include <linux/cpuhotplug.h>
+#include <linux/sched_clock.h>
+#include <asm/time.h>
+#include <asm/mipsregs.h>
+#include <asm/cevt-r4k.h>
+#include <loongson.h>
+#include <loongson_regs.h>
+
+static unsigned int constant_timer_irq = -1;
+
+static DEFINE_PER_CPU(struct clock_event_device, constant_clockevent_device);
+
+static inline unsigned int calc_const_freq(void)
+{
+	unsigned int res;
+	unsigned int base_freq;
+	unsigned int cfm, cfd;
+
+	res = read_cpucfg(LOONGSON_CFG2);
+	if (!(res & LOONGSON_CFG2_LLFTP))
+		return 0;
+
+	res = read_cpucfg(LOONGSON_CFG5);
+	cfm = res & 0xffff;
+	cfd = (res >> 16) & 0xffff;
+	base_freq = read_cpucfg(LOONGSON_CFG4);
+
+	if (!base_freq || !cfm || !cfd)
+		return 0;
+	else
+		return (base_freq * cfm / cfd);
+}
+
+static irqreturn_t handle_constant_timer(int irq, void *data)
+{
+	int cpu = smp_processor_id();
+	struct clock_event_device *cd;
+
+	if ((cp0_perfcount_irq < 0) && perf_irq() == IRQ_HANDLED)
+		return IRQ_HANDLED;
+
+	cd = &per_cpu(mips_clockevent_device, cpu);
+
+
+	if (clockevent_state_detached(cd) || clockevent_state_shutdown(cd))
+		return IRQ_NONE;
+
+	if (read_c0_cause() & CAUSEF_TI) {
+		/* Clear Count/Compare Interrupt */
+		write_c0_compare(read_c0_compare());
+		cd = &per_cpu(constant_clockevent_device, cpu);
+		cd->event_handler(cd);
+
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int constant_set_state_oneshot(struct clock_event_device *evt)
+{
+	u64 cfg;
+
+	cfg = csr_readq(LOONGSON_CSR_TIMER_CFG);
+
+	cfg |= CONSTANT_TIMER_CFG_EN;
+	cfg &= ~CONSTANT_TIMER_CFG_PERIODIC;
+
+	csr_writeq(cfg, LOONGSON_CSR_TIMER_CFG);
+
+	set_c0_config6(LOONGSON_CONF6_EXTIMER);
+
+	return 0;
+}
+
+static int constant_set_state_periodic(struct clock_event_device *evt)
+{
+	unsigned int period;
+	u64 cfg;
+
+	cfg = csr_readq(LOONGSON_CSR_TIMER_CFG);
+
+	cfg &= CONSTANT_TIMER_INITVAL_RESET;
+	cfg |= (CONSTANT_TIMER_CFG_PERIODIC | CONSTANT_TIMER_CFG_EN);
+
+	period = calc_const_freq() / HZ;
+
+	csr_writeq(cfg | period, LOONGSON_CSR_TIMER_CFG);
+
+	set_c0_config6(LOONGSON_CONF6_EXTIMER);
+
+	return 0;
+}
+
+static int constant_set_state_shutdown(struct clock_event_device *evt)
+{
+	u64 cfg;
+
+	clear_c0_config6(LOONGSON_CONF6_EXTIMER);
+	cfg = csr_readq(LOONGSON_CSR_TIMER_CFG);
+	cfg &= ~CONSTANT_TIMER_CFG_EN;
+	csr_writeq(cfg, LOONGSON_CSR_TIMER_CFG);
+
+	return 0;
+}
+
+static int constant_next_event(unsigned long delta,
+				struct clock_event_device *evt)
+{
+	csr_writeq(delta | CONSTANT_TIMER_CFG_EN, LOONGSON_CSR_TIMER_CFG);
+	return 0;
+}
+
+static int constant_init_percpu(unsigned int cpu)
+{
+	unsigned int const_freq;
+	struct clock_event_device *cd;
+	unsigned long min_delta = 0x600;
+	unsigned long max_delta = (1UL << 48) - 1;
+
+	cd = &per_cpu(constant_clockevent_device, cpu);
+
+	const_freq = calc_const_freq();
+
+	cd->name = "constant";
+	cd->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERIODIC |
+		       CLOCK_EVT_FEAT_PERCPU;
+
+	cd->rating = 500; /* Higher than cevt-r4k */
+	cd->irq = constant_timer_irq;
+	cd->cpumask = cpumask_of(cpu);
+	cd->set_state_oneshot = constant_set_state_oneshot;
+	cd->set_state_periodic = constant_set_state_periodic;
+	cd->set_state_shutdown = constant_set_state_shutdown;
+	cd->set_next_event = constant_next_event;
+
+	clockevents_config_and_register(cd, const_freq, min_delta, max_delta);
+
+	return 0;
+}
+
+static int __init constant_clockevent_init(void)
+{
+	unsigned long long flags = IRQF_PERCPU | IRQF_TIMER | IRQF_SHARED;
+
+	constant_timer_irq = get_c0_compare_int();
+	if (constant_timer_irq <= 0)
+		return -ENXIO;
+
+	/* Init on CPU0 firstly to keep away from IRQ storm */
+	constant_init_percpu(0);
+
+	if (request_irq(constant_timer_irq, handle_constant_timer, flags,
+			"constant_timer", handle_constant_timer)) {
+		pr_err("Failed to request irq %d (constant_timer)\n", constant_timer_irq);
+		return -ENXIO;
+	}
+
+	cpuhp_setup_state_nocalls(CPUHP_AP_MIPS_CONST_TIMER_STARTING,
+			  "clockevents/mips/constant/timer:starting",
+			   constant_init_percpu, NULL);
+
+	return 0;
+}
+
+static u64 read_const_counter(void)
+{
+	u64 count;
+
+	__asm__ __volatile__(
+		" .set push\n"
+		" .set mips64r2\n"
+		" rdhwr   %0, $30\n"
+		" .set pop\n"
+		: "=r" (count));
+
+	return count;
+}
+
+static u64 csrc_read_const_counter(struct clocksource *clk)
+{
+	return read_const_counter();
+}
+
+static struct clocksource clocksource_const = {
+	.name = "constant",
+	.rating = 8000,
+	.read = csrc_read_const_counter,
+	.mask = CLOCKSOURCE_MASK(64),
+	.flags = CLOCK_SOURCE_IS_CONTINUOUS,
+	.vdso_clock_mode = VDSO_CLOCKMODE_CONST,
+	.mult = 0,
+	.shift = 10,
+};
+
+static int __init constant_clocksource_init(unsigned long freq)
+{
+
+	clocksource_const.mult =
+		clocksource_hz2mult(freq, clocksource_const.shift);
+
+	return clocksource_register_hz(&clocksource_const, freq);
+}
+
+static void __init constant_sched_clock_init(unsigned long freq)
+{
+	plat_have_sched_clock = true;
+	sched_clock_register(read_const_counter, 64, freq);
+}
+
+int __init constant_timer_init(void)
+{
+	u32 ver;
+	unsigned long freq;
+
+	if (!cpu_has_extimer)
+		return -ENODEV;
+
+	if (!cpu_has_csr())
+		return -ENODEV;
+
+	ver = read_cpucfg(LOONGSON_CFG2);
+	ver &= LOONGSON_CFG2_LLFTPREV;
+	ver >>= LOONGSON_CFG2_LLFTPREVB;
+
+	if (ver < 2)
+		return -ENODEV;
+
+	freq = calc_const_freq();
+	if (!freq)
+		return -ENODEV;
+
+	constant_clockevent_init();
+	constant_clocksource_init(freq);
+	constant_sched_clock_init(freq);
+
+	return 0;
+}
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index ef3f48def8be..0230d13481c8 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -136,6 +136,7 @@ enum cpuhp_state {
 	CPUHP_AP_ARMADA_TIMER_STARTING,
 	CPUHP_AP_MARCO_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
+	CPUHP_AP_MIPS_CONST_TIMER_STARTING,
 	CPUHP_AP_ARC_TIMER_STARTING,
 	CPUHP_AP_RISCV_TIMER_STARTING,
 	CPUHP_AP_CLINT_TIMER_STARTING,
-- 
2.18.1

