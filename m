Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BECE1BED3E
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 02:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgD3A50 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 20:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726378AbgD3A50 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 20:57:26 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDC5C035494
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 17:57:23 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 114BC20C7B;
        Thu, 30 Apr 2020 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588208243; bh=e8fOIz6UjXOd2ItcC7/sKZvepvTGJBh/+TXUkJVDHXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NVAqcMt4xZPlHoHnMPXmCsJGF26VBRYv+PHY06GUsujIPqMTV4hABPTyRt6Gq7Zo+
         gTynLwbrPAGZLdSwU/yty5USlNr6HCCV3BbuI5OhCb04RAnvq8U2UPkUXtqBk3gXTJ
         RuYXM4jVQj/+CNN82leixfd/JuqL+tvL3an9g0TXsQlzD5efS/39jsSTuWmir8dc9U
         jGJJSoM4aKsNDNkEiO6KSiB4MNK0Zj/HoRMSoKkVTWJfEnpzl/Sswp19Z9Mf+eG7zA
         zGkbcmBXgLWlUBVaYZM2qTUmztifmhL5dG4BY7WOQARfGEDDKEM58zoeiiRu3Zo/sW
         tsMQl3HkzId3A==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, tsbogend@alpha.franken.de,
        john.garry@huawei.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 1/3] MIPS: Move VMALLOC_START into spaces.h
Date:   Thu, 30 Apr 2020 08:57:04 +0800
Message-Id: <20200430005706.2520124-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

That would allow us modify kernel vm address spaces without
step into the hell of includes.

Also move some page defines into page-def.h to allow PAGE_SIZE
to be used in spaces.h.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-generic/spaces.h | 12 +++++++++
 arch/mips/include/asm/page-def.h            | 28 +++++++++++++++++++++
 arch/mips/include/asm/page.h                | 21 ----------------
 arch/mips/include/asm/pgtable-32.h          |  2 --
 arch/mips/include/asm/pgtable-64.h          |  6 -----
 5 files changed, 40 insertions(+), 29 deletions(-)
 create mode 100644 arch/mips/include/asm/page-def.h

diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index ee5ebe98f6cf..44fefde46a10 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -13,6 +13,7 @@
 #include <linux/const.h>
 
 #include <asm/mipsregs.h>
+#include <asm/page-def.h>
 
 /*
  * This gives the physical RAM offset.
@@ -103,4 +104,15 @@
 #endif
 #endif
 
+#ifdef CONFIG_64BIT
+/*
+ * TLB refill handlers also map the vmalloc area into xuseg.  Avoid
+ * the first couple of pages so NULL pointer dereferences will still
+ * reliably trap.
+ */
+#define VMALLOC_START		(MAP_BASE + (2 * PAGE_SIZE))
+#else
+#define VMALLOC_START	  MAP_BASE
+#endif
+
 #endif /* __ASM_MACH_GENERIC_SPACES_H */
diff --git a/arch/mips/include/asm/page-def.h b/arch/mips/include/asm/page-def.h
new file mode 100644
index 000000000000..6506b611f44b
--- /dev/null
+++ b/arch/mips/include/asm/page-def.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_PAGE_DEF_H
+#define __ASM_PAGE_DEF_H
+
+#include <linux/const.h>
+
+/*
+ * PAGE_SHIFT determines the page size
+ */
+#ifdef CONFIG_PAGE_SIZE_4KB
+#define PAGE_SHIFT	12
+#endif
+#ifdef CONFIG_PAGE_SIZE_8KB
+#define PAGE_SHIFT	13
+#endif
+#ifdef CONFIG_PAGE_SIZE_16KB
+#define PAGE_SHIFT	14
+#endif
+#ifdef CONFIG_PAGE_SIZE_32KB
+#define PAGE_SHIFT	15
+#endif
+#ifdef CONFIG_PAGE_SIZE_64KB
+#define PAGE_SHIFT	16
+#endif
+#define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
+#define PAGE_MASK	(~((1 << PAGE_SHIFT) - 1))
+
+#endif /* __ASM_PAGE_DEF_H */
diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
index e2f503fc7a84..07f6a55eec5d 100644
--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -14,27 +14,6 @@
 #include <linux/kernel.h>
 #include <asm/mipsregs.h>
 
-/*
- * PAGE_SHIFT determines the page size
- */
-#ifdef CONFIG_PAGE_SIZE_4KB
-#define PAGE_SHIFT	12
-#endif
-#ifdef CONFIG_PAGE_SIZE_8KB
-#define PAGE_SHIFT	13
-#endif
-#ifdef CONFIG_PAGE_SIZE_16KB
-#define PAGE_SHIFT	14
-#endif
-#ifdef CONFIG_PAGE_SIZE_32KB
-#define PAGE_SHIFT	15
-#endif
-#ifdef CONFIG_PAGE_SIZE_64KB
-#define PAGE_SHIFT	16
-#endif
-#define PAGE_SIZE	(_AC(1,UL) << PAGE_SHIFT)
-#define PAGE_MASK	(~((1 << PAGE_SHIFT) - 1))
-
 /*
  * This is used for calculating the real page sizes
  * for FTLB or VTLB + FTLB configurations.
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index 1945c8970141..40049fda596b 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -95,8 +95,6 @@ extern int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
 #define USER_PTRS_PER_PGD	(0x80000000UL/PGDIR_SIZE)
 #define FIRST_USER_ADDRESS	0UL
 
-#define VMALLOC_START	  MAP_BASE
-
 #define PKMAP_END	((FIXADDR_START) & ~((LAST_PKMAP << PAGE_SHIFT)-1))
 #define PKMAP_BASE	(PKMAP_END - PAGE_SIZE * LAST_PKMAP)
 
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index ee5dc0c145b9..a3fb463ba86a 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -139,12 +139,6 @@
 #define USER_PTRS_PER_PGD       ((TASK_SIZE64 / PGDIR_SIZE)?(TASK_SIZE64 / PGDIR_SIZE):1)
 #define FIRST_USER_ADDRESS	0UL
 
-/*
- * TLB refill handlers also map the vmalloc area into xuseg.  Avoid
- * the first couple of pages so NULL pointer dereferences will still
- * reliably trap.
- */
-#define VMALLOC_START		(MAP_BASE + (2 * PAGE_SIZE))
 #define VMALLOC_END	\
 	(MAP_BASE + \
 	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, \
-- 
2.26.0.rc2

