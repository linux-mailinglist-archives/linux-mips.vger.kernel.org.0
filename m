Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E513AA642
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389368AbfIEOqG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:46:06 -0400
Received: from forward100j.mail.yandex.net ([5.45.198.240]:44622 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389424AbfIEOqF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:46:05 -0400
Received: from mxback20o.mail.yandex.net (mxback20o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::71])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id 13D4C50E0D67;
        Thu,  5 Sep 2019 17:46:01 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback20o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id Ew6bU6hMB0-k0Z0frFu;
        Thu, 05 Sep 2019 17:46:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694761;
        bh=GDPLbh2Za9If16kngBr0Vy91wenOeOyR+BDWVi+j/l8=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=JyKKDs9U5ZKs2JQfu4IkzVIq6AmaokuKzZhOc3wYlG5UlORdlcw3UpIAH6vPmbC8F
         4MB69anqrCl9nRSGoU/3oLLjhaxHlLtAcErri0oVnsW2pqShkEBZ0ZAldNsJgfNyDz
         j99KtC/MZvFYGLSyDBzp7QuT7rTV95By1crzfntE=
Authentication-Results: mxback20o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-jlxW4ZjN;
        Thu, 05 Sep 2019 17:45:58 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 09/19] irqchip: i8259: Add plat-poll support
Date:   Thu,  5 Sep 2019 22:43:06 +0800
Message-Id: <20190905144316.12527-10-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For some platforms (e.g. Loongson-3), platfrom interrupt controller
supports polling interrupt vector from i8259 automaticly and generating
sepreated interrupt.

Thus we add plat-poll OF property for these platforms and setup sepreated
chained interrupt handler.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-i8259.c | 47 ++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-i8259.c b/drivers/irqchip/irq-i8259.c
index d000870d9b6b..e7a9895f3b2d 100644
--- a/drivers/irqchip/irq-i8259.c
+++ b/drivers/irqchip/irq-i8259.c
@@ -40,6 +40,12 @@ static void mask_and_ack_8259A(struct irq_data *d);
 static void init_8259A(int auto_eoi);
 static int (*i8259_poll)(void) = i8259_irq;
 
+struct plat_poll_priv {
+	struct irq_domain *domain;
+	int hwirq;
+};
+static struct plat_poll_priv plat_poll_priv[16];
+
 static struct irq_chip i8259A_chip = {
 	.name			= "XT-PIC",
 	.irq_mask		= disable_8259A_irq,
@@ -346,22 +352,51 @@ static void i8259_irq_dispatch(struct irq_desc *desc)
 	generic_handle_irq(irq);
 }
 
+static void plat_poll_irq_dispatch(struct irq_desc *desc)
+{
+	struct plat_poll_priv *priv = irq_desc_get_handler_data(desc);
+	unsigned int irq;
+
+	irq = irq_linear_revmap(priv->domain, priv->hwirq);
+	generic_handle_irq(irq);
+}
+
 int __init i8259_of_init(struct device_node *node, struct device_node *parent)
 {
 	struct irq_domain *domain;
-	unsigned int parent_irq;
 
 	domain = __init_i8259_irqs(node);
 
-	parent_irq = irq_of_parse_and_map(node, 0);
-	if (!parent_irq) {
-		pr_err("Failed to map i8259 parent IRQ\n");
-		irq_domain_remove(domain);
-		return -ENODEV;
+	if (of_find_property(node, "plat-poll", NULL)) {
+		int i;
+
+		for (i = 0; i < 16; i++) {
+			int parent_irq = irq_of_parse_and_map(node, i);
+
+			if (!parent_irq) {
+				pr_err("Failed to map %d plat-poll i8259 parent IRQ\n", i);
+				irq_domain_remove(domain);
+				return -ENODEV;
+			}
+			plat_poll_priv[i].domain = domain;
+			plat_poll_priv[i].hwirq = i;
+			irq_set_chained_handler_and_data(parent_irq,
+				plat_poll_irq_dispatch,
+				&plat_poll_priv[i]);
+		}
+	} else {
+		unsigned int parent_irq;
+
+		parent_irq = irq_of_parse_and_map(node, 0);
+		if (!parent_irq) {
+			pr_err("Failed to map i8259 parent IRQ\n");
+			irq_domain_remove(domain);
+			return -ENODEV;
 	}
 
 	irq_set_chained_handler_and_data(parent_irq, i8259_irq_dispatch,
 					 domain);
+	}
 	return 0;
 }
 IRQCHIP_DECLARE(i8259, "intel,i8259", i8259_of_init);
-- 
2.22.0

