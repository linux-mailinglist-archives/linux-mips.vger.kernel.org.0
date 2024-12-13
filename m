Return-Path: <linux-mips+bounces-6996-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05D9F0342
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 04:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672A41886E8B
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 03:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07991183CD6;
	Fri, 13 Dec 2024 03:50:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73F916EB4C;
	Fri, 13 Dec 2024 03:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734061840; cv=none; b=k9Hy1X5kERVnPPEWag181Z28ANxQuw2g4QDj/5dYgfjhSjbzhM/gQ6gfPYg5jBjEMHvmcqlMncpOoNsfeZd1SAKRFgv8+DbTJu3BPW/+QoyKaPH7Ti8Bl8QvYqp9JG8Bc5PmuDmB9idgDUkh7/PSCkEGTp5MmjQiZ7Gw5Q9yAYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734061840; c=relaxed/simple;
	bh=qeSNlzuFws12oa96lgz4ryk6rbHpKms18H/isHjoMrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JRq4qM79mZqE6tSrg0C1GoNfNLWAIH1ZtvPYkYXA+J9gQn+d8XEKuaZgGSoe9iJAZXXaYdp5DSsV7H5dEsxjCdiTQSZbP3MZwAMI+4E4oc2oF4gJCtLRW9iJgJfUT7qnCB0BfZ+FE1ke744pHTSPTnNLofMID6Sg0U0yUqTiMNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxSOEGr1tnPHBWAA--.36858S3;
	Fri, 13 Dec 2024 11:50:30 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMBxP+EDr1tnV3WBAA--.53391S4;
	Fri, 13 Dec 2024 11:50:29 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v3 2/2] irqchip/loongson-eiointc: Add multiple interrupt pin routing support
Date: Fri, 13 Dec 2024 11:50:26 +0800
Message-Id: <20241213035026.1643517-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20241213035026.1643517-1-maobibo@loongson.cn>
References: <20241213035026.1643517-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxP+EDr1tnV3WBAA--.53391S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Eiointc interrupt controller support 256 interrupt vectors at most,
and irq handler gets interrupt status from base register group
EIOINTC_REG_ISR plus specific offset. It needs to read register group
EIOINTC_REG_ISR four times to get all 256 interrupt vectors status.

Eiointc registers including EIOINTC_REG_ISR is software emulated for
VMs, there will be VM-exits when accessing eiointc registers. Here one
method is introduced so that eiointc interrupt controller can route
to different cpu interrupt pins for every 64 interrupt vectors. So
irq handler knows interrupt pin information and reads specific
EIOINTC_REG_ISR register. And there is only once EIOINTC_REG_ISR register
access rather than four loop times, it  reduces VM-exit times.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 81 +++++++++++++++++++++++---
 1 file changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index 72979f9f0e05..e504a5d3f0b1 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -46,6 +46,7 @@
 #define EIOINTC_ALL_ENABLE_VEC_MASK(vector)	(EIOINTC_ALL_ENABLE & ~BIT(vector & 0x1f))
 #define EIOINTC_REG_ENABLE_VEC(vector)		(EIOINTC_REG_ENABLE + ((vector >> 5) << 2))
 #define EIOINTC_USE_CPU_ENCODE			BIT(0)
+#define EIOINTC_ROUTE_MULT_IP			BIT(1)
 
 #define MAX_EIO_NODES		(NR_CPUS / CORES_PER_EIO_NODE)
 
@@ -59,6 +60,13 @@
 #define EIOINTC_REG_ROUTE_VEC_MASK(vector)	(0xff << EIOINTC_REG_ROUTE_VEC_SHIFT(vector))
 
 static int nr_pics;
+struct eiointc_priv;
+typedef struct eiointc_ip_route {
+	struct eiointc_priv	*priv;
+	/* Offset Routed destination IP */
+	int			start;
+	int			end;
+} eiointc_ip_route;
 
 struct eiointc_priv {
 	u32			node;
@@ -69,6 +77,7 @@ struct eiointc_priv {
 	struct irq_domain	*eiointc_domain;
 	int			flags;
 	irq_hw_number_t		parent_hwirq;
+	eiointc_ip_route	route_info[VEC_REG_COUNT];
 };
 
 static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
@@ -189,6 +198,7 @@ static int eiointc_router_init(unsigned int cpu)
 {
 	int i, bit, cores, index, node;
 	unsigned int data;
+	int hwirq, mask;
 
 	node = cpu_to_eio_node(cpu);
 	index = eiointc_index(node);
@@ -198,6 +208,13 @@ static int eiointc_router_init(unsigned int cpu)
 		return -EINVAL;
 	}
 
+	/* Enable cpu interrupt pin from eiointc */
+	hwirq = eiointc_priv[index]->parent_hwirq;
+	mask = BIT(hwirq);
+	if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULT_IP)
+		mask |= BIT(hwirq + 1) | BIT(hwirq + 2) | BIT(hwirq + 3);
+	set_csr_ecfg(mask);
+
 	if (!(eiointc_priv[index]->flags & EIOINTC_USE_CPU_ENCODE))
 		cores = CORES_PER_EIO_NODE;
 	else
