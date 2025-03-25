Return-Path: <linux-mips+bounces-8349-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D274FA702B5
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167A91899E08
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 13:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E562594BD;
	Tue, 25 Mar 2025 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="RGweuSYJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D881C7015;
	Tue, 25 Mar 2025 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910268; cv=none; b=ZyoAmaH32No72A7jkfS1fRZeX+bghpr3iPyhc5bYKGsKNhn8qm/0/3uS+R0S9IbjwRf0x584fbFki7TfVrGd89Izi5XBzMhI8PNB29XS9jGjhkOmbVsZGj3hLUw7gLzo8entZX5cI+MJPjbaVE6hqPCpytNU7BfgMzH4QrDPoQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910268; c=relaxed/simple;
	bh=7SvfacGmrLaZ21TPKUHe8fciDlVDmum93Psc3mGxiv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tKMism47tCGaSUY2sUZpf79lLpGoIhYZIM1AGYk+rXRNCCEPjnfrvnmR1N3RDUlC3Qh1w0gociqA0mwlJQOjptPZgHGtcBKeHqi8YmB6CKNZKPooTr5FBbtkqrv5l8Gbcotj04NrOzYlakFyoyzWb4yFZvGZxYesIURyysPpGTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=RGweuSYJ; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1E142CF0A7;
	Tue, 25 Mar 2025 14:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742910262; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=oB19KlxB/eOLdhv3EtYRBqi3Y3lBuwKWWqxwjfxgr8w=;
	b=RGweuSYJyOX7o71G402ciJgNdfSJMGEIb7yJVUFbjerV7UEWhpfUWDYAqS/b5iXN1HyTEz
	6d5Fk43KxXcpnpiBgqhYo5GjovECdEV5/AusKsVXn4mKbUm45Q4PdWkfSPrN2P8Cj2aZ+m
	CoO74S98oqpCcnEiOkxGJfNT3HR2UEcn66juRqhOGLaYFy/TX7jYUO11w3LHQ6uH3nfMpS
	fMYC11LiW5gtJ6QNsNuCcrxcW7tvGKcpnAL/bLoM/Nd3dOPiOHUGR+koFeceKfc1waXFf7
	2c6vgIgysKo6QjAH+eSjVeZkctjSwQOpnd/xbZ+lkpffJm3L07zsDkrBtLz4lg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 05/10] clocksource/drivers: Add EcoNet Timer HPT driver
Date: Tue, 25 Mar 2025 13:43:44 +0000
Message-Id: <20250325134349.2476458-6-cjd@cjdns.fr>
In-Reply-To: <20250325134349.2476458-1-cjd@cjdns.fr>
References: <20250325134349.2476458-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Introduce a clocksource driver for the so-called high-precision timer (HPT)
in the EcoNet EN751221 MIPS SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
The timer is named in alignment with the DT compatible. The name "HPT" is
included because it is commonly used in vendor and 3rd party out-of-tree
sources.
---
 drivers/clocksource/Kconfig                 |   8 +
 drivers/clocksource/Makefile                |   1 +
 drivers/clocksource/timer-econet-en751221.c | 216 ++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/clocksource/timer-econet-en751221.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..976afb0b2312 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -73,6 +73,14 @@ config DW_APB_TIMER_OF
 	select DW_APB_TIMER
 	select TIMER_OF
 
+config ECONET_EN751221_TIMER
+	bool "EcoNet EN751221 High Precision Timer" if COMPILE_TEST
+	depends on HAS_IOMEM
+	select CLKSRC_MMIO
+	select TIMER_OF
+	help
+	  Support for CPU timer found on EcoNet MIPS based SoCs.
+
 config FTTMR010_TIMER
 	bool "Faraday Technology timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 43ef16a4efa6..d2998601eda5 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_CLKBLD_I8253)	+= i8253.o
 obj-$(CONFIG_CLKSRC_MMIO)	+= mmio.o
 obj-$(CONFIG_DAVINCI_TIMER)	+= timer-davinci.o
 obj-$(CONFIG_DIGICOLOR_TIMER)	+= timer-digicolor.o
+obj-$(CONFIG_ECONET_EN751221_TIMER)	+= timer-econet-en751221.o
 obj-$(CONFIG_OMAP_DM_TIMER)	+= timer-ti-dm.o
 obj-$(CONFIG_OMAP_DM_SYSTIMER)	+= timer-ti-dm-systimer.o
 obj-$(CONFIG_DW_APB_TIMER)	+= dw_apb_timer.o
diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
new file mode 100644
index 000000000000..4baa9e939a62
--- /dev/null
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Timer present on EcoNet EN75xx MIPS based SoCs.
+ *
+ * Copyright (C) 2025 by Caleb James DeLisle <cjd@cjdns.fr>
+ */
+
+#include <linux/io.h>
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/clockchips.h>
+#include <linux/sched_clock.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/cpuhotplug.h>
+#include <linux/clk.h>
+
+#define ECONET_BITS			32
+#define ECONET_MIN_DELTA		0x00001000
+#define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
+/* 34Kc hardware has 1 block and 1004Kc has 2. */
+#define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
+
+static struct {
+	void __iomem	*membase[ECONET_NUM_BLOCKS];
+	u32		freq_hz;
+} econet_timer __ro_after_init;
+
+static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
+
+/* Each memory block has 2 timers, the order of registers is:
+ * CTL, CMR0, CNT0, CMR1, CNT1
+ */
+static inline void __iomem *reg_ctl(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1];
+}
+
+static inline void __iomem *reg_compare(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x04;
+}
+
+static inline void __iomem *reg_count(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x08;
+}
+
+static inline u32 ctl_bit_enabled(u32 timer_n)
+{
+	return 1U << (timer_n & 1);
+}
+
+static inline u32 ctl_bit_pending(u32 timer_n)
+{
+	return 1U << ((timer_n & 1) + 16);
+}
+
+static bool cevt_is_pending(int cpu_id)
+{
+	return ioread32(reg_ctl(cpu_id)) & ctl_bit_pending(cpu_id);
+}
+
+static irqreturn_t cevt_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *dev = this_cpu_ptr(&econet_timer_pcpu);
+	int cpu = cpumask_first(dev->cpumask);
+
+	if (!cevt_is_pending(cpu)) {
+		pr_debug("%s IRQ %d on CPU %d is not pending\n", __func__, irq, cpu);
+		return IRQ_NONE;
+	}
+
+	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
+	dev->event_handler(dev);
+	return IRQ_HANDLED;
+}
+
+static int cevt_set_next_event(ulong delta, struct clock_event_device *dev)
+{
+	u32 next;
+	int cpu;
+
+	cpu = cpumask_first(dev->cpumask);
+	next = ioread32(reg_count(cpu)) + delta;
+	iowrite32(next, reg_compare(cpu));
+
+	if ((s32)(next - ioread32(reg_count(cpu))) < ECONET_MIN_DELTA / 2)
+		return -ETIME;
+
+	return 0;
+}
+
+static int cevt_init_cpu(uint cpu)
+{
+	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
+	u32 reg;
+
+	pr_info("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
+
+	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
+	iowrite32(reg, reg_ctl(cpu));
+
+	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+
+	/* Do this last because it synchronously configures the timer */
+	clockevents_config_and_register(
+		cd, econet_timer.freq_hz,
+		ECONET_MIN_DELTA, ECONET_MAX_DELTA);
+
+	return 0;
+}
+
+static u64 notrace sched_clock_read(void)
+{
+	/* Always read from clock zero no matter the CPU */
+	return (u64)ioread32(reg_count(0));
+}
+
+/* Init */
+
+static void __init cevt_dev_init(uint cpu)
+{
+	iowrite32(0, reg_count(cpu));
+	iowrite32(U32_MAX, reg_compare(cpu));
+}
+
+static int __init cevt_init(struct device_node *np)
+{
+	int i, irq, ret;
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (irq <= 0) {
+		pr_err("%pOFn: irq_of_parse_and_map failed", np);
+		return -EINVAL;
+	}
+
+	ret = request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer_pcpu);
+
+	if (ret < 0) {
+		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
+		goto err_unmap_irq;
+	}
+
+	for_each_possible_cpu(i) {
+		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
+
+		cd->rating		= 310,
+		cd->features		= CLOCK_EVT_FEAT_ONESHOT |
+					  CLOCK_EVT_FEAT_C3STOP |
+					  CLOCK_EVT_FEAT_PERCPU;
+		cd->set_next_event	= cevt_set_next_event;
+		cd->irq			= irq;
+		cd->cpumask		= cpumask_of(i);
+		cd->name		= np->name;
+
+		cevt_dev_init(i);
+	}
+
+	cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
+			  "clockevents/en75/timer:starting",
+			  cevt_init_cpu, NULL);
+	return 0;
+
+err_unmap_irq:
+	irq_dispose_mapping(irq);
+	return ret;
+}
+
+static int __init timer_init(struct device_node *np)
+{
+	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
+	struct clk *clk;
+	int ret;
+
+	clk = of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		pr_err("%pOFn: Failed to get CPU clock from DT %ld\n", np, PTR_ERR(clk));
+		return PTR_ERR(clk);
+	}
+
+	econet_timer.freq_hz = clk_get_rate(clk);
+
+	for (int i = 0; i < num_blocks; i++) {
+		econet_timer.membase[i] = of_iomap(np, i);
+		if (!econet_timer.membase[i]) {
+			pr_err("%pOFn: failed to map register [%d]\n", np, i);
+			return -ENXIO;
+		}
+	}
+
+	/* For clocksource purposes always read clock zero, whatever the CPU */
+	ret = clocksource_mmio_init(reg_count(0), np->name,
+				    econet_timer.freq_hz, 301, ECONET_BITS,
+				    clocksource_mmio_readl_up);
+	if (ret) {
+		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
+		return ret;
+	}
+
+	ret = cevt_init(np);
+	if (ret < 0)
+		return ret;
+
+	sched_clock_register(sched_clock_read, ECONET_BITS,
+			     econet_timer.freq_hz);
+
+	pr_info("%pOFn: using %u.%03u MHz high precision timer\n", np,
+		econet_timer.freq_hz / 1000000,
+		(econet_timer.freq_hz / 1000) % 1000);
+
+	return 0;
+}
+
+TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
-- 
2.39.5


