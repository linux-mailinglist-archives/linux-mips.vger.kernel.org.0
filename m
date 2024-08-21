Return-Path: <linux-mips+bounces-4982-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33C9599B1
	for <lists+linux-mips@lfdr.de>; Wed, 21 Aug 2024 13:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B594283582
	for <lists+linux-mips@lfdr.de>; Wed, 21 Aug 2024 11:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9DA2111A6;
	Wed, 21 Aug 2024 10:11:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6AA210974;
	Wed, 21 Aug 2024 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724235119; cv=none; b=Q8b+kPWzXNs+0z/E9U9cNzd6nLaagDTu0zTIM6J1bOSQcTmhDJ12fDZGPbwAFSlLLNZcibU1o2pEyuDjyapO0aL1/FZRJDbmutiinzPscrof+5tyw8fnpLCm6LeL5SMeaPfPlHly4Ey2NEaryB0+JFbJz0WQuDR4zZ46uykgUn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724235119; c=relaxed/simple;
	bh=ovymmF68da7TqQigEtmE9W3qmpv8KpzF4Q0QqhP7Ub4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=agoym9dnFf1oxFyx74tsWXVr8NvGVsHiWXsZGgQ02ZUGJ60wVFnksLhNxpKjKBvc+H+5og5W4J84584gIPGjAHRqXnuVjmvzntcdvYfpdyoHREa7N5n8W9dNQiJSFMr0K2ewXh6DNrx7Ev8YOTaFp9DyXRdL7GINgbW7wI6vmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxfZtrvcVm5xAbAA--.32332S3;
	Wed, 21 Aug 2024 18:11:55 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMAxouFqvcVm_oIcAA--.60915S4;
	Wed, 21 Aug 2024 18:11:54 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [RFC 2/2] irqchip/loongson-eiointc: Add multiple interrupt pin routing support
Date: Wed, 21 Aug 2024 18:11:53 +0800
Message-Id: <20240821101153.2262290-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240821101153.2262290-1-maobibo@loongson.cn>
References: <20240821101153.2262290-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxouFqvcVm_oIcAA--.60915S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Eiointc interrupt controller support 256 interrupt vectors at most,
and irq handler gets interrupt status from base register group
EIOINTC_REG_ISR plus specific offset. It needs to read register group
EIOINTC_REG_ISR four times to get all 256 interrupt vectors status.

Eiointc registers including EIOINTC_REG_ISR is software emulation for
VMs, there will be VM-exits when accessing eiointc registers. Here one
method is introduced so that eiointc interrupt controller can route
to different cpu interrupt pins for every 64 interrupt vectors. So
irq handler needs read only relative 64 interrupt vector, it will
reduce VM-exits.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kernel/irq.c            |  3 +-
 arch/loongarch/kernel/smp.c            |  2 +-
 drivers/irqchip/irq-loongson-eiointc.c | 49 +++++++++++++++++++++++---
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/kernel/irq.c b/arch/loongarch/kernel/irq.c
index f4991c03514f..3268188881ee 100644
--- a/arch/loongarch/kernel/irq.c
+++ b/arch/loongarch/kernel/irq.c
@@ -113,5 +113,6 @@ void __init init_IRQ(void)
 			per_cpu(irq_stack, i), per_cpu(irq_stack, i) + IRQ_STACK_SIZE);
 	}
 
-	set_csr_ecfg(ECFGF_SIP0 | ECFGF_IP0 | ECFGF_IP1 | ECFGF_IP2 | ECFGF_IPI | ECFGF_PMC);
+	set_csr_ecfg(ECFGF_SIP0 | ECFGF_IP0 | ECFGF_IP1 | ECFGF_IP2 |
+			ECFGF_IP3 | ECFGF_IPI | ECFGF_PMC);
 }
diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index ca405ab86aae..557cb69bb81e 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -359,7 +359,7 @@ void loongson_boot_secondary(int cpu, struct task_struct *idle)
 void loongson_init_secondary(void)
 {
 	unsigned int cpu = smp_processor_id();
-	unsigned int imask = ECFGF_IP0 | ECFGF_IP1 | ECFGF_IP2 |
+	unsigned int imask = ECFGF_IP0 | ECFGF_IP1 | ECFGF_IP2 | ECFGF_IP3 |
 			     ECFGF_IPI | ECFGF_PMC | ECFGF_TIMER | ECFGF_SIP0;
 
 	change_csr_ecfg(ECFG0_IM, imask);
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index e9ec63d85ee8..63ba7e462cdf 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -30,6 +30,7 @@
 #define VEC_REG_IDX(irq_id)	((irq_id) / VEC_COUNT_PER_REG)
 #define VEC_REG_BIT(irq_id)     ((irq_id) % VEC_COUNT_PER_REG)
 #define EIOINTC_ALL_ENABLE	0xffffffff
+#define EIOINTC_ROUTE_MULTIPLE_IP	BIT(0)
 
 #define MAX_EIO_NODES		(NR_CPUS / CORES_PER_EIO_NODE)
 
@@ -43,6 +44,7 @@ struct eiointc_priv {
 	struct fwnode_handle	*domain_handle;
 	struct irq_domain	*eiointc_domain;
 	int			parent_hwirq;
+	int			flags;
 };
 
 static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
@@ -145,6 +147,7 @@ static int eiointc_router_init(unsigned int cpu)
 	uint32_t data;
 	uint32_t node = cpu_to_eio_node(cpu);
 	int index = eiointc_index(node);
+	int hwirq;
 
 	if (index < 0) {
 		pr_err("Error: invalid nodemap!\n");
@@ -159,14 +162,22 @@ static int eiointc_router_init(unsigned int cpu)
 			iocsr_write32(data, EIOINTC_REG_NODEMAP + i * 4);
 		}
 
+		hwirq = eiointc_priv[index]->parent_hwirq;
 		for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
 			/*
 			 * Route to interrupt pin, using offset minus INT_HWI0
 			 * Offset 0 means IP0 and so on
 			 * Every 32 vector routing to one interrupt pin
 			 */
-			bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
-			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
+			if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULTIPLE_IP) {
+				bit = BIT(hwirq++ - INT_HWI0);
+				data = bit | (bit << 8);
+				bit = BIT(hwirq++ - INT_HWI0);
+				data |= (bit << 16) | (bit << 24);
+			} else	{
+				bit = BIT(hwirq - INT_HWI0);
+				data = bit | (bit << 8) | (bit << 16) | (bit << 24);
+			}
 			iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
 		}
 
@@ -193,15 +204,33 @@ static int eiointc_router_init(unsigned int cpu)
 
 static void eiointc_irq_dispatch(struct irq_desc *desc)
 {
-	int i;
+	int i, hwirq, offset, vec_count;
 	u64 pending;
 	bool handled = false;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct eiointc_priv *priv = irq_desc_get_handler_data(desc);
+	struct irq_data *irq_data;
 
 	chained_irq_enter(chip, desc);
 
-	for (i = 0; i < eiointc_priv[0]->vec_count / VEC_COUNT_PER_REG; i++) {
+	/*
+	 * If EIOINTC_ROUTE_MULTIPLE_IP is set, every 64 interrupt vectors in
+	 * eiointc interrupt controller routes to different cpu interrupt pins
+	 *
+	 * Every cpu interrupt pin has its own irq handler, it is ok to
+	 * read ISR for these 64 interrupt vectors rather than all vectors
+	 */
+	if (priv->flags & EIOINTC_ROUTE_MULTIPLE_IP) {
+		irq_data = irq_desc_get_irq_data(desc);
+		hwirq = irqd_to_hwirq(irq_data);
+		offset = hwirq - priv->parent_hwirq;
+		vec_count = VEC_COUNT_PER_REG;
+	} else {
+		vec_count = priv->vec_count;
+		offset = 0;
+	}
+
+	for (i = offset; i < (vec_count / VEC_COUNT_PER_REG + offset); i++) {
 		pending = iocsr_read64(EIOINTC_REG_ISR + (i << 3));
 
 		/* Skip handling if pending bitmap is zero */
@@ -397,8 +426,18 @@ static int __init eiointc_init(struct eiointc_priv *priv, int parent_irq,
 	}
 
 	eiointc_priv[nr_pics++] = priv;
+	if (cpu_has_hypervisor) {
+		for (i = 0; i < priv->vec_count / VEC_COUNT_PER_REG; i++) {
+			parent_irq = get_percpu_irq(INT_HWI0 + i);
+			irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
+		}
+
+		priv->flags |= EIOINTC_ROUTE_MULTIPLE_IP;
+		priv->parent_hwirq = INT_HWI0;
+	} else {
+		irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
+	}
 	eiointc_router_init(0);
-	irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
 
 	if (nr_pics == 1) {
 		register_syscore_ops(&eiointc_syscore_ops);
-- 
2.39.3


