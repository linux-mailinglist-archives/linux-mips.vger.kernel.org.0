Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E68C395A92
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 14:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbhEaMdI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 08:33:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:38552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231473AbhEaMc7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 08:32:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5F4B6124B;
        Mon, 31 May 2021 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622464279;
        bh=XhlObzucLkoYFjoHz2VHIuYEU9vYDszsHWXfe9qRcS0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u1dBUT0wkfkJ3k++kH9Ef7OMLOsR7G9NIIcsy0Os68H0rNjYt6KDimJUzOcgJqD7z
         rbP5dssd7zUEjZ1K1TGnIpnAQuQyfcwYK+YJYkVcJiIRBBu7Z+IM47aJ+oGtBdtqsf
         G6vwd3GTCjL4jiiHreqEfdmLcS2AnjNjAG0kQNrBNFa7YhAk6VIk/yrQF9wujHeLS4
         3SGCqvHkDx5N9n24PBBHFJdepXYu6PXGXe9nwMBCAMCICHkYopO5l8vh2m1jUbavbR
         zmGqeXyauouY+eaXpNSoLFDka/UZUrlj7LtDueOFE9D3ADiI92t0UHADLmUZr3gY6j
         CdR37L1LuFRrQ==
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: [RFC/RFT PATCH 2/5] memblock: introduce generic memblock_setup_resources()
Date:   Mon, 31 May 2021 15:29:56 +0300
Message-Id: <20210531122959.23499-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210531122959.23499-1-rppt@kernel.org>
References: <20210531122959.23499-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Several architecture have very similar implementation of the setup of the
resource tree. The implementations loop over memory ranges registered in
memblock, request a "System RAM" resource for each range and then reserve
resource rages corresponding to various sections of the kernel image. If
kexec/crash dump are enable the crashk_res region is also reserved.

Move the implementation of resource tree setup from s390 to memblock. It
will be then used by several other architectures as well.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/s390/kernel/setup.c | 73 +--------------------------------
 include/linux/memblock.h |  2 +
 mm/memblock.c            | 87 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 72 deletions(-)

diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 30430e7c1b03..6f3c82cc0b0d 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -481,80 +481,9 @@ static void __init setup_lowcore_dat_on(void)
 	__ctl_set_bit(0, 28);
 }
 
-static struct resource code_resource = {
-	.name  = "Kernel code",
-	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
-};
-
-static struct resource data_resource = {
-	.name = "Kernel data",
-	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
-};
-
-static struct resource bss_resource = {
-	.name = "Kernel bss",
-	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
-};
-
-static struct resource __initdata *standard_resources[] = {
-	&code_resource,
-	&data_resource,
-	&bss_resource,
-#ifdef CONFIG_CRASH_DUMP
-	&crashk_res,
-#endif
-};
-
 static void __init setup_resources(void)
 {
-	struct resource *res, *std_res, *sub_res;
-	phys_addr_t start, end;
-	int j;
-	u64 i;
-
-	code_resource.start = (unsigned long) _text;
-	code_resource.end = (unsigned long) _etext - 1;
-	data_resource.start = (unsigned long) _etext;
-	data_resource.end = (unsigned long) _edata - 1;
-	bss_resource.start = (unsigned long) __bss_start;
-	bss_resource.end = (unsigned long) __bss_stop - 1;
-
-	for_each_mem_range(i, &start, &end) {
-		res = memblock_alloc(sizeof(*res), 8);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes align=0x%x\n",
-			      __func__, sizeof(*res), 8);
-		res->flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM;
-
-		res->name = "System RAM";
-		res->start = start;
-		/*
-		 * In memblock, end points to the first byte after the
-		 * range while in resourses, end points to the last byte in
-		 * the range.
-		 */
-		res->end = end - 1;
-		request_resource(&iomem_resource, res);
-
-		for (j = 0; j < ARRAY_SIZE(standard_resources); j++) {
-			std_res = standard_resources[j];
-			if (!std_res->end || std_res->start < res->start ||
-			    std_res->start > res->end)
-				continue;
-			if (std_res->end > res->end) {
-				sub_res = memblock_alloc(sizeof(*sub_res), 8);
-				if (!sub_res)
-					panic("%s: Failed to allocate %zu bytes align=0x%x\n",
-					      __func__, sizeof(*sub_res), 8);
-				*sub_res = *std_res;
-				sub_res->end = res->end;
-				std_res->start = res->end + 1;
-				request_resource(res, sub_res);
-			} else {
-				request_resource(res, std_res);
-			}
-		}
-	}
+	memblock_setup_resources();
 }
 
 static void __init setup_ident_map_size(void)
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 5984fff3f175..44c29ebae842 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -121,6 +121,8 @@ void memblock_free_all(void);
 void reset_node_managed_pages(pg_data_t *pgdat);
 void reset_all_zones_managed_pages(void);
 
