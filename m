Return-Path: <linux-mips+bounces-4277-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 086D992E231
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 812721F23E1A
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A649D15885E;
	Thu, 11 Jul 2024 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6oXVR3w"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EF415820E;
	Thu, 11 Jul 2024 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686436; cv=none; b=Map42cVqAHdktd/42dmEqlVsAfLNw3wow4m/d9JIegFy9u+Rvk+Ck8Pajd1A6C9UIb0a5v84aIqhkNhO5s5VZo8133nmb1lD7n51Rjo9VKkhc529Vnu5PmRhgFBHYqjzg0VEGiv1rP2GyXYj96LU8jUejnF7DJBDXQFR5gFU8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686436; c=relaxed/simple;
	bh=Xl62SQuZCHKLnDpCY6udbIHzOsJgA7vUABFTaZ5gaaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cNuiEjw3khB6SxH5x/QAB2TbxX3cnkFIPPp53/vStg6Sms60megScnacVKEFwh6EoLy7SBwUyzCnGPEH5RjjUWSMMgn0e7w5r6A3Dj9tl2sB939UMEkSkrcmxGgEFb3KeF2FQ/nBcuX7Y8rY/eFoApj10TAE9ANzVteabt/a8ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6oXVR3w; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so706722e87.0;
        Thu, 11 Jul 2024 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686433; x=1721291233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLOwwdUhWzwcfHMczhONF97Y3kzxFyjEORxGYabTDDg=;
        b=L6oXVR3wHoB1vJfG2KHulBnEyAGjNKUD4RZKlodm2luSNK/7/JgZb1yB3zSpG5QOBT
         QpY5uo1VVNdElMFvBPxijJiJTrLpneK8W5h7YU4Pfvi2CaoKkLR4Ucos7Te6nUNqpkNz
         EuUI/5tI/s2hg/RePlOrMc/4pv58mO5FOn8WPlrUEhC9LTQm0a/gFwpy15ll+h6VeH6l
         sxGJbwzISA4xPOv2Mu63cxDDREDZRetX45vHFtEk3rRPE9mq7B5gROO+Lvda/t6t9kvA
         3edr/T1RvX/HagU7FDopcg/jZrw9byIX5LW07TSdVrPSvfoS1Hi7w2gRuwu7ufpuLUiJ
         wZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686433; x=1721291233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLOwwdUhWzwcfHMczhONF97Y3kzxFyjEORxGYabTDDg=;
        b=KtZuiKy4Jk9vSQngDGGzW15PvyKXTd+Rl53VJrKTjM2u4XLjQJdZlwG5iHovLc9jQW
         4Zh+OspG+i0Y3OQ7LINvpGjJhmaTCtYbqTnSPB1qxR1DkqwpBqS2WCDlYNdgpFNSDQXd
         yIkf3CUf449J176vqJ8pICLs104NO5xju7YIZaqOqbLvMKwH/S7QlG6KcgPTojWPZm08
         rAXpzFEa+E26hQfPc6oO6d1B/1zfBKsZTa+yrvT2FUOKVGku8uQbZs80zT4h4qBOSzWH
         iVG/XFyMmK3rS989pxK+JaQnYHSYFHJAWILfOIbUBJXRFAFVxLhuT7zoPg0Hmwn8lqJn
         O98g==
X-Forwarded-Encrypted: i=1; AJvYcCXFTnpowzsouEJy29g4uHaUoMOfNsAEEOXTvzIssVpDPzQ/JclVXmzQjhFJ0YqV0SFTm+3KGC6gnB/Ha8AS8ULTAIZZAa09yU0l3/+8U22yY3EdGcrQ2TMaBHl078Vro4W3Q5hsSN3i+w==
X-Gm-Message-State: AOJu0Yx7g6BXFGTdKLVyN6Mj+QPZF2NcjoLS4UYhepFZ5q9Zp0NPobRF
	Wi8rbRH+RMKCP9cCuILJrMpRNxcCqcQFYC8o6E7abwhOiBM1Ng/r
