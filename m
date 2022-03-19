Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB714DE6A2
	for <lists+linux-mips@lfdr.de>; Sat, 19 Mar 2022 08:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242343AbiCSHMi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Mar 2022 03:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbiCSHMh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Mar 2022 03:12:37 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3465A267595
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 00:11:17 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id s42so11435317pfg.0
        for <linux-mips@vger.kernel.org>; Sat, 19 Mar 2022 00:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DU0ZKTW+1Tm89cI6PB1G8H0LRBsnzvzcRpFTEbO1hn8=;
        b=QWUaY/34M4+Wqw3Rzz22e/ZPkb+MqydNoMoHXGpaMxesLvTMdmfn1FDgequpLGffAA
         UGfJjBI/o0Fiup2uKPd8qcN99pXiLAI/xjooDMLYGzZyx4G5Vpyzt6r01kG+e2mWWqvD
         cPphpMTL8FOvZ2NHrMmA7kmVAgxnkaSxm6iIaMHvKzfHreKpj7Bfw0rdeyZqj7+kIOFD
         hwRhYpkac+lLe09BxgPMKXuL1MSLLwrVaj30udJZh2YUYt+NUcyHkp+BvvOGTS2OhLWz
         Qa83vkNI1VpW9aEt7R1nhheQkzCbEuTBIPfyKMCKpkKbdIDx1/f1QfjotO6PLSC9Bjof
         EJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DU0ZKTW+1Tm89cI6PB1G8H0LRBsnzvzcRpFTEbO1hn8=;
        b=XZYbAWRZ5jNQypIh3bbAxCzbKgNnjPIHuNZvkl1d2vs2akxQHJJBE58w4TkbB3saMP
         ul9lDjf/c677x2CG9iE1LGFOQeTh5M98gFotMMn5qowFxOlEWbwGzbBmByvFm9c8MCET
         VDLQGxG++lwrM6YkA/SiEmEDQshoqdOe91bNmsicQsE3W/JWbgJH12GM2Jsl87z68nt+
         SLomDFlGSNkd3E37FoIWWkHz7moXoI9yvStMZc/VgTRr357xb3IhWQ6tZ5Uo43Kq/A+c
         +QUkbxoO+b5XySvc2utv70rfyzyxHpLV1P3zcKCGVnIO+8Ou0BxdO4RvbpFtS3BRsvB2
         08EA==
X-Gm-Message-State: AOAM53282+qRfNdWFZQCjVMaw4Zwy+qrlUh920dC57irohYgKncD0+wS
        5kFsvx/EpZFQlK+SZlNSm6A=
X-Google-Smtp-Source: ABdhPJy5jg0Amjfz3SCviFeSjI/8+WzJ7grYR+gqDR8LsFeYU//SXk1iDvskJboKHNnslZhHA5A/LQ==
X-Received: by 2002:a63:1321:0:b0:376:333b:3ed with SMTP id i33-20020a631321000000b00376333b03edmr10516071pgl.283.1647673876757;
        Sat, 19 Mar 2022 00:11:16 -0700 (PDT)
Received: from localhost.localdomain ([155.94.198.189])
        by smtp.gmail.com with ESMTPSA id u25-20020a62ed19000000b004f140515d56sm11497103pfh.46.2022.03.19.00.11.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Mar 2022 00:11:16 -0700 (PDT)
From:   Feiyang Chen <chris.chenfeiyang@gmail.com>
X-Google-Original-From: Feiyang Chen <chenfeiyang@loongson.cn>
To:     tsbogend@alpha.franken.de
Cc:     Feiyang Chen <chenfeiyang@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: [PATCH 1/2] MIPS: loongson64: Fix build error when CONFIG_NUMA is set
Date:   Sat, 19 Mar 2022 15:11:03 +0800
Message-Id: <91781d982e1b89ab4fc7f1f378433eaa0e44b15a.1647671808.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647671808.git.chenfeiyang@loongson.cn>
References: <cover.1647671808.git.chenfeiyang@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Modify __node_data to node_data to fix the build error when CONFIG_NUMA=y:

