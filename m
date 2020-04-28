Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977DD1BB3C6
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 04:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgD1CPj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 22:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726262AbgD1CPj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Apr 2020 22:15:39 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2879C03C1A8;
        Mon, 27 Apr 2020 19:15:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 732052049D;
        Tue, 28 Apr 2020 02:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588040139; bh=0DPQ0VlnSnOStdX2IteuytynEOrNUdeW6TogM7iz/8c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wO4nL9vYyjz8jSMizsrFwI17SokTHdMZszsOP71JhE1KuU2+7uBb0YPZlWXqsHahI
         zixa+qlH7qjakvoi56VhfwgJypakrzOxxFTBW+6Ooxdf/skrT9TtD+PjpZByNVxpG5
         GzmlGNkLAdRiA8/ggCh3MayFal61gMgSXPlDFhn+flMhxutuxbT+QcCyXUZM5iachn
         5+GhNShGR8eLRNMdnC3SIKfyNqqyxc8r48aDwR7ajSt7Wml87J0hbioujqJJqULnem
         r4P55udx65fgpAkjOhjZoGN1wTzBsA0OIIs7c47f4rq1kud5VvFioR88tmk/N5xvAj
         Z28WGrGW7YR0Q==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     john.garry@huawei.com, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] MIPS: Massage address spaces headers
Date:   Tue, 28 Apr 2020 10:14:12 +0800
Message-Id: <20200428021437.2000066-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
References: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

That would allow us modify kernel vm address spaces without
step into the hell of includes.

Also use some marcos for address spaces to make spaces.h more
clear.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/addrspace.h           |  4 +--
 arch/mips/include/asm/mach-generic/spaces.h | 33 ++++++++++++++-------
 arch/mips/include/asm/page-def.h            | 29 ++++++++++++++++++
 arch/mips/include/asm/page.h                | 21 -------------
 arch/mips/include/asm/pgtable-32.h          |  2 --
 arch/mips/include/asm/pgtable-64.h          | 10 ++-----
 arch/mips/include/asm/sync.h                |  2 ++
 arch/mips/kernel/cps-vec.S                  |  3 +-
 arch/mips/lib/uncached.c                    |  6 ++--
 9 files changed, 61 insertions(+), 49 deletions(-)
 create mode 100644 arch/mips/include/asm/page-def.h

diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index 59a48c60a065..4fa8ee48ef02 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -10,7 +10,7 @@
 #ifndef _ASM_ADDRSPACE_H
 #define _ASM_ADDRSPACE_H
 
