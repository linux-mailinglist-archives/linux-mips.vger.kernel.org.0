Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6BB6A4AA5
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfIAQfV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:35:21 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60740 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQfU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:35:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 3A9533F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:35:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fkrI8xPP0jOh for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:35:18 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 9BFB53F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:35:18 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:35:18 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 113/120] USB: OHCI: OHCI_INTR_MIE workaround for freeze on
 the PlayStation 2
Message-ID: <786e161e0e7f52ca14e635e3f1225e76b5f7833b.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

OHCI_INTR_MIE needs to be disabled, most likely due to a hardware bug.
Without it, reading a large amount of data (> 1 GB) from a mass storage
device results in a freeze.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/usb/host/ohci-ps2.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/host/ohci-ps2.c b/drivers/usb/host/ohci-ps2.c
index a1d446313c13..cdbcbe5ff34e 100644
--- a/drivers/usb/host/ohci-ps2.c
+++ b/drivers/usb/host/ohci-ps2.c
@@ -35,6 +35,7 @@ struct ps2_hcd {
 };
 
 static struct hc_driver __read_mostly ohci_ps2_hc_driver;
+static irqreturn_t (*ohci_irq)(struct usb_hcd *hcd);
 
 static void ohci_ps2_enable(struct usb_hcd *hcd)
 {
@@ -79,6 +80,21 @@ static int ohci_ps2_reset(struct usb_hcd *hcd)
 	return 0;
 }
 
+static irqreturn_t ohci_ps2_irq(struct usb_hcd *hcd)
+{
+	struct ohci_hcd	*ohci = hcd_to_ohci(hcd);
+	struct ohci_regs __iomem *regs = ohci->regs;
+
+	/*
+	 * OHCI_INTR_MIE needs to be disabled, most likely due to a
+	 * hardware bug. Without it, reading a large amount of data
+	 * (> 1 GB) from a mass storage device results in a freeze.
+	 */
+	ohci_writel(ohci, OHCI_INTR_MIE, &regs->intrdisable);
+
+	return ohci_irq(hcd);	/* Call normal IRQ handler. */
+}
+
 static int iopheap_alloc_dma_buffer(struct platform_device *pdev, size_t size)
 {
 	struct device *dev = &pdev->dev;
@@ -228,6 +244,9 @@ static int __init ohci_ps2_init(void)
 
 	ohci_init_driver(&ohci_ps2_hc_driver, &ps2_overrides);
 
+	ohci_irq = ohci_ps2_hc_driver.irq;	/* Save normal IRQ handler. */
+	ohci_ps2_hc_driver.irq = ohci_ps2_irq;	/* Install IRQ workaround. */
+
 	return platform_driver_register(&ohci_hcd_ps2_driver);
 }
 module_init(ohci_ps2_init);
-- 
2.21.0

