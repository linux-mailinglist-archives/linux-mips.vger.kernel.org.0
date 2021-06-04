Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE26139BD27
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 18:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhFDQds (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 12:33:48 -0400
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:60319 "EHLO
        out28-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhFDQdr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 12:33:47 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.011633-0.0038079-0.984559;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.KNfnAp8_1622824309;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KNfnAp8_1622824309)
          by smtp.aliyun-inc.com(10.147.41.138);
          Sat, 05 Jun 2021 00:31:58 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     daniel.lezcano@linaro.org, tglx@linutronix.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        paul@crapouillou.net
Subject: [PATCH v2 2/2] clocksource: Ingenic: Add SMP/SMT support for sysost driver.
Date:   Sat,  5 Jun 2021 00:31:46 +0800
Message-Id: <1622824306-30987-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622824306-30987-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1622824306-30987-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The OST in Ingenic XBurst®2 SoCs such as X2000 and X2100, has a global
timer and two or four percpu timers, add support for the percpu timers.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    1.Fix bug in ingenic_ost_global_timer_recalc_rate().
    2.Add a backpointer to the ingenic_ost structure.
    3.Remove unnecessary spinlock.
    4.Use "ret = ost->irq" instead "ret = -EINVAL".
    5.Use "%d" instead "%x" in pr_crit().

 drivers/clocksource/ingenic-sysost.c | 315 ++++++++++++++++++++++++++---------
 1 file changed, 236 insertions(+), 79 deletions(-)

diff --git a/drivers/clocksource/ingenic-sysost.c b/drivers/clocksource/ingenic-sysost.c
index a129840..6f080e4 100644
--- a/drivers/clocksource/ingenic-sysost.c
+++ b/drivers/clocksource/ingenic-sysost.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -13,6 +14,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/overflow.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include <linux/syscore_ops.h>
@@ -21,10 +24,14 @@
 
 /* OST register offsets */
 #define OST_REG_OSTCCR			0x00
+#define OST_REG_OSTER			0x04
 #define OST_REG_OSTCR			0x08
 #define OST_REG_OSTFR			0x0c
+#define OST_REG_OSTCNTH			0x0c
 #define OST_REG_OSTMR			0x10
+#define OST_REG_OSTCNTL			0x10
 #define OST_REG_OST1DFR			0x14
+#define OST_REG_OSTCNTB			0x14
 #define OST_REG_OST1CNT			0x18
 #define OST_REG_OST2CNTL		0x20
 #define OST_REG_OSTCNT2HBUF		0x24
@@ -55,13 +62,23 @@
 #define OSTECR_OST1ENC			BIT(0)
 #define OSTECR_OST2ENC			BIT(1)
 
