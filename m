Return-Path: <linux-mips+bounces-13160-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCFlOYxPjGmukgAAu9opvQ
	(envelope-from <linux-mips+bounces-13160-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 10:44:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA183122DD9
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 10:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B5D630138B5
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 09:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A39935C1BF;
	Wed, 11 Feb 2026 09:44:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A4035D60E;
	Wed, 11 Feb 2026 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803078; cv=none; b=FB5eJKe+H+Uh1wm9W0diJoxUJJ5cIlDKrXy/RJmALkPK0DTMA5uyAh0w2hICPqDFdsf/Wui+r3JES9dNg+snkmBlTdcc/QcYwTNRxmXOF87ogbAurQs4ONgxTscM+EJcFFRq4Mn1ZHcStzjYIA7XMfBEBUWFzvhpoTpim+cNdlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803078; c=relaxed/simple;
	bh=z+/qeUUsgL94VGkWmXSIAUlHsYWz7DdHrW58v2HF+Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FbZuUvPQvmZG1c7mRF4IeLZ1k7bVk2tdZxAB92eE1dC80hpI1ij5k8YDe24kZXVp2rYmpJdyN813P47iQ23OsJcFCqEs2f8U2JpVgpCvqf7Ya4fzueJt3lVoGU/6/2PxHTfHjU+YeQPNn+/q/wtRdQXGwMbITM4YSWj1xZ+ju/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.168])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm1rT4xph_KtBw--.27918S5;
	Wed, 11 Feb 2026 17:44:19 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 3/7] irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACPI init
Date: Wed, 11 Feb 2026 17:44:04 +0800
Message-ID: <20260211094408.3463916-4-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
References: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHsm1rT4xph_KtBw--.27918S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1xAF1rZr48JFW5AF15twb_yoWrXF45pF
	W5Xa42vF45JF4jgw1kA3WDZ3y3Aw1fKayUCFWfC34fJrnF9r1vkF10y3WDZF4fArW5WF45
	ZrsYv3W8CrnxAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUHWlkUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TAGGED_FROM(0.00)[bounces-13160-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA183122DD9
X-Rspamd-Action: no action

A lot of code could be shared between the current ACPI init flow with
the possible OF init flow.

Extract it to a dedicated function.

The re-ordering of parent interrupt acquisition requires the
architecture code to reserve legacy interrupts from the dynamic
allocation by overriding arch_dynirq_lower_bound(), otherwise the parent
of LPC irqchip will be allocated to the intended static range of LPC
interrupts, which leads to allocation failure of LPC interrupts.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Tested-by: Yao Zi <me@ziyao.cc>
---
 drivers/irqchip/irq-loongson-pch-lpc.c | 52 ++++++++++++++++----------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 3a125f3e42873..035c621d1a069 100644
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
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
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
@@ -239,3 +223,31 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent,
 
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
+
+	ret = pch_lpc_init(acpi_pchlpc->address, acpi_pchlpc->size,
+			   irq_handle, parent_irq);
+	if (ret) {
+		irq_domain_free_fwnode(irq_handle);
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.52.0


