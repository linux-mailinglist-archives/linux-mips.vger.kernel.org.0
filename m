Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E991E9A60
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2019 11:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfJ3Kvv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Oct 2019 06:51:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:36018 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726187AbfJ3Kvv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Oct 2019 06:51:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D7654AD12;
        Wed, 30 Oct 2019 10:51:49 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP27: replace MAX_COMPACT_NODE with MAX_NUMNODES
Date:   Wed, 30 Oct 2019 11:51:44 +0100
Message-Id: <20191030105144.10686-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MAX_COMPACT_NODE is a leftover from the compact node implementation,
which is removed now.  Use MAX_NUMNODES instead.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/mach-ip27/topology.h |  2 +-
 arch/mips/include/asm/sn/gda.h             |  4 +---
 arch/mips/include/asm/sn/sn0/arch.h        | 16 +---------------
 arch/mips/sgi-ip27/ip27-init.c             |  2 +-
 arch/mips/sgi-ip27/ip27-memory.c           | 10 +++++-----
 arch/mips/sgi-ip27/ip27-smp.c              |  6 +-----
 6 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
index a717af9177ff..be61ddcdacab 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -22,7 +22,7 @@ extern int pcibus_to_node(struct pci_bus *);
 
 #define cpumask_of_pcibus(bus)	(cpumask_of_node(pcibus_to_node(bus)))
 
-extern unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
+extern unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
 
 #define node_distance(from, to) (__node_distances[(from)][(to)])
 
diff --git a/arch/mips/include/asm/sn/gda.h b/arch/mips/include/asm/sn/gda.h
index 85fa1b5f639d..d52f81620661 100644
--- a/arch/mips/include/asm/sn/gda.h
+++ b/arch/mips/include/asm/sn/gda.h
@@ -60,9 +60,7 @@ typedef struct gda {
 				/* Pointer to a mask of nodes with copies
 				 * of the kernel. */
 	char	g_padding[56];	/* pad out to 128 bytes */
-	nasid_t g_nasidtable[MAX_COMPACT_NODES]; /* NASID of each node,
-						  * indexed by cnodeid.
-						  */
+	nasid_t g_nasidtable[MAX_NUMNODES]; /* NASID of each node */
 } gda_t;
 
 #define GDA ((gda_t*) GDA_ADDR(get_nasid()))
diff --git a/arch/mips/include/asm/sn/sn0/arch.h b/arch/mips/include/asm/sn/sn0/arch.h
index ea8a6983f6a4..12f4c4649ff0 100644
--- a/arch/mips/include/asm/sn/sn0/arch.h
+++ b/arch/mips/include/asm/sn/sn0/arch.h
@@ -12,25 +12,11 @@
 #define _ASM_SN_SN0_ARCH_H
 
 
-#ifndef SN0XXL	/* 128 cpu SMP max */
-/*
- * This is the maximum number of nodes that can be part of a kernel.
- * Effectively, it's the maximum number of compact node ids (cnodeid_t).
- */
-#define MAX_COMPACT_NODES	64
-
 /*
  * MAXCPUS refers to the maximum number of CPUs in a single kernel.
  * This is not necessarily the same as MAXNODES * CPUS_PER_NODE
  */
-#define MAXCPUS			128
-
-#else /* SN0XXL system */
-
-#define MAX_COMPACT_NODES	128
-#define MAXCPUS			256
-
-#endif /* SN0XXL */
+#define MAXCPUS			(MAX_NUMNODES * CPUS_PER_NODE)
 
 /*
  * This is the maximum number of NASIDS that can be present in a system.
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 971aa0d5d534..8fd3505e2b9c 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -42,7 +42,7 @@
 
 #define CPU_NONE		(cpuid_t)-1
 
-static DECLARE_BITMAP(hub_init_mask, MAX_COMPACT_NODES);
+static DECLARE_BITMAP(hub_init_mask, MAX_NUMNODES);
 nasid_t master_nasid = INVALID_NASID;
 
 struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 3e2f39dfbbf5..f610fff592a6 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -33,7 +33,7 @@
 #define SLOT_PFNSHIFT		(SLOT_SHIFT - PAGE_SHIFT)
 #define PFN_NASIDSHFT		(NASID_SHFT - PAGE_SHIFT)
 
-struct node_data *__node_data[MAX_COMPACT_NODES];
+struct node_data *__node_data[MAX_NUMNODES];
 
 EXPORT_SYMBOL(__node_data);
 
@@ -104,7 +104,7 @@ static void router_recurse(klrou_t *router_a, klrou_t *router_b, int depth)
 	router_a->rou_rflag = 0;
 }
 
-unsigned char __node_distances[MAX_COMPACT_NODES][MAX_COMPACT_NODES];
+unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
 EXPORT_SYMBOL(__node_distances);
 
 static int __init compute_node_distance(nasid_t nasid_a, nasid_t nasid_b)
@@ -173,8 +173,8 @@ static void __init init_topology_matrix(void)
 {
 	nasid_t row, col;
 
-	for (row = 0; row < MAX_COMPACT_NODES; row++)
-		for (col = 0; col < MAX_COMPACT_NODES; col++)
+	for (row = 0; row < MAX_NUMNODES; row++)
+		for (col = 0; col < MAX_NUMNODES; col++)
 			__node_distances[row][col] = -1;
 
 	for_each_online_node(row) {
@@ -412,7 +412,7 @@ void __init prom_meminit(void)
 	szmem();
 	max_low_pfn = PHYS_PFN(memblock_end_of_DRAM());
 
-	for (node = 0; node < MAX_COMPACT_NODES; node++) {
+	for (node = 0; node < MAX_NUMNODES; node++) {
 		if (node_online(node)) {
 			node_mem_init(node);
 			continue;
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index c38df7c62964..faa0244c8b0c 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -81,12 +81,8 @@ void cpu_node_probe(void)
 	int i, highest = 0;
 	gda_t *gdap = GDA;
 
-	/*
-	 * MCD - this whole "compact node" stuff can probably be dropped,
-	 * as we can handle sparse numbering now
-	 */
 	nodes_clear(node_online_map);
-	for (i = 0; i < MAX_COMPACT_NODES; i++) {
+	for (i = 0; i < MAX_NUMNODES; i++) {
 		nasid_t nasid = gdap->g_nasidtable[i];
 		if (nasid == INVALID_NASID)
 			break;
-- 
2.16.4

