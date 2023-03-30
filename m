Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAC76D00E7
	for <lists+linux-mips@lfdr.de>; Thu, 30 Mar 2023 12:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjC3KPs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Mar 2023 06:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjC3KPp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Mar 2023 06:15:45 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7705386A4;
        Thu, 30 Mar 2023 03:15:37 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id w4so17587067plg.9;
        Thu, 30 Mar 2023 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680171336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ts2/ElaIRA6lENxvh0AhG/MtgyMpqHnSNLkgv8uD0JA=;
        b=aUjuiRslGEiIE2leLHs9IF/OmS8tcCXkGMC6hYyY5tSf2CHPjbLaQrcfqlvJyaDa6v
         v0EqDRusmroNQGhpibc878lXK83QPu95P9waE606ubS7a8Hr6Si4I4qRwWHxbJblqXhr
         VWu+6OTVDhXoJPyJiijP8tUY5UgfMGsKppmDh5VL3QgZ+Qgtwuz8yQo9QiGC7FUyT/aC
         N/UTbPYE0pd6KmeHn7mY7CDKMRAmZFMnvEuxWgNsyRqg94dt6SePubGc1gWM8a7xdCC0
         ycuwh3CAU8FeRAxEQ4FGvxNNtviXiWmdIkCY8iLsOI+td19EbtRvDzksSD4KF1OLlYLi
         GH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680171336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ts2/ElaIRA6lENxvh0AhG/MtgyMpqHnSNLkgv8uD0JA=;
        b=pJsBlgrFhV83AHOEV2UKfGcr+DULvGnd/Fmseox+0bzO+cuICXqzchxg35O8V1kx7t
         HiYMRfy1840QFbsKfpKO6xP2WHdvaolzmDsfQ4L6WuH+N8uh2G0Bgp82xtBHv1WnnPCH
         9iGUDHfGKe5ZxyFML2j4vIBMFX4hUmwDV421y/N36KZGdq9TJbYNGDrz/rA2shsrPANt
         nk7ZmlLhhcOoFOdiXr5sobgR0geSoH+4vOtI2gRweCN9/p+zaZarqoKVMAyfN21Aj9AT
         IqYyBOTOq0wNxEYlrvg6Wfm5P3eWuCgATKIAwcYKtn9od8mg4aTrvqkJbjfybXMHjCjv
         fmUw==
X-Gm-Message-State: AO0yUKW/xis8DZYxjUQCmhiG+qFKPW0ceBXNhqu5gaegD3trODuyQOiK
        7H3I4DioU5jv4tZ7YpUQQfKkS/9cyo7pPw==
X-Google-Smtp-Source: AK7set+HnhZxELjLwQxHaJXkJq4bEIUv5HgRp6GsHXZhJ58+AoFHKSMT65HuLo5fPvWj3vuksMkGfw==
X-Received: by 2002:a05:6a20:92a4:b0:db:d9b6:7fad with SMTP id q36-20020a056a2092a400b000dbd9b67fadmr20613310pzg.6.1680171336259;
        Thu, 30 Mar 2023 03:15:36 -0700 (PDT)
Received: from kelvin-ThinkPad-L14-Gen-1.. (94.130.220.35.bc.googleusercontent.com. [35.220.130.94])
        by smtp.gmail.com with ESMTPSA id x18-20020aa793b2000000b00627e55f383dsm22469210pff.3.2023.03.30.03.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 03:15:35 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Keguang Zhang <keguang.zhang@gmail.com>
Subject: [PATCH v2 3/3] clocksource: loongson1: Move PWM timer to clocksource framework
Date:   Thu, 30 Mar 2023 18:15:06 +0800
Message-Id: <20230330101506.545040-4-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330101506.545040-1-keguang.zhang@gmail.com>
References: <20230330101506.545040-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch moves most part of arch/mips/loongson32/common/time.c
into drivers/clocksource.

Adapt the driver to clocksource framework and
updates the Kconfig/Makefile options.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
V1 -> V2: None
---
 drivers/clocksource/Kconfig               |   9 +
 drivers/clocksource/Makefile              |   1 +
 drivers/clocksource/timer-loongson1-pwm.c | 236 ++++++++++++++++++++++
 3 files changed, 246 insertions(+)
 create mode 100644 drivers/clocksource/timer-loongson1-pwm.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 5fc8f0e7fb38..6e37b26d532d 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -603,6 +603,15 @@ config TIMER_IMX_SYS_CTR
 	  Enable this option to use i.MX system counter timer as a
 	  clockevent.
 
