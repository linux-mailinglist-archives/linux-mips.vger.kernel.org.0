Return-Path: <linux-mips+bounces-14313-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEdaHnC27GmzbwAAu9opvQ
	(envelope-from <linux-mips+bounces-14313-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 14:41:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D055C4663DF
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 14:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E70A7301701B
	for <lists+linux-mips@lfdr.de>; Sat, 25 Apr 2026 12:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F30379EE4;
	Sat, 25 Apr 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="a+WoWtHO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BD827280A;
	Sat, 25 Apr 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777120858; cv=none; b=me43Tnsc8Lu3Rd/FK04u2xgl/akH5JChh21qbrgeb/f8TUS0Gca9Fve4i7fBOWy7+BFtvaA/A0zPmyN45jYoCquoa+2nkfy8xtgeQOkum5xr1KrrAbOY88vEcu4rS/9CvL4RD6U6ii4E5MHg+U3WDiApInCXuSr4/762uljASqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777120858; c=relaxed/simple;
	bh=bwYrR/w0bLFvJKrHCR//R3lZRmgpRcLASVuZ41H1moQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DtRuZb5RG/hwDs2ZSgemrosqDj0USygm6GHQLwqocH+XWMTfHEgX6cQBPzhLvxrXn+iKFP11oVT0aPV60tRkA0gW5j3p48OXZxFpsZLmKpteflJDh8xLZ7JjJSBkWKhp108cy95q/b2x9DR+7X54CGfMq8P0S01b8fapQXWHZOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=a+WoWtHO; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F154B1E6470;
	Sat, 25 Apr 2026 14:35:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777120538; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7VxvciL2x84927Umx9tDfPPI+CS5w4h0k9WG2QBVJko=;
	b=a+WoWtHODLKRp8Y0FgybAmA08NXn0mEI9rUyx8poAZIJ2urQ7J5IAyJxYSunG09YGIBORt
	xdGp2mc7DVzxfIrBilYpsXd8fxdiZwWhUyNPYZQwbbpG+bC8G7mfJvpqYleyh4CDmhiQia
	Ke4OxQQ6pG5bOO1Te8LckSPn7C6dZMK1cXw6o/7urr0qiueKJe47RxWKukN7vV/0JiMpBi
	pqBRP2fDFYQ0uKbZp+7oLoWtQ3B7Sq1yRIrh+hk9NuoDG6P5CsxsiB0ZVPKF/0bveKAqPx
	F05lo13nD/uBFQAh3E83XSSDmZQm0tdWSwraf47hXu6HV6oOHOoyj+8D7UCrAg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 2/2] irqchip/econet-en751221: Support MIPS 34Kc VEIC mode
Date: Sat, 25 Apr 2026 12:35:31 +0000
Message-Id: <20260425123531.270548-3-cjd@cjdns.fr>
In-Reply-To: <20260425123531.270548-1-cjd@cjdns.fr>
References: <20260425123531.270548-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: D055C4663DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14313-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The Vectored External Interrupt Controller mode present in the MIPS
34Kc and 1004Kc causes the CPU to stop dispatching interrupts by the
normal code path and instead it sends those interrupts to the external
interrupt controller to be prioritized, renumbered, and sent back.
When they come back, they are handled through a different path using a
dispatch table, so plat_irq_dispatch never sees action.

This of course subverts the traditional intc hierarchy, and on the
1004Kc the interrupt controller is standardized (IRQ_GIC) so it can be
reasonably considered part of the CPU itself - and tighter coupling
between IRQ_GIC and arch/mips/* is tolerable. However on the 34Kc
the intc is defined by each SoC vendor, so we have the task of making a
reasonably modular driver - but for a device which in fact ends up
taking over the entire interrupt system.

We let the DT describe which IRQs which come from the CPU and should be
routed back and handled by the CPU intc. These particularly include the
two IPI interrupts which would otherwise necessitate duplication of all
the IPI supporting infrastructure from the CPU intc.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/irqchip/irq-econet-en751221.c | 176 +++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
index d83d5eb12795..98c109fe053b 100644
--- a/drivers/irqchip/irq-econet-en751221.c
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -30,6 +30,8 @@
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 
+#include <asm/setup.h>
+
 #define IRQ_COUNT		40
 
 #define NOT_PERCPU		0xff
@@ -42,14 +44,18 @@
 
 /**
  * @membase: Base address of the interrupt controller registers
+ * @domain: The irq_domain for direct dispatch
+ * @ipi_domain: The irq_domain for inter-process dispatch
  * @interrupt_shadows: Array of all interrupts, for each value,
  *	- NOT_PERCPU: This interrupt is not per-cpu, so it has no shadow
  *	- IS_SHADOW: This interrupt is a shadow of another per-cpu interrupt
  *	- else: This is a per-cpu interrupt whose shadow is the value
  */
 static struct {
-	void __iomem	*membase;
-	u8		interrupt_shadows[IRQ_COUNT];
+	void __iomem		*membase;
+	struct irq_domain	*domain;
+	struct irq_domain	*ipi_domain;
+	u8			interrupt_shadows[IRQ_COUNT];
 } econet_intc __ro_after_init;
 
 static DEFINE_RAW_SPINLOCK(irq_lock);
