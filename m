Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072671F87E6
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 10:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgFNI72 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 04:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgFNI67 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 04:58:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B73DC03E969;
        Sun, 14 Jun 2020 01:58:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q25so11885977wmj.0;
        Sun, 14 Jun 2020 01:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HB8Tch1V41ytesZxvjVq3/CheZkikOQdfvTTbMjrdJQ=;
        b=foRGXEUmUb+joWyYv8IYVlqnAp7IyqC5f1lmhrfcVXSf8HulL0RLjUORlFN0G/qSW5
         U2lgVdOsQr4qev+6vc5wgevBx7xP/V0sOd9bQDPWP/th+15xQV8Oaa1j4R5I2clD6iIA
         Kyt7bBaIA3buLjD951Se9sCPJhpG2gUDvoTpERg9yjUQzLZY61MA2LAp1gY3Is60Sw+c
         JmEVLM55YSpGaWoCoVRnTYfaIkFY6Jnfg7S7lBfIgJQVvh2GqyKyOhZASii6Q8Mmjl3q
         OZ63CbqXrpcA+gkE3reNOJGXwsjloG72598KLQJr0lwdul8mgBj9D8Sjjq1xkQNNx6Vz
         vweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HB8Tch1V41ytesZxvjVq3/CheZkikOQdfvTTbMjrdJQ=;
        b=M+ymWWWKxH3ndLtjl4WursXtiKDDpF06d4QEgdmh97AXnjIiptdyR2iAYKO/T3GdIA
         qoRtB0IG468ULIAQOvwKex/bCTF16QGNiteQuQvXPkUYNwrzQ+Bp265blBmbcdsfhaDj
         2Zon2zot+9ze7OUDH0ObpdUcfGYzY1b8qYY4U43xojR0W6hBHnf6qj0vECYtkmApChBw
         uOhUZl+hDsA864Y4oMMcHgAaIQ28rUdPl1aHIvlQLFQfltSwRXgddyk2/q2foBOqdaqd
         BdBXQsd9fxudPmJHOhpfq53IcmzQLHM1vs9Z7RMA4klhi0rLs+DkSj7I4wrSKLDBkksW
         ClrA==
X-Gm-Message-State: AOAM5321ljTl8to0FIs0vJDj2gkVWFh8ZPoMrwpPBTRbAh/xouwovBd8
        LRxd+P0RanEPYSlyTdG9Q9M=
X-Google-Smtp-Source: ABdhPJyfXD/QaQspmyS8FXnfjmhmCeyVKtkJeRoFO9OvjRjqD2Co8k+IHpU1A/YonSLwYk434nsLwQ==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr7155114wms.109.1592125138015;
        Sun, 14 Jun 2020 01:58:58 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id u4sm17174043wmb.48.2020.06.14.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 01:58:57 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Florian Fainelli <F.fainelli@gmail.com>
Subject: [PATCH v5 3/9] reset: add BCM6345 reset controller driver
Date:   Sun, 14 Jun 2020 10:58:46 +0200
Message-Id: <20200614085852.2130147-4-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614085852.2130147-1-noltari@gmail.com>
References: <20200613083813.2027186-1-noltari@gmail.com>
 <20200614085852.2130147-1-noltari@gmail.com>
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
 v5: fix kbuild robot error (drop __init).
 v4: no changes.
 v3: using reset-simple isn't possible since sleeping after performing the
     reset is also needed.
 v2: add compatibility to reset-simple instead of adding a new driver.

 drivers/reset/Kconfig         |   7 ++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-bcm6345.c | 135 ++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)
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
index 000000000000..e1acb8d9f661
--- /dev/null
+++ b/drivers/reset/reset-bcm6345.c
@@ -0,0 +1,135 @@
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
+static void bcm6345_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct bcm6345_reset *bcm6345_reset =
+		container_of(rcdev, struct bcm6345_reset, rcdev);
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
+	struct bcm6345_reset *bcm6345_reset =
+		container_of(rcdev, struct bcm6345_reset, rcdev);
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
+	struct resource *res;
+	int err;
+
+	bcm6345_reset = devm_kzalloc(&pdev->dev,
+				     sizeof(*bcm6345_reset), GFP_KERNEL);
+	if (!bcm6345_reset)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, bcm6345_reset);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	bcm6345_reset->base = devm_ioremap_resource(&pdev->dev, res);
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
+	err = devm_reset_controller_register(&pdev->dev,
+					     &bcm6345_reset->rcdev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static const struct of_device_id bcm6345_reset_of_match[] = {
+	{ .compatible = "brcm,bcm6345-reset" },
+	{ },
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

