Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF7D1F243
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2019 14:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730194AbfEOMBU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 May 2019 08:01:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730066AbfEOLOI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 May 2019 07:14:08 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7005820862;
        Wed, 15 May 2019 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557918847;
        bh=53h/qjjxNcbShhTthqx19K0XQn9X+ml3ZCdPOFaCXBc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L3fLRjMLZmbitvekvpIYv0vxiXr7vIFZjp06hkekDEAaTvT6KiFx3dQUeDJruMWg1
         LDSvgbYSetd1PwJi1Xy9mR/q7VXwG4ITdDV9Nsd8XsdcSaSykxhRLzWdB3bQcHOTZV
         wIRd0JmhjM4fH/JJ2hK9tk0FozvdFpjs6rleTVpA=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Kevin ldir Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
        John Crispin <john@phrozen.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.9 22/51] MIPS: perf: ath79: Fix perfcount IRQ assignment
Date:   Wed, 15 May 2019 12:55:57 +0200
Message-Id: <20190515090623.646690226@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190515090616.669619870@linuxfoundation.org>
References: <20190515090616.669619870@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[ Upstream commit a1e8783db8e0d58891681bc1e6d9ada66eae8e20 ]

Currently it's not possible to use perf on ath79 due to genirq flags
mismatch happening on static virtual IRQ 13 which is used for
performance counters hardware IRQ 5.

On TP-Link Archer C7v5:

           CPU0
  2:          0      MIPS   2  ath9k
  4:        318      MIPS   4  19000000.eth
  7:      55034      MIPS   7  timer
  8:       1236      MISC   3  ttyS0
 12:          0      INTC   1  ehci_hcd:usb1
 13:          0  gpio-ath79   2  keys
 14:          0  gpio-ath79   5  keys
 15:         31  AR724X PCI    1  ath10k_pci

 $ perf top
 genirq: Flags mismatch irq 13. 00014c83 (mips_perf_pmu) vs. 00002003 (keys)

On TP-Link Archer C7v4:

         CPU0
  4:          0      MIPS   4  19000000.eth
  5:       7135      MIPS   5  1a000000.eth
  7:      98379      MIPS   7  timer
  8:         30      MISC   3  ttyS0
 12:      90028      INTC   0  ath9k
 13:       5520      INTC   1  ehci_hcd:usb1
 14:       4623      INTC   2  ehci_hcd:usb2
 15:      32844  AR724X PCI    1  ath10k_pci
 16:          0  gpio-ath79  16  keys
 23:          0  gpio-ath79  23  keys

 $ perf top
 genirq: Flags mismatch irq 13. 00014c80 (mips_perf_pmu) vs. 00000080 (ehci_hcd:usb1)

This problem is happening, because currently statically assigned virtual
IRQ 13 for performance counters is not claimed during the initialization
of MIPS PMU during the bootup, so the IRQ subsystem doesn't know, that
this interrupt isn't available for further use.

So this patch fixes the issue by simply booking hardware IRQ 5 for MIPS PMU.

Tested-by: Kevin 'ldir' Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>
Signed-off-by: Petr Štetiar <ynezz@true.cz>
Acked-by: John Crispin <john@phrozen.org>
Acked-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: linux-mips@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/ath79/setup.c          |  6 ------
 drivers/irqchip/irq-ath79-misc.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 26a058d58d37b..c7c31e2148136 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -183,12 +183,6 @@ const char *get_system_type(void)
 	return ath79_sys_type;
 }
 
-int get_c0_perfcount_int(void)
-{
-	return ATH79_MISC_IRQ(5);
-}
-EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
-
 unsigned int get_c0_compare_int(void)
 {
 	return CP0_LEGACY_COMPARE_IRQ;
diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index aa72907846360..0390603170b40 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -22,6 +22,15 @@
 #define AR71XX_RESET_REG_MISC_INT_ENABLE	4
 
 #define ATH79_MISC_IRQ_COUNT			32
+#define ATH79_MISC_PERF_IRQ			5
+
+static int ath79_perfcount_irq;
+
+int get_c0_perfcount_int(void)
+{
+	return ath79_perfcount_irq;
+}
+EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
 
 static void ath79_misc_irq_handler(struct irq_desc *desc)
 {
@@ -113,6 +122,8 @@ static void __init ath79_misc_intc_domain_init(
 {
 	void __iomem *base = domain->host_data;
 
+	ath79_perfcount_irq = irq_create_mapping(domain, ATH79_MISC_PERF_IRQ);
+
 	/* Disable and clear all interrupts */
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_ENABLE);
 	__raw_writel(0, base + AR71XX_RESET_REG_MISC_INT_STATUS);
-- 
2.20.1



