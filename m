Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E6C2AF683
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 17:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgKKQat (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 11:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbgKKQaZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 11:30:25 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECD1C0613D1;
        Wed, 11 Nov 2020 08:30:24 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 23so3106801wrc.8;
        Wed, 11 Nov 2020 08:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1KMHSjb1rg2avkeMWbTsRE5Tlf5Gn9ajcRS0CH0fkNc=;
        b=JE8bZwkdqom4kF+K2iyhLoGeBJk3m+eNdkgVW7VQKJDg1Zalq+dEC8UTaP/UL3T13h
         Oy8xMRP/3WTCCeMCZ9ta1FFnTHpdQj26Tu9zmwatJe/PeMnybzYhERv+wnKK6Hy6ss5P
         VHY0YEfy0JA2MjpXzb8kWlyXNuXKBOA3gVUnftSWpvAzAYqi4DfYSI0OpbPcnU5pb490
         3ySDyEZKiJ6ckfMvn1EVojVPt0CuCTA7DfbO1whZdk0kdOWCB4ez2SlyWTCGMIrOodog
         uZDUSVU0X+4EKmaDWLc3z6qVyYCc5y61tf20j1TSHOHM2tYu2ygURUfwXE7zDPSJ5rWk
         rd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1KMHSjb1rg2avkeMWbTsRE5Tlf5Gn9ajcRS0CH0fkNc=;
        b=QmyahgkKGJmlLgQq1XTSKDNIpZu+OfQdJqQ7CGj8ndMB+NaFDxkdlDmz4Y19BS7S5s
         VQRXhOEd3eW9t/XUvTdJleZPeTRdEQ7IBbQ4P1IROw/Tzl3z7SMY+AUr/HSGufj9g5ms
         koRLIKOMwQJfAAg1jmG/IvfYwvzLH/Lza9Tz/OP1hwQAPVKKJO4YW4OStthnxWjVJ/Vp
         pg3wdqQQLVeGvomB24mpCPYXLlaPyQLC4GXhhZrG8K5SGkRjzp4RVEsIG0N2LqJxNrYU
         4Bll1UoWzPKZucBwOjgJuhtZ/CS/8OHjUXzu3vjyr5dckA8Zj04aCBxfnNPIMzJiPyve
         s7Ag==
X-Gm-Message-State: AOAM532uhITlWVeMmHixBSef8xEoDTBezUIoJv1pZaR0BFFWij+XzDRU
        RDvORJhJhvua1brt7YFjl6w=
X-Google-Smtp-Source: ABdhPJx055ZqZy6zBpI0MdOC9GIdx/LpSkBu4igfYewwt3pXKtEW96lX1R64m8hCCJeL7WLM1o9yGQ==
X-Received: by 2002:adf:9066:: with SMTP id h93mr32463508wrh.166.1605112223159;
        Wed, 11 Nov 2020 08:30:23 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id w186sm3196753wmb.26.2020.11.11.08.30.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:30:22 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 5/7] clk: ralink: add clock gate driver for mt7621 SoC
Date:   Wed, 11 Nov 2020 17:30:11 +0100
Message-Id: <20201111163013.29412-6-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In mt7621 SoC register 'SYSC_REG_CPLL_CLKCFG1' allows to
handle a bunch of gates to enable/disable clocks for
all or some ip cores. Add a driver to properly handle them.
Parent clocks for this gates are not documented  at all in
the SoC documentation so all of them have been assumed looking
into the clock frequencies used in its related driver code.
There are three main clocks which are "cpu", "ahb" and "apb"
from the 'mt7621-pll'.

The following parents are set to each GATE:
  * "hsdma": "ahb"
  * "fe": "ahb"
  * "sp_divtx": "ahb"
  * "timer": "cpu"
  * "int": "cpu"
  * "mc": "ahb"
  * "pcm": "ahb"
  * "pio": "ahb"
  * "gdma": "ahb"
  * "nand": "ahb"
  * "i2c": "ahb"
  * "i2s": "ahb"
  * "spi": "ahb"
  * "uart1": "apb"
  * "uart2": "apb"
  * "uart3": "apb"
  * "eth": "ahb"
  * "pcie0": "ahb"
  * "pcie1": "ahb"
  * "pcie2": "ahb"
  * "crypto": "ahb"
  * "shxc": "ahb"