+void memblock_setup_resources(void);
+
 /* Low level functions */
 void __next_mem_range(u64 *idx, int nid, enum memblock_flags flags,
 		      struct memblock_type *type_a,
diff --git a/mm/memblock.c b/mm/memblock.c
index afaefa8fc6ab..504435753259 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -16,6 +16,8 @@
 #include <linux/kmemleak.h>
 #include <linux/seq_file.h>
 #include <linux/memblock.h>
+#include <linux/ioport.h>
+#include <linux/kexec.h>
 
 #include <asm/sections.h>
 #include <linux/io.h>
@@ -2062,6 +2064,91 @@ void __init memblock_free_all(void)
 	totalram_pages_add(pages);
 }
 
+static struct resource code_resource = {
+	.name  = "Kernel code",
+	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
+};
+
+static struct resource rodata_resource = {
+	.name = "Kernel rodata",
+	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
+};
+
+static struct resource data_resource = {
+	.name = "Kernel data",
+	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
+};
+
+static struct resource bss_resource = {
+	.name = "Kernel bss",
+	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
+};
+
+static struct resource __initdata *standard_resources[] = {
+	&code_resource,
+	&rodata_resource,
+	&data_resource,
+	&bss_resource,
+#ifdef CONFIG_KEXEC_CORE
+	&crashk_res,
+#endif
+};
+
+void __init memblock_setup_resources(void)
+{
+	struct resource *res, *kres, *sub_res;
+	phys_addr_t start, end;
+	int j;
+	u64 i;
+
+	code_resource.start = __pa_symbol(_text);
+	code_resource.end = __pa_symbol(_etext)-1;
+	rodata_resource.start = __pa_symbol(__start_rodata);
+	rodata_resource.end = __pa_symbol(__end_rodata)-1;
+	data_resource.start = __pa_symbol(_sdata);
+	data_resource.end = __pa_symbol(_edata)-1;
+	bss_resource.start = __pa_symbol(__bss_start);
+	bss_resource.end = __pa_symbol(__bss_stop)-1;
+
+	for_each_mem_range(i, &start, &end) {
+		res = memblock_alloc(sizeof(*res), 8);
+		if (!res)
+			panic("%s: Failed to allocate %zu bytes align=0x%x\n",
+			      __func__, sizeof(*res), 8);
+		res->flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM;
+
+		res->name = "System RAM";
+		res->start = start;
+
+		/*
+		 * In memblock, end points to the first byte after the
+		 * range while in resourses, end points to the last byte in
+		 * the range.
+		 */
+		res->end = end - 1;
+		request_resource(&iomem_resource, res);
+
+		for (j = 0; j < ARRAY_SIZE(standard_resources); j++) {
+			kres = standard_resources[j];
+			if (!kres->end || kres->start < res->start ||
+			    kres->start > res->end)
+				continue;
+			if (kres->end > res->end) {
+				sub_res = memblock_alloc(sizeof(*sub_res), 8);
+				if (!sub_res)
+					panic("%s: Failed to allocate %zu bytes align=0x%x\n",
+					      __func__, sizeof(*sub_res), 8);
+				*sub_res = *kres;
+				sub_res->end = res->end;
+				kres->start = res->end + 1;
+				request_resource(res, sub_res);
+			} else {
+				request_resource(res, kres);
+			}
+		}
+	}
+}
+
 #if defined(CONFIG_DEBUG_FS) && defined(CONFIG_ARCH_KEEP_MEMBLOCK)
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.28.0

