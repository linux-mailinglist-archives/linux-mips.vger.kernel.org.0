Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FDD35501A
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 11:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244860AbhDFJhI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 05:37:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:55134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244897AbhDFJg4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 05:36:56 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D26C6613CD;
        Tue,  6 Apr 2021 09:36:26 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lTi8H-005owA-2H; Tue, 06 Apr 2021 10:36:25 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org
Cc:     Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 5/9] irqdomain: Kill irq_create_strict_mappings()/irq_create_identity_mapping()
Date:   Tue,  6 Apr 2021 10:35:53 +0100
Message-Id: <20210406093557.1073423-6-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210406093557.1073423-1-maz@kernel.org>
References: <20210406093557.1073423-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, daniel@zonque.org, robert.jarzmik@free.fr, haojian.zhuang@gmail.com, ysato@users.sourceforge.jp, dalias@libc.org, tsbogend@alpha.franken.de, mpe@ellerman.id.au, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

No user of these APIs are left, remove them.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqdomain.h |  9 ---------
 kernel/irq/irqdomain.c    | 35 -----------------------------------
 2 files changed, 44 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index b9600f24878a..3997ed9e4d7d 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -411,15 +411,6 @@ static inline unsigned int irq_linear_revmap(struct irq_domain *domain,
 }
 
 extern unsigned int irq_create_direct_mapping(struct irq_domain *host);
-extern int irq_create_strict_mappings(struct irq_domain *domain,
-				      unsigned int irq_base,
-				      irq_hw_number_t hwirq_base, int count);
-
-static inline int irq_create_identity_mapping(struct irq_domain *host,
-					      irq_hw_number_t hwirq)
-{
-	return irq_create_strict_mappings(host, hwirq, hwirq, 1);
-}
 
 extern const struct irq_domain_ops irq_domain_simple_ops;
 
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index dfa716305ea9..0ba761e6b0a8 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -703,41 +703,6 @@ unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
 }
 EXPORT_SYMBOL_GPL(irq_create_mapping_affinity);
 
-/**
- * irq_create_strict_mappings() - Map a range of hw irqs to fixed linux irqs
- * @domain: domain owning the interrupt range
- * @irq_base: beginning of linux IRQ range
- * @hwirq_base: beginning of hardware IRQ range
- * @count: Number of interrupts to map
- *
- * This routine is used for allocating and mapping a range of hardware
- * irqs to linux irqs where the linux irq numbers are at pre-defined
- * locations. For use by controllers that already have static mappings
- * to insert in to the domain.
- *
- * Non-linear users can use irq_create_identity_mapping() for IRQ-at-a-time
- * domain insertion.
- *
- * 0 is returned upon success, while any failure to establish a static
- * mapping is treated as an error.
- */
-int irq_create_strict_mappings(struct irq_domain *domain, unsigned int irq_base,
-			       irq_hw_number_t hwirq_base, int count)
-{
-	struct device_node *of_node;
-	int ret;
-
-	of_node = irq_domain_get_of_node(domain);
-	ret = irq_alloc_descs(irq_base, irq_base, count,
-			      of_node_to_nid(of_node));
-	if (unlikely(ret < 0))
-		return ret;
-
-	irq_domain_associate_many(domain, irq_base, hwirq_base, count);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(irq_create_strict_mappings);
-
 static int irq_domain_translate(struct irq_domain *d,
 				struct irq_fwspec *fwspec,
 				irq_hw_number_t *hwirq, unsigned int *type)
-- 
2.29.2

