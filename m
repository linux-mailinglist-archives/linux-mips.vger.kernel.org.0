Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65BC7A4A5C
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbfIAQDG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:03:06 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:58832 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAQDG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:03:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id CEC7B3FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:03:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DN2xY3Z4xV6m for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:03:04 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 300593F53F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:03:04 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:03:04 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 064/120] MIPS: PS2: IOP: Permit /dev/mem to access IOP memory
Message-ID: <63369b9b67d63891d34e854ca9110da78415d19b.1567326213.git.noring@nocrew.org>
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
 arch/mips/include/asm/mach-ps2/iop.h | 21 +++++++++++++++++++++
 arch/mips/ps2/memory.c               |  2 ++
 2 files changed, 23 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ps2/iop.h

diff --git a/arch/mips/include/asm/mach-ps2/iop.h b/arch/mips/include/asm/mach-ps2/iop.h
new file mode 100644
index 000000000000..65585451e743
--- /dev/null
+++ b/arch/mips/include/asm/mach-ps2/iop.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 input/output processor (IOP)
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+#ifndef __ASM_MACH_PS2_IOP_H
+#define __ASM_MACH_PS2_IOP_H
+
+#define IOP_RAM_BASE	0x1c000000
+#define IOP_RAM_SIZE	0x200000
+
+#define IOP_OHCI_BASE	0x1f801600
+
+/**
+ * iop_addr_t - I/O processor (IOP) bus address
+ */
+typedef u32 iop_addr_t;
+
+#endif /* __ASM_MACH_PS2_IOP_H */
diff --git a/arch/mips/ps2/memory.c b/arch/mips/ps2/memory.c
index c513b6912bb0..51614b6d0515 100644
--- a/arch/mips/ps2/memory.c
+++ b/arch/mips/ps2/memory.c
@@ -13,11 +13,13 @@
 #include <asm/bootinfo.h>
 #include <asm/io.h>
 
+#include <asm/mach-ps2/iop.h>
 #include <asm/mach-ps2/rom.h>
 
 int valid_phys_addr_range(phys_addr_t addr, size_t size)
 {
 	return addr + size <= __pa(high_memory) ||
+	       (IOP_RAM_BASE <= addr && addr + size <= IOP_RAM_BASE + IOP_RAM_SIZE) ||
 	       (ROM0_BASE <= addr && addr + size <= ROM0_BASE + ROM0_SIZE) ||
 	       (ROM1_BASE <= addr && addr + size <= ROM1_BASE + ROM1_SIZE);
 }
-- 
2.21.0

