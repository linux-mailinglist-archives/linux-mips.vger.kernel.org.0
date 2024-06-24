Return-Path: <linux-mips+bounces-3878-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D32913FD1
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 03:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41806B21E20
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 01:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08958827;
	Mon, 24 Jun 2024 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="dzlubsd0"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C5610A12
	for <linux-mips@vger.kernel.org>; Mon, 24 Jun 2024 01:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192199; cv=none; b=sHqpPV0VwFbAVJ+yt5jB6QlB/9joaWjq9oFgHKFSTJtZU/zBRfpUChc/iLo2LI9MOQoCvkXf1Q/U2Nf89QeGGtzQ/kuRI1OydPqAcb+CJ/UnzJ3gu/HePgyRgFttdY3oRgV+f/81aVLyNv6xRU5eO8ZKU7SrhyzqnP7Eb+2KCXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192199; c=relaxed/simple;
	bh=9frSEnlTnP7IUmlF4RoHML58Wakk9VcRmpssS8TkHPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVyw/4+oZnQZ2qdOLp+JpwF3VRfodqIV4khYRtZ0wCf7ks7CQYE8LHPeC1Dy2bE2CCc8l6PymYQMG8uMhJRNCNF4gAt6HOj0qf2I0CVdg+RQ9/EeJsC9/PKFoiDbl4b4IzcJPaUzTGSw7pns2ZE2C+J2GPLUOvD6E9wDjaLvPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=dzlubsd0; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 088E72C09B7;
	Mon, 24 Jun 2024 13:23:10 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719192190;
	bh=Tl1j/fhtEchUHndZYnpF7xflboInSYHUPRDutHTCOLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dzlubsd0o1EnS77ZajUbEVxlMxrR+1n2GgTuTKvYjlSrQEOIxwHGUJkDVztUqsGKt
	 ozDvXJBCXWSm35xtQTxM9PiBEtHfefKnAabSt8gMgtoKpO3wDllO44EYwmLcyasFqU
	 V7qeAyIxJFcmyjJ+EbubIjX2+5XYPXGqlF7qm8EAQapbeS9ZDoLWb/GAeFSeXhofW7
	 bfURYLw7BHpi0mRoScqMi5NiH1IqfmVjg/YIa1WAHrRpXlHJcixs4dP4zHWuBPXV1N
	 oos7wUMzpXPlk72Zn9YPGmHoWMX7nVhPJ3iAs3ekbLtSt4uspU+M5jGyj7GAkgoR/n
	 R1aCZRJbO9c1A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678ca7d0006>; Mon, 24 Jun 2024 13:23:09 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 458AE13EE84;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 418C7280AE5; Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v2 6/8] clocksource: realtek: Add timer driver for rtl-otto platforms
Date: Mon, 24 Jun 2024 13:22:58 +1200
Message-ID: <20240624012300.1713290-7-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678ca7d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=jU52IrjdAAAA:8 a=jdP34snFAAAA:8 a=lYcVSoeQvU4dK_rf-5cA:9 a=3ZKOabzyN94A:10 a=udjdHy_fWrGJRxLc5KTh:22 a=jlphF6vWLdwq7oh3TaWq:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The timer/counter block on the Realtek SoCs provides up to 5 timers. It
also includes a watchdog timer but this isn't being used currently (it
will be added as a separate wdt driver).

One timer will be used per CPU as a local clock event generator. An
additional timer will be used as an overal stable clocksource.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
Signed-off-by: Sander Vanheule <sander@svanheule.net>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This is derrived from openwrt[1],[2]. I've retained the original sign=
off
    and added my own.
   =20
    [1] https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob_plain;f=
=3Dtarget/linux/realtek/files-5.15/drivers/clocksource/timer-rtl-otto.c;h=
b=3DHEAD
    [2] https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob_plain;f=
=3Dtarget/linux/realtek/patches-5.15/302-clocksource-add-otto-driver.patc=
h;hb=3DHEAD

 drivers/clocksource/Kconfig          |  11 +
 drivers/clocksource/Makefile         |   1 +
 drivers/clocksource/timer-rtl-otto.c | 287 +++++++++++++++++++++++++++
 include/linux/cpuhotplug.h           |   1 +
 4 files changed, 300 insertions(+)
 create mode 100644 drivers/clocksource/timer-rtl-otto.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 34faa0320ece..f02b5b50d166 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -134,6 +134,17 @@ config RDA_TIMER
 	help
 	  Enables the support for the RDA Micro timer driver.
