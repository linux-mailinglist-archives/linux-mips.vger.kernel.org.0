Return-Path: <linux-mips+bounces-13852-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFNGL/pivmnDOAMAu9opvQ
	(envelope-from <linux-mips+bounces-13852-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 10:20:58 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3FF2E45BA
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 10:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D22F830185D6
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 09:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FDE359A75;
	Sat, 21 Mar 2026 09:20:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26FB31D371;
	Sat, 21 Mar 2026 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774084853; cv=none; b=e3Fsw6AG/J6wboWxhcpBVyHKfGscaXyqEe/qOKQM2z/FN4G8YEzQuK58yzu3HbUOXuDVEtmiJxrCC4VgH/fGftv/vZpcUiWRXVzS7ZQE36o1JSOp1DMUG/2CrccP5EKVtncaunnHJYRv595R1yMX1JFuuyEUF/RI+hFpgIs3mLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774084853; c=relaxed/simple;
	bh=2hLo1MgFA89+SSz6r9km+UwC/ihWpDxuFZexH8+kpzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLthox/OPG+/7HJ/sQ7NW3qW1QdA8V8V+u8bDFzHZt0YhxnxeIKtt625/13ldj0bKPjgM1NTBWDG6wviK5YkcUMn8iv5c+qOO+ytZtmjLROf07n69k/ASJJHYxbIWJbRZkUgkyuEck9CEcaclvSpzET6oMWYf79u3foP2BO/MHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-01 (Coremail) with SMTP id qwCowAA33mnjYr5p3aWyCg--.465S6;
	Sat, 21 Mar 2026 17:20:42 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v4 4/6] irqchip/loongson-pch-lpc: Extract non-ACPI-related code from ACPI init
Date: Sat, 21 Mar 2026 17:20:30 +0800
Message-ID: <20260321092032.3502701-5-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA33mnjYr5p3aWyCg--.465S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyxZw43WrWDWF4xuFyUZFb_yoWrWF4fpF
	W5Xa42vr45JF40gw1kC3WDZ3y3Aw1rKay8AFWfCa4fJrnF9r1vkF18A3ZrZF4fAFW5WF45
	ZrsYva48CFnxAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUOyIUUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13852-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,flygoat.com:email]
X-Rspamd-Queue-Id: 7C3FF2E45BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A lot of code can be shared between the existing ACPI init flow with the
upcoming OF init flow.

Extract it into a dedicated function.

The re-ordering of parent interrupt acquisition requires the
architecture code to reserve legacy interrupts from the dynamic
allocation by overriding arch_dynirq_lower_bound(), otherwise the parent
of LPC irqchip will be allocated to the intended static range of LPC
interrupts, which leads to allocation failure of LPC interrupts.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/irqchip/irq-loongson-pch-lpc.c | 57 +++++++++++++++++---------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 3ad46ec94e3c0..2bb6659e9a93c 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -175,13 +175,10 @@ static struct syscore pch_lpc_syscore = {
 	.ops = &pch_lpc_syscore_ops,
 };
 
-int __init pch_lpc_acpi_init(struct irq_domain *parent,
-					struct acpi_madt_lpc_pic *acpi_pchlpc)
+static int __init pch_lpc_init(phys_addr_t addr, unsigned long size,
+			       struct fwnode_handle *irq_handle, int parent_irq)
 {
-	int parent_irq;
 	struct pch_lpc *priv;
-	struct irq_fwspec fwspec;
-	struct fwnode_handle *irq_handle;
 
 	priv = kzalloc_obj(*priv);
 	if (!priv)
@@ -189,7 +186,7 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 
 	raw_spin_lock_init(&priv->lpc_lock);
 
-	priv->base = ioremap(acpi_pchlpc->address, acpi_pchlpc->size);
+	priv->base = ioremap(addr, size);
 	if (!priv->base)
 		goto free_priv;
 
@@ -198,12 +195,6 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 		goto iounmap_base;
 	}
 
-	irq_handle = irq_domain_alloc_named_fwnode("lpcintc");
-	if (!irq_handle) {
-		pr_err("Unable to allocate domain handle\n");
-		goto iounmap_base;
-	}
-
 	/*
 	 * The LPC interrupt controller is a legacy i8259-compatible device,
 	 * which requires a static 1:1 mapping for IRQs 0-15.
@@ -213,15 +204,10 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 						    &pch_lpc_domain_ops, priv);
 	if (!priv->lpc_domain) {
 		pr_err("Failed to create IRQ domain\n");
-		goto free_irq_handle;
+		goto iounmap_base;
 	}
 	pch_lpc_reset(priv);
 
-	fwspec.fwnode = parent->fwnode;
-	fwspec.param[0] = acpi_pchlpc->cascade + GSI_MIN_PCH_IRQ;
-	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
-	fwspec.param_count = 2;
-	parent_irq = irq_create_fwspec_mapping(&fwspec);
 	irq_set_chained_handler_and_data(parent_irq, lpc_irq_dispatch, priv);
 
 	pch_lpc_priv = priv;
@@ -230,8 +216,6 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 
 	return 0;
 
-free_irq_handle:
-	irq_domain_free_fwnode(irq_handle);
 iounmap_base:
 	iounmap(priv->base);
 free_priv:
@@ -239,3 +223,36 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 
 	return -ENOMEM;
 }
+
+int __init pch_lpc_acpi_init(struct irq_domain *parent, struct acpi_madt_lpc_pic *acpi_pchlpc)
+{
+	struct fwnode_handle *irq_handle;
+	struct irq_fwspec fwspec;
+	int parent_irq, ret;
+
+	irq_handle = irq_domain_alloc_named_fwnode("lpcintc");
+	if (!irq_handle) {
+		pr_err("Unable to allocate domain handle\n");
+		return -ENOMEM;
+	}
+
+	fwspec.fwnode = parent->fwnode;
+	fwspec.param[0] = acpi_pchlpc->cascade + GSI_MIN_PCH_IRQ;
+	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
+	fwspec.param_count = 2;
+	parent_irq = irq_create_fwspec_mapping(&fwspec);
+	if (parent_irq <= 0) {
+		pr_err("Unable to map LPC parent interrupt\n");
+		irq_domain_free_fwnode(irq_handle);
+		return -ENOMEM;
+	}
+
+	ret = pch_lpc_init(acpi_pchlpc->address, acpi_pchlpc->size, irq_handle, parent_irq);
+	if (ret) {
+		irq_dispose_mapping(parent_irq);
+		irq_domain_free_fwnode(irq_handle);
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.52.0


