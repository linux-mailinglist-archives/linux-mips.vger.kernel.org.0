Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7485B1396A6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 17:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgAMQoY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 11:44:24 -0500
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:41157 "EHLO
        out28-149.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMQoY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 11:44:24 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.104935-0.00692224-0.888143;DS=CONTINUE|ham_alarm|0.00659935-0.00134675-0.992054;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03303;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.GbRhA7M_1578933839;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GbRhA7M_1578933839)
          by smtp.aliyun-inc.com(10.147.40.233);
          Tue, 14 Jan 2020 00:44:12 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, miquel.raynal@bootlin.com, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, jiaxun.yang@flygoat.com,
        chenhc@lemote.com, daniel.lezcano@linaro.org,
        ebiederm@xmission.com, keescook@chromium.org, ak@linux.intel.com,
        krzk@kernel.org, paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH 2/6] clocksource: Ingenic: Add high resolution timer support for SMP.
Date:   Tue, 14 Jan 2020 00:43:29 +0800
Message-Id: <1578933813-80122-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <Introduce SMP support for CI20 (based on JZ4780).>
 <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable clock event handling on per CPU core basis.
Make sure that interrupts raised on the first core execute
event handlers on the correct CPU core.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/clocksource/ingenic-timer.c | 114 +++++++++++++++++++++++++++++-------
 1 file changed, 93 insertions(+), 21 deletions(-)

diff --git a/drivers/clocksource/ingenic-timer.c b/drivers/clocksource/ingenic-timer.c
index 4bbdb3d..1d32652 100644
--- a/drivers/clocksource/ingenic-timer.c
+++ b/drivers/clocksource/ingenic-timer.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * JZ47xx SoCs TCU IRQ driver
+ * XBurst SoCs TCU IRQ driver
  * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
+ * Copyright (C) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  */
 
 #include <linux/bitops.h>
@@ -27,12 +28,15 @@ struct ingenic_soc_info {
 
 struct ingenic_tcu {
 	struct regmap *map;
+	struct device_node *np;
 	struct clk *timer_clk, *cs_clk;
+	unsigned int timer_local[NR_CPUS];
 	unsigned int timer_channel, cs_channel;
 	struct clock_event_device cevt;
 	struct clocksource cs;
-	char name[4];
+	char name[16];
 	unsigned long pwm_channels_mask;
+	int cpu;
 };
 
 static struct ingenic_tcu *ingenic_tcu;
@@ -81,6 +85,30 @@ static int ingenic_tcu_cevt_set_next(unsigned long next,
 	return 0;
 }
 
+static void ingenic_per_cpu_event_handle(void *info)
+{
+	struct clock_event_device *cevt = (struct clock_event_device *) info;
+
+	if (cevt->event_handler)
+		cevt->event_handler(cevt);
+}
+
+static void ingenic_tcu_per_cpu_cb(struct clock_event_device *evt)
+{
+	struct clock_event_device *cevt = evt;
+	struct ingenic_tcu *tcu = to_ingenic_tcu(evt);
+
+	if (smp_processor_id() == tcu->cpu) {
+		if (cevt->event_handler)
+			cevt->event_handler(cevt);
+	} else {
+		arch_local_irq_enable();
+		smp_call_function_single(tcu->cpu,
+				ingenic_per_cpu_event_handle, (void *) cevt, 0);
+		arch_local_irq_disable();
+	}
+}
+
 static irqreturn_t ingenic_tcu_cevt_cb(int irq, void *dev_id)
 {
 	struct clock_event_device *evt = dev_id;
@@ -88,8 +116,7 @@ static irqreturn_t ingenic_tcu_cevt_cb(int irq, void *dev_id)
 
 	regmap_write(tcu->map, TCU_REG_TECR, BIT(tcu->timer_channel));
 
-	if (evt->event_handler)
-		evt->event_handler(evt);
+	ingenic_tcu_per_cpu_cb(evt);
 
 	return IRQ_HANDLED;
 }
@@ -105,15 +132,23 @@ static struct clk * __init ingenic_tcu_get_clock(struct device_node *np, int id)
 	return of_clk_get_from_provider(&args);
 }
 
