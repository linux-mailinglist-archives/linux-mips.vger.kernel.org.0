Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEDB1F3CE6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 15:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgFINnN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 09:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728908AbgFINmk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 09:42:40 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8FB2C03E97C;
        Tue,  9 Jun 2020 06:42:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u26so2354828wmn.1;
        Tue, 09 Jun 2020 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hfoxusuSqdP/Q9j4oFz+b/D8aXhm78zGREtLJ9r4tyw=;
        b=FqwPLAk5mZ13poRsPXWdvFr2+ZMggBySu+R11ByBMm8Q5TDpd3m/3ejxPnZqvNZvs0
         Giwlh1fogFWvjIlvEp/JZjC2MfJY0nvsXmhQcn5BXrUH+BKGB6qQTI6cAR8Q/0H1qmx2
         fQ97YdlDenBcDxKW1FVTpBEHeX8vqiWLsEtD7Jd6bLYCb75EHrdR9NRDBMy2jvUtdM/r
         5sTdosM2LwdvuKcyVV+Y0IDi5Sr5Go/FFB5NzGeUX91FxOPCJGB4ygIgLadwvFzCXFgA
         N0GXzSB5rEB8VhxS9XT5gwzgl3WDUQTyLtFjN9RnAphigIwRPQQmv8DerHeTusN07M2r
         iIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hfoxusuSqdP/Q9j4oFz+b/D8aXhm78zGREtLJ9r4tyw=;
        b=jLOfsRkxWz4V+Vo5+nYAsrr4A5/u5QhXhqKZJnhvq3ovPVjvOFSxcerkYPCb0qjWCM
         PnWZIx3GAzIoRyWixbtPoXrpxjSuOPB87dxrpmFwjKJtEJXbg+38rUwMR3ixeIneiJzS
         sOmO1mhmc70KEp69ldTQ+Ty67q7pz45QoRff6d3aAEps3Ntaw0oLiMRX2uHmaD0u0bM8
         ikKJnrrkqEvg42fuCqg6LO6B/cngr79D59LNhImpieXwgfISmRcJ5aKFcAwiLtMRH5+x
         gaebOQ23ZHp7G5jnECgnReMTdEOM768HZtaVUPl1KSKyVm3AXPeTgcmYVdlVRK+BxKlf
         G4tw==
X-Gm-Message-State: AOAM5307udlmDgAMC+uzwuQkyZJmHkFEaXfW3ZmfN0peIHKD+7KEOOAt
        AwwYTUMcsa6DubhtpFfz/KY=
X-Google-Smtp-Source: ABdhPJxWJ3YjuVjujrmyM6Zl9dGIDlku6BlIDQc83e85I49a+R6+pcpPnSs2NgebG8KTBzFpxriohg==
X-Received: by 2002:a7b:c11a:: with SMTP id w26mr4053731wmi.0.1591710157591;
        Tue, 09 Jun 2020 06:42:37 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id w17sm3454067wra.71.2020.06.09.06.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:42:37 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 3/7] reset: add BCM6345 reset controller driver
Date:   Tue,  9 Jun 2020 15:42:28 +0200
Message-Id: <20200609134232.4084718-4-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609134232.4084718-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
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
---
 drivers/reset/Kconfig         |   7 ++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-bcm6345.c | 149 ++++++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
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
index 000000000000..088b7fdb896b
--- /dev/null
+++ b/drivers/reset/reset-bcm6345.c
@@ -0,0 +1,149 @@
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
+static int bcm6345_reset_update(struct bcm6345_reset *bcm6345_reset,
+				unsigned long id, bool assert)
+{
+	uint32_t val;
+
+	val = __raw_readl(bcm6345_reset->base);
+	if (assert)
+		val &= ~BIT(id);
+	else
+		val |= BIT(id);
+	__raw_writel(val, bcm6345_reset->base);
+
+	return 0;
+}
+
+static int bcm6345_reset_assert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct bcm6345_reset *bcm6345_reset =
+		container_of(rcdev, struct bcm6345_reset, rcdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&bcm6345_reset->lock, flags);
+	bcm6345_reset_update(bcm6345_reset, id, true);
+	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
+
+	return 0;
+}
+
+static int bcm6345_reset_deassert(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	struct bcm6345_reset *bcm6345_reset =
+		container_of(rcdev, struct bcm6345_reset, rcdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&bcm6345_reset->lock, flags);
+	bcm6345_reset_update(bcm6345_reset, id, false);
+	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
+
+	return 0;
+}
+
+static int bcm6345_reset_reset(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct bcm6345_reset *bcm6345_reset =
+		container_of(rcdev, struct bcm6345_reset, rcdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&bcm6345_reset->lock, flags);
+	usleep_range(BCM6345_RESET_SLEEP_MIN_US,
+		     BCM6345_RESET_SLEEP_MAX_US);
+	bcm6345_reset_update(bcm6345_reset, id, true);
+	usleep_range(BCM6345_RESET_SLEEP_MIN_US,
+		     BCM6345_RESET_SLEEP_MAX_US);
+	bcm6345_reset_update(bcm6345_reset, id, false);
+	spin_unlock_irqrestore(&bcm6345_reset->lock, flags);
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
2.26.2

