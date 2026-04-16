Return-Path: <linux-mips+bounces-14180-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAHEKL8h4WnMpQAAu9opvQ
	(envelope-from <linux-mips+bounces-14180-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 19:51:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF8413551
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 19:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A8143030A8D
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCC32D6407;
	Thu, 16 Apr 2026 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="khL0DCG7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E571322B7D;
	Thu, 16 Apr 2026 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361878; cv=none; b=j7WmTq6R5uJ11KuUnS+2Go5gZC8ACjZwXYIMvuKUomy9xMw+q10tnujrFZkiI9AKdXGfur/qWlaiX5aU5j9J34oD7ogabWv7PYAq5DMzgm5XtXg14D97zU2rxNaaLYQN1qALzLWg1K3hVCbnDoRxSnITwfke36LOX+HeGrFnoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361878; c=relaxed/simple;
	bh=n1mwyY11ooJjVMa1y3e0LBKRobsKQDCVDDmSs95TWUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bv5V5u115+GYURIFQHsQRm6kFqmDIY9AiVNZnbgFQPBL1tsOcRw5tcu2Un1+QoZgzY8vROf9dcO3LFRjQRpmE4ojz7EhUYIsXsIh59600mLBBtEy2xDfwVNb7r8IqgSE2LhRAnvn5yDD+ZSIvkL7Xksyw+bfXTJawBvHDMPXcV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=khL0DCG7; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 919C7FB7E9;
	Thu, 16 Apr 2026 19:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1776361868; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jFEFBsckozMzj3hugoSbDEI2lfszgMQy6N4tJWS0jjg=;
	b=khL0DCG7YRgrXR33Zv4TxZELi85EwoQYYaZ8HxNte1FuYAeua+6q8VSwGnuuDVP9UxWqLR
	YMXJqRnnd0733PfrqxgAkdBw0fCuyy1HLt3fDV1ixbrMXSu+V4dzPlMm/bT1H5/aRh+Xh5
	0dSTWfs5l3vrNeEPzESMAgntPUUurR1VCBBaMN6Nk9S+/l77UnI5QYdKIoAC4rHmVzegEA
	xASYa6T7I4TY80SXmm5+WsSj8BdXie3A+jhW2ASqKcz4ky4Cb7Er3JuFcjvZwxkscacL6x
	pHNT6pqXvq/9YBOt1ItKcvD7K1D2H/bZQwH8E6Mc7+Iu8iP+QHXj+BsZTaojIw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 2/2] clocksource/timer-econet-en751221: Support irq number per timer
Date: Thu, 16 Apr 2026 17:51:01 +0000
Message-Id: <20260416175101.958073-3-cjd@cjdns.fr>
In-Reply-To: <20260416175101.958073-1-cjd@cjdns.fr>
References: <20260416175101.958073-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,cjdns.fr];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14180-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cjdns.fr:email,cjdns.fr:dkim,cjdns.fr:mid]
X-Rspamd-Queue-Id: 94AF8413551
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This timer was first developed on the EN751221 which is a MIPS 34Kc
and therefore has a custom interrupt controller. The hardware for
econet,en751221-intc implements percpu routing of the timer
interrupts.

However, the EN751627 and EN7528 are MIPS 1004Kc based, and
therefore use the standard mti,gic compatible interrupt controller.
This interrupt controller uses a different IRQ number for each
timer interrupt.

Add support for both models in this timer driver.

Co-developed-by: Ahmed Naseef <naseefkm@gmail.com>
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
Link: https://github.com/openwrt/openwrt/commit/fab098cb6121647ca9cc6e501d56ebe8a9ea550b#diff-a09ee5e4166e89df337d03c1455dce7b81eb89797b1d0f714476b188e6685334

[cjd@cjdns.fr minor changes:
Set ECONET_MAX_IRQS to NR_CPUS rather than 4
Use is_percpu_irq() instead of field
Do not set CLOCK_EVT_FEAT_PERCPU in non-percpu mode
Fold cevt_init() into timer_init()
]

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/Kconfig                 |   5 +-
 drivers/clocksource/timer-econet-en751221.c | 137 ++++++++++++++++----
 2 files changed, 114 insertions(+), 28 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index d1a33a231a44..9a77f38d5fb7 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -79,7 +79,10 @@ config ECONET_EN751221_TIMER
 	select CLKSRC_MMIO
 	select TIMER_OF
 	help
