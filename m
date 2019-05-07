Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2060D16CDE
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 23:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbfEGVJh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 17:09:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:59678 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728501AbfEGVJc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 May 2019 17:09:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5194AAE60;
        Tue,  7 May 2019 21:09:30 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] MIPS: SGI-IP27: abstract chipset irq from bridge
Date:   Tue,  7 May 2019 23:09:15 +0200
Message-Id: <20190507210917.4691-4-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20190507210917.4691-1-tbogendoerfer@suse.de>
References: <20190507210917.4691-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Bridge ASIC is widely used in different SGI systems, but the connected
chipset is either HUB, HEART or BEDROCK. This commit switches to
irq domain hierarchy for hub and bridge interrupts to get bridge
setup out of hub interrupt code.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/Kconfig                    |   1 +
 arch/mips/include/asm/pci/bridge.h   |   3 +-
 arch/mips/include/asm/sn/irq_alloc.h |  11 ++
 arch/mips/pci/pci-xtalk-bridge.c     | 178 ++++++++++++++++++++++++++++++--
 arch/mips/sgi-ip27/ip27-irq.c        | 190 ++++++++++++++++-------------------
 5 files changed, 265 insertions(+), 118 deletions(-)
 create mode 100644 arch/mips/include/asm/sn/irq_alloc.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index dfb5d4151ba1..4c4bb3d6a188 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -676,6 +676,7 @@ config SGI_IP27
 	select SYS_HAS_EARLY_PRINTK
 	select HAVE_PCI
 	select IRQ_MIPS_CPU
+	select IRQ_DOMAIN_HIERARCHY
 	select NR_CPUS_DEFAULT_64
 	select PCI_DRIVERS_GENERIC
 	select PCI_XTALK_BRIDGE
diff --git a/arch/mips/include/asm/pci/bridge.h b/arch/mips/include/asm/pci/bridge.h
index d42b27c97c23..a92cd30b48c9 100644
--- a/arch/mips/include/asm/pci/bridge.h
+++ b/arch/mips/include/asm/pci/bridge.h
@@ -805,6 +805,7 @@ struct bridge_controller {
 	struct bridge_regs	*base;
 	unsigned long		baddr;
 	unsigned long		intr_addr;
+	struct irq_domain	*domain;
 	unsigned int		pci_int[8];
 	nasid_t			nasid;
 };
