Return-Path: <linux-mips+bounces-6537-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DA39B3BF6
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 21:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D01B284F3D
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 20:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0D51E009E;
	Mon, 28 Oct 2024 20:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F96/JeUf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FEF1DFE12;
	Mon, 28 Oct 2024 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147810; cv=none; b=UY7q6A56qzCcARsKYfXRegISCXIL9W5JJ32EuOTinS6wIrm7IE3HcIuOIeQuyTAAW/w/J5jghfN393suWgBVNti8SzjqPtR1D4b38s/20kjozlPcYyQ2S8qRNHeDD8R44UBsL0k1RvTld0Syaf74NYcx2JzY3T7UpW/MertfHyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147810; c=relaxed/simple;
	bh=gcY3/mHQgnlJYc5zS7LbYafvO2xDGU4xAOmkRl8hqg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DDP0qt5UFGObhvICVnbYd8pFaoeqBuSbKwW5yiP18tpXFolkdZyC/3YYWbVKOVXDFL1mt6kZCiM0Dn8yUcUtkaPCsdc5wBHimeV4FMkDg4raQ59MhzhqMpBQoSI4r3iI3xizpXwYsB28GZUnOg/hL717rV/AWw8vtmf7jJpFqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F96/JeUf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso48158685e9.0;
        Mon, 28 Oct 2024 13:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730147806; x=1730752606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVpW/W4SfBkujUwb5ZjorTwgM0E/0K+RNsTEnfWau3Y=;
        b=F96/JeUf5oFKxJRSsGNt1QLyQZGBJRTOrIvssq0PW2SqIRmtma/cIvxiCLgBccaGX8
         sTJBXX+Z66TJz+sgEimE677yaR169nEUGfs/kMVB4qhpNrK9WThXM/nQEk0tfqUol4MA
         A+NKpZWygDVMjblqub3SMheK5ZpoHVGTdKLMgUxHyS73Hohuuy4bJH+1KjvH87rbjKzg
         b4AIoCN5vi7XezQ6ZMKe0OmHDUSjFBqJiJM5NodTZLoLEeKrcaFlNkKiy1VGrPCZs014
         fvO8x4nBnTQdZO/tYcfextpt5Pii9K9STfAKE21oVUkQTxSJKOWVasIkqkjbwUOwVlnw
         fu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730147806; x=1730752606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVpW/W4SfBkujUwb5ZjorTwgM0E/0K+RNsTEnfWau3Y=;
        b=X4lPLdbC3tR+KYsu7wdA9573buTeAhml7kHQ4vSkJXCekEkibQVdgouOTeEL6uhbr3
         YqZ3rgCb0tT/e5QkDieKEXzdiMuC+NWHBzQvHJ92uxrkNnq3HA6vItVZVoPGpSDATuiK
         /n/HrBlid0hRtZa7oEEt8VEjXj0FLxJeFgJ96/tRGTsgZTmpp3PkLoHJq7po6xFEsy/b
         3bsZ4498dimNYWzf6BwHZ4IQdKcCTrTcR9kI4k5t3BJqhcSFk9qcTvfWz2usWZ2meFTs
         PaLz7tma67Ou2evDoirfmqW+1vhwECCL79Z5TvsBmtyI/CMTPGwB1seweLO2hwMA9MVS
         IJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVAWsFIv0MYP+2d2cEIYdnEziyDjKhT3LyoLjOmxVlwDvKIiQP8IOu4Y/9mZf6TPwFIEulnePsxck9I1DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCT2YxS04Fqn02Nfrfhe9WRsdLIuShJfEriRt6GAUDx2vLMlM3
	W6H7+ZwKnBOntvAP5vxbK2panc13aNgzScj7q9vAEUgCEVosicQ97rScBQ==
X-Google-Smtp-Source: AGHT+IE3W4Zgz307myxr6q6ASi3MRrScSwvlaCar9uNLjDQ7J2gbYQhRpvlFuF6VoTtJQn+1ZRzamQ==
X-Received: by 2002:a05:600c:1d09:b0:431:47d4:19c7 with SMTP id 5b1f17b1804b1-4319ac6e976mr85921705e9.3.1730147806216;
        Mon, 28 Oct 2024 13:36:46 -0700 (PDT)
