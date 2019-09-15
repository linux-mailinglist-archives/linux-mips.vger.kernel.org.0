Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A93CCB2F30
	for <lists+linux-mips@lfdr.de>; Sun, 15 Sep 2019 10:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfIOIX2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Sep 2019 04:23:28 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2222 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726146AbfIOIX2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 15 Sep 2019 04:23:28 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id AB7421CCDE4946DBBE9E;
        Sun, 15 Sep 2019 16:23:22 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Sun, 15 Sep 2019 16:23:18 +0800
From:   Yunsheng Lin <linyunsheng@huawei.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
        <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
        <mattst88@gmail.com>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <mpe@ellerman.id.au>,
        <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
        <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>,
        <dalias@libc.org>, <davem@davemloft.net>, <ralf@linux-mips.org>,
        <paul.burton@mips.com>, <jhogan@kernel.org>,
        <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>
CC:     <akpm@linux-foundation.org>, <rppt@linux.ibm.com>,
        <anshuman.khandual@arm.com>, <tglx@linutronix.de>, <cai@lca.pw>,
        <robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <peterz@infradead.org>, <len.brown@intel.com>, <axboe@kernel.dk>,
        <dledford@redhat.com>, <jeffrey.t.kirsher@intel.com>,
        <linux-alpha@vger.kernel.org>, <naveen.n.rao@linux.vnet.ibm.com>,
        <mwb@linux.vnet.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
        <sparclinux@vger.kernel.org>, <tbogendoerfer@suse.de>,
        <linux-mips@vger.kernel.org>, <rafael@kernel.org>,
        <mhocko@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH v4] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date:   Sun, 15 Sep 2019 16:20:56 +0800
Message-ID: <1568535656-158979-1-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When passing the return value of dev_to_node() to cpumask_of_node()
without checking if the device's node id is NUMA_NO_NODE, there is
global-out-of-bounds detected by KASAN.

From the discussion [1], NUMA_NO_NODE really means no node affinity,
which also means all cpus should be usable. So the cpumask_of_node()
should always return all cpus online when user passes the node id as
NUMA_NO_NODE, just like similar semantic that page allocator handles
NUMA_NO_NODE.

But we cannot really copy the page allocator logic. Simply because the
page allocator doesn't enforce the near node affinity. It just picks it
up as a preferred node but then it is free to fallback to any other numa
node. This is not the case here and node_to_cpumask_map will only restrict
to the particular node's cpus which would have really non deterministic
behavior depending on where the code is executed. So in fact we really
want to return cpu_online_mask for NUMA_NO_NODE.

Some arches were already NUMA_NO_NODE aware, so only change them to return
cpu_online_mask and use NUMA_NO_NODE instead of "-1".

Also there is a debugging version of node_to_cpumask_map() for x86 and
arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
And "fix" a sign "bug" since it is for debugging and should catch all the
error cases.

[1] https://lore.kernel.org/patchwork/patch/1125789/
Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
Suggested-by: Michal Hocko <mhocko@kernel.org>
---
V4: Have all these changes in a single patch.
V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
    for NUMA_NO_NODE case, and change the commit log to better justify
    the change.
V2: make the node id checking change to other arches too.
---
 arch/alpha/include/asm/topology.h                | 2 +-
 arch/arm64/include/asm/numa.h                    | 3 +++
 arch/arm64/mm/numa.c                             | 5 ++++-
 arch/mips/include/asm/mach-ip27/topology.h       | 4 ++--
 arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
 arch/powerpc/include/asm/topology.h              | 6 +++---
 arch/s390/include/asm/topology.h                 | 3 +++
 arch/sparc/include/asm/topology_64.h             | 6 +++---
 arch/x86/include/asm/topology.h                  | 3 +++
 arch/x86/mm/numa.c                               | 7 +++++--
 10 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/arch/alpha/include/asm/topology.h b/arch/alpha/include/asm/topology.h
index 5a77a40..836c9e2 100644
--- a/arch/alpha/include/asm/topology.h
+++ b/arch/alpha/include/asm/topology.h
@@ -31,7 +31,7 @@ static const struct cpumask *cpumask_of_node(int node)
 	int cpu;
 
 	if (node == NUMA_NO_NODE)
-		return cpu_all_mask;
+		return cpu_online_mask;
 
 	cpumask_clear(&node_to_cpumask_map[node]);
 
