Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBBE49FC8F
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jan 2022 16:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240598AbiA1PQF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Jan 2022 10:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45703 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240420AbiA1PQF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Jan 2022 10:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643382964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gp3X2Tu2ffVsRn9QFqpvFZ1PDzoe87OXdTEsBZY8VHU=;
        b=cYDGrrxjkq+gihj1epWD06PZx7MNaZt2Cwx9T6KMorpd2UhhUWK/KATddNheCPKyLpd6Bh
        NPsSCSvM9LaspmqFGoAMGxK3EgpWIs2tyk6ZxzYXS2zbxraeej6VGm0HYII3j0li0EHJbs
        FKWA2b9ZrzWHhCVzWyTx09w3RAwRXqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-kNCsxwTgMkyB3PS66SdA0A-1; Fri, 28 Jan 2022 10:16:00 -0500
X-MC-Unique: kNCsxwTgMkyB3PS66SdA0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0913F1923E34;
        Fri, 28 Jan 2022 15:15:52 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A3AA579A19;
        Fri, 28 Jan 2022 15:15:41 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: [PATCH RFC v1] drivers/base/node: consolidate node device subsystem initialization in node_dev_init()
Date:   Fri, 28 Jan 2022 16:15:40 +0100
Message-Id: <20220128151540.164759-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

... and call node_dev_init() after memory_dev_init() from driver_init(),
so before any of the existing arch/subsys calls. All online nodes should
be known at that point.

This is in line with memory_dev_init(), which initializes the memory
device subsystem and creates all memory block devices.

Similar to memory_dev_init(), panic() if anything goes wrong, we don't
want to continue with such basic initialization errors.

The important part is that node_dev_init() gets called after
memory_dev_init() and after cpu_dev_init(), but before any of the
relevant archs call register_cpu() to register the new cpu device under
the node device. The latter should be the case for the current users
of topology_init().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: David Hildenbrand <david@redhat.com>

---

RFC because I tested only on x86-64 and s390x, I think I cross-compiled all
applicable architectures except riscv and sparc.

This is somewhat a preparation for detecting if a memory block
(/sys/devices/system/memory/memory*) is managed by a single zone, and
storing the zone for the memory block -- to get rid of
test_pages_in_a_zone(). For that, we want to know all nodes that are
applicable for a single memory block (mem->nid), which is determined when
registering the node.

While this change might not be strictly required for that change, this
way it's easier to see when the nodes are gettin created and
consequently when the node ids for a memory block are determined.

