Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC8235500E
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 11:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244907AbhDFJhB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 05:37:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244883AbhDFJgd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 05:36:33 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0EE7613C2;
        Tue,  6 Apr 2021 09:36:25 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lTi8F-005owA-TP; Tue, 06 Apr 2021 10:36:24 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org
Cc:     Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 3/9] irqchip/jcore-aic: Kill use of irq_create_strict_mappings()
Date:   Tue,  6 Apr 2021 10:35:51 +0100
Message-Id: <20210406093557.1073423-4-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210406093557.1073423-1-maz@kernel.org>
References: <20210406093557.1073423-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, daniel@zonque.org, robert.jarzmik@free.fr, haojian.zhuang@gmail.com, ysato@users.sourceforge.jp, dalias@libc.org, tsbogend@alpha.franken.de, mpe@ellerman.id.au, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

irq_create_strict_mappings() is a poor way to allow the use of
a linear IRQ domain as a legacy one. Let's be upfront about it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-jcore-aic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-jcore-aic.c b/drivers/irqchip/irq-jcore-aic.c
index 033bccb41455..5f47d8ee4ae3 100644
--- a/drivers/irqchip/irq-jcore-aic.c
+++ b/drivers/irqchip/irq-jcore-aic.c
@@ -100,11 +100,11 @@ static int __init aic_irq_of_init(struct device_node *node,
 	jcore_aic.irq_unmask = noop;
 	jcore_aic.name = "AIC";
 
-	domain = irq_domain_add_linear(node, dom_sz, &jcore_aic_irqdomain_ops,
+	domain = irq_domain_add_legacy(node, dom_sz - min_irq, min_irq, min_irq,
+				       &jcore_aic_irqdomain_ops,
 				       &jcore_aic);
 	if (!domain)
 		return -ENOMEM;
-	irq_create_strict_mappings(domain, min_irq, min_irq, dom_sz - min_irq);
 
 	return 0;
 }
-- 
2.29.2

