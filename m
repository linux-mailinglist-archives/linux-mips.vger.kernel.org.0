Return-Path: <linux-mips+bounces-5150-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE9E96204B
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 09:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FFE41F260B2
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 07:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275211586F6;
	Wed, 28 Aug 2024 07:06:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615191552EB;
	Wed, 28 Aug 2024 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724828769; cv=none; b=ow77S5JQExqs08/HqUKjof5hgva8SLX9HgDDAVc4pd1TfykhC8sMWFdNjjwRxOFG47ua0NaJy9K7oZ8It3fleBxqv6uJ4ssSGZ85wJj54SGHBA4QNK/4F1PyR3YbYQGm9x2xwGQL1uHRjm4T3L3cJWHlRrympyKi3wDI3N4vRbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724828769; c=relaxed/simple;
	bh=nizlCHfbuoGImdFJM4bzVM7rc1oIMDc3cMJIQ6PswdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ONPZ8Q0oOOLih4M8h8CCcQrUfINu8qPFXIERraOUQPtn7u271cY/55Uidr/AI8tjHXDLz1uYT9f2KKI32FrimGHACsZOWiy++BKrzAC8AcGnEoara2PUeAavhSKxFV3UsIW/lyNEfQR6EHNUBjOXGvYn18riFA0co5Tls/Npdpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx6elczM5m4nsiAA--.4290S3;
	Wed, 28 Aug 2024 15:06:04 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMCxB2ZbzM5m5UglAA--.2269S3;
	Wed, 28 Aug 2024 15:06:04 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [RFC v2 1/2] irqchip/loongson-eiointc: Route interrupt parsed from acpi table
Date: Wed, 28 Aug 2024 15:06:02 +0800
Message-Id: <20240828070603.3518753-2-maobibo@loongson.cn>
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
X-CM-TRANSID:qMiowMCxB2ZbzM5m5UglAA--.2269S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Interrupt controller eiointc routes irq to cpu interface IP0 - IP7,
now it is hard-coded that eiointc routes irq to CPU started from IP1.
It can be parsed from acpi table, instead hwirq is used for function
irq_create_mapping() already, routed interrupt pin must be the same
with parent hwirq.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index b1f2080be2be..e9ec63d85ee8 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -42,6 +42,7 @@ struct eiointc_priv {
 	cpumask_t		cpuspan_map;
 	struct fwnode_handle	*domain_handle;
 	struct irq_domain	*eiointc_domain;
+	int			parent_hwirq;
 };
 
 static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
@@ -159,7 +160,12 @@ static int eiointc_router_init(unsigned int cpu)
 		}
 
 		for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
-			bit = BIT(1 + index); /* Route to IP[1 + index] */
+			/*
+			 * Route to interrupt pin, using offset minus INT_HWI0
+			 * Offset 0 means IP0 and so on
+			 * Every 32 vector routing to one interrupt pin
+			 */
+			bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
 			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
 			iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
 		}
@@ -424,7 +430,7 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 
 	priv->vec_count = VEC_COUNT;
 	priv->node = acpi_eiointc->node;
-
+	priv->parent_hwirq = acpi_eiointc->cascade;
 	parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
 
 	ret = eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
@@ -458,6 +464,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 {
 	int parent_irq, ret;
 	struct eiointc_priv *priv;
+	struct irq_data *irq_data;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -473,6 +480,12 @@ static int __init eiointc_of_init(struct device_node *of_node,
 	if (ret < 0)
 		goto out_free_priv;
 
+	irq_data = irq_get_irq_data(parent_irq);
+	if (!irq_data) {
+		ret = -ENODEV;
+		goto out_free_priv;
+	}
+
 	/*
 	 * In particular, the number of devices supported by the LS2K0500
 	 * extended I/O interrupt vector is 128.
@@ -484,7 +497,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 
 	priv->node = 0;
 	priv->domain_handle = of_node_to_fwnode(of_node);
-
+	priv->parent_hwirq = irqd_to_hwirq(irq_data);
 	ret = eiointc_init(priv, parent_irq, 0);
 	if (ret < 0)
 		goto out_free_priv;
-- 
2.39.3


