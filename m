Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A98611900
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 14:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfEBM1t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 08:27:49 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37424 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEBM1s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 08:27:48 -0400
Received: by mail-ed1-f65.google.com with SMTP id w37so1942557edw.4;
        Thu, 02 May 2019 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fJ70LbLu+r/UeJWgjakzHcU2Xcr5bJUhH4VQC+7cA4g=;
        b=pVe/TvEgr1w7kp/9+SVxsf7VIOoeFc2ZeU0moEIyG5Pl7eEjghxVmVCFkHdLZK2DKN
         3wkTaud7FIFtjVdw/7ZTkInKxO3fZ3qRXJMMqjwxg9zrOrU0z8c9l71Epp3stnBPJH7v
         ACxio9A41y21kV3afMhMMxAcF3uugMNjaQpRpDnIMCM+jkCOJzS/3Xtu7Z/xysZ5ltNc
         Y2Z+7ieY+DmijVrK8sK03r/HLR5voG9VrnfCZRRGBpC93CFkV8+Jsvx0vxd6Hgr6O3MU
         dKBjrUIaJe7TRcbq8AJ/PBT3qTvqkO0Rk9R5l8xhKYDfiOUqzNQFp9+Pe5BmSFh5Vzzs
         wYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fJ70LbLu+r/UeJWgjakzHcU2Xcr5bJUhH4VQC+7cA4g=;
        b=Zh+bODwoL7+CekLNg51713/lQQnuP9tYr3M/Y/V3LogKSO7NNvzJY35rhUxWt3+14O
         LpETs5qulSkBrWPl8GO8e9ZVmLgot0ydhKnc2mEFXTdJWLIuu31Uw1qps9Gr6temtO5z
         mn1Ge0fXfLXknpui7xwP28TUd8JxCT8GrVDv5SPk2Uet/nbSOyuQ4kkOJnlax9+BjFew
         1zsZn3Vik9u/+CHA4bSSVJ/GYOJU32O19L+9/RT/lUyl6lzNEZEsTbpwFaGgSFV0E4kw
         E2HzVKJPF1fP0FKQ2luweLuLo6WYV9rL6k5n2CQQaHP3ampeYOqskjcZnafnVU7ux8Ri
         41xg==
X-Gm-Message-State: APjAAAXbUV/Ndgp9vIVZEnvrlRZ9rm+/S1gyXiMyHUJJeOv62QkaIRWU
        znnsLN05V+o1wK7kPYWTtvHZzz2W
X-Google-Smtp-Source: APXvYqwguhsMNIQY3s9Lr1HzhN/++Dh4UU10S+NK5Qg8aL96Tnm5kGeH9bdbZql/6wic1eZwUW/9LA==
X-Received: by 2002:a17:906:708d:: with SMTP id b13mr1670614ejk.120.1556800065341;
        Thu, 02 May 2019 05:27:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id k18sm2030453eda.92.2019.05.02.05.27.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 05:27:44 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Subject: [PATCH 2/3] clk: add BCM63XX gated clock controller driver
Date:   Thu,  2 May 2019 14:26:56 +0200
Message-Id: <20190502122657.15577-3-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190502122657.15577-1-jonas.gorski@gmail.com>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a driver for the gated clock controller found on MIPS based BCM63XX
SoCs.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/clk/bcm/Kconfig            |   8 ++
 drivers/clk/bcm/Makefile           |   1 +
 drivers/clk/bcm/clk-bcm63xx-gate.c | 246 +++++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 drivers/clk/bcm/clk-bcm63xx-gate.c

diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index 4c4bd85f707c..144e724815c6 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -7,6 +7,14 @@ config CLK_BCM_63XX
 	  Enable common clock framework support for Broadcom BCM63xx DSL SoCs
 	  based on the ARM architecture
 
+config CLK_BCM_63XX_GATE
+	bool "Broadcom BCM63xx gated clock support"
+	depends on BMIPS_GENERIC || COMPILE_TEST
+	default BMIPS_GENERIC
+	help
+	  Enable common clock framework support for Broadcom BCM63xx DSL SoCs
+	  based on the MIPS architecture
+
 config CLK_BCM_KONA
 	bool "Broadcom Kona CCU clock support"
 	depends on ARCH_BCM_MOBILE || COMPILE_TEST
diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
index 002661d39128..3d925493db7f 100644
--- a/drivers/clk/bcm/Makefile
+++ b/drivers/clk/bcm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_CLK_BCM_63XX)	+= clk-bcm63xx.o
+obj-$(CONFIG_CLK_BCM_63XX_GATE)	+= clk-bcm63xx-gate.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-kona.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-kona-setup.o
 obj-$(CONFIG_CLK_BCM_KONA)	+= clk-bcm281xx.o
