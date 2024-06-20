Return-Path: <linux-mips+bounces-3787-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55293910EC3
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CF10B284E6
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A5E1B9AC2;
	Thu, 20 Jun 2024 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eXUpBmyf"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325181B4C43;
	Thu, 20 Jun 2024 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904711; cv=none; b=UHjH6CMCFVQq8SVeFOHh7KRCfblpy1Fk00YulkIqU6C2m8emnknumB2WHuAAQA2z5hm4A7XlIdOOPEE0UbEZKQ0d1pzKksyD1sse/Qo0Jhd58OCYQXUxml/dZoBwsv4XgWENv7vPuKPpQIVAyN904ixbH3ilfFvNN9Yafh1am50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904711; c=relaxed/simple;
	bh=pxLT839/qtIiYSR6kEcF2XLVFIsupXMgC5Uc7iUFgLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Plft3wQT/tZo2j++Bbf4Or18cc/s2tyXsidE37BXCseK08MysI1z2MtbUhVWqfpExIQJOsqpta1isB+DWVJ3hxjRro7deQ3VV+8lOGjFXITAVbzFR9qiKpU2AUQC9aYg4d1Oci1KmP6qUdFniQvQWAc/bX7cuujQn+YvJDj30jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eXUpBmyf; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7B041C0007;
	Thu, 20 Jun 2024 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718904706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MoSKLxtZs/RbiGoA3+nhkLigmm9+prA+5eu7d4o1HtQ=;
	b=eXUpBmyfaNQHD/QroZns+m5HjGnAGgT4d4qTUT5RR1QUxpHmrSFbZfe/AcGxgpoO2t6XVQ
	cAmLux1yUQwxY29Dn8oFzb4hpl1dQLI541LllNl61Gz/xd931prgR0lNtTVWMfLzmimjNj
	1wdePgff5ft2JOBqfPg7YpwKwj8YTRBWeXDJ0nbRhbLVHaVvQVPVt5R8YIobChgbon8BKc
	DMQlC0/rNPIDmDUTtP58h5RqUgqqwmGXybqmYkLelDvq2F+6hFTk0rTvtqqY6I0DguC1kN
	tOyvsTutGSDUZqOXF/FR+Fkb2ZoVIPVdWWDnqXL1rHSKiO+nEovx3lZpEPIIqQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 20 Jun 2024 19:30:58 +0200
Subject: [PATCH v3 6/9] clk: eyeq: add driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240620-mbly-olb-v3-6-5f29f8ca289c@bootlin.com>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
In-Reply-To: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: theo.lebrun@bootlin.com

Add Mobileye EyeQ5, EyeQ6L and EyeQ6H clock controller driver. It is
both a platform driver and a hook onto of_clk_init() used for clocks
required early (GIC timer, UARTs).

For some compatible, it is both at the same time. eqc_init() initialises
early PLLs and stores clock array in a static linked list. It marks
other clocks as deferred. eqc_probe() retrieves the clock array and
adds all remaining clocks.

It exposes read-only PLLs derived from the main crystal on board. It
also exposes another type of clocks: divider clocks. They always have
even divisors and have one PLL as parent.

This driver also bears the responsability for optional reset and pinctrl
auxiliary devices. The match data attached to the devicetree node
compatible indicate if such devices should be created. They all get
passed a pointer to the start of the OLB region.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 MAINTAINERS            |   1 +
 drivers/clk/Kconfig    |  12 +
 drivers/clk/Makefile   |   1 +
 drivers/clk/clk-eyeq.c | 789 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 803 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcc9f4364a5d..f386e9da2cd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14930,6 +14930,7 @@ F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
+F:	drivers/clk/clk-eyeq5.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
 
 MODULE SUPPORT
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 50af5fc7f570..c29615eec4af 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -218,6 +218,18 @@ config COMMON_CLK_EN7523
 	  This driver provides the fixed clocks and gates present on Airoha
 	  ARM silicon.
 
