Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB7B1DA243
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 22:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgESULg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 16:11:36 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:45610 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgESULf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 16:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1589919093; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9eQ5qRlYt+NGH4VrcHuqGXU4xPRK/N0Wubb1HOewu+Y=;
        b=ln1KleAI+3JtxK5mt273gmesERo98rcdklf1k106t7eMWEy07hhxhMV184F6IwqdE5jJDu
        /wEjiw/l7lnrsLs1AGeMJpiB9RmAvOO6blm3tANKpyOTfaB+wJK/BdEXB3obFuM+NELJV9
        XRzQ39CWZ08Jtcp2CFD3HkpD9CwuT0M=
From:   Paul Cercueil <paul@crapouillou.net>
To:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>
Cc:     linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] clocksource: Ingenic: Add high resolution timer support for SMP.
Date:   Tue, 19 May 2020 22:11:10 +0200
Message-Id: <20200519201110.286501-1-paul@crapouillou.net>
In-Reply-To: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable clock event handling on per CPU core basis.
Make sure that interrupts raised on the first core execute
event handlers on the correct CPU core.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Tested-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Zhou:

I took the liberty to clean your patch so that it doesn't create a
struct ingenic_tcu per CPU timer.

Tested, and fully working on the JZ4770 with CONFIG_SMP disabled, and
also with CONFIG_SMP enabled (even though JZ4770 has only one CPU) with
a fixed smp.c and USB disabled (otherwise it crashes at boot).

Cheers,
-Paul

 drivers/clocksource/ingenic-timer.c | 180 +++++++++++++++++++---------
 1 file changed, 123 insertions(+), 57 deletions(-)

diff --git a/drivers/clocksource/ingenic-timer.c b/drivers/clocksource/ingenic-timer.c
index 496333650de2..a068e4620c44 100644
--- a/drivers/clocksource/ingenic-timer.c
+++ b/drivers/clocksource/ingenic-timer.c
@@ -2,6 +2,7 @@
 /*
  * JZ47xx SoCs TCU IRQ driver
  * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
+ * Copyright (C) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  */
 
 #include <linux/bitops.h>
@@ -15,24 +16,35 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/sched_clock.h>
 
 #include <dt-bindings/clock/ingenic,tcu.h>
 
+static DEFINE_PER_CPU(call_single_data_t, ingenic_cevt_csd);
+
 struct ingenic_soc_info {
 	unsigned int num_channels;
 };
 
+struct ingenic_tcu_timer {
+	unsigned int cpu;
+	unsigned int channel;
+	struct clock_event_device cevt;
+	struct clk *clk;
+	char name[8];
+};
+
 struct ingenic_tcu {
 	struct regmap *map;
-	struct clk *timer_clk, *cs_clk;
-	unsigned int timer_channel, cs_channel;
-	struct clock_event_device cevt;
+	struct device_node *np;
+	struct clk *cs_clk;
+	unsigned int cs_channel;
 	struct clocksource cs;
-	char name[4];
 	unsigned long pwm_channels_mask;
+	struct ingenic_tcu_timer timers[];
 };
 
 static struct ingenic_tcu *ingenic_tcu;
@@ -52,16 +64,24 @@ static u64 notrace ingenic_tcu_timer_cs_read(struct clocksource *cs)
 	return ingenic_tcu_timer_read();
 }
 
-static inline struct ingenic_tcu *to_ingenic_tcu(struct clock_event_device *evt)
+static inline struct ingenic_tcu *
+to_ingenic_tcu(struct ingenic_tcu_timer *timer)
+{
+	return container_of(timer, struct ingenic_tcu, timers[timer->cpu]);
+}
+
+static inline struct ingenic_tcu_timer *
+to_ingenic_tcu_timer(struct clock_event_device *evt)
 {
-	return container_of(evt, struct ingenic_tcu, cevt);
+	return container_of(evt, struct ingenic_tcu_timer, cevt);
 }
 
 static int ingenic_tcu_cevt_set_state_shutdown(struct clock_event_device *evt)
 {
-	struct ingenic_tcu *tcu = to_ingenic_tcu(evt);
+	struct ingenic_tcu_timer *timer = to_ingenic_tcu_timer(evt);
+	struct ingenic_tcu *tcu = to_ingenic_tcu(timer);
 
-	regmap_write(tcu->map, TCU_REG_TECR, BIT(tcu->timer_channel));
+	regmap_write(tcu->map, TCU_REG_TECR, BIT(timer->channel));
 
 	return 0;
 }
