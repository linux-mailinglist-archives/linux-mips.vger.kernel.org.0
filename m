Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E526889E
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 14:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbfGOMKi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 08:10:38 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25590 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfGOMKi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 08:10:38 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563192618; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=dXOo4vKMB+CxVgvoCMhmlsskZ0XWdy4NL1dSYUKWhqgOoNz1lQHjxIChjl2cpus4AqAkhNKGIwDLx06xCD5iff6HXKMq/ntCyFez3WK0OMtqX3uxoiRaeKp3Zj0G7rAJt2zhIMFnLT7Kpz8rx/DPMl3LsJjtVl76AQ9Vd8IlJKs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563192618; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=m/aL0to7/JF4dJlx4u5CY0Kt+iNyLQJ9D8Os6Q/mHHs=; 
        b=FxuNFapk03Q9gOetcxhK92U3KNQUduz2UVgA4MdA1v82Mfs46eY6f3Y4nGon7MDhgI+H2CJ7ds4IAR3Tg2s92/xTwLv9j6wLS3u1GierrOXwPz9jeVl5rNkbeMXUWkEBj9+jvs0RQtmwtE+FrZ8d+juoKGHID/PPYGQWlw0izt0=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=kQ2/EIK34gBkL9kQtvEzfWsMQrCHBiLosDVWUO90NtO8sROEMtYM7WHymkKaIiNoInZ6jL59wsyc
    c2SYS8kkKofC7eq424twWmSKaA4Tuw4EmgKAJipJS4p1azCgAD9E  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563192618;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2906; bh=m/aL0to7/JF4dJlx4u5CY0Kt+iNyLQJ9D8Os6Q/mHHs=;
        b=l/L987QVrsgKAPT/tBW2UVvhU1YbI4VmnNVXMtJXb/pFctiiAWtZA3P3wNUthdI9
        MQCSS/18kzZ0yu1gVRc+Ynl3yJHhPnypX6IGq9LPiKOWmD7n/12YPHzMpIgD3YUnXYw
        0crC3K0P+JHBFJLkMEOAe56rPks+S0gjZLtQWVsA=
Received: from zhouyanjie-virtual-machine.localdomain (117.136.70.36 [117.136.70.36]) by mx.zohomail.com
        with SMTPS id 1563192617341761.7077802665376; Mon, 15 Jul 2019 05:10:17 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH v3 1/8] irqchip: Ingenic: Change interrupt handling form cascade to chained_irq.
Date:   Mon, 15 Jul 2019 20:09:48 +0800
Message-Id: <1563192595-53546-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The interrupt handling method is changed from old-style cascade to
chained_irq which is more appropriate. Also, it can process the
corner situation that more than one irq is coming to a single
chip at the same time.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index f126255..49f7685 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 platform IRQ support
+ *  Ingenic XBurst platform IRQ support
  */
 
 #include <linux/errno.h>
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqchip/ingenic.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
@@ -32,22 +33,34 @@ struct ingenic_intc_data {
 #define JZ_REG_INTC_PENDING	0x10
 #define CHIP_SIZE		0x20
 
-static irqreturn_t intc_cascade(int irq, void *data)
+static void ingenic_chained_handle_irq(struct irq_desc *desc)
 {
-	struct ingenic_intc_data *intc = irq_get_handler_data(irq);
-	uint32_t irq_reg;
+	struct ingenic_intc_data *intc = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	bool have_irq = false;
+	uint32_t pending;
 	unsigned i;
 
+	chained_irq_enter(chip, desc);
 	for (i = 0; i < intc->num_chips; i++) {
-		irq_reg = readl(intc->base + (i * CHIP_SIZE) +
+		pending = readl(intc->base + (i * CHIP_SIZE) +
 				JZ_REG_INTC_PENDING);
-		if (!irq_reg)
+		if (!pending)
 			continue;
 
-		generic_handle_irq(__fls(irq_reg) + (i * 32) + JZ4740_IRQ_BASE);
+		have_irq = true;
+		while (pending) {
+			int bit = __fls(pending);
+
+			generic_handle_irq(bit + (i * 32) + JZ4740_IRQ_BASE);
+			pending &= ~BIT(bit);
+		}
 	}
 
-	return IRQ_HANDLED;
+	if (!have_irq)
+		spurious_interrupt();
+
+	chained_irq_exit(chip, desc);
 }
 
 static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t mask)
@@ -70,11 +83,6 @@ void ingenic_intc_irq_resume(struct irq_data *data)
 	intc_irq_set_mask(gc, gc->mask_cache);
 }
 
-static struct irqaction intc_cascade_action = {
-	.handler = intc_cascade,
-	.name = "SoC intc cascade interrupt",
-};
-
 static int __init ingenic_intc_of_init(struct device_node *node,
 				       unsigned num_chips)
 {
@@ -139,7 +147,8 @@ static int __init ingenic_intc_of_init(struct device_node *node,
 	if (!domain)
 		pr_warn("unable to register IRQ domain\n");
 
-	setup_irq(parent_irq, &intc_cascade_action);
+	irq_set_chained_handler_and_data(parent_irq,
+					ingenic_chained_handle_irq, intc);
 	return 0;
 
 out_unmap_irq:
-- 
2.7.4