+config COMMON_CLK_EYEQ
+	bool "Clock driver for the Mobileye EyeQ platform"
+	depends on OF || COMPILE_TEST
+	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
+	select AUXILIARY_BUS
+	default MACH_EYEQ5 || MACH_EYEQ6H
+	help
+	  This driver provides clocks found on Mobileye EyeQ5, EyeQ6L and Eye6H
+	  SoCs. Controllers live in shared register regions called OLB. Driver
+	  provides read-only PLLs, derived from the main crystal clock (which
+	  must be constant). It also exposes some divider clocks.
+
 config COMMON_CLK_FSL_FLEXSPI
 	tristate "Clock driver for FlexSPI on Layerscape SoCs"
 	depends on ARCH_LAYERSCAPE || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 14fa8d4ecc1f..52de92309aa8 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
 obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
+obj-$(CONFIG_COMMON_CLK_EYEQ)		+= clk-eyeq.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
new file mode 100644
index 000000000000..5b5b11a4edb2
--- /dev/null
+++ b/drivers/clk/clk-eyeq.c
@@ -0,0 +1,789 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PLL clock driver for the Mobileye EyeQ5, EyeQ6L and EyeQ6H platforms.
+ *
+ * This controller handles read-only PLLs, all derived from the same main
+ * crystal clock. It also exposes divider clocks, those are children to PLLs.
+ * Parent clock is expected to be constant. This driver's registers live in
+ * a shared region called OLB. Some PLLs are initialised early by of_clk_init().
+ *
+ * We use eqc_ as prefix, as-in "EyeQ Clock", but way shorter.
+ *
+ * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
+ */
+
+/*
+ * Set pr_fmt() for printing from eqc_init().
+ * It is called at of_clk_init() stage (read: really early).
+ */
+#define pr_fmt(fmt) "clk-eyeq: " fmt
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
+
+#define EQC_MAX_DIV_COUNT		4
+
+/* In frac mode, it enables fractional noise canceling DAC. Else, no function. */
+#define PCSR0_DAC_EN			BIT(0)
+/* Fractional or integer mode */
+#define PCSR0_DSM_EN			BIT(1)
+#define PCSR0_PLL_EN			BIT(2)
+/* All clocks output held at 0 */
+#define PCSR0_FOUTPOSTDIV_EN		BIT(3)
+#define PCSR0_POST_DIV1			GENMASK(6, 4)
+#define PCSR0_POST_DIV2			GENMASK(9, 7)
+#define PCSR0_REF_DIV			GENMASK(15, 10)
+#define PCSR0_INTIN			GENMASK(27, 16)
+#define PCSR0_BYPASS			BIT(28)
+/* Bits 30..29 are reserved */
+#define PCSR0_PLL_LOCKED		BIT(31)
+
+#define PCSR1_RESET			BIT(0)
+#define PCSR1_SSGC_DIV			GENMASK(4, 1)
+/* Spread amplitude (% = 0.1 * SPREAD[4:0]) */
+#define PCSR1_SPREAD			GENMASK(9, 5)
+#define PCSR1_DIS_SSCG			BIT(10)
+/* Down-spread or center-spread */
+#define PCSR1_DOWN_SPREAD		BIT(11)
+#define PCSR1_FRAC_IN			GENMASK(31, 12)
+
+/*
+ * Driver might register clock provider from eqc_init() if PLLs are required
+ * early (before platform bus is ready). Store struct eqc_priv inside linked
+ * list to pass clock provider from eqc_init() to eqc_probe() and register
+ * remaining clocks from platform device probe.
+ *
+ * Clock provider is NOT created by eqc_init() if no early clock is required.
+ * Store as linked list because EyeQ6H has multiple clock controller instances.
+ * Matching is done based on devicetree node pointer.
+ */
+static DEFINE_SPINLOCK(eqc_list_slock);
+static LIST_HEAD(eqc_list);
+
+struct eqc_pll {
+	unsigned int	index;
+	const char	*name;
+	unsigned int	reg64;
+};
+
+/*
+ * Divider clock. Divider is 2*(v+1), with v the register value.
+ * Min divider is 2, max is 2*(2^width).
+ */
+struct eqc_div {
+	unsigned int	index;
+	const char	*name;
+	unsigned int	parent;
+	unsigned int	reg;
+	u8		shift;
+	u8		width;
+};
+
+struct eqc_match_data {
+	unsigned int		pll_count;
+	const struct eqc_pll	*plls;
+
+	unsigned int		div_count;
+	const struct eqc_div	*divs;
+
+	const char		*reset_auxdev_name;
+	const char		*pinctrl_auxdev_name;
+};
+
+struct eqc_early_match_data {
+	unsigned int		early_pll_count;
+	const struct eqc_pll	*early_plls;
+	/* Information required to init properly clk HW cells. */
+	unsigned int		nb_late_clks;
+};
+
+struct eqc_priv {
+	struct clk_hw_onecell_data	*cells;
+	const struct eqc_early_match_data *early_data;
+	const struct eqc_match_data	*data;
+	void __iomem			*base;
+	struct device_node		*np;
+	struct list_head		list;
+};
+
+/*
+ * Both factors (mult and div) must fit in 32 bits. When an operation overflows,
+ * this function throws away low bits so that factors still fit in 32 bits.
+ *
+ * Precision loss depends on amplitude of mult and div. Worst theorical
+ * loss is: (UINT_MAX+1) / UINT_MAX - 1 = 2.3e-10.
+ * This is 1Hz every 4.3GHz.
+ */
+static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
+{
+	unsigned long biggest;
+	unsigned int shift;
+
+	/* This function can be removed if mult/div switch to unsigned long. */
+	static_assert(sizeof_field(struct clk_fixed_factor, mult) == sizeof(unsigned int));
+	static_assert(sizeof_field(struct clk_fixed_factor, div) == sizeof(unsigned int));
+
+	/* No overflow, nothing to be done. */
+	if (*mult <= UINT_MAX && *div <= UINT_MAX)
+		return;
+
+	/*
+	 * Compute the shift required to bring the biggest factor into unsigned
+	 * int range. That is, shift its highest set bit to the unsigned int
+	 * most significant bit.
+	 */
+	biggest = max(*mult, *div);
+	shift = __fls(biggest) - (BITS_PER_BYTE * sizeof(unsigned int)) + 1;
+
+	*mult >>= shift;
+	*div >>= shift;
+}
+
+static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
+				   unsigned long *div, unsigned long *acc)
+{
+	if (r0 & PCSR0_BYPASS) {
+		*mult = 1;
+		*div = 1;
+		*acc = 0;
+		return 0;
+	}
+
+	if (!(r0 & PCSR0_PLL_LOCKED))
+		return -EINVAL;
+
+	*mult = FIELD_GET(PCSR0_INTIN, r0);
+	*div = FIELD_GET(PCSR0_REF_DIV, r0);
+	if (r0 & PCSR0_FOUTPOSTDIV_EN)
+		*div *= FIELD_GET(PCSR0_POST_DIV1, r0) * FIELD_GET(PCSR0_POST_DIV2, r0);
+
+	/* Fractional mode, in 2^20 (0x100000) parts. */
+	if (r0 & PCSR0_DSM_EN) {
+		*div *= 0x100000;
+		*mult = *mult * 0x100000 + FIELD_GET(PCSR1_FRAC_IN, r1);
+	}
+
+	if (!*mult || !*div)
+		return -EINVAL;
+
+	/* Spread spectrum. */
+	if (!(r1 & (PCSR1_RESET | PCSR1_DIS_SSCG))) {
+		/*
+		 * Spread is 1/1000 parts of frequency, accuracy is half of
+		 * that. To get accuracy, convert to ppb (parts per billion).
+		 */
+		u32 spread = FIELD_GET(PCSR1_SPREAD, r1);
+
+		*acc = spread * 500000;
+		if (r1 & PCSR1_DOWN_SPREAD) {
+			/*
+			 * Downspreading: the central frequency is half a
+			 * spread lower.
+			 */
+			*mult *= 2000 - spread;
+			*div *= 2000;
+
+			/*
+			 * Previous operation might overflow 32 bits. If it
+			 * does, throw away the least amount of low bits.
+			 */
+			eqc_pll_downshift_factors(mult, div);
+		}
+	} else {
+		*acc = 0;
+	}
+
+	return 0;
+}
+
+static unsigned int eqc_compute_clock_count(const struct eqc_early_match_data *early_data,
+					    const struct eqc_match_data *data)
+{
+	unsigned int i, nb_clks = 0, sum = 0;
+
+	if (early_data) {
+		sum += early_data->early_pll_count;
+
+		for (i = 0; i < early_data->early_pll_count; i++)
+			if (early_data->early_plls[i].index >= nb_clks)
+				nb_clks = early_data->early_plls[i].index + 1;
+	}
+
+	if (data) {
+		sum += data->pll_count + data->div_count;
+
+		for (i = 0; i < data->pll_count; i++)
+			if (data->plls[i].index >= nb_clks)
+				nb_clks = data->plls[i].index + 1;
+
+		for (i = 0; i < data->div_count; i++)
+			if (data->divs[i].index >= nb_clks)
+				nb_clks = data->divs[i].index + 1;
+	}
+
+	/* We expect the biggest clock index to be 1 below the clock count. */
+	WARN_ON(nb_clks != sum);
+
+	return nb_clks;
+}
+
+static void eqc_probe_init_plls(struct device *dev, struct eqc_priv *priv)
+{
+	const struct eqc_match_data *data = priv->data;
+	unsigned long mult, div, acc;
+	const struct eqc_pll *pll;
+	struct clk_hw *hw;
+	unsigned int i;
+	u32 r0, r1;
+	u64 val;
+	int ret;
+
+	for (i = 0; i < data->pll_count; i++) {
+		pll = &data->plls[i];
+
+		val = readq(priv->base + pll->reg64);
+		r0 = val;
+		r1 = val >> 32;
+
+		ret = eqc_pll_parse_registers(r0, r1, &mult, &div, &acc);
+		if (ret) {
+			dev_warn(dev, "failed parsing state of %s\n", pll->name);
+			priv->cells->hws[pll->index] = ERR_PTR(ret);
+			continue;
+		}
+
+		hw = clk_hw_register_fixed_factor_with_accuracy_fwname(dev,
+				dev->of_node, pll->name, "ref", 0, mult, div, acc);
+		priv->cells->hws[pll->index] = hw;
+		if (IS_ERR(hw))
+			dev_warn(dev, "failed registering %s: %pe\n", pll->name, hw);
+	}
+}
+
+static void eqc_probe_init_divs(struct platform_device *pdev, struct device *dev,
+				struct eqc_priv *priv)
+{
+	const struct eqc_match_data *data = priv->data;
+	const struct eqc_div *div;
+	struct clk_hw *parent;
+	void __iomem *reg;
+	struct clk_hw *hw;
+	unsigned int i;
+
+	for (i = 0; i < data->div_count; i++) {
+		div = &data->divs[i];
+		reg = priv->base + div->reg;
+		parent = priv->cells->hws[div->parent];
+
+		hw = clk_hw_register_divider_table_parent_hw(dev, div->name,
+				parent, 0, reg, div->shift, div->width,
+				CLK_DIVIDER_EVEN_INTEGERS, NULL, NULL);
+		priv->cells->hws[div->index] = hw;
+		if (IS_ERR(hw))
+			dev_warn(dev, "failed registering %s: %pe\n",
+				 div->name, hw);
+	}
+}
+
+static void eqc_auxdev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static void eqc_auxdev_unregister(void *arg)
+{
+	struct auxiliary_device *adev = arg;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int eqc_auxdev_create(struct device *dev, void __iomem *base,
+			     const char *name, u32 id)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = name;
+	adev->dev.parent = dev;
+	adev->dev.platform_data = base;
+	adev->dev.release = eqc_auxdev_release;
+	adev->id = id;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, eqc_auxdev_unregister, adev);
+}
+
+static int eqc_probe(struct platform_device *pdev)
+{
+	const struct eqc_match_data *data;
+	struct device *dev = &pdev->dev;
+	struct eqc_priv *priv = NULL;
+	struct eqc_priv *entry;
+	unsigned int nb_clks;
+	void __iomem *base;
+	int ret;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return 0; /* No clocks nor auxdevs, we are done. */
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	/* Init optional reset auxiliary device. */
+	if (data->reset_auxdev_name) {
+		ret = eqc_auxdev_create(dev, base, data->reset_auxdev_name, 0);
+		if (ret)
+			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
+				 KBUILD_MODNAME, data->reset_auxdev_name, ret);
+	}
+
+	/* Init optional pinctrl auxiliary device. */
+	if (data->pinctrl_auxdev_name) {
+		ret = eqc_auxdev_create(dev, base, data->pinctrl_auxdev_name, 0);
+		if (ret)
+			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
+				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
+	}
+
+	if (data->pll_count + data->div_count == 0)
+		return 0; /* Zero clocks, we are done. */
+
+	/* Try retrieving early init private data. */
+	spin_lock(&eqc_list_slock);
+	list_for_each_entry(entry, &eqc_list, list) {
+		if (entry->np == dev->of_node) {
+			priv = entry;
+			break;
+		}
+	}
+	spin_unlock(&eqc_list_slock);
+
+	if (!priv) {
+		/* Device did not get init early. Do it now. */
+
+		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+		if (!priv)
+			return -ENOMEM;
+
+		priv->np = dev->of_node;
+
+		nb_clks = eqc_compute_clock_count(NULL, data);
+		priv->cells = devm_kzalloc(dev, struct_size(priv->cells, hws, nb_clks),
+					   GFP_KERNEL);
+		if (!priv->cells)
+			return -ENOMEM;
+
+		priv->cells->num = nb_clks;
+	} else {
+		/*
+		 * Device got init early. Check clock count.
+		 *
+		 * eqc_init() should already know the exact clk count using
+		 * nb_late_clks field. We ensure computation was right and fix
+		 * clk cells if not.
+		 */
+		nb_clks = eqc_compute_clock_count(priv->early_data, data);
+		if (WARN_ON(nb_clks != priv->cells->num))
+			priv->cells->num = nb_clks;
+	}
+
+	priv->base = base;
+	priv->data = data;
+
+	eqc_probe_init_plls(dev, priv);
+
+	eqc_probe_init_divs(pdev, dev, priv);
+
+	/* Clock provider has not been registered by eqc_init(). Do it now. */
+	if (!priv->early_data) {
+		/* When providing a single clock, require no cell. */
+		if (priv->cells->num == 1)
+			ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+							  priv->cells->hws[0]);
+		else
+			ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+							  priv->cells);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct eqc_pll eqc_eyeq5_plls[] = {
+	{ .index = EQ5C_PLL_VMP,  .name = "pll-vmp",  .reg64 = 0x034 },
+	{ .index = EQ5C_PLL_PMA,  .name = "pll-pma",  .reg64 = 0x03C },
+	{ .index = EQ5C_PLL_VDI,  .name = "pll-vdi",  .reg64 = 0x044 },
+	{ .index = EQ5C_PLL_DDR0, .name = "pll-ddr0", .reg64 = 0x04C },
+	{ .index = EQ5C_PLL_PCI,  .name = "pll-pci",  .reg64 = 0x054 },
+	{ .index = EQ5C_PLL_PMAC, .name = "pll-pmac", .reg64 = 0x064 },
+	{ .index = EQ5C_PLL_MPC,  .name = "pll-mpc",  .reg64 = 0x06C },
+	{ .index = EQ5C_PLL_DDR1, .name = "pll-ddr1", .reg64 = 0x074 },
+};
+
+static const struct eqc_div eqc_eyeq5_divs[] = {
+	{
+		.index = EQ5C_DIV_OSPI,
+		.name = "div-ospi",
+		.parent = EQ5C_PLL_PER,
+		.reg = 0x11C,
+		.shift = 0,
+		.width = 4,
+	},
+};
+
+static const struct eqc_match_data eqc_eyeq5_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq5_plls),
+	.plls		= eqc_eyeq5_plls,
+
+	.div_count	= ARRAY_SIZE(eqc_eyeq5_divs),
+	.divs		= eqc_eyeq5_divs,
+
+	.reset_auxdev_name = "reset",
+	.pinctrl_auxdev_name = "pinctrl",
+};
+
+static const struct eqc_pll eqc_eyeq6l_plls[] = {
+	{ .index = EQ6LC_PLL_DDR, .name = "pll-ddr", .reg64 = 0x02C },
+	{ .index = EQ6LC_PLL_CPU, .name = "pll-cpu", .reg64 = 0x034 }, /* also acc */
+	{ .index = EQ6LC_PLL_PER, .name = "pll-per", .reg64 = 0x03C },
+	{ .index = EQ6LC_PLL_VDI, .name = "pll-vdi", .reg64 = 0x044 },
+};
+
+static const struct eqc_match_data eqc_eyeq6l_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq6l_plls),
+	.plls		= eqc_eyeq6l_plls,
+
+	.reset_auxdev_name = "reset",
+};
+
+static const struct eqc_match_data eqc_eyeq6h_west_match_data = {
+	.reset_auxdev_name = "reset_west",
+};
+
+static const struct eqc_pll eqc_eyeq6h_east_plls[] = {
+	{ .index = 0, .name = "pll-east", .reg64 = 0x074 },
+};
+
+static const struct eqc_match_data eqc_eyeq6h_east_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_east_plls),
+	.plls		= eqc_eyeq6h_east_plls,
+
+	.reset_auxdev_name = "reset_east",
+};
+
+static const struct eqc_pll eqc_eyeq6h_south_plls[] = {
+	{ .index = EQ6HC_SOUTH_PLL_VDI,  .name = "pll-vdi",  .reg64 = 0x000 },
+	{ .index = EQ6HC_SOUTH_PLL_PCIE, .name = "pll-pcie", .reg64 = 0x008 },
+	{ .index = EQ6HC_SOUTH_PLL_PER,  .name = "pll-per",  .reg64 = 0x010 },
+	{ .index = EQ6HC_SOUTH_PLL_ISP,  .name = "pll-isp",  .reg64 = 0x018 },
+};
+
+static const struct eqc_div eqc_eyeq6h_south_divs[] = {
+	{
+		.index = EQ6HC_SOUTH_DIV_EMMC,
+		.name = "div-emmc",
+		.parent = EQ6HC_SOUTH_PLL_PER,
+		.reg = 0x070,
+		.shift = 4,
+		.width = 4,
+	},
+	{
+		.index = EQ6HC_SOUTH_DIV_OSPI_REF,
+		.name = "div-ospi-ref",
+		.parent = EQ6HC_SOUTH_PLL_PER,
+		.reg = 0x090,
+		.shift = 4,
+		.width = 4,
+	},
+	{
+		.index = EQ6HC_SOUTH_DIV_OSPI_SYS,
+		.name = "div-ospi-sys",
+		.parent = EQ6HC_SOUTH_PLL_PER,
+		.reg = 0x090,
+		.shift = 8,
+		.width = 1,
+	},
+	{
+		.index = EQ6HC_SOUTH_DIV_TSU,
+		.name = "div-tsu",
+		.parent = EQ6HC_SOUTH_PLL_PCIE,
+		.reg = 0x098,
+		.shift = 4,
+		.width = 8,
+	},
+};
+
+static const struct eqc_match_data eqc_eyeq6h_south_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_south_plls),
+	.plls		= eqc_eyeq6h_south_plls,
+
+	.div_count	= ARRAY_SIZE(eqc_eyeq6h_south_divs),
+	.divs		= eqc_eyeq6h_south_divs,
+};
+
+static const struct eqc_pll eqc_eyeq6h_ddr0_plls[] = {
+	{ .index = 0, .name = "pll-ddr0", .reg64 = 0x074 },
+};
+
+static const struct eqc_match_data eqc_eyeq6h_ddr0_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_ddr0_plls),
+	.plls		= eqc_eyeq6h_ddr0_plls,
+};
+
+static const struct eqc_pll eqc_eyeq6h_ddr1_plls[] = {
+	{ .index = 0, .name = "pll-ddr1", .reg64 = 0x074 },
+};
+
+static const struct eqc_match_data eqc_eyeq6h_ddr1_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_ddr1_plls),
+	.plls		= eqc_eyeq6h_ddr1_plls,
+};
+
+static const struct eqc_pll eqc_eyeq6h_acc_plls[] = {
+	{ .index = EQ6HC_ACC_PLL_XNN, .name = "pll-xnn", .reg64 = 0x040 },
+	{ .index = EQ6HC_ACC_PLL_VMP, .name = "pll-vmp", .reg64 = 0x050 },
+	{ .index = EQ6HC_ACC_PLL_PMA, .name = "pll-pma", .reg64 = 0x05C },
+	{ .index = EQ6HC_ACC_PLL_MPC, .name = "pll-mpc", .reg64 = 0x068 },
+	{ .index = EQ6HC_ACC_PLL_NOC, .name = "pll-noc", .reg64 = 0x070 },
+};
+
+static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_acc_plls),
+	.plls		= eqc_eyeq6h_acc_plls,
+
+	.reset_auxdev_name = "reset_acc",
+};
+
+static const struct of_device_id eqc_match_table[] = {
+	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
+	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
+	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqc_eyeq6h_west_match_data },
+	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqc_eyeq6h_east_match_data },
+	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &eqc_eyeq6h_south_match_data },
+	{ .compatible = "mobileye,eyeq6h-ddr0-olb", .data = &eqc_eyeq6h_ddr0_match_data },
+	{ .compatible = "mobileye,eyeq6h-ddr1-olb", .data = &eqc_eyeq6h_ddr1_match_data },
+	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &eqc_eyeq6h_acc_match_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, eqc_match_table);
+
+static struct platform_driver eqc_driver = {
+	.probe = eqc_probe,
+	.driver = {
+		.name = "clk-eyeq",
+		.of_match_table = eqc_match_table,
+	},
+};
+builtin_platform_driver(eqc_driver);
+
+/* Required early for GIC timer (pll-cpu) and UARTs (pll-per). */
+static const struct eqc_pll eqc_eyeq5_early_plls[] = {
+	{ .index = EQ5C_PLL_CPU, .name = "pll-cpu",  .reg64 = 0x02C },
+	{ .index = EQ5C_PLL_PER, .name = "pll-per",  .reg64 = 0x05C },
+};
+
+static const struct eqc_early_match_data eqc_eyeq5_early_match_data = {
+	.early_pll_count	= ARRAY_SIZE(eqc_eyeq5_early_plls),
+	.early_plls		= eqc_eyeq5_early_plls,
+	.nb_late_clks = eqc_eyeq5_match_data.pll_count + eqc_eyeq5_match_data.div_count,
+};
+
+/* Required early for GIC timer. */
+static const struct eqc_pll eqc_eyeq6h_central_early_plls[] = {
+	{ .index = 0, .name = "pll-cpu", .reg64 = 0x02C },
+};
+
+static const struct eqc_early_match_data eqc_eyeq6h_central_early_match_data = {
+	.early_pll_count	= ARRAY_SIZE(eqc_eyeq6h_central_early_plls),
+	.early_plls		= eqc_eyeq6h_central_early_plls,
+	.nb_late_clks = 0,
+};
+
+/* Required early for UART. */
+static const struct eqc_pll eqc_eyeq6h_west_early_plls[] = {
+	{ .index = 0, .name = "pll-west", .reg64 = 0x074 },
+};
+
+static const struct eqc_early_match_data eqc_eyeq6h_west_early_match_data = {
+	.early_pll_count	= ARRAY_SIZE(eqc_eyeq6h_west_early_plls),
+	.early_plls		= eqc_eyeq6h_west_early_plls,
+	.nb_late_clks = 0,
+};
+
+static const struct of_device_id eqc_early_match_table[] = {
+	{
+		.compatible = "mobileye,eyeq5-olb",
+		.data = &eqc_eyeq5_early_match_data,
+	},
+	{
+		.compatible = "mobileye,eyeq6h-central-olb",
+		.data = &eqc_eyeq6h_central_early_match_data,
+	},
+	{
+		.compatible = "mobileye,eyeq6h-west-olb",
+		.data = &eqc_eyeq6h_west_early_match_data,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, eqc_early_match_table);
+
+static void __init eqc_init(struct device_node *np)
+{
+	const struct eqc_early_match_data *early_data;
+	unsigned int nb_clks = 0;
+	struct eqc_priv *priv;
+	void __iomem *base;
+	unsigned int i;
+	int ret;
+
+	early_data = of_match_node(eqc_early_match_table, np)->data;
+
+	/* No reason to early init this clock provider. Delay until probe. */
+	if (!early_data || early_data->early_pll_count == 0)
+		return;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	priv->np = np;
+	priv->early_data = early_data;
+
+	nb_clks = early_data->early_pll_count + early_data->nb_late_clks;
+	priv->cells = kzalloc(struct_size(priv->cells, hws, nb_clks), GFP_KERNEL);
+	if (!priv->cells) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	priv->cells->num = nb_clks;
+
+	/*
+	 * Mark all clocks as deferred; some are registered here, the rest at
+	 * platform device probe.
+	 */
+	for (i = 0; i < nb_clks; i++)
+		priv->cells->hws[i] = ERR_PTR(-EPROBE_DEFER);
+
+	/* Offsets (reg64) of early PLLs are relative to OLB block. */
+	base = of_iomap(np, 0);
+	if (!base) {
+		ret = -ENODEV;
+		goto err;
+	}
+
+	for (i = 0; i < early_data->early_pll_count; i++) {
+		const struct eqc_pll *pll = &early_data->early_plls[i];
+		unsigned long mult, div, acc;
+		struct clk_hw *hw;
+		u32 r0, r1;
+		u64 val;
+
+		val = readq(base + pll->reg64);
+		r0 = val;
+		r1 = val >> 32;
+
+		ret = eqc_pll_parse_registers(r0, r1, &mult, &div, &acc);
+		if (ret) {
+			pr_err("failed parsing state of %s\n", pll->name);
+			goto err;
+		}
+
+		hw = clk_hw_register_fixed_factor_with_accuracy_fwname(NULL,
+				np, pll->name, "ref", 0, mult, div, acc);
+		priv->cells->hws[pll->index] = hw;
+		if (IS_ERR(hw)) {
+			pr_err("failed registering %s: %pe\n", pll->name, hw);
+			ret = PTR_ERR(hw);
+			goto err;
+		}
+	}
+
+	/* When providing a single clock, require no cell. */
+	if (nb_clks == 1)
+		ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, priv->cells->hws[0]);
+	else
+		ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, priv->cells);
+	if (ret) {
+		pr_err("failed registering clk provider: %d\n", ret);
+		goto err;
+	}
+
+	spin_lock(&eqc_list_slock);
+	list_add_tail(&priv->list, &eqc_list);
+	spin_unlock(&eqc_list_slock);
+
+	return;
+
+err:
+	/*
+	 * We are doomed. The system will not be able to boot.
+	 *
+	 * Let's still try to be good citizens by freeing resources and print
+	 * a last error message that might help debugging.
+	 */
+
+	if (priv && priv->cells) {
+		of_clk_del_provider(np);
+
+		for (i = 0; i < early_data->early_pll_count; i++) {
+			const struct eqc_pll *pll = &early_data->early_plls[i];
+			struct clk_hw *hw = priv->cells->hws[pll->index];
+
+			if (!IS_ERR_OR_NULL(hw))
+				clk_hw_unregister_fixed_factor(hw);
+		}
+
+		kfree(priv->cells);
+	}
+
+	kfree(priv);
+
+	pr_err("failed clk init: %d\n", ret);
+}
+
+CLK_OF_DECLARE_DRIVER(eqc_eyeq5, "mobileye,eyeq5-olb", eqc_init);
+CLK_OF_DECLARE_DRIVER(eqc_eyeq6h_central, "mobileye,eyeq6h-central-olb", eqc_init);
+CLK_OF_DECLARE_DRIVER(eqc_eyeq6h_west, "mobileye,eyeq6h-west-olb", eqc_init);

-- 
2.45.2


