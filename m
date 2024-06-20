Return-Path: <linux-mips+bounces-3788-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89773910EBB
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 026541F2100B
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894341B9ADE;
	Thu, 20 Jun 2024 17:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="klQKolXq"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DAA1B5814;
	Thu, 20 Jun 2024 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904712; cv=none; b=FfLLeT1NY5ScOlJLIWMxL5+53JKjHdCiUBF3ghIg5lrEnEyKqf6cYw7Yuz9XWCKZT9NXQDv840r/iPoa2VWGboAHHOzrCS/8N6Za19rG1M9jV2vVP/vQtl0Yxx0SKdN+0v/834kKkr3uHJFqx3BU/+C7P6lxN6QMC/BAs+1e96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904712; c=relaxed/simple;
	bh=MbXBQVOfIoza58SmZhKbbmz2cY44yVz6VmKvO0vmFh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Os7hsq9bPBntjc4Z83IOAqbdjugJ1DRvEu3ubHgel0fA/+ucjtFoeGkepgfvulokhKZ7ZKUdUQLdaHObT8BejbSwdlDnKLQJNd22FG+meSki3QJD1ReSxOhDyEMBkwpHAYXMb9pnJTRS4Wbq4Vwu+tJuEUuj+5VNK1NBBpZlerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=klQKolXq; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2E051C0009;
	Thu, 20 Jun 2024 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718904707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srUyEPwu003hTFNVpT3l+UXfCpBJYiRAuzrb1i6gou0=;
	b=klQKolXq4ZLXsFCLuGgJ/WlkqoyuaJG8VgF+/VCJDuT9ZYoFvpb5O+cZHn2vqKnLAVQ1kx
	J78AkqEH3zNGQRxEUDNvmKQuOhmzv9Bofy8kXM1FmkDoOzG/TmV1ZA4LwslpeKPA/CQGuZ
	RTwjhsGQ7QU73hp9BpMB21H/Oz7HbSDZi8S2x1n2NTGBYB+6bEWlUan6ugBXDIZaOluUCX
	2MEbXIjRZ/yJGBCfX61yofM4aixiOjOpb/t6XgPU9+ZC9HUAW2qL4JZpAGGwhOCNBxiyZO
	SUIT+vT+Dk5smOAtBjnPAf4FtgzUD4FOmgD42pA9I3Hz3aKrCCR/XNRDI+8tNQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 20 Jun 2024 19:30:59 +0200
Subject: [PATCH v3 7/9] reset: eyeq: add platform driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240620-mbly-olb-v3-7-5f29f8ca289c@bootlin.com>
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

Add Mobileye EyeQ reset controller driver, for EyeQ5, EyeQ6L and EyeQ6H
SoCs. Instances belong to a shared register region called OLB and gets
spawned as auxiliary device to the platform driver for clock.

There is one OLB instance for EyeQ5 and EyeQ6L. There are seven OLB
instances on EyeQ6H; three have a reset controller embedded:
 - West and east get handled by the same compatible.
 - Acc (accelerator) is another one.

Each instance vary in the number and types of reset domains.
Instances with single domain expect a single cell, others two.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 MAINTAINERS                |   1 +
 drivers/reset/Kconfig      |  14 ++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-eyeq.c | 563 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 579 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f386e9da2cd0..36f4001c7f51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14931,6 +14931,7 @@ F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq5.c
+F:	drivers/reset/reset-eyeq5.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
 
 MODULE SUPPORT
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 85b27c42cf65..b79c18b75674 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -66,6 +66,20 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216.
 