@@ -215,10 +232,28 @@ static int eiointc_router_init(unsigned int cpu)
 			/*
 			 * Route to interrupt pin, relative offset used here
 			 * Offset 0 means routing to IP0 and so on
-			 * Every 32 vector routing to one interrupt pin
+			 *
+			 * If flags is set with EIOINTC_ROUTE_MULT_IP,
+			 * every 64 vector routes to different consecutive
+			 * IPs, otherwise all vector routes to the same IP
 			 */
-			bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
-			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
+			if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULT_IP) {
+				/* The first 64 vectors route to hwirq */
+				bit = BIT(hwirq++ - INT_HWI0);
+				data = bit | (bit << 8);
+
+				/* The second 64 vectors route to hwirq + 1 */
+				bit = BIT(hwirq++ - INT_HWI0);
+				data |= (bit << 16) | (bit << 24);
+
+				/*
+				 * Route to hwirq + 2/hwirq + 3 separately
+				 * in next loop
+				 */
+			} else  {
+				bit = BIT(hwirq - INT_HWI0);
+				data = bit | (bit << 8) | (bit << 16) | (bit << 24);
+			}
 			iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
 		}
 
@@ -251,11 +286,18 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
 	u64 pending;
 	bool handled = false;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct eiointc_priv *priv = irq_desc_get_handler_data(desc);
+	eiointc_ip_route *info = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(chip, desc);
 
-	for (i = 0; i < eiointc_priv[0]->vec_count / VEC_COUNT_PER_REG; i++) {
+	/*
+	 * If EIOINTC_ROUTE_MULT_IP is set, every 64 interrupt vectors in
+	 * eiointc interrupt controller routes to different cpu interrupt pins
+	 *
+	 * Every cpu interrupt pin has its own irq handler, it is ok to
+	 * read ISR for these 64 interrupt vectors rather than all vectors
+	 */
+	for (i = info->start; i < info->end; i++) {
 		pending = iocsr_read64(EIOINTC_REG_ISR + (i << 3));
 
 		/* Skip handling if pending bitmap is zero */
@@ -268,7 +310,7 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
 			int bit = __ffs(pending);
 			int irq = bit + VEC_COUNT_PER_REG * i;
 
-			generic_handle_domain_irq(priv->eiointc_domain, irq);
+			generic_handle_domain_irq(info->priv->eiointc_domain, irq);
 			pending &= ~BIT(bit);
 			handled = true;
 		}
@@ -468,8 +510,33 @@ static int __init eiointc_init(struct eiointc_priv *priv, int parent_irq,
 	}
 
 	eiointc_priv[nr_pics++] = priv;
+	/*
+	 * Only the first eiointc device on VM supports routing to
+	 * different Interrupt Pins. The later eiointc devices use
+	 * generic method if there are multiple eiointc devices in future
+	 */
+	if (cpu_has_hypervisor && (nr_pics == 1)) {
+		priv->flags |= EIOINTC_ROUTE_MULT_IP;
+		priv->parent_hwirq = INT_HWI0;
+	}
+
+	if (priv->flags & EIOINTC_ROUTE_MULT_IP) {
+		for (i = 0; i < priv->vec_count / VEC_COUNT_PER_REG; i++) {
+			priv->route_info[i].start  = priv->parent_hwirq - INT_HWI0 + i;
+			priv->route_info[i].end    = priv->route_info[i].start + 1;
+			priv->route_info[i].priv   = priv;
+			parent_irq = get_percpu_irq(priv->parent_hwirq + i);
+			irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch,
+					&priv->route_info[i]);
+		}
+	} else {
+		priv->route_info[0].start  = 0;
+		priv->route_info[0].end    = priv->vec_count / VEC_COUNT_PER_REG;
+		priv->route_info[0].priv   = priv;
+		irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch,
+				&priv->route_info[0]);
+	}
 	eiointc_router_init(0);
-	irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
 
 	if (nr_pics == 1) {
 		register_syscore_ops(&eiointc_syscore_ops);
-- 
2.39.3