X-Google-Smtp-Source: AGHT+IFOxacAuDp8HNcvS4GCUXkV2BNTDfePTvxA0TaFCt38tY57Sheu03iBaIfumxpnWrzpinVJdA==
X-Received: by 2002:ac2:57ce:0:b0:52e:9694:3f98 with SMTP id 2adb3069b0e04-52eb9997b66mr3856395e87.27.1720686432122;
        Thu, 11 Jul 2024 01:27:12 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:27:11 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v5 06/11] irqchip/mips-gic: Multi-cluster support
Date: Thu, 11 Jul 2024 10:26:51 +0200
Message-Id: <20240711082656.1889440-7-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711082656.1889440-1-arikalo@gmail.com>
References: <20240711082656.1889440-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

The MIPS I6500 CPU & CM (Coherence Manager) 3.5 introduce the concept of
multiple clusters to the system. In these systems, each cluster contains
its own GIC, so the GIC isn't truly global any longer. Access to
registers in the GICs of remote clusters is possible using a redirect
register block much like the redirect register blocks provided by the
CM & CPC, and configured through the same GCR_REDIRECT register that
mips_cm_lock_other() abstraction builds upon.

It is expected that external interrupts are connected identically on all
clusters. That is, if there is a device providing an interrupt connected
to GIC interrupt pin 0 then it should be connected to pin 0 of every GIC
in the system. For the most part, the GIC can be treated as though it is
still truly global, so long as interrupts in the cluster are configured
properly.

This patch introduces support for such multi-cluster systems in the
MIPS GIC irqchip driver. A newly introduced gic_irq_lock_cluster()
function allows:

  1) Configure access to a GIC in a remote cluster via the redirect
     register block, using mips_cm_lock_other().

Or:

  2) Detect that the interrupt in question is affine to the local
     cluster and plain old GIC register access to the GIC in the
     local cluster should be used.

It is possible to access the local cluster's GIC registers via the
redirect block, but keeping the special case for them is both good for
performance (because we avoid the locking & indirection overhead of
using the redirect block) and necessary to maintain compatibility with
systems using CM revisions prior to 3.5 which don't support the redirect
block.

The gic_irq_lock_cluster() function relies upon an IRQs effective
affinity in order to discover which cluster the IRQ is affine to. In
order to track this & allow it to be updated at an appropriate point
during gic_set_affinity() we select the generic support for effective
affinity using CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK.

gic_set_affinity() is the one function which gains much complexity. It
now deconfigures routing to any VP(E), ie. CPU, on the old cluster when
moving affinity to a new cluster.

gic_shared_irq_domain_map() moves its update of the IRQs effective
affinity to before its use of gic_irq_lock_cluster(), to ensure that
operation is on the cluster the IRQ is affine to.

The remaining changes are straightforward use of the
gic_irq_lock_cluster() function to select between local cluster & remote
cluster code-paths when configuring interrupts.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/irqchip/Kconfig        |   1 +
 drivers/irqchip/irq-mips-gic.c | 161 +++++++++++++++++++++++++++++----
 2 files changed, 143 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 14464716bacb..fb124414c597 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -328,6 +328,7 @@ config KEYSTONE_IRQ
 
 config MIPS_GIC
 	bool
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
 	select GENERIC_IRQ_IPI if SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 4fd6e316616e..20fa6b12df49 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -111,6 +111,41 @@ static inline void gic_unlock_cluster(void)
 	     gic_unlock_cluster(),			\
 	     (cpu) = __gic_with_next_online_cpu(cpu))
 
