Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 730475BF4A
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 17:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbfGAPO4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 11:14:56 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:57636 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730218AbfGAPOp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jul 2019 11:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561994082; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QRQpPFhAJVODV1HjHxFlISqQeuxoBlgt2lBqcNoa1Z0=;
        b=biU6+DuHNf+ht80xoArhECFSIqv1jnlXs4MBaPLlW4qI2Gq/pYKDTRmi2PzL+R+idVjgI8
        hLbiZAZGFSSXoS0igBfLwEIqpzuKdk+zURz8KPrjiYse91svkVLBE2JSJWJjHx1c6V7am0
        G1b4B5XkWnfT1EOAAUXVJH6a1hKC5uc=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Lee Jones <lee.jones@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v14 13/13] MIPS: jz4740: Drop obsolete code
Date:   Mon,  1 Jul 2019 17:14:10 +0200
Message-Id: <20190701151410.23127-14-paul@crapouillou.net>
In-Reply-To: <20190701151410.23127-1-paul@crapouillou.net>
References: <20190701151410.23127-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The old clocksource/timer platform code is now obsoleted by the newly
introduced TCU drivers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v5: New patch
    
    v6-v11: No change
    
    v12: Only remove clocksource code. The rest will eventually be
    	 removed in a future patchset when the PWM/watchdog drivers
    	 are updated.
    
    v13-v14: No change

 arch/mips/jz4740/time.c | 154 +---------------------------------------
 1 file changed, 2 insertions(+), 152 deletions(-)

diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
index a3260c754e65..5476899f0882 100644
--- a/arch/mips/jz4740/time.c
+++ b/arch/mips/jz4740/time.c
@@ -4,164 +4,14 @@
  *  JZ4740 platform time support
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/time.h>
+#include <linux/clocksource.h>
 
-#include <linux/clockchips.h>
-#include <linux/sched_clock.h>
-
-#include <asm/mach-jz4740/clock.h>
-#include <asm/mach-jz4740/irq.h>
 #include <asm/mach-jz4740/timer.h>
