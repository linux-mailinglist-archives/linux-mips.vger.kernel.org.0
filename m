Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95BEDA4A5D
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbfIAQDq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:03:46 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58934 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAQDq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:03:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 8F0B23F53F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:03:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id egvDC5WhRQ4S for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:03:43 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D15693F52B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:03:43 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:03:43 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 065/120] MIPS: PS2: IOP: I/O processor memory support
Message-ID: <e1dc0dbb3cfb4a71aeab681f647c220da10fd445.1567326213.git.noring@nocrew.org>
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
 arch/mips/include/asm/mach-ps2/iop-memory.h | 21 ++++++++
 drivers/ps2/Makefile                        |  1 +
 drivers/ps2/iop-memory.c                    | 56 +++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-memory.h
 create mode 100644 drivers/ps2/iop-memory.c

diff --git a/arch/mips/include/asm/mach-ps2/iop-memory.h b/arch/mips/include/asm/mach-ps2/iop-memory.h
new file mode 100644
index 000000000000..6efdb490c7b9
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/iop-memory.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 I/O processor (IOP) memory
+ *
+ * Copyright (C) 2018 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_IOP_MEMORY_H
+#define __ASM_MACH_PS2_IOP_MEMORY_H
+
+#include <linux/types.h>
+
+#include <asm/mach-ps2/iop.h>
+
+iop_addr_t iop_phys_to_bus(phys_addr_t paddr);
+
+phys_addr_t iop_bus_to_phys(iop_addr_t baddr);
+
+void *iop_bus_to_virt(iop_addr_t baddr);
+
+#endif /* __ASM_MACH_PS2_IOP_MEMORY_H */
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
index ef561a802bdd..6f193007ebc6 100644
--- a/drivers/ps2/Makefile
+++ b/drivers/ps2/Makefile
@@ -1,2 +1,3 @@
+obj-m				+= iop-memory.o
 obj-m				+= iop-registers.o
 obj-m				+= sif.o
diff --git a/drivers/ps2/iop-memory.c b/drivers/ps2/iop-memory.c
new file mode 100644
index 000000000000..829d7174da0e
--- /dev/null
+++ b/drivers/ps2/iop-memory.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 input/output processor (IOP) memory
+ *
+ * Copyright (C) 2018 Fredrik Noring
+ */
+
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/dma-mapping.h>
+
+#include <asm/mach-ps2/iop-memory.h>
+
+/**
+ * iop_phys_to_bus - kernel physical to I/O processor (IOP) bus address
+ * @paddr: kernel physical address
+ *
+ * Context: any
+ * Return: I/O processor (IOP) bus address
+ */
+iop_addr_t iop_phys_to_bus(phys_addr_t paddr)
+{
+	return (u32)paddr - IOP_RAM_BASE;
+}
+EXPORT_SYMBOL(iop_phys_to_bus);
+
+/**
+ * iop_bus_to_phys - I/O processor (IOP) bus address to kernel physical
+ * @baddr: I/O processor (IOP) bus address
+ *
+ * Context: any
+ * Return: kernel physical address
+ */
+phys_addr_t iop_bus_to_phys(iop_addr_t baddr)
+{
+	return (u32)baddr + IOP_RAM_BASE;
+}
+EXPORT_SYMBOL(iop_bus_to_phys);
+
+/**
+ * iop_bus_to_virt - I/O processor (IOP) bus address to kernel virtual
+ * @baddr: I/O processor (IOP) bus address
+ *
+ * Context: any
+ * Return: kernel virtual address
+ */
+void *iop_bus_to_virt(iop_addr_t baddr)
+{
+	return phys_to_virt(iop_bus_to_phys(baddr));
+}
+EXPORT_SYMBOL(iop_bus_to_virt);
+
+MODULE_DESCRIPTION("PlayStation 2 input/output processor (IOP) memory");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

