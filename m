Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFF17A4A4D
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfIAP42 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:56:28 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58208 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728644AbfIAP42 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:56:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D0EC1402D7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:56:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PwB4B-iIvV_b for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:56:25 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 2A5B43FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:56:25 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:56:24 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 051/120] MIPS: PS2: IOP: I/O processor DMA register PCR2 set
 and clear
Message-ID: <ea6398e79f28fc4f77fcd85b5258393fa7c9a07b.1567326213.git.noring@nocrew.org>
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

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
The documentation for the DEV9 is rather poor, unfortunately.
---
 .../mips/include/asm/mach-ps2/iop-registers.h | 19 +++++++++
 drivers/ps2/Makefile                          |  1 +
 drivers/ps2/iop-registers.c                   | 39 +++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-registers.h
 create mode 100644 drivers/ps2/Makefile
 create mode 100644 drivers/ps2/iop-registers.c

diff --git a/arch/mips/include/asm/mach-ps2/iop-registers.h b/arch/mips/include/asm/mach-ps2/iop-registers.h
new file mode 100644
index 000000000000..b4db423150de
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/iop-registers.h
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 I/O processor (IOP) registers
+ *
+ * Copyright (C) 2017-2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_IOP_REGISTERS_H
+#define __ASM_MACH_PS2_IOP_REGISTERS_H
+
+#include <linux/types.h>
+
+#define IOP_DMA_DPCR2_OHCI	0x08000000	/* USB OHCI */
+#define IOP_DMA_DPCR2_DEV9	0x00000080	/* DEV9 (Expansion Bay, USB) */
+
+void iop_set_dma_dpcr2(const u32 mask);
+void iop_clr_dma_dpcr2(const u32 mask);
+
+#endif /* __ASM_MACH_PS2_IOP_REGISTERS_H */
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
new file mode 100644
index 000000000000..e53976ddb3e4
--- /dev/null
+++ b/drivers/ps2/Makefile
@@ -0,0 +1 @@
+obj-m				+= iop-registers.o
diff --git a/drivers/ps2/iop-registers.c b/drivers/ps2/iop-registers.c
new file mode 100644
index 000000000000..0ea7603b91a3
--- /dev/null
+++ b/drivers/ps2/iop-registers.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 I/O processor (IOP) registers
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/module.h>
+#include <linux/spinlock.h>
+
+#include <asm/io.h>
+
+#include <asm/mach-ps2/iop-registers.h>
+
+#define IOP_DMA_DPCR2	0x1f801570
+
+static DEFINE_SPINLOCK(reg_lock);
+
+void iop_set_dma_dpcr2(const u32 mask)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&reg_lock, flags);
+	outl(inl(IOP_DMA_DPCR2) | mask, IOP_DMA_DPCR2);
+	spin_unlock_irqrestore(&reg_lock, flags);
+}
+EXPORT_SYMBOL_GPL(iop_set_dma_dpcr2);
+
+void iop_clr_dma_dpcr2(const u32 mask)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&reg_lock, flags);
+	outl(inl(IOP_DMA_DPCR2) & ~mask, IOP_DMA_DPCR2);
+	spin_unlock_irqrestore(&reg_lock, flags);
+}
+EXPORT_SYMBOL_GPL(iop_clr_dma_dpcr2);
+
+MODULE_LICENSE("GPL");
-- 
2.21.0