+config RESET_EYEQ
+	bool "Mobileye EyeQ reset controller"
+	depends on COMMON_CLK_EYEQ
+	depends on MFD_SYSCON
+	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
+	default MACH_EYEQ5 || MACH_EYEQ6H
+	help
+	  This enables the Mobileye EyeQ reset controller, used in EyeQ5, EyeQ6L
+	  and EyeQ6H SoCs.
+
+	  It has one or more domains, with a varying number of resets in each.
+	  Registers are located in a shared register region called OLB. EyeQ6H
+	  has multiple reset instances.
+
 config RESET_GPIO
 	tristate "GPIO reset controller"
 	help
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index fd8b49fa46fc..a4e6fea29800 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
new file mode 100644
index 000000000000..03a3f2d06cff
--- /dev/null
+++ b/drivers/reset/reset-eyeq.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Reset driver for the Mobileye EyeQ5, EyeQ6L and EyeQ6H platforms.
+ *
+ * Controllers live in a shared register region called OLB. EyeQ5 and EyeQ6L
+ * have a single OLB instance for a single reset controller. EyeQ6H has seven
+ * OLB instances; three host reset controllers.
+ *
+ * Each reset controller has one or more domain. Domains are of a given type
+ * (see enum eqr_domain_type), with a valid offset mask (up to 32 resets per
+ * domain).
+ *
+ * Domain types define expected behavior: one-register-per-reset,
+ * one-bit-per-reset, status detection method, busywait duration, etc.
+ *
+ * We use eqr_ as prefix, as-in "EyeQ Reset", but way shorter.
+ *
+ * Known resets in EyeQ5 domain 0 (type EQR_EYEQ5_SARCR):
+ *  3. CAN0	 4. CAN1	 5. CAN2	 6. SPI0
+ *  7. SPI1	 8. SPI2	 9. SPI3	10. UART0
+ * 11. UART1	12. UART2	13. I2C0	14. I2C1
+ * 15. I2C2	16. I2C3	17. I2C4	18. TIMER0
+ * 19. TIMER1	20. TIMER2	21. TIMER3	22. TIMER4
+ * 23. WD0	24. EXT0	25. EXT1	26. GPIO
+ * 27. WD1
+ *
+ * Known resets in EyeQ5 domain 1 (type EQR_EYEQ5_ACRP):
+ *  0. VMP0	 1. VMP1	 2. VMP2	 3. VMP3
+ *  4. PMA0	 5. PMA1	 6. PMAC0	 7. PMAC1
+ *  8. MPC0	 9. MPC1	10. MPC2	11. MPC3
+ * 12. MPC4
+ *
+ * Known resets in EyeQ5 domain 2 (type EQR_EYEQ5_PCIE):
+ *  0. PCIE0_CORE	 1. PCIE0_APB		 2. PCIE0_LINK_AXI	 3. PCIE0_LINK_MGMT
+ *  4. PCIE0_LINK_HOT	 5. PCIE0_LINK_PIPE	 6. PCIE1_CORE		 7. PCIE1_APB
+ *  8. PCIE1_LINK_AXI	 9. PCIE1_LINK_MGMT	10. PCIE1_LINK_HOT	11. PCIE1_LINK_PIPE
+ * 12. MULTIPHY		13. MULTIPHY_APB	15. PCIE0_LINK_MGMT	16. PCIE1_LINK_MGMT
+ * 17. PCIE0_LINK_PM	18. PCIE1_LINK_PM
+ *
+ * Known resets in EyeQ6L domain 0 (type EQR_EYEQ5_SARCR):
+ *  0. SPI0	 1. SPI1	 2. UART0	 3. I2C0
+ *  4. I2C1	 5. TIMER0	 6. TIMER1	 7. TIMER2
+ *  8. TIMER3	 9. WD0		10. WD1		11. EXT0
+ * 12. EXT1	13. GPIO
+ *
+ * Known resets in EyeQ6L domain 1 (type EQR_EYEQ5_ACRP):
+ *  0. VMP0	 1. VMP1	 2. VMP2	 3. VMP3
+ *  4. PMA0	 5. PMA1	 6. PMAC0	 7. PMAC1
+ *  8. MPC0	 9. MPC1	10. MPC2	11. MPC3
+ * 12. MPC4
+ *
+ * Known resets in EyeQ6H west/east (type EQR_EYEQ6H_SARCR):
+ *  0. CAN	 1. SPI0	 2. SPI1	 3. UART0
+ *  4. UART1	 5. I2C0	 6. I2C1	 7. -hole-
+ *  8. TIMER0	 9. TIMER1	10. WD		11. EXT TIMER
+ * 12. GPIO
+ *
+ * Known resets in EyeQ6H acc (type EQR_EYEQ5_ACRP):
+ *  1. XNN0	 2. XNN1	 3. XNN2	 4. XNN3
+ *  5. VMP0	 6. VMP1	 7. VMP2	 8. VMP3
+ *  9. PMA0	10. PMA1	11. MPC0	12. MPC1
+ * 13. MPC2	14. MPC3	15. PERIPH
+ *
+ * Abbreviations:
+ *  - PMA: Programmable Macro Array
+ *  - MPC: Multi-threaded Processing Clusters
+ *  - VMP: Vector Microcode Processors
+ *
+ * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/lockdep.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/*
+ * A reset ID, as returned by eqr_of_xlate_*(), is a (domain, offset) pair.
+ * Low byte is domain, rest is offset.
+ */
+#define ID_DOMAIN_MASK	GENMASK(7, 0)
+#define ID_OFFSET_MASK	GENMASK(31, 8)
+
+enum eqr_domain_type {
+	EQR_EYEQ5_SARCR,
+	EQR_EYEQ5_ACRP,
+	EQR_EYEQ5_PCIE,
+	EQR_EYEQ6H_SARCR,
+};
+
+/*
+ * Domain type EQR_EYEQ5_SARCR register offsets.
+ */
+#define EQR_EYEQ5_SARCR_REQUEST		(0x000)
+#define EQR_EYEQ5_SARCR_STATUS		(0x004)
+
+/*
+ * Domain type EQR_EYEQ5_ACRP register masks.
+ * Registers are: base + 4 * offset.
+ */
+#define EQR_EYEQ5_ACRP_PD_REQ		BIT(0)
+#define EQR_EYEQ5_ACRP_ST_POWER_DOWN	BIT(27)
+#define EQR_EYEQ5_ACRP_ST_ACTIVE	BIT(29)
+
+/*
+ * Domain type EQR_EYEQ6H_SARCR register offsets.
+ */
+#define EQR_EYEQ6H_SARCR_RST_REQUEST	(0x000)
+#define EQR_EYEQ6H_SARCR_CLK_STATUS	(0x004)
+#define EQR_EYEQ6H_SARCR_RST_STATUS	(0x008)
+#define EQR_EYEQ6H_SARCR_CLK_REQUEST	(0x00C)
+
+struct eqr_busy_wait_timings {
+	unsigned long sleep_us;
+	unsigned long timeout_us;
+};
+
+static const struct eqr_busy_wait_timings eqr_timings[] = {
+	[EQR_EYEQ5_SARCR]	= {1, 10},
+	[EQR_EYEQ5_ACRP]	= {1, 40 * USEC_PER_MSEC}, /* LBIST implies long timeout. */
+	/* EQR_EYEQ5_PCIE does no busy waiting. */
+	[EQR_EYEQ6H_SARCR]	= {1, 400},
+};
+
+#define EQR_MAX_DOMAIN_COUNT 3
+
+struct eqr_domain_descriptor {
+	enum eqr_domain_type	type;
+	u32			valid_mask;
+	unsigned int		offset;
+};
+
+struct eqr_match_data {
+	unsigned int				domain_count;
+	const struct eqr_domain_descriptor	*domains;
+};
+
+struct eqr_private {
+	struct mutex			mutexes[EQR_MAX_DOMAIN_COUNT];
+	void __iomem			*base;
+	const struct eqr_match_data	*data;
+	struct reset_controller_dev	rcdev;
+};
+
+#define rcdev_to_priv(rcdev) container_of(rcdev, struct eqr_private, rcdev)
+
+static u32 eqr_double_readl(void __iomem *addr_a, void __iomem *addr_b,
+			    u32 *dest_a, u32 *dest_b)
+{
+	*dest_a = readl(addr_a);
+	*dest_b = readl(addr_b);
+	return 0; /* read_poll_timeout() op argument must return something. */
+}
+
+static int eqr_busy_wait_locked(struct eqr_private *priv, struct device *dev,
+				u32 domain, u32 offset, bool assert)
+{
+	enum eqr_domain_type domain_type = priv->data->domains[domain].type;
+	unsigned long sleep_us, timeout_us;
+	u32 val, mask, val0, val1;
+	void __iomem *base, *reg;
+	int ret;
+
+	lockdep_assert_held(&priv->mutexes[domain]);
+
+	base = priv->base + priv->data->domains[domain].offset;
+	sleep_us = eqr_timings[domain_type].sleep_us;
+	timeout_us = eqr_timings[domain_type].timeout_us;
+
+	switch (domain_type) {
+	case EQR_EYEQ5_SARCR:
+		reg = base + EQR_EYEQ5_SARCR_STATUS;
+		mask = BIT(offset);
+
+		ret = readl_poll_timeout(reg, val, !(val & mask) == assert,
+					 sleep_us, timeout_us);
+		break;
+
+	case EQR_EYEQ5_ACRP:
+		reg = base + 4 * offset;
+		if (assert)
+			mask = EQR_EYEQ5_ACRP_ST_POWER_DOWN;
+		else
+			mask = EQR_EYEQ5_ACRP_ST_ACTIVE;
+
+		ret = readl_poll_timeout(reg, val, !!(val & mask),
+					 sleep_us, timeout_us);
+		break;
+
+	case EQR_EYEQ5_PCIE:
+		ret = 0; /* No busy waiting. */
+		break;
+
+	case EQR_EYEQ6H_SARCR:
+		/*
+		 * Wait until both bits change:
+		 *	readl(base + EQR_EYEQ6H_SARCR_RST_STATUS) & BIT(offset)
+		 *	readl(base + EQR_EYEQ6H_SARCR_CLK_STATUS) & BIT(offset)
+		 */
+		mask = BIT(offset);
+		ret = read_poll_timeout(eqr_double_readl, val,
+					(!(val0 & mask) == assert) &&
+						(!(val1 & mask) == assert),
+					sleep_us, timeout_us, false,
+					base + EQR_EYEQ6H_SARCR_RST_STATUS,
+					base + EQR_EYEQ6H_SARCR_CLK_STATUS,
+					&val0, &val1);
+		break;
+
+	default:
+		WARN_ON(1);
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret == -ETIMEDOUT)
+		dev_dbg(dev, "%u-%u: timeout\n", domain, offset);
+	return ret;
+}
+
+static void eqr_assert_locked(struct eqr_private *priv, u32 domain, u32 offset)
+{
+	enum eqr_domain_type domain_type = priv->data->domains[domain].type;
+	void __iomem *base, *reg;
+	u32 val;
+
+	lockdep_assert_held(&priv->mutexes[domain]);
+
+	base = priv->base + priv->data->domains[domain].offset;
+
+	switch (domain_type) {
+	case EQR_EYEQ5_SARCR:
+		reg = base + EQR_EYEQ5_SARCR_REQUEST;
+		writel(readl(reg) & ~BIT(offset), reg);
+		break;
+
+	case EQR_EYEQ5_ACRP:
+		reg = base + 4 * offset;
+		writel(readl(reg) | EQR_EYEQ5_ACRP_PD_REQ, reg);
+		break;
+
+	case EQR_EYEQ5_PCIE:
+		writel(readl(base) & ~BIT(offset), base);
+		break;
+
+	case EQR_EYEQ6H_SARCR:
+		val = readl(base + EQR_EYEQ6H_SARCR_RST_REQUEST);
+		val &= ~BIT(offset);
+		writel(val, base + EQR_EYEQ6H_SARCR_RST_REQUEST);
+		writel(val, base + EQR_EYEQ6H_SARCR_CLK_REQUEST);
+		break;
+
+	default:
+		WARN_ON(1);
+		break;
+	}
+}
+
+static int eqr_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct eqr_private *priv = rcdev_to_priv(rcdev);
+	u32 domain = FIELD_GET(ID_DOMAIN_MASK, id);
+	u32 offset = FIELD_GET(ID_OFFSET_MASK, id);
+
+	dev_dbg(rcdev->dev, "%u-%u: assert request\n", domain, offset);
+
+	guard(mutex)(&priv->mutexes[domain]);
+
+	eqr_assert_locked(priv, domain, offset);
+	return eqr_busy_wait_locked(priv, rcdev->dev, domain, offset, true);
+}
+
+static void eqr_deassert_locked(struct eqr_private *priv, u32 domain,
+				u32 offset)
+{
+	enum eqr_domain_type domain_type = priv->data->domains[domain].type;
+	void __iomem *base, *reg;
+	u32 val;
+
+	lockdep_assert_held(&priv->mutexes[domain]);
+
+	base = priv->base + priv->data->domains[domain].offset;
+
+	switch (domain_type) {
+	case EQR_EYEQ5_SARCR:
+		reg = base + EQR_EYEQ5_SARCR_REQUEST;
+		writel(readl(reg) | BIT(offset), reg);
+		break;
+
+	case EQR_EYEQ5_ACRP:
+		reg = base + 4 * offset;
+		writel(readl(reg) & ~EQR_EYEQ5_ACRP_PD_REQ, reg);
+		break;
+
+	case EQR_EYEQ5_PCIE:
+		writel(readl(base) | BIT(offset), base);
+		break;
+
+	case EQR_EYEQ6H_SARCR:
+		val = readl(base + EQR_EYEQ6H_SARCR_RST_REQUEST);
+		val |= BIT(offset);
+		writel(val, base + EQR_EYEQ6H_SARCR_RST_REQUEST);
+		writel(val, base + EQR_EYEQ6H_SARCR_CLK_REQUEST);
+		break;
+
+	default:
+		WARN_ON(1);
+		break;
+	}
+}
+
+static int eqr_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct eqr_private *priv = rcdev_to_priv(rcdev);
+	u32 domain = FIELD_GET(ID_DOMAIN_MASK, id);
+	u32 offset = FIELD_GET(ID_OFFSET_MASK, id);
+
+	dev_dbg(rcdev->dev, "%u-%u: deassert request\n", domain, offset);
+
+	guard(mutex)(&priv->mutexes[domain]);
+
+	eqr_deassert_locked(priv, domain, offset);
+	return eqr_busy_wait_locked(priv, rcdev->dev, domain, offset, false);
+}
+
+static int eqr_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	u32 domain = FIELD_GET(ID_DOMAIN_MASK, id);
+	struct eqr_private *priv = rcdev_to_priv(rcdev);
+	enum eqr_domain_type domain_type = priv->data->domains[domain].type;
+	u32 offset = FIELD_GET(ID_OFFSET_MASK, id);
+	void __iomem *base, *reg;
+
+	dev_dbg(rcdev->dev, "%u-%u: status request\n", domain, offset);
+
+	guard(mutex)(&priv->mutexes[domain]);
+
+	base = priv->base + priv->data->domains[domain].offset;
+
+	switch (domain_type) {
+	case EQR_EYEQ5_SARCR:
+		reg = base + EQR_EYEQ5_SARCR_STATUS;
+		return !(readl(reg) & BIT(offset));
+	case EQR_EYEQ5_ACRP:
+		reg = base + 4 * offset;
+		return !(readl(reg) & EQR_EYEQ5_ACRP_ST_ACTIVE);
+	case EQR_EYEQ5_PCIE:
+		return !(readl(base) & BIT(offset));
+	case EQR_EYEQ6H_SARCR:
+		reg = base + EQR_EYEQ6H_SARCR_RST_STATUS;
+		return !(readl(reg) & BIT(offset));
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct reset_control_ops eqr_ops = {
+	.assert	  = eqr_assert,
+	.deassert = eqr_deassert,
+	.status	  = eqr_status,
+};
+
+static int eqr_of_xlate_internal(struct reset_controller_dev *rcdev,
+				 u32 domain, u32 offset)
+{
+	struct eqr_private *priv = rcdev_to_priv(rcdev);
+
+	if (domain >= priv->data->domain_count || offset > 31 ||
+	    !(priv->data->domains[domain].valid_mask & BIT(offset))) {
+		dev_err(rcdev->dev, "%u-%u: invalid reset\n", domain, offset);
+		return -EINVAL;
+	}
+
+	return FIELD_PREP(ID_DOMAIN_MASK, domain) | FIELD_PREP(ID_OFFSET_MASK, offset);
+}
+
+static int eqr_of_xlate_onecell(struct reset_controller_dev *rcdev,
+				const struct of_phandle_args *reset_spec)
+{
+	return eqr_of_xlate_internal(rcdev, 0, reset_spec->args[0]);
+}
+
+static int eqr_of_xlate_twocells(struct reset_controller_dev *rcdev,
+				 const struct of_phandle_args *reset_spec)
+{
+	return eqr_of_xlate_internal(rcdev, reset_spec->args[0], reset_spec->args[1]);
+}
+
+static int eqr_probe(struct auxiliary_device *adev,
+		     const struct auxiliary_device_id *id)
+{
+	const struct of_device_id *match;
+	struct device *dev = &adev->dev;
+	struct eqr_private *priv;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
+	 * default; let's reuse our parent's OF node.
+	 */
+	WARN_ON(dev->of_node);
+	device_set_of_node_from_dev(dev, dev->parent);
+	if (!dev->of_node)
+		return -ENODEV;
+
+	/*
+	 * Using our newfound OF node, we can get match data. We cannot use
+	 * device_get_match_data() because it does not match reused OF nodes.
+	 */
+	match = of_match_node(dev->driver->of_match_table, dev->of_node);
+	if (!match || !match->data)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->data = match->data;
+	priv->base = dev_get_platdata(dev);
+	priv->rcdev.ops = &eqr_ops;
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.dev = dev;
+	priv->rcdev.of_node = dev->of_node;
+
+	if (priv->data->domain_count == 1) {
+		priv->rcdev.of_reset_n_cells = 1;
+		priv->rcdev.of_xlate = eqr_of_xlate_onecell;
+	} else {
+		priv->rcdev.of_reset_n_cells = 2;
+		priv->rcdev.of_xlate = eqr_of_xlate_twocells;
+	}
+
+	for (i = 0; i < priv->data->domain_count; i++)
+		mutex_init(&priv->mutexes[i]);
+
+	priv->rcdev.nr_resets = 0;
+	for (i = 0; i < priv->data->domain_count; i++)
+		priv->rcdev.nr_resets += hweight32(priv->data->domains[i].valid_mask);
+
+	ret = devm_reset_controller_register(dev, &priv->rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed registering reset controller\n");
+
+	return 0;
+}
+
+static const struct eqr_domain_descriptor eqr_eyeq5_domains[] = {
+	{
+		.type = EQR_EYEQ5_SARCR,
+		.valid_mask = 0xFFFFFF8,
+		.offset = 0x004,
+	},
+	{
+		.type = EQR_EYEQ5_ACRP,
+		.valid_mask = 0x0001FFF,
+		.offset = 0x200,
+	},
+	{
+		.type = EQR_EYEQ5_PCIE,
+		.valid_mask = 0x007BFFF,
+		.offset = 0x120,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq5_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq5_domains),
+	.domains	= eqr_eyeq5_domains,
+};
+
+static const struct eqr_domain_descriptor eqr_eyeq6l_domains[] = {
+	{
+		.type = EQR_EYEQ5_SARCR,
+		.valid_mask = 0x3FFF,
+		.offset = 0x004,
+	},
+	{
+		.type = EQR_EYEQ5_ACRP,
+		.valid_mask = 0x00FF,
+		.offset = 0x200,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq6l_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq6l_domains),
+	.domains	= eqr_eyeq6l_domains,
+};
+
+/* West and east OLBs each have an instance. */
+static const struct eqr_domain_descriptor eqr_eyeq6h_we_domains[] = {
+	{
+		.type = EQR_EYEQ6H_SARCR,
+		.valid_mask = 0x1F7F,
+		.offset = 0x004,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq6h_we_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq6h_we_domains),
+	.domains	= eqr_eyeq6h_we_domains,
+};
+
+static const struct eqr_domain_descriptor eqr_eyeq6h_acc_domains[] = {
+	{
+		.type = EQR_EYEQ5_ACRP,
+		.valid_mask = 0x7FFF,
+		.offset = 0x000,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq6h_acc_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq6h_acc_domains),
+	.domains	= eqr_eyeq6h_acc_domains,
+};
+
+/*
+ * Table describes OLB system-controller compatibles.
+ * It does not get used to match against devicetree node.
+ */
+static const struct of_device_id eqr_match_table[] = {
+	{ .compatible = "mobileye,eyeq5-olb", .data = &eqr_eyeq5_data },
+	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqr_eyeq6l_data },
+	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqr_eyeq6h_we_data },
+	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqr_eyeq6h_we_data },
+	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &eqr_eyeq6h_acc_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, eqr_match_table);
+
+static const struct auxiliary_device_id eqr_id_table[] = {
+	{ .name = "clk_eyeq.reset" },
+	{ .name = "clk_eyeq.reset_west" },
+	{ .name = "clk_eyeq.reset_east" },
+	{ .name = "clk_eyeq.reset_acc" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, eqr_id_table);
+
+static struct auxiliary_driver eqr_driver = {
+	.probe = eqr_probe,
+	.id_table = eqr_id_table,
+	.driver = {
+		.of_match_table = eqr_match_table,
+	}
+};
+module_auxiliary_driver(eqr_driver);

-- 
2.45.2


