Return-Path: <linux-mips+bounces-8263-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D05BA6BC1D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 14:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EE1A1651D4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2FF189913;
	Fri, 21 Mar 2025 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ZzMj8bdZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CEA14A62B;
	Fri, 21 Mar 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565183; cv=none; b=njOGA3VAY/I6cbPXCig0AIEddFne36UFmQJjwqUt6P42kmJ8kJY006dFNDgMXmpmPVgjcAP2V7/kht68tHl9FDixrgS6ZQCk2ha0Vla/JebYwZ+4/H7lHv0h/ZHhduTwiuLNvFnrCzCY94VzvaGVxUPhNVGQNHmhr8I2iOLOz0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565183; c=relaxed/simple;
	bh=7jtpfirCjXZyKVm5kgQc0owO+pKYugs44KRwq67U/HQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uWheNRpwr6AM2cAPE5cfMXLQqn1paygpNsvU03tR6qZy8KeNyet7RevyLzSaDfrcggup4tHkkoPZrRJf++AR9BgiPIvPIUFH8d/sY6/jRqWlqNx3UPYNgaiPICwrvMbh+51ApaW8wG1PQF8n47PGPG/jaS9RtB5RuJlTy8QlEBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ZzMj8bdZ; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D503C2A4048;
	Fri, 21 Mar 2025 14:46:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742564820; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uVYceoWg9ocI3yoOIXEQp6iVhUeDIwRtsFmbffeV5yE=;
	b=ZzMj8bdZVNAzIJ6vcHZH6ERMHmuwiM+mq/oxiIKDCeNHh7ozQflFulxcMlptnIYCGDCWST
	EgSf/dsT6cqBDOUpbJQfQoEpmbRVLRVpuTlMQMQGwV1JFna/jSXyf7PO+ALUCZOKL7ZSOE
	g+9unX44wTh0ks05qBc0fm39rZxuSCipGWfU5J4rSbxLQfW+uGjuU2BaV3qAXLyKeOrpCA
	KwusVHRhMmMEZyEN3uYd6GA3hCHiiABncdaMGMrZdFzzvob6QBDNzT2bvQL5QaBLJ+e7C5
	QoWqBT3ewYwgaotIyqn32N/149uwXDVRzSc4c22UeKTbygeHCjmKnzSt9v4RHA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v1 3/8] irqchip: Add EcoNet EN751221 INTC
Date: Fri, 21 Mar 2025 13:46:28 +0000
Message-Id: <20250321134633.2155141-4-cjd@cjdns.fr>
In-Reply-To: <20250321134633.2155141-1-cjd@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a driver for the interrupt controller in the EcoNet EN751221 MIPS SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
If CPU_MIPSR2_IRQ_EI / CPU_MIPSR2_IRQ_VI are enabled in the build, this
device switches to sending all interrupts as vectored - which IRQ_MIPS_CPU
is not prepared to handle. If anybody knows how to either disable this
behavior, or handle vectored interrupts without ugly code that breaks
cascading, please let me know and I will implement that and add
MIPS_MT_SMP in a future patchset.
---
 drivers/irqchip/Kconfig               |   5 +
 drivers/irqchip/Makefile              |   1 +
 drivers/irqchip/irq-econet-en751221.c | 280 ++++++++++++++++++++++++++
 3 files changed, 286 insertions(+)
 create mode 100644 drivers/irqchip/irq-econet-en751221.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index c11b9965c4ad..a591ad3156dc 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -147,6 +147,11 @@ config DW_APB_ICTL
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN_HIERARCHY
 
+config ECONET_EN751221_INTC
+	bool
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN
+
 config FARADAY_FTINTC010
 	bool
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 25e9ad29b8c4..1ee83823928d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_ARCH_BCM2835)		+= irq-bcm2836.o
 obj-$(CONFIG_ARCH_ACTIONS)		+= irq-owl-sirq.o
 obj-$(CONFIG_DAVINCI_CP_INTC)		+= irq-davinci-cp-intc.o
 obj-$(CONFIG_EXYNOS_IRQ_COMBINER)	+= exynos-combiner.o
+obj-$(CONFIG_ECONET_EN751221_INTC)	+= irq-econet-en751221.o
 obj-$(CONFIG_FARADAY_FTINTC010)		+= irq-ftintc010.o
 obj-$(CONFIG_ARCH_HIP04)		+= irq-hip04.o
 obj-$(CONFIG_ARCH_LPC32XX)		+= irq-lpc32xx.o
diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
new file mode 100644
index 000000000000..edbb8a3d6d51
--- /dev/null
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * EN751221 Interrupt Controller Driver.
+ *
+ * Copyright (C) 2025 Caleb James DeLisle <cjd@cjdns.fr>
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+
+#define INTC_IRQ_COUNT		40
+
+#define INTC_NO_SHADOW		0xff
+#define INTC_IS_SHADOW		0xfe
+
+#define REG_MASK0		0x04
+#define REG_MASK1		0x50
+#define REG_PENDING0		0x08
+#define REG_PENDING1		0x54
+
+static const struct econet_intc {
+	const struct irq_chip chip;
+
+	const struct irq_domain_ops domain_ops;
+} econet_intc;
+
+static struct {
+	void __iomem *membase;
+	u8 shadow_interrupts[INTC_IRQ_COUNT];
+} econet_intc_rai __ro_after_init;
+
+static DEFINE_RAW_SPINLOCK(irq_lock);
+
+static void econet_wreg(u32 reg, u32 val, u32 mask)
+{
+	unsigned long flags;
+	u32 v;
+
+	raw_spin_lock_irqsave(&irq_lock, flags);
+
+	v = ioread32(econet_intc_rai.membase + reg);
+	v &= ~mask;
+	v |= val & mask;
+	iowrite32(v, econet_intc_rai.membase + reg);
+
+	raw_spin_unlock_irqrestore(&irq_lock, flags);
+}
+
+static void econet_chmask(u32 hwirq, bool unmask)
+{
+	u32 reg;
+	u32 mask;
+	u32 bit;
+	u8 shadow;
+
+	shadow = econet_intc_rai.shadow_interrupts[hwirq];
+	if (WARN_ON_ONCE(shadow == INTC_IS_SHADOW))
+		return;
+	else if (shadow < INTC_NO_SHADOW && smp_processor_id() > 0)
+		hwirq = shadow;
+
+	if (hwirq >= 32) {
+		reg = REG_MASK1;
+		mask = BIT(hwirq - 32);
+	} else {
+		reg = REG_MASK0;
+		mask = BIT(hwirq);
+	}
+	bit = (unmask) ? mask : 0;
+
+	econet_wreg(reg, bit, mask);
+}
+
+static void econet_intc_mask(struct irq_data *d)
+{
+	econet_chmask(d->hwirq, false);
+}
+
+static void econet_intc_unmask(struct irq_data *d)
+{
+	econet_chmask(d->hwirq, true);
+}
+
+static void econet_mask_all(void)
+{
+	econet_wreg(REG_MASK0, 0, ~0);
+	econet_wreg(REG_MASK1, 0, ~0);
+}
+
+static void econet_intc_handle_pending(struct irq_domain *d, u32 pending, u32 offset)
+{
+	int hwirq;
+
+	while (pending) {
+		hwirq = fls(pending) - 1;
+		generic_handle_domain_irq(d, hwirq + offset);
+		pending &= ~BIT(hwirq);
+	}
+}
+
+static void econet_intc_from_parent(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_domain *domain;
+	u32 pending0;
+	u32 pending1;
+
+	chained_irq_enter(chip, desc);
+
+	pending0 = ioread32(econet_intc_rai.membase + REG_PENDING0);
+	pending1 = ioread32(econet_intc_rai.membase + REG_PENDING1);
+
+	if (unlikely(!(pending0 | pending1))) {
+		spurious_interrupt();
+		goto out;
+	}
+
+	domain = irq_desc_get_handler_data(desc);
+
+	econet_intc_handle_pending(domain, pending0, 0);
+	econet_intc_handle_pending(domain, pending1, 32);
+
+out:
+	chained_irq_exit(chip, desc);
+}
+
+static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hwirq)
+{
+	int ret;
+
+	if (hwirq >= INTC_IRQ_COUNT) {
+		pr_err("%s: hwirq %lu out of range\n", __func__, hwirq);
+		return -EINVAL;
+	} else if (econet_intc_rai.shadow_interrupts[hwirq] == INTC_IS_SHADOW) {
+		pr_err("%s: can't map hwirq %lu, it is a shadow interrupt\n",
+		       __func__, hwirq);
+		return -EINVAL;
+	}
+	if (econet_intc_rai.shadow_interrupts[hwirq] != INTC_NO_SHADOW) {
+		irq_set_chip_and_handler(
+			irq, &econet_intc.chip, handle_percpu_devid_irq);
+		ret = irq_set_percpu_devid(irq);
+		if (ret) {
+			pr_warn("%s: Failed irq_set_percpu_devid for %u: %d\n",
+				d->name, irq, ret);
+		}
+	} else {
+		irq_set_chip_and_handler(
+			irq, &econet_intc.chip, handle_level_irq);
+	}
+	irq_set_chip_data(irq, NULL);
+	return 0;
+}
+
+static const struct econet_intc econet_intc = {
+	.chip = {
+		.name		= "en751221-intc",
+		.irq_unmask	= econet_intc_unmask,
+		.irq_mask	= econet_intc_mask,
+		.irq_mask_ack	= econet_intc_mask,
+	},
+	.domain_ops = {
+		.xlate = irq_domain_xlate_onecell,
+		.map = econet_intc_map,
+	},
+};
+
+static int __init get_shadow_interrupts(struct device_node *node)
+{
+	const char *field = "econet,shadow-interrupts";
+	int n_shadow_interrupts;
+	u32 *shadow_interrupts;
+
+	n_shadow_interrupts = of_property_count_u32_elems(node, field);
+	memset(econet_intc_rai.shadow_interrupts, INTC_NO_SHADOW,
+	       sizeof(econet_intc_rai.shadow_interrupts));
+	if (n_shadow_interrupts <= 0) {
+		return 0;
+	} else if (n_shadow_interrupts % 2) {
+		pr_err("%pOF: %s count is odd, ignoring\n", node, field);
+		return 0;
+	}
+	shadow_interrupts = kmalloc_array(n_shadow_interrupts, sizeof(u32),
+					  GFP_KERNEL);
+	if (!shadow_interrupts)
+		return -ENOMEM;
+	if (of_property_read_u32_array(node, field,
+				       shadow_interrupts, n_shadow_interrupts)
+	) {
+		pr_err("%pOF: Failed to read %s\n", node, field);
+		kfree(shadow_interrupts);
+		return -EINVAL;
+	}
+	for (int i = 0; i < n_shadow_interrupts; i += 2) {
+		u32 shadow = shadow_interrupts[i + 1];
+		u32 target = shadow_interrupts[i];
+
+		if (shadow > INTC_IRQ_COUNT) {
+			pr_err("%pOF: %s[%d] shadow(%d) out of range\n",
+			       node, field, i, shadow);
+			continue;
+		}
+		if (target >= INTC_IRQ_COUNT) {
+			pr_err("%pOF: %s[%d] target(%d) out of range\n",
+			       node, field, i + 1, target);
+			continue;
+		}
+		econet_intc_rai.shadow_interrupts[target] = shadow;
+		econet_intc_rai.shadow_interrupts[shadow] = INTC_IS_SHADOW;
+	}
+	kfree(shadow_interrupts);
+	return 0;
+}
+
+static int __init econet_intc_of_init(struct device_node *node, struct device_node *parent)
+{
+	int ret;
+	int irq;
+	struct resource res;
+	struct irq_domain *domain;
+
+	ret = get_shadow_interrupts(node);
+	if (ret)
+		return ret;
+
+	irq = irq_of_parse_and_map(node, 0);
+	if (!irq) {
+		pr_err("%pOF: DT: Failed to get IRQ from 'interrupts'\n", node);
+		return -EINVAL;
+	}
+
+	if (of_address_to_resource(node, 0, &res)) {
+		pr_err("%pOF: DT: Failed to get 'reg'\n", node);
+		ret = -EINVAL;
+		goto err_dispose_mapping;
+	}
+
+	if (!request_mem_region(res.start, resource_size(&res), res.name)) {
+		pr_err("%pOF: Failed to request memory\n", node);
+		ret = -EBUSY;
+		goto err_dispose_mapping;
+	}
+
+	econet_intc_rai.membase = ioremap(res.start, resource_size(&res));
+	if (!econet_intc_rai.membase) {
+		pr_err("%pOF: Failed to remap membase\n", node);
+		ret = -ENOMEM;
+		goto err_release;
+	}
+
+	econet_mask_all();
+
+	domain = irq_domain_add_linear(
+		node, INTC_IRQ_COUNT,
+		&econet_intc.domain_ops, NULL);
+	if (!domain) {
+		pr_err("%pOF: Failed to add irqdomain\n", node);
+		ret = -ENOMEM;
+		goto err_unmap;
+	}
+
+	irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
+
+	return 0;
+
+err_unmap:
+	iounmap(econet_intc_rai.membase);
+err_release:
+	release_mem_region(res.start, resource_size(&res));
+err_dispose_mapping:
+	irq_dispose_mapping(irq);
+	return ret;
+}
+
+IRQCHIP_DECLARE(econet_en751221_intc, "econet,en751221-intc", econet_intc_of_init);
-- 
2.30.2


