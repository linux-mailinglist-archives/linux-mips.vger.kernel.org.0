Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D18BA4A76
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbfIAQQZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:16:25 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:43984 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbfIAQQZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:16:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id D28733F63C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:16:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id sqZkzGQXo5OL for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:16:22 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 292CD3F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:16:22 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:16:21 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 073/120] MIPS: PS2: IOP: Heap memory allocate and free
Message-ID: <e0aad3b9a5462e17e0a910aca63a356834d29673.1567326213.git.noring@nocrew.org>
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

The IOP heap memory operations are serviced by an IOP module linked from
read-only memory (ROM).

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/iop-heap.h | 19 +++++
 drivers/ps2/Makefile                      |  1 +
 drivers/ps2/iop-heap.c                    | 90 +++++++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/iop-heap.h
 create mode 100644 drivers/ps2/iop-heap.c

diff --git a/arch/mips/include/asm/mach-ps2/iop-heap.h b/arch/mips/include/asm/mach-ps2/iop-heap.h
new file mode 100644
index 000000000000..ee96e2ffba83
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/iop-heap.h
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 input/output processor (IOP) heap memory
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_IOP_HEAP_H
+#define __ASM_MACH_PS2_IOP_HEAP_H
+
+#include <linux/types.h>
+
+#include <asm/mach-ps2/iop.h>
+
+iop_addr_t iop_alloc(size_t nbyte);
+
+int iop_free(iop_addr_t baddr);
+
+#endif /* __ASM_MACH_PS2_IOP_HEAP_H */
diff --git a/drivers/ps2/Makefile b/drivers/ps2/Makefile
index b04e4d3c3374..02a5756cb059 100644
--- a/drivers/ps2/Makefile
+++ b/drivers/ps2/Makefile
@@ -1,3 +1,4 @@
+obj-m				+= iop-heap.o
 obj-m				+= iop-memory.o
 obj-m				+= iop-module.o
 obj-m				+= iop-registers.o
diff --git a/drivers/ps2/iop-heap.c b/drivers/ps2/iop-heap.c
new file mode 100644
index 000000000000..f803401f59e5
--- /dev/null
+++ b/drivers/ps2/iop-heap.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 input/output processor (IOP) heap memory
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/module.h>
+
+#include <asm/mach-ps2/iop-error.h>
+#include <asm/mach-ps2/iop-heap.h>
+#include <asm/mach-ps2/sif.h>
+
+/**
+ * enum iop_heap_rpc_ops - I/O processor (IOP) heap RPC operations
+ * @rpo_alloc: allocate IOP memory
+ * @rpo_free: free IOP memory
+ * @rpo_load: FIXME
+ */
+enum iop_heap_rpc_ops {
+	rpo_alloc = 1,
+	rpo_free  = 2,
+	rpo_load  = 3,
+};
+
+static struct sif_rpc_client iop_heap_rpc;
+
+/**
+ * iop_alloc - allocate IOP memory
+ * @nbyte: number of bytes to allocate
+ *
+ * Context: sleep
+ * Return: IOP address, or zero if the allocation failed
+ */
+iop_addr_t iop_alloc(size_t nbyte)
+{
+	const u32 size_arg = nbyte;
+	u32 iop_addr;
+
+	if (size_arg != nbyte)
+		return 0;
+
+	return sif_rpc(&iop_heap_rpc, rpo_alloc,
+		&size_arg, sizeof(size_arg),
+		&iop_addr, sizeof(iop_addr)) < 0 ? 0 : iop_addr;
+}
+EXPORT_SYMBOL(iop_alloc);
+
+/**
+ * iop_free - free previously allocated IOP memory
+ * @baddr: IOP address, or zero
+ *
+ * Context: sleep
+ * Return: 0 on success, otherwise a negative error number
+ */
+int iop_free(iop_addr_t baddr)
+{
+	const u32 addr_arg = baddr;
+	s32 status;
+	int err;
+
+	if (!baddr)
+		return 0;
+
+	err = sif_rpc(&iop_heap_rpc, rpo_free,
+		&addr_arg, sizeof(addr_arg),
+		&status, sizeof(status));
+
+	return err < 0 ? err : errno_for_iop_error(status);
+}
+EXPORT_SYMBOL(iop_free);
+
+static int __init iop_heap_init(void)
+{
+	return sif_rpc_bind(&iop_heap_rpc, SIF_SID_HEAP);
+}
+
+static void __exit iop_heap_exit(void)
+{
+	sif_rpc_unbind(&iop_heap_rpc);
+}
+
+module_init(iop_heap_init);
+module_exit(iop_heap_exit);
+
+MODULE_DESCRIPTION("PlayStation 2 input/output processor (IOP) heap memory");
+MODULE_AUTHOR("Fredrik Noring");
+MODULE_LICENSE("GPL");
-- 
2.21.0