@@ -69,27 +89,40 @@ static int ingenic_tcu_cevt_set_state_shutdown(struct clock_event_device *evt)
 static int ingenic_tcu_cevt_set_next(unsigned long next,
 				     struct clock_event_device *evt)
 {
-	struct ingenic_tcu *tcu = to_ingenic_tcu(evt);
+	struct ingenic_tcu_timer *timer = to_ingenic_tcu_timer(evt);
+	struct ingenic_tcu *tcu = to_ingenic_tcu(timer);
 
 	if (next > 0xffff)
 		return -EINVAL;
 
-	regmap_write(tcu->map, TCU_REG_TDFRc(tcu->timer_channel), next);
-	regmap_write(tcu->map, TCU_REG_TCNTc(tcu->timer_channel), 0);
-	regmap_write(tcu->map, TCU_REG_TESR, BIT(tcu->timer_channel));
+	regmap_write(tcu->map, TCU_REG_TDFRc(timer->channel), next);
+	regmap_write(tcu->map, TCU_REG_TCNTc(timer->channel), 0);
+	regmap_write(tcu->map, TCU_REG_TESR, BIT(timer->channel));
 
 	return 0;
 }
 
+static void ingenic_per_cpu_event_handler(void *info)
+{
+	struct clock_event_device *cevt = (struct clock_event_device *) info;
+
+	cevt->event_handler(cevt);
+}
+
 static irqreturn_t ingenic_tcu_cevt_cb(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = dev_id;
-	struct ingenic_tcu *tcu = to_ingenic_tcu(evt);
+	struct ingenic_tcu_timer *timer = dev_id;
+	struct ingenic_tcu *tcu = to_ingenic_tcu(timer);
+	call_single_data_t *csd;
 
-	regmap_write(tcu->map, TCU_REG_TECR, BIT(tcu->timer_channel));
+	regmap_write(tcu->map, TCU_REG_TECR, BIT(timer->channel));
 
-	if (evt->event_handler)
-		evt->event_handler(evt);
+	if (timer->cevt.event_handler) {
+		csd = &per_cpu(ingenic_cevt_csd, timer->cpu);
+		csd->info = (void *) &timer->cevt;
+		csd->func = ingenic_per_cpu_event_handler;
+		smp_call_function_single_async(timer->cpu, csd);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -105,64 +138,66 @@ static struct clk * __init ingenic_tcu_get_clock(struct device_node *np, int id)
 	return of_clk_get_from_provider(&args);
 }
 
-static int __init ingenic_tcu_timer_init(struct device_node *np,
-					 struct ingenic_tcu *tcu)
+static int ingenic_tcu_setup_cevt(unsigned int cpu)
 {
-	unsigned int timer_virq, channel = tcu->timer_channel;
+	struct ingenic_tcu *tcu = ingenic_tcu;
+	struct ingenic_tcu_timer *timer = &tcu->timers[cpu];
+	unsigned int timer_virq;
 	struct irq_domain *domain;
 	unsigned long rate;
 	int err;
 
-	tcu->timer_clk = ingenic_tcu_get_clock(np, channel);
-	if (IS_ERR(tcu->timer_clk))
-		return PTR_ERR(tcu->timer_clk);
+	timer->clk = ingenic_tcu_get_clock(tcu->np, timer->channel);
+	if (IS_ERR(timer->clk))
+		return PTR_ERR(timer->clk);
 
-	err = clk_prepare_enable(tcu->timer_clk);
+	err = clk_prepare_enable(timer->clk);
 	if (err)
 		goto err_clk_put;
 
-	rate = clk_get_rate(tcu->timer_clk);
+	rate = clk_get_rate(timer->clk);
 	if (!rate) {
 		err = -EINVAL;
 		goto err_clk_disable;
 	}
 
-	domain = irq_find_host(np);
+	domain = irq_find_host(tcu->np);
 	if (!domain) {
 		err = -ENODEV;
 		goto err_clk_disable;
 	}
 
-	timer_virq = irq_create_mapping(domain, channel);
+	timer_virq = irq_create_mapping(domain, timer->channel);
 	if (!timer_virq) {
 		err = -EINVAL;
 		goto err_clk_disable;
 	}
 
-	snprintf(tcu->name, sizeof(tcu->name), "TCU");
+	snprintf(timer->name, sizeof(timer->name), "TCU%u", timer->channel);
 
 	err = request_irq(timer_virq, ingenic_tcu_cevt_cb, IRQF_TIMER,
-			  tcu->name, &tcu->cevt);
+			  timer->name, timer);
 	if (err)
 		goto err_irq_dispose_mapping;
 
-	tcu->cevt.cpumask = cpumask_of(smp_processor_id());
-	tcu->cevt.features = CLOCK_EVT_FEAT_ONESHOT;
-	tcu->cevt.name = tcu->name;
-	tcu->cevt.rating = 200;
-	tcu->cevt.set_state_shutdown = ingenic_tcu_cevt_set_state_shutdown;
-	tcu->cevt.set_next_event = ingenic_tcu_cevt_set_next;
+	timer->cpu = smp_processor_id();
+	timer->cevt.cpumask = cpumask_of(smp_processor_id());
+	timer->cevt.features = CLOCK_EVT_FEAT_ONESHOT;
+	timer->cevt.name = timer->name;
+	timer->cevt.rating = 200;
+	timer->cevt.set_state_shutdown = ingenic_tcu_cevt_set_state_shutdown;
+	timer->cevt.set_next_event = ingenic_tcu_cevt_set_next;
 
-	clockevents_config_and_register(&tcu->cevt, rate, 10, 0xffff);
+	clockevents_config_and_register(&timer->cevt, rate, 10, 0xffff);
 
 	return 0;
 
 err_irq_dispose_mapping:
 	irq_dispose_mapping(timer_virq);
 err_clk_disable:
-	clk_disable_unprepare(tcu->timer_clk);
+	clk_disable_unprepare(timer->clk);
 err_clk_put:
-	clk_put(tcu->timer_clk);
+	clk_put(timer->clk);
 	return err;
 }
 
