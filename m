Return-Path: <linux-mips+bounces-3706-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72044909FE0
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 23:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 600791C20A1D
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 21:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5882212C7E3;
	Sun, 16 Jun 2024 21:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="aFw6CzoV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="idsnXLte"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C65B127E0D;
	Sun, 16 Jun 2024 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571841; cv=none; b=S31i3NxhKpwr34RF6lHWPjVLGE+PuafrWVof65m87Agte7K8uGwnu56oyxvfKlJUUUYqQ8gIzsYfc9ni9DPjQmd8oAW/LOgkuokVZw/RL7kojRvXdb8X25pnLej+XSyiUz8WzWCPqd0p3CAXRCeRuNjY+ZfkBex4nCBGtfRIWgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571841; c=relaxed/simple;
	bh=lx7xVfQehBExS3lQLZp71uNbKmPoI6Kqrmrljn//Kv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKupRHEnqws+NRMait1Glj+duh687JsqKrh0kb1i6NLYMuN176EfkjBjq8asEI5/lgbqZHbrBj8Xj3JGXfBmF/MQl+BvcW2kUGE+wAPMk124P28QcPU/x8HOe6uyoi6Z6eZumHNGkEpWpGK13QsFOZx0rkWlvfd7JlRVyn8vOOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=aFw6CzoV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=idsnXLte; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 465CB18000C2;
	Sun, 16 Jun 2024 17:03:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 16 Jun 2024 17:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718571837;
	 x=1718658237; bh=erzt0wSfB45ZGsaDWZkMLOXkQkwqDZK8Y6ZCLzKDr2o=; b=
	aFw6CzoV+nJxTHTsQjOcmCYhKbc/9QeKJ3IHoyefrMdFQDljjVLFlK3/Sd2L9cbw
	H5IwZBhfZ4WR2XOWxDUCPQN3FIh+xhscjxH3iep34wdzrkHBUmVcspyj56CXyx4z
	bTwUjq+eeHQH/fGrFJ25jwwPky87PR8M0ntynwj9uU/+jj4OkAELPN1hvtBxPx7B
	AyGnmzgCZlWpvLTlj7xEXKER2fL621wzB8aIdIOyrVYfR2ZC7yd0lDwiwlb1ZIFK
	jNkeidZT+B+Y0+iscrJwtlIrsRaVBjVggnzDmLGNwcq5rEicYiHihYFp2MS5ze4b
	4u6JF9iOXxEOoJ3RcoRqJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718571837; x=
	1718658237; bh=erzt0wSfB45ZGsaDWZkMLOXkQkwqDZK8Y6ZCLzKDr2o=; b=i
	dsnXLtetrlfn4qXcuCPwkRrNBBmknNUsxz/H0j5Edch4YySHHrh7fyqdLgQN9JH7
	vyNiolKb/UPIFjZVkTntKhFb7hp4igVtktjkr7/CYPomzcRYabYPbRSjIW42vfrh
	D17ny/anKIWnEeMJjF8sZQcDsGaT2SiGNm/fE5RwHLsox2gzgTKE4siUYZphotWL
	lqeh4JMkdFizg+6S2DOHr1PwmsjBl6GitAFMWZp/YVJZgz4LKVLGT7/L9NeGCTTB
	RfuSgXtZgm4n3dZhHeKtX0pGgJyDLsn6jlC0I5SZ6Mb+Obaj/dT0azKf5EOafo4/
	Us8l1Fsfl4himhoM2yUBQ==
X-ME-Sender: <xms:PVNvZpqmDS5-96tM1ZxjChrIoxvBlsi6yPdsbFjGcv-EeV7yC3mbXQ>
    <xme:PVNvZrpnbEkZiYyNkVXGiEPTt9cRfvLjJSLf944U_EZEsSkak6lOfgWlK0KM54onF
    kOS17_WNV840sMqQwE>
