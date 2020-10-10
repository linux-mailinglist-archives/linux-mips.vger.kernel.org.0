Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8162828A491
	for <lists+linux-mips@lfdr.de>; Sun, 11 Oct 2020 01:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgJJXsD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Oct 2020 19:48:03 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36522 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726471AbgJJXsC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 10 Oct 2020 19:48:02 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxGMQrSIJfLfobAA--.13680S4;
        Sun, 11 Oct 2020 07:47:56 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 2/4 RESEND] MIPS: Loongson64: Clean up numa.c
Date:   Sun, 11 Oct 2020 07:47:52 +0800
Message-Id: <1602373674-4579-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn>
References: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxGMQrSIJfLfobAA--.13680S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1kJF17Kr18Kr4rZF43Wrg_yoWrGFyfpr
        yfC3Z3Crs3Xr1kWFy0yrWkJr1Yyanayan3tF47Gw1j9as0vw1Iqr1UKasY934UtrW8ZFyj
        vF95ta1DKFsrJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVWfMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
        xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
        IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRQ6pDUUUUU==
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
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---

v2: no changes, just add Reviewed-by tag

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