@@ -238,10 +273,12 @@ static int __init ingenic_tcu_init(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
 	const struct ingenic_soc_info *soc_info = id->data;
+	struct ingenic_tcu_timer *timer;
 	struct ingenic_tcu *tcu;
 	struct regmap *map;
+	unsigned int cpu;
+	int ret, last_bit = -1;
 	long rate;
-	int ret;
 
 	of_node_clear_flag(np, OF_POPULATED);
 
@@ -249,17 +286,23 @@ static int __init ingenic_tcu_init(struct device_node *np)
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
-	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
+	tcu = kzalloc(struct_size(tcu, timers, num_possible_cpus()),
+		      GFP_KERNEL);
 	if (!tcu)
 		return -ENOMEM;
 
-	/* Enable all TCU channels for PWM use by default except channels 0/1 */
-	tcu->pwm_channels_mask = GENMASK(soc_info->num_channels - 1, 2);
+	/*
+	 * Enable all TCU channels for PWM use by default except channels 0/1,
+	 * and channel 2 if target CPU is JZ4780 and SMP is selected.
+	 */
+	tcu->pwm_channels_mask = GENMASK(soc_info->num_channels - 1,
+					 num_possible_cpus() + 1);
 	of_property_read_u32(np, "ingenic,pwm-channels-mask",
 			     (u32 *)&tcu->pwm_channels_mask);
 
-	/* Verify that we have at least two free channels */
-	if (hweight8(tcu->pwm_channels_mask) > soc_info->num_channels - 2) {
+	/* Verify that we have at least num_possible_cpus() + 1 free channels */
+	if (hweight8(tcu->pwm_channels_mask) >
+			soc_info->num_channels - num_possible_cpus() + 1) {
 		pr_crit("%s: Invalid PWM channel mask: 0x%02lx\n", __func__,
 			tcu->pwm_channels_mask);
 		ret = -EINVAL;
@@ -267,13 +310,22 @@ static int __init ingenic_tcu_init(struct device_node *np)
 	}
 
 	tcu->map = map;
+	tcu->np = np;
 	ingenic_tcu = tcu;
 
-	tcu->timer_channel = find_first_zero_bit(&tcu->pwm_channels_mask,
-						 soc_info->num_channels);
+	for (cpu = 0; cpu < num_possible_cpus(); cpu++) {
+		timer = &tcu->timers[cpu];
+
+		timer->cpu = cpu;
+		timer->channel = find_next_zero_bit(&tcu->pwm_channels_mask,
+						  soc_info->num_channels,
+						  last_bit + 1);
+		last_bit = timer->channel;
+	}
+
 	tcu->cs_channel = find_next_zero_bit(&tcu->pwm_channels_mask,
 					     soc_info->num_channels,
-					     tcu->timer_channel + 1);
+					     last_bit + 1);
 
 	ret = ingenic_tcu_clocksource_init(np, tcu);
 	if (ret) {
@@ -281,9 +333,13 @@ static int __init ingenic_tcu_init(struct device_node *np)
 		goto err_free_ingenic_tcu;
 	}
 
-	ret = ingenic_tcu_timer_init(np, tcu);
-	if (ret)
+	/* Setup clock events on each CPU core */
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "Ingenic XBurst: online",
+				ingenic_tcu_setup_cevt, NULL);
+	if (ret < 0) {
+		pr_crit("%s: Unable to start CPU timers: %d\n", __func__, ret);
 		goto err_tcu_clocksource_cleanup;
+	}
 
 	/* Register the sched_clock at the end as there's no way to undo it */
 	rate = clk_get_rate(tcu->cs_clk);
