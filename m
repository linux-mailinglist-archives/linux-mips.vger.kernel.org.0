Return-Path: <linux-mips+bounces-5405-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A9D970206
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 13:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2D6B1C2198C
	for <lists+linux-mips@lfdr.de>; Sat,  7 Sep 2024 11:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C547515DBC1;
	Sat,  7 Sep 2024 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="V/g+N4IY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OW5/xs4o"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B288615C14E;
	Sat,  7 Sep 2024 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725709710; cv=none; b=n40XB4okEMxEXU6MRPTzcDVs22r9asUZOoEW/02BFCTPmNz9BiB5u1o0r+jE1hSGIrJKjZVrVeBSrup6BzW0zmoTLStwC83leKOHhchxpUf0em21GkVkza8yPmTKU84qw9x6+Mqa1jefr2jo24i8Uws23Srv2cvDU1qwp4fiLKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725709710; c=relaxed/simple;
	bh=gg8Z/h1yFMcmiyi9C/7fVV2i0PFBzrHovJhFNEKtjaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9uOZefC0SkCg7hXRrCxcYlDOGSDyPJQXtjDijv4GymKeT3WUj5wC86C5yAvgVXIbAbzeyw53PhMsPO6kiepJDJAYozq0cAZdtSVTxwkKa7LxakWFMjEf344bkGx2vwXL1beXe8JnTFLJddsyloLpIYCSR5nQCiAaWTjCdOTTJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=V/g+N4IY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OW5/xs4o; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CA8CE11403AA;
	Sat,  7 Sep 2024 07:48:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sat, 07 Sep 2024 07:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725709707;
	 x=1725796107; bh=ljCeGEwB3yu6opLY+A856DZwYFxls7FWp+Jflg4ET6k=; b=
	V/g+N4IYI/hXOp5Mdu71TzXWL2rk0fm9nvSK+mJ12gzEkBNFbRwFf4vHvuQzlWTK
	++MVwJZW8dNJX9dU8U+a6CAz1fab9Xf2miq8TOFGt8iMGYn+sPdGrP1VFgDw2X2s
	hKf+FOXtAVl8vnE05e/B6d9fOYvhgHPu+UjR+6IqaZhreUZnhGyoNW+r+l0xoIHT
	CLyCwjsbQZNuRtBUsHVMJkw5uB6qKQhsell6VQ96VAUAmXsRTBKXYIZHQc00adXr
	s1UQrOH7/Pw3mXTZffnZJdMjwIo/bUFZa1hh+KU0085SqtFmIedklJdky+s/5ojl
	1YKLBmX4ErrH03bQsQZEgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725709707; x=
	1725796107; bh=ljCeGEwB3yu6opLY+A856DZwYFxls7FWp+Jflg4ET6k=; b=O
	W5/xs4ohzHVjWGSrHKvesxxzjsfuX+2z7g9rFhoeAGvlra4kMtPlvYtVJBPFWM/u
	Mh7M0sx5Z56GEjjUnHcfjENu0iT+7fpaBJCskXwLhk2PBY3tfatf7SIO4SkXD3dd
	48L0l9LZmw4sGJoMD01fuFxfKYAjn0O0dEB7jFHZAQkzXnzzezj9lF6LO9NhiXTa
	YlYBWYHn+/Wve5A2oMahJkYDMNkYCIKzMQqKoogK6lLVCHlG/f7K7/OqygNBz3dG
	jx86CGjJpOCrgyb+2afO7pHAGol3bMVXhWL/jqMIXgL8kFtMH2n4JXdbAexrDxws
	VQWtya2cMTnczPrbNgLyA==
X-ME-Sender: <xms:iz3cZl5Voy60VShJqJddi1gsEE_jbnwg6iLxxMsAyxR0XmLJEWrmfg>
    <xme:iz3cZi7p2xjD4JuY970t2xCYhwwdRWO-lGH0FTeAurEmJpFTi4wtMI7-iaVeQE-xD
    urlji_FQr4akrAiEx4>
X-ME-Received: <xmr:iz3cZsf06fqoDdReJrHyUYxJePnIaTcyRidMsqBnqB_ro4TXVApUJ3lHRiP7wPfa3Pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeifedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhm
    rdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegt
    hhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmh
    hiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlsghurhht
    ohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlh
    hlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhgrnhgtvghrrdhlrghntg
    gvrhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:iz3cZuJu34WrmXb4hlfrVCpp4R-zJrFED8nD5hefEHcoQcKgTlSlLQ>
    <xmx:iz3cZpIGXS7ZagptzFBPgyLKd5OFYLW1q7rrspMiv2znkirpS_Fw5Q>
    <xmx:iz3cZnyUAX3tsHU-4xH8yC6oknwAOXQQx9AHZqBtzPbynvhrb6Tswg>
    <xmx:iz3cZlIyAYKVXbmNc1d80fjerH7FsL8Gb-vwctgxcIkUqH3qdB_5Lw>
    <xmx:iz3cZmBhOsp4c9qHYiFVKcznuU3Ta0oY3yYZExhn1ezK7iJxUrYPm54R>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Sep 2024 07:48:26 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Sep 2024 12:48:12 +0100
Subject: [PATCH v4 06/10] irqchip/irq-mips-gic: Switch to ipi_mux
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-b4-mips-ipi-improvements-v4-6-ac288f9aff0b@flygoat.com>
References: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
In-Reply-To: <20240907-b4-mips-ipi-improvements-v4-0-ac288f9aff0b@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10449;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=gg8Z/h1yFMcmiyi9C/7fVV2i0PFBzrHovJhFNEKtjaY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrQ7tnVlwWsZPrXVP3QMyj4SPKW7sopnceP/WuYlUwynL
 zyc9npNRykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAExENp/hf76sao3z92CJ5495
 Z3JIlfJO7VmltWjVuSUZFTlhLYf82Rn+JyVWXnB9xM3KbsDwWK1Jf2rqlD/92/qTT90782Qn77f
 NvAA=
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
index 76253e864f23..53c585d598b9 100644
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
 
+	if (gic_is_reserved(intr))
+		return;
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


