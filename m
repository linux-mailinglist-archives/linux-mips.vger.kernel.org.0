Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA3B4368A5
	for <lists+linux-mips@lfdr.de>; Thu, 21 Oct 2021 19:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbhJURGs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Oct 2021 13:06:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231281AbhJURGm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Oct 2021 13:06:42 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58613615A2;
        Thu, 21 Oct 2021 17:04:26 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mdbUO-000lAU-Gz; Thu, 21 Oct 2021 18:04:24 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, f.fainelli@gmail.com,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/3] irqchip/mips-gic: Get rid of the reliance on irq_cpu_online()
Date:   Thu, 21 Oct 2021 18:04:13 +0100
Message-Id: <20211021170414.3341522-3-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021170414.3341522-1-maz@kernel.org>
References: <20211021170414.3341522-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de, fancer.lancer@gmail.com, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, f.fainelli@gmail.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The MIPS GIC driver uses irq_cpu_online() to go and program the
per-CPU interrupts. However, this method iterates over all IRQs
in the system, despite only 3 per-CPU interrupts being of interest.

Let's be terribly bold and do the iteration ourselves. To ensure
mutual exclusion, hold the gic_lock spinlock that is otherwise
taken while dealing with these interrupts.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-mips-gic.c | 37 ++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 54c7092cc61d..45c83dd804a0 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -381,24 +381,35 @@ static void gic_unmask_local_irq_all_vpes(struct irq_data *d)
 	spin_unlock_irqrestore(&gic_lock, flags);
 }
 
-static void gic_all_vpes_irq_cpu_online(struct irq_data *d)
+static void gic_all_vpes_irq_cpu_online(void)
 {
-	struct gic_all_vpes_chip_data *cd;
-	unsigned int intr;
+	static unsigned int local_intrs[] = {
+		GIC_LOCAL_INT_TIMER,
+		GIC_LOCAL_INT_PERFCTR,
+		GIC_LOCAL_INT_FDC,
+	};
+	unsigned long flags;
+	int i;
 
-	intr = GIC_HWIRQ_TO_LOCAL(d->hwirq);
-	cd = irq_data_get_irq_chip_data(d);
+	spin_lock_irqsave(&gic_lock, flags);
 
-	write_gic_vl_map(mips_gic_vx_map_reg(intr), cd->map);
-	if (cd->mask)
-		write_gic_vl_smask(BIT(intr));
+	for (i = 0; i < ARRAY_SIZE(local_intrs); i++) {
+		unsigned int intr = local_intrs[i];
+		struct gic_all_vpes_chip_data *cd;
+
+		cd = &gic_all_vpes_chip_data[intr];
+		write_gic_vl_map(mips_gic_vx_map_reg(intr), cd->map);
+		if (cd->mask)
+			write_gic_vl_smask(BIT(intr));
+	}
+
+	spin_unlock_irqrestore(&gic_lock, flags);
 }
 
 static struct irq_chip gic_all_vpes_local_irq_controller = {
 	.name			= "MIPS GIC Local",
 	.irq_mask		= gic_mask_local_irq_all_vpes,
 	.irq_unmask		= gic_unmask_local_irq_all_vpes,
-	.irq_cpu_online		= gic_all_vpes_irq_cpu_online,
 };
 
 static void __gic_irq_dispatch(void)
@@ -477,6 +488,10 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	intr = GIC_HWIRQ_TO_LOCAL(hwirq);
 	map = GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin;
 
+	/*
+	 * If adding support for more per-cpu interrupts, keep the the
+	 * array in gic_all_vpes_irq_cpu_online() in sync.
+	 */
 	switch (intr) {
 	case GIC_LOCAL_INT_TIMER:
 		/* CONFIG_MIPS_CMP workaround (see __gic_init) */
@@ -663,8 +678,8 @@ static int gic_cpu_startup(unsigned int cpu)
 	/* Clear all local IRQ masks (ie. disable all local interrupts) */
 	write_gic_vl_rmask(~0);
 
-	/* Invoke irq_cpu_online callbacks to enable desired interrupts */
-	irq_cpu_online();
+	/* Enable desired interrupts */
+	gic_all_vpes_irq_cpu_online();
 
 	return 0;
 }
-- 
2.30.2