-#include <asm/time.h>
-
-#include "clock.h"
-
-#define TIMER_CLOCKEVENT 0
-#define TIMER_CLOCKSOURCE 1
-
-static uint16_t jz4740_jiffies_per_tick;
-
-static u64 jz4740_clocksource_read(struct clocksource *cs)
-{
-	return jz4740_timer_get_count(TIMER_CLOCKSOURCE);
-}
-
-static struct clocksource jz4740_clocksource = {
-	.name = "jz4740-timer",
-	.rating = 200,
-	.read = jz4740_clocksource_read,
-	.mask = CLOCKSOURCE_MASK(16),
-	.flags = CLOCK_SOURCE_IS_CONTINUOUS,
-};
-
-static u64 notrace jz4740_read_sched_clock(void)
-{
-	return jz4740_timer_get_count(TIMER_CLOCKSOURCE);
-}
-
-static irqreturn_t jz4740_clockevent_irq(int irq, void *devid)
-{
-	struct clock_event_device *cd = devid;
-
-	jz4740_timer_ack_full(TIMER_CLOCKEVENT);
-
-	if (!clockevent_state_periodic(cd))
-		jz4740_timer_disable(TIMER_CLOCKEVENT);
-
-	cd->event_handler(cd);
-
-	return IRQ_HANDLED;
-}
-
-static int jz4740_clockevent_set_periodic(struct clock_event_device *evt)
-{
-	jz4740_timer_set_count(TIMER_CLOCKEVENT, 0);
-	jz4740_timer_set_period(TIMER_CLOCKEVENT, jz4740_jiffies_per_tick);
-	jz4740_timer_irq_full_enable(TIMER_CLOCKEVENT);
-	jz4740_timer_enable(TIMER_CLOCKEVENT);
-
-	return 0;
-}
-
-static int jz4740_clockevent_resume(struct clock_event_device *evt)
-{
-	jz4740_timer_irq_full_enable(TIMER_CLOCKEVENT);
-	jz4740_timer_enable(TIMER_CLOCKEVENT);
-
-	return 0;
-}
-
-static int jz4740_clockevent_shutdown(struct clock_event_device *evt)
-{
-	jz4740_timer_disable(TIMER_CLOCKEVENT);
-
-	return 0;
-}
-
-static int jz4740_clockevent_set_next(unsigned long evt,
-	struct clock_event_device *cd)
-{
-	jz4740_timer_set_count(TIMER_CLOCKEVENT, 0);
-	jz4740_timer_set_period(TIMER_CLOCKEVENT, evt);
-	jz4740_timer_enable(TIMER_CLOCKEVENT);
-
-	return 0;
-}
-
-static struct clock_event_device jz4740_clockevent = {
-	.name = "jz4740-timer",
-	.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
-	.set_next_event = jz4740_clockevent_set_next,
-	.set_state_shutdown = jz4740_clockevent_shutdown,
-	.set_state_periodic = jz4740_clockevent_set_periodic,
-	.set_state_oneshot = jz4740_clockevent_shutdown,
-	.tick_resume = jz4740_clockevent_resume,
-	.rating = 200,
-#ifdef CONFIG_MACH_JZ4740
-	.irq = JZ4740_IRQ_TCU0,
-#endif
-#if defined(CONFIG_MACH_JZ4770) || defined(CONFIG_MACH_JZ4780)
-	.irq = JZ4780_IRQ_TCU2,
-#endif
-};
-
-static struct irqaction timer_irqaction = {
-	.handler	= jz4740_clockevent_irq,
-	.flags		= IRQF_PERCPU | IRQF_TIMER,
-	.name		= "jz4740-timerirq",
-	.dev_id		= &jz4740_clockevent,
-};
 
 void __init plat_time_init(void)
 {
-	int ret;
-	uint32_t clk_rate;
-	uint16_t ctrl;
-	struct clk *ext_clk;
-
 	of_clk_init(NULL);
 	jz4740_timer_init();
-
-	ext_clk = clk_get(NULL, "ext");
-	if (IS_ERR(ext_clk))
-		panic("unable to get ext clock");
-	clk_rate = clk_get_rate(ext_clk) >> 4;
-	clk_put(ext_clk);
-
-	jz4740_jiffies_per_tick = DIV_ROUND_CLOSEST(clk_rate, HZ);
-
-	clockevent_set_clock(&jz4740_clockevent, clk_rate);
-	jz4740_clockevent.min_delta_ns = clockevent_delta2ns(100, &jz4740_clockevent);
-	jz4740_clockevent.min_delta_ticks = 100;
-	jz4740_clockevent.max_delta_ns = clockevent_delta2ns(0xffff, &jz4740_clockevent);
-	jz4740_clockevent.max_delta_ticks = 0xffff;
-	jz4740_clockevent.cpumask = cpumask_of(0);
-
-	clockevents_register_device(&jz4740_clockevent);
-
-	ret = clocksource_register_hz(&jz4740_clocksource, clk_rate);
-
-	if (ret)
-		printk(KERN_ERR "Failed to register clocksource: %d\n", ret);
-
-	sched_clock_register(jz4740_read_sched_clock, 16, clk_rate);
-
-	setup_irq(jz4740_clockevent.irq, &timer_irqaction);
-
-	ctrl = JZ_TIMER_CTRL_PRESCALE_16 | JZ_TIMER_CTRL_SRC_EXT;
-
-	jz4740_timer_set_ctrl(TIMER_CLOCKEVENT, ctrl);
-	jz4740_timer_set_ctrl(TIMER_CLOCKSOURCE, ctrl);
-
-	jz4740_timer_set_period(TIMER_CLOCKEVENT, jz4740_jiffies_per_tick);
-	jz4740_timer_irq_full_enable(TIMER_CLOCKEVENT);
-
-	jz4740_timer_set_period(TIMER_CLOCKSOURCE, 0xffff);
-
-	jz4740_timer_enable(TIMER_CLOCKEVENT);
-	jz4740_timer_enable(TIMER_CLOCKSOURCE);
+	timer_probe();
 }
-- 
2.21.0.593.g511ec345e18

