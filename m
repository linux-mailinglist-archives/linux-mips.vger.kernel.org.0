Return-Path: <linux-mips+bounces-9991-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D484BB19D7A
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 10:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 779391898578
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 08:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8C62417D9;
	Mon,  4 Aug 2025 08:19:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A099124061F;
	Mon,  4 Aug 2025 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754295595; cv=none; b=DcxI2XDIeFQS9MdD36vgLb5gE5hAhABfga2eROvpyek9rjd55UhTX2Ih9A2Q6i9lxQgM8fNCD0ELbagJ/LAj8sQ5eczUVMiD9uQ/yPEGbTZnuXBtALdidVvqLAw3sS+/9GdB73PupCNOWATI/OUqO1ZT39OClNxRv+TVwKGpeGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754295595; c=relaxed/simple;
	bh=ML9f86fga0rWxdP6xgzsz3Q5IKb0hEn1AmRpdMyCVe8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QKcnttY1p5QdirWKQrocCxLzqTnnz26TsgspENfJ1CbVDOTEkTxZi/FAX8QwCqgPqTa/JDT601XWZtUXq4IGtUzLEzz1FJGn+9M81ycUzUoS1AgVQSCI9sTT71aUciVZfKqRKxQMNRTUq5CzFWiTSCJXGrJhVITebMNlV32r4Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxrOImbZBoBjk4AQ--.4724S3;
	Mon, 04 Aug 2025 16:19:50 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxE+QibZBoTUU1AA--.65480S3;
	Mon, 04 Aug 2025 16:19:48 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v4 1/2] irqchip/loongson-eiointc: Route interrupt parsed from bios table
Date: Mon,  4 Aug 2025 16:19:45 +0800
Message-Id: <20250804081946.1456573-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250804081946.1456573-1-maobibo@loongson.cn>
References: <20250804081946.1456573-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+QibZBoTUU1AA--.65480S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Interrupt controller eiointc routes irq to cpu interface IP0 - IP7,
now it is hard-coded that eiointc routes irq to CPU started from IP1,
however with function irq_create_mapping() parameter parent hwirq
uses irq parsed from ACPI or DTS table.

Routed interrupt pin need be the consistent with parent hwirq.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 drivers/irqchip/irq-loongson-eiointc.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index b2860eb2d32c..3e987d1232d2 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -68,6 +68,7 @@ struct eiointc_priv {
 	struct fwnode_handle	*domain_handle;
 	struct irq_domain	*eiointc_domain;
 	int			flags;
+	irq_hw_number_t		parent_hwirq;
 };
 
 static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
@@ -211,7 +212,12 @@ static int eiointc_router_init(unsigned int cpu)
 		}
 
 		for (i = 0; i < eiointc_priv[0]->vec_count / 32 / 4; i++) {
-			bit = BIT(1 + index); /* Route to IP[1 + index] */
+			/*
+			 * Route to interrupt pin, relative offset used here
+			 * Offset 0 means routing to IP0 and so on
+			 * Every 32 vector routing to one interrupt pin
+			 */
+			bit = BIT(eiointc_priv[index]->parent_hwirq - INT_HWI0);
 			data = bit | (bit << 8) | (bit << 16) | (bit << 24);
 			iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
 		}
@@ -495,7 +501,7 @@ int __init eiointc_acpi_init(struct irq_domain *parent,
 
 	priv->vec_count = VEC_COUNT;
 	priv->node = acpi_eiointc->node;
-
+	priv->parent_hwirq = acpi_eiointc->cascade;
 	parent_irq = irq_create_mapping(parent, acpi_eiointc->cascade);
 
 	ret = eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
@@ -529,6 +535,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 {
 	int parent_irq, ret;
 	struct eiointc_priv *priv;
+	struct irq_data *irq_data;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -544,6 +551,12 @@ static int __init eiointc_of_init(struct device_node *of_node,
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
@@ -552,7 +565,7 @@ static int __init eiointc_of_init(struct device_node *of_node,
 		priv->vec_count = 128;
 	else
 		priv->vec_count = VEC_COUNT;
-
+	priv->parent_hwirq = irqd_to_hwirq(irq_data);
 	priv->node = 0;
 	priv->domain_handle = of_fwnode_handle(of_node);
 
-- 
2.39.3