@@ -315,28 +371,38 @@ static int __init ingenic_tcu_probe(struct platform_device *pdev)
 static int __maybe_unused ingenic_tcu_suspend(struct device *dev)
 {
 	struct ingenic_tcu *tcu = dev_get_drvdata(dev);
+	unsigned int cpu;
 
 	clk_disable(tcu->cs_clk);
-	clk_disable(tcu->timer_clk);
+
+	for (cpu = 0; cpu < num_online_cpus(); cpu++)
+		clk_disable(tcu->timers[cpu].clk);
+
 	return 0;
 }
 
 static int __maybe_unused ingenic_tcu_resume(struct device *dev)
 {
 	struct ingenic_tcu *tcu = dev_get_drvdata(dev);
+	unsigned int cpu;
 	int ret;
 
-	ret = clk_enable(tcu->timer_clk);
-	if (ret)
-		return ret;
+	for (cpu = 0; cpu < num_online_cpus(); cpu++) {
+		ret = clk_enable(tcu->timers[cpu].clk);
+		if (ret)
+			goto err_timer_clk_disable;
+	}
 
 	ret = clk_enable(tcu->cs_clk);
-	if (ret) {
-		clk_disable(tcu->timer_clk);
-		return ret;
-	}
+	if (ret)
+		goto err_timer_clk_disable;
 
 	return 0;
+
+err_timer_clk_disable:
+	for (; cpu > 0; cpu--)
+		clk_disable(tcu->timers[cpu - 1].clk);
+	return ret;
 }
 
 static const struct dev_pm_ops __maybe_unused ingenic_tcu_pm_ops = {
-- 
2.26.2