@@ -819,6 +820,4 @@ struct bridge_controller {
 #define bridge_clr(bc, reg, val)	\
 	__raw_writel(__raw_readl(&bc->base->reg) & ~(val), &bc->base->reg)
 
-extern int request_bridge_irq(struct bridge_controller *bc, int pin);
-
 #endif /* _ASM_PCI_BRIDGE_H */
diff --git a/arch/mips/include/asm/sn/irq_alloc.h b/arch/mips/include/asm/sn/irq_alloc.h
new file mode 100644
index 000000000000..09b89cecff56
--- /dev/null
+++ b/arch/mips/include/asm/sn/irq_alloc.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_SN_IRQ_ALLOC_H
+#define __ASM_SN_IRQ_ALLOC_H
+
+struct irq_alloc_info {
+	void *ctrl;
+	nasid_t nasid;
+	int pin;
+};
+
+#endif /* __ASM_SN_IRQ_ALLOC_H */
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index 8f481984ab6e..bcf7f559789a 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -14,7 +14,7 @@
 
 #include <asm/pci/bridge.h>
 #include <asm/paccess.h>
-#include <asm/sn/intr.h>
+#include <asm/sn/irq_alloc.h>
 
 /*
  * Most of the IOC3 PCI config register aren't present
@@ -310,6 +310,135 @@ static struct pci_ops bridge_pci_ops = {
 	.write	 = pci_write_config,
 };
 
+struct bridge_irq_chip_data {
+	struct bridge_controller *bc;
+	nasid_t nasid;
+};
+
+static int bridge_set_affinity(struct irq_data *d, const struct cpumask *mask,
+			       bool force)
+{
+#ifdef CONFIG_NUMA
+	struct bridge_irq_chip_data *data = d->chip_data;
+	int bit = d->parent_data->hwirq;
+	int pin = d->hwirq;
+	nasid_t nasid;
+	int ret, cpu;
+
+	ret = irq_chip_set_affinity_parent(d, mask, force);
+	if (ret >= 0) {
+		cpu = cpumask_first_and(mask, cpu_online_mask);
+		nasid = COMPACT_TO_NASID_NODEID(cpu_to_node(cpu));
+		bridge_write(data->bc, b_int_addr[pin].addr,
+			     (((data->bc->intr_addr >> 30) & 0x30000) |
+			      bit | (nasid << 8)));
+		bridge_read(data->bc, b_wid_tflush);
+	}
+	return ret;
+#else
+	return irq_chip_set_affinity_parent(d, mask, force);
+#endif
+}
+
+struct irq_chip bridge_irq_chip = {
+	.name             = "BRIDGE",
+	.irq_mask         = irq_chip_mask_parent,
+	.irq_unmask       = irq_chip_unmask_parent,
+	.irq_set_affinity = bridge_set_affinity
+};
+
+static int bridge_domain_alloc(struct irq_domain *domain, unsigned int virq,
+			       unsigned int nr_irqs, void *arg)
+{
+	struct bridge_irq_chip_data *data;
+	struct irq_alloc_info *info = arg;
+	int ret;
+
+	if (nr_irqs > 1 || !info)
+		return -EINVAL;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
+	if (ret >= 0) {
+		data->bc = info->ctrl;
+		data->nasid = info->nasid;
+		irq_domain_set_info(domain, virq, info->pin, &bridge_irq_chip,
+				    data, handle_level_irq, NULL, NULL);
+	} else {
+		kfree(data);
+	}
+
+	return ret;
+}
+
+static void bridge_domain_free(struct irq_domain *domain, unsigned int virq,
+			       unsigned int nr_irqs)
+{
+	struct irq_data *irqd = irq_domain_get_irq_data(domain, virq);
+
+	if (nr_irqs)
+		return;
+
+	kfree(irqd->chip_data);
+	irq_domain_free_irqs_top(domain, virq, nr_irqs);
+}
+
+static int bridge_domain_activate(struct irq_domain *domain,
+				  struct irq_data *irqd, bool reserve)
+{
+	struct bridge_irq_chip_data *data = irqd->chip_data;
+	struct bridge_controller *bc = data->bc;
+	int bit = irqd->parent_data->hwirq;
+	int pin = irqd->hwirq;
+	u32 device;
+
+	bridge_write(bc, b_int_addr[pin].addr,
+		     (((bc->intr_addr >> 30) & 0x30000) |
+		      bit | (data->nasid << 8)));
+	bridge_set(bc, b_int_enable, (1 << pin));
+	bridge_set(bc, b_int_enable, 0x7ffffe00); /* more stuff in int_enable */
+
+	/*
+	 * Enable sending of an interrupt clear packt to the hub on a high to
+	 * low transition of the interrupt pin.
+	 *
+	 * IRIX sets additional bits in the address which are documented as
+	 * reserved in the bridge docs.
+	 */
+	bridge_set(bc, b_int_mode, (1UL << pin));
+
+	/*
+	 * We assume the bridge to have a 1:1 mapping between devices
+	 * (slots) and intr pins.
+	 */
+	device = bridge_read(bc, b_int_device);
+	device &= ~(7 << (pin*3));
+	device |= (pin << (pin*3));
+	bridge_write(bc, b_int_device, device);
+
+	bridge_read(bc, b_wid_tflush);
+	return 0;
+}
+
+static void bridge_domain_deactivate(struct irq_domain *domain,
+				     struct irq_data *irqd)
+{
+	struct bridge_irq_chip_data *data = irqd->chip_data;
+
+	bridge_clr(data->bc, b_int_enable, (1 << irqd->hwirq));
+	bridge_read(data->bc, b_wid_tflush);
+}
+
+static const struct irq_domain_ops bridge_domain_ops = {
+	.alloc      = bridge_domain_alloc,
+	.free       = bridge_domain_free,
+	.activate   = bridge_domain_activate,
+	.deactivate = bridge_domain_deactivate
+};
+
 /*
  * All observed requests have pin == 1. We could have a global here, that
  * gets incremented and returned every time - unfortunately, pci_map_irq
@@ -322,11 +451,16 @@ static struct pci_ops bridge_pci_ops = {
 static int bridge_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 {
 	struct bridge_controller *bc = BRIDGE_CONTROLLER(dev->bus);
+	struct irq_alloc_info info;
 	int irq;
 
 	irq = bc->pci_int[slot];
 	if (irq == -1) {
-		irq = request_bridge_irq(bc, slot);
+		info.ctrl = bc;
+		info.nasid = bc->nasid;
+		info.pin = slot;
+
+		irq = irq_domain_alloc_irqs(bc->domain, 1, bc->nasid, &info);
 		if (irq < 0)
 			return irq;
 
@@ -337,18 +471,34 @@ static int bridge_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 
 static int bridge_probe(struct platform_device *pdev)
 {
+	struct xtalk_bridge_platform_data *bd = dev_get_platdata(&pdev->dev);
 	struct device *dev = &pdev->dev;
 	struct bridge_controller *bc;
 	struct pci_host_bridge *host;
+	struct irq_domain *domain, *parent;
+	struct fwnode_handle *fn;
 	int slot;
 	int err;
-	struct xtalk_bridge_platform_data *bd = dev_get_platdata(&pdev->dev);
+
+	parent = irq_get_default_host();
+	if (!parent)
+		return -ENODEV;
+	fn = irq_domain_alloc_named_fwnode("BRIDGE");
+	if (!fn)
+		return -ENOMEM;
+	domain = irq_domain_create_hierarchy(parent, 0, 8, fn,
+					     &bridge_domain_ops, NULL);
+	irq_domain_free_fwnode(fn);
+	if (!domain)
+		return -ENOMEM;
 
 	pci_set_flags(PCI_PROBE_ONLY);
 
 	host = devm_pci_alloc_host_bridge(dev, sizeof(*bc));
-	if (!host)
-		return -ENOMEM;
+	if (!host) {
+		err = -ENOMEM;
+		goto err_remove_domain;
+	}
 
 	bc = pci_host_bridge_priv(host);
 
@@ -357,15 +507,15 @@ static int bridge_probe(struct platform_device *pdev)
 	bc->busn.end		= 0xff;
 	bc->busn.flags		= IORESOURCE_BUS;
 
+	bc->domain		= domain;
+
 	pci_add_resource_offset(&host->windows, &bd->mem, bd->mem_offset);
 	pci_add_resource_offset(&host->windows, &bd->io, bd->io_offset);
 	pci_add_resource(&host->windows, &bc->busn);
 
 	err = devm_request_pci_bus_resources(dev, &host->windows);
-	if (err < 0) {
-		pci_free_resource_list(&host->windows);
-		return err;
-	}
+	if (err < 0)
+		goto err_free_resource;
 
 	bc->nasid = bd->nasid;
 
@@ -419,7 +569,7 @@ static int bridge_probe(struct platform_device *pdev)
 
 	err = pci_scan_root_bus_bridge(host);
 	if (err < 0)
-		return err;
+		goto err_free_resource;
 
 	pci_bus_claim_resources(host->bus);
 	pci_bus_add_devices(host->bus);
@@ -427,12 +577,20 @@ static int bridge_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host->bus);
 
 	return 0;
+
+err_free_resource:
+	pci_free_resource_list(&host->windows);
+err_remove_domain:
+	irq_domain_remove(domain);
+	return err;
 }
 
 static int bridge_remove(struct platform_device *pdev)
 {
 	struct pci_bus *bus = platform_get_drvdata(pdev);
+	struct bridge_controller *bc = BRIDGE_CONTROLLER(bus);
 
+	irq_domain_remove(bc->domain);
 	pci_lock_rescan_remove();
 	pci_stop_root_bus(bus);
 	pci_remove_root_bus(bus);
diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index a32f843cdbe0..37be04975831 100644
--- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -12,22 +12,20 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/bitops.h>
+#include <linux/sched.h>
 
 #include <asm/io.h>
 #include <asm/irq_cpu.h>
-#include <asm/pci/bridge.h>
 #include <asm/sn/addrs.h>
 #include <asm/sn/agent.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/hub.h>
 #include <asm/sn/intr.h>
+#include <asm/sn/irq_alloc.h>
 
 struct hub_irq_data {
-	struct bridge_controller *bc;
 	u64	*irq_mask[2];
 	cpuid_t	cpu;
-	int	bit;
-	int	pin;
 };
 
 static DECLARE_BITMAP(hub_irq_map, IP27_HUB_IRQ_COUNT);
@@ -54,7 +52,7 @@ static void enable_hub_irq(struct irq_data *d)
 	struct hub_irq_data *hd = irq_data_get_irq_chip_data(d);
 	unsigned long *mask = per_cpu(irq_enable_mask, hd->cpu);
 
-	set_bit(hd->bit, mask);
+	set_bit(d->hwirq, mask);
 	__raw_writeq(mask[0], hd->irq_mask[0]);
 	__raw_writeq(mask[1], hd->irq_mask[1]);
 }
@@ -64,71 +62,11 @@ static void disable_hub_irq(struct irq_data *d)
 	struct hub_irq_data *hd = irq_data_get_irq_chip_data(d);
 	unsigned long *mask = per_cpu(irq_enable_mask, hd->cpu);
 
-	clear_bit(hd->bit, mask);
+	clear_bit(d->hwirq, mask);
 	__raw_writeq(mask[0], hd->irq_mask[0]);
 	__raw_writeq(mask[1], hd->irq_mask[1]);
 }
 
-static unsigned int startup_bridge_irq(struct irq_data *d)
-{
-	struct hub_irq_data *hd = irq_data_get_irq_chip_data(d);
-	struct bridge_controller *bc;
-	nasid_t nasid;
-	u32 device;
-	int pin;
-
-	if (!hd)
-		return -EINVAL;
-
-	pin = hd->pin;
-	bc = hd->bc;
-
-	nasid = COMPACT_TO_NASID_NODEID(cpu_to_node(hd->cpu));
-	bridge_write(bc, b_int_addr[pin].addr,
-		     (0x20000 | hd->bit | (nasid << 8)));
-	bridge_set(bc, b_int_enable, (1 << pin));
-	bridge_set(bc, b_int_enable, 0x7ffffe00); /* more stuff in int_enable */
-
-	/*
-	 * Enable sending of an interrupt clear packt to the hub on a high to
-	 * low transition of the interrupt pin.
-	 *
-	 * IRIX sets additional bits in the address which are documented as
-	 * reserved in the bridge docs.
-	 */
-	bridge_set(bc, b_int_mode, (1UL << pin));
-
-	/*
-	 * We assume the bridge to have a 1:1 mapping between devices
-	 * (slots) and intr pins.
-	 */
-	device = bridge_read(bc, b_int_device);
-	device &= ~(7 << (pin*3));
-	device |= (pin << (pin*3));
-	bridge_write(bc, b_int_device, device);
-
-	bridge_read(bc, b_wid_tflush);
-
-	enable_hub_irq(d);
-
-	return 0;	/* Never anything pending.  */
-}
-
-static void shutdown_bridge_irq(struct irq_data *d)
-{
-	struct hub_irq_data *hd = irq_data_get_irq_chip_data(d);
-	struct bridge_controller *bc;
-
-	if (!hd)
-		return;
-
-	disable_hub_irq(d);
-
-	bc = hd->bc;
-	bridge_clr(bc, b_int_enable, (1 << hd->pin));
-	bridge_read(bc, b_wid_tflush);
-}
-
 static void setup_hub_mask(struct hub_irq_data *hd, const struct cpumask *mask)
 {
 	nasid_t nasid;
@@ -144,9 +82,6 @@ static void setup_hub_mask(struct hub_irq_data *hd, const struct cpumask *mask)
 		hd->irq_mask[0] = REMOTE_HUB_PTR(nasid, PI_INT_MASK0_B);
 		hd->irq_mask[1] = REMOTE_HUB_PTR(nasid, PI_INT_MASK1_B);
 	}
