Return-Path: <linux-mips+bounces-5422-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AED0A970676
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 12:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD7E31C2183B
	for <lists+linux-mips@lfdr.de>; Sun,  8 Sep 2024 10:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872DA1534E6;
	Sun,  8 Sep 2024 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="0KmofvMB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nuO+3fcz"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834661531CA;
	Sun,  8 Sep 2024 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790829; cv=none; b=oQdhbFbmk07IRHmpKaX3AKjopj+aSyUug16VhE9+hZcFbtIp7pLysWwBvYV2199AYQmMpnEcnxsxCWxJqHcECTJZjBnpKDSpVBT9NhVMsb6diMcMZuV7tOSpVnygh1MdQOczQslaPUQsYflv7M5kBHMmNQCbtT8d7t5W5VT8mqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790829; c=relaxed/simple;
	bh=6JAZ/JRNFgf1TNFBirixO1uen08Cd/k5BcIfog+m30M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRgR+LkIgykC0r/u4nDNpjWiA9PpoyVwifzSv2l16kJ01TcLuMmjH8/npb4CHnLCj+TTxANDrGgkc62s4+FvzD375LJXzpZDPL1gYiUVJevichFVL6SlTtdtmD824TMkYIOLXXmZK6YKCHXBpfOe+ch924fEx1nzABmnQiwbt8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=0KmofvMB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nuO+3fcz; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 8AC8F13802F6;
	Sun,  8 Sep 2024 06:20:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 08 Sep 2024 06:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725790826;
	 x=1725877226; bh=lcPMsz3D8akIKgEPlmSPin7kkOjF69auUt2+iIssMiQ=; b=
	0KmofvMB4WD+o/6ckPGU45fRFaTLu+T5KSXiVDC2fRRfPB9hqTR0UEqXcx/50QgD
	xxiACugDYZmnFS5mWvlzPMCoUUHlpiRX1iknXs2vmQgh9uQMMc6g/n/9iw3/t4n7
	hqS7t2lMh+qbacgHiXH1yCCp82O7tiL5VJum53xsFMEVSiXtx2vj5+Rb7Xg0v7EG
	Kt5+96ALFhd4n+/X5fgJKQYZtedffPMdeVumdkpWRB4bDB3z0CGz7EzkSDdc3BbH
	Uj7a1B7ihQWRFbFCxe9nd77VIleNxeWin8tJg+1u0R8IJ0j2qqRhPpz2Grc4p0rT
	kfXL6px8mH3mtIw2Lu5j0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725790826; x=
	1725877226; bh=lcPMsz3D8akIKgEPlmSPin7kkOjF69auUt2+iIssMiQ=; b=n
	uO+3fcz5yTmR77uIOEXP7MGzf6plPQgw6LyaZErsE2kcZEUpe7a8I3Aukmzm4yC3
	H2mYP6DPUg+gysDPYBpwebbfLxiXJZF42fRIs1WLr5MPD3JDrnfNjS0+TDIHt4ds
	4gkNWswwnEFl5/Wn0aV8ebRV1IO0V41vdkbcbnmRZv7wE6MNuppWl+NITPxwzXF6
	B3vC5IDAAcJZ5nhG8dtjZWbl5osGZv1nnNLAJc464rFNYJ/CV3N2+OmmyJ4frrQM
	SGKCqorHyXg/aoTb7ZL8WFahH8zY7110oafxgj9I4uHpAA11FLNbYi6WoAyHhzNc
	F8rUc03tNvsziEYYVAQSg==
X-ME-Sender: <xms:anrdZnfQJoyplH44XQp-ZeIcNNp-TOdF1zKXR55cwURvNP7CoQ2wqg>
    <xme:anrdZtPIezMqylZX9-1bz6Wf60ncJz8DeO761iEnTDDbZ6lz02OlQGrmBESJ8BKgp
    MVa-w41igOJvzwUMdA>
X-ME-Received: <xmr:anrdZghsBjbzgn62TE9r-7cRAaLucNrR3cJBFFqJEYvyOLBLElYqGhnu9pfNJDhtpe8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
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
X-ME-Proxy: <xmx:anrdZo-bDpJ-aOVPSCx1ettZjVnjZxFUBtwtdg3Sj4qBiifQ8J-3xQ>
    <xmx:anrdZjt6Eva0gzb0bUbzTUaLazvvoQLS26zXQb8FtfW03U1zcrhQ9Q>
    <xmx:anrdZnGp-bgs8kfTGQfoMiFaC7Qs51Ih39WiJ9XRl3vunkGhTiRsdA>
    <xmx:anrdZqM8UrUSERyTUeT-UUZRcpdiGVWAUfZhf0Dn5bupIGaj-8aWQg>
    <xmx:anrdZkkRyLLGSuJm8xdE2HqkOleBgG_VuW8RONaFAQdqwTUpWHl5wo1K>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Sep 2024 06:20:25 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 08 Sep 2024 11:20:17 +0100