diff --git a/drivers/clk/bcm/clk-bcm63xx-gate.c b/drivers/clk/bcm/clk-bcm63xx-gate.c
new file mode 100644
index 000000000000..4fd10645a192
--- /dev/null
+++ b/drivers/clk/bcm/clk-bcm63xx-gate.c
@@ -0,0 +1,246 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/clk-provider.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+struct clk_bcm63xx_table_entry {
+	const char * const name;
+	u8 bit;
+	unsigned long flags;
+};
+
+struct clk_bcm63xx_hw {
+	void __iomem *regs;
+	spinlock_t lock;
+
+	struct clk_hw_onecell_data data;
+};
+
+const struct clk_bcm63xx_table_entry bcm3368_clocks[] = {
+	{ .name = "mac", .bit = 3, },
+	{ .name = "tc", .bit = 5, },
+	{ .name = "us_top", .bit = 6, },
+	{ .name = "ds_top", .bit = 7, },
+	{ .name = "acm", .bit = 8, },
+	{ .name = "spi", .bit = 9, },
+	{ .name = "usbs", .bit = 10, },
+	{ .name = "bmu", .bit = 11, },
+	{ .name = "pcm", .bit = 12, },
+	{ .name = "ntp", .bit = 13, },
+	{ .name = "acp_b", .bit = 14, },
+	{ .name = "acp_a", .bit = 15, },
+	{ .name = "emusb", .bit = 17, },
+	{ .name = "enet0", .bit = 18, },
+	{ .name = "enet1", .bit = 19, },
+	{ .name = "usbsu", .bit = 20, },
+	{ .name = "ephy", .bit = 21, },
+	{ },
+};
+
+const struct clk_bcm63xx_table_entry bcm6328_clocks[] = {
+	{ .name = "phy_mips", .bit = 0, },
+	{ .name = "adsl_qproc", .bit = 1, },
+	{ .name = "adsl_afe", .bit = 2, },
+	{ .name = "adsl", .bit = 3, },
+	{ .name = "mips", .bit = 4, .flags = CLK_IS_CRITICAL, },
+	{ .name = "sar", .bit = 5, },
+	{ .name = "pcm", .bit = 6, },
+	{ .name = "usbd", .bit = 7, },
+	{ .name = "usbh", .bit = 8, },
+	{ .name = "hsspi", .bit = 9, },
+	{ .name = "pcie", .bit = 10, },
+	{ .name = "robosw", .bit = 11, },
+	{ },
+};
+
+const struct clk_bcm63xx_table_entry bcm6358_clocks[] = {
+	{ .name = "enet", .bit = 4, },
+	{ .name = "adslphy", .bit = 5, },
+	{ .name = "pcm", .bit = 8, },
+	{ .name = "spi", .bit = 9, },
+	{ .name = "usbs", .bit = 10, },
+	{ .name = "sar", .bit = 11, },
+	{ .name = "emusb", .bit = 17, },
+	{ .name = "enet0", .bit = 18, },
+	{ .name = "enet1", .bit = 19, },
+	{ .name = "usbsu", .bit = 20, },
+	{ .name = "ephy", .bit = 21, },
+	{ },
+};
+
+const struct clk_bcm63xx_table_entry bcm6362_clocks[] = {
+	{ .name = "adsl_qproc", .bit = 1, },
+	{ .name = "adsl_afe", .bit = 2, },
+	{ .name = "adsl", .bit = 3, },
+	{ .name = "mips", .bit = 4, .flags = CLK_IS_CRITICAL, },
+	{ .name = "wlan_ocp", .bit = 5, },
+	{ .name = "swpkt_usb", .bit = 7, },
+	{ .name = "swpkt_sar", .bit = 8, },
+	{ .name = "sar", .bit = 9, },
+	{ .name = "robosw", .bit = 10, },
+	{ .name = "pcm", .bit = 11, },
+	{ .name = "usbd", .bit = 12, },
+	{ .name = "usbh", .bit = 13, },
+	{ .name = "ipsec", .bit = 14, },
+	{ .name = "spi", .bit = 15, },
+	{ .name = "hsspi", .bit = 16, },
+	{ .name = "pcie", .bit = 17, },
+	{ .name = "fap", .bit = 18, },
+	{ .name = "phymips", .bit = 19, },
+	{ .name = "nand", .bit = 20, },
+	{ },
+};
+
+const struct clk_bcm63xx_table_entry bcm6368_clocks[] = {
+	{ .name = "vdsl_qproc", .bit = 2, },
+	{ .name = "vdsl_afe", .bit = 3, },
+	{ .name = "vdsl_bonding", .bit = 4, },
+	{ .name = "vdsl", .bit = 5, },
+	{ .name = "phymips", .bit = 6, },
+	{ .name = "swpkt_usb", .bit = 7, },
+	{ .name = "swpkt_sar", .bit = 8, },
+	{ .name = "spi", .bit = 9, },
+	{ .name = "usbd", .bit = 10, },
+	{ .name = "sar", .bit = 11, },
+	{ .name = "robosw", .bit = 12, },
+	{ .name = "utopia", .bit = 13, },
+	{ .name = "pcm", .bit = 14, },
+	{ .name = "usbh", .bit = 15, },
+	{ .name = "disable_gless", .bit = 16, },
+	{ .name = "nand", .bit = 17, },
+	{ .name = "ipsec", .bit = 18, },
+	{ },
+};
+
+const struct clk_bcm63xx_table_entry bcm63268_clocks[] = {
+	{ .name = "disable_gless", .bit = 0, },
+	{ .name = "vdsl_qproc", .bit = 1, },
+	{ .name = "vdsl_afe", .bit = 2, },
+	{ .name = "vdsl", .bit = 3, },
+	{ .name = "mips", .bit = 4, .flags = CLK_IS_CRITICAL, },
+	{ .name = "wlan_ocp", .bit = 5, },
+	{ .name = "dect", .bit = 6, },
+	{ .name = "fap0", .bit = 7, },
+	{ .name = "fap1", .bit = 8, },
+	{ .name = "sar", .bit = 9, },
+	{ .name = "robosw", .bit = 10, },
+	{ .name = "pcm", .bit = 11, },
+	{ .name = "usbd", .bit = 12, },
+	{ .name = "usbh", .bit = 13, },
+	{ .name = "ipsec", .bit = 14, },
+	{ .name = "spi", .bit = 15, },
+	{ .name = "hsspi", .bit = 16, },
+	{ .name = "pcie", .bit = 17, },
+	{ .name = "phymips", .bit = 18, },
+	{ .name = "gmac", .bit = 19, },
+	{ .name = "nand", .bit = 20, },
+	{ .name = "tbus", .bit = 27, },
+	{ .name = "robosw250", .bit = 31, },
+	{ },
+};
+
+static int clk_bcm63xx_probe(struct platform_device *pdev)
+{
+	const struct clk_bcm63xx_table_entry *entry, *table;
+	struct clk_bcm63xx_hw *hw;
+	struct resource *r;
+	u8 maxbit = 0;
+	int i, ret;
+
+	table = of_device_get_match_data(&pdev->dev);
+	if (!table)
+		return -EINVAL;
+
+	for (entry = table; entry->name; entry++)
+		maxbit = max_t(u8, maxbit, entry->bit);
+
+	hw = devm_kzalloc(&pdev->dev, struct_size(hw, data.hws, maxbit),
+			  GFP_KERNEL);
+	if (!hw)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, hw);
+
+	spin_lock_init(&hw->lock);
+
+	hw->data.num = maxbit;
+	for (i = 0; i < maxbit; i++)
+		hw->data.hws[i] = ERR_PTR(-ENODEV);
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	hw->regs = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(hw->regs))
+		return PTR_ERR(hw->regs);
+
+	for (entry = table; entry->name; entry++) {
+		struct clk_hw *clk;
+
+		clk = clk_hw_register_gate(&pdev->dev, entry->name, NULL,
+					   entry->flags, hw->regs, entry->bit,
+					   CLK_GATE_BIG_ENDIAN, &hw->lock);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			goto out_err;
+		}
+
+		hw->data.hws[entry->bit] = clk;
+	}
+
+	ret = of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
+				     &hw->data);
+	if (!ret)
+		return 0;
+out_err:
+	for (i = 0; i < hw->data.num; i++) {
+		if (!IS_ERR(hw->data.hws[i]))
+			clk_hw_unregister_gate(hw->data.hws[i]);
+	}
+
+	return ret;
+}
+
+static int clk_bcm63xx_remove(struct platform_device *pdev)
+{
+	struct clk_bcm63xx_hw *hw = platform_get_drvdata(pdev);
+	int i;
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	for (i = 0; i < hw->data.num; i++) {
+		if (!IS_ERR(hw->data.hws[i]))
+			clk_hw_unregister_gate(hw->data.hws[i]);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id clk_bcm63xx_dt_ids[] = {
+	{ .compatible = "brcm,bcm3368-clocks", .data = &bcm3368_clocks, },
+	{ .compatible = "brcm,bcm6328-clocks", .data = &bcm6328_clocks, },
+	{ .compatible = "brcm,bcm6358-clocks", .data = &bcm6358_clocks, },
+	{ .compatible = "brcm,bcm6362-clocks", .data = &bcm6362_clocks, },
+	{ .compatible = "brcm,bcm6368-clocks", .data = &bcm6368_clocks, },
+	{ .compatible = "brcm,bcm63268-clocks", .data = &bcm63268_clocks, },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, clk_bcm63xx_dt_ids);
+
+static struct platform_driver clk_bcm63xx = {
+	.probe = clk_bcm63xx_probe,
+	.remove = clk_bcm63xx_remove,
+	.driver = {
+		.name = "bcm63xx-clock",
+		.of_match_table = of_match_ptr(clk_bcm63xx_dt_ids),
+	},
+};
+
+builtin_platform_driver(clk_bcm63xx);
+
+MODULE_AUTHOR("Jonas Gorski <jonas.gorski@gmail.com>");
+MODULE_DESCRIPTION("BCM63XX (MIPS) gated clock controller driver");
+MODULE_LICENSE("GPL");
-- 
2.13.2