mips64el-unknown-linux-gnu-ld: mm/page_alloc.o: in function `free_area_init':
(.init.text+0x1714): undefined reference to `node_data'
mips64el-unknown-linux-gnu-ld: (.init.text+0x1730): undefined reference to `node_data'

BTW, modify __node_distances and __node_cpumask to follow the same style.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 .../mips/include/asm/mach-loongson64/mmzone.h |  4 ++--
 .../include/asm/mach-loongson64/topology.h    |  8 +++----
 arch/mips/loongson64/numa.c                   | 22 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
index ebb1deaa77b9..14e2b860ad65 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
@@ -14,9 +14,9 @@
 #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
 #define nid_to_addrbase(nid) ((unsigned long)(nid) << NODE_ADDRSPACE_SHIFT)
 
-extern struct pglist_data *__node_data[];
+extern struct pglist_data *node_data[];
 
-#define NODE_DATA(n)		(__node_data[n])
+#define NODE_DATA(n)		(node_data[n])
 
 extern void setup_zero_pages(void);
 extern void __init prom_init_numa_memory(void);
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
index 3414a1fd1783..dc71eaf9c819 100644
--- a/arch/mips/include/asm/mach-loongson64/topology.h
+++ b/arch/mips/include/asm/mach-loongson64/topology.h
@@ -6,17 +6,17 @@
 
 #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
 
-extern cpumask_t __node_cpumask[];
-#define cpumask_of_node(node)	(&__node_cpumask[node])
+extern cpumask_t node_cpumask[];
+#define cpumask_of_node(node)	(&node_cpumask[node])
 
 struct pci_bus;
 extern int pcibus_to_node(struct pci_bus *);
 
 #define cpumask_of_pcibus(bus)	(cpu_online_mask)
 
-extern unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
+extern unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
 
-#define node_distance(from, to)	(__node_distances[(from)][(to)])
+#define node_distance(from, to)	(node_distances[(from)][(to)])
 
 #endif
 
diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index e8e3e48c5333..9c1bf29c1aae 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -27,13 +27,13 @@
 #include <boot_param.h>
 #include <loongson.h>
 
-unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
-EXPORT_SYMBOL(__node_distances);
-struct pglist_data *__node_data[MAX_NUMNODES];
-EXPORT_SYMBOL(__node_data);
+unsigned char node_distances[MAX_NUMNODES][MAX_NUMNODES];
+EXPORT_SYMBOL(node_distances);
+struct pglist_data *node_data[MAX_NUMNODES];
+EXPORT_SYMBOL(node_data);
 
-cpumask_t __node_cpumask[MAX_NUMNODES];
-EXPORT_SYMBOL(__node_cpumask);
+cpumask_t node_cpumask[MAX_NUMNODES];
+EXPORT_SYMBOL(node_cpumask);
 
 static void cpu_node_probe(void)
 {
@@ -71,11 +71,11 @@ static void __init init_topology_matrix(void)
 
 	for (row = 0; row < MAX_NUMNODES; row++)
 		for (col = 0; col < MAX_NUMNODES; col++)
-			__node_distances[row][col] = -1;
+			node_distances[row][col] = -1;
 
 	for_each_online_node(row) {
 		for_each_online_node(col) {
-			__node_distances[row][col] =
+			node_distances[row][col] =
 				compute_node_distance(row, col);
 		}
 	}
@@ -107,7 +107,7 @@ static void __init node_mem_init(unsigned int node)
 	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
 	if (tnid != node)
 		pr_info("NODE_DATA(%d) on node %d\n", node, tnid);
-	__node_data[node] = nd;
+	node_data[node] = nd;
 	NODE_DATA(node)->node_start_pfn = start_pfn;
 	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;
 
@@ -146,7 +146,7 @@ static __init void prom_meminit(void)
 		if (node_online(node)) {
 			szmem(node);
 			node_mem_init(node);
-			cpumask_clear(&__node_cpumask[node]);
+			cpumask_clear(&node_cpumask[node]);
 		}
 	}
 	max_low_pfn = PHYS_PFN(memblock_end_of_DRAM());
@@ -159,7 +159,7 @@ static __init void prom_meminit(void)
 		if (loongson_sysconf.reserved_cpus_mask & (1<<cpu))
 			continue;
 
-		cpumask_set_cpu(active_cpu, &__node_cpumask[node]);
+		cpumask_set_cpu(active_cpu, &node_cpumask[node]);
 		pr_info("NUMA: set cpumask cpu %d on node %d\n", active_cpu, node);
 
 		active_cpu++;
-- 
2.27.0

