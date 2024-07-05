Return-Path: <linux-mips+bounces-4161-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BD4928A89
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 16:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 510951F216FF
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 14:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050BD16DEB8;
	Fri,  5 Jul 2024 14:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="OUMMiDv5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nhIJ/CYY"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A59E16B74D;
	Fri,  5 Jul 2024 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189065; cv=none; b=Qaa37+RYh6vy2fxwqDVM5zhYQcMRA3e3X5NC7IzQeyJnn2cFK6UB4I5Sx+ewzAUjaiQ6bebC6k0AZOLVVrCkkDUGMrY7wwAPSTweWTbplRGH2TpQ5ZhG/uVjuozliXqcWC7kUkayNV6pBaog5XEJzIq6Hs172U6pDc6r/DcGS9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189065; c=relaxed/simple;
	bh=M5PTw2JGYRuwkF/Z6Na1xAnPXX+za7+A+yk3rK99cG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N9Ehc8Ib1S38e+RXYbBuUmGDjaRxwDmHbmaIrglW1XXAKg+9bgINLdSTZKsbymvPQlkQAETKhLz5gcEPFzttbfORNlIGbrgjIFixz4cfMaGsCIVed8P71tTmEjT8yucuzFTfI5tCy36WC17zcH/NtcpJBG688NAtQTE/fle835k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=OUMMiDv5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nhIJ/CYY; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 36AFF114016A;
	Fri,  5 Jul 2024 10:17:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 05 Jul 2024 10:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720189063;
	 x=1720275463; bh=aHAGPgY3TRPydV0uDWZcikjrrn5KeIh86puKszgtHOs=; b=
	OUMMiDv5Ok/MeTQoB0lfzO8iirVxlN91YmiF6UvtpTBnYtI/O2b20TO2GjEeHuQi
	NH3fZjVEIF6T3YFUgtJ8Z8+YfdpDPN+2iQoCMgHwvIy4L8vptkwNnN43V9BBZHw5
	mBtzFYNP65IAwJRvy/RKm/k8TQh2CuD24VeeFB7r9P40gCWNUu1ve6a5v1zOWauD
	d9kIBvNED94dvkdtSEPdhCVMfX/oIs7o8/FVpJ4V4ZDw5LjF0J+ixh6jU72SJ0oV
	ZYOzEc+4Bu8N5TqizGbLYN+3OCNLhjKHMNPtCDrQGceBXTzKJgA8p/YXdh6inJCP
	ipz98Cfl4JZX//p7niFUcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720189063; x=
	1720275463; bh=aHAGPgY3TRPydV0uDWZcikjrrn5KeIh86puKszgtHOs=; b=n
	hIJ/CYYh3DqnoGxDO061P6DMdcvjzCDaxKDJxhOMo9LFkj2iS19BSztbGRKVf3qK
	0M/ssXv8WboT2rbqvpZ/XqSUaPx+8fppSyndd8re9r/gXMXhtWBGunz3gB6hnyJz
	RvF4MXUobsQUhhwRbvOxHjJ167fqwgD6Hno1SLoqO777FTo5Q/d7/sP9VMxIaiDP
	iJpCFxz/1YxB+ERznjK3IYrQlpEkXJezr3VAi8sEZJxNsocfWlPXmYY6GK2Raf5V
	f8dFmDMFKdQF9PPUUKfLRJhG7x8h9S6c6+wb6nyDvY/wHVlIH3PQWsjUhaw2C6Aq
	voojF9mdE44dwwTgrjdVg==
X-ME-Sender: <xms:hgCIZvSrcTzvo7JiuOUp079u3v-KRwFcnlTaSDygRfSoJbY50gGEsQ>
    <xme:hgCIZgyLyUG11__jnteTFN_gqPy2jvGVsVoIxZXQA6qUxK5viTmDa1IyZly7VxwiZ
    GkZmhN0e1x8mbaHBuM>
X-ME-Received: <xmr:hgCIZk1ULaRyPcOA5bguAveIlHXuhzH-acJY4k8AkYlDWac7qupm68jZAxuyyUoVy2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:hgCIZvB-6WJJTDRHT93_kCdVrwH6z0z4SB_van4iDqztC1sTdMxiZQ>
    <xmx:hgCIZohw-kbnJ30x--sGXNvKFpmM7BWNC5sPmVxwQ1NaRWeL4-SHhA>
    <xmx:hgCIZjq2AmgyKolCXlD76m8AyXXhyJ38VaGLF_eVtghVr5i_AeJZUg>
    <xmx:hgCIZjhE9XSTkpdtT24pJxOfsMMsfmEfsmd4IFf8wdDRUdhmNYUeUA>
    <xmx:hwCIZtY0foia3cKpiLjPyxFrkMTrlh4LfLR6YCDvPvn2uzWg3kjAI6yg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jul 2024 10:17:39 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 05 Jul 2024 22:16:58 +0800