diff --git a/arch/arm64/include/asm/numa.h b/arch/arm64/include/asm/numa.h
index 626ad01..c8a4b31 100644
--- a/arch/arm64/include/asm/numa.h
+++ b/arch/arm64/include/asm/numa.h
@@ -25,6 +25,9 @@ const struct cpumask *cpumask_of_node(int node);
 /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
 static inline const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	return node_to_cpumask_map[node];
 }
 #endif
diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 4f241cc..bef4bdd 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -46,7 +46,10 @@ EXPORT_SYMBOL(node_to_cpumask_map);
  */
 const struct cpumask *cpumask_of_node(int node)
 {
-	if (WARN_ON(node >= nr_node_ids))
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
+	if (WARN_ON((unsigned int)node >= nr_node_ids))
 		return cpu_none_mask;
 
 	if (WARN_ON(node_to_cpumask_map[node] == NULL))
diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
index 965f079..04505e6 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -15,8 +15,8 @@ struct cpuinfo_ip27 {
 extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
 
 #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
-#define cpumask_of_node(node)	((node) == -1 ?				\
-				 cpu_all_mask :				\
+#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
+				 cpu_online_mask :			\
 				 &hub_data(node)->h_cpus)
 struct pci_bus;
 extern int pcibus_to_node(struct pci_bus *);
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
index 7ff819a..e78daa6 100644
--- a/arch/mips/include/asm/mach-loongson64/topology.h
+++ b/arch/mips/include/asm/mach-loongson64/topology.h
@@ -5,7 +5,9 @@
 #ifdef CONFIG_NUMA
 
 #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
-#define cpumask_of_node(node)	(&__node_data[(node)]->cpumask)
+#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
+				 cpu_online_mask :			\
+				 &__node_data[(node)]->cpumask)
 
 struct pci_bus;
 extern int pcibus_to_node(struct pci_bus *);
diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 2f7e1ea..309f847 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -17,9 +17,9 @@ struct device_node;
 
 #include <asm/mmzone.h>
 
-#define cpumask_of_node(node) ((node) == -1 ?				\
-			       cpu_all_mask :				\
-			       node_to_cpumask_map[node])
+#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
+				 cpu_online_mask :			\
+				 node_to_cpumask_map[node])
 
 struct pci_bus;
 #ifdef CONFIG_PCI
diff --git a/arch/s390/include/asm/topology.h b/arch/s390/include/asm/topology.h
index cca406f..1bd2e73 100644
--- a/arch/s390/include/asm/topology.h
+++ b/arch/s390/include/asm/topology.h
@@ -78,6 +78,9 @@ static inline int cpu_to_node(int cpu)
 #define cpumask_of_node cpumask_of_node
 static inline const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	return &node_to_cpumask_map[node];
 }
 
diff --git a/arch/sparc/include/asm/topology_64.h b/arch/sparc/include/asm/topology_64.h
index 34c628a..8c29357 100644
--- a/arch/sparc/include/asm/topology_64.h
+++ b/arch/sparc/include/asm/topology_64.h
@@ -11,9 +11,9 @@ static inline int cpu_to_node(int cpu)
 	return numa_cpu_lookup_table[cpu];
 }
 
-#define cpumask_of_node(node) ((node) == -1 ?				\
-			       cpu_all_mask :				\
-			       &numa_cpumask_lookup_table[node])
+#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
+				 cpu_online_mask :			\
+				 &numa_cpumask_lookup_table[node])
 
 struct pci_bus;
 #ifdef CONFIG_PCI
diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 4b14d23..7fa82e1 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -69,6 +69,9 @@ extern const struct cpumask *cpumask_of_node(int node);
 /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
 static inline const struct cpumask *cpumask_of_node(int node)
 {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
 	return node_to_cpumask_map[node];
 }
 #endif
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index e6dad60..c676ffb 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -861,9 +861,12 @@ void numa_remove_cpu(int cpu)
  */
 const struct cpumask *cpumask_of_node(int node)
 {
-	if (node >= nr_node_ids) {
+	if (node == NUMA_NO_NODE)
+		return cpu_online_mask;
+
+	if ((unsigned int)node >= nr_node_ids) {
 		printk(KERN_WARNING
-			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
+			"cpumask_of_node(%d): node >= nr_node_ids(%u)\n",
 			node, nr_node_ids);
 		dump_stack();
 		return cpu_none_mask;
-- 
2.8.1