-
-	/* Make sure it's not already pending when we connect it. */
-	REMOTE_HUB_CLR_INTR(nasid, hd->bit);
 }
 
 static int set_affinity_hub_irq(struct irq_data *d, const struct cpumask *mask,
@@ -163,7 +98,7 @@ static int set_affinity_hub_irq(struct irq_data *d, const struct cpumask *mask,
 	setup_hub_mask(hd, mask);
 
 	if (irqd_is_started(d))
-		startup_bridge_irq(d);
+		enable_hub_irq(d);
 
 	irq_data_update_effective_affinity(d, cpumask_of(hd->cpu));
 
@@ -172,20 +107,22 @@ static int set_affinity_hub_irq(struct irq_data *d, const struct cpumask *mask,
 
 static struct irq_chip hub_irq_type = {
 	.name		  = "HUB",
-	.irq_startup	  = startup_bridge_irq,
-	.irq_shutdown	  = shutdown_bridge_irq,
 	.irq_mask	  = disable_hub_irq,
 	.irq_unmask	  = enable_hub_irq,
 	.irq_set_affinity = set_affinity_hub_irq,
 };
 
-int request_bridge_irq(struct bridge_controller *bc, int pin)
+static int hub_domain_alloc(struct irq_domain *domain, unsigned int virq,
+			    unsigned int nr_irqs, void *arg)
 {
+	struct irq_alloc_info *info = arg;
 	struct hub_irq_data *hd;
 	struct hub_data *hub;
 	struct irq_desc *desc;
 	int swlevel;
-	int irq;
+
+	if (nr_irqs > 1 || !info)
+		return -EINVAL;
 
 	hd = kzalloc(sizeof(*hd), GFP_KERNEL);
 	if (!hd)
@@ -196,46 +133,41 @@ int request_bridge_irq(struct bridge_controller *bc, int pin)
 		kfree(hd);
 		return -EAGAIN;
 	}
-	irq = swlevel + IP27_HUB_IRQ_BASE;
-
-	hd->bc = bc;
-	hd->bit = swlevel;
-	hd->pin = pin;
-	irq_set_chip_data(irq, hd);
+	irq_domain_set_info(domain, virq, swlevel, &hub_irq_type, hd,
+			    handle_level_irq, NULL, NULL);
 
 	/* use CPU connected to nearest hub */
-	hub = hub_data(NASID_TO_COMPACT_NODEID(bc->nasid));
+	hub = hub_data(NASID_TO_COMPACT_NODEID(info->nasid));
 	setup_hub_mask(hd, &hub->h_cpus);
 
-	desc = irq_to_desc(irq);
-	desc->irq_common_data.node = bc->nasid;
+	/* Make sure it's not already pending when we connect it. */
+	REMOTE_HUB_CLR_INTR(info->nasid, swlevel);
+
+	desc = irq_to_desc(virq);
+	desc->irq_common_data.node = info->nasid;
 	cpumask_copy(desc->irq_common_data.affinity, &hub->h_cpus);
 
-	return irq;
+	return 0;
 }
 
-void ip27_hub_irq_init(void)
+static void hub_domain_free(struct irq_domain *domain,
+			    unsigned int virq, unsigned int nr_irqs)
 {
-	int i;
+	struct irq_data *irqd;
 
-	for (i = IP27_HUB_IRQ_BASE;
-	     i < (IP27_HUB_IRQ_BASE + IP27_HUB_IRQ_COUNT); i++)
-		irq_set_chip_and_handler(i, &hub_irq_type, handle_level_irq);
-
-	/*
-	 * Some interrupts are reserved by hardware or by software convention.
-	 * Mark these as reserved right away so they won't be used accidentally
-	 * later.
-	 */
-	for (i = 0; i <= BASE_PCI_IRQ; i++)
-		set_bit(i, hub_irq_map);
-
-	set_bit(IP_PEND0_6_63, hub_irq_map);
+	if (nr_irqs > 1)
+		return;
 
-	for (i = NI_BRDCAST_ERR_A; i <= MSC_PANIC_INTR; i++)
-		set_bit(i, hub_irq_map);
+	irqd = irq_domain_get_irq_data(domain, virq);
+	if (irqd && irqd->chip_data)
+		kfree(irqd->chip_data);
 }
 
+static const struct irq_domain_ops hub_domain_ops = {
+	.alloc = hub_domain_alloc,
+	.free  = hub_domain_free,
+};
+
 /*
  * This code is unnecessarily complex, because we do
  * intr enabling. Basically, once we grab the set of intrs we need
@@ -252,7 +184,9 @@ static void ip27_do_irq_mask0(struct irq_desc *desc)
 {
 	cpuid_t cpu = smp_processor_id();
 	unsigned long *mask = per_cpu(irq_enable_mask, cpu);
+	struct irq_domain *domain;
 	u64 pend0;
+	int irq;
 
 	/* copied from Irix intpend0() */
 	pend0 = LOCAL_HUB_L(PI_INT_PEND0);
@@ -276,7 +210,14 @@ static void ip27_do_irq_mask0(struct irq_desc *desc)
 		generic_smp_call_function_interrupt();
 	} else
 #endif
-		generic_handle_irq(__ffs(pend0) + IP27_HUB_IRQ_BASE);
+	{
+		domain = irq_desc_get_handler_data(desc);
+		irq = irq_linear_revmap(domain, __ffs(pend0));
+		if (irq)
+			generic_handle_irq(irq);
+		else
+			spurious_interrupt();
+	}
 
 	LOCAL_HUB_L(PI_INT_PEND0);
 }
