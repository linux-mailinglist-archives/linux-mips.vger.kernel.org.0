Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B500A4AA4
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbfIAQfM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:35:12 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:45588 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQfM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:35:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 56DBF3F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:35:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id J-TUNSvu7yIo for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:35:09 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 84DF83F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:35:09 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:35:09 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 112/120] USB: OHCI: Support for the PlayStation 2
Message-ID: <abe0bcd3a39bfc6381d6148b6cb06ad0013c6faa.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Support the USB 1.1 OHCI for the PlayStation 2. The controller is
connected to the input/output processor (IOP) which is separate from
the main (R5900) processor that runs the kernel.

IOP DMA memory and OHCI registers are mapped into kernel address space.
OHCI interrupts are asserted on the IOP and forwarded to the kernel by
an IOP IRQ relay module.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/usb/host/Kconfig    |   8 ++
 drivers/usb/host/Makefile   |   1 +
 drivers/usb/host/ohci-ps2.c | 245 ++++++++++++++++++++++++++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100644 drivers/usb/host/ohci-ps2.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 40b5de597112..5b3b138006cd 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -552,6 +552,14 @@ config USB_OHCI_EXYNOS
 	help
 	 Enable support for the Samsung Exynos SOC's on-chip OHCI controller.
 
+config USB_OHCI_HCD_PS2
+	tristate "OHCI support for the Sony PlayStation 2"
+	depends on SONY_PS2
+	select GENERIC_ALLOCATOR
+	default y
+	help
+	 Enable support for the Sony PlayStation 2 OHCI controller.
+
 config USB_CNS3XXX_OHCI
 	bool "Cavium CNS3XXX OHCI Module (DEPRECATED)"
 	depends on ARCH_CNS3XXX
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 84514f71ae44..9ed4e0fa6657 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_USB_OHCI_HCD_S3C2410)	+= ohci-s3c2410.o
 obj-$(CONFIG_USB_OHCI_HCD_LPC32XX)	+= ohci-nxp.o
 obj-$(CONFIG_USB_OHCI_HCD_PXA27X)	+= ohci-pxa27x.o
 obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
+obj-$(CONFIG_USB_OHCI_HCD_PS2)	+= ohci-ps2.o
 
 obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
 obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
