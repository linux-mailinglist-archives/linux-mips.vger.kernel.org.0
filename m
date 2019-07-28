Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E58DC780B0
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2019 19:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfG1RfL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jul 2019 13:35:11 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25535 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfG1RfL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jul 2019 13:35:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564335292; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=lra3vjJlTihpQSBPeT7fWgMc/mwYCjz/ymex5GCuDCJCo/vW8rY1bcrHbBucOn+tcd2+xfO7XYGCbXnqy1Nz97YbGKTVmDD8g6zznySBr1senN5njfsRQIxrm20swO8DHN2YRhDi8gjHO8tlhzU1Uuw0c1a7R+JEdfgpD3SUiRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564335292; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=m/aL0to7/JF4dJlx4u5CY0Kt+iNyLQJ9D8Os6Q/mHHs=; 
        b=DlzrHU1yh0stn2voJ1J2LfxBeVHNOQyAnaXm7rJG1LJkUCCx5Mkak2PoAgId2+Ln9pV2MZL/+W59NjZEs1Da+0VDwGkYloxYA1yR/aiqOImGYbJTkThWYLWI05tSVfYDaXa1IdO+MfrnGU7suL5fVHLKrvwR0BUHjo+6ei00Ego=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=F6H2TteVw8YgOKvaGC0bKKd1g/SYw8KjgE1Mr0qnkvQQcYmgpFJHAZl93jXMVrhIcUxtbWH4pJQm
    Qw+cijkDfgBd9WEJvpydEubWAs1iHsl8woERQrHcKG5j8S7K3Vyv  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564335292;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2906; bh=m/aL0to7/JF4dJlx4u5CY0Kt+iNyLQJ9D8Os6Q/mHHs=;
        b=rAYOtMve8cAGN+KeBUSfNzkMO5hx0DY496HGyyyI1t49DD0XQrpVbpekSiGXIlxp
        H3koj9TTG3+N+saF59OW56/PXjqVjTGjG26b5IyoHP9rFIjW98rwuSvoebg4l6SvxL1
        aRjnRo+/bgWpVwZokCPoQmgG9DpglrBspWWM6gu4=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564335290824742.1386333116222; Sun, 28 Jul 2019 10:34:50 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH 1/4 v4] irqchip: Ingenic: Change interrupt handling form cascade to chained_irq.
Date:   Mon, 29 Jul 2019 01:34:30 +0800
Message-Id: <1564335273-22931-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
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


