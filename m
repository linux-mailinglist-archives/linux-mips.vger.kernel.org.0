Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 868745F7F7
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jul 2019 14:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbfGDMXn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Jul 2019 08:23:43 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36022 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbfGDMXm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Jul 2019 08:23:42 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so6456906wrs.3;
        Thu, 04 Jul 2019 05:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LiFnKD1FtvBo8kSmzMIYIO/MoJnHPXU0N9jBF2t7Wc0=;
        b=vUkpBl0FxH4a/0j/gzsRvsciDnttd+QceI47tfBdWIOod/Vd+dDIUZadwZWmQEGJUT
         cPlQIJgyJc3I6jqf508azbpQuK36Ly5oROgCjEIaspdO1tLY4XzKOLNQFB+m/eLuenKO
         gpPCDRoaOhst2PwvFg3oc8kLf8sa49lrIbi0Stk5zzCEYHmxZ0Lv+kw9kqVKvoBalJTe
         mJNlCE0xtrEIITuJFFJY1PKNjRMNYUOvMq+VI7eunuo59r4JXvEosHRRnCkyBh7gCGb4
         jJJsEMIsfQJ18Rlm2wSwQz2rjsmB7I8mscI6fl6c4Z0rU/kGGV2NVtGn2+NsLzRbyEl2
         x1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LiFnKD1FtvBo8kSmzMIYIO/MoJnHPXU0N9jBF2t7Wc0=;
        b=lh6G1Bu9kCAQFw/PrHKNjxs2t1QGKMTw6DoseshIdgbg6otz45SYRj1GkosvoycvvK
         6anKJ+ZcKdrHaYEXYsp5o2hOLu5GR82lwAN23xmyI+bWy/KCup+TlZwoK9QQIz3nHaO4
         xQYFpY++aHeDb9FnWdBExs6SZCCcuT4+QVlJMCx1e+n4ZyxfyUqBrF07bSW3dFm6VYkP
         fRwBzhe3Vc7b+uTuRL/up59J+0CuAuaO/d88OGG5M80yPPICXgXrzq16bwOfxvSa41C9
         zUGOP9cgP/Kgz8MwP0fm2KyZGSD80RHSuf5o0jGhlr20Z89EYsI7IP2+3pTSgQ9jdb3p
         ZFKQ==
X-Gm-Message-State: APjAAAX0zDpT5X4Wo5NYshWjUbxv0oVqZL8L3L4diHkA3yb4TlI7Km+u
        gsiyfq1IXpLr4d0bEoBvgxDT1jPm
X-Google-Smtp-Source: APXvYqxYT4dPDx/ayYnX2p2FKVDJ4rTEZg8Yv9+2x50haqn1zYVFI9hoMXbBEIJCcJDdWQSZ+iB/Kg==
X-Received: by 2002:adf:c613:: with SMTP id n19mr4965599wrg.109.1562243019878;
        Thu, 04 Jul 2019 05:23:39 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D6200090FB6F2A0C02D39B.dip0.t-ipconnect.de. [2003:f1:33d6:2000:90fb:6f2a:c02:d39b])
        by smtp.googlemail.com with ESMTPSA id w10sm5141825wru.76.2019.07.04.05.23.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 04 Jul 2019 05:23:39 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        paul.burton@mips.com, ralf@linux-mips.org, mark.rutland@arm.com,
        ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/4] phy: lantiq: vrx200-pcie: add a driver for the Lantiq VRX200 PCIe PHY
Date:   Thu,  4 Jul 2019 14:23:17 +0200
Message-Id: <20190704122319.8983-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
References: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Lantiq VRX200 SoCs embed a PCIe PHY in the "sram" bus. Unlike most
other IP blocks on this SoC the register values are only 16-bit wide.
Like other IP blocks on this SoC the register values are in big endian.

The PHY embeds a PLL which can be configured in various modes. Only the
36MHz mode is supported for now, the other modes can be implemented when
there's a board which actually needs them. OpenWrt uses the out-of-tree
vendor driver and all supported boards there only need the 36MHz mode.

There are two input clocks:
- the "pdi" clock enables the register access
- the "phy" clock is the clock input and enables the internal PLL

There are two reset lines:
- "phy" resets the PHY itself
- the "pcie" reset line is shared between the PHY and the PCIe
  controller