@@ -150,6 +156,55 @@ static void econet_intc_from_parent(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+/* When in VEIC mode, the CPU jumps to a handler in the vector table.
+ * The only way to know which interrupt is being triggered is from the vector table offset that
+ * has been jumped to. Reading REG_PENDING(0|1) will tell you which interrupts are currently
+ * pending in the intc, but that will not tell you which one the intc wants you to process
+ * right now. And if you are not processing the exact interrupt that the intc wants you to be
+ * processing, you might be on the wrong VPE. You can't tell which VPE any given REG_PENDING
+ * interrupt is intended for (shadow IRQ numbers are for masking only, they never flag as
+ * pending).
+ *
+ * Consequently, this little ritual of generating n handler functions and registering one per
+ * interrupt is unavoidable.
+ */
+#define X(irq) \
+	static void econet_irq_dispatch ## irq (void) \
+	{ \
+		do_domain_IRQ(econet_intc.domain, irq); \
+	}
+
+ X(0)  X(1)  X(2)  X(3)  X(4)  X(5)  X(6)  X(7)  X(8)  X(9)
+X(10) X(11) X(12) X(13) X(14) X(15) X(16) X(17) X(18) X(19)
+X(20) X(21) X(22) X(23) X(24) X(25) X(26) X(27) X(28) X(29)
+X(30) X(31) X(32) X(33) X(34) X(35) X(36) X(37) X(38) X(39)
+
+#undef X
+#define X(irq) econet_irq_dispatch ## irq,
+
+static void (* const econet_irq_dispatchers[])(void) = {
+	X(0)  X(1)  X(2)  X(3)  X(4)  X(5)  X(6)  X(7)  X(8)  X(9)
+	X(10) X(11) X(12) X(13) X(14) X(15) X(16) X(17) X(18) X(19)
+	X(20) X(21) X(22) X(23) X(24) X(25) X(26) X(27) X(28) X(29)
+	X(30) X(31) X(32) X(33) X(34) X(35) X(36) X(37) X(38) X(39)
+};
+
+/* Likewise, we do the same for the 2 IPI IRQs so that we can route them back */
+static void econet_cpu_dispatch0(void)
+{
+	do_domain_IRQ(econet_intc.ipi_domain, 0);
+}
+
+static void econet_cpu_dispatch1(void)
+{
+	do_domain_IRQ(econet_intc.ipi_domain, 1);
+}
+
+static void (* const econet_cpu_dispatchers[])(void) = {
+	econet_cpu_dispatch0,
+	econet_cpu_dispatch1,
+};
+
 static const struct irq_chip econet_irq_chip;
 
 static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hwirq)
@@ -174,6 +229,10 @@ static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hwirq)
 	}
 
 	irq_set_chip_data(irq, NULL);
+
+	if (cpu_has_veic)
+		set_vi_handler(hwirq + 1, econet_irq_dispatchers[hwirq]);
+
 	return 0;
 }
 
@@ -249,6 +308,101 @@ static int __init get_shadow_interrupts(struct device_node *node)
 	return 0;
 }
 
