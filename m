Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AADDC8AC99
	for <lists+linux-mips@lfdr.de>; Tue, 13 Aug 2019 04:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfHMCNc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 22:13:32 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42234 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726488AbfHMCNc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 22:13:32 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A4171CD0CBA6D6613AF4;
        Tue, 13 Aug 2019 09:57:01 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Tue, 13 Aug 2019
 09:56:50 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>,
        <paul@crapouillou.net>, <malat@debian.org>, <paul.burton@mips.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] irqchip/irq-ingenic-tcu: Fix COMPILE_TEST building
Date:   Tue, 13 Aug 2019 09:56:02 +0800
Message-ID: <20190813015602.30576-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While do COMPILE_TEST building, if GENERIC_IRQ_CHIP is
not selected, it fails:

drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_intc_cascade':
irq-ingenic-tcu.c:(.text+0x13f): undefined reference to `irq_get_domain_generic_chip'
drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_irq_init':
irq-ingenic-tcu.c:(.init.text+0x97): undefined reference to `irq_generic_chip_ops'
irq-ingenic-tcu.c:(.init.text+0xdd): undefined reference to `__irq_alloc_domain_generic_chips'
irq-ingenic-tcu.c:(.init.text+0x10b): undefined reference to `irq_get_domain_generic_chip'

select GENERIC_IRQ_CHIP to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 9536eba03ec7 ("irqchip: Add irq-ingenic-tcu driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 3c8308e..ccbb897 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -320,6 +320,7 @@ config INGENIC_TCU_IRQ
 	default MACH_INGENIC
 	depends on MIPS || COMPILE_TEST
 	select MFD_SYSCON
+	select GENERIC_IRQ_CHIP
 	help
 	  Support for interrupts in the Timer/Counter Unit (TCU) of the Ingenic
 	  JZ47xx SoCs.
-- 
2.7.4