Subject: [PATCH v5 06/10] irqchip/irq-mips-gic: Switch to ipi_mux
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-b4-mips-ipi-improvements-v5-6-be8617dd2e53@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10456;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=6JAZ/JRNFgf1TNFBirixO1uen08Cd/k5BcIfog+m30M=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrS7VQlWSRYvl0e61v4/l7TMiMdqzvXjn1/836jr57JuR
 cMLrh+tHaUsDGJcDLJiiiwhAkp9GxovLrj+IOsPzBxWJpAhDFycAjCRK/IM/8ueiKt1Fsx7tEXp
 2IRfU+LXVG6KCfrv+OBZZ/r1ORnaNsWMDCfmTtD6eG79Ra5v/5aHeFqKJgkn6Zy98/WcwYNnDsx
 1ClwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Use ipi_mux to implement IPI interrupts instead of
allocating separate vectors for each individual IPI messages.

This reduces number of reserved GIC shared vectors
from 3 per core to 1 per core, which relieves the scarcity
of GIC shared vectors on MSI enabled systems.

It also allows us to easily expand number of IPIs.

Tested-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v4:
	- Improve commit message
	- Wrap up gic_is_reserved
	- Style fixes
---
 drivers/irqchip/Kconfig        |   1 +
 drivers/irqchip/irq-mips-gic.c | 202 ++++++++++++++---------------------------
 2 files changed, 69 insertions(+), 134 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index d078bdc48c38..763070be0088 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -346,6 +346,7 @@ config KEYSTONE_IRQ
 config MIPS_GIC
 	bool
 	select GENERIC_IRQ_IPI if SMP
+	select GENERIC_IRQ_IPI_MUX if SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM
 
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 76253e864f23..4c36e10ee2d3 100644
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
@@ -66,6 +68,15 @@ static struct gic_all_vpes_chip_data {
 	bool	mask;
 } gic_all_vpes_chip_data[GIC_NUM_LOCAL_INTRS];
 
+#ifdef CONFIG_GENERIC_IRQ_IPI
+static inline bool gic_is_reserved(unsigned int intr)
+{
+	return test_bit(intr, ipi_resrv);
+}
+#else
+static inline bool gic_is_reserved(unsigned int intr) { return false; }
+#endif
+
 static void gic_clear_pcpu_masks(unsigned int intr)
 {
 	unsigned int i;
@@ -108,13 +119,6 @@ static void gic_bind_eic_interrupt(int irq, int set)
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
@@ -181,6 +185,10 @@ static void gic_mask_irq(struct irq_data *d)
 	unsigned int intr = GIC_HWIRQ_TO_SHARED(d->hwirq);
 
 	write_gic_rmask(intr);
+
+	if (gic_is_reserved(intr))
+		return;
+
 	gic_clear_pcpu_masks(intr);
 }
 
@@ -191,6 +199,9 @@ static void gic_unmask_irq(struct irq_data *d)
 
 	write_gic_smask(intr);
 
+	if (gic_is_reserved(intr))
+		return;
+
 	gic_clear_pcpu_masks(intr);
 	cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
 	set_bit(intr, per_cpu_ptr(pcpu_masks, cpu));
@@ -263,6 +274,9 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 	unsigned long flags;
 	unsigned int cpu;
 
+	if (gic_is_reserved(irq))
+		return -EINVAL;
+
 	cpu = cpumask_first_and(cpumask, cpu_online_mask);
 	if (cpu >= NR_CPUS)
 		return -EINVAL;
@@ -304,7 +318,6 @@ static struct irq_chip gic_edge_irq_controller = {
 #ifdef CONFIG_SMP
 	.irq_set_affinity	=	gic_set_affinity,
 #endif
-	.ipi_send_single	=	gic_send_ipi,
 };
 
 static void gic_handle_local_int(bool chained)
@@ -475,12 +488,6 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
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
@@ -570,146 +577,73 @@ static const struct irq_domain_ops gic_irq_domain_ops = {
 };
 
 #ifdef CONFIG_GENERIC_IRQ_IPI
-
-static int gic_ipi_domain_xlate(struct irq_domain *d, struct device_node *ctrlr,
-				const u32 *intspec, unsigned int intsize,
-				irq_hw_number_t *out_hwirq,
-				unsigned int *out_type)
+static void gic_handle_ipi_irq(struct irq_desc *desc)
 {
-	/*
-	 * There's nothing to translate here. hwirq is dynamically allocated and
-	 * the irq type is always edge triggered.
-	 * */
-	*out_hwirq = 0;
-	*out_type = IRQ_TYPE_EDGE_RISING;
+	struct irq_chip *chip = irq_desc_get_chip(desc);
 
-	return 0;
+	chained_irq_enter(chip, desc);
+	ipi_mux_process();
+	chained_irq_exit(chip, desc);
 }
 
-static int gic_ipi_domain_alloc(struct irq_domain *d, unsigned int virq,
-				unsigned int nr_irqs, void *arg)
+static void gic_ipi_send(unsigned int cpu)
 {
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
+	write_gic_wedge(GIC_WEDGE_RW | cpu_ipi_intr[cpu]);
 }
 
