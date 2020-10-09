Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FDC28876E
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 12:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732317AbgJIK5i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 06:57:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38282 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732391AbgJIK5h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Oct 2020 06:57:37 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx2MUaQoBf2pcbAA--.2238S4;
        Fri, 09 Oct 2020 18:57:32 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 2/3] MIPS: Loongson64: Clean up numa.c
Date:   Fri,  9 Oct 2020 18:57:29 +0800
Message-Id: <1602241050-24051-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
References: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx2MUaQoBf2pcbAA--.2238S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1kJF17Kr18Kr4rZF43Wrg_yoWrJw13pr
        yfA3ZxCrs3Xr1kWFy0yrWkJr1YyanayFs3tF47Gw1qvas0vw1Iqr1UKasY934UJrW8ZFyj
        vr95ta1DKFsrJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU0hF3UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

(1) Replace nid_to_addroffset() with nid_to_addrbase() and then remove the
related useless code.

(2) Since end_pfn = start_pfn + node_psize, use "node_psize" instead of
"end_pfn - start_pfn" to avoid the redundant calculation.

(3) After commit 6fbde6b492df ("MIPS: Loongson64: Move files to the
top-level directory"), CONFIG_ZONE_DMA32 is always set for Loongson64
due to MACH_LOONGSON64 selects ZONE_DMA32, so no need to use ifdef any
more, just remove it.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/mmzone.h |  6 +-----
 arch/mips/loongson64/numa.c                    | 29 +++-----------------------
 2 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
index 3a25dbd..c3f0f7a 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
@@ -11,13 +11,9 @@
 
 #include <boot_param.h>
 #define NODE_ADDRSPACE_SHIFT 44
-#define NODE0_ADDRSPACE_OFFSET 0x000000000000UL
-#define NODE1_ADDRSPACE_OFFSET 0x100000000000UL
-#define NODE2_ADDRSPACE_OFFSET 0x200000000000UL
-#define NODE3_ADDRSPACE_OFFSET 0x300000000000UL
 
 #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
-#define nid_to_addrbase(nid) ((nid) << NODE_ADDRSPACE_SHIFT)
+#define nid_to_addrbase(nid) ((unsigned long)(nid) << NODE_ADDRSPACE_SHIFT)
 
 extern struct pglist_data *__node_data[];
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index ea8bb1b..cf9459f 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -98,27 +98,6 @@ static void __init init_topology_matrix(void)
 	}
 }
 
-static unsigned long nid_to_addroffset(unsigned int nid)
-{
-	unsigned long result;
-	switch (nid) {
-	case 0:
-	default:
-		result = NODE0_ADDRSPACE_OFFSET;
-		break;
-	case 1:
-		result = NODE1_ADDRSPACE_OFFSET;
-		break;
-	case 2:
-		result = NODE2_ADDRSPACE_OFFSET;
-		break;
-	case 3:
-		result = NODE3_ADDRSPACE_OFFSET;
-		break;
-	}
-	return result;
-}
-
 static void __init szmem(unsigned int node)
 {
 	u32 i, mem_type;
@@ -146,7 +125,7 @@ static void __init szmem(unsigned int node)
 			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
 				start_pfn, end_pfn, num_physpages);
 			memblock_add_node(PFN_PHYS(start_pfn),
-				PFN_PHYS(end_pfn - start_pfn), node);
+				PFN_PHYS(node_psize), node);
 			break;
 		case SYSTEM_RAM_HIGH:
 			start_pfn = ((node_id << 44) + mem_start) >> PAGE_SHIFT;
@@ -158,7 +137,7 @@ static void __init szmem(unsigned int node)
 			pr_info("       start_pfn:0x%llx, end_pfn:0x%llx, num_physpages:0x%lx\n",
 				start_pfn, end_pfn, num_physpages);
 			memblock_add_node(PFN_PHYS(start_pfn),
-				PFN_PHYS(end_pfn - start_pfn), node);
+				PFN_PHYS(node_psize), node);
 			break;
 		case SYSTEM_RAM_RESERVED:
 			pr_info("Node%d: mem_type:%d, mem_start:0x%llx, mem_size:0x%llx MB\n",
@@ -175,7 +154,7 @@ static void __init node_mem_init(unsigned int node)
 	unsigned long node_addrspace_offset;
 	unsigned long start_pfn, end_pfn;
 
-	node_addrspace_offset = nid_to_addroffset(node);
+	node_addrspace_offset = nid_to_addrbase(node);
 	pr_info("Node%d's addrspace_offset is 0x%lx\n",
 			node, node_addrspace_offset);
 
@@ -242,9 +221,7 @@ void __init paging_init(void)
 	unsigned long zones_size[MAX_NR_ZONES] = {0, };
 
 	pagetable_init();
-#ifdef CONFIG_ZONE_DMA32
 	zones_size[ZONE_DMA32] = MAX_DMA32_PFN;
-#endif
 	zones_size[ZONE_NORMAL] = max_low_pfn;
 	free_area_init(zones_size);
 }
-- 
2.1.0

