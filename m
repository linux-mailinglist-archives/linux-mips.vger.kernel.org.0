Return-Path: <linux-mips+bounces-5607-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D325897D20D
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 09:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 621DF1F21EDF
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 07:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027F05A117;
	Fri, 20 Sep 2024 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3B+6bj2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B8A17C9E;
	Fri, 20 Sep 2024 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726818794; cv=none; b=kirDYk3eqXGmp0tiwa+g2/SQUtQZE67kCJqNC8BxhAGVXZd3bVGrDWRYe/mGqy8CceN+W2e7+/rpUU2TOyfo3MGjaNexj/A8rrfiQEoYQz2aBiAGeeWyj7Bk86A3sya9itdUfcaT1wAfrrpVeSiMeNuqxpb0mPW5bVR+D7X8Z0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726818794; c=relaxed/simple;
	bh=eeK13g47w+IFBb509m1BPpU11t5vkm09BwbCUE0yR0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VakDA0MSxnDGWRxu0RW/B3tZZPbancgsDKLxVBssO+13O8KKddAt8jx79DiKfuS91wy4tQe/8WN5GirZO1VDjok159IyOAHo24xmHR2D5Cq1IC2WHhd+LobF60PosSQ3kow7aBNI9IfK+JHeTCFVs2mYK+R+t4MJHXq48mhcUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3B+6bj2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42e5e758093so14980115e9.1;
        Fri, 20 Sep 2024 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726818791; x=1727423591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bb1MBPLpzmsmwHPmevdCgN7+Gg+hPpfRNj9sIsjVy0=;
        b=X3B+6bj2blc8X0BM3SKYeATVfqcIX2BYgnb6gFJ8jSWHXJ14nXE8+yvf8BPgjutuZp
         N6diOb4kp/EhzHx2lyVXW+HpkqW8apYsFlplcc3jbvfH4gArgpbXQ5tWSgeDbR80eAzV
         25UGIKD3E9Z5hgoR8zjS57yrTN2skoVcdzMcCcJmXGICZhG2EBzRiHgPOIwoG7/SS8sC
         U6gIVLFqbcjU3uj2sw8XrUz9SI3/XdhfIs5BiBIbPrvkDRPVi8XP6Oc54CAhATCosQMH
         W84I1U3jJlTFoJNxUeups2D+7OeGUUSERiYDWJDtLCwiw++cufAozuKaBpyqmSwXA2Hf
         JcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726818791; x=1727423591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bb1MBPLpzmsmwHPmevdCgN7+Gg+hPpfRNj9sIsjVy0=;
        b=EfTFd06XM7KAYISx0uGVlrWTQ7E32ahq1Y+8qMbYtf/Ewco3cWFMeV8WwiBpzoRT4w
         1wp7X2y+jiNy+QgCm3m0uwwYg05SApDJl9N0rGsVfg1QKYpCRyw8nnlTsVbp8dWuxhMr
         PJWU40dJuasBq79dLG7CGfc8H2A6jUGV1vIOjK4bpP1B81320eE2EFYIo3neq33bSgzh
         p/TRf75S6AIcNI+ppuZPIeVdqibD840eHsa0TjYSCj+zfrbcEG9xBPIe8s6/KbICVJDq
         Mdo8jk6+oyc6Obf6xtNMjMLnUz18hIfZhlO+CYXa1gMZeQlwUls7ThfDnx5ZjS/2KrE9
         mvmg==
X-Forwarded-Encrypted: i=1; AJvYcCUHqpHZmqzzScxgZNQ7DT88OYN0B5sCuJ0LMXHnH0RAYl2JC7O82Fr+n2lqMl0QQVA03E4kGQTcQmMEzGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sAgBskqbLAvq+9ApZu32ruQM/nYiEYZGiwFoA6GkD+BJ+Mbe
	II1JiT/Eenr0BxGpmoF5wOD7suICBk8DWp1IXv1NmqWxfLUSzaWYjyC3Bw==