diff --git a/drivers/usb/host/ohci-ps2.c b/drivers/usb/host/ohci-ps2.c
new file mode 100644
index 000000000000..a1d446313c13
--- /dev/null
+++ b/drivers/usb/host/ohci-ps2.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 USB 1.1 OHCI host controller (HCD)
+ *
+ * Copyright (C) 2017 Jürgen Urban
+ * Copyright (C) 2018 Fredrik Noring
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
+#include <asm/mach-ps2/iop-heap.h>
+#include <asm/mach-ps2/iop-memory.h>
+#include <asm/mach-ps2/iop-registers.h>
+
+#include "ohci.h"
+
+#define DRIVER_DESC "PlayStation 2 USB OHCI host controller"
+#define DRV_NAME "ohci-ps2"
+
+/* Size allocated from IOP heap (maximum size of DMA memory). */
+#define DMA_BUFFER_SIZE (256 * 1024)
+
+#define hcd_to_priv(hcd) ((struct ps2_hcd *)(hcd_to_ohci(hcd)->priv))
+
+/**
+ * struct ps2_hcd - private device driver structure
+ * @iop_dma_addr: input/output processor (IOP) DMA buffer address
+ */
+struct ps2_hcd {
+	dma_addr_t iop_dma_addr;
+};
+
+static struct hc_driver __read_mostly ohci_ps2_hc_driver;
+
+static void ohci_ps2_enable(struct usb_hcd *hcd)
+{
+	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
+
+	ohci_writel(ohci, 1, &ohci->regs->roothub.portstatus[11]);
+}
+
+static void ohci_ps2_disable(struct usb_hcd *hcd)
+{
+	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
+
+	ohci_writel(ohci, 0, &ohci->regs->roothub.portstatus[11]);
+}
+
+static void ohci_ps2_start_hc(struct usb_hcd *hcd)
+{
+	iop_set_dma_dpcr2(IOP_DMA_DPCR2_OHCI);
+
+	outw(1, IOP_OHCI_BASE + 0x80);
+}
+
+static void ohci_ps2_stop_hc(struct usb_hcd *hcd)
+{
+	iop_clr_dma_dpcr2(IOP_DMA_DPCR2_OHCI);
+}
+
+static int ohci_ps2_reset(struct usb_hcd *hcd)
+{
+	int err;
+
+	ohci_ps2_start_hc(hcd);
+
+	err = ohci_setup(hcd);
+	if (err) {
+		ohci_ps2_stop_hc(hcd);
+		return err;
+	}
+
+	ohci_ps2_enable(hcd);
+
+	return 0;
+}
+
+static int iopheap_alloc_dma_buffer(struct platform_device *pdev, size_t size)
+{
+	struct device *dev = &pdev->dev;
+	struct usb_hcd *hcd = platform_get_drvdata(pdev);
+	struct ps2_hcd *ps2priv = hcd_to_priv(hcd);
+	int err;
+
+	ps2priv->iop_dma_addr = iop_alloc(size);
+	if (!ps2priv->iop_dma_addr) {
+		dev_err(dev, "iop_alloc failed\n");
+		return -ENOMEM;
+	}
+
+	err = usb_hcd_setup_local_mem(hcd,
+		iop_bus_to_phys(ps2priv->iop_dma_addr),
+		ps2priv->iop_dma_addr, size);
+	if (err) {
+		dev_err(dev, "usb_hcd_setup_local_mem failed with %d\n", err);
+		iop_free(ps2priv->iop_dma_addr);
+		ps2priv->iop_dma_addr = 0;
+		return err;
+	}
+
+	return 0;
+}
+
+static void iopheap_free_dma_buffer(struct platform_device *pdev)
+{
+	struct usb_hcd *hcd = platform_get_drvdata(pdev);
+	struct ps2_hcd *ps2priv = hcd_to_priv(hcd);
+
+	if (!ps2priv->iop_dma_addr)
+		return;
+
+	iop_free(ps2priv->iop_dma_addr);
+	ps2priv->iop_dma_addr = 0;
+}
+
+static int ohci_hcd_ps2_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *regs;
+	struct usb_hcd *hcd;
+	struct ps2_hcd *ps2priv;
+	int irq;
+	int err;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "platform_get_irq failed\n");
+		return irq;
+	}
+
+	hcd = usb_create_hcd(&ohci_ps2_hc_driver, dev, dev_name(dev));
+	if (!hcd) {
+		dev_err(dev, "usb_create_hcd failed\n");
+		return -ENOMEM;
+	}
+
+	ps2priv = hcd_to_priv(hcd);
+	memset(ps2priv, 0, sizeof(*ps2priv));
+
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!regs) {
+		dev_err(dev, "platform_get_resource 0 failed\n");
+		err = -ENOENT;
+		goto err_platform;
+	}
+
+	hcd->rsrc_start = regs->start;
+	hcd->rsrc_len = resource_size(regs);
+	hcd->regs = ioremap(hcd->rsrc_start, hcd->rsrc_len);
+	if (IS_ERR(hcd->regs)) {
+		err = PTR_ERR(hcd->regs);
+		dev_err(dev, "ioremap failed with %d\n", err);
+		goto err_ioremap;
+	}
+
+	err = iopheap_alloc_dma_buffer(pdev, DMA_BUFFER_SIZE);
+	if (err)
+		goto err_alloc_dma_buffer;
+
+	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
+	if (err) {
+		dev_err(dev, "usb_add_hcd failed with %d\n", err);
+		goto err_add_hcd;
+	}
+
+	err = device_wakeup_enable(hcd->self.controller);
+	if (err) {
+		dev_err(dev, "device_wakeup_enable failed with %d\n", err);
+		goto err_wakeup;
+	}
+
+	return 0;
+
+err_wakeup:
+	usb_remove_hcd(hcd);
+err_add_hcd:
+	iopheap_free_dma_buffer(pdev);
+err_alloc_dma_buffer:
+	iounmap(hcd->regs);
+err_ioremap:
+err_platform:
+	usb_put_hcd(hcd);
+	return err;
+}
+
+static int ohci_hcd_ps2_remove(struct platform_device *pdev)
+{
+	struct usb_hcd *hcd = platform_get_drvdata(pdev);
+
+	usb_remove_hcd(hcd);
+
+	ohci_ps2_disable(hcd);
+	ohci_ps2_stop_hc(hcd);
+
+	iopheap_free_dma_buffer(pdev);
+	iounmap(hcd->regs);
+
+	usb_put_hcd(hcd);
+
+	return 0;
+}
+
+static struct platform_driver ohci_hcd_ps2_driver = {
+	.probe		= ohci_hcd_ps2_probe,
+	.remove		= ohci_hcd_ps2_remove,
+	.shutdown	= usb_hcd_platform_shutdown,
+	.driver		= {
+		.name	= DRV_NAME,
+	},
+};
+
+static const struct ohci_driver_overrides ps2_overrides __initconst = {
+	.reset		= ohci_ps2_reset,
+	.product_desc	= DRIVER_DESC,
+	.extra_priv_size = sizeof(struct ps2_hcd),
+};
+
+static int __init ohci_ps2_init(void)
+{
+	if (usb_disabled()) {
+		pr_err(DRV_NAME ": Initialization failed: USB is disabled\n");
+		return -ENODEV;
+	}
+
+	ohci_init_driver(&ohci_ps2_hc_driver, &ps2_overrides);
+
+	return platform_driver_register(&ohci_hcd_ps2_driver);
+}
+module_init(ohci_ps2_init);
+
+static void __exit ohci_ps2_exit(void)
+{
+	platform_driver_unregister(&ohci_hcd_ps2_driver);
+}
+module_exit(ohci_ps2_exit);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_AUTHOR("Jürgen Urban");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.21.0

