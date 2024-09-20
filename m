Return-Path: <linux-mips+bounces-5608-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4F97D20F
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 09:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916411C2263A
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 07:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B68376035;
	Fri, 20 Sep 2024 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHcTgol+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1B26F2FE;
	Fri, 20 Sep 2024 07:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726818798; cv=none; b=mK9/uSEfIbjqtNbEJ2umWzT3ay67gvZZ1ct09gs8TW8C99eDFguK5wU9dV8cOgHZZwJu/reeewP+UTJN5F97Xa7NDfE73OzmJnRQyLjzBGH/CIQTWexLcE3XveU3sVrywj1+4jFRF2MaRoZKcftQy9hDHnBfjfciAQyZ0mybKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726818798; c=relaxed/simple;
	bh=T1W6L5QpnQKpwKjC1poc2NjFmxjZ471D3fP2Aphip1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FnZfRjNo0nZ/P6f0W+lKy628X1ZfMtE7Pnt26C2Stcpfd8ES8WkpiwIE58kPdrZqF4ff3q/Dp4WeP3xsUEGppBqfSC6VtYNlI5T4bIx8M8lNhRv+wsjT9KSpxxmD8khZhfCrsDS0BWXyNIaaUtxUSCGIARdlqq2OTzjIY8t/eX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHcTgol+; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f763e9e759so20083581fa.3;
        Fri, 20 Sep 2024 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726818793; x=1727423593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhugxSGuV6ZvqI3s0b5MXFKYtefsB4pkxXmNwlWj1fo=;
        b=eHcTgol+Zk7vQllRrTE1s9/xVjmRmyiJk6MQrSYR+OukweaOtVNA5kl2HG8BkpF6Wa
         kdSRaxdkg95J/y2LSnXn2eRN2a5pOT0mluW0DXwiYLJDfC6M1a+t7ulLzvnBNZkGt07y
         L7bYt6H0bbMaBCVpM+OAPcHSgkNAxN22jWnBi84WJHordo+0tm8UVhQGUJi/F0f+Lnxk
         C7CPP7OQqrL4wDmaUhTAqLf46is6obQqybSczRuJhgI9pFL8HO9/vrjS/eee8JP+6xnG
         drxQDB+GGEyPSJgrDyEJmTePEF7leLaa1RA+ELpWjOFbiIQQTYmLtBd5IIxWuWSKIMFq
         T1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726818793; x=1727423593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhugxSGuV6ZvqI3s0b5MXFKYtefsB4pkxXmNwlWj1fo=;
        b=jUpu4JO8KsFzGOFhlgUioeRYndjmUUdjGfkxf02aJQFzBr32O/I9IzTM8ku+PmoBcV
         Ev2MqNXmInm3/U+6ckL6BsIAz2wdrhR9pUAPHjfdmvHPZr4n6brMEr6x9ZSB239bJwMi
         Zvcq/RZEdXOfiyw9geGBLAq/4AEIYyAUIMrDxNbsee9baNSVu5y/qEEaSgkz05iiKG7S
         FxK0TeM3zpxa8QdWUXlM5Pho8VXJfxx5sE+ULYq87OsLSx/d2fkZ8t0hRAfzxrKcfbGt
         nLrKKpqHoCboy8+iCqFxgpe2w+dAyZ+6BWwPH/9yfJSbCbyxJyWV5uQ/ULCxK2m7LAup
         tDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDh7IL5xSQLtaT3JQ+qIe+ie1sUJhFREjAqP60XiV4z9Nv2D3PfT4pz6/kyMB6AfzFVAVX7Ye4S+uHpvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdP5siYMphgnLJN/Or5b/qWC70Uf9IWgL17TWmj0Xsh0ncmtP6
	Rmo1FOShikW3Z0Ybi+xMplmOU5SzZor7ydOPoZMm+vSdkzW7tFeFrPm8AA==