X-Google-Smtp-Source: AGHT+IFPK2ruG0da4VoubzCqvAnyVcI63/P5PEfAXYXVW5fSUfJDamQ9XNsvDZk3KpYJ26UVAV6Lzw==
X-Received: by 2002:a05:600c:1e25:b0:42c:b6e4:e3ac with SMTP id 5b1f17b1804b1-42e7abe228fmr14637665e9.3.1726818790568;
        Fri, 20 Sep 2024 00:53:10 -0700 (PDT)
Received: from localhost.localdomain (201.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afbfbfbsm15178465e9.22.2024.09.20.00.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:53:09 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-mips@vger.kernel.org
Cc: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	john@phrozen.org,
	linux-kernel@vger.kernel.org,
	yangshiji66@outlook.com
Subject: [PATCH 1/2] clocksource: Add Ralink System Tick Counter driver
Date: Fri, 20 Sep 2024 09:53:05 +0200
Message-Id: <20240920075306.704665-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
References: <20240920075306.704665-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

System Tick Counter is present on Ralink SoCs RT3352 and MT7620. This
driver has been in 'arch/mips/ralink' directory since the beggining of
Ralink architecture support. However, it can be moved into a more proper
place in 'drivers/clocksource'. Hence add it here adding also support for
compile test targets.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/clocksource/Kconfig        |  10 ++
 drivers/clocksource/Makefile       |   1 +
 drivers/clocksource/timer-ralink.c | 150 +++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 drivers/clocksource/timer-ralink.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 95dd4660b5b6..50339f4d3201 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -753,4 +753,14 @@ config EP93XX_TIMER
 	  Enables support for the Cirrus Logic timer block
 	  EP93XX.
 
+config CLKSRC_RALINK
+	bool "Ralink System Tick Counter"
+	depends on SOC_RT305X || SOC_MT7620 || COMPILE_TEST
+	default y if SOC_RT305X || SOC_MT7620
+	select CLKSRC_MMIO
+	select TIMER_OF
+	help
+	  Enables support for system tick counter present on
+	  Ralink SoCs RT3352 and MT7620.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 22743785299e..c9214afcb712 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -91,3 +91,4 @@ obj-$(CONFIG_GOLDFISH_TIMER)		+= timer-goldfish.o
 obj-$(CONFIG_GXP_TIMER)			+= timer-gxp.o
 obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+= timer-loongson1-pwm.o
 obj-$(CONFIG_EP93XX_TIMER)		+= timer-ep93xx.o
+obj-$(CONFIG_CLKSRC_RALINK)		+= timer-ralink.o
diff --git a/drivers/clocksource/timer-ralink.c b/drivers/clocksource/timer-ralink.c
new file mode 100644
index 000000000000..6ecdb4228f76
--- /dev/null
+++ b/drivers/clocksource/timer-ralink.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ralink System Tick Counter driver present on RT3352 and MT7620 SoCs.
+ *
+ * Copyright (C) 2013 by John Crispin <john@phrozen.org>
+ */
+
+#include <linux/clockchips.h>
+#include <linux/clocksource.h>
+#include <linux/interrupt.h>
+#include <linux/reset.h>
+#include <linux/init.h>
+#include <linux/time.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+
+#define SYSTICK_FREQ		(50 * 1000)
+
+#define SYSTICK_CONFIG		0x00
+#define SYSTICK_COMPARE		0x04
+#define SYSTICK_COUNT		0x08
+
+/* route systick irq to mips irq 7 instead of the r4k-timer */
+#define CFG_EXT_STK_EN		0x2
+/* enable the counter */
+#define CFG_CNT_EN		0x1
+
+struct systick_device {
+	void __iomem *membase;
+	struct clock_event_device dev;
+	int irq_requested;
+	int freq_scale;
+};
+
+static int systick_set_oneshot(struct clock_event_device *evt);
+static int systick_shutdown(struct clock_event_device *evt);
+
+static int systick_next_event(unsigned long delta,
+			      struct clock_event_device *evt)
+{
+	struct systick_device *sdev;
+	u32 count;
+
+	sdev = container_of(evt, struct systick_device, dev);
+	count = ioread32(sdev->membase + SYSTICK_COUNT);
+	count = (count + delta) % SYSTICK_FREQ;
+	iowrite32(count, sdev->membase + SYSTICK_COMPARE);
+
+	return 0;
+}
+
+static void systick_event_handler(struct clock_event_device *dev)
+{
+	/* noting to do here */
+}
+
+static irqreturn_t systick_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *dev = (struct clock_event_device *)dev_id;
+
+	dev->event_handler(dev);
+
+	return IRQ_HANDLED;
+}
+
+static struct systick_device systick = {
+	.dev = {
+		/*
+		 * cevt-r4k uses 300, make sure systick
+		 * gets used if available
+		 */
+		.rating			= 310,
+		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.set_next_event		= systick_next_event,
+		.set_state_shutdown	= systick_shutdown,
+		.set_state_oneshot	= systick_set_oneshot,
+		.event_handler		= systick_event_handler,
+	},
+};
+
+static int systick_shutdown(struct clock_event_device *evt)
+{
+	struct systick_device *sdev;
+
+	sdev = container_of(evt, struct systick_device, dev);
+
+	if (sdev->irq_requested)
+		free_irq(systick.dev.irq, &systick.dev);
+	sdev->irq_requested = 0;
+	iowrite32(0, systick.membase + SYSTICK_CONFIG);
+
+	return 0;
+}
+
+static int systick_set_oneshot(struct clock_event_device *evt)
+{
+	const char *name = systick.dev.name;
+	struct systick_device *sdev;
+	int irq = systick.dev.irq;
+
+	sdev = container_of(evt, struct systick_device, dev);
+
+	if (!sdev->irq_requested) {
+		if (request_irq(irq, systick_interrupt,
+				IRQF_PERCPU | IRQF_TIMER, name, &systick.dev))
+			pr_err("Failed to request irq %d (%s)\n", irq, name);
+	}
+	sdev->irq_requested = 1;
+	iowrite32(CFG_EXT_STK_EN | CFG_CNT_EN,
+		  systick.membase + SYSTICK_CONFIG);
+
+	return 0;
+}
+
+static int __init ralink_systick_init(struct device_node *np)
+{
+	int ret;
+
+	systick.membase = of_iomap(np, 0);
+	if (!systick.membase)
+		return -ENXIO;
+
+	systick.dev.name = np->name;
+	clockevents_calc_mult_shift(&systick.dev, SYSTICK_FREQ, 60);
+	systick.dev.max_delta_ns = clockevent_delta2ns(0x7fff, &systick.dev);
+	systick.dev.max_delta_ticks = 0x7fff;
+	systick.dev.min_delta_ns = clockevent_delta2ns(0x3, &systick.dev);
+	systick.dev.min_delta_ticks = 0x3;
+	systick.dev.irq = irq_of_parse_and_map(np, 0);
+	if (!systick.dev.irq) {
+		pr_err("%pOFn: request_irq failed", np);
+		return -EINVAL;
+	}
+
+	ret = clocksource_mmio_init(systick.membase + SYSTICK_COUNT, np->name,
+				    SYSTICK_FREQ, 301, 16,
+				    clocksource_mmio_readl_up);
+	if (ret)
+		return ret;
+
+	clockevents_register_device(&systick.dev);
+
+	pr_info("%pOFn: running - mult: %d, shift: %d\n",
+			np, systick.dev.mult, systick.dev.shift);
+
+	return 0;
+}
+
+TIMER_OF_DECLARE(systick, "ralink,cevt-systick", ralink_systick_init);
-- 
2.25.1


