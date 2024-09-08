Return-Path: <linux-mips+bounces-5426-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8D097067E
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DE901F22283
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4356A1598EC;
	Sun,  8 Sep 2024 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ODZhHOUO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TJOoquHY"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A3615852A;
	Sun,  8 Sep 2024 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790835; cv=none; b=eTPn//vqDNmbQzhGLU5mWB3okYucmCr3bf0zFp2Ls/tqlsT4eqFe0PYJfpPYRw79prrgnvZcwvRKsCl0sgeJiw/RREjdBbT/+09LRHa+kepNgUcl4F+DhXjtOYO73WfHa/nSjOek/nbqs27EMU1TMIE4ZkxAgYzObXb1pmuxzso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790835; c=relaxed/simple;
	bh=QflEulZxDbALP4BwUnO0lInSsOEZWkiydNgutNPqiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgaL+yrtoEaVHXSERLFlkxvqrOel88MeJIK+KS4gDLgo5hkYrCggt/0M5/XQGIrZvwoPoc+RFQoNbhXBRr6rZf/ZEaO/P2gC0VwEq8/ejQsLz67me8sj518hmzVl+hZ/N6/nnhXd+HOvA5fZsf9d0IBQuRu4qBkFabwycCBGDMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ODZhHOUO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TJOoquHY; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 7A46D13802F0;
	Sun,  8 Sep 2024 06:20:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sun, 08 Sep 2024 06:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790832;
	 x=1725877232; bh=uAaFfewWahm8VsR4u05m4mtA0BI9YTR+WwDXfl07VMk=; b=
	ODZhHOUOF14+22GwGdlPlC4mvVMZUjMV6xDjD3PDQ7+DxZrP0So28a9gD/lP0Xer
	2P9rmbMopgiSxRKSJLfYy/Av7dqHgg8Q49Eb1hrdBfsc6hr4VJrmy/dnvtD1BnmJ
	rtpL0HLpKRx8ihx/izpDpwdoyNWfMuuSMEkNvzlRemIsdD4Q5JUWNiQ5A23n+pDn
	PeqYdN0XTs+WPOYgXFMdQ9fju+hLmK5nNtVPe9cDydJzywbZHY9s4QKmVlB6wi/x
	ixRFd5Pb/8kOgliyGWyxfcWbLtfKn7tsZXTuTR2i0u1S5WSDNg9AfqfcBxNH2YAK
	0zEcybm8BtHW8wFHrcpRpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790832; x=
	1725877232; bh=uAaFfewWahm8VsR4u05m4mtA0BI9YTR+WwDXfl07VMk=; b=T
	JOoquHY6fQqBsm8xWBqPIfjogxar6+r16WLmFR9ovI2UO8LkcfoJ8jcdF2WTobb2
	HS+gYv93lXp+opnnHCI4W/w+/r43USxduCWo+2A4F8qvf7sbO6bswBn54mSjiFsk
	SCKp3GfBCWrj4TqW9DBybjgeGgzk9TDkBX91nry11Ejq064RKqfP4+RFee7QQlFO
	2mhJgR5A9Cdhe+4YajaU1DbzpLKhw3NFALHydo3AO/+OO9UxR04CNP3Vxw19fEo6
	QOlZTE8vOuuOBC85t6iFD0NtTSLKPJ0T5Jpv0NG6kN2hTMhlXl0QdYwoXXS5h3D1
	Wsl9zIs4VMvgikZnW0/qA==
X-ME-Sender: <xms:cHrdZksENxbC9aKlsL63WXKXkO21OTQIzc1_bclBbm6ojCfcQerL4Q>
    <xme:cHrdZhdSYipWWu3H2fCk5c8YJo6ImM_rqkVxTt_FmXCNBAPVqvMV96A58gpv1b8H_
    2wkyHZ7l7UWou8ctfI>
X-ME-Received: <xmr:cHrdZvz1MfhepF0UPGFQJ_Q47wAONVts22k7HoxKcP-Cm2NwFTJWCAQ7uiA6-JVNE-o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgepvdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehfrghntggvrhdrlhgrnhgtvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhi
    rgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehflhhorhhi
    rghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepphgruh
    hlsghurhhtohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhp
    shesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhf
    vggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegthh
    gvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cHrdZnOQeSGHLR1qdVk9HGeew5txB8RUO52mGjc72WQpY-bwr7uS2g>
    <xmx:cHrdZk-X0ZimlWAb_FrgwIURmE3sV9wdAgtp3XgJv6bula5Rh4lC4w>
    <xmx:cHrdZvUC6d7PWOvCdTxejyaQ3farIC9oe8-O5tjVPYVAQiGPQR2GZQ>
    <xmx:cHrdZtfxV-TlF2eNvpVwnzht7bgkWpYsNlOyJ7p5uMcO2IX0NbauOA>
    <xmx:cHrdZl2bmDAcBIQDNOJ4W9IEJHgv4BdEmFqhztHn1e8WlKjJ92BCZkct>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:31 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:21 +0100
Subject: [PATCH v5 10/10] MIPS: smp-mt: Rework IPI functions
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-10-be8617dd2e53@flygoat.com>
References: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
In-Reply-To: <20240908-b4-mips-ipi-improvements-v5-0-be8617dd2e53@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8920;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=QflEulZxDbALP4BwUnO0lInSsOEZWkiydNgutNPqiVE=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQlW19v+FrJJbXgv/fiWbrNBlKfAMaYag6j4M/bsw
 RevC0/tKGVhEONikBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIl4HmJkmDzDSSODb7ead9kP
 G42WG8JPl6izvp3OufCCnXSd4rlTBgz/q9SnF5z9LFEXriIpLZbNdXJto9cdzyX6MmenCaVsWcj
 ECQA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Move smp IRQ code from irq-mips-cpu to smp-mt as IPI is
not really relavant to CPU intc. In VEIC mode we can have
irq-mips-cpu not registered and SW interrupts comes from
EIC controllers.

Implement IPI with ipi-mux to allow easy extension to number
of IPIs.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig              |   2 +
 arch/mips/kernel/smp-mt.c      |  70 +++++++++++++++++++++++
 drivers/irqchip/Kconfig        |   1 -
 drivers/irqchip/irq-mips-cpu.c | 124 +----------------------------------------
 4 files changed, 74 insertions(+), 123 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 43da6d596e2b..08ef79093916 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2189,6 +2189,8 @@ config MIPS_MT_SMP
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
index 763070be0088..786ed8a6b719 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -192,7 +192,6 @@ config MADERA_IRQ
 config IRQ_MIPS_CPU
 	bool
 	select GENERIC_IRQ_CHIP
-	select GENERIC_IRQ_IPI if SMP && SYS_SUPPORTS_MULTITHREADING
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index b2318e915d88..ec6999b5e73f 100644
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
 static const struct irq_chip mips_mt_cpu_sw_irq_controller = {
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
@@ -202,86 +169,6 @@ static const struct irq_domain_ops mips_cpu_intc_irq_domain_ops = {
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
@@ -304,13 +191,6 @@ static void __init __mips_cpu_irq_init(struct device_node *of_node)
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
2.46.0