X-ME-Received: <xmr:PVNvZmOeMYuJ95hstJMbFDMUEcv9oQJTEIqkYTU1vbksqKUAx9AgW_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:PVNvZk7OlPqIrFle4yn7w4DBMR1PEKeWXqfeG7o30oLePY6AR1TF9A>
    <xmx:PVNvZo6v4XIYoSyqIDZmukkQvtc2EM7WuzH6i9hKFLxRgZUKXE5uow>
    <xmx:PVNvZsjvnylXhl_prWdMacthDAxHoQNNiSf--YG3QiHa8rSdffVQCg>
    <xmx:PVNvZq5ZhFkGninCsX_4UuYE068ymZZez0BHnE_6MqytfzrFhA5Ogw>
    <xmx:PVNvZlxBa0uF4eQwWqzhn4rjLX9fu5Pk1K18Ox7CthlHgQsd1wqTKbfc>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 17:03:56 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 22:03:14 +0100
Subject: [PATCH 10/10] MIPS: smp-mt: Rework IPI functions
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-b4-mips-ipi-improvements-v1-10-e332687f1692@flygoat.com>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
In-Reply-To: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8867;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=lx7xVfQehBExS3lQLZp71uNbKmPoI6Kqrmrljn//Kv4=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT8YHnj7ZpHuKbknH/49PRhB96PTb2udnGfC1TF5Gdoe
 17yTe3rKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIlUPmf4H5km+rs1gmHxwZKa
 EI+tx39/1tfKTZs5h1dZZGLizVb9fwz/E56d4ogNDy474jzrdpe9buecmcsZtnN12+y+lXfuWJo
 DFwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Move smp IRQ code from irq-mips-cpu to smp-mt as IPI is
not really relavant to CPU intc. In VEIC mode we can have
irq-mips-cpu not registered and SW interrupts comes from
EIC controllers.

Implement IPI with ipi-mux to allow easy extension to number
of IPIs.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig              |   2 +
 arch/mips/kernel/smp-mt.c      |  70 +++++++++++++++++++++++
 drivers/irqchip/Kconfig        |   1 -
 drivers/irqchip/irq-mips-cpu.c | 124 +----------------------------------------
 4 files changed, 74 insertions(+), 123 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1236ea122061..de06c7425e94 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2188,6 +2188,8 @@ config MIPS_MT_SMP
 	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MICROMIPS
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
+	select GENERIC_IRQ_IPI
+	select GENERIC_IRQ_IPI_MUX
 	select SYNC_R4K
 	select MIPS_MT
 	select SMP
diff --git a/arch/mips/kernel/smp-mt.c b/arch/mips/kernel/smp-mt.c
index 7729cc733421..2f00077dbf07 100644
--- a/arch/mips/kernel/smp-mt.c
+++ b/arch/mips/kernel/smp-mt.c
@@ -10,6 +10,10 @@
 #include <linux/sched.h>
 #include <linux/cpumask.h>
 #include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/compiler.h>
 #include <linux/sched/task_stack.h>
 #include <linux/smp.h>
@@ -19,6 +23,7 @@
 #include <asm/cpu.h>
 #include <asm/processor.h>
 #include <asm/hardirq.h>
+#include <asm/ipi.h>
 #include <asm/mmu_context.h>
 #include <asm/time.h>
 #include <asm/mipsregs.h>
@@ -26,6 +31,65 @@
 #include <asm/mips_mt.h>
 #include <asm/mips-cps.h>
 
