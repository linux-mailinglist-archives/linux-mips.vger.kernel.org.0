Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2691EA4A45
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbfIAPxL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:53:11 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57956 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbfIAPxL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:53:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id E9F46402D7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:53:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id P6C6akW_3F4u for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:53:09 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 3D35D3FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:53:09 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:53:09 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 043/120] MIPS: PS2: ROM: Permit /dev/mem to access read-only
 memory
Message-ID: <644f2908571adb1c66d27ab0ecb0c32a3f8581c9.1567326213.git.noring@nocrew.org>
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
 arch/mips/include/asm/io.h |  6 ++++++
 arch/mips/ps2/memory.c     | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index f7115472f530..f449a27c2b79 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -709,4 +709,10 @@ extern void (*_dma_cache_inv)(unsigned long start, unsigned long size);
 
 void __ioread64_copy(void *to, const void __iomem *from, size_t count);
 
+#ifdef CONFIG_SONY_PS2
+#define ARCH_HAS_VALID_PHYS_ADDR_RANGE
+extern int valid_phys_addr_range(phys_addr_t addr, size_t size);
+extern int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
+#endif /* CONFIG_SONY_PS2 */
+
 #endif /* _ASM_IO_H */
diff --git a/arch/mips/ps2/memory.c b/arch/mips/ps2/memory.c
index 66ca37f38330..c513b6912bb0 100644
--- a/arch/mips/ps2/memory.c
+++ b/arch/mips/ps2/memory.c
@@ -7,9 +7,25 @@
 
 #include <linux/init.h>
 #include <linux/ioport.h>
+#include <linux/mm.h>
 #include <linux/types.h>
 
 #include <asm/bootinfo.h>
+#include <asm/io.h>
+
+#include <asm/mach-ps2/rom.h>
+
+int valid_phys_addr_range(phys_addr_t addr, size_t size)
+{
+	return addr + size <= __pa(high_memory) ||
+	       (ROM0_BASE <= addr && addr + size <= ROM0_BASE + ROM0_SIZE) ||
+	       (ROM1_BASE <= addr && addr + size <= ROM1_BASE + ROM1_SIZE);
+}
+
+int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
+{
+	return 1;
+}
 
 void __init plat_mem_setup(void)
 {
-- 
2.21.0