Subject: [PATCH v2 06/10] irqchip: irq-mips-gic: Switch to ipi_mux
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-b4-mips-ipi-improvements-v2-6-2d50b56268e8@flygoat.com>
References: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
In-Reply-To: <20240705-b4-mips-ipi-improvements-v2-0-2d50b56268e8@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9752;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=M5PTw2JGYRuwkF/Z6Na1xAnPXX+za7+A+yk3rK99cG8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQOhnSN2S+Yhfq+KO5v1ulq6l19T9ii+4f1Wgn3nKkNl
 urLVgV3lLIwiHExyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwESMFzD8synq3rX5jMyDN0df
 XrsexajBJxT0mLdS6d+3+9+uB9csTGdk+CT+IEH6K/emCFmLZCcfi7KVabnRH/h/mfFZa/hGREk
 wAwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Use ipi_mux to implement IPI interrupts instead of
allocating vector for each individual IPI messages.

This can reduce number of reserved GIC shared vectors,
which is a huge problem on MSI enabled GIC systems.

It also allowed us to easily expand number of IPIs.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig        |   1 +
 drivers/irqchip/irq-mips-gic.c | 200 ++++++++++++++---------------------------
 2 files changed, 66 insertions(+), 135 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 344c484736af..d5b841601731 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -341,6 +341,7 @@ config KEYSTONE_IRQ
 config MIPS_GIC
 	bool
 	select GENERIC_IRQ_IPI if SMP
+	select GENERIC_IRQ_IPI_MUX if SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM
 
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 76253e864f23..eb58392f0e66 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -17,12 +17,14 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/of_address.h>
 #include <linux/percpu.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
 
+#include <asm/ipi.h>
 #include <asm/mips-cps.h>
 #include <asm/setup.h>
 #include <asm/traps.h>
@@ -58,7 +60,7 @@ static struct irq_chip gic_level_irq_controller, gic_edge_irq_controller;
 
 #ifdef CONFIG_GENERIC_IRQ_IPI
 static DECLARE_BITMAP(ipi_resrv, GIC_MAX_INTRS);
-static DECLARE_BITMAP(ipi_available, GIC_MAX_INTRS);
+static int cpu_ipi_intr[NR_CPUS] __read_mostly;
 #endif /* CONFIG_GENERIC_IRQ_IPI */
 
 static struct gic_all_vpes_chip_data {
@@ -108,13 +110,6 @@ static void gic_bind_eic_interrupt(int irq, int set)
 	write_gic_vl_eic_shadow_set(irq, set);
 }
 
-static void gic_send_ipi(struct irq_data *d, unsigned int cpu)
-{
-	irq_hw_number_t hwirq = GIC_HWIRQ_TO_SHARED(irqd_to_hwirq(d));
-
-	write_gic_wedge(GIC_WEDGE_RW | hwirq);
-}
-
 int gic_get_c0_compare_int(void)
 {
 	if (!gic_local_irq_is_routable(GIC_LOCAL_INT_TIMER))
@@ -181,6 +176,11 @@ static void gic_mask_irq(struct irq_data *d)
 	unsigned int intr = GIC_HWIRQ_TO_SHARED(d->hwirq);
 
 	write_gic_rmask(intr);
+
+#ifdef CONFIG_GENERIC_IRQ_IPI
+	if (test_bit(intr, ipi_resrv))
+		return;
+#endif
 	gic_clear_pcpu_masks(intr);
 }
 
@@ -191,6 +191,10 @@ static void gic_unmask_irq(struct irq_data *d)
 
 	write_gic_smask(intr);
 
+#ifdef CONFIG_GENERIC_IRQ_IPI
+	if (test_bit(intr, ipi_resrv))
+		return;
+#endif
 	gic_clear_pcpu_masks(intr);
 	cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
 	set_bit(intr, per_cpu_ptr(pcpu_masks, cpu));
@@ -263,6 +267,11 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 	unsigned long flags;
 	unsigned int cpu;
 
+#ifdef CONFIG_GENERIC_IRQ_IPI
+	if (test_bit(irq, ipi_resrv))
+		return -EINVAL;
+#endif
+
 	cpu = cpumask_first_and(cpumask, cpu_online_mask);
 	if (cpu >= NR_CPUS)
 		return -EINVAL;