With this information the clk driver will provide gate functionality
from a a set of hardcoded clocks allowing to define a nice device
tree without fixed clocks.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/clk/Kconfig             |   1 +
 drivers/clk/Makefile            |   1 +
 drivers/clk/ralink/Kconfig      |  14 ++
 drivers/clk/ralink/Makefile     |   2 +
 drivers/clk/ralink/clk-mt7621.c | 258 ++++++++++++++++++++++++++++++++
 5 files changed, 276 insertions(+)
 create mode 100644 drivers/clk/ralink/Kconfig
 create mode 100644 drivers/clk/ralink/Makefile
 create mode 100644 drivers/clk/ralink/clk-mt7621.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c715d4681a0b..5f94c4329033 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -372,6 +372,7 @@ source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/qcom/Kconfig"
+source "drivers/clk/ralink/Kconfig"
 source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index da8fcf147eb1..6578e167b047 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -100,6 +100,7 @@ obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
 obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
+obj-y					+= ralink/
 obj-y					+= renesas/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
diff --git a/drivers/clk/ralink/Kconfig b/drivers/clk/ralink/Kconfig
new file mode 100644
index 000000000000..7e8697327e0c
--- /dev/null
+++ b/drivers/clk/ralink/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# MediaTek Mt7621 Clock Driver
+#
+menu "Clock driver for mediatek mt7621 SoC"
+	depends on SOC_MT7621 || COMPILE_TEST
+
+config CLK_MT7621
+	bool "Clock driver for MediaTek MT7621"
+	depends on SOC_MT7621 || COMPILE_TEST
+	default SOC_MT7621
+	help
+	  This driver supports MediaTek MT7621 basic clocks.
+endmenu
diff --git a/drivers/clk/ralink/Makefile b/drivers/clk/ralink/Makefile
new file mode 100644
index 000000000000..cf6f9216379d
--- /dev/null
+++ b/drivers/clk/ralink/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_CLK_MT7621) += clk-mt7621.o
diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
new file mode 100644
index 000000000000..f7279d784a36
--- /dev/null
+++ b/drivers/clk/ralink/clk-mt7621.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mediatek MT7621 Clock gate Driver
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <dt-bindings/clock/mt7621-clk.h>
+
+/* clock gate configuration register */
+#define SYSC_REG_CLKCFG1		0x30
+
+/* Gate register enable bits */
+#define MT7621_HSDMA_CLK_EN		BIT(5)
+#define MT7621_FE_CLK_EN		BIT(6)
+#define MT7621_SP_DIVTX_CLK_EN		BIT(7)
+#define MT7621_TIMER_CLK_EN		BIT(8)
+#define MT7621_INT_CLK_EN		BIT(9)
+#define MT7621_MC_CLK_EN		BIT(10)
+#define MT7621_PCM_CLK_EN		BIT(11)
+#define MT7621_PIO_CLK_EN		BIT(13)
+#define MT7621_GDMA_CLK_EN		BIT(14)
+#define MT7621_NAND_CLK_EN		BIT(15)
+#define MT7621_I2C_CLK_EN		BIT(16)
+#define MT7621_I2S_CLK_EN		BIT(17)
+#define MT7621_SPI_CLK_EN		BIT(18)
+#define MT7621_UART1_CLK_EN		BIT(19)
+#define MT7621_UART2_CLK_EN		BIT(20)
+#define MT7621_UART3_CLK_EN		BIT(21)
+#define MT7621_ETH_CLK_EN		BIT(23)
+#define MT7621_PCIE0_CLK_EN		BIT(24)
+#define MT7621_PCIE1_CLK_EN		BIT(25)
+#define MT7621_PCIE2_CLK_EN		BIT(26)
+#define MT7621_CRYPTO_CLK_EN		BIT(29)
+#define MT7621_SHXC_CLK_EN		BIT(30)
+
+struct mt7621_clk_provider {
+	struct device_node *node;
+	struct device *dev;
+	struct regmap *syscon_regmap;
+	struct clk_hw_onecell_data *clk_data;
+};
+
+struct mt7621_gate {
+	u8 idx;
+	const char *name;
+	const char *parent_name;
+	struct mt7621_clk_provider *clk_prov;
+	struct clk_hw hw;
+	u32 bit_idx;
+};
+
+struct mt7621_gate_data {
+	u8 idx;
+	const char *name;
+	const char *parent_name;
+	u32 bit_idx;
+};
+
+#define GATE(_id, _name, _pname, _shift)	\
+	{					\
+		.idx		= _id,		\
+		.name		= _name,	\
+		.parent_name	= _pname,	\
+		.bit_idx	= _shift	\
+	}
+
+static const struct mt7621_gate mt7621_gates[] = {
+	GATE(MT7621_CLK_HSDMA, "hsdma", "ahb", MT7621_HSDMA_CLK_EN),
+	GATE(MT7621_CLK_FE, "fe", "ahb", MT7621_FE_CLK_EN),
+	GATE(MT7621_CLK_SP_DIVTX, "sp_divtx", "ahb", MT7621_SP_DIVTX_CLK_EN),
+	GATE(MT7621_CLK_TIMER, "timer", "cpu", MT7621_TIMER_CLK_EN),
+	GATE(MT7621_CLK_INT, "int", "cpu", MT7621_INT_CLK_EN),
+	GATE(MT7621_CLK_MC, "mc", "ahb", MT7621_MC_CLK_EN),
+	GATE(MT7621_CLK_PCM, "pcm", "ahb", MT7621_PCM_CLK_EN),
+	GATE(MT7621_CLK_PIO, "pio", "ahb", MT7621_PIO_CLK_EN),
+	GATE(MT7621_CLK_GDMA, "gdma", "ahb", MT7621_GDMA_CLK_EN),
+	GATE(MT7621_CLK_NAND, "nand", "ahb", MT7621_NAND_CLK_EN),
+	GATE(MT7621_CLK_I2C, "i2c", "ahb", MT7621_I2C_CLK_EN),
+	GATE(MT7621_CLK_I2S, "i2s", "ahb", MT7621_I2S_CLK_EN),
+	GATE(MT7621_CLK_SPI, "spi", "ahb", MT7621_SPI_CLK_EN),
+	GATE(MT7621_CLK_UART1, "uart1", "apb", MT7621_UART1_CLK_EN),
+	GATE(MT7621_CLK_UART2, "uart2", "apb", MT7621_UART2_CLK_EN),
+	GATE(MT7621_CLK_UART3, "uart3", "apb", MT7621_UART3_CLK_EN),
+	GATE(MT7621_CLK_ETH, "eth", "ahb", MT7621_ETH_CLK_EN),
+	GATE(MT7621_CLK_PCIE0, "pcie0", "ahb", MT7621_PCIE0_CLK_EN),
+	GATE(MT7621_CLK_PCIE1, "pcie1", "ahb", MT7621_PCIE1_CLK_EN),
+	GATE(MT7621_CLK_PCIE2, "pcie2", "ahb", MT7621_PCIE2_CLK_EN),
+	GATE(MT7621_CLK_CRYPTO, "crypto", "ahb", MT7621_CRYPTO_CLK_EN),
+	GATE(MT7621_CLK_SHXC, "shxc", "ahb", MT7621_SHXC_CLK_EN)
+};
+
+static inline struct mt7621_gate *to_mt7621_gate(struct clk_hw *hw)
+{
+	return container_of(hw, struct mt7621_gate, hw);
+}
+
+static int mt7621_gate_enable(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
+
+	return regmap_update_bits(scon, SYSC_REG_CLKCFG1,
+				  clk_gate->bit_idx, clk_gate->bit_idx);
+}
+
+static void mt7621_gate_disable(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
+
+	regmap_update_bits(scon, SYSC_REG_CLKCFG1, clk_gate->bit_idx, 0);
+}
+
+static int mt7621_gate_is_enabled(struct clk_hw *hw)
+{
+	struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
+	struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
+	unsigned int val;
+
+	if (regmap_read(scon, SYSC_REG_CLKCFG1, &val))
+		return 0;
+
+	return val & clk_gate->bit_idx;
+}
+
+static const struct clk_ops mt7621_gate_ops = {
+	.enable = mt7621_gate_enable,
+	.disable = mt7621_gate_disable,
+	.is_enabled = mt7621_gate_is_enabled,
+};
+
+static int mt7621_gate_ops_init(struct device *dev, struct mt7621_gate *sclk)
+{
+	struct clk_init_data init = {
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.num_parents = 1,
+		.parent_names = &sclk->parent_name,
+		.ops = &mt7621_gate_ops,
+		.name = sclk->name,
+	};
+
+	sclk->hw.init = &init;
+	return devm_clk_hw_register(dev, &sclk->hw);
+}
+
+static int mt7621_register_gates(struct mt7621_clk_provider *clk_prov)
+{
+	struct clk_hw_onecell_data **clk_data = &clk_prov->clk_data;
+	struct device *dev = clk_prov->dev;
+	int idx, err, count;
+	struct clk_hw **hws;
+
+	count = ARRAY_SIZE(mt7621_gates);
+	*clk_data = devm_kzalloc(dev, struct_size(*clk_data, hws, count),
+				 GFP_KERNEL);
+	if (!*clk_data)
+		return -ENOMEM;
+
+	(*clk_data)->num = count;
+	hws = (*clk_data)->hws;
+
+	for (idx = 0; idx < ARRAY_SIZE(mt7621_gates); idx++) {
+		struct mt7621_gate *sclk;
+
+		sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
+		if (!sclk)
+			return -ENOMEM;
+
+		sclk->idx = mt7621_gates[idx].idx;
+		sclk->name = mt7621_gates[idx].name;
+		sclk->parent_name = mt7621_gates[idx].parent_name;
+		sclk->bit_idx = mt7621_gates[idx].bit_idx;
+		sclk->clk_prov = clk_prov;
+
+		err = mt7621_gate_ops_init(dev, sclk);
+		if (err) {
+			dev_err(dev, "failed to register clock %d\n", idx);
+			devm_kfree(dev, sclk);
+			hws[idx] = NULL;
+		} else {
+			dev_info(dev, "Registered clock gate: %s\n",
+				 mt7621_gates[idx].name);
+			hws[idx] = &sclk->hw;
+		}
+	}
+
+	return 0;
+}
+
+static int mt7621_clk_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct mt7621_clk_provider *clk_provider;
+	int ret;
+
+	clk_provider = devm_kzalloc(dev, sizeof(*clk_provider), GFP_KERNEL);
+	if (!clk_provider)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, clk_provider);
+	clk_provider->syscon_regmap = syscon_regmap_lookup_by_phandle(node, "ralink,sysctl");
+	if (IS_ERR(clk_provider->syscon_regmap)) {
+		dev_err(dev, "Could not get syscon regmap\n");
+		return -EINVAL;
+	}
+
+	clk_provider->node = node;
+	clk_provider->dev = dev;
+
+	ret = mt7621_register_gates(clk_provider);
+	if (ret) {
+		dev_err(dev, "Error registering gates\n");
+		return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   clk_provider->clk_data);
+}
+
+static int clk_mt7621_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = mt7621_clk_init(pdev);
+	if (ret) {
+		dev_err(dev, "Could not register clock provider: %s: %d\n",
+			pdev->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id of_match_clk_mt7621[] = {
+	{ .compatible = "mediatek,mt7621-clk", .data = mt7621_clk_init },
+	{}
+};
+
+static struct platform_driver clk_mt7621_drv = {
+	.probe = clk_mt7621_probe,
+	.driver = {
+		.name = "clk-mt7621",
+		.of_match_table = of_match_clk_mt7621,
+	},
+};
+builtin_platform_driver(clk_mt7621_drv);
+
+MODULE_AUTHOR("Sergio Paracuellos <sergio.paracuellos@gmail.com>");
+MODULE_DESCRIPTION("Mediatek Mt7621 clock gate driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