+enum ingenic_ost_version {
+	ID_X1000,
+	ID_X2000,
+};
+
 struct ingenic_soc_info {
+	enum ingenic_ost_version version;
+	const struct ingenic_ost_clk_info *clk_info;
+
 	unsigned int num_channels;
+	unsigned int base_offset;
 };
 
 struct ingenic_ost_clk_info {
 	struct clk_init_data init_data;
-	u8 ostccr_reg;
+	unsigned int idx;
+	u32 ostcntl_reg;
 };
 
 struct ingenic_ost_clk {
@@ -71,15 +88,27 @@ struct ingenic_ost_clk {
 	const struct ingenic_ost_clk_info *info;
 };
 
+struct ingenic_ost_timer {
+	void __iomem *base;
+	unsigned int cpu;
+	unsigned int channel;
+	struct clock_event_device cevt;
+	struct ingenic_ost *ost;
+	struct clk *clk;
+	char name[20];
+};
+
 struct ingenic_ost {
 	void __iomem *base;
 	const struct ingenic_soc_info *soc_info;
-	struct clk *clk, *percpu_timer_clk, *global_timer_clk;
-	struct clock_event_device cevt;
+	struct clk *clk, *global_timer_clk;
+	struct device_node *np;
 	struct clocksource cs;
-	char name[20];
 
 	struct clk_hw_onecell_data *clocks;
+	struct ingenic_ost_timer __percpu *timers;
+
+	int irq;
 };
 
 static struct ingenic_ost *ingenic_ost;
@@ -94,11 +123,12 @@ static unsigned long ingenic_ost_percpu_timer_recalc_rate(struct clk_hw *hw,
 {
 	struct ingenic_ost_clk *ost_clk = to_ost_clk(hw);
 	const struct ingenic_ost_clk_info *info = ost_clk->info;
+	struct ingenic_ost_timer *timer = per_cpu_ptr(ost_clk->ost->timers, info->idx);
 	unsigned int prescale;
 
-	prescale = readl(ost_clk->ost->base + info->ostccr_reg);
+	prescale = readl(timer->base + OST_REG_OSTCCR);
 
-	prescale = (prescale & OSTCCR_PRESCALE1_MASK) >> OSTCCR_PRESCALE1_LSB;
+	prescale = FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
 
 	return parent_rate >> (prescale * 2);
 }
@@ -108,11 +138,15 @@ static unsigned long ingenic_ost_global_timer_recalc_rate(struct clk_hw *hw,
 {
 	struct ingenic_ost_clk *ost_clk = to_ost_clk(hw);
 	const struct ingenic_ost_clk_info *info = ost_clk->info;
+	struct ingenic_ost_timer *timer = per_cpu_ptr(ost_clk->ost->timers, info->idx);
 	unsigned int prescale;
 
-	prescale = readl(ost_clk->ost->base + info->ostccr_reg);
+	prescale = readl(timer->base + OST_REG_OSTCCR);
 
-	prescale = (prescale & OSTCCR_PRESCALE2_MASK) >> OSTCCR_PRESCALE2_LSB;
+	if (ost_clk->ost->soc_info->version >= ID_X2000)
+		prescale = FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
+	else
+		prescale = FIELD_GET(OSTCCR_PRESCALE2_MASK, prescale);
 
 	return parent_rate >> (prescale * 2);
 }
@@ -147,12 +181,13 @@ static int ingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned long re
 {
 	struct ingenic_ost_clk *ost_clk = to_ost_clk(hw);
 	const struct ingenic_ost_clk_info *info = ost_clk->info;
+	struct ingenic_ost_timer *timer = per_cpu_ptr(ost_clk->ost->timers, info->idx);
 	u8 prescale = ingenic_ost_get_prescale(parent_rate, req_rate);
 	int val;
 
-	val = readl(ost_clk->ost->base + info->ostccr_reg);
+	val = readl(timer->base + OST_REG_OSTCCR);
 	val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << OSTCCR_PRESCALE1_LSB);
-	writel(val, ost_clk->ost->base + info->ostccr_reg);
+	writel(val, timer->base + OST_REG_OSTCCR);
 
 	return 0;
 }
@@ -162,12 +197,18 @@ static int ingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned long re
 {
 	struct ingenic_ost_clk *ost_clk = to_ost_clk(hw);
 	const struct ingenic_ost_clk_info *info = ost_clk->info;
+	struct ingenic_ost_timer *timer = per_cpu_ptr(ost_clk->ost->timers, info->idx);
 	u8 prescale = ingenic_ost_get_prescale(parent_rate, req_rate);
 	int val;
 
-	val = readl(ost_clk->ost->base + info->ostccr_reg);
-	val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << OSTCCR_PRESCALE2_LSB);
-	writel(val, ost_clk->ost->base + info->ostccr_reg);
+	val = readl(timer->base + OST_REG_OSTCCR);
+
+	if (ost_clk->ost->soc_info->version >= ID_X2000)
+		val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << OSTCCR_PRESCALE1_LSB);
+	else
+		val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << OSTCCR_PRESCALE2_LSB);
+
+	writel(val, timer->base + OST_REG_OSTCCR);
 
 	return 0;
 }
@@ -195,7 +236,42 @@ static const struct ingenic_ost_clk_info x1000_ost_clk_info[] = {
 			.ops = &ingenic_ost_percpu_timer_ops,
 			.flags = CLK_SET_RATE_UNGATE,
 		},