=20
+config REALTEK_OTTO_TIMER
+	bool "Clocksource/timer for the Realtek Otto platform"
+	select COMMON_CLK
+	select TIMER_OF
+	help
+	  This driver adds support for the timers found in the Realtek RTL83xx
+	  and RTL93xx SoCs series. This includes chips such as RTL8380, RTL8381
+	  and RTL832, as well as chips from the RTL839x series, such as RTL8390
+	  RT8391, RTL8392, RTL8393 and RTL8396 and chips of the RTL930x series
+	  such as RTL9301, RTL9302 or RTL9303.
+
 config SUN4I_TIMER
 	bool "Sun4i timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 4bb856e4df55..22743785299e 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -59,6 +59,7 @@ obj-$(CONFIG_MILBEAUT_TIMER)	+=3D timer-milbeaut.o
 obj-$(CONFIG_SPRD_TIMER)	+=3D timer-sprd.o
 obj-$(CONFIG_NPCM7XX_TIMER)	+=3D timer-npcm7xx.o
 obj-$(CONFIG_RDA_TIMER)		+=3D timer-rda.o
+obj-$(CONFIG_REALTEK_OTTO_TIMER)	+=3D timer-rtl-otto.o
=20
 obj-$(CONFIG_ARC_TIMERS)		+=3D arc_timer.o
 obj-$(CONFIG_ARM_ARCH_TIMER)		+=3D arm_arch_timer.o
