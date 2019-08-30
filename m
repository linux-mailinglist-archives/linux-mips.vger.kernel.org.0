Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF5A3A2E56
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfH3E1b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:27:31 -0400
Received: from forward106p.mail.yandex.net ([77.88.28.109]:51956 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726090AbfH3E1b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:27:31 -0400
Received: from mxback7o.mail.yandex.net (mxback7o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::21])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 28D401C80FAD;
        Fri, 30 Aug 2019 07:27:28 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [2a02:6b8:0:1a2d::28])
        by mxback7o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id bJC8x9Qs2K-RRHGCwAd;
        Fri, 30 Aug 2019 07:27:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139248;
        bh=ssU1xbXPnMavyQAKaHcnEU9cRk4yBbb7WNysTP7LPAo=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=J/JuWin799lgUrQTTTSSHU2eONXw5dpjQx3SlOIs4KOjG6f0gKjIbeoFAUgMgypQE
         Zo1PDUY+m8DwRJrTuwaEpESXRsDVwI6LMhf71XYhqIv22zaA2BbcEfjU4BLTEccrK+
         +U0Ed4PhZUYwTViGhjJzohIKk5Tu7lngJnHboaM0=
Authentication-Results: mxback7o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 77UXTEcPDw-RIT0QB2u;
        Fri, 30 Aug 2019 07:27:25 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 04/18] irqchip: Export generic chip domain map/unmap functions
Date:   Fri, 30 Aug 2019 12:25:54 +0800
Message-Id: <20190830042608.19569-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830042608.19569-1-jiaxun.yang@flygoat.com>
References: <20190830042608.19569-1-jiaxun.yang@flygoat.com>
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

