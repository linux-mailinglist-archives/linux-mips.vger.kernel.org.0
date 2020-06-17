Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3BA1FCB64
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgFQKv3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgFQKus (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:48 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644F0C061755;
        Wed, 17 Jun 2020 03:50:48 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t18so1822319wru.6;
        Wed, 17 Jun 2020 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PsvB5PDMRspei3v/2mV86AXl7rPPfE789kJJpqAl2ck=;
        b=X4zfVD8G3X1e+ncxn+aGMDyaA9yLcg/d5H+6UsGlG0Mq9yBQ2F9cvthTwPdQnGdu+P
         tJ3p7OPCk6vGdT2EEENjQK5eZzqwUaXjgneX0u6+NtB+HKDVrwrn/VX5keG8cTFnAnD+
         8PS8mesp3RbH1vtZOCWqRBCfgQgm5mmYq8szAJqA/GtALe7f541bmswygX88mZgSkXqS
         SYLvPzWzd/6bXoiJn5lwwPhj0sFQ2/wLOlQ1FLCaVDwzA3Dzk0jM4BOBXePJABcjEEJ2
         MceCN6Dte0ONfxM36XsJu4V0WLmvuC+WkRPCe3j2+2IMoLLXhVDUIl6qqfRuI5Vl/R5A
         Km2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PsvB5PDMRspei3v/2mV86AXl7rPPfE789kJJpqAl2ck=;
        b=X6LMv0Pb+UHTTkHN/HRzVYJfmoxzT/SYyVMBwC0d/tHdvf0igR0pzFM4ZTjIGQJq5v
         lgWb5Jq92Je1MZvTIBzVn7y+hpq0grqGBFNP4djPf2l4X4uVRNRIEMxu5dcYl2GwfT5b
         HKNxuVABfLO6pVu4ljgnqDjvJ6+Rp5vV6yEnaY80nWU+eipWqoaFhNKd/wLDU11vYPwo
         gs2+LQ1cGWbc5RG+O7cAPDo5/mNhT2QhO+eVbUfxQCWMr3GvI2j0gY+KN6PU+tS9f4d8
         OQoW1yvA22HWRM2I/BqZEiBVN7HMTxSSXMLRwfvdWjT0wn9Lw8ilhTDtoX5J9v8A5oKB
         viFg==
X-Gm-Message-State: AOAM532HshS1VAHEXKMcpjKMU0486ev6yMWFS9Kuky5TZNV83BAtBOrf
        d9v0ioTGLLPUAQMYNC0Mr48=
X-Google-Smtp-Source: ABdhPJxsQtvKf4mr9YaFIeiFECoNOlS6aMNQa4T8UG0Yd6vOrkspc6mUJHzwpioewgaAye/DAgIMpQ==
X-Received: by 2002:adf:f446:: with SMTP id f6mr7814599wrp.59.1592391046998;
        Wed, 17 Jun 2020 03:50:46 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:46 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Florian Fainelli <F.fainelli@gmail.com>
Subject: [PATCH v7 3/9] reset: add BCM6345 reset controller driver
Date:   Wed, 17 Jun 2020 12:50:35 +0200
Message-Id: <20200617105042.3824116-4-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617105042.3824116-1-noltari@gmail.com>
References: <20200617105042.3824116-1-noltari@gmail.com>
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 v7: introduce changes suggested by Philipp:
     - sort Kconfig alphabetically.
     - return 0 on bcm6345_reset_update.
     - add second sleep comment.
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
 drivers/reset/reset-bcm6345.c | 135 ++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 drivers/reset/reset-bcm6345.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d9efbfd29646..6b9625a40799 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -35,6 +35,13 @@ config RESET_AXS10X
 	help
 	  This enables the reset controller driver for AXS10x.
 
+config RESET_BCM6345
+	bool "BCM6345 Reset Controller"
+	depends on BMIPS_GENERIC || COMPILE_TEST
+	default BMIPS_GENERIC
+	help
+	  This enables the reset controller driver for BCM6345 SoCs.
+
 config RESET_BERLIN
 	bool "Berlin Reset Driver" if COMPILE_TEST
 	default ARCH_BERLIN
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
index 000000000000..737e4e81f6b7
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
+static inline struct bcm6345_reset *
+to_bcm6345_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct bcm6345_reset, rcdev);
+}
+
+static int bcm6345_reset_update(struct reset_controller_dev *rcdev,
+				unsigned long id, bool assert)
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
+
+	return 0;
+}
+
+static int bcm6345_reset_assert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	return bcm6345_reset_update(rcdev, id, true);
+}
+
+static int bcm6345_reset_deassert(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	return bcm6345_reset_update(rcdev, id, false);
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
+	/*
+	 * Ensure component is taken out reset state by sleeping also after
+	 * deasserting the reset. Otherwise, the component may not be ready
+	 * for operation.
+	 */
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

