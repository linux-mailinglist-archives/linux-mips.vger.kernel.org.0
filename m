Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556304368A7
	for <lists+linux-mips@lfdr.de>; Thu, 21 Oct 2021 19:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhJURGs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Oct 2021 13:06:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231441AbhJURGm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Oct 2021 13:06:42 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74DAB615E2;
        Thu, 21 Oct 2021 17:04:26 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mdbUO-000lAU-OP; Thu, 21 Oct 2021 18:04:24 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, f.fainelli@gmail.com,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 3/3] genirq: Hide irq_cpu_{on,off}line() behind a deprecated option
Date:   Thu, 21 Oct 2021 18:04:14 +0100
Message-Id: <20211021170414.3341522-4-maz@kernel.org>
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

irq_cpu_{on,off}line() are now only used by the Octeon platform.
Make their use conditional on this plaform being enabled, and
otherwise hidden away.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irq.h | 5 ++++-
 kernel/irq/Kconfig  | 7 +++++++
 kernel/irq/chip.c   | 2 ++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index c8293c817646..0c746d325206 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -524,9 +524,10 @@ struct irq_chip {
 	void		(*irq_bus_lock)(struct irq_data *data);
 	void		(*irq_bus_sync_unlock)(struct irq_data *data);
 
+#ifdef CONFIG_DEPRECATED_IRQ_CPU_ONOFFLINE
 	void		(*irq_cpu_online)(struct irq_data *data);
 	void		(*irq_cpu_offline)(struct irq_data *data);
-
+#endif
 	void		(*irq_suspend)(struct irq_data *data);
 	void		(*irq_resume)(struct irq_data *data);
 	void		(*irq_pm_shutdown)(struct irq_data *data);
@@ -606,8 +607,10 @@ struct irqaction;
 extern int setup_percpu_irq(unsigned int irq, struct irqaction *new);
 extern void remove_percpu_irq(unsigned int irq, struct irqaction *act);
 
+#ifdef CONFIG_DEPRECATED_IRQ_CPU_ONOFFLINE
 extern void irq_cpu_online(void);
 extern void irq_cpu_offline(void);
+#endif
 extern int irq_set_affinity_locked(struct irq_data *data,
 				   const struct cpumask *cpumask, bool force);
 extern int irq_set_vcpu_affinity(unsigned int irq, void *vcpu_info);
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index fbc54c2a7f23..c0b9d4607147 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -144,3 +144,10 @@ config GENERIC_IRQ_MULTI_HANDLER
 	bool
 	help
 	  Allow to specify the low level IRQ handler at run time.
+
+# Cavium Octeon is the last system to use this deprecated option
+# Do not even think of enabling this on any new platform
+config DEPRECATED_IRQ_CPU_ONOFFLINE
+	bool
+	depends on CAVIUM_OCTEON_SOC
+	default CAVIUM_OCTEON_SOC
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index a98bcfc4be7b..f895265d7548 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1122,6 +1122,7 @@ void irq_modify_status(unsigned int irq, unsigned long clr, unsigned long set)
 }
 EXPORT_SYMBOL_GPL(irq_modify_status);
 
+#ifdef CONFIG_DEPRECATED_IRQ_CPU_ONOFFLINE
 /**
  *	irq_cpu_online - Invoke all irq_cpu_online functions.
  *
@@ -1181,6 +1182,7 @@ void irq_cpu_offline(void)
 		raw_spin_unlock_irqrestore(&desc->lock, flags);
 	}
 }
+#endif
 
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 
-- 
2.30.2