@@ -285,7 +226,9 @@ static void ip27_do_irq_mask1(struct irq_desc *desc)
 {
 	cpuid_t cpu = smp_processor_id();
 	unsigned long *mask = per_cpu(irq_enable_mask, cpu);
+	struct irq_domain *domain;
 	u64 pend1;
+	int irq;
 
 	/* copied from Irix intpend0() */
 	pend1 = LOCAL_HUB_L(PI_INT_PEND1);
@@ -294,7 +237,12 @@ static void ip27_do_irq_mask1(struct irq_desc *desc)
 	if (!pend1)
 		return;
 
-	generic_handle_irq(__ffs(pend1) + IP27_HUB_IRQ_BASE + 64);
+	domain = irq_desc_get_handler_data(desc);
+	irq = irq_linear_revmap(domain, __ffs(pend1) + 64);
+	if (irq)
+		generic_handle_irq(irq);
+	else
+		spurious_interrupt();
 
 	LOCAL_HUB_L(PI_INT_PEND1);
 }
@@ -325,11 +273,41 @@ void install_ipi(void)
 
 void __init arch_init_irq(void)
 {
+	struct irq_domain *domain;
+	struct fwnode_handle *fn;
+	int i;
+
 	mips_cpu_irq_init();
-	ip27_hub_irq_init();
+
+	/*
+	 * Some interrupts are reserved by hardware or by software convention.
+	 * Mark these as reserved right away so they won't be used accidentally
+	 * later.
+	 */
+	for (i = 0; i <= BASE_PCI_IRQ; i++)
+		set_bit(i, hub_irq_map);
+
+	set_bit(IP_PEND0_6_63, hub_irq_map);
+
+	for (i = NI_BRDCAST_ERR_A; i <= MSC_PANIC_INTR; i++)
+		set_bit(i, hub_irq_map);
+
+	fn = irq_domain_alloc_named_fwnode("HUB");
+	WARN_ON(fn == NULL);
+	if (!fn)
+		return;
+	domain = irq_domain_create_linear(fn, IP27_HUB_IRQ_COUNT,
+					  &hub_domain_ops, NULL);
+	WARN_ON(domain == NULL);
+	if (!domain)
+		return;
+
+	irq_set_default_host(domain);
 
 	irq_set_percpu_devid(IP27_HUB_PEND0_IRQ);
-	irq_set_chained_handler(IP27_HUB_PEND0_IRQ, ip27_do_irq_mask0);
+	irq_set_chained_handler_and_data(IP27_HUB_PEND0_IRQ, ip27_do_irq_mask0,
+					 domain);
 	irq_set_percpu_devid(IP27_HUB_PEND1_IRQ);
-	irq_set_chained_handler(IP27_HUB_PEND1_IRQ, ip27_do_irq_mask1);
+	irq_set_chained_handler_and_data(IP27_HUB_PEND1_IRQ, ip27_do_irq_mask1,
+					 domain);
 }
-- 
2.13.7