-static void gic_ipi_domain_free(struct irq_domain *d, unsigned int virq,
-				unsigned int nr_irqs)
+static int gic_ipi_mux_init(struct device_node *node, struct irq_domain *d)
 {
-	irq_hw_number_t base_hwirq;
-	struct irq_data *data;
+	unsigned int i, v[2], num_ipis;
+	int ipi_virq, cpu = 0;
 
-	data = irq_get_irq_data(virq);
-	if (!data)
-		return;
+	if (node && !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", v, 2)) {
+		bitmap_set(ipi_resrv, v[0], v[1]);
+	} else {
+		/*
+		 * Reserve 1 interrupts per possible CPU/VP for use as IPIs
+		 */
+		num_ipis = num_possible_cpus();
+		bitmap_set(ipi_resrv, gic_shared_intrs - num_ipis, num_ipis);
+	}
 
-	base_hwirq = GIC_HWIRQ_TO_SHARED(irqd_to_hwirq(data));
-	bitmap_set(ipi_available, base_hwirq, nr_irqs);
-}
+	ipi_virq = ipi_mux_create(IPI_MAX, gic_ipi_send);
 
-static int gic_ipi_domain_match(struct irq_domain *d, struct device_node *node,
-				enum irq_domain_bus_token bus_token)
-{
-	bool is_ipi;
+	WARN_ON(bitmap_weight(ipi_resrv, GIC_MAX_INTRS) < num_possible_cpus());
 
-	switch (bus_token) {
-	case DOMAIN_BUS_IPI:
-		is_ipi = d->bus_token == bus_token;
-		return (!node || to_of_node(d->fwnode) == node) && is_ipi;
-		break;
-	default:
-		return 0;
-	}
-}
+	for_each_set_bit(i, ipi_resrv, GIC_MAX_INTRS) {
+		struct irq_fwspec fwspec;
+		int virq;
 
-static const struct irq_domain_ops gic_ipi_domain_ops = {
-	.xlate = gic_ipi_domain_xlate,
-	.alloc = gic_ipi_domain_alloc,
-	.free = gic_ipi_domain_free,
-	.match = gic_ipi_domain_match,
-};
+		fwspec.fwnode = of_node_to_fwnode(node);
+		fwspec.param_count = 3;
+		fwspec.param[0] = GIC_SHARED;
+		fwspec.param[1] = i;
+		fwspec.param[2] = IRQ_TYPE_EDGE_RISING;
 
-static int gic_register_ipi_domain(struct device_node *node)
-{
-	struct irq_domain *gic_ipi_domain;
-	unsigned int v[2], num_ipis;
+		virq = irq_create_fwspec_mapping(&fwspec);
+		if (!virq)
+			return -EINVAL;
 
-	gic_ipi_domain = irq_domain_add_hierarchy(gic_irq_domain,
-						  IRQ_DOMAIN_FLAG_IPI_PER_CPU,
-						  GIC_NUM_LOCAL_INTRS + gic_shared_intrs,
-						  node, &gic_ipi_domain_ops, NULL);
-	if (!gic_ipi_domain) {
-		pr_err("Failed to add IPI domain");
-		return -ENXIO;
-	}
+		gic_shared_irq_domain_map(d, virq, GIC_SHARED_TO_HWIRQ(i), cpu);
+		irq_set_chained_handler(virq, gic_handle_ipi_irq);
+		gic_clear_pcpu_masks(i);
+		set_bit(i, per_cpu_ptr(pcpu_masks, cpu));
 
-	irq_domain_update_bus_token(gic_ipi_domain, DOMAIN_BUS_IPI);
+		cpu_ipi_intr[cpu] = i;
 
-	if (node &&
-	    !of_property_read_u32_array(node, "mti,reserved-ipi-vectors", v, 2)) {
-		bitmap_set(ipi_resrv, v[0], v[1]);
-	} else {
-		/*
-		 * Reserve 2 interrupts per possible CPU/VP for use as IPIs,
-		 * meeting the requirements of arch/mips SMP.
-		 */
-		num_ipis = 2 * num_possible_cpus();
-		bitmap_set(ipi_resrv, gic_shared_intrs - num_ipis, num_ipis);
+		cpu++;
+		if (cpu >= num_possible_cpus())
+			break;
 	}
 
-	bitmap_copy(ipi_available, ipi_resrv, GIC_MAX_INTRS);
+	mips_smp_ipi_set_virq_range(ipi_virq, IPI_MAX);
 
 	return 0;
 }
 
 #else /* !CONFIG_GENERIC_IRQ_IPI */
 
-static inline int gic_register_ipi_domain(struct device_node *node)
+static inline int gic_ipi_mux_init(struct device_node *node, struct irq_domain *d)
 {
 	return 0;
 }
@@ -809,10 +743,6 @@ static int __init gic_of_init(struct device_node *node,
 		return -ENXIO;
 	}
 
-	ret = gic_register_ipi_domain(node);
-	if (ret)
-		return ret;
-
 	board_bind_eic_interrupt = &gic_bind_eic_interrupt;
 
 	/* Setup defaults */
@@ -822,6 +752,10 @@ static int __init gic_of_init(struct device_node *node,
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
2.46.0


