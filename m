Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF139C0364
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2019 12:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfI0KZu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Sep 2019 06:25:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42052 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfI0KZu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Sep 2019 06:25:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id e5so911293pls.9
        for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2019 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Y9WiBP4GwFWo19U9ybjSOBt4Gy1qdKcnaUJbZa6dsWg=;
        b=CTUmfMVTQJw4vN08JUTM5bpekdti5mD617hrKepLGctI2NiXMQ1zaBErXbBxyH9933
         dP348H2q47fm6uvUEcgiFyfeLixY9+QEaneqCbkIn+pX6eg3ZFUtjQLx37Tsh15B7J9i
         avcmvXkNDIoDdiKnxwxqxV+y628uoKH4SK7wzm2r3G0gmAgWhgG0kYeISHJKeGbF4QqG
         2wWpdVsiVdDJShli7noMKjbY1y8Ow/jjkMsxjFk+SkjWFO+nB7ZaqMhGD9CBqTSdXPVd
         5oSINSf0PL5PXY4Dy5YMleyFIE94BI4ygnw49KQf4+kTiuhxYgSQlNP8lEvHQviu9YLo
         f5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Y9WiBP4GwFWo19U9ybjSOBt4Gy1qdKcnaUJbZa6dsWg=;
        b=jiCzTwUN42n6iute9UrP7t8pzblnWYo36BTzOGxGDFZQl176CYzQhm9LQphQjMr1Q5
         q6UkoXseTMVTIlP0c4SniRyhl53bTd5kUS51ir7l0HHOb3emNwk7HnUFQWujoHYBpOPI
         21xebGC9mqs0Qcq0bl18vXipfhOjIy0P8aPu1dhS7iUrqUuIsRJnTqT9AmuH9/M53DCk
         t7R60tCtfO2wBBRFp3WZLq9X3+yzjS3uwqxgZQiXbe3ascUKRVoD7zVW0PHZAlz5YGkF
         DBYa87LuXvEtD9IaDQWn8hCQ11/Dn8cpzPDgEjJ9fHRhBviPNmhWI5+RlNJJdVxkbMB7
         g1aw==
X-Gm-Message-State: APjAAAXCcwIGugCdOQd8B29YKlDuuNfn/JZ4LTEVoar4qCG4YhvXVbWF
        3eId/pIqCWAQGXLoSuZXttI=
X-Google-Smtp-Source: APXvYqxq+BoKvYhseQ71vMjj/zeoqG26Vxbkc8PA6KzjWB1mhS5Q9BFn7njrERskt9967BcnichtKg==
X-Received: by 2002:a17:902:ac98:: with SMTP id h24mr3880896plr.64.1569579947211;
        Fri, 27 Sep 2019 03:25:47 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id h66sm18161687pjb.0.2019.09.27.03.25.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Sep 2019 03:25:46 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Loongson64: Fix boot failure after dropping boot_mem_map
Date:   Fri, 27 Sep 2019 18:27:42 +0800
Message-Id: <1569580062-5296-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From a94e4f24ec836c8984f839594 ("MIPS: init: Drop boot_mem_map"),
add_memory_region() is handled by memblock_add()/memblock_reserve()
directly and all bootmem API should be converted to memblock API.
Otherwise it will lead to boot failure, especially in the NUMA case
because add_memory_region lose the node_id information.

Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/common/mem.c      | 16 +++++++---------
 arch/mips/loongson64/loongson-3/numa.c | 11 +----------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/mips/loongson64/common/mem.c b/arch/mips/loongson64/common/mem.c
index 4abb92e..8c4a765 100644
--- a/arch/mips/loongson64/common/mem.c
+++ b/arch/mips/loongson64/common/mem.c
@@ -3,6 +3,7 @@
  */
 #include <linux/fs.h>
 #include <linux/fcntl.h>
+#include <linux/memblock.h>
 #include <linux/mm.h>
 
 #include <asm/bootinfo.h>