+config CLKSRC_LOONGSON1_PWM
+	bool "Clocksource using Loongson1 PWM"
+	depends on MACH_LOONGSON32 || COMPILE_TEST
+	select MIPS_EXTERNAL_TIMER
+	select TIMER_OF
+	help
+	  Enable this option to use Loongson1 PWM timer as clocksource
+	  instead of the performance counter.
+
 config CLKSRC_ST_LPC
 	bool "Low power clocksource found in the LPC" if COMPILE_TEST
 	select TIMER_OF if OF
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 64ab547de97b..f969a9eedfca 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -88,3 +88,4 @@ obj-$(CONFIG_MICROCHIP_PIT64B)		+= timer-microchip-pit64b.o
 obj-$(CONFIG_MSC313E_TIMER)		+= timer-msc313e.o
 obj-$(CONFIG_GOLDFISH_TIMER)		+= timer-goldfish.o
 obj-$(CONFIG_GXP_TIMER)			+= timer-gxp.o
+obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+= timer-loongson1-pwm.o
diff --git a/drivers/clocksource/timer-loongson1-pwm.c b/drivers/clocksource/timer-loongson1-pwm.c
new file mode 100644
index 000000000000..fe94c08afce2
--- /dev/null
+++ b/drivers/clocksource/timer-loongson1-pwm.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Clocksource driver for Loongson-1 SoC
+ *
+ * Copyright (c) 2023 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+#include <linux/clockchips.h>
+#include <linux/interrupt.h>
+#include <linux/sizes.h>
+#include "timer-of.h"
+
+/* Loongson-1 PWM Timer Register Definitions */
+#define PWM_CNTR		0x0
+#define PWM_HRC			0x4
+#define PWM_LRC			0x8
+#define PWM_CTRL		0xc
+
+/* PWM Control Register Bits */
+#define INT_LRC_EN		BIT(11)
+#define INT_HRC_EN		BIT(10)
+#define CNTR_RST		BIT(7)
+#define INT_SR			BIT(6)
+#define INT_EN			BIT(5)
+#define PWM_SINGLE		BIT(4)
+#define PWM_OE			BIT(3)
+#define CNT_EN			BIT(0)
+
+#define CNTR_WIDTH		24
+
+DEFINE_RAW_SPINLOCK(ls1x_timer_lock);
+
+struct ls1x_clocksource {
+	void __iomem *reg_base;
+	unsigned long ticks_per_jiffy;
+	struct clocksource clksrc;
+};
+
+static inline struct ls1x_clocksource *to_ls1x_clksrc(struct clocksource *c)
+{
+	return container_of(c, struct ls1x_clocksource, clksrc);
+}
+
+static inline void ls1x_pwmtimer_set_period(unsigned int period,
+					    struct timer_of *to)
+{
+	writel(period, timer_of_base(to) + PWM_LRC);
+	writel(period, timer_of_base(to) + PWM_HRC);
+}
+
+static inline void ls1x_pwmtimer_clear(struct timer_of *to)
+{
+	writel(0, timer_of_base(to) + PWM_CNTR);
+}
+
+static inline void ls1x_pwmtimer_start(struct timer_of *to)
+{
+	writel((INT_EN | PWM_OE | CNT_EN), timer_of_base(to) + PWM_CTRL);
+}
+
+static inline void ls1x_pwmtimer_stop(struct timer_of *to)
+{
+	writel(0, timer_of_base(to) + PWM_CTRL);
+}
+
+static inline void ls1x_pwmtimer_irq_ack(struct timer_of *to)
+{
+	int val;
+
+	val = readl(timer_of_base(to) + PWM_CTRL);
+	val |= INT_SR;
+	writel(val, timer_of_base(to) + PWM_CTRL);
+}
+
+static irqreturn_t ls1x_clockevent_isr(int irq, void *dev_id)
+{
+	struct clock_event_device *clkevt = dev_id;
+	struct timer_of *to = to_timer_of(clkevt);
+
+	ls1x_pwmtimer_irq_ack(to);
+	ls1x_pwmtimer_clear(to);
+	ls1x_pwmtimer_start(to);
+
+	clkevt->event_handler(clkevt);
+
+	return IRQ_HANDLED;
+}
+
+static int ls1x_clockevent_set_state_periodic(struct clock_event_device *clkevt)
+{
+	struct timer_of *to = to_timer_of(clkevt);
+
+	raw_spin_lock(&ls1x_timer_lock);
+	ls1x_pwmtimer_set_period(timer_of_period(to), to);
+	ls1x_pwmtimer_clear(to);
+	ls1x_pwmtimer_start(to);
+	raw_spin_unlock(&ls1x_timer_lock);
+
+	return 0;
+}
+
+static int ls1x_clockevent_tick_resume(struct clock_event_device *clkevt)
+{
+	raw_spin_lock(&ls1x_timer_lock);
+	ls1x_pwmtimer_start(to_timer_of(clkevt));
+	raw_spin_unlock(&ls1x_timer_lock);
+
+	return 0;
+}
+
+static int ls1x_clockevent_set_state_shutdown(struct clock_event_device *clkevt)
+{
+	raw_spin_lock(&ls1x_timer_lock);
+	ls1x_pwmtimer_stop(to_timer_of(clkevt));
+	raw_spin_unlock(&ls1x_timer_lock);
+
+	return 0;
+}
+
+static int ls1x_clockevent_set_next(unsigned long evt,
+				    struct clock_event_device *clkevt)
+{
+	struct timer_of *to = to_timer_of(clkevt);
+
+	raw_spin_lock(&ls1x_timer_lock);
+	ls1x_pwmtimer_set_period(evt, to);
+	ls1x_pwmtimer_clear(to);
+	ls1x_pwmtimer_start(to);
+	raw_spin_unlock(&ls1x_timer_lock);
+
+	return 0;
+}
+
+static struct timer_of ls1x_to = {
+	.flags = TIMER_OF_IRQ | TIMER_OF_BASE | TIMER_OF_CLOCK,
+	.clkevt = {
+		.name			= "ls1x-pwmtimer",
+		.features		= CLOCK_EVT_FEAT_PERIODIC |
+					  CLOCK_EVT_FEAT_ONESHOT,
+		.rating			= 300,
+		.set_next_event		= ls1x_clockevent_set_next,
+		.set_state_periodic	= ls1x_clockevent_set_state_periodic,
+		.set_state_oneshot	= ls1x_clockevent_set_state_shutdown,
+		.set_state_shutdown	= ls1x_clockevent_set_state_shutdown,
+		.tick_resume		= ls1x_clockevent_tick_resume,
+	},
+	.of_irq = {
+		.handler		= ls1x_clockevent_isr,
+		.flags			= IRQF_TIMER,
+	},
+};
+
+/*
+ * Since the PWM timer overflows every two ticks, its not very useful
+ * to just read by itself. So use jiffies to emulate a free
+ * running counter:
+ */
+static u64 ls1x_clocksource_read(struct clocksource *cs)
+{
+	struct ls1x_clocksource *ls1x_cs = to_ls1x_clksrc(cs);
+	unsigned long flags;
+	int count;
+	u32 jifs;
+	static int old_count;
+	static u32 old_jifs;
+
+	raw_spin_lock_irqsave(&ls1x_timer_lock, flags);
+	/*
+	 * Although our caller may have the read side of xtime_lock,
+	 * this is now a seqlock, and we are cheating in this routine
+	 * by having side effects on state that we cannot undo if
+	 * there is a collision on the seqlock and our caller has to
+	 * retry.  (Namely, old_jifs and old_count.)  So we must treat
+	 * jiffies as volatile despite the lock.  We read jiffies
+	 * before latching the timer count to guarantee that although
+	 * the jiffies value might be older than the count (that is,
+	 * the counter may underflow between the last point where
+	 * jiffies was incremented and the point where we latch the
+	 * count), it cannot be newer.
+	 */
+	jifs = jiffies;
+	/* read the count */
+	count = readl(ls1x_cs->reg_base + PWM_CNTR);
+
+	/*
+	 * It's possible for count to appear to go the wrong way for this
+	 * reason:
+	 *
+	 *  The timer counter underflows, but we haven't handled the resulting
+	 *  interrupt and incremented jiffies yet.
+	 *
+	 * Previous attempts to handle these cases intelligently were buggy, so
+	 * we just do the simple thing now.
+	 */
+	if (count < old_count && jifs == old_jifs)
+		count = old_count;
+
+	old_count = count;
+	old_jifs = jifs;
+
+	raw_spin_unlock_irqrestore(&ls1x_timer_lock, flags);
+
+	return (u64)(jifs * ls1x_cs->ticks_per_jiffy) + count;
+}
+
+static struct ls1x_clocksource ls1x_clocksource = {
+	.clksrc = {
+		.name           = "ls1x-pwmtimer",
+		.rating		= 300,
+		.read           = ls1x_clocksource_read,
+		.mask           = CLOCKSOURCE_MASK(CNTR_WIDTH),
+		.flags          = CLOCK_SOURCE_IS_CONTINUOUS,
+	},
+};
+
+static int __init ls1x_pwm_clocksource_init(struct device_node *np)
+{
+	struct timer_of *to = &ls1x_to;
+	int ret;
+
+	ret = timer_of_init(np, to);
+	if (ret)
+		return ret;
+
+	clockevents_config_and_register(&to->clkevt, timer_of_rate(to),
+					0x1, GENMASK(CNTR_WIDTH - 1, 0));
+
+	ls1x_clocksource.reg_base = timer_of_base(to);
+	ls1x_clocksource.ticks_per_jiffy = timer_of_period(to);
+
+	return clocksource_register_hz(&ls1x_clocksource.clksrc,
+				       timer_of_rate(to));
+}
+
+TIMER_OF_DECLARE(ls1x_pwm_clocksource, "loongson,ls1x-pwmtimer",
+		 ls1x_pwm_clocksource_init);
-- 
2.34.1

