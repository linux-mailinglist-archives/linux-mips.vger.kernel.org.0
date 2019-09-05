Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6DA7AA633
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388676AbfIEOoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:44:46 -0400
Received: from forward105o.mail.yandex.net ([37.140.190.183]:51539 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388474AbfIEOoq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:44:46 -0400
Received: from mxback10j.mail.yandex.net (mxback10j.mail.yandex.net [IPv6:2a02:6b8:0:1619::113])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id 6C98142010A4;
        Thu,  5 Sep 2019 17:44:44 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback10j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id Mx1wCsv1Ga-ihGu1rMU;
        Thu, 05 Sep 2019 17:44:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694684;
        bh=ssU1xbXPnMavyQAKaHcnEU9cRk4yBbb7WNysTP7LPAo=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=ELF6ct16o2sVxpuqKGQyQjY9ck9pDcWZBHY+5VX4/71GOqmFlVWJVWnZDLIPNEa04
         aXYmci2/ZEb/wcqj66nJ2z+pHQdwe5u4KXyXb+mZmFHgBD4oWSFRDG+Yu+gL/4EMgu
         SnxKJqewBVT2Dl+briqV7T6B++Mi0wiqc2l9g0o8=
Authentication-Results: mxback10j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-iWxWGQE5;
        Thu, 05 Sep 2019 17:44:41 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 04/19] irqchip: Export generic chip domain map/unmap functions
Date:   Thu,  5 Sep 2019 22:43:01 +0800
Message-Id: <20190905144316.12527-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Export irq_map_generic_chip, irq_unmap_generic_chip so drivers
can use them to construct their own generic chip domain ops.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 include/linux/irq.h       | 1 +
 kernel/irq/generic-chip.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index fb301cf29148..3637c24046e1 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1060,6 +1060,7 @@ int irq_gc_set_wake(struct irq_data *d, unsigned int on);
 /* Setup functions for irq_chip_generic */
 int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 			 irq_hw_number_t hw_irq);
+void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq);
 struct irq_chip_generic *
 irq_alloc_generic_chip(const char *name, int nr_ct, unsigned int irq_base,
 		       void __iomem *reg_base, irq_flow_handler_t handler);
diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
index e2999a070a99..211b15c0d647 100644
--- a/kernel/irq/generic-chip.c
+++ b/kernel/irq/generic-chip.c
@@ -423,8 +423,9 @@ int irq_map_generic_chip(struct irq_domain *d, unsigned int virq,
 	irq_modify_status(virq, dgc->irq_flags_to_clear, dgc->irq_flags_to_set);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(irq_map_generic_chip);
 
-static void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq)
+void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq)
 {
 	struct irq_data *data = irq_domain_get_irq_data(d, virq);
 	struct irq_domain_chip_generic *dgc = d->gc;
@@ -443,6 +444,7 @@ static void irq_unmap_generic_chip(struct irq_domain *d, unsigned int virq)
 			    NULL);
 
 }
+EXPORT_SYMBOL_GPL(irq_unmap_generic_chip);
 
 struct irq_domain_ops irq_generic_chip_ops = {
 	.map	= irq_map_generic_chip,
-- 
2.22.0