---
 arch/arm64/kernel/setup.c   |  3 ---
 arch/ia64/kernel/topology.c | 10 ----------
 arch/mips/kernel/topology.c |  5 -----
 arch/powerpc/kernel/sysfs.c | 17 -----------------
 arch/riscv/kernel/setup.c   |  3 ---
 arch/s390/kernel/numa.c     |  7 -------
 arch/sh/kernel/topology.c   |  5 -----
 arch/sparc/kernel/sysfs.c   | 12 ------------
 arch/x86/kernel/topology.c  |  5 -----
 drivers/base/init.c         |  1 +
 drivers/base/node.c         | 30 +++++++++++++++++-------------
 include/linux/node.h        |  4 ++++
 12 files changed, 22 insertions(+), 80 deletions(-)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index f70573928f1b..3505789cf4bd 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -406,9 +406,6 @@ static int __init topology_init(void)
 {
 	int i;
 
-	for_each_online_node(i)
-		register_one_node(i);
-
 	for_each_possible_cpu(i) {
 		struct cpu *cpu = &per_cpu(cpu_data.cpu, i);
 		cpu->hotpluggable = cpu_can_disable(i);
diff --git a/arch/ia64/kernel/topology.c b/arch/ia64/kernel/topology.c
index e4992917a24b..94a848b06f15 100644
--- a/arch/ia64/kernel/topology.c
+++ b/arch/ia64/kernel/topology.c
@@ -70,16 +70,6 @@ static int __init topology_init(void)
 {
 	int i, err = 0;
 
-#ifdef CONFIG_NUMA
-	/*
-	 * MCD - Do we want to register all ONLINE nodes, or all POSSIBLE nodes?
-	 */
-	for_each_online_node(i) {
-		if ((err = register_one_node(i)))
-			goto out;
-	}
-#endif
-
 	sysfs_cpus = kcalloc(NR_CPUS, sizeof(struct ia64_cpu), GFP_KERNEL);
 	if (!sysfs_cpus)
 		panic("kzalloc in topology_init failed - NR_CPUS too big?");
diff --git a/arch/mips/kernel/topology.c b/arch/mips/kernel/topology.c
index 08ad6371fbe0..9429d85a4703 100644
--- a/arch/mips/kernel/topology.c
+++ b/arch/mips/kernel/topology.c
@@ -12,11 +12,6 @@ static int __init topology_init(void)
 {
 	int i, ret;
 
-#ifdef CONFIG_NUMA
-	for_each_online_node(i)
-		register_one_node(i);
-#endif /* CONFIG_NUMA */
-
 	for_each_present_cpu(i) {
 		struct cpu *c = &per_cpu(cpu_devices, i);
 
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index d45a415d5374..2069bbb90a9a 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -1110,14 +1110,6 @@ EXPORT_SYMBOL_GPL(cpu_remove_dev_attr_group);
 /* NUMA stuff */
 
 #ifdef CONFIG_NUMA
-static void __init register_nodes(void)
-{
-	int i;
-
-	for (i = 0; i < MAX_NUMNODES; i++)
-		register_one_node(i);
-}
-
 int sysfs_add_device_to_node(struct device *dev, int nid)
 {
 	struct node *node = node_devices[nid];
@@ -1132,13 +1124,6 @@ void sysfs_remove_device_from_node(struct device *dev, int nid)
 	sysfs_remove_link(&node->dev.kobj, kobject_name(&dev->kobj));
 }
 EXPORT_SYMBOL_GPL(sysfs_remove_device_from_node);
-
-#else
-static void __init register_nodes(void)
-{
-	return;
-}
-
 #endif
 
 /* Only valid if CPU is present. */
@@ -1155,8 +1140,6 @@ static int __init topology_init(void)
 {
 	int cpu, r;
 
-	register_nodes();
-
 	for_each_possible_cpu(cpu) {
 		struct cpu *c = &per_cpu(cpu_devices, cpu);
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b42bfdc67482..834eb652a7b9 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -301,9 +301,6 @@ static int __init topology_init(void)
 {
 	int i, ret;
 
-	for_each_online_node(i)
-		register_one_node(i);
-
 	for_each_possible_cpu(i) {
 		struct cpu *cpu = &per_cpu(cpu_devices, i);
 
diff --git a/arch/s390/kernel/numa.c b/arch/s390/kernel/numa.c
index 51c5a9f6e525..23ab9f02f278 100644
--- a/arch/s390/kernel/numa.c
+++ b/arch/s390/kernel/numa.c
@@ -33,10 +33,3 @@ void __init numa_setup(void)
 	NODE_DATA(0)->node_spanned_pages = memblock_end_of_DRAM() >> PAGE_SHIFT;
 	NODE_DATA(0)->node_id = 0;
 }
-
-static int __init numa_init_late(void)
-{
-	register_one_node(0);
-	return 0;
-}
-arch_initcall(numa_init_late);
diff --git a/arch/sh/kernel/topology.c b/arch/sh/kernel/topology.c
index 76af6db9daa2..2d2a7509b565 100644
--- a/arch/sh/kernel/topology.c
+++ b/arch/sh/kernel/topology.c
@@ -46,11 +46,6 @@ static int __init topology_init(void)
 {
 	int i, ret;
 
-#ifdef CONFIG_NUMA
-	for_each_online_node(i)
-		register_one_node(i);
-#endif
-
 	for_each_present_cpu(i) {
 		struct cpu *c = &per_cpu(cpu_devices, i);
 
diff --git a/arch/sparc/kernel/sysfs.c b/arch/sparc/kernel/sysfs.c
index 6d60d416f0dd..f19487e4cc71 100644
--- a/arch/sparc/kernel/sysfs.c
+++ b/arch/sparc/kernel/sysfs.c
@@ -244,22 +244,10 @@ static void __init check_mmu_stats(void)
 		mmu_stats_supported = 1;
 }
 
-static void register_nodes(void)
-{
-#ifdef CONFIG_NUMA
-	int i;
-
-	for (i = 0; i < MAX_NUMNODES; i++)
-		register_one_node(i);
-#endif
-}
-
 static int __init topology_init(void)
 {
 	int cpu, ret;
 
-	register_nodes();
-
 	check_mmu_stats();
 
 	for_each_possible_cpu(cpu) {
diff --git a/arch/x86/kernel/topology.c b/arch/x86/kernel/topology.c
index bd83748e2bde..8617d1ed9d31 100644
--- a/arch/x86/kernel/topology.c
+++ b/arch/x86/kernel/topology.c
@@ -154,11 +154,6 @@ static int __init topology_init(void)
 {
 	int i;
 
-#ifdef CONFIG_NUMA
-	for_each_online_node(i)
-		register_one_node(i);
-#endif
-
 	for_each_present_cpu(i)
 		arch_register_cpu(i);
 
diff --git a/drivers/base/init.c b/drivers/base/init.c
index a9f57c22fb9e..d8d0fe687111 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -35,5 +35,6 @@ void __init driver_init(void)
 	auxiliary_bus_init();
 	cpu_dev_init();
 	memory_dev_init();
+	node_dev_init();
 	container_dev_init();
 }
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 87acc47e8951..a133981a12fc 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -1065,26 +1065,30 @@ static const struct attribute_group *cpu_root_attr_groups[] = {
 };
 
 #define NODE_CALLBACK_PRI	2	/* lower than SLAB */
-static int __init register_node_type(void)
+void __init node_dev_init(void)
 {
-	int ret;
+	static struct notifier_block node_memory_callback_nb = {
+		.notifier_call = node_memory_callback,
+		.priority = NODE_CALLBACK_PRI,
+	};
+	int ret, i;
 
  	BUILD_BUG_ON(ARRAY_SIZE(node_state_attr) != NR_NODE_STATES);
  	BUILD_BUG_ON(ARRAY_SIZE(node_state_attrs)-1 != NR_NODE_STATES);
 
 	ret = subsys_system_register(&node_subsys, cpu_root_attr_groups);
-	if (!ret) {
-		static struct notifier_block node_memory_callback_nb = {
-			.notifier_call = node_memory_callback,
-			.priority = NODE_CALLBACK_PRI,
-		};
-		register_hotmemory_notifier(&node_memory_callback_nb);
-	}
+	if (ret)
+		panic("%s() failed to register subsystem: %d\n", __func__, ret);
+
+	register_hotmemory_notifier(&node_memory_callback_nb);
 
 	/*
-	 * Note:  we're not going to unregister the node class if we fail
-	 * to register the node state class attribute files.
+	 * Create all node devices, which will properly link the node
+	 * to applicable memory block devices and already created cpu devices.
 	 */
-	return ret;
+	for_each_online_node(i) {
+		ret = register_one_node(i);
+		if (ret)
+			panic("%s() failed to add node: %d\n", __func__, ret);
+	}
 }
-postcore_initcall(register_node_type);
diff --git a/include/linux/node.h b/include/linux/node.h
index bb21fd631b16..f3be6ccfebed 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -112,6 +112,7 @@ static inline void link_mem_sections(int nid, unsigned long start_pfn,
 
 extern void unregister_node(struct node *node);
 #ifdef CONFIG_NUMA
+extern void node_dev_init(void);
 /* Core of the node registration - only memory hotplug should use this */
 extern int __register_one_node(int nid);
 
@@ -149,6 +150,9 @@ extern void register_hugetlbfs_with_node(node_registration_func_t doregister,
 					 node_registration_func_t unregister);
 #endif
 #else
+static inline void node_dev_init(void)
+{
+}
 static inline int __register_one_node(int nid)
 {
 	return 0;

base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.34.1