While the VRX200 SoC has only one PCIe controller and PHY the ARX300
uses two identical PCIe controllers and PHYs which are compatible with
the PCIe controller and PHY on VRX200.
Add a driver for this PHY so PCIe support can be enabled on these SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/lantiq/Kconfig                  |  11 +
 drivers/phy/lantiq/Makefile                 |   1 +
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c | 494 ++++++++++++++++++++
 3 files changed, 506 insertions(+)
 create mode 100644 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c

diff --git a/drivers/phy/lantiq/Kconfig b/drivers/phy/lantiq/Kconfig
index eb66c857ce25..c4df9709d53f 100644
--- a/drivers/phy/lantiq/Kconfig
+++ b/drivers/phy/lantiq/Kconfig
@@ -2,6 +2,17 @@
 #
 # Phy drivers for Lantiq / Intel platforms
 #
+config PHY_LANTIQ_VRX200_PCIE
+	tristate "Lantiq VRX200/ARX300 PCIe PHY"
+	depends on SOC_TYPE_XWAY || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Support for the PCIe PHY(s) on the Lantiq / Intel VRX200 and ARX300
+	  family SoCs.
+	  If unsure, say N.
+
 config PHY_LANTIQ_RCU_USB2
 	tristate "Lantiq XWAY SoC RCU based USB PHY"
 	depends on OF && (SOC_TYPE_XWAY || COMPILE_TEST)