+static int vsmp_sw0_virq __ro_after_init;
+
+static void smvp_handle_ipi_irq(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(chip, desc);
+
+	/* irq-mips-cpu would ack for us, but EIC drivers won't */
+	if (cpu_has_veic) {
+		unsigned int vpflags = dvpe();
+
+		clear_c0_cause(C_SW0);
+		evpe(vpflags);
+	}
+	ipi_mux_process();
+
+	chained_irq_exit(chip, desc);
+}
+
+static void smvp_ipi_send(unsigned int cpu)
+{
+	unsigned long flags;
+	int vpflags;
+
+	local_irq_save(flags);
+
+	/* We can only send IPIs to VPEs within the local core */
+	WARN_ON(!cpus_are_siblings(smp_processor_id(), cpu));
+	vpflags = dvpe();
+	settc(cpu_vpe_id(&cpu_data[cpu]));
+	write_vpe_c0_status(read_vpe_c0_status() | C_SW0);
+	write_vpe_c0_cause(read_vpe_c0_cause() | C_SW0);
+	evpe(vpflags);
+
+	local_irq_restore(flags);
+}
+
+static int __init vsmp_ipi_init(void)
+{
+	int sw0_virq, mux_virq;
+
+	/* SW0 Interrupt for IPI */
+	sw0_virq = get_mips_sw_int(0);
+	if (!sw0_virq)
+		return -EINVAL;
+
+	mux_virq = ipi_mux_create(IPI_MAX, smvp_ipi_send);
+	if (!mux_virq)
+		return -EINVAL;
+
+	irq_set_percpu_devid(sw0_virq);
+	irq_set_chained_handler(sw0_virq, smvp_handle_ipi_irq);
+	mips_smp_ipi_set_virq_range(mux_virq, IPI_MAX);
+	vsmp_sw0_virq = sw0_virq;
+
+	return 0;
+}
+
 static void __init smvp_copy_vpe_config(void)
 {
 	write_vpe_c0_status(
@@ -123,6 +187,8 @@ static void vsmp_smp_finish(void)
 	/* CDFIXME: remove this? */
 	write_c0_compare(read_c0_count() + (8* mips_hpt_frequency/HZ));
 
+	enable_percpu_irq(vsmp_sw0_virq, IRQ_TYPE_NONE);
+
 #ifdef CONFIG_MIPS_MT_FPAFF
 	/* If we have an FPU, enroll ourselves in the FPU-full mask */
 	if (cpu_has_fpu)
@@ -226,7 +292,11 @@ static void __init vsmp_smp_setup(void)
 
 static void __init vsmp_prepare_cpus(unsigned int max_cpus)
 {
+	int rc;
+
 	mips_mt_set_cpuoptions();
+	rc = vsmp_ipi_init();
+	WARN_ON(rc);
 }
 
 const struct plat_smp_ops vsmp_smp_ops = {
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8665bbf31bb5..bb63b07faa27 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -175,7 +175,6 @@ config MADERA_IRQ
 config IRQ_MIPS_CPU
 	bool
 	select GENERIC_IRQ_CHIP
-	select GENERIC_IRQ_IPI if SMP && SYS_SUPPORTS_MULTITHREADING
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 4854c06ce652..456f58729d00 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -34,8 +34,7 @@
 #include <asm/mipsmtregs.h>
 #include <asm/setup.h>
 
-static struct irq_domain *irq_domain;
-static struct irq_domain *ipi_domain;
+static struct irq_domain *irq_domain __read_mostly;
 
 static inline void unmask_mips_irq(struct irq_data *d)
 {
@@ -108,37 +107,12 @@ static void mips_mt_sw_irq_ack(struct irq_data *d)
 	evpe(vpflags);
 }
 
-#ifdef CONFIG_GENERIC_IRQ_IPI
-
-static void mips_mt_send_ipi(struct irq_data *d, unsigned int cpu)
-{
-	irq_hw_number_t hwirq = irqd_to_hwirq(d);
-	unsigned long flags;
-	int vpflags;
-
-	local_irq_save(flags);
-
-	/* We can only send IPIs to VPEs within the local core */
-	WARN_ON(!cpus_are_siblings(smp_processor_id(), cpu));
-
-	vpflags = dvpe();
-	settc(cpu_vpe_id(&cpu_data[cpu]));
-	write_vpe_c0_cause(read_vpe_c0_cause() | (C_SW0 << hwirq));
-	evpe(vpflags);
-
-	local_irq_restore(flags);
-}
-
-#endif /* CONFIG_GENERIC_IRQ_IPI */
 static const struct irq_chip mips_mt_cpu_irq_controller = {
 	.name		= "MIPS",
 	.irq_startup	= mips_mt_sw_irq_startup,
 	.irq_ack	= mips_mt_sw_irq_ack,
 	.irq_mask	= mask_mips_irq,
 	.irq_unmask	= unmask_mips_irq,
-#ifdef CONFIG_GENERIC_IRQ_IPI
-	.ipi_send_single = mips_mt_send_ipi,
-#endif
 };
 #endif
 
@@ -154,15 +128,8 @@ asmlinkage void __weak plat_irq_dispatch(void)
 
 	pending >>= CAUSEB_IP;
 	while (pending) {
-		struct irq_domain *d;
-
 		irq = fls(pending) - 1;
-		if (IS_ENABLED(CONFIG_GENERIC_IRQ_IPI) && irq < 2)
-			d = ipi_domain;
-		else
-			d = irq_domain;
-
-		do_domain_IRQ(d, irq);
+		do_domain_IRQ(irq_domain, irq);
 		pending &= ~BIT(irq);
 	}
 }
@@ -195,86 +162,6 @@ static const struct irq_domain_ops mips_cpu_intc_irq_domain_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
-#ifdef CONFIG_GENERIC_IRQ_IPI
-
-struct cpu_ipi_domain_state {
-	DECLARE_BITMAP(allocated, 2);
-};
-
-static int mips_cpu_ipi_alloc(struct irq_domain *domain, unsigned int virq,
-			      unsigned int nr_irqs, void *arg)
-{
-	struct cpu_ipi_domain_state *state = domain->host_data;
-	unsigned int i, hwirq;
-	int ret;
-
-	for (i = 0; i < nr_irqs; i++) {
-		hwirq = find_first_zero_bit(state->allocated, 2);
-		if (hwirq == 2)
-			return -EBUSY;
-		bitmap_set(state->allocated, hwirq, 1);
-
-		ret = irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq,
-						    &mips_mt_cpu_irq_controller,
-						    NULL);
-		if (ret)
-			return ret;
-
-		ret = irq_domain_set_hwirq_and_chip(domain->parent, virq + i, hwirq,
-						    &mips_mt_cpu_irq_controller,
-						    NULL);
-
-		if (ret)
-			return ret;
-
-		ret = irq_set_irq_type(virq + i, IRQ_TYPE_LEVEL_HIGH);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int mips_cpu_ipi_match(struct irq_domain *d, struct device_node *node,
-			      enum irq_domain_bus_token bus_token)
-{
-	bool is_ipi;
-
-	switch (bus_token) {
-	case DOMAIN_BUS_IPI:
-		is_ipi = d->bus_token == bus_token;
-		return (!node || (to_of_node(d->fwnode) == node)) && is_ipi;
-	default:
-		return 0;
-	}
-}
-
-static const struct irq_domain_ops mips_cpu_ipi_chip_ops = {
-	.alloc	= mips_cpu_ipi_alloc,
-	.match	= mips_cpu_ipi_match,
-};
-
-static void mips_cpu_register_ipi_domain(struct device_node *of_node)
-{
-	struct cpu_ipi_domain_state *ipi_domain_state;
-
-	ipi_domain_state = kzalloc(sizeof(*ipi_domain_state), GFP_KERNEL);
-	ipi_domain = irq_domain_add_hierarchy(irq_domain,
-					      IRQ_DOMAIN_FLAG_IPI_SINGLE,
-					      2, of_node,
-					      &mips_cpu_ipi_chip_ops,
-					      ipi_domain_state);
-	if (!ipi_domain)
-		panic("Failed to add MIPS CPU IPI domain");
-	irq_domain_update_bus_token(ipi_domain, DOMAIN_BUS_IPI);
-}
-
-#else /* !CONFIG_GENERIC_IRQ_IPI */
-
-static inline void mips_cpu_register_ipi_domain(struct device_node *of_node) {}
-
-#endif /* !CONFIG_GENERIC_IRQ_IPI */
-
 int mips_cpu_get_sw_int(int hwint)
 {
 	/* Only 0 and 1 for SW INT */
@@ -297,13 +184,6 @@ static void __init __mips_cpu_irq_init(struct device_node *of_node)
 					   NULL);
 	if (!irq_domain)
 		panic("Failed to add irqdomain for MIPS CPU");
-
-	/*
-	 * Only proceed to register the software interrupt IPI implementation
-	 * for CPUs which implement the MIPS MT (multi-threading) ASE.
-	 */
-	if (cpu_has_mipsmt)
-		mips_cpu_register_ipi_domain(of_node);
 }
 
 void __init mips_cpu_irq_init(void)

-- 
2.43.0