diff --git a/drivers/clocksource/timer-rtl-otto.c b/drivers/clocksource/t=
imer-rtl-otto.c
new file mode 100644
index 000000000000..7e41ae95d7dc
--- /dev/null
+++ b/drivers/clocksource/timer-rtl-otto.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/cpu.h>
+#include <linux/cpuhotplug.h>
+#include <linux/interrupt.h>
+#include <linux/sched_clock.h>
+#include "timer-of.h"
+
+#define RTTM_DATA		0x0
+#define RTTM_CNT		0x4
+#define RTTM_CTRL		0x8
+#define RTTM_INT		0xc
+
+#define RTTM_CTRL_ENABLE	BIT(28)
+#define RTTM_INT_PENDING	BIT(16)
+#define RTTM_INT_ENABLE		BIT(20)
+
+/*
+ * The Otto platform provides multiple 28 bit timers/counters with the f=
ollowing
+ * operating logic. If enabled the timer counts up. Per timer one can se=
t a
+ * maximum counter value as an end marker. If end marker is reached the =
timer
+ * fires an interrupt. If the timer "overflows" by reaching the end mark=
er or
+ * by adding 1 to 0x0fffffff the counter is reset to 0. When this happen=
s and
+ * the timer is in operating mode COUNTER it stops. In mode TIMER it wil=
l
+ * continue to count up.
+ */
+#define RTTM_CTRL_COUNTER	0
+#define RTTM_CTRL_TIMER		BIT(24)
+
+#define RTTM_BIT_COUNT		28
+#define RTTM_MIN_DELTA		8
+#define RTTM_MAX_DELTA		CLOCKSOURCE_MASK(28)
+
+/*
+ * Timers are derived from the LXB clock frequency. Usually this is a fi=
xed
+ * multiple of the 25 MHz oscillator. The 930X SOC is an exception from =
that.
+ * Its LXB clock has only dividers and uses the switch PLL of 2.45 GHz a=
s its
+ * base. The only meaningful frequencies we can achieve from that are 17=
5.000
+ * MHz and 153.125 MHz. The greatest common divisor of all explained pos=
sible
+ * speeds is 3125000. Pin the timers to this 3.125 MHz reference frequen=
cy.
+ */
+#define RTTM_TICKS_PER_SEC	3125000
+
+struct rttm_cs {
+	struct timer_of		to;
+	struct clocksource	cs;
+};
+
+/* Simple internal register functions */
+static inline void rttm_set_counter(void __iomem *base, unsigned int cou=
nter)
+{
+	iowrite32(counter, base + RTTM_CNT);
+}
+
+static inline unsigned int rttm_get_counter(void __iomem *base)
+{
+	return ioread32(base + RTTM_CNT);
+}
+
+static inline void rttm_set_period(void __iomem *base, unsigned int peri=
od)
+{
+	iowrite32(period, base + RTTM_DATA);
+}
+
+static inline void rttm_disable_timer(void __iomem *base)
+{
+	iowrite32(0, base + RTTM_CTRL);
+}
+
+static inline void rttm_enable_timer(void __iomem *base, u32 mode, u32 d=
ivisor)
+{
+	iowrite32(RTTM_CTRL_ENABLE | mode | divisor, base + RTTM_CTRL);
+}
+
+static inline void rttm_ack_irq(void __iomem *base)
+{
+	iowrite32(ioread32(base + RTTM_INT) | RTTM_INT_PENDING, base + RTTM_INT=
);
+}
+
+static inline void rttm_enable_irq(void __iomem *base)
+{
+	iowrite32(RTTM_INT_ENABLE, base + RTTM_INT);
+}
+
+static inline void rttm_disable_irq(void __iomem *base)
+{
+	iowrite32(0, base + RTTM_INT);
+}
+
+/* Aggregated control functions for kernel clock framework */
+#define RTTM_DEBUG(base)			\
+	pr_debug("------------- %d %08x\n",	\
+		 smp_processor_id(), (u32)base)
+
+static irqreturn_t rttm_timer_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *clkevt =3D dev_id;
+	struct timer_of *to =3D to_timer_of(clkevt);
+
+	rttm_ack_irq(to->of_base.base);
+	RTTM_DEBUG(to->of_base.base);
+	clkevt->event_handler(clkevt);
+
+	return IRQ_HANDLED;
+}
+
+static void rttm_stop_timer(void __iomem *base)
+{
+	rttm_disable_timer(base);
+	rttm_ack_irq(base);
+}
+
+static void rttm_start_timer(struct timer_of *to, u32 mode)
+{
+	rttm_set_counter(to->of_base.base, 0);
+	rttm_enable_timer(to->of_base.base, mode, to->of_clk.rate / RTTM_TICKS_=
PER_SEC);
+}
+
+static int rttm_next_event(unsigned long delta, struct clock_event_devic=
e *clkevt)
+{
+	struct timer_of *to =3D to_timer_of(clkevt);
+
+	RTTM_DEBUG(to->of_base.base);
+	rttm_stop_timer(to->of_base.base);
+	rttm_set_period(to->of_base.base, delta);
+	rttm_start_timer(to, RTTM_CTRL_COUNTER);
+
+	return 0;
+}
+
+static int rttm_state_oneshot(struct clock_event_device *clkevt)
+{
+	struct timer_of *to =3D to_timer_of(clkevt);
+
+	RTTM_DEBUG(to->of_base.base);
+	rttm_stop_timer(to->of_base.base);
+	rttm_set_period(to->of_base.base, RTTM_TICKS_PER_SEC / HZ);
+	rttm_start_timer(to, RTTM_CTRL_COUNTER);
+
+	return 0;
+}
+
+static int rttm_state_periodic(struct clock_event_device *clkevt)
+{
+	struct timer_of *to =3D to_timer_of(clkevt);
+
+	RTTM_DEBUG(to->of_base.base);
+	rttm_stop_timer(to->of_base.base);
+	rttm_set_period(to->of_base.base, RTTM_TICKS_PER_SEC / HZ);
+	rttm_start_timer(to, RTTM_CTRL_TIMER);
+
+	return 0;
+}
+
+static int rttm_state_shutdown(struct clock_event_device *clkevt)
+{
+	struct timer_of *to =3D to_timer_of(clkevt);
+
+	RTTM_DEBUG(to->of_base.base);
+	rttm_stop_timer(to->of_base.base);
+
+	return 0;
+}
+
+static void rttm_setup_timer(void __iomem *base)
+{
+	RTTM_DEBUG(base);
+	rttm_stop_timer(base);
+	rttm_set_period(base, 0);
+}
+
+static u64 rttm_read_clocksource(struct clocksource *cs)
+{
+	struct rttm_cs *rcs =3D container_of(cs, struct rttm_cs, cs);
+
+	return (u64)rttm_get_counter(rcs->to.of_base.base);
+}
+
+/* Module initialization part. */
+static DEFINE_PER_CPU(struct timer_of, rttm_to) =3D {
+	.flags				=3D TIMER_OF_BASE | TIMER_OF_CLOCK | TIMER_OF_IRQ,
+	.of_irq =3D {
+		.flags			=3D IRQF_PERCPU | IRQF_TIMER,
+		.handler		=3D rttm_timer_interrupt,
+	},
+	.clkevt =3D {
+		.rating			=3D 400,
+		.features		=3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
+		.set_state_periodic	=3D rttm_state_periodic,
+		.set_state_shutdown	=3D rttm_state_shutdown,
+		.set_state_oneshot	=3D rttm_state_oneshot,
+		.set_next_event		=3D rttm_next_event
+	},
+};
+
+static int rttm_enable_clocksource(struct clocksource *cs)
+{
+	struct rttm_cs *rcs =3D container_of(cs, struct rttm_cs, cs);
+
+	rttm_disable_irq(rcs->to.of_base.base);
+	rttm_setup_timer(rcs->to.of_base.base);
+	rttm_enable_timer(rcs->to.of_base.base, RTTM_CTRL_TIMER,
+			  rcs->to.of_clk.rate / RTTM_TICKS_PER_SEC);
+
+	return 0;
+}
+
+struct rttm_cs rttm_cs =3D {
+	.to =3D {
+		.flags	=3D TIMER_OF_BASE | TIMER_OF_CLOCK,
+	},
+	.cs =3D {
+		.name	=3D "realtek_otto_timer",
+		.rating	=3D 400,
+		.mask	=3D CLOCKSOURCE_MASK(RTTM_BIT_COUNT),
+		.flags	=3D CLOCK_SOURCE_IS_CONTINUOUS,
+		.read	=3D rttm_read_clocksource,
+	}
+};
+
+static u64 notrace rttm_read_clock(void)
+{
+	return (u64)rttm_get_counter(rttm_cs.to.of_base.base);
+}
+
+static int rttm_cpu_starting(unsigned int cpu)
+{
+	struct timer_of *to =3D per_cpu_ptr(&rttm_to, cpu);
+
+	RTTM_DEBUG(to->of_base.base);
+	to->clkevt.cpumask =3D cpumask_of(cpu);
+	irq_force_affinity(to->of_irq.irq, to->clkevt.cpumask);
+	clockevents_config_and_register(&to->clkevt, RTTM_TICKS_PER_SEC,
+					RTTM_MIN_DELTA, RTTM_MAX_DELTA);
+	rttm_enable_irq(to->of_base.base);
+
+	return 0;
+}
+
+static int __init rttm_probe(struct device_node *np)
+{
+	int cpu, cpu_rollback;
+	struct timer_of *to;
+	int clkidx =3D num_possible_cpus();
+
+	/* Use the first n timers as per CPU clock event generators */
+	for_each_possible_cpu(cpu) {
+		to =3D per_cpu_ptr(&rttm_to, cpu);
+		to->of_irq.index =3D to->of_base.index =3D cpu;
+		if (timer_of_init(np, to)) {
+			pr_err("setup of timer %d failed\n", cpu);
+			goto rollback;
+		}
+		rttm_setup_timer(to->of_base.base);
+	}
+
+	/* Activate the n'th + 1 timer as a stable CPU clocksource. */
+	to =3D &rttm_cs.to;
+	to->of_base.index =3D clkidx;
+	timer_of_init(np, to);
+	if (rttm_cs.to.of_base.base && rttm_cs.to.of_clk.rate) {
+		rttm_enable_clocksource(&rttm_cs.cs);
+		clocksource_register_hz(&rttm_cs.cs, RTTM_TICKS_PER_SEC);
+		sched_clock_register(rttm_read_clock, RTTM_BIT_COUNT, RTTM_TICKS_PER_S=
EC);
+	} else
+		pr_err(" setup of timer %d as clocksource failed", clkidx);
+
+	return cpuhp_setup_state(CPUHP_AP_REALTEK_TIMER_STARTING,
+				"timer/realtek:online",
+				rttm_cpu_starting, NULL);
+rollback:
+	pr_err("timer registration failed\n");
+	for_each_possible_cpu(cpu_rollback) {
+		if (cpu_rollback =3D=3D cpu)
+			break;
+		to =3D per_cpu_ptr(&rttm_to, cpu_rollback);
+		timer_of_cleanup(to);
+	}
+
+	return -EINVAL;
+}
+
+TIMER_OF_DECLARE(otto_timer, "realtek,otto-timer", rttm_probe);
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 7a5785f405b6..56b744dc1317 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -171,6 +171,7 @@ enum cpuhp_state {
 	CPUHP_AP_ARMADA_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 	CPUHP_AP_ARC_TIMER_STARTING,
+	CPUHP_AP_REALTEK_TIMER_STARTING,
 	CPUHP_AP_RISCV_TIMER_STARTING,
 	CPUHP_AP_CLINT_TIMER_STARTING,
 	CPUHP_AP_CSKY_TIMER_STARTING,
--=20
2.45.2


