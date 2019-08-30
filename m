Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89403A2E76
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfH3Ed3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:33:29 -0400
Received: from forward105j.mail.yandex.net ([5.45.198.248]:50092 "EHLO
        forward105j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725901AbfH3Ed3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:33:29 -0400
Received: from mxback24g.mail.yandex.net (mxback24g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:324])
        by forward105j.mail.yandex.net (Yandex) with ESMTP id 2D1C7B20F00;
        Fri, 30 Aug 2019 07:33:26 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback24g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id pV7fdG72ZP-XPx48VYU;
        Fri, 30 Aug 2019 07:33:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139606;
        bh=GDPLbh2Za9If16kngBr0Vy91wenOeOyR+BDWVi+j/l8=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=A1CaHrZ6HcOfJhzZS+4BFCM2kqsP7dgmZp1mFMQQvuJ5oX2+ejDQC647BIDx5NMtT
         Y1pRkbNevKcbp76LNHGWoYVqMvqRyJNWr2lxWYr+lWS8m2OOXt4oRKLDC+au6e3kts
         4sgyjAnMhs85+qrLU26B9Q47yArkXCVIm4V6z/fk=
Authentication-Results: mxback24g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-XHDGfXVO;
        Fri, 30 Aug 2019 07:33:23 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 09/18] irqchip: i8259: Add plat-poll support
Date:   Fri, 30 Aug 2019 12:32:23 +0800
Message-Id: <20190830043232.20191-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
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

