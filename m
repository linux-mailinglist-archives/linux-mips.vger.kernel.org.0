Return-Path: <linux-mips+bounces-5152-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D039A96204F
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 09:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04901C21439
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 07:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8259F159596;
	Wed, 28 Aug 2024 07:06:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D5B158524;
	Wed, 28 Aug 2024 07:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724828771; cv=none; b=f7CfbtZZQRprAC/GYL0IWU6cO95xocD3+h9B0nyix+TVwrSC7H8hhpBsmcFM1oZefKGNAPmUPXHRj6qUk4qqqcaGLuGnxzJ02KAO3D42Rlirgp9MbiBshOvnGGhHhSHSri6hTD3pEl5HQznn1o6L6bV1Ma3AxmSMJA0TQ9J8rqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724828771; c=relaxed/simple;
	bh=Unnar+DNJSX+QG8uYqeEe63Eu0xTKLVIO8iZd6HyRTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pga40vNFadCTFe2aEa68RsokOWCeCfMqtmiS2cwtSOvyUr3uaVgWXhqNz3du/GjPJSq97QoFMS0vp2FxZjEvkHf2gDJ6zW/H3yu074+vd2TQw1G4g0tQrBOEQ8l1amuGtE/5EeH3ClDN2TO6LRhRrolOv5IuCb8AlsPDDgF6RO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxOJpezM5m6HsiAA--.32536S3;
	Wed, 28 Aug 2024 15:06:06 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMCxB2ZbzM5m5UglAA--.2269S4;
	Wed, 28 Aug 2024 15:06:04 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [RFC v2 2/2] irqchip/loongson-eiointc: Add multiple interrupt pin routing support
Date: Wed, 28 Aug 2024 15:06:03 +0800
Message-Id: <20240828070603.3518753-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240828070603.3518753-1-maobibo@loongson.cn>
References: <20240828070603.3518753-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxB2ZbzM5m5UglAA--.2269S4
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
irq handler needs read only relative 64 interrupt vector, it  reduces
VM-exits.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 72 ++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index e9ec63d85ee8..c6bcb6625e6d 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -30,11 +30,20 @@
 #define VEC_REG_IDX(irq_id)	((irq_id) / VEC_COUNT_PER_REG)
 #define VEC_REG_BIT(irq_id)     ((irq_id) % VEC_COUNT_PER_REG)
 #define EIOINTC_ALL_ENABLE	0xffffffff
+#define EIOINTC_ROUTE_MULTIPLE_IP	BIT(0)
 
 #define MAX_EIO_NODES		(NR_CPUS / CORES_PER_EIO_NODE)
 
 static int nr_pics;
 
+struct eiointc_priv;
+struct eiointc_ip_route {
+	struct eiointc_priv	*priv;
+	/* Routed destination IP offset */
+	int			start;
+	int			end;
+};
+
 struct eiointc_priv {
 	u32			node;
 	u32			vec_count;
@@ -43,6 +52,8 @@ struct eiointc_priv {
 	struct fwnode_handle	*domain_handle;
 	struct irq_domain	*eiointc_domain;
 	int			parent_hwirq;
+	int			flags;
+	struct eiointc_ip_route route_info[4];
 };
 
 static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
@@ -145,12 +156,20 @@ static int eiointc_router_init(unsigned int cpu)
 	uint32_t data;
 	uint32_t node = cpu_to_eio_node(cpu);
 	int index = eiointc_index(node);
+	int hwirq, mask;
 
 	if (index < 0) {
 		pr_err("Error: invalid nodemap!\n");
 		return -1;
 	}
 
+	/* Enable cpu interrupt pin routed from eiointc */
+	hwirq = eiointc_priv[index]->parent_hwirq;
+	mask = BIT(hwirq);
+	if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULTIPLE_IP)
+		mask |= BIT(hwirq + 1) | BIT(hwirq + 2) | BIT(hwirq + 3);
+	set_csr_ecfg(mask);
+
 	if ((cpu_logical_map(cpu) % CORES_PER_EIO_NODE) == 0) {
 		eiointc_enable();
 
@@ -161,12 +180,23 @@ static int eiointc_router_init(unsigned int cpu)
 
 		for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
 			/*
-			 * Route to interrupt pin, using offset minus INT_HWI0
-			 * Offset 0 means IP0 and so on
-			 * Every 32 vector routing to one interrupt pin
+			 * Route to interrupt pin, minus INT_HWI0 as offset
+			 * Offset 0 means IP0 and so on, every 32 vector
+			 * routing to one interrupt pin
+			 *
+			 * If flags is set with EIOINTC_ROUTE_MULTIPLE_IP,
+			 * every 64 vector routes to different consecutive
+			 * IPs, otherwise all vector routes to the same IP
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
 
@@ -197,11 +227,18 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
 	u64 pending;
 	bool handled = false;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct eiointc_priv *priv = irq_desc_get_handler_data(desc);
+	struct eiointc_ip_route *info = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(chip, desc);
 
-	for (i = 0; i < eiointc_priv[0]->vec_count / VEC_COUNT_PER_REG; i++) {
+	/*
+	 * If EIOINTC_ROUTE_MULTIPLE_IP is set, every 64 interrupt vectors in
+	 * eiointc interrupt controller routes to different cpu interrupt pins
+	 *
+	 * Every cpu interrupt pin has its own irq handler, it is ok to
+	 * read ISR for these 64 interrupt vectors rather than all vectors
+	 */
+	for (i = info->start; i < info->end; i++) {
 		pending = iocsr_read64(EIOINTC_REG_ISR + (i << 3));
 
 		/* Skip handling if pending bitmap is zero */
@@ -214,7 +251,7 @@ static void eiointc_irq_dispatch(struct irq_desc *desc)
 			int bit = __ffs(pending);
 			int irq = bit + VEC_COUNT_PER_REG * i;
 
-			generic_handle_domain_irq(priv->eiointc_domain, irq);
+			generic_handle_domain_irq(info->priv->eiointc_domain, irq);
 			pending &= ~BIT(bit);
 			handled = true;
 		}
@@ -397,8 +434,25 @@ static int __init eiointc_init(struct eiointc_priv *priv, int parent_irq,
 	}
 
 	eiointc_priv[nr_pics++] = priv;
+	if (cpu_has_hypervisor) {
+		priv->parent_hwirq = INT_HWI0;
+		for (i = 0; i < priv->vec_count / VEC_COUNT_PER_REG; i++) {
+			priv->route_info[i].start  = priv->parent_hwirq - INT_HWI0 + i;
+			priv->route_info[i].end    = priv->route_info[i].start + 1;
+			priv->route_info[i].priv   = priv;
+			parent_irq = get_percpu_irq(priv->parent_hwirq + i);
+			irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch,
+								&priv->route_info[i]);
+		}
+		priv->flags |= EIOINTC_ROUTE_MULTIPLE_IP;
+	} else {
+		priv->route_info[0].start  = 0;
+		priv->route_info[0].end    = priv->vec_count / VEC_COUNT_PER_REG;
+		priv->route_info[0].priv   = priv;
+		irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch,
+							&priv->route_info[0]);
+	}
 	eiointc_router_init(0);
-	irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch, priv);
 
 	if (nr_pics == 1) {
 		register_syscore_ops(&eiointc_syscore_ops);
-- 
2.39.3


