Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A900780B1
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2019 19:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfG1RfV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jul 2019 13:35:21 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25541 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfG1RfV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jul 2019 13:35:21 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564335294; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=hP48aYQREOxjoPQ8HykMuUfZitoQc+HC2f8jVG2KP9IdKlE67kCP9P1yLaLBMSZt+ufWEdK6mAarHiNjnjGhsBMrVa5up0hANVJIhPkqUBn30FOK3nOUQe4Dvhhl14xatxm9Aqjusxc7qs17KBd4u0szcofFMXLFngPGylIfzP0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564335294; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=V5qObMXUjhJHo2UBczLwj4TPm2Z11EB7/1xGdRBJB+o=; 
        b=ZhOgYWHA9Js7H/spF/ObLy8eijN0RNoJpcaztrgtaH74n1a5WEPLcE1dqeap7qIaRFgwCENUpOLUE0HeelZTPhZUDri6XjkSisasgGLwrkwRXykD2xxWA716mHbY1GkldUTAJ+qUbmM7B3ZnZhmYqyr3P6IHZaH4NUQjRO+qQy0=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=T3QMd2v4PaYCtfAZunrpGVTUtCY9iyLs9Vq+z4vl+3BDG97EjTDM0bwG6AM9OvJA3v6KoLa2H34s
    qWRprzGoZDSloCjKnoT4dA68pqp1XCo5ZEe3zjjo/C3B/CLn3yIp  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564335294;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1406; bh=V5qObMXUjhJHo2UBczLwj4TPm2Z11EB7/1xGdRBJB+o=;
        b=YM//d4J3u4iH310jM6kVzAs1r5B+RohXjISGuQzH3hj02m8kYFUSRk+LHOf4D1QX
        lOvI+QDSAbBs4cbguc/66MsOt4e+HFX1WTLqhsjTMb6mUgu+wCarFfV22bwldTWKxMc
        mQbhVVRF/4gA47bGIyl5ik+pS9oOhTEYStGHvQOs=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564335293912857.1698662381924; Sun, 28 Jul 2019 10:34:53 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH 2/4 v4] irqchip: Ingenic: Unify the function name prefix to "ingenic_intc_".
Date:   Mon, 29 Jul 2019 01:34:31 +0800
Message-Id: <1564335273-22931-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For the sake of uniform style, function "intc_irq_set_mask" is
changed to "ingenic_intc_intc_irq_set_mask".

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index 49f7685..8430f5a 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -63,7 +63,8 @@ static void ingenic_chained_handle_irq(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
-static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t mask)
+static void ingenic_intc_irq_set_mask(struct irq_chip_generic *gc,
+						uint32_t mask)
 {
 	struct irq_chip_regs *regs = &gc->chip_types->regs;
 
@@ -74,13 +75,13 @@ static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t mask)
 void ingenic_intc_irq_suspend(struct irq_data *data)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
-	intc_irq_set_mask(gc, gc->wake_active);
+	ingenic_intc_irq_set_mask(gc, gc->wake_active);
 }
 
 void ingenic_intc_irq_resume(struct irq_data *data)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(data);
-	intc_irq_set_mask(gc, gc->mask_cache);
+	ingenic_intc_irq_set_mask(gc, gc->mask_cache);
 }
 
 static int __init ingenic_intc_of_init(struct device_node *node,
-- 
2.7.4