@@ -304,7 +313,6 @@ static struct irq_chip gic_edge_irq_controller = {
 #ifdef CONFIG_SMP
 	.irq_set_affinity	=	gic_set_affinity,
 #endif
-	.ipi_send_single	=	gic_send_ipi,
 };
 
 static void gic_handle_local_int(bool chained)
@@ -475,12 +483,6 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	u32 map;
 
 	if (hwirq >= GIC_SHARED_HWIRQ_BASE) {
-#ifdef CONFIG_GENERIC_IRQ_IPI
-		/* verify that shared irqs don't conflict with an IPI irq */
-		if (test_bit(GIC_HWIRQ_TO_SHARED(hwirq), ipi_resrv))
-			return -EBUSY;
-#endif /* CONFIG_GENERIC_IRQ_IPI */
-
 		err = irq_domain_set_hwirq_and_chip(d, virq, hwirq,
 						    &gic_level_irq_controller,
 						    NULL);
@@ -570,146 +572,74 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 };
 
 #ifdef CONFIG_GENERIC_IRQ_IPI
-
-static int gic_ipi_domain_xlate(struct irq_domain *d, struct device_node *ctrlr,
-				const u32 *intspec, unsigned int intsize,
-				irq_hw_number_t *out_hwirq,
-				unsigned int *out_type)
-{
-	/*
-	 * There's nothing to translate here. hwirq is dynamically allocated and
-	 * the irq type is always edge triggered.
-	 * */
-	*out_hwirq = 0;
-	*out_type = IRQ_TYPE_EDGE_RISING;
-
-	return 0;
-}
-
-static int gic_ipi_domain_alloc(struct irq_domain *d, unsigned int virq,
-				unsigned int nr_irqs, void *arg)
-{
-	struct cpumask *ipimask = arg;
-	irq_hw_number_t hwirq, base_hwirq;
-	int cpu, ret, i;
-
-	base_hwirq = find_first_bit(ipi_available, gic_shared_intrs);
-	if (base_hwirq == gic_shared_intrs)
-		return -ENOMEM;
-
-	/* check that we have enough space */
-	for (i = base_hwirq; i < nr_irqs; i++) {
-		if (!test_bit(i, ipi_available))
-			return -EBUSY;
-	}
-	bitmap_clear(ipi_available, base_hwirq, nr_irqs);
-
-	/* map the hwirq for each cpu consecutively */
-	i = 0;
-	for_each_cpu(cpu, ipimask) {
-		hwirq = GIC_SHARED_TO_HWIRQ(base_hwirq + i);
-
-		ret = irq_domain_set_hwirq_and_chip(d, virq + i, hwirq,
-						    &gic_edge_irq_controller,
-						    NULL);
-		if (ret)
-			goto error;
-
-		ret = irq_domain_set_hwirq_and_chip(d->parent, virq + i, hwirq,
-						    &gic_edge_irq_controller,
-						    NULL);
-		if (ret)
-			goto error;
-
-		ret = irq_set_irq_type(virq + i, IRQ_TYPE_EDGE_RISING);
-		if (ret)
-			goto error;
-
-		ret = gic_shared_irq_domain_map(d, virq + i, hwirq, cpu);
-		if (ret)
-			goto error;
-
-		i++;
-	}
-
-	return 0;
-error:
-	bitmap_set(ipi_available, base_hwirq, nr_irqs);
-	return ret;
-}
-
-static void gic_ipi_domain_free(struct irq_domain *d, unsigned int virq,
-				unsigned int nr_irqs)
+static void gic_handle_ipi_irq(struct irq_desc *desc)
 {
-	irq_hw_number_t base_hwirq;
-	struct irq_data *data;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
 
-	data = irq_get_irq_data(virq);
-	if (!data)
-		return;
-
-	base_hwirq = GIC_HWIRQ_TO_SHARED(irqd_to_hwirq(data));
-	bitmap_set(ipi_available, base_hwirq, nr_irqs);
+	chained_irq_enter(chip, desc);
+	ipi_mux_process();
+	chained_irq_exit(chip, desc);
 }
 
