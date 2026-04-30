Return-Path: <linux-mips+bounces-14413-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULxdCeeH82mL4wEAu9opvQ
	(envelope-from <linux-mips+bounces-14413-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 18:48:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9C24A5FCA
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 18:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C157F309154A
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 16:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF1047B406;
	Thu, 30 Apr 2026 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="YcNAUSwm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B91477E40;
	Thu, 30 Apr 2026 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567332; cv=none; b=W2d0njFz7VOfswmIYB5wqE/JT2qzt2SJO+A/zj5/pEtFzO1JQGxFKz8o6poUYKdJF3etkVThHsSB5c+vmTKePkdcTnQPB4veeF3wJFKUKbyEE7SDUq4W6nL/fVM4zY4taDHnHRoN9ei/UBgo42WVtzEWK9soH77NFacfCkeJHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567332; c=relaxed/simple;
	bh=UiBHgjgGf/6hxn3QUFM7jbEdBNqzwwLijYDtNz8DCdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JWsG/vAV/OfH5LXkOfWA18FNWPdx0TUhoukDRKwQqgcFSyIpRw5OnIpZupQr/nas0uzxU1Lts9E2YQwtUc9T9I6gamj2qJlDmrJ1/2K2RXf0NJ/r/bFZcNjIeTviY+mF/wBdh36PwO1DfKVkEzgJc4n1VMpzM22eMKY5GHeSSCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=YcNAUSwm; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C254E27439E;
	Thu, 30 Apr 2026 18:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1777567323; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QGy5Y/2RzUbKfiG9Qi9xe96I8O+KrHMnQC9xg7BP50w=;
	b=YcNAUSwmP4pQgHgWrWHeI93ULfg5hx16tjdjk5Q9UB4Ovntxyl+YPjUF3+IY++ZPpznIk8
	ev3y/5s+whwMsvcVCBwB/yRy9Pe0q2dkWsShQFuwoeoPpaO+qPSz1OiOEMOyh2D7+Jhtyu
	DvDtd4jIp1r9Mw+s9y3SU4x/ZETKOQGQwj6tz2ZP7aaqwPL+LJjQDKnwz5ZlMI8UvB3I+2
	tb5ocuwnATcTadaWJ3efBnjSRC426NZdEJodsZlcy3LmhmGegm9mQN5XAN7VmSdDmbAB/d
	7wgxskbiY3DpZGXD2TPW2FU5Vo7X/7JrOz75Hbl9xmX/2Sy+mLTp9VacoPzr9w==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 2/2] irqchip/econet-en751221: Support MIPS 34Kc VEIC mode
Date: Thu, 30 Apr 2026 16:41:57 +0000
Message-Id: <20260430164157.6026-3-cjd@cjdns.fr>
In-Reply-To: <20260430164157.6026-1-cjd@cjdns.fr>
References: <20260430164157.6026-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 8C9C24A5FCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14413-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cjdns.fr:email,cjdns.fr:dkim,cjdns.fr:mid]

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
the intc is defined by each SoC vendor, so it's required to have a
modular driver - but for a device which in fact ends up taking over the
entire interrupt system.

Let the DT describe which IRQs which come from the CPU and should be
routed back and handled by the CPU intc. These particularly include the
two IPI interrupts which would otherwise necessitate duplication of all
the IPI supporting infrastructure from the CPU intc.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/irqchip/irq-econet-en751221.c | 187 ++++++++++++++++++++++++--
 1 file changed, 179 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
index d83d5eb12795..a4921528eaef 100644
--- a/drivers/irqchip/irq-econet-en751221.c
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -30,6 +30,8 @@
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 
+#include <asm/setup.h>
+
 #define IRQ_COUNT		40
 
 #define NOT_PERCPU		0xff
@@ -41,15 +43,19 @@
 #define REG_PENDING1		0x54
 
 /**
- * @membase: Base address of the interrupt controller registers
- * @interrupt_shadows: Array of all interrupts, for each value,
- *	- NOT_PERCPU: This interrupt is not per-cpu, so it has no shadow
- *	- IS_SHADOW: This interrupt is a shadow of another per-cpu interrupt
- *	- else: This is a per-cpu interrupt whose shadow is the value
+ * @membase:		Base address of the interrupt controller registers
+ * @domain:		The irq_domain for direct dispatch
+ * @ipi_domain:		The irq_domain for inter-process dispatch
+ * @interrupt_shadows:	Array of all interrupts, for each value,
+ *	- NOT_PERCPU:	This interrupt is not per-cpu, so it has no shadow
+ *	- IS_SHADOW:	This interrupt is a shadow of another per-cpu interrupt
+ *	- else:		This is a per-cpu interrupt whose shadow is the value
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
@@ -150,6 +156,56 @@ static void econet_intc_from_parent(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+/*
+ * When in VEIC mode, the CPU jumps to a handler in the vector table.
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
@@ -174,6 +230,10 @@ static int econet_intc_map(struct irq_domain *d, u32 irq, irq_hw_number_t hwirq)
 	}
 
 	irq_set_chip_data(irq, NULL);
+
+	if (cpu_has_veic)
+		set_vi_handler(hwirq + 1, econet_irq_dispatchers[hwirq]);
+
 	return 0;
 }
 
@@ -249,6 +309,101 @@ static int __init get_shadow_interrupts(struct device_node *node)
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
+			pr_err("%pOF: Entry %d:%d in %s (%u) is out of bounds\n",
+			       node, i, 0, field, receive);
+			return -EINVAL;
+		}
+
+		shadow = econet_intc.interrupt_shadows[receive];
+		if (shadow != NOT_PERCPU && shadow >= IRQ_COUNT) {
+			pr_err("%pOF: Entry %d:%d in %s (%u) has invalid shadow (%d)\n",
+			       node, i, 0, field, receive, shadow);
+			return -EINVAL;
+		}
+
+		if (dispatch >= ARRAY_SIZE(econet_cpu_dispatchers)) {
+			pr_err("%pOF: Entry %d:%d in %s (%u) is out of bounds only IPI interrupts "
+			       "are supported\n",
+			       node, i, 1, field, dispatch);
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
@@ -294,7 +449,23 @@ static int __init econet_intc_of_init(struct device_node *node, struct device_no
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


