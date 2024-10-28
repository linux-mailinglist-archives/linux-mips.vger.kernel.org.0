Return-Path: <linux-mips+bounces-6515-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA369B3886
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FDE41C22559
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AB21DFE3E;
	Mon, 28 Oct 2024 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOCo8q29"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7880B1DFE1C;
	Mon, 28 Oct 2024 17:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138392; cv=none; b=pziRSaTjnEwe/hhyUnEj3rPDyEm+0dKNIJ7p0MEACmEuEdHTwgN05CjYHHEY9sXtvKaL38FBIk/QydAUdrsDpugbe1J7CQx9+hRpXP7uyLphfCV1d00BdYt9nYkajmiVJPNWv+4ZYFCLSD6F0KvfGQZBqrNbOiigP98peNRwh88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138392; c=relaxed/simple;
	bh=xbT/mgkvA1/pzY6aN9D52QMznUnwyQC4d1EnOUIm7yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tOvFBkiXBfc2o9Ruhw48/6kOTj3rTX9YaMYZPMYmmjkEhoE2IdEcctyx4P2Gt1WVz75hCzJKDVQGI3Mdx6Y0soE+ja/f7D4dX3ELVuKyA6zemd9skgkX+5lRqNqox7Tfw5WzVK6soR/rfCQdbOLswlMEL0LDQ+Un3CZEjVmaFvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOCo8q29; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso68640561fa.3;
        Mon, 28 Oct 2024 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138388; x=1730743188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLJuGQqhe3edbNXfQYPGMoDXheUeKQlWXtJxjbW/mxo=;
        b=UOCo8q296aH1I56c1ksg3Bz/gUuUgoNetN/dg6mcuOh41CNbgaUWfU/Jbp+14xZ3WY
         x0vWreCVvpDL5DaA7/jKB9cdcg3U2Ve5fMRWC3Y/odIhQvAmI4hAPz6oaMuUwyp+nwDh
         H9mrCQ5Ju7EWsn/NMJSBElxjPybk+GIEn2Hzra9j2EKmYSyy0fJKRS9uw5xPfZtS/krq
         0UxQMS168zl8eu4FRAP4qtx9jt6rgd4OYBTcQmqkD5ePLJIz47HdsjLPRwbONeYBaxoI
         4LRvp6ZJj8/JA9VlxE602EL3hWvZX6Pxwgfb5qKEbYC51mG8nVVLBqnH4PqxFE46qa+Q
         U9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138388; x=1730743188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLJuGQqhe3edbNXfQYPGMoDXheUeKQlWXtJxjbW/mxo=;
        b=psnOiuUROlqmHdSRQ53I6yVOkGx9KkOfAQjQwX7XHdaClYteiXkZfXxMsMziyC0PIJ
         VNqZW5X0x73Jukk8KsYNTXT7mL/vGB6R+DE8z7PnSP3vLbgDGhyEat1njuhbAIpPzBVS
         zh6D6BC4mGSU3a9Xhf2Jl6vOnVg4Mv+FFMGiH8oTqqnHKaT9+SjGWiGhJIJAaDXNlVqj
         48OCNhovVwfXTr5/1m2vpu/P9DFwIuvYcxBo0kcAIBH2hB2lllNh2RmZXx6L6UXW0+Rm
         ju76MxsrXdJJPrkGyTfLCbfuk0BLtVV+kuLeM7H3uYZQ5FH6knlvG6C2DZVVOMtfPnxr
         /gZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4tj9pBGylfKN6yiqNFuF7Pgui4/55aQUQbD+tkCzyR7ZdLc5Arymd2pBF2V1/C3EWiTlKE1vbOXaT9a9H@vger.kernel.org, AJvYcCWjXavqVcLvTGL93z44Hhn4ILc3IA8DPmRpnahLhvV3eTms+n6P+c9WYzzhJVtThGoa+iJ8dfGZhY3/xA==@vger.kernel.org, AJvYcCX6zOSbHot6/fDZcDlNL6rStSrVcjcQQACfXOpSPSoQQFqhc8g25+H0yfZrOXKRi7Mhpu9fWsWr5vbQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtP5ohnALwvaf8y+1qanWP9InRoA9Au2Ufn9nijzd7x87hk/E
	L78PX+OY35KO63s3SPONcCXxOqQkyrRmDO1aAEY0dxMp5WH7v6gP
X-Google-Smtp-Source: AGHT+IEd1Bbr0aAc2gXCZPoGTLfySGtBI8xCPYEnrLomKp1K/eJSAoA/SW8ocEHaObPgCMatuDbY5A==
X-Received: by 2002:a05:6512:32c9:b0:53b:1e70:6ab4 with SMTP id 2adb3069b0e04-53b348cbac4mr6983522e87.14.1730138387150;
        Mon, 28 Oct 2024 10:59:47 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:46 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v8 04/13] irqchip/mips-gic: Multi-cluster support
Date: Mon, 28 Oct 2024 18:59:26 +0100
Message-Id: <20241028175935.51250-5-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028175935.51250-1-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
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
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/irqchip/Kconfig        |   1 +
 drivers/irqchip/irq-mips-gic.c | 161 +++++++++++++++++++++++++++++----
 2 files changed, 143 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index d82bcab233a1..deaafbfea169 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -338,6 +338,7 @@ config KEYSTONE_IRQ
 
 config MIPS_GIC
 	bool
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
 	select GENERIC_IRQ_IPI if SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index d93a076620c7..f42f69bbd6fb 100644
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