X-Google-Smtp-Source: AGHT+IG8WOndB0FwjkumAaCBnQpmRu7CyX2FaSkFZM0+mzqe+usnKcJK0+AdYUSoG5HdowTVkXvFGw==
X-Received: by 2002:a05:651c:542:b0:2f7:4b90:204b with SMTP id 38308e7fff4ca-2f7cb319284mr11382871fa.12.1726818792590;
        Fri, 20 Sep 2024 00:53:12 -0700 (PDT)
Received: from localhost.localdomain (201.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afbfbfbsm15178465e9.22.2024.09.20.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:53:11 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-mips@vger.kernel.org
Cc: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	john@phrozen.org,
	linux-kernel@vger.kernel.org,
	yangshiji66@outlook.com
Subject: [PATCH 2/2] MIPS: ralink: remove System Tick Counter driver
Date: Fri, 20 Sep 2024 09:53:06 +0200
Message-Id: <20240920075306.704665-3-sergio.paracuellos@gmail.com>
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

This driver has been moved into a more accurate place in the kernel tree
in 'drivers/clocksource' directory as 'timer-ralink.c'. Hence, remove it
from here so we can  reduce architecture code folder.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/Kconfig       |   7 --
 arch/mips/ralink/Makefile      |   2 -
 arch/mips/ralink/cevt-rt3352.c | 153 ---------------------------------
 3 files changed, 162 deletions(-)
 delete mode 100644 arch/mips/ralink/cevt-rt3352.c

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 08c012a2591f..910d059ec70b 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -1,13 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 if RALINK
 
-config CLKEVT_RT3352
-	bool
-	depends on SOC_RT305X || SOC_MT7620
-	default y
-	select TIMER_OF
-	select CLKSRC_MMIO
-
 config RALINK_ILL_ACC
 	bool
 	depends on SOC_RT305X
diff --git a/arch/mips/ralink/Makefile b/arch/mips/ralink/Makefile
index 26fabbdea1f1..0c109eae1953 100644
--- a/arch/mips/ralink/Makefile
+++ b/arch/mips/ralink/Makefile
@@ -10,8 +10,6 @@ ifndef CONFIG_MIPS_GIC
 	obj-y += clk.o timer.o
 endif
 
-obj-$(CONFIG_CLKEVT_RT3352) += cevt-rt3352.o
-
 obj-$(CONFIG_RALINK_ILL_ACC) += ill_acc.o
 
 obj-$(CONFIG_IRQ_INTC) += irq.o
diff --git a/arch/mips/ralink/cevt-rt3352.c b/arch/mips/ralink/cevt-rt3352.c
deleted file mode 100644
index 269d4877d120..000000000000
--- a/arch/mips/ralink/cevt-rt3352.c
+++ /dev/null
@@ -1,153 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 by John Crispin <john@phrozen.org>
- */
-
-#include <linux/clockchips.h>
-#include <linux/clocksource.h>
-#include <linux/interrupt.h>
-#include <linux/reset.h>
-#include <linux/init.h>
-#include <linux/time.h>
-#include <linux/of.h>
-#include <linux/of_irq.h>
-#include <linux/of_address.h>
-
-#include <asm/mach-ralink/ralink_regs.h>
-
-#define SYSTICK_FREQ		(50 * 1000)
-
-#define SYSTICK_CONFIG		0x00
-#define SYSTICK_COMPARE		0x04
-#define SYSTICK_COUNT		0x08
-
-/* route systick irq to mips irq 7 instead of the r4k-timer */
-#define CFG_EXT_STK_EN		0x2
-/* enable the counter */
-#define CFG_CNT_EN		0x1
-
-struct systick_device {
-	void __iomem *membase;
-	struct clock_event_device dev;
-	int irq_requested;
-	int freq_scale;
-};
-
-static int systick_set_oneshot(struct clock_event_device *evt);
-static int systick_shutdown(struct clock_event_device *evt);
-
-static int systick_next_event(unsigned long delta,
-				struct clock_event_device *evt)
-{
-	struct systick_device *sdev;
-	u32 count;
-
-	sdev = container_of(evt, struct systick_device, dev);
-	count = ioread32(sdev->membase + SYSTICK_COUNT);
-	count = (count + delta) % SYSTICK_FREQ;
-	iowrite32(count, sdev->membase + SYSTICK_COMPARE);
-
-	return 0;
-}
-
-static void systick_event_handler(struct clock_event_device *dev)
-{
-	/* noting to do here */
-}
-
-static irqreturn_t systick_interrupt(int irq, void *dev_id)
-{
-	struct clock_event_device *dev = (struct clock_event_device *) dev_id;
-
-	dev->event_handler(dev);
-
-	return IRQ_HANDLED;
-}
-
-static struct systick_device systick = {
-	.dev = {
-		/*
-		 * cevt-r4k uses 300, make sure systick
-		 * gets used if available
-		 */
-		.rating			= 310,
-		.features		= CLOCK_EVT_FEAT_ONESHOT,
-		.set_next_event		= systick_next_event,
-		.set_state_shutdown	= systick_shutdown,
-		.set_state_oneshot	= systick_set_oneshot,
-		.event_handler		= systick_event_handler,
-	},
-};
-
-static int systick_shutdown(struct clock_event_device *evt)
-{
-	struct systick_device *sdev;
-
-	sdev = container_of(evt, struct systick_device, dev);
-
-	if (sdev->irq_requested)
-		free_irq(systick.dev.irq, &systick.dev);
-	sdev->irq_requested = 0;
-	iowrite32(0, systick.membase + SYSTICK_CONFIG);
-
-	return 0;
-}
-
-static int systick_set_oneshot(struct clock_event_device *evt)
-{
-	const char *name = systick.dev.name;
-	struct systick_device *sdev;
-	int irq = systick.dev.irq;
-
-	sdev = container_of(evt, struct systick_device, dev);
-
-	if (!sdev->irq_requested) {
-		if (request_irq(irq, systick_interrupt,
-				IRQF_PERCPU | IRQF_TIMER, name, &systick.dev))
-			pr_err("Failed to request irq %d (%s)\n", irq, name);
-	}
-	sdev->irq_requested = 1;
-	iowrite32(CFG_EXT_STK_EN | CFG_CNT_EN,
-		  systick.membase + SYSTICK_CONFIG);
-
-	return 0;
-}
-
-static int __init ralink_systick_init(struct device_node *np)
-{
-	int ret;
-
-	systick.membase = of_iomap(np, 0);
-	if (!systick.membase)
-		return -ENXIO;
-
-	systick.dev.name = np->name;
-	clockevents_calc_mult_shift(&systick.dev, SYSTICK_FREQ, 60);
-	systick.dev.max_delta_ns = clockevent_delta2ns(0x7fff, &systick.dev);
-	systick.dev.max_delta_ticks = 0x7fff;
-	systick.dev.min_delta_ns = clockevent_delta2ns(0x3, &systick.dev);
-	systick.dev.min_delta_ticks = 0x3;
-	systick.dev.irq = irq_of_parse_and_map(np, 0);
-	if (!systick.dev.irq) {
-		pr_err("%pOFn: request_irq failed", np);
-		return -EINVAL;
-	}
-
-	ret = clocksource_mmio_init(systick.membase + SYSTICK_COUNT, np->name,
-				    SYSTICK_FREQ, 301, 16,
-				    clocksource_mmio_readl_up);
-	if (ret)
-		return ret;
-
-	clockevents_register_device(&systick.dev);
-
-	pr_info("%pOFn: running - mult: %d, shift: %d\n",
-			np, systick.dev.mult, systick.dev.shift);
-
-	return 0;
-}
-
-TIMER_OF_DECLARE(systick, "ralink,cevt-systick", ralink_systick_init);
-- 
2.25.1


