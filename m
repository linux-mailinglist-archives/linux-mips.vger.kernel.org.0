Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6B80A4A85
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbfIAQWX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:22:23 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:59582 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbfIAQWW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:22:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 6C0DC3F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:22:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ga6TsNp0kzp7 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:22:16 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id EE5853F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:22:15 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:22:15 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 085/120] MIPS: PS2: GIF: Graphics Synthesizer interface
 support
Message-ID: <e0a892b2ea062f9c6d5bda1114376803bedcbd7d.1567326213.git.noring@nocrew.org>
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
 arch/mips/include/asm/mach-ps2/gif.h |  77 +++++++++++++++++++
 drivers/ps2/Makefile                 |   1 +
 drivers/ps2/gif.c                    | 106 +++++++++++++++++++++++++++
 3 files changed, 184 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/gif.h
 create mode 100644 drivers/ps2/gif.c

diff --git a/arch/mips/include/asm/mach-ps2/gif.h b/arch/mips/include/asm/mach-ps2/gif.h
new file mode 100644
index 000000000000..2a3965bd5544
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/gif.h
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 Graphics Synthesizer interface (GIF)
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_GIF_H
+#define __ASM_MACH_PS2_GIF_H
+
+#include <asm/types.h>
+
+#include <uapi/asm/gif.h>
+
+#define GIF_CTRL	0x10003000	/* (W) GIF control */
+#define GIF_MODE	0x10003010	/* (W) GIF mode */
+#define GIF_STAT	0x10003020	/* (R) GIF status */
+
+/*
+ * These GIF registers are accessible only when stopped by the
+ * &gif_ctrl.pse flag.
+ */
+
+#define GIF_TAG0	0x10003040	/* (R) GIF tag 31:0 */
+#define GIF_TAG1	0x10003050	/* (R) GIF tag 63:32 */
+#define GIF_TAG2	0x10003060	/* (R) GIF tag 95:54 */
+#define GIF_TAG3	0x10003070	/* (R) GIF tag 127:96 */
+#define GIF_CNT		0x10003080	/* (R) GIF transfer status counter */
+#define GIF_P3CNT	0x10003090	/* (R) PATH3 transfer status counter */
+#define GIF_P3TAG	0x100030a0	/* (R) PATH3 GIF tag value */
+
+/**
+ * struct gif_ctrl - GIF control register
+ * @rst: GIF reset
+ * @pse: temporary transfer stop
+ *
+ * Writing 1 to PSE temporarily stops GIF transfers and makes it possible
+ * to read GIF registers for debugging. Writing 0 to PSE resumes transfers.
+ */
+struct gif_ctrl {
+	u32 rst : 1;
+	u32 : 2;
+	u32 pse : 1;
+	u32 : 28;
+};
+
+/**
+ * gif_writel_ctrl - write word to the GIF_CTRL register
+ * @value - 32-bit word to write
+ */
+void gif_writel_ctrl(u32 value);
+
+/**
+ * gif_write_ctrl - write structure to the GIF_CTRL register
+ * @value - structure to write
+ */
+void gif_write_ctrl(struct gif_ctrl value);
+
+/**
+ * gif_reset- reset the GIF
+ *
+ * The reset includes a delay of 100 us.
+ */
+void gif_reset(void);
+
+/**
+ * gif_wait - is the GIF ready to transfer data?
+ *
+ * FIXME: Move to ps2fb.c
+ *
+ * Return: %true if ready to transfer data, otherwise %false
+ */
+bool gif_wait(void);
+
+void gif_write(union gif_data *base_package, size_t package_count);
+
+#endif /* __ASM_MACH_PS2_GIF_H */
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
index 7f108d4ee451..9671bbe40294 100644
--- a/drivers/ps2/Makefile
+++ b/drivers/ps2/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_PS2_GS)		+= gif.o
 obj-$(CONFIG_PS2_GS)		+= gs-irq.o
 obj-$(CONFIG_PS2_GS)		+= gs-registers.o
 
diff --git a/drivers/ps2/gif.c b/drivers/ps2/gif.c
new file mode 100644
index 000000000000..b7707047e470
--- /dev/null
+++ b/drivers/ps2/gif.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 Graphics Synthesizer interface (GIF)
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/ctype.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <linux/vmalloc.h>
+
+#include <asm/cacheflush.h>
+#include <asm/io.h>
+#include <asm/page.h>
+#include <asm/uaccess.h>
+
+#include <asm/mach-ps2/dmac.h>
+#include <asm/mach-ps2/gif.h>
+#include <asm/mach-ps2/gs.h>
+
+#include <uapi/asm/gif.h>
+#include <uapi/asm/gs.h>
+
+void gif_writel_ctrl(u32 value)
+{
+	outl(value, GIF_CTRL);
+}
+EXPORT_SYMBOL_GPL(gif_writel_ctrl);
+
+void gif_write_ctrl(struct gif_ctrl value)
+{
+	u32 v;
+	memcpy(&v, &value, sizeof(v));
+	gif_writel_ctrl(v);
+}
+EXPORT_SYMBOL_GPL(gif_write_ctrl);
+
+void gif_reset(void)
+{
+	gif_write_ctrl((struct gif_ctrl) { .rst = 1 });
+
+	udelay(100);		/* 100 us */
+}
+EXPORT_SYMBOL_GPL(gif_reset);
+
+bool gif_busy(void)
+{
+	return (inl(DMAC_GIF_CHCR) & DMAC_CHCR_BUSY) != 0;
+}
+EXPORT_SYMBOL_GPL(gif_busy);
+
+bool gif_wait(void)
+{
+	size_t countout = 1000000;
+
+	while (gif_busy() && countout > 0)
+		countout--;
+
+	return countout > 0;
+}
+EXPORT_SYMBOL_GPL(gif_wait);
+
+void gif_write(union gif_data *base_package, size_t package_count)
+{
+	const size_t size = package_count * sizeof(*base_package);
+	const dma_addr_t madr = virt_to_phys(base_package);
+
+	if (!package_count)
+		return;
+
+	dma_cache_wback((unsigned long)base_package, size);
+
+	/* Wait for previous transmissions to finish. */
+	while (gif_busy())
+		;
+
+	outl(madr, DMAC_GIF_MADR);
+	outl(package_count, DMAC_GIF_QWC);
+	outl(DMAC_CHCR_SENDN, DMAC_GIF_CHCR);
+}
+EXPORT_SYMBOL_GPL(gif_write);
+
+static int __init gif_init(void)
+{
+	return 0;
+}
+
+static void __exit gif_exit(void)
+{
+}
+
+module_init(gif_init);
+module_exit(gif_exit);
+
+MODULE_DESCRIPTION("PlayStation 2 Graphics Synthesizer interface (GIF)");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