-static int __init ingenic_tcu_timer_init(struct device_node *np,
-					 struct ingenic_tcu *tcu)
+static int ingenic_tcu_setup_cevt(struct device_node *np,
+				     unsigned int channel)
 {
-	unsigned int timer_virq, channel = tcu->timer_channel;
+	unsigned int timer_virq;
 	struct irq_domain *domain;
+	struct ingenic_tcu *tcu;
 	unsigned long rate;
 	int err;
 
+	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
+	if (!tcu)
+		return -ENOMEM;
+
+	tcu->map = ingenic_tcu->map;
+
 	tcu->timer_clk = ingenic_tcu_get_clock(np, channel);
+
 	if (IS_ERR(tcu->timer_clk))
 		return PTR_ERR(tcu->timer_clk);
 
@@ -139,13 +174,15 @@ static int __init ingenic_tcu_timer_init(struct device_node *np,
 		goto err_clk_disable;
 	}
 
-	snprintf(tcu->name, sizeof(tcu->name), "TCU");
+	snprintf(tcu->name, sizeof(tcu->name), "TCU channel.%u", channel);
 
 	err = request_irq(timer_virq, ingenic_tcu_cevt_cb, IRQF_TIMER,
 			  tcu->name, &tcu->cevt);
 	if (err)
 		goto err_irq_dispose_mapping;
 
+	tcu->cpu = smp_processor_id();
+	tcu->timer_channel = channel;
 	tcu->cevt.cpumask = cpumask_of(smp_processor_id());
 	tcu->cevt.features = CLOCK_EVT_FEAT_ONESHOT;
 	tcu->cevt.name = tcu->name;
@@ -233,12 +270,32 @@ static const struct of_device_id ingenic_tcu_of_match[] = {
 	{ /* sentinel */ }
 };
 
+static int register_cpu_online(unsigned int cpu)
+{
+	int ret;
+
+	ret = ingenic_tcu_setup_cevt(ingenic_tcu->np,
+						ingenic_tcu->timer_local[cpu]);
+	if (ret)
+		goto err_tcu_clocksource_cleanup;
+
+	return 0;
+
+err_tcu_clocksource_cleanup:
+	clocksource_unregister(&ingenic_tcu->cs);
+	clk_disable_unprepare(ingenic_tcu->cs_clk);
+	clk_put(ingenic_tcu->cs_clk);
+	kfree(ingenic_tcu);
+	return ret;
+}
+
 static int __init ingenic_tcu_init(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
 	const struct ingenic_soc_info *soc_info = id->data;
 	struct ingenic_tcu *tcu;
 	struct regmap *map;
+	unsigned cpu = 0;
 	long rate;
 	int ret;
 
@@ -253,12 +310,14 @@ static int __init ingenic_tcu_init(struct device_node *np)
 		return -ENOMEM;
 
 	/* Enable all TCU channels for PWM use by default except channels 0/1 */
-	tcu->pwm_channels_mask = GENMASK(soc_info->num_channels - 1, 2);
+	tcu->pwm_channels_mask = GENMASK(soc_info->num_channels - 1,
+								NR_CPUS + 1);
 	of_property_read_u32(np, "ingenic,pwm-channels-mask",
 			     (u32 *)&tcu->pwm_channels_mask);
 
 	/* Verify that we have at least two free channels */
-	if (hweight8(tcu->pwm_channels_mask) > soc_info->num_channels - 2) {
+	if (hweight8(tcu->pwm_channels_mask) >
+			soc_info->num_channels - NR_CPUS + 1) {
 		pr_crit("%s: Invalid PWM channel mask: 0x%02lx\n", __func__,
 			tcu->pwm_channels_mask);
 		ret = -EINVAL;
@@ -266,13 +325,29 @@ static int __init ingenic_tcu_init(struct device_node *np)
 	}
 
 	tcu->map = map;
+	tcu->np = np;
 	ingenic_tcu = tcu;
 
-	tcu->timer_channel = find_first_zero_bit(&tcu->pwm_channels_mask,
+	tcu->timer_local[cpu] = find_first_zero_bit(&tcu->pwm_channels_mask,
 						 soc_info->num_channels);
-	tcu->cs_channel = find_next_zero_bit(&tcu->pwm_channels_mask,
-					     soc_info->num_channels,
-					     tcu->timer_channel + 1);
+
+	if (NR_CPUS > 1) {
+		for (cpu = 1; cpu < NR_CPUS; cpu++)
+			tcu->timer_local[cpu] = find_next_zero_bit(
+						&tcu->pwm_channels_mask,
+						soc_info->num_channels,
+						tcu->timer_local[cpu - 1] + 1);
+
+		tcu->cs_channel = find_next_zero_bit(&tcu->pwm_channels_mask,
+					soc_info->num_channels,
+					tcu->timer_local[cpu-1] + 1);
+	} else {
+		tcu->cs_channel = find_next_zero_bit(&tcu->pwm_channels_mask,
+					soc_info->num_channels,
+					tcu->timer_local[cpu] + 1);
+	}
+
+
 
 	ret = ingenic_tcu_clocksource_init(np, tcu);
 	if (ret) {
@@ -280,9 +355,10 @@ static int __init ingenic_tcu_init(struct device_node *np)
 		goto err_free_ingenic_tcu;
 	}
 
-	ret = ingenic_tcu_timer_init(np, tcu);
-	if (ret)
-		goto err_tcu_clocksource_cleanup;
+	/* Setup clock events on each CPU core */
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "Ingenic XBurst: online",
+				register_cpu_online, NULL);
+	WARN_ON(ret < 0);
 
 	/* Register the sched_clock at the end as there's no way to undo it */
 	rate = clk_get_rate(tcu->cs_clk);
@@ -290,10 +366,6 @@ static int __init ingenic_tcu_init(struct device_node *np)
 
 	return 0;
 
-err_tcu_clocksource_cleanup:
-	clocksource_unregister(&tcu->cs);
-	clk_disable_unprepare(tcu->cs_clk);
-	clk_put(tcu->cs_clk);
 err_free_ingenic_tcu:
 	kfree(tcu);
 	return ret;
-- 
2.7.4