-		.ostccr_reg = OST_REG_OSTCCR,
+		.idx = 0,
+	},
+
+	[OST_CLK_GLOBAL_TIMER] = {
+		.init_data = {
+			.name = "global timer",
+			.parent_names = ingenic_ost_clk_parents,
+			.num_parents = ARRAY_SIZE(ingenic_ost_clk_parents),
+			.ops = &ingenic_ost_global_timer_ops,
+			.flags = CLK_SET_RATE_UNGATE,
+		},
+		.ostcntl_reg = OST_REG_OST2CNTL,
+	},
+};
+
+static const struct ingenic_ost_clk_info x2000_ost_clk_info[] = {
+	[OST_CLK_PERCPU_TIMER0] = {
+		.init_data = {
+			.name = "percpu timer0",
+			.parent_names = ingenic_ost_clk_parents,
+			.num_parents = ARRAY_SIZE(ingenic_ost_clk_parents),
+			.ops = &ingenic_ost_percpu_timer_ops,
+			.flags = CLK_SET_RATE_UNGATE,
+		},
+		.idx = 0,
+	},
+
+	[OST_CLK_PERCPU_TIMER1] = {
+		.init_data = {
+			.name = "percpu timer1",
+			.parent_names = ingenic_ost_clk_parents,
+			.num_parents = ARRAY_SIZE(ingenic_ost_clk_parents),
+			.ops = &ingenic_ost_percpu_timer_ops,
+			.flags = CLK_SET_RATE_UNGATE,
+		},
+		.idx = 1,
 	},
 
 	[OST_CLK_GLOBAL_TIMER] = {
@@ -206,7 +282,7 @@ static const struct ingenic_ost_clk_info x1000_ost_clk_info[] = {
 			.ops = &ingenic_ost_global_timer_ops,
 			.flags = CLK_SET_RATE_UNGATE,
 		},
-		.ostccr_reg = OST_REG_OSTCCR,
+		.ostcntl_reg = OST_REG_OSTCNTL,
 	},
 };
 
@@ -215,7 +291,7 @@ static u64 notrace ingenic_ost_global_timer_read_cntl(void)
 	struct ingenic_ost *ost = ingenic_ost;
 	unsigned int count;
 
-	count = readl(ost->base + OST_REG_OST2CNTL);
+	count = readl(ost->base + ost->soc_info->clk_info->ostcntl_reg);
 
 	return count;
 }
@@ -225,16 +301,21 @@ static u64 notrace ingenic_ost_clocksource_read(struct clocksource *cs)
 	return ingenic_ost_global_timer_read_cntl();
 }
 
-static inline struct ingenic_ost *to_ingenic_ost(struct clock_event_device *evt)
+static inline struct ingenic_ost_timer *
+to_ingenic_ost_timer(struct clock_event_device *evt)
 {
-	return container_of(evt, struct ingenic_ost, cevt);
+	return container_of(evt, struct ingenic_ost_timer, cevt);
 }
 
 static int ingenic_ost_cevt_set_state_shutdown(struct clock_event_device *evt)
 {
-	struct ingenic_ost *ost = to_ingenic_ost(evt);
+	struct ingenic_ost_timer *timer = to_ingenic_ost_timer(evt);
+	struct ingenic_ost *ost = timer->ost;
 
-	writel(OSTECR_OST1ENC, ost->base + OST_REG_OSTECR);
+	if (ost->soc_info->version >= ID_X2000)
+		writel(0, timer->base + OST_REG_OSTER);
+	else
+		writel(OSTECR_OST1ENC, timer->base + OST_REG_OSTECR);
 
 	return 0;
 }
@@ -242,26 +323,34 @@ static int ingenic_ost_cevt_set_state_shutdown(struct clock_event_device *evt)
 static int ingenic_ost_cevt_set_next(unsigned long next,
 				     struct clock_event_device *evt)
 {
-	struct ingenic_ost *ost = to_ingenic_ost(evt);
-
-	writel((u32)~OSTFR_FFLAG, ost->base + OST_REG_OSTFR);
-	writel(next, ost->base + OST_REG_OST1DFR);
-	writel(OSTCR_OST1CLR, ost->base + OST_REG_OSTCR);
-	writel(OSTESR_OST1ENS, ost->base + OST_REG_OSTESR);
-	writel((u32)~OSTMR_FMASK, ost->base + OST_REG_OSTMR);
+	struct ingenic_ost_timer *timer = to_ingenic_ost_timer(evt);
+	struct ingenic_ost *ost = timer->ost;
+
+	writel((u32)~OSTFR_FFLAG, timer->base + OST_REG_OSTFR);
+	writel(next, timer->base + OST_REG_OST1DFR);
+	writel(OSTCR_OST1CLR, timer->base + OST_REG_OSTCR);
+
+	if (ost->soc_info->version >= ID_X2000) {
+		writel(OSTESR_OST1ENS, timer->base + OST_REG_OSTER);
+	} else {
+		writel(OSTESR_OST1ENS, timer->base + OST_REG_OSTESR);
+		writel((u32)~OSTMR_FMASK, timer->base + OST_REG_OSTMR);
+	}
 
 	return 0;
 }
 
 static irqreturn_t ingenic_ost_cevt_cb(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = dev_id;
-	struct ingenic_ost *ost = to_ingenic_ost(evt);
+	struct ingenic_ost_timer *timer = dev_id;
+	struct ingenic_ost *ost = timer->ost;
 
-	writel(OSTECR_OST1ENC, ost->base + OST_REG_OSTECR);
+	if (ost->soc_info->version >= ID_X2000)
+		writel(0, timer->base + OST_REG_OSTER);
+	else
+		writel(OSTECR_OST1ENC, timer->base + OST_REG_OSTECR);
 
-	if (evt->event_handler)
-		evt->event_handler(evt);
+	timer->cevt.event_handler(&timer->cevt);
 
 	return IRQ_HANDLED;
 }