Received: from localhost.localdomain (158.red-88-11-182.dynamicip.rima-tde.net. [88.11.182.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573d47sm123144845e9.3.2024.10.28.13.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 13:36:45 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-mips@vger.kernel.org
Cc: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de,
	john@phrozen.org,
	linux-kernel@vger.kernel.org,
	yangshiji66@outlook.com
Subject: [PATCH v2] clocksource: Add Ralink System Tick Counter driver
Date: Mon, 28 Oct 2024 21:36:43 +0100
Message-Id: <20241028203643.191268-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028203643.191268-1-sergio.paracuellos@gmail.com>
References: <20241028203643.191268-1-sergio.paracuellos@gmail.com>
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
compile test targets and reducing LOC in architecture code folder.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/Kconfig                              |  7 -------
 arch/mips/ralink/Makefile                             |  2 --
 drivers/clocksource/Kconfig                           |  9 +++++++++
 drivers/clocksource/Makefile                          |  1 +
 .../clocksource/timer-ralink.c                        | 11 ++++-------
 5 files changed, 14 insertions(+), 16 deletions(-)
 rename arch/mips/ralink/cevt-rt3352.c => drivers/clocksource/timer-ralink.c (91%)

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
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 95dd4660b5b6..45158c9adfc9 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -753,4 +753,13 @@ config EP93XX_TIMER
 	  Enables support for the Cirrus Logic timer block
 	  EP93XX.
 
+config RALINK_TIMER
+	bool "Ralink System Tick Counter"
+	depends on SOC_RT305X || SOC_MT7620 || COMPILE_TEST
+	select CLKSRC_MMIO
+	select TIMER_OF
+	help
+	  Enables support for system tick counter present on
+	  Ralink SoCs RT3352 and MT7620.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 22743785299e..43ef16a4efa6 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -91,3 +91,4 @@ obj-$(CONFIG_GOLDFISH_TIMER)		+= timer-goldfish.o
 obj-$(CONFIG_GXP_TIMER)			+= timer-gxp.o
 obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+= timer-loongson1-pwm.o
 obj-$(CONFIG_EP93XX_TIMER)		+= timer-ep93xx.o
+obj-$(CONFIG_RALINK_TIMER)		+= timer-ralink.o
diff --git a/arch/mips/ralink/cevt-rt3352.c b/drivers/clocksource/timer-ralink.c
similarity index 91%
rename from arch/mips/ralink/cevt-rt3352.c
rename to drivers/clocksource/timer-ralink.c
index 269d4877d120..6ecdb4228f76 100644
--- a/arch/mips/ralink/cevt-rt3352.c
+++ b/drivers/clocksource/timer-ralink.c
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
+ * Ralink System Tick Counter driver present on RT3352 and MT7620 SoCs.
  *
  * Copyright (C) 2013 by John Crispin <john@phrozen.org>
  */
@@ -16,8 +15,6 @@
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 
-#include <asm/mach-ralink/ralink_regs.h>
-
 #define SYSTICK_FREQ		(50 * 1000)
 
 #define SYSTICK_CONFIG		0x00
@@ -40,7 +37,7 @@ static int systick_set_oneshot(struct clock_event_device *evt);
 static int systick_shutdown(struct clock_event_device *evt);
 
 static int systick_next_event(unsigned long delta,
-				struct clock_event_device *evt)
+			      struct clock_event_device *evt)
 {
 	struct systick_device *sdev;
 	u32 count;
@@ -60,7 +57,7 @@ static void systick_event_handler(struct clock_event_device *dev)
 
 static irqreturn_t systick_interrupt(int irq, void *dev_id)
 {
-	struct clock_event_device *dev = (struct clock_event_device *) dev_id;
+	struct clock_event_device *dev = (struct clock_event_device *)dev_id;
 
 	dev->event_handler(dev);
 
-- 
2.25.1


