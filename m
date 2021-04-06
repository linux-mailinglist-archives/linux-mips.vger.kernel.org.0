Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8D435500D
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 11:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244902AbhDFJg6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 05:36:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244879AbhDFJgc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 05:36:32 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 197BC613C3;
        Tue,  6 Apr 2021 09:36:25 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lTi8F-005owA-CS; Tue, 06 Apr 2021 10:36:23 +0100
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
Subject: [PATCH 2/9] ARM: PXA: Kill use of irq_create_strict_mappings()
Date:   Tue,  6 Apr 2021 10:35:50 +0100
Message-Id: <20210406093557.1073423-3-maz@kernel.org>
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
a linear IRQ domain as a legacy one. Let's be upfront about
it and use a legacy domain when appropriate.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm/mach-pxa/pxa_cplds_irqs.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-pxa/pxa_cplds_irqs.c b/arch/arm/mach-pxa/pxa_cplds_irqs.c
index 45c19ca96f7a..ec0d9b094744 100644
--- a/arch/arm/mach-pxa/pxa_cplds_irqs.c
+++ b/arch/arm/mach-pxa/pxa_cplds_irqs.c
@@ -147,22 +147,20 @@ static int cplds_probe(struct platform_device *pdev)
 	}
 
 	irq_set_irq_wake(fpga->irq, 1);
-	fpga->irqdomain = irq_domain_add_linear(pdev->dev.of_node,
-					       CPLDS_NB_IRQ,
-					       &cplds_irq_domain_ops, fpga);
+	if (base_irq)
+		fpga->irqdomain = irq_domain_add_legacy(pdev->dev.of_node,
+							CPLDS_NB_IRQ,
+							base_irq, 0,
+							&cplds_irq_domain_ops,
+							fpga);
+	else
+		fpga->irqdomain = irq_domain_add_linear(pdev->dev.of_node,
+							CPLDS_NB_IRQ,
+							&cplds_irq_domain_ops,
+							fpga);
 	if (!fpga->irqdomain)
 		return -ENODEV;
 
-	if (base_irq) {
-		ret = irq_create_strict_mappings(fpga->irqdomain, base_irq, 0,
-						 CPLDS_NB_IRQ);
-		if (ret) {
-			dev_err(&pdev->dev, "couldn't create the irq mapping %d..%d\n",
-				base_irq, base_irq + CPLDS_NB_IRQ);
-			return ret;
-		}
-	}
-
 	return 0;
 }
 
-- 
2.29.2