-#include <spaces.h>
+#include <linux/const.h>
 
 /*
  *  Configure language
@@ -67,7 +67,7 @@
 #define XKSEG			_CONST64_(0xc000000000000000)
 #define CKSEG0			_CONST64_(0xffffffff80000000)
 #define CKSEG1			_CONST64_(0xffffffffa0000000)
-#define CKSSEG			_CONST64_(0xffffffffc0000000)
+#define CKSEG2			_CONST64_(0xffffffffc0000000)
 #define CKSEG3			_CONST64_(0xffffffffe0000000)
 
 #define CKSEG0ADDR(a)		(CPHYSADDR(a) | CKSEG0)
diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index ee5ebe98f6cf..89162740951a 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -10,9 +10,9 @@
 #ifndef _ASM_MACH_GENERIC_SPACES_H
 #define _ASM_MACH_GENERIC_SPACES_H
 
-#include <linux/const.h>
-
+#include <asm/addrspace.h>
 #include <asm/mipsregs.h>
+#include <asm/page-def.h>
 
 /*
  * This gives the physical RAM offset.
@@ -29,20 +29,20 @@
 #ifdef CONFIG_KVM_GUEST
 #define CAC_BASE		_AC(0x40000000, UL)
 #else
-#define CAC_BASE		_AC(0x80000000, UL)
+#define CAC_BASE	CKSEG0
 #endif
 #ifndef IO_BASE
-#define IO_BASE			_AC(0xa0000000, UL)
+#define IO_BASE		CKSEG1
 #endif
 #ifndef UNCAC_BASE
-#define UNCAC_BASE		_AC(0xa0000000, UL)
+#define UNCAC_BASE	CKSEG1
 #endif
 
 #ifndef MAP_BASE
 #ifdef CONFIG_KVM_GUEST
 #define MAP_BASE		_AC(0x60000000, UL)
 #else
-#define MAP_BASE		_AC(0xc0000000, UL)
+#define MAP_BASE		CKSEG2
 #endif
 #endif
 
@@ -58,19 +58,19 @@
 #ifdef CONFIG_64BIT
 
 #ifndef CAC_BASE
-#define CAC_BASE	PHYS_TO_XKPHYS(read_c0_config() & CONF_CM_CMASK, 0)
+#define CAC_BASE		PHYS_TO_XKPHYS(read_c0_config() & CONF_CM_CMASK, 0)
 #endif
 
 #ifndef IO_BASE
-#define IO_BASE			_AC(0x9000000000000000, UL)
+#define IO_BASE			PHYS_TO_XKPHYS(K_CALG_UNCACHED, 0)
 #endif
 
 #ifndef UNCAC_BASE
-#define UNCAC_BASE		_AC(0x9000000000000000, UL)
+#define UNCAC_BASE		PHYS_TO_XKPHYS(K_CALG_UNCACHED, 0)
 #endif
 
 #ifndef MAP_BASE
-#define MAP_BASE		_AC(0xc000000000000000, UL)
+#define MAP_BASE		XKSEG
 #endif
 
 /*
@@ -99,8 +99,19 @@
 #ifdef CONFIG_KVM_GUEST
 #define FIXADDR_TOP		((unsigned long)(long)(int)0x7ffe0000)
 #else
-#define FIXADDR_TOP		((unsigned long)(long)(int)0xfffe0000)
+#define FIXADDR_TOP		(CKSEG3 + 0x1ffe0000)
+#endif
 #endif
+
+#ifdef CONFIG_64BIT
+/*
+ * TLB refill handlers also map the vmalloc area into xuseg.  Avoid
+ * the first couple of pages so NULL pointer dereferences will still
+ * reliably trap.
+ */
+#define VMALLOC_START		(MAP_BASE + (2 * PAGE_SIZE))
+#else
+#define VMALLOC_START	  MAP_BASE
 #endif
 
 #endif /* __ASM_MACH_GENERIC_SPACES_H */
diff --git a/arch/mips/include/asm/page-def.h b/arch/mips/include/asm/page-def.h
new file mode 100644
index 000000000000..ace4473e7930
--- /dev/null
+++ b/arch/mips/include/asm/page-def.h
@@ -0,0 +1,29 @@
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
+
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
index ee5dc0c145b9..037aec0a14de 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -139,21 +139,15 @@
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
 	     (1UL << cpu_vmbits)) - (1UL << 32))
 
 #if defined(CONFIG_MODULES) && defined(KBUILD_64BIT_SYM32) && \
-	VMALLOC_START != CKSSEG
+	VMALLOC_START != CKSEG2
 /* Load modules into 32bit-compatible segment. */
-#define MODULE_START	CKSSEG
+#define MODULE_START	CKSEG2
 #define MODULE_END	(FIXADDR_START-2*PAGE_SIZE)
 #endif
 
diff --git a/arch/mips/include/asm/sync.h b/arch/mips/include/asm/sync.h
index aabd097933fe..8b297255854b 100644
--- a/arch/mips/include/asm/sync.h
+++ b/arch/mips/include/asm/sync.h
@@ -2,6 +2,8 @@
 #ifndef __MIPS_ASM_SYNC_H__
 #define __MIPS_ASM_SYNC_H__
 
+#include <linux/stringify.h>
+
 /*
  * sync types are defined by the MIPS64 Instruction Set documentation in Volume
  * II-A of the MIPS Architecture Reference Manual, which can be found here:
diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 4db7ff055c9f..ba5e89825308 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -4,7 +4,8 @@
  * Author: Paul Burton <paul.burton@mips.com>
  */
 
-#include <asm/addrspace.h>
+#include <spaces.h>
+
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/asmmacro.h>
diff --git a/arch/mips/lib/uncached.c b/arch/mips/lib/uncached.c
index 09d5deea747f..5736f3f4c24f 100644
--- a/arch/mips/lib/uncached.c
+++ b/arch/mips/lib/uncached.c
@@ -9,13 +9,11 @@
  */
 
 
-#include <asm/addrspace.h>
+#include <spaces.h>
+
 #include <asm/bug.h>
 #include <asm/cacheflush.h>
 
-#ifndef CKSEG2
-#define CKSEG2 CKSSEG
-#endif
 #ifndef TO_PHYS_MASK
 #define TO_PHYS_MASK -1
 #endif
-- 
2.26.0.rc2