-	  Support for CPU timer found on EcoNet MIPS based SoCs.
+	  Support for CPU timer found on EcoNet EN75xx MIPS based SoCs
+	  (EN751221, EN751627, EN7528). The driver supports both GIC-based
+	  (separate IRQ per CPU) and legacy interrupt controller (percpu IRQ)
+	  modes.
 
 config FTTMR010_TIMER
 	bool "Faraday Technology timer driver" if COMPILE_TEST
diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
index 4008076b1a21..e280ee8c2b1c 100644
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -3,11 +3,13 @@
  * Timer present on EcoNet EN75xx MIPS based SoCs.
  *
  * Copyright (C) 2025 by Caleb James DeLisle <cjd@cjdns.fr>
+ * Copyright (C) 2025 by Ahmed Naseef <naseefkm@gmail.com>
  */
 
 #include <linux/io.h>
 #include <linux/cpumask.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
 #include <linux/clockchips.h>
 #include <linux/sched_clock.h>
 #include <linux/of.h>
@@ -21,14 +23,26 @@
 #define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
 /* 34Kc hardware has 1 block and 1004Kc has 2. */
 #define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
+#define ECONET_MAX_IRQS			NR_CPUS
 
 static struct {
 	void __iomem	*membase[ECONET_NUM_BLOCKS];
 	u32		freq_hz;
+	int		irqs[ECONET_MAX_IRQS];
+	int		num_irqs;
 } econet_timer __ro_after_init;
 
 static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
 
+/* This timer supports two interrupt controller models, either 1 IRQ which is in per-cpu
+ * mode which is used on 34Kc CPUs, and separate IRQ number per CPU which is used on
+ * 1004Kc CPUs with GIC intc.
+ */
+static inline bool is_percpu_irq(void)
+{
+	return econet_timer.num_irqs == 1;
+}
+
 /* Each memory block has 2 timers, the order of registers is:
  * CTL, CMR0, CNT0, CMR1, CNT1
  */
@@ -98,12 +112,21 @@ static int cevt_init_cpu(uint cpu)
 	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
 	u32 reg;
 
+	if (!is_percpu_irq() && cpu >= econet_timer.num_irqs)
+		return -EINVAL;
+
 	pr_debug("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
 
 	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
 	iowrite32(reg, reg_ctl(cpu));
 
-	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+	if (is_percpu_irq()) {
+		enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+	} else {
+		if (irq_force_affinity(econet_timer.irqs[cpu], cpumask_of(cpu)))
+			pr_warn("%s: failed to set IRQ %d affinity to CPU %d\n",
+				cd->name, econet_timer.irqs[cpu], cpu);
+	}
 
 	/* Do this last because it synchronously configures the timer */
 	clockevents_config_and_register(cd, econet_timer.freq_hz,
@@ -126,7 +149,20 @@ static void __init cevt_dev_init(uint cpu)
 	iowrite32(U32_MAX, reg_compare(cpu));
 }
 
-static int __init cevt_init(struct device_node *np)
+static void __init cevt_setup_clockevent(struct clock_event_device *cd,
+					 struct device_node *np,
+					 int irq, int cpu)
+{
+	cd->rating		= 310;
+	cd->features		= CLOCK_EVT_FEAT_ONESHOT |
+				  CLOCK_EVT_FEAT_C3STOP;
+	cd->set_next_event	= cevt_set_next_event;
+	cd->irq			= irq;
+	cd->cpumask		= cpumask_of(cpu);
+	cd->name		= np->name;
+}
+
+static int __init cevt_init_percpu(struct device_node *np)
 {
 	int i, irq, ret;
 
@@ -137,42 +173,65 @@ static int __init cevt_init(struct device_node *np)
 	}
 
 	ret = request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer_pcpu);
-
 	if (ret < 0) {
 		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
-		goto err_unmap_irq;
+		irq_dispose_mapping(irq);
+		return ret;
 	}
 
 	for_each_possible_cpu(i) {
 		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
 
-		cd->rating		= 310;
-		cd->features		= CLOCK_EVT_FEAT_ONESHOT |
-					  CLOCK_EVT_FEAT_C3STOP |
-					  CLOCK_EVT_FEAT_PERCPU;
-		cd->set_next_event	= cevt_set_next_event;
-		cd->irq			= irq;
-		cd->cpumask		= cpumask_of(i);
-		cd->name		= np->name;
+		cevt_setup_clockevent(cd, np, irq, i);
+		cd->features |= CLOCK_EVT_FEAT_PERCPU;
+		cevt_dev_init(i);
+	}
+
+	return 0;
+}
 