diff --git a/drivers/phy/lantiq/Makefile b/drivers/phy/lantiq/Makefile
index 540049039092..7c14eb24ab73 100644
--- a/drivers/phy/lantiq/Makefile
+++ b/drivers/phy/lantiq/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_PHY_LANTIQ_RCU_USB2)	+= phy-lantiq-rcu-usb2.o
+obj-$(CONFIG_PHY_LANTIQ_VRX200_PCIE)	+= phy-lantiq-vrx200-pcie.o
diff --git a/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
new file mode 100644
index 000000000000..544d64a84cc0
--- /dev/null
+++ b/drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
@@ -0,0 +1,494 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PCIe PHY driver for Lantiq VRX200 and ARX300 SoCs.
+ *
+ * Copyright (C) 2019 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ *
+ * Based on the BSP (called "UGW") driver:
+ *  Copyright (C) 2009-2015 Lei Chuanhua <chuanhua.lei@lantiq.com>
+ *  Copyright (C) 2016 Intel Corporation
+ *
+ * TODO: PHY modes other than 36MHz (without "SSC")
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
+
+#define PCIE_PHY_PLL_CTRL1				0x44
+
+#define PCIE_PHY_PLL_CTRL2				0x46
+#define PCIE_PHY_PLL_CTRL2_CONST_SDM_MASK		GENMASK(7, 0)
+#define PCIE_PHY_PLL_CTRL2_CONST_SDM_EN			BIT(8)
+#define PCIE_PHY_PLL_CTRL2_PLL_SDM_EN			BIT(9)
+
+#define PCIE_PHY_PLL_CTRL3				0x48
+#define PCIE_PHY_PLL_CTRL3_EXT_MMD_DIV_RATIO_EN		BIT(1)
+#define PCIE_PHY_PLL_CTRL3_EXT_MMD_DIV_RATIO_MASK	GENMASK(6, 4)
+
+#define PCIE_PHY_PLL_CTRL4				0x4a
+#define PCIE_PHY_PLL_CTRL5				0x4c
+#define PCIE_PHY_PLL_CTRL6				0x4e
+#define PCIE_PHY_PLL_CTRL7				0x50
+#define PCIE_PHY_PLL_A_CTRL1				0x52
+
+#define PCIE_PHY_PLL_A_CTRL2				0x54
+#define PCIE_PHY_PLL_A_CTRL2_LF_MODE_EN			BIT(14)
+
+#define PCIE_PHY_PLL_A_CTRL3				0x56
+#define PCIE_PHY_PLL_A_CTRL3_MMD_MASK			GENMASK(15, 13)
+
+#define PCIE_PHY_PLL_STATUS				0x58
+
+#define PCIE_PHY_TX1_CTRL1				0x60
+#define PCIE_PHY_TX1_CTRL1_FORCE_EN			BIT(3)
+#define PCIE_PHY_TX1_CTRL1_LOAD_EN			BIT(4)
+
+#define PCIE_PHY_TX1_CTRL2				0x62
+#define PCIE_PHY_TX1_CTRL3				0x64
+#define PCIE_PHY_TX1_A_CTRL1				0x66
+#define PCIE_PHY_TX1_A_CTRL2				0x68
+#define PCIE_PHY_TX1_MOD1				0x6a
+#define PCIE_PHY_TX1_MOD2				0x6c
+#define PCIE_PHY_TX1_MOD3				0x6e
+
+#define PCIE_PHY_TX2_CTRL1				0x70
+#define PCIE_PHY_TX2_CTRL1_LOAD_EN			BIT(4)
+
+#define PCIE_PHY_TX2_CTRL2				0x72
+#define PCIE_PHY_TX2_A_CTRL1				0x76
+#define PCIE_PHY_TX2_A_CTRL2				0x78
+#define PCIE_PHY_TX2_MOD1				0x7a
+#define PCIE_PHY_TX2_MOD2				0x7c
+#define PCIE_PHY_TX2_MOD3				0x7e
+
+#define PCIE_PHY_RX1_CTRL1				0xa0
+#define PCIE_PHY_RX1_CTRL1_LOAD_EN			BIT(1)
+
+#define PCIE_PHY_RX1_CTRL2				0xa2
+#define PCIE_PHY_RX1_CDR				0xa4
+#define PCIE_PHY_RX1_EI					0xa6
+#define PCIE_PHY_RX1_A_CTRL				0xaa
+
+struct ltq_vrx200_pcie_phy_priv {
+	struct phy			*phy;
+	unsigned int			mode;
+	struct device			*dev;
+	struct regmap			*phy_regmap;
+	struct regmap			*rcu_regmap;
+	struct clk			*pdi_clk;
+	struct clk			*phy_clk;
+	struct reset_control		*phy_reset;
+	struct reset_control		*pcie_reset;
+	u32				rcu_ahb_endian_offset;
+	u32				rcu_ahb_endian_big_endian_mask;
+};
+
+static void ltq_vrx200_pcie_phy_common_setup(struct phy *phy)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = phy_get_drvdata(phy);
+
+	/* PLL Setting */
+	regmap_write(priv->phy_regmap, PCIE_PHY_PLL_A_CTRL1, 0x120e);
+
+	/* increase the bias reference voltage */
+	regmap_write(priv->phy_regmap, PCIE_PHY_PLL_A_CTRL2, 0x39d7);
+	regmap_write(priv->phy_regmap, PCIE_PHY_PLL_A_CTRL3, 0x0900);
+
+	/* Endcnt */
+	regmap_write(priv->phy_regmap, PCIE_PHY_RX1_EI, 0x0004);
+	regmap_write(priv->phy_regmap, PCIE_PHY_RX1_A_CTRL, 0x6803);
+
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_TX1_CTRL1,
+			   PCIE_PHY_TX1_CTRL1_FORCE_EN,
+			   PCIE_PHY_TX1_CTRL1_FORCE_EN);
+
+	/* predrv_ser_en */
+	regmap_write(priv->phy_regmap, PCIE_PHY_TX1_A_CTRL2, 0x0706);
+
+	/* ctrl_lim */
+	regmap_write(priv->phy_regmap, PCIE_PHY_TX1_CTRL3, 0x1fff);
+
+	/* ctrl */
+	regmap_write(priv->phy_regmap, PCIE_PHY_TX1_A_CTRL1, 0x0810);
+
+	/* predrv_ser_en */
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_TX2_A_CTRL2, 0x7f00,
+			   0x4700);
+
+	/* RTERM */
+	regmap_write(priv->phy_regmap, PCIE_PHY_TX1_CTRL2, 0x2e00);
+
+	/* Improved 100MHz clock output  */
+	regmap_write(priv->phy_regmap, PCIE_PHY_TX2_CTRL2, 0x3096);
+	regmap_write(priv->phy_regmap, PCIE_PHY_TX2_A_CTRL2, 0x4707);
+
+	/* Reduced CDR BW to avoid glitches */
+	regmap_write(priv->phy_regmap, PCIE_PHY_RX1_CDR, 0x0235);
+}
+
+static void pcie_phy_36mhz_mode_setup(struct phy *phy)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = phy_get_drvdata(phy);
+
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_PLL_CTRL3,
+			   PCIE_PHY_PLL_CTRL3_EXT_MMD_DIV_RATIO_EN, 0x0000);
+
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_PLL_CTRL3,
+			   PCIE_PHY_PLL_CTRL3_EXT_MMD_DIV_RATIO_MASK, 0x0000);
+
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_PLL_CTRL2,
+			   PCIE_PHY_PLL_CTRL2_PLL_SDM_EN,
+			   PCIE_PHY_PLL_CTRL2_PLL_SDM_EN);
+
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_PLL_CTRL2,
+			   PCIE_PHY_PLL_CTRL2_CONST_SDM_EN,
+			   PCIE_PHY_PLL_CTRL2_CONST_SDM_EN);
+
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_PLL_A_CTRL3,
+			   PCIE_PHY_PLL_A_CTRL3_MMD_MASK,
+			   FIELD_PREP(PCIE_PHY_PLL_A_CTRL3_MMD_MASK, 0x1));
+
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_PLL_A_CTRL2,
+			   PCIE_PHY_PLL_A_CTRL2_LF_MODE_EN, 0x0000);
+
+	/* const_sdm */
+	regmap_write(priv->phy_regmap, PCIE_PHY_PLL_CTRL1, 0x38e4);
+
+	regmap_update_bits(priv->phy_regmap, PCIE_PHY_PLL_CTRL2,
+			   PCIE_PHY_PLL_CTRL2_CONST_SDM_MASK,
+			   FIELD_PREP(PCIE_PHY_PLL_CTRL2_CONST_SDM_MASK,
+				      0xee));
+
+	/* pllmod */
+	regmap_write(priv->phy_regmap, PCIE_PHY_PLL_CTRL7, 0x0002);
+	regmap_write(priv->phy_regmap, PCIE_PHY_PLL_CTRL6, 0x3a04);
+	regmap_write(priv->phy_regmap, PCIE_PHY_PLL_CTRL5, 0xfae3);
+	regmap_write(priv->phy_regmap, PCIE_PHY_PLL_CTRL4, 0x1b72);
+}
+
+static int ltq_vrx200_pcie_phy_wait_for_pll(struct phy *phy)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = phy_get_drvdata(phy);
+	unsigned int tmp;
+	int ret;
+
+	ret = regmap_read_poll_timeout(priv->phy_regmap, PCIE_PHY_PLL_STATUS,
+				       tmp, ((tmp & 0x0070) == 0x0070), 10,
+				       10000);
+	if (ret) {
+		dev_err(priv->dev, "PLL Link timeout, PLL status = 0x%04x\n",
+			tmp);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ltq_vrx200_pcie_phy_apply_workarounds(struct phy *phy)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = phy_get_drvdata(phy);
+	static const struct reg_default slices[] =  {
+		{
+			.reg = PCIE_PHY_TX1_CTRL1,
+			.def = PCIE_PHY_TX1_CTRL1_LOAD_EN,
+		},
+		{
+			.reg = PCIE_PHY_TX2_CTRL1,
+			.def = PCIE_PHY_TX2_CTRL1_LOAD_EN,
+		},
+		{
+			.reg = PCIE_PHY_RX1_CTRL1,
+			.def = PCIE_PHY_RX1_CTRL1_LOAD_EN,
+		}
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(slices); i++) {
+		/* enable load_en */
+		regmap_update_bits(priv->phy_regmap, slices[i].reg,
+				   slices[i].def, slices[i].def);
+
+		udelay(1);
+
+		/* disable load_en */
+		regmap_update_bits(priv->phy_regmap, slices[i].reg,
+				   slices[i].def, 0x0);
+	}
+
+	for (i = 0; i < 5; i++) {
+		/* TX2 modulation */
+		regmap_write(priv->phy_regmap, PCIE_PHY_TX2_MOD1, 0x1ffe);
+		regmap_write(priv->phy_regmap, PCIE_PHY_TX2_MOD2, 0xfffe);
+		regmap_write(priv->phy_regmap, PCIE_PHY_TX2_MOD3, 0x0601);
+		usleep_range(1000, 2000);
+		regmap_write(priv->phy_regmap, PCIE_PHY_TX2_MOD3, 0x0001);
+
+		/* TX1 modulation */
+		regmap_write(priv->phy_regmap, PCIE_PHY_TX1_MOD1, 0x1ffe);
+		regmap_write(priv->phy_regmap, PCIE_PHY_TX1_MOD2, 0xfffe);
+		regmap_write(priv->phy_regmap, PCIE_PHY_TX1_MOD3, 0x0601);
+		usleep_range(1000, 2000);
+		regmap_write(priv->phy_regmap, PCIE_PHY_TX1_MOD3, 0x0001);
+	}
+}
+
+static int ltq_vrx200_pcie_phy_init(struct phy *phy)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	if (of_device_is_big_endian(priv->dev->of_node))
+		regmap_update_bits(priv->rcu_regmap,
+				   priv->rcu_ahb_endian_offset,
+				   priv->rcu_ahb_endian_big_endian_mask,
+				   priv->rcu_ahb_endian_big_endian_mask);
+	else
+		regmap_update_bits(priv->rcu_regmap,
+				   priv->rcu_ahb_endian_offset,
+				   priv->rcu_ahb_endian_big_endian_mask, 0x0);
+
+	ret = reset_control_assert(priv->phy_reset);
+	if (ret)
+		goto err;
+
+	udelay(1);
+
+	ret = reset_control_deassert(priv->phy_reset);
+	if (ret)
+		goto err;
+
+	udelay(1);
+
+	ret = reset_control_deassert(priv->pcie_reset);
+	if (ret)
+		goto err_assert_phy_reset;
+
+	/* Make sure PHY PLL is stable */
+	usleep_range(20, 40);
+
+	return 0;
+
+err_assert_phy_reset:
+	reset_control_assert(priv->phy_reset);
+err:
+	return ret;
+}
+
+static int ltq_vrx200_pcie_phy_exit(struct phy *phy)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = reset_control_assert(priv->pcie_reset);
+	if (ret)
+		return ret;
+
+	ret = reset_control_assert(priv->phy_reset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ltq_vrx200_pcie_phy_power_on(struct phy *phy)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	/* Enable PDI to access PCIe PHY register */
+	ret = clk_prepare_enable(priv->pdi_clk);
+	if (ret)
+		goto err;
+
+	/* Configure PLL and PHY clock */
+	ltq_vrx200_pcie_phy_common_setup(phy);
+
+	pcie_phy_36mhz_mode_setup(phy);
+
+	/* Enable the PCIe PHY and make PLL setting take effect */
+	ret = clk_prepare_enable(priv->phy_clk);
+	if (ret)
+		goto err_disable_pdi_clk;
+
+	/* Check if we are in "startup ready" status */
+	if (ltq_vrx200_pcie_phy_wait_for_pll(phy) != 0)
+		goto err_disable_phy_clk;
+
+	ltq_vrx200_pcie_phy_apply_workarounds(phy);
+
+	return 0;
+
+err_disable_phy_clk:
+	clk_disable_unprepare(priv->phy_clk);
+err_disable_pdi_clk:
+	clk_disable_unprepare(priv->pdi_clk);
+err:
+	return ret;
+}
+
+static int ltq_vrx200_pcie_phy_power_off(struct phy *phy)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(priv->phy_clk);
+	clk_disable_unprepare(priv->pdi_clk);
+
+	return 0;
+}
+
+static struct phy_ops ltq_vrx200_pcie_phy_ops = {
+	.init		= ltq_vrx200_pcie_phy_init,
+	.exit		= ltq_vrx200_pcie_phy_exit,
+	.power_on	= ltq_vrx200_pcie_phy_power_on,
+	.power_off	= ltq_vrx200_pcie_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static struct phy *ltq_vrx200_pcie_phy_xlate(struct device *dev,
+					     struct of_phandle_args *args)
+{
+	struct ltq_vrx200_pcie_phy_priv *priv = dev_get_drvdata(dev);
+	unsigned int mode;
+
+	if (args->args_count != 1) {
+		dev_err(dev, "invalid number of arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	mode = args->args[0];
+
+	switch (mode) {
+	case LANTIQ_PCIE_PHY_MODE_36MHZ:
+		priv->mode = mode;
+		break;
+
+	case LANTIQ_PCIE_PHY_MODE_25MHZ:
+	case LANTIQ_PCIE_PHY_MODE_25MHZ_SSC:
+	case LANTIQ_PCIE_PHY_MODE_36MHZ_SSC:
+	case LANTIQ_PCIE_PHY_MODE_100MHZ:
+	case LANTIQ_PCIE_PHY_MODE_100MHZ_SSC:
+		dev_err(dev, "PHY mode not implemented yet: %u\n", mode);
+		return ERR_PTR(-EINVAL);
+
+	default:
+		dev_err(dev, "invalid PHY mode %u\n", mode);
+		return ERR_PTR(-EINVAL);
+	};
+
+	return priv->phy;
+}
+
+static int ltq_vrx200_pcie_phy_probe(struct platform_device *pdev)
+{
+	static const struct regmap_config regmap_config = {
+		.reg_bits = 8,
+		.val_bits = 16,
+		.reg_stride = 2,
+		.max_register = PCIE_PHY_RX1_A_CTRL,
+	};
+	struct ltq_vrx200_pcie_phy_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct resource *res;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->phy_regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(priv->phy_regmap))
+		return PTR_ERR(priv->phy_regmap);
+
+	priv->rcu_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+							   "lantiq,rcu");
+	if (IS_ERR(priv->rcu_regmap))
+		return PTR_ERR(priv->rcu_regmap);
+
+	ret = device_property_read_u32(dev, "lantiq,rcu-endian-offset",
+				       &priv->rcu_ahb_endian_offset);
+	if (ret) {
+		dev_err(dev,
+			"failed to parse the 'lantiq,rcu-endian-offset' property\n");
+		return ret;
+	}
+
+	ret = device_property_read_u32(dev, "lantiq,rcu-big-endian-mask",
+				       &priv->rcu_ahb_endian_big_endian_mask);
+	if (ret) {
+		dev_err(dev,
+			"failed to parse the 'lantiq,rcu-big-endian-mask' property\n");
+		return ret;
+	}
+
+	priv->pdi_clk = devm_clk_get(dev, "pdi");
+	if (IS_ERR(priv->pdi_clk))
+		return PTR_ERR(priv->pdi_clk);
+
+	priv->phy_clk = devm_clk_get(dev, "phy");
+	if (IS_ERR(priv->phy_clk))
+		return PTR_ERR(priv->phy_clk);
+
+	priv->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
+	if (IS_ERR(priv->phy_reset))
+		return PTR_ERR(priv->phy_reset);
+
+	priv->pcie_reset = devm_reset_control_get_shared(dev, "pcie");
+	if (IS_ERR(priv->pcie_reset))
+		return PTR_ERR(priv->pcie_reset);
+
+	priv->dev = dev;
+
+	priv->phy = devm_phy_create(dev, dev->of_node,
+				    &ltq_vrx200_pcie_phy_ops);
+	if (IS_ERR(priv->phy)) {
+		dev_err(dev, "failed to create PHY\n");
+		return PTR_ERR(priv->phy);
+	}
+
+	phy_set_drvdata(priv->phy, priv);
+	dev_set_drvdata(dev, priv);
+
+	provider = devm_of_phy_provider_register(dev,
+						 ltq_vrx200_pcie_phy_xlate);
+
+	return PTR_ERR_OR_ZERO(provider);
+}
+
+static const struct of_device_id ltq_vrx200_pcie_phy_of_match[] = {
+	{ .compatible = "lantiq,vrx200-pcie-phy", },
+	{ .compatible = "lantiq,arx300-pcie-phy", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ltq_vrx200_pcie_phy_of_match);
+
+static struct platform_driver ltq_vrx200_pcie_phy_driver = {
+	.probe	= ltq_vrx200_pcie_phy_probe,
+	.driver = {
+		.name	= "ltq-vrx200-pcie-phy",
+		.of_match_table	= ltq_vrx200_pcie_phy_of_match,
+	}
+};
+module_platform_driver(ltq_vrx200_pcie_phy_driver);
+
+MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
+MODULE_DESCRIPTION("Lantiq VRX200 and ARX300 PCIe PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.22.0