+/**
+ * gic_irq_lock_cluster() - Lock redirect block access to IRQ's cluster
+ * @d: struct irq_data corresponding to the interrupt we're interested in
+ *
+ * Locks redirect register block access to the global register block of the GIC
+ * within the remote cluster that the IRQ corresponding to @d is affine to,
+ * returning true when this redirect block setup & locking has been performed.
+ *
+ * If @d is affine to the local cluster then no locking is performed and this
+ * function will return false, indicating to the caller that it should access
+ * the local clusters registers without the overhead of indirection through the
+ * redirect block.
+ *
+ * In summary, if this function returns true then the caller should access GIC
+ * registers using redirect register block accessors & then call
+ * mips_cm_unlock_other() when done. If this function returns false then the
+ * caller should trivially access GIC registers in the local cluster.
+ *
+ * Returns true if locking performed, else false.
+ */
+static bool gic_irq_lock_cluster(struct irq_data *d)
+{
+	unsigned int cpu, cl;
+
+	cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
+	BUG_ON(cpu >= NR_CPUS);
+
+	cl = cpu_cluster(&cpu_data[cpu]);
+	if (cl == cpu_cluster(&current_cpu_data))
+		return false;
+
+	mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+	return true;
+}
+
 static void gic_clear_pcpu_masks(unsigned int intr)
 {
 	unsigned int i;
@@ -157,7 +192,12 @@ static void gic_send_ipi(struct irq_data *d, unsigned int cpu)
 {
 	irq_hw_number_t hwirq = GIC_HWIRQ_TO_SHARED(irqd_to_hwirq(d));
 
-	write_gic_wedge(GIC_WEDGE_RW | hwirq);
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_wedge(GIC_WEDGE_RW | hwirq);
+		mips_cm_unlock_other();
+	} else {
+		write_gic_wedge(GIC_WEDGE_RW | hwirq);
+	}
 }
 
 int gic_get_c0_compare_int(void)
@@ -225,7 +265,13 @@ static void gic_mask_irq(struct irq_data *d)
 {
 	unsigned int intr = GIC_HWIRQ_TO_SHARED(d->hwirq);
 
-	write_gic_rmask(intr);
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_rmask(intr);
+		mips_cm_unlock_other();
+	} else {
+		write_gic_rmask(intr);
+	}
+
 	gic_clear_pcpu_masks(intr);
 }
 
@@ -234,7 +280,12 @@ static void gic_unmask_irq(struct irq_data *d)
 	unsigned int intr = GIC_HWIRQ_TO_SHARED(d->hwirq);
 	unsigned int cpu;
 
-	write_gic_smask(intr);
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_smask(intr);
+		mips_cm_unlock_other();
+	} else {
+		write_gic_smask(intr);
+	}
 
 	gic_clear_pcpu_masks(intr);
 	cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
@@ -245,7 +296,12 @@ static void gic_ack_irq(struct irq_data *d)
 {
 	unsigned int irq = GIC_HWIRQ_TO_SHARED(d->hwirq);
 
-	write_gic_wedge(irq);
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_wedge(irq);
+		mips_cm_unlock_other();
+	} else {
+		write_gic_wedge(irq);
+	}
 }
 
 static int gic_set_type(struct irq_data *d, unsigned int type)
@@ -285,9 +341,16 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
 		break;
 	}
 