@@ -271,6 +360,7 @@ static int __init ingenic_ost_register_clock(struct ingenic_ost *ost,
 			struct clk_hw_onecell_data *clocks)
 {
 	struct ingenic_ost_clk *ost_clk;
+	struct ingenic_ost_timer *timer = per_cpu_ptr(ost->timers, info->idx);
 	int val, err;
 
 	ost_clk = kzalloc(sizeof(*ost_clk), GFP_KERNEL);
@@ -283,9 +373,9 @@ static int __init ingenic_ost_register_clock(struct ingenic_ost *ost,
 	ost_clk->ost = ost;
 
 	/* Reset clock divider */
-	val = readl(ost->base + info->ostccr_reg);
-	val &= ~(OSTCCR_PRESCALE1_MASK | OSTCCR_PRESCALE2_MASK);
-	writel(val, ost->base + info->ostccr_reg);
+	val = readl(timer->base + OST_REG_OSTCCR);
+	val &= ~(OSTCCR_PRESCALE1_MASK);
+	writel(val, timer->base + OST_REG_OSTCCR);
 
 	err = clk_hw_register(NULL, &ost_clk->hw);
 	if (err) {
@@ -309,57 +399,51 @@ static struct clk * __init ingenic_ost_get_clock(struct device_node *np, int id)
 	return of_clk_get_from_provider(&args);
 }
 
-static int __init ingenic_ost_percpu_timer_init(struct device_node *np,
-					 struct ingenic_ost *ost)
+static int __init ingenic_ost_setup_cevt(unsigned int cpu)
 {
-	unsigned int timer_virq, channel = OST_CLK_PERCPU_TIMER;
+	struct ingenic_ost *ost = ingenic_ost;
+	struct ingenic_ost_timer *timer = this_cpu_ptr(ost->timers);
 	unsigned long rate;
 	int err;
 
-	ost->percpu_timer_clk = ingenic_ost_get_clock(np, channel);
-	if (IS_ERR(ost->percpu_timer_clk))
-		return PTR_ERR(ost->percpu_timer_clk);
+	timer->clk = ingenic_ost_get_clock(ost->np, timer->channel);
+	if (IS_ERR(timer->clk))
+		return PTR_ERR(timer->clk);
 
-	err = clk_prepare_enable(ost->percpu_timer_clk);
+	err = clk_prepare_enable(timer->clk);
 	if (err)
 		goto err_clk_put;
 
-	rate = clk_get_rate(ost->percpu_timer_clk);
+	rate = clk_get_rate(timer->clk);
 	if (!rate) {
 		err = -EINVAL;
 		goto err_clk_disable;
 	}
 
-	timer_virq = of_irq_get(np, 0);
-	if (!timer_virq) {
-		err = -EINVAL;
-		goto err_clk_disable;
-	}
+	snprintf(timer->name, sizeof(timer->name), "OST percpu timer%u", cpu);
 
-	snprintf(ost->name, sizeof(ost->name), "OST percpu timer");
+	/* Unmask full comparison match interrupt */
+	writel((u32)~OSTMR_FMASK, timer->base + OST_REG_OSTMR);
 
-	err = request_irq(timer_virq, ingenic_ost_cevt_cb, IRQF_TIMER,
-			  ost->name, &ost->cevt);
-	if (err)
-		goto err_irq_dispose_mapping;
+	timer->cpu = smp_processor_id();
+	timer->cevt.cpumask = cpumask_of(smp_processor_id());
+	timer->cevt.features = CLOCK_EVT_FEAT_ONESHOT;
+	timer->cevt.name = timer->name;
+	timer->cevt.rating = 400;
+	timer->cevt.set_state_shutdown = ingenic_ost_cevt_set_state_shutdown;
+	timer->cevt.set_next_event = ingenic_ost_cevt_set_next;
 
-	ost->cevt.cpumask = cpumask_of(smp_processor_id());
-	ost->cevt.features = CLOCK_EVT_FEAT_ONESHOT;
-	ost->cevt.name = ost->name;
-	ost->cevt.rating = 400;
-	ost->cevt.set_state_shutdown = ingenic_ost_cevt_set_state_shutdown;
-	ost->cevt.set_next_event = ingenic_ost_cevt_set_next;
+	clockevents_config_and_register(&timer->cevt, rate, 4, 0xffffffff);
 
-	clockevents_config_and_register(&ost->cevt, rate, 4, 0xffffffff);
+	if (ost->soc_info->version >= ID_X2000)
+		enable_percpu_irq(ost->irq, IRQ_TYPE_NONE);
 
 	return 0;
 
-err_irq_dispose_mapping:
-	irq_dispose_mapping(timer_virq);
 err_clk_disable:
-	clk_disable_unprepare(ost->percpu_timer_clk);
+	clk_disable_unprepare(timer->clk);
 err_clk_put:
-	clk_put(ost->percpu_timer_clk);
+	clk_put(timer->clk);
 	return err;
 }
 
@@ -385,11 +469,14 @@ static int __init ingenic_ost_global_timer_init(struct device_node *np,
 		goto err_clk_disable;
 	}
 
-	/* Clear counter CNT registers */
-	writel(OSTCR_OST2CLR, ost->base + OST_REG_OSTCR);
-
-	/* Enable OST channel */
-	writel(OSTESR_OST2ENS, ost->base + OST_REG_OSTESR);
+	/* Clear counter CNT registers and enable OST channel */
+	if (ost->soc_info->version >= ID_X2000) {
+		writel(OSTCR_OST1CLR, ost->base + OST_REG_OSTCR);
+		writel(OSTESR_OST1ENS, ost->base + OST_REG_OSTER);
+	} else {
+		writel(OSTCR_OST2CLR, ost->base + OST_REG_OSTCR);
+		writel(OSTESR_OST2ENS, ost->base + OST_REG_OSTESR);
+	}
 
 	cs->name = "ingenic-ost";
 	cs->rating = 400;
@@ -411,18 +498,33 @@ static int __init ingenic_ost_global_timer_init(struct device_node *np,
 }
 
 static const struct ingenic_soc_info x1000_soc_info = {
+	.version = ID_X1000,
+	.clk_info = x1000_ost_clk_info,
+
 	.num_channels = 2,
 };
 
+static const struct ingenic_soc_info x2000_soc_info = {
+	.version = ID_X2000,
+	.clk_info = x2000_ost_clk_info,
+
+	.num_channels = 3,
+	.base_offset = 0x100,
+};
+
 static const struct of_device_id __maybe_unused ingenic_ost_of_matches[] __initconst = {
 	{ .compatible = "ingenic,x1000-ost", .data = &x1000_soc_info },
+	{ .compatible = "ingenic,x2000-ost", .data = &x2000_soc_info },
 	{ /* sentinel */ }
 };
 
 static int __init ingenic_ost_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_ost_of_matches, np);
+	struct ingenic_ost_timer *timer;
 	struct ingenic_ost *ost;
+	void __iomem *base;
+	unsigned int cpu;
 	unsigned int i;
 	int ret;
 
@@ -430,18 +532,43 @@ static int __init ingenic_ost_probe(struct device_node *np)
 	if (!ost)
 		return -ENOMEM;
 
+	ost->timers = alloc_percpu(struct ingenic_ost_timer);
+	if (!ost->timers) {
+		ret = -ENOMEM;
+		goto err_free_ost;
+	}
+
+	ost->np = np;
+	ost->soc_info = id->data;
+
 	ost->base = of_io_request_and_map(np, 0, of_node_full_name(np));
 	if (IS_ERR(ost->base)) {
 		pr_err("%s: Failed to map OST registers\n", __func__);
 		ret = PTR_ERR(ost->base);
-		goto err_free_ost;
+		goto err_free_timers;
+	}
+
+	if (ost->soc_info->version >= ID_X2000) {
+		base = of_io_request_and_map(np, 1, of_node_full_name(np));
+		if (IS_ERR(base)) {
+			pr_err("%s: Failed to map OST registers\n", __func__);
+			ret = PTR_ERR(base);
+			goto err_free_timers;
+		}
+	}
+
+	ost->irq = irq_of_parse_and_map(np, 0);
+	if (ost->irq < 0) {
+		pr_crit("%s: Cannot to get OST IRQ\n", __func__);
+		ret = ost->irq;
+		goto err_free_timers;
 	}
 
 	ost->clk = of_clk_get_by_name(np, "ost");
 	if (IS_ERR(ost->clk)) {
-		ret = PTR_ERR(ost->clk);
 		pr_crit("%s: Cannot get OST clock\n", __func__);
-		goto err_free_ost;
+		ret = PTR_ERR(ost->clk);
+		goto err_free_timers;
 	}
 
 	ret = clk_prepare_enable(ost->clk);
@@ -450,8 +577,6 @@ static int __init ingenic_ost_probe(struct device_node *np)
 		goto err_put_clk;
 	}
 