@@ -67,19 +68,16 @@ void __init prom_init_memory(void)
 		if (node_id == 0) {
 			switch (mem_type) {
 			case SYSTEM_RAM_LOW:
-				add_memory_region(loongson_memmap->map[i].mem_start,
-					(u64)loongson_memmap->map[i].mem_size << 20,
-					BOOT_MEM_RAM);
+				memblock_add(loongson_memmap->map[i].mem_start,
+					(u64)loongson_memmap->map[i].mem_size << 20);
 				break;
 			case SYSTEM_RAM_HIGH:
-				add_memory_region(loongson_memmap->map[i].mem_start,
-					(u64)loongson_memmap->map[i].mem_size << 20,
-					BOOT_MEM_RAM);
+				memblock_add(loongson_memmap->map[i].mem_start,
+					(u64)loongson_memmap->map[i].mem_size << 20);
 				break;
 			case SYSTEM_RAM_RESERVED:
-				add_memory_region(loongson_memmap->map[i].mem_start,
-					(u64)loongson_memmap->map[i].mem_size << 20,
-					BOOT_MEM_RESERVED);
+				memblock_reserve(loongson_memmap->map[i].mem_start,
+					(u64)loongson_memmap->map[i].mem_size << 20);
 				break;
 			}
 		}
diff --git a/arch/mips/loongson64/loongson-3/numa.c b/arch/mips/loongson64/loongson-3/numa.c
index 414e97d..8f20d2c 100644
--- a/arch/mips/loongson64/loongson-3/numa.c
+++ b/arch/mips/loongson64/loongson-3/numa.c
@@ -142,8 +142,6 @@ static void __init szmem(unsigned int node)
 				(u32)node_id, mem_type, mem_start, mem_size);
 			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
 				start_pfn, end_pfn, num_physpages);
-			add_memory_region((node_id << 44) + mem_start,
-				(u64)mem_size << 20, BOOT_MEM_RAM);
 			memblock_add_node(PFN_PHYS(start_pfn),
 				PFN_PHYS(end_pfn - start_pfn), node);
 			break;
@@ -156,16 +154,12 @@ static void __init szmem(unsigned int node)
 				(u32)node_id, mem_type, mem_start, mem_size);
 			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
 				start_pfn, end_pfn, num_physpages);
-			add_memory_region((node_id << 44) + mem_start,
-				(u64)mem_size << 20, BOOT_MEM_RAM);
 			memblock_add_node(PFN_PHYS(start_pfn),
 				PFN_PHYS(end_pfn - start_pfn), node);
 			break;
 		case SYSTEM_RAM_RESERVED:
 			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
 				(u32)node_id, mem_type, mem_start, mem_size);
-			add_memory_region((node_id << 44) + mem_start,
-				(u64)mem_size << 20, BOOT_MEM_RESERVED);
 			memblock_reserve(((node_id << 44) + mem_start),
 				mem_size << 20);
 			break;
@@ -191,8 +185,6 @@ static void __init node_mem_init(unsigned int node)
 	NODE_DATA(node)->node_start_pfn = start_pfn;
 	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;
 
-	free_bootmem_with_active_regions(node, end_pfn);
-
 	if (node == 0) {
 		/* kernel end address */
 		unsigned long kernel_end_pfn = PFN_UP(__pa_symbol(&_end));
@@ -209,8 +201,6 @@ static void __init node_mem_init(unsigned int node)
 			memblock_reserve((node_addrspace_offset | 0xfe000000),
 					 32 << 20);
 	}
-
-	sparse_memory_present_with_active_regions(node);
 }
 
 static __init void prom_meminit(void)
@@ -227,6 +217,7 @@ static __init void prom_meminit(void)
 			cpumask_clear(&__node_data[(node)]->cpumask);
 		}
 	}
+	memblocks_present();
 	max_low_pfn = PHYS_PFN(memblock_end_of_DRAM());
 
 	for (cpu = 0; cpu < loongson_sysconf.nr_cpus; cpu++) {
-- 
2.7.0

