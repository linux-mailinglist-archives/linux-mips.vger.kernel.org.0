Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68376688A1
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 14:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730029AbfGOMKs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 08:10:48 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25597 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfGOMKs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 08:10:48 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563192622; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=mc7fodE0MowYqZYibISr5iAIysEwnOmeCmZr2h6tuNhHAut4QX1cQnW1J6I2Vag5ZCwNE2pm/Ey9zMO9TcLPBiRIY4w6V7grM5m0rYPU1i52AaL0VTKPnng/OPauIB3WQcyiEWRJ4ajvB9vv/yGG56cFdBKADPYX1dbDVS8yNsg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563192622; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=V5qObMXUjhJHo2UBczLwj4TPm2Z11EB7/1xGdRBJB+o=; 
        b=E62MM3HhE3VCfleMIqDns/G0QqYWMThLbx0E7OxSHV2Qw4PfKQy+apG0/f9AA0OolJwVEk2zaasCFQF6A8r0JKDg106SM+xG1EYV8bwdAqoPSZbo3I2vMXlA+PL1aiLAHPY/e85ScjAvQ8Dg6wQSlVpMUNRkCJSg9Xoyi4XjPE0=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=oJdpzyfvdo89RHHSeLbgQgmpQWXJWE1Hs4r13QLsYiXfb4cq7h1wnweCuelSol3HzrA65YjlMVfN
    akjNwyShpS+6qTCb3dtSRWN8Ik9fBziTpbfASBqC9PIuaeE/jKTc  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563192622;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1406; bh=V5qObMXUjhJHo2UBczLwj4TPm2Z11EB7/1xGdRBJB+o=;
        b=bhoitKHsJHPxKohDCfOpEw9VBN6bbxg6HKlSVvomg0lTcgQrPCDXqms2VtNbdSFP
        aCi9ZphBVFygoyViEU7jUbrDiu1t+1bobJpipSjegBtfOiteRQs6FEGsKu9tXLy/5Df
        9DkiLjHsjwQKzm8/M/Ea7vJuvgRln7D5eLstHJDg=
Received: from zhouyanjie-virtual-machine.localdomain (117.136.70.36 [117.136.70.36]) by mx.zohomail.com
        with SMTPS id 15631926217461002.4889940893237; Mon, 15 Jul 2019 05:10:21 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH v3 2/8] irqchip: Ingenic: Unify the function name prefix to "ingenic_intc_".
Date:   Mon, 15 Jul 2019 20:09:49 +0800
Message-Id: <1563192595-53546-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
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