+/**
+ * econet_cpu_init() - configure routing of CPU interrupts to the correct domain.
+ * @node: The devicetree node of this interrupt controller.
+ *
+ * Interrupts that originate from the CPU are unconditionally unmasked here and are re-routed back
+ * to the IPI irq_domain in the CPU intc. Masking still takes place but the CPU intc is in charge
+ * of it, using the mask bits of the c0_status register.
+ *
+ * Note that because IP2 ... IP7 are repurposed as Interrupt Priority Level, only the two IPI
+ * interrupts are actually supported.
+ */
+static int __init econet_cpu_init(struct device_node *node)
+{
+	const char *field = "econet,cpu-interrupt-map";
+	struct device_node *parent_intc;
+	int map_size;
+	u32 mask;
+
+	map_size = of_property_count_u32_elems(node, field);
+
+	if (map_size <= 0) {
+		return 0;
+	} else if (map_size % 2) {
+		pr_err("%pOF: %s count is odd, ignoring\n", node, field);
+		return 0;
+	}
+
+	u32 *maps __free(kfree) = kmalloc_array(map_size, sizeof(u32), GFP_KERNEL);
+	if (!maps)
+		return -ENOMEM;
+
+	if (of_property_read_u32_array(node, field, maps, map_size)) {
+		pr_err("%pOF: Failed to read %s\n", node, field);
+		return -EINVAL;
+	}
+
+	/* Validation */
+	for (int i = 0; i < map_size; i += 2) {
+		u32 receive = maps[i];
+		u32 dispatch = maps[i + 1];
+		u8 shadow;
+
+		if (receive >= IRQ_COUNT) {
+			pr_err("%pOF: Entry %d:%d in %s (%u) %s\n",
+			       node, i, 0, field, receive, "is out of bounds");
+			return -EINVAL;
+		}
+
+		shadow = econet_intc.interrupt_shadows[receive];
+		if (shadow != NOT_PERCPU && shadow >= IRQ_COUNT) {
+			pr_err("%pOF: Entry %d:%d in %s (%u) %s\n",
+			       node, i, 0, field, receive, "has invalid shadow");
+			return -EINVAL;
+		}
+
+		if (dispatch >= ARRAY_SIZE(econet_cpu_dispatchers)) {
+			pr_err("%pOF: Entry %d:%d in %s (%u) %s\n",
+			       node, i, 1, field, dispatch,
+			       "is out of bounds, only IPI interrupts are supported");
+			return -EINVAL;
+		}
+	}
+
+	parent_intc = of_irq_find_parent(node);
+	if (!parent_intc) {
+		pr_err("%pOF: Failed to find parent %s\n", node, "IRQ device");
+		return -ENODEV;
+	}
+
+	econet_intc.ipi_domain = irq_find_matching_host(parent_intc, DOMAIN_BUS_IPI);
+	if (!econet_intc.ipi_domain) {
+		pr_err("%pOF: Failed to find parent %s\n", node, "IPI domain");
+		return -ENODEV;
+	}
+
+	mask = 0;
+	for (int i = 0; i < map_size; i += 2) {
+		u32 receive = maps[i];
+		u32 dispatch = maps[i + 1];
+		u8 shadow;
+
+		set_vi_handler(receive + 1, econet_cpu_dispatchers[dispatch]);
+
+		mask |= BIT(receive);
+
+		shadow = econet_intc.interrupt_shadows[receive];
+		if (shadow != NOT_PERCPU)
+			mask |= BIT(shadow);
+	}
+
+	econet_wreg(REG_MASK0, mask, mask);
+
+	return 0;
+}
+
 static int __init econet_intc_of_init(struct device_node *node, struct device_node *parent)
 {
 	struct irq_domain *domain;
@@ -294,7 +448,23 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
 		goto err_unmap;
 	}
 
-	irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
+	/*
+	 * 34K Manual (MD00534) Section 6.3.1.3 rev 1.13 page 136:
+	 * In VEIC mode, IP2 ... IP7 are repurposed as Interrupt Priority Level. The controller
+	 * will filter incoming interrupts whose priority is lower than the IPL number. Therefore
+	 * we must not set any of these bits. We avoid setting IP2 by not actually chaining this
+	 * intc to the CPU intc.
+	 */
+	if (cpu_has_veic) {
+		ret = econet_cpu_init(node);
+
+		if (ret)
+			return ret;
+	} else {
+		irq_set_chained_handler_and_data(irq, econet_intc_from_parent, domain);
+	}
+
+	econet_intc.domain = domain;
 
 	return 0;
 
-- 
2.39.5