-	change_gic_pol(irq, pol);
-	change_gic_trig(irq, trig);
-	change_gic_dual(irq, dual);
+	if (gic_irq_lock_cluster(d)) {
+		change_gic_redir_pol(irq, pol);
+		change_gic_redir_trig(irq, trig);
+		change_gic_redir_dual(irq, dual);
+		mips_cm_unlock_other();
+	} else {
+		change_gic_pol(irq, pol);
+		change_gic_trig(irq, trig);
+		change_gic_dual(irq, dual);
+	}
 
 	if (trig == GIC_TRIG_EDGE)
 		irq_set_chip_handler_name_locked(d, &gic_edge_irq_controller,
@@ -305,25 +368,72 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 			    bool force)
 {
 	unsigned int irq = GIC_HWIRQ_TO_SHARED(d->hwirq);
+	unsigned int cpu, cl, old_cpu, old_cl;
 	unsigned long flags;
-	unsigned int cpu;
 
+	/*
+	 * The GIC specifies that we can only route an interrupt to one VP(E),
+	 * ie. CPU in Linux parlance, at a time. Therefore we always route to
+	 * the first online CPU in the mask.
+	 */
 	cpu = cpumask_first_and(cpumask, cpu_online_mask);
 	if (cpu >= NR_CPUS)
 		return -EINVAL;
 
-	/* Assumption : cpumask refers to a single CPU */
-	raw_spin_lock_irqsave(&gic_lock, flags);
+	old_cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
+	old_cl = cpu_cluster(&cpu_data[old_cpu]);
+	cl = cpu_cluster(&cpu_data[cpu]);
 
-	/* Re-route this IRQ */
-	write_gic_map_vp(irq, BIT(mips_cm_vp_id(cpu)));
+	raw_spin_lock_irqsave(&gic_lock, flags);
 
-	/* Update the pcpu_masks */
-	gic_clear_pcpu_masks(irq);
-	if (read_gic_mask(irq))
-		set_bit(irq, per_cpu_ptr(pcpu_masks, cpu));
+	/*
+	 * If we're moving affinity between clusters, stop routing the
+	 * interrupt to any VP(E) in the old cluster.
+	 */
+	if (cl != old_cl) {
+		if (gic_irq_lock_cluster(d)) {
+			write_gic_redir_map_vp(irq, 0);
+			mips_cm_unlock_other();
+		} else {
+			write_gic_map_vp(irq, 0);
+		}
+	}
 
+	/*
+	 * Update effective affinity - after this gic_irq_lock_cluster() will
+	 * begin operating on the new cluster.
+	 */
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
+
+	/*
+	 * If we're moving affinity between clusters, configure the interrupt
+	 * trigger type in the new cluster.
+	 */
+	if (cl != old_cl)
+		gic_set_type(d, irqd_get_trigger_type(d));
+
+	/* Route the interrupt to its new VP(E) */
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_map_pin(irq,
+					GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
+		write_gic_redir_map_vp(irq, BIT(mips_cm_vp_id(cpu)));
+
+		/* Update the pcpu_masks */
+		gic_clear_pcpu_masks(irq);
+		if (read_gic_redir_mask(irq))
+			set_bit(irq, per_cpu_ptr(pcpu_masks, cpu));
+
+		mips_cm_unlock_other();
+	} else {
+		write_gic_map_pin(irq, GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
+		write_gic_map_vp(irq, BIT(mips_cm_vp_id(cpu)));
+
+		/* Update the pcpu_masks */
+		gic_clear_pcpu_masks(irq);
+		if (read_gic_mask(irq))
+			set_bit(irq, per_cpu_ptr(pcpu_masks, cpu));
+	}
+
 	raw_spin_unlock_irqrestore(&gic_lock, flags);
 
 	return IRQ_SET_MASK_OK;
@@ -471,11 +581,21 @@ static int gic_shared_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	unsigned long flags;
 
 	data = irq_get_irq_data(virq);
+	irq_data_update_effective_affinity(data, cpumask_of(cpu));
 
 	raw_spin_lock_irqsave(&gic_lock, flags);
-	write_gic_map_pin(intr, GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
-	write_gic_map_vp(intr, BIT(mips_cm_vp_id(cpu)));
-	irq_data_update_effective_affinity(data, cpumask_of(cpu));
+
+	/* Route the interrupt to its VP(E) */
+	if (gic_irq_lock_cluster(data)) {
+		write_gic_redir_map_pin(intr,
+					GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
+		write_gic_redir_map_vp(intr, BIT(mips_cm_vp_id(cpu)));
+		mips_cm_unlock_other();
+	} else {
+		write_gic_map_pin(intr, GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
+		write_gic_map_vp(intr, BIT(mips_cm_vp_id(cpu)));
+	}
+
 	raw_spin_unlock_irqrestore(&gic_lock, flags);
 
 	return 0;
@@ -651,6 +771,9 @@ static int gic_ipi_domain_alloc(struct irq_domain *d, unsigned int virq,
 		if (ret)
 			goto error;
 
+		/* Set affinity to cpu.  */
+		irq_data_update_effective_affinity(irq_get_irq_data(virq + i),
+						   cpumask_of(cpu));
 		ret = irq_set_irq_type(virq + i, IRQ_TYPE_EDGE_RISING);
 		if (ret)
 			goto error;
-- 
2.25.1