-static int gic_ipi_domain_match(struct irq_domain *d, struct device_node *node,
-				enum irq_domain_bus_token bus_token)
+static void gic_ipi_send(unsigned int cpu)
 {
-	bool is_ipi;
-
-	switch (bus_token) {
-	case DOMAIN_BUS_IPI:
-		is_ipi = d->bus_token == bus_token;
-		return (!node || to_of_node(d->fwnode) == node) && is_ipi;
-		break;
-	default:
-		return 0;
-	}
+	write_gic_wedge(GIC_WEDGE_RW | cpu_ipi_intr[cpu]);
 }
 
-static const struct irq_domain_ops gic_ipi_domain_ops = {
-	.xlate = gic_ipi_domain_xlate,
-	.alloc = gic_ipi_domain_alloc,
-	.free = gic_ipi_domain_free,
-	.match = gic_ipi_domain_match,
-};
-
-static int gic_register_ipi_domain(struct device_node *node)
+static int gic_ipi_mux_init(struct device_node *node, struct irq_domain *d)
 {
-	struct irq_domain *gic_ipi_domain;
-	unsigned int v[2], num_ipis;
-
-	gic_ipi_domain = irq_domain_add_hierarchy(gic_irq_domain,
-						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
-						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
-						  node, &gic_ipi_domain_ops, NULL);
-	if (!gic_ipi_domain) {
-		pr_err("Failed to add IPI domain");
-		return -ENXIO;
-	}
-
-	irq_domain_update_bus_token(gic_ipi_domain, DOMAIN_BUS_IPI);
+	unsigned int i, v[2], num_ipis;
+	int ipi_virq, cpu = 0;
 
 	if (node &&
 	    !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", v, 2)) {
 		bitmap_set(ipi_resrv, v[0], v[1]);
 	} else {
 		/*
-		 * Reserve 2 interrupts per possible CPU/VP for use as IPIs,
-		 * meeting the requirements of arch/mips SMP.
+		 * Reserve 1 interrupts per possible CPU/VP for use as IPIs
 		 */
-		num_ipis = 2 * num_possible_cpus();
+		num_ipis = num_possible_cpus();
 		bitmap_set(ipi_resrv, gic_shared_intrs - num_ipis, num_ipis);
 	}
 
-	bitmap_copy(ipi_available, ipi_resrv, GIC_MAX_INTRS);
+	ipi_virq = ipi_mux_create(IPI_MAX, gic_ipi_send);
+
+	WARN_ON(bitmap_weight(ipi_resrv, GIC_MAX_INTRS) < num_possible_cpus());
+
+	for_each_set_bit(i, ipi_resrv, GIC_MAX_INTRS) {
+		struct irq_fwspec fwspec;
+		int virq;
+
+		fwspec.fwnode = of_node_to_fwnode(node);
+		fwspec.param_count = 3;
+		fwspec.param[0] = GIC_SHARED;
+		fwspec.param[1] = i;
+		fwspec.param[2] = IRQ_TYPE_EDGE_RISING;
+
+		virq = irq_create_fwspec_mapping(&fwspec);
+		if (!virq)
+			return -EINVAL;
+
+		gic_shared_irq_domain_map(d, virq, GIC_SHARED_TO_HWIRQ(i), cpu);
+		irq_set_chained_handler(virq, gic_handle_ipi_irq);
+		gic_clear_pcpu_masks(i);
+		set_bit(i, per_cpu_ptr(pcpu_masks, cpu));
+
+		cpu_ipi_intr[cpu] = i;
+
+		cpu++;
+		if (cpu >= num_possible_cpus())
+			break;
+	}
+
+	mips_smp_ipi_set_virq_range(ipi_virq, IPI_MAX);
 
 	return 0;
 }
 
 #else /* !CONFIG_GENERIC_IRQ_IPI */
 
-static inline int gic_register_ipi_domain(struct device_node *node)
+static inline int gic_ipi_mux_init(struct device_node *node)
 {
 	return 0;
 }
@@ -809,10 +739,6 @@ static int __init gic_of_init(struct device_node *node,
 		return -ENXIO;
 	}
 
-	ret = gic_register_ipi_domain(node);
-	if (ret)
-		return ret;
-
 	board_bind_eic_interrupt = &gic_bind_eic_interrupt;
 
 	/* Setup defaults */
@@ -822,6 +748,10 @@ static int __init gic_of_init(struct device_node *node,
 		write_gic_rmask(i);
 	}
 
+	ret = gic_ipi_mux_init(node, gic_irq_domain);
+	if (ret)
+		return ret;
+
 	return cpuhp_setup_state(CPUHP_AP_IRQ_MIPS_GIC_STARTING,
 				 "irqchip/mips/gic:starting",
 				 gic_cpu_startup, NULL);

-- 
2.45.2


