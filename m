Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23ADD3BCB61
	for <lists+linux-mips@lfdr.de>; Tue,  6 Jul 2021 13:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhGFLJf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 07:09:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231216AbhGFLJe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Jul 2021 07:09:34 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FEFA61A33;
        Tue,  6 Jul 2021 11:06:56 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1m0iuk-00Bf9z-EM; Tue, 06 Jul 2021 12:06:54 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>, kernel-team@android.com,
        Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH] irqchip/mips: Fix RCU violation when using irqdomain lookup on interrupt entry
Date:   Tue,  6 Jul 2021 12:06:47 +0100
Message-Id: <20210706110647.3979002-1-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, kernel-team@android.com, linux@roeck-us.net, tsbogend@alpha.franken.de, fancer.lancer@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since d4a45c68dc81 ("irqdomain: Protect the linear revmap with RCU"),
any irqdomain lookup requires the RCU read lock to be held.

This assumes that the architecture code will be structured such as
irq_enter() will be called *before* the interrupt is looked up
in the irq domain. However, this isn't the case for MIPS, and a number
of drivers are structured to do it the other way around when handling
an interrupt in their root irqchip (secondary irqchips are OK by
construction).

This results in a RCU splat on a lockdep-enabled kernel when the kernel
takes an interrupt from idle, as reported by Guenter Roeck.

Note that this could have fired previously if any driver had used
tree-based irqdomain, which always had the RCU requirement.

To solve this, provide a MIPS-specific helper (do_domain_IRQ())
as the pendent of do_IRQ() that will do thing in the right order
(and maybe save some cycles in the process).

Ideally, MIPS would be moved over to using handle_domain_irq(),
but that's much more ambitious.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/r/20210705172352.GA56304@roeck-us.net
---
 arch/mips/include/asm/irq.h      |  3 +++
 arch/mips/kernel/irq.c           | 14 ++++++++++++++
 drivers/irqchip/irq-mips-cpu.c   | 10 ++++++----
 drivers/irqchip/irq-mips-gic.c   |  8 ++++----
 drivers/irqchip/irq-pic32-evic.c |  5 ++---
 5 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/irq.h b/arch/mips/include/asm/irq.h
index d1477ecb1af9..57561e0e6e8d 100644
--- a/arch/mips/include/asm/irq.h
+++ b/arch/mips/include/asm/irq.h
@@ -57,6 +57,9 @@ asmlinkage void plat_irq_dispatch(void);
 
 extern void do_IRQ(unsigned int irq);
 
+struct irq_domain;
+extern void do_domain_IRQ(struct irq_domain *domain, unsigned int irq);
+
 extern void arch_init_irq(void);
 extern void spurious_interrupt(void);
 
diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 85b6c60f285d..c76005cd3b79 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -21,6 +21,7 @@
 #include <linux/kallsyms.h>
 #include <linux/kgdb.h>
 #include <linux/ftrace.h>
+#include <linux/irqdomain.h>
 
 #include <linux/atomic.h>
 #include <linux/uaccess.h>
@@ -107,3 +108,16 @@ void __irq_entry do_IRQ(unsigned int irq)
 	irq_exit();
 }
 
+void __irq_entry do_domain_IRQ(struct irq_domain *domain, unsigned int hwirq)
+{
+	struct irq_desc *desc;
+
+	irq_enter();
+	check_stack_overflow();
+
+	desc = irq_resolve_mapping(domain, hwirq);
+	if (likely(desc))
+		handle_irq_desc(desc);
+
+	irq_exit();
+}
diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 0bbb0b2d0dd5..0c7ae71a0af0 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -127,7 +127,6 @@ static struct irq_chip mips_mt_cpu_irq_controller = {
 asmlinkage void __weak plat_irq_dispatch(void)
 {
 	unsigned long pending = read_c0_cause() & read_c0_status() & ST0_IM;
-	unsigned int virq;
 	int irq;
 
 	if (!pending) {
@@ -137,12 +136,15 @@ asmlinkage void __weak plat_irq_dispatch(void)
 
 	pending >>= CAUSEB_IP;
 	while (pending) {
+		struct irq_domain *d;
+
 		irq = fls(pending) - 1;
 		if (IS_ENABLED(CONFIG_GENERIC_IRQ_IPI) && irq < 2)
-			virq = irq_linear_revmap(ipi_domain, irq);
+			d = ipi_domain;
 		else
-			virq = irq_linear_revmap(irq_domain, irq);
-		do_IRQ(virq);
+			d = irq_domain;
+
+		do_domain_IRQ(d, irq);
 		pending &= ~BIT(irq);
 	}
 }
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index b146e069bf5b..54c7092cc61d 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -169,8 +169,8 @@ static void gic_handle_shared_int(bool chained)
 			generic_handle_domain_irq(gic_irq_domain,
 						  GIC_SHARED_TO_HWIRQ(intr));
 		else
-			do_IRQ(irq_find_mapping(gic_irq_domain,
-						GIC_SHARED_TO_HWIRQ(intr)));
+			do_domain_IRQ(gic_irq_domain,
+				      GIC_SHARED_TO_HWIRQ(intr));
 	}
 }
 
@@ -320,8 +320,8 @@ static void gic_handle_local_int(bool chained)
 			generic_handle_domain_irq(gic_irq_domain,
 						  GIC_LOCAL_TO_HWIRQ(intr));
 		else
-			do_IRQ(irq_find_mapping(gic_irq_domain,
-						GIC_LOCAL_TO_HWIRQ(intr)));
+			do_domain_IRQ(gic_irq_domain,
+				      GIC_LOCAL_TO_HWIRQ(intr));
 	}
 }
 
diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evic.c
index 34c4b4ffacd1..1d9bb28d13e5 100644
--- a/drivers/irqchip/irq-pic32-evic.c
+++ b/drivers/irqchip/irq-pic32-evic.c
@@ -42,11 +42,10 @@ static void __iomem *evic_base;
 
 asmlinkage void __weak plat_irq_dispatch(void)
 {
-	unsigned int irq, hwirq;
+	unsigned int hwirq;
 
 	hwirq = readl(evic_base + REG_INTSTAT) & 0xFF;
-	irq = irq_linear_revmap(evic_irq_domain, hwirq);
-	do_IRQ(irq);
+	do_domain_IRQ(evic_irq_domain, hwirq);
 }
 
 static struct evic_chip_data *irqd_to_priv(struct irq_data *data)
-- 
2.30.2