+static int __init cevt_init_separate(struct device_node *np)
+{
+	int i, ret;
+
+	for (i = 0; i < econet_timer.num_irqs; i++) {
+		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
+
+		econet_timer.irqs[i] = irq_of_parse_and_map(np, i);
+		if (econet_timer.irqs[i] <= 0) {
+			pr_err("%pOFn: irq_of_parse_and_map failed", np);
+			ret = -EINVAL;
+			goto err_free_irqs;
+		}
+
+		ret = request_irq(econet_timer.irqs[i], cevt_interrupt,
+				  IRQF_TIMER | IRQF_NOBALANCING,
+				  np->name, NULL);
+		if (ret < 0) {
+			pr_err("%pOFn: IRQ %d setup failed (%d)\n", np,
+			       econet_timer.irqs[i], ret);
+			irq_dispose_mapping(econet_timer.irqs[i]);
+			goto err_free_irqs;
+		}
+
+		cevt_setup_clockevent(cd, np, econet_timer.irqs[i], i);
 		cevt_dev_init(i);
 	}
 
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-			  "clockevents/econet/timer:starting",
-			  cevt_init_cpu, NULL);
 	return 0;
 
-err_unmap_irq:
-	irq_dispose_mapping(irq);
+err_free_irqs:
+	while (--i >= 0) {
+		free_irq(econet_timer.irqs[i], NULL);
+		irq_dispose_mapping(econet_timer.irqs[i]);
+	}
 	return ret;
 }
 
 static int __init timer_init(struct device_node *np)
 {
-	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
 	struct clk *clk;
-	int ret;
+	int ret, i;
 
 	clk = of_clk_get(np, 0);
 	if (IS_ERR(clk)) {
@@ -182,11 +241,18 @@ static int __init timer_init(struct device_node *np)
 
 	econet_timer.freq_hz = clk_get_rate(clk);
 
-	for (int i = 0; i < num_blocks; i++) {
+	econet_timer.num_irqs = of_irq_count(np);
+	if (econet_timer.num_irqs <= 0 || econet_timer.num_irqs > ECONET_MAX_IRQS) {
+		pr_err("%pOFn: invalid IRQ count %d\n", np, econet_timer.num_irqs);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ECONET_NUM_BLOCKS; i++) {
 		econet_timer.membase[i] = of_iomap(np, i);
 		if (!econet_timer.membase[i]) {
 			pr_err("%pOFn: failed to map register [%d]\n", np, i);
-			return -ENXIO;
+			ret = -ENXIO;
+			goto err_unmap;
 		}
 	}
 
@@ -196,21 +262,38 @@ static int __init timer_init(struct device_node *np)
 				    clocksource_mmio_readl_up);
 	if (ret) {
 		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
-		return ret;
+		goto err_unmap;
 	}
 
-	ret = cevt_init(np);
+	if (is_percpu_irq())
+		ret = cevt_init_percpu(np);
+	else
+		ret = cevt_init_separate(np);
+
 	if (ret < 0)
-		return ret;
+		goto err_unmap;
+
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+			  "clockevents/econet/timer:starting",
+			  cevt_init_cpu, NULL);
 
 	sched_clock_register(sched_clock_read, ECONET_BITS,
 			     econet_timer.freq_hz);
 
-	pr_info("%pOFn: using %u.%03u MHz high precision timer\n", np,
+	pr_info("%pOFn: using %u.%03u MHz high precision timer (%s mode)\n", np,
 		econet_timer.freq_hz / 1000000,
-		(econet_timer.freq_hz / 1000) % 1000);
+		(econet_timer.freq_hz / 1000) % 1000,
+		is_percpu_irq() ? "percpu" : "separate IRQ");
 
 	return 0;
+
+err_unmap:
+	for (i = 0; i < ECONET_NUM_BLOCKS; i++) {
+		if (econet_timer.membase[i])
+			iounmap(econet_timer.membase[i]);
+	}
+
+	return ret;
 }
 
-TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
+TIMER_OF_DECLARE(econet_en751221_timer, "econet,en751221-timer", timer_init);
-- 
2.39.5