-	ost->soc_info = id->data;
-
 	ost->clocks = kzalloc(struct_size(ost->clocks, hws, ost->soc_info->num_channels),
 			      GFP_KERNEL);
 	if (!ost->clocks) {
@@ -461,8 +586,21 @@ static int __init ingenic_ost_probe(struct device_node *np)
 
 	ost->clocks->num = ost->soc_info->num_channels;
 
-	for (i = 0; i < ost->clocks->num; i++) {
-		ret = ingenic_ost_register_clock(ost, i, &x1000_ost_clk_info[i], ost->clocks);
+	for (cpu = 0; cpu < num_possible_cpus(); cpu++) {
+		timer = per_cpu_ptr(ost->timers, cpu);
+
+		if (ost->soc_info->version >= ID_X2000)
+			timer->base = base + ost->soc_info->base_offset * cpu;
+		else
+			timer->base = ost->base;
+
+		timer->ost = ost;
+		timer->cpu = cpu;
+		timer->channel = OST_CLK_PERCPU_TIMER + cpu;
+	}
+
+	for (i = 0; i < num_possible_cpus() + 1; i++) {
+		ret = ingenic_ost_register_clock(ost, i, &ost->soc_info->clk_info[i], ost->clocks);
 		if (ret) {
 			pr_crit("%s: Cannot register clock %d\n", __func__, i);
 			goto err_unregister_ost_clocks;
@@ -488,6 +626,8 @@ static int __init ingenic_ost_probe(struct device_node *np)
 	clk_disable_unprepare(ost->clk);
 err_put_clk:
 	clk_put(ost->clk);
+err_free_timers:
+	free_percpu(ost->timers);
 err_free_ost:
 	kfree(ost);
 	return ret;
@@ -513,13 +653,29 @@ static int __init ingenic_ost_init(struct device_node *np)
 
 	ret = ingenic_ost_global_timer_init(np, ost);
 	if (ret) {
-		pr_crit("%s: Unable to init global timer: %x\n", __func__, ret);
+		pr_crit("%s: Unable to init global timer: %d\n", __func__, ret);
 		goto err_free_ingenic_ost;
 	}
 
-	ret = ingenic_ost_percpu_timer_init(np, ost);
-	if (ret)
+	if (ost->soc_info->version >= ID_X2000)
+		ret = request_percpu_irq(ost->irq, ingenic_ost_cevt_cb,
+				  "OST percpu timer", ost->timers);
+	else
+		ret = request_irq(ost->irq, ingenic_ost_cevt_cb, IRQF_TIMER,
+				  "OST percpu timer", ost->timers);
+
+	if (ret) {
+		pr_crit("%s: Unable to request percpu IRQ: %d\n", __func__, ret);
+		goto err_ost_global_timer_cleanup;
+	}
+
+	/* Setup clock events on each CPU core */
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "Ingenic XBurst: online",
+				ingenic_ost_setup_cevt, NULL);
+	if (ret < 0) {
+		pr_crit("%s: Unable to init percpu timers: %d\n", __func__, ret);
 		goto err_ost_global_timer_cleanup;
+	}
 
 	/* Register the sched_clock at the end as there's no way to undo it */
 	rate = clk_get_rate(ost->global_timer_clk);
@@ -537,3 +693,4 @@ static int __init ingenic_ost_init(struct device_node *np)
 }
 
 TIMER_OF_DECLARE(x1000_ost,  "ingenic,x1000-ost",  ingenic_ost_init);
+TIMER_OF_DECLARE(x2000_ost,  "ingenic,x2000-ost",  ingenic_ost_init);
-- 
2.7.4

