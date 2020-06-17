Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0260E1FC8BA
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 10:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgFQIcm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 04:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgFQIck (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 04:32:40 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409ADC061573;
        Wed, 17 Jun 2020 01:32:40 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j10so1344546wrw.8;
        Wed, 17 Jun 2020 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LM9tK1rNCdHcjTVag9f18zwhLh+5an/L2fZkXFYBIsw=;
        b=fH6qZWwMZRSWxQWxIEeTgVDiXzoYZAXCDOuLupUmDtlrdVvLYkVDQs+IWcHlHK9FmH
         u6UF+CuWjBO9/ukYtwAnwZzeMRtxKVcBG2OZ8Co1U8Z0JxtK9hH6bj7EQVWnYpd6VHrz
         uXN071sKEpTXcGWVkGawtCuLl2BIZkmKWvj8kCieS8F+erR5ygRS5WJyvgMoiZ1TU1kz
         zT8rLvMNdk0vK1sIcnk7h5uyhbk+RmPsN0cr4ZijvqMnOS4tbdTn6o3N12ZE1UZTj4i7
         rTdukS/5pnLzjzxaEQ9kax8yc/OxXWvImbDlQQkMxcJCrfxkbVk7uTEoF5pt9LEA8wUF
         Oxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LM9tK1rNCdHcjTVag9f18zwhLh+5an/L2fZkXFYBIsw=;
        b=dik5mIIgN2oE24FicLrytn/onkbt2J2rHlCVce+x5RNfzpnM4Bx5wagt1EBkW7GZVn
         /zwQ/t2jZuTri2BJAjaBeuZFhFrPvgnNM7pg1ja+2cpq4JY0pF7avrQcvLQ5J1GXgvSs
         943Qqv4Yid3XW+kGuZMWBuPhi/tFwLzD4xzL3rAdsVNtRpxyHEhIJrzrNUSCawHnBq+A
         k08gWWIkVCnmStsq/tjqPhvivshg67pa289IaIon5eHep30uCgy19BsLRilHyZYA2qAO
         bSEPf4XZC8KGjsMCnxx2eJDfYwQanjfc4Qluwrmn3kmDcJ8Y/z16K3yXAWpj2f+0ruoL
         nQPw==
X-Gm-Message-State: AOAM533bw2MXgJdnN3PhlxC0EIgc0o0sEflT/7MbURXmd4OPoS7JcbU4
        jEebScZaPYnQ13o9tG1Hn9Q=
X-Google-Smtp-Source: ABdhPJx2ZsEI4vb9vqOpl+xf179bdMOsytjKyYVqbX6Wr2WUZcJ6DCti8SFzQL7/wmYy0v6y2meVCg==
X-Received: by 2002:a05:6000:104f:: with SMTP id c15mr7204000wrx.391.1592382758906;
        Wed, 17 Jun 2020 01:32:38 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id a16sm32596863wrx.8.2020.06.17.01.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 01:32:38 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Florian Fainelli <F.fainelli@gmail.com>
Subject: [PATCH v6 3/9] reset: add BCM6345 reset controller driver
Date:   Wed, 17 Jun 2020 10:32:25 +0200
Message-Id: <20200617083231.3699090-4-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617083231.3699090-1-noltari@gmail.com>
References: <20200617083231.3699090-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for resetting blocks through the Linux reset controller
subsystem for BCM63xx SoCs.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Florian Fainelli <F.fainelli@gmail.com>
---
 v6: driver improvements:
     - use devm_platform_ioremap_resource.
     - simplify bcm6345_reset_probe return.
     - introduce and use to_bcm6345_reset function.
 v5: fix kbuild robot error (drop __init).
 v4: no changes.
 v3: using reset-simple isn't possible since sleeping after performing the
     reset is also needed.
 v2: add compatibility to reset-simple instead of adding a new driver.

 drivers/reset/Kconfig         |   7 ++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-bcm6345.c | 132 ++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 drivers/reset/reset-bcm6345.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d9efbfd29646..9f1da978cef6 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -41,6 +41,13 @@ config RESET_BERLIN
 	help
 	  This enables the reset controller driver for Marvell Berlin SoCs.
 
+config RESET_BCM6345
+	bool "BCM6345 Reset Controller"
+	depends on BMIPS_GENERIC || COMPILE_TEST
+	default BMIPS_GENERIC
+	help
+	  This enables the reset controller driver for BCM6345 SoCs.
+
 config RESET_BRCMSTB
 	tristate "Broadcom STB reset controller"
 	depends on ARCH_BRCMSTB || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 249ed357c997..e642aae42f0f 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
+obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
diff --git a/drivers/reset/reset-bcm6345.c b/drivers/reset/reset-bcm6345.c
new file mode 100644
index 000000000000..3eedea226028
--- /dev/null
+++ b/drivers/reset/reset-bcm6345.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * BCM6345 Reset Controller Driver
+ *
+ * Copyright (C) 2020 Álvaro Fernández Rojas <noltari@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+#define BCM6345_RESET_NUM		32
+#define BCM6345_RESET_SLEEP_MIN_US	10000
+#define BCM6345_RESET_SLEEP_MAX_US	20000
+
+struct bcm6345_reset {
+	struct reset_controller_dev rcdev;
+	void __iomem *base;
+	spinlock_t lock;
+};
+
+static inline struct bcm6345_reset *
+to_bcm6345_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct bcm6345_reset, rcdev);
+}
+
+static void bcm6345_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct bcm6345_reset *bcm6345_reset = to_bcm6345_reset(rcdev);
+	unsigned long flags;
+	uint32_t val;
+
+	spin_lock_irqsave(&bcm6345_reset->lock, flags);
+	val = __raw_readl(bcm6345_reset->base);
+	if (assert)
+		val &= ~BIT(id);
+	else
+		val |= BIT(id);
+	__raw_writel(val, bcm6345_reset->base);
+	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
+}
+
+static int bcm6345_reset_assert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	bcm6345_reset_update(rcdev, id, true);
+
+	return 0;
+}
+
+static int bcm6345_reset_deassert(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	bcm6345_reset_update(rcdev, id, false);
+
+	return 0;
+}
+
+static int bcm6345_reset_reset(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	bcm6345_reset_update(rcdev, id, true);
+	usleep_range(BCM6345_RESET_SLEEP_MIN_US,
+		     BCM6345_RESET_SLEEP_MAX_US);
+
+	bcm6345_reset_update(rcdev, id, false);
+	usleep_range(BCM6345_RESET_SLEEP_MIN_US,
+		     BCM6345_RESET_SLEEP_MAX_US);
+
+	return 0;
+}
+
+static int bcm6345_reset_status(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct bcm6345_reset *bcm6345_reset = to_bcm6345_reset(rcdev);
+
+	return !(__raw_readl(bcm6345_reset->base) & BIT(id));
+}
+
+static struct reset_control_ops bcm6345_reset_ops = {
+	.assert = bcm6345_reset_assert,
+	.deassert = bcm6345_reset_deassert,
+	.reset = bcm6345_reset_reset,
+	.status = bcm6345_reset_status,
+};
+
+static int bcm6345_reset_probe(struct platform_device *pdev)
+{
+	struct bcm6345_reset *bcm6345_reset;
+
+	bcm6345_reset = devm_kzalloc(&pdev->dev,
+				     sizeof(*bcm6345_reset), GFP_KERNEL);
+	if (!bcm6345_reset)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, bcm6345_reset);
+
+	bcm6345_reset->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(bcm6345_reset->base))
+		return PTR_ERR(bcm6345_reset->base);
+
+	spin_lock_init(&bcm6345_reset->lock);
+	bcm6345_reset->rcdev.ops = &bcm6345_reset_ops;
+	bcm6345_reset->rcdev.owner = THIS_MODULE;
+	bcm6345_reset->rcdev.of_node = pdev->dev.of_node;
+	bcm6345_reset->rcdev.of_reset_n_cells = 1;
+	bcm6345_reset->rcdev.nr_resets = BCM6345_RESET_NUM;
+
+	return devm_reset_controller_register(&pdev->dev,
+					      &bcm6345_reset->rcdev);
+}
+
+static const struct of_device_id bcm6345_reset_of_match[] = {
+	{ .compatible = "brcm,bcm6345-reset" },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver bcm6345_reset_driver = {
+	.probe = bcm6345_reset_probe,
+	.driver	= {
+		.name = "bcm6345-reset",
+		.of_match_table = bcm6345_reset_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(bcm6345_reset_driver);
-- 
2.27.0

