Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 378BDA4AA7
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbfIAQfs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:35:48 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:60782 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfIAQfs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:35:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 17EC13F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:35:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pR8RBlBRDiXy for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:35:45 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 6225D3F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:35:45 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:35:45 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 115/120] MIPS: PS2: Define initial PlayStation 2 devices
Message-ID: <42b5ac5dc3f4ea9f5ac57f4abc142bdd52a3d494.1567326213.git.noring@nocrew.org>
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

Only the real-time clock (RTC), the input/output processor (IOP),
USB OHCI and the Graphics Synthesizer are supported at the moment.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/ps2/Makefile  |  1 +
 arch/mips/ps2/devices.c | 98 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/mips/ps2/devices.c

diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index 6f671112fbcb..925952a83625 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -1,3 +1,4 @@
+obj-y		+= devices.o
 obj-y		+= dmac-irq.o
 obj-y		+= identify.o
 obj-y		+= intc-irq.o
diff --git a/arch/mips/ps2/devices.c b/arch/mips/ps2/devices.c
new file mode 100644
index 000000000000..67aa1b158e29
--- /dev/null
+++ b/arch/mips/ps2/devices.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 devices
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/platform_device.h>
+
+#include <asm/mach-ps2/gs.h>
+#include <asm/mach-ps2/iop.h>
+#include <asm/mach-ps2/irq.h>
+
+static struct resource iop_resources[] = {
+	[0] = {
+		.name	= "IOP RAM",
+		.start	= IOP_RAM_BASE,
+		.end	= IOP_RAM_BASE + IOP_RAM_SIZE - 1,
+		.flags	= IORESOURCE_MEM,	/* 2 MiB IOP RAM */
+	},
+};
+
+static struct platform_device iop_device = {
+	.name		= "iop",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(iop_resources),
+	.resource	= iop_resources,
+};
+
+static struct resource ohci_resources[] = {	/* FIXME: Subresource to IOP */
+	[0] = {
+		.name	= "USB OHCI",
+		.start	= IOP_OHCI_BASE,
+		.end	= IOP_OHCI_BASE + 0xff,
+		.flags	= IORESOURCE_MEM, 	/* 256 byte HCCA. */
+	},
+	[1] = {
+		.start	= IRQ_IOP_USB,
+		.end	= IRQ_IOP_USB,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device ohci_device = {
+	.name		= "ohci-ps2",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(ohci_resources),
+	.resource	= ohci_resources,
+};
+
+static struct resource gs_resources[] = {
+	[0] = {
+		.name	= "Graphics Synthesizer",
+		.start	= GS_REG_BASE,
+		.end	= GS_REG_BASE + 0x1ffffff,
+		.flags	= IORESOURCE_MEM,	/* FIXME: IORESOURCE_REG? */
+	},
+	[1] = {
+		.start	= IRQ_DMAC_GIF,
+		.end	= IRQ_DMAC_GIF,
+		.flags	= IORESOURCE_IRQ,
+	},
+	[2] = {
+		.start	= IRQ_GS_SIGNAL,
+		.end	= IRQ_GS_EXVSYNC,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device gs_device = {
+	.name           = "gs",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(gs_resources),
+	.resource	= gs_resources,
+};
+
+static struct platform_device rtc_device = {
+	.name		= "rtc-ps2",
+	.id		= -1,
+};
+
+static struct platform_device *ps2_platform_devices[] __initdata = {
+	&iop_device,
+	&ohci_device,
+	&gs_device,
+	&rtc_device,
+};
+
+static int __init ps2_device_setup(void)
+{
+	return platform_add_devices(ps2_platform_devices,
+		ARRAY_SIZE(ps2_platform_devices));
+}
+device_initcall(ps2_device_setup);
-- 
2.21.0

