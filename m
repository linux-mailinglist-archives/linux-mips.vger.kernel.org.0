Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29EC4C9E68
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 14:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfJCM1k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Oct 2019 08:27:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:37866 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725827AbfJCM1k (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Oct 2019 08:27:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5436AADF7;
        Thu,  3 Oct 2019 12:27:34 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: SGI-IP27: get rid of compact node ids
Date:   Thu,  3 Oct 2019 14:27:24 +0200
Message-Id: <20191003122724.12239-2-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191003122724.12239-1-tbogendoerfer@suse.de>
References: <20191003122724.12239-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Node ids don't need to be contiguous in Linux, so the concept to
use compact node ids to make them contiguous isn't needed at all.
This patchset therefore removes it.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/mach-ip27/mmzone.h   |  2 +-
 arch/mips/include/asm/mach-ip27/topology.h |  3 +-
 arch/mips/include/asm/sn/agent.h           |  2 +-
 arch/mips/include/asm/sn/arch.h            | 23 ----------
 arch/mips/include/asm/sn/hub.h             |  4 +-
 arch/mips/include/asm/sn/mapped_kernel.h   |  4 +-
 arch/mips/include/asm/sn/sn_private.h      |  5 +--
 arch/mips/include/asm/sn/types.h           |  1 -
 arch/mips/pci/pci-xtalk-bridge.c           |  2 +-
 arch/mips/sgi-ip27/ip27-hubio.c            | 10 ++---
 arch/mips/sgi-ip27/ip27-init.c             | 33 ++++----------
 arch/mips/sgi-ip27/ip27-irq.c              |  4 +-
 arch/mips/sgi-ip27/ip27-klconfig.c         | 14 +-----
 arch/mips/sgi-ip27/ip27-klnuma.c           | 21 ++++-----
 arch/mips/sgi-ip27/ip27-memory.c           | 57 ++++++++---------------
 arch/mips/sgi-ip27/ip27-nmi.c              | 16 ++-----
 arch/mips/sgi-ip27/ip27-reset.c            |  6 +--
 arch/mips/sgi-ip27/ip27-smp.c              | 72 +++++++-----------------------
 arch/mips/sgi-ip27/ip27-timer.c            |  4 +-
 arch/mips/sgi-ip27/ip27-xtalk.c            | 10 ++---
 20 files changed, 81 insertions(+), 212 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/mmzone.h b/arch/mips/include/asm/mach-ip27/mmzone.h
index 1cd6a23a84f2..f463826515df 100644
--- a/arch/mips/include/asm/mach-ip27/mmzone.h
+++ b/arch/mips/include/asm/mach-ip27/mmzone.h
@@ -6,7 +6,7 @@
 #include <asm/sn/arch.h>
 #include <asm/sn/hub.h>
 
-#define pa_to_nid(addr)		NASID_TO_COMPACT_NODEID(NASID_GET(addr))
+#define pa_to_nid(addr)		NASID_GET(addr)
 
 struct hub_data {
 	kern_vars_t	kern_vars;
diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
index 965f0793a5f9..a717af9177ff 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -7,14 +7,13 @@
 #include <asm/mmzone.h>
 
 struct cpuinfo_ip27 {
-	cnodeid_t	p_nodeid;	/* my node ID in compact-id-space */
 	nasid_t		p_nasid;	/* my node ID in numa-as-id-space */
 	unsigned char	p_slice;	/* Physical position on node board */
 };
 
 extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
 
-#define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
+#define cpu_to_node(cpu)	(cputonasid(cpu))
 #define cpumask_of_node(node)	((node) == -1 ?				\
 				 cpu_all_mask :				\
 				 &hub_data(node)->h_cpus)
diff --git a/arch/mips/include/asm/sn/agent.h b/arch/mips/include/asm/sn/agent.h
index e33d09293019..7e9b3271737a 100644
--- a/arch/mips/include/asm/sn/agent.h
+++ b/arch/mips/include/asm/sn/agent.h
@@ -26,7 +26,7 @@
 
 #if defined(CONFIG_SGI_IP27)
 #define HUB_NIC_ADDR(_cpuid)						   \
-	REMOTE_HUB_ADDR(COMPACT_TO_NASID_NODEID(cpu_to_node(_cpuid)),	    \
+	REMOTE_HUB_ADDR(cpu_to_node(_cpuid),				   \
 		MD_MLAN_CTL)
 #endif
 
diff --git a/arch/mips/include/asm/sn/arch.h b/arch/mips/include/asm/sn/arch.h
index 97fa2b6440a1..f7d3273d9599 100644
--- a/arch/mips/include/asm/sn/arch.h
+++ b/arch/mips/include/asm/sn/arch.h
@@ -21,34 +21,11 @@
 #define cputoslice(cpu)		(sn_cpu_info[(cpu)].p_slice)
 
 #define INVALID_NASID		(nasid_t)-1
-#define INVALID_CNODEID		(cnodeid_t)-1
 #define INVALID_PNODEID		(pnodeid_t)-1
 #define INVALID_MODULE		(moduleid_t)-1
 #define INVALID_PARTID		(partid_t)-1
 
 extern nasid_t get_nasid(void);
-extern cnodeid_t get_cpu_cnode(cpuid_t);
 extern int get_cpu_slice(cpuid_t);
 
-/*
- * NO ONE should access these arrays directly.	The only reason we refer to
- * them here is to avoid the procedure call that would be required in the
- * macros below.  (Really want private data members here :-)
- */
-extern cnodeid_t nasid_to_compact_node[MAX_NASIDS];
-extern nasid_t compact_to_nasid_node[MAX_COMPACT_NODES];
-
-/*
- * These macros are used by various parts of the kernel to convert
- * between the three different kinds of node numbering.	  At least some
- * of them may change to procedure calls in the future, but the macros
- * will continue to work.  Don't use the arrays above directly.
- */
-
-extern cnodeid_t cpuid_to_compact_node[MAXCPUS];
-
-#define NASID_TO_COMPACT_NODEID(nnode)	(nasid_to_compact_node[nnode])
-#define COMPACT_TO_NASID_NODEID(cnode)	(compact_to_nasid_node[cnode])
-#define CPUID_TO_COMPACT_NODEID(cpu)	(cpuid_to_compact_node[(cpu)])
-
 #endif /* _ASM_SN_ARCH_H */
diff --git a/arch/mips/include/asm/sn/hub.h b/arch/mips/include/asm/sn/hub.h
index 338f7eed74f1..45878fbefbae 100644
--- a/arch/mips/include/asm/sn/hub.h
+++ b/arch/mips/include/asm/sn/hub.h
@@ -10,8 +10,8 @@
 #include <asm/xtalk/xtalk.h>
 
 /* ip27-hubio.c */
-extern unsigned long hub_pio_map(cnodeid_t cnode, xwidgetnum_t widget,
+extern unsigned long hub_pio_map(nasid_t nasid, xwidgetnum_t widget,
 			  unsigned long xtalk_addr, size_t size);
-extern void hub_pio_init(cnodeid_t cnode);
+extern void hub_pio_init(nasid_t nasid);
 
 #endif /* __ASM_SN_HUB_H */
diff --git a/arch/mips/include/asm/sn/mapped_kernel.h b/arch/mips/include/asm/sn/mapped_kernel.h
index 2f3efa91c16e..3f1049807018 100644
--- a/arch/mips/include/asm/sn/mapped_kernel.h
+++ b/arch/mips/include/asm/sn/mapped_kernel.h
@@ -37,10 +37,10 @@
 
 #define MAPPED_KERN_RO_TO_PHYS(x) \
 				((unsigned long)MAPPED_ADDR_RO_TO_PHYS(x) | \
-				MAPPED_KERN_RO_PHYSBASE(get_compact_nodeid()))
+				MAPPED_KERN_RO_PHYSBASE(get_nasid()))
 #define MAPPED_KERN_RW_TO_PHYS(x) \
 				((unsigned long)MAPPED_ADDR_RW_TO_PHYS(x) | \
-				MAPPED_KERN_RW_PHYSBASE(get_compact_nodeid()))
+				MAPPED_KERN_RW_PHYSBASE(get_nasid()))
 
 #else /* CONFIG_MAPPED_KERNEL */
 
diff --git a/arch/mips/include/asm/sn/sn_private.h b/arch/mips/include/asm/sn/sn_private.h
index f09ba846c644..63a2c30d81c6 100644
--- a/arch/mips/include/asm/sn/sn_private.h
+++ b/arch/mips/include/asm/sn/sn_private.h
@@ -7,14 +7,13 @@
 extern nasid_t master_nasid;
 
 extern void cpu_node_probe(void);
-extern cnodeid_t get_compact_nodeid(void);
-extern void hub_rtc_init(cnodeid_t);
+extern void hub_rtc_init(nasid_t nasid);
 extern void cpu_time_init(void);
 extern void per_cpu_init(void);
 extern void install_cpu_nmi_handler(int slice);
 extern void install_ipi(void);
 extern void setup_replication_mask(void);
 extern void replicate_kernel_text(void);
-extern unsigned long node_getfirstfree(cnodeid_t);
+extern unsigned long node_getfirstfree(nasid_t nasid);
 
 #endif /* __ASM_SN_SN_PRIVATE_H */
diff --git a/arch/mips/include/asm/sn/types.h b/arch/mips/include/asm/sn/types.h
index f9d0bc2007c3..203c927e84d1 100644
--- a/arch/mips/include/asm/sn/types.h
+++ b/arch/mips/include/asm/sn/types.h
@@ -13,7 +13,6 @@
 
 typedef unsigned long	cpuid_t;
 typedef signed short	nasid_t;	/* node id in numa-as-id space */
-typedef signed short	cnodeid_t;	/* node id in compact-id space */
 typedef signed char	partid_t;	/* partition ID type */
 typedef signed short	moduleid_t;	/* user-visible module number type */
 
diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index dcf6117a17c3..312632171832 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -296,7 +296,7 @@ static int bridge_set_affinity(struct irq_data *d, const struct cpumask *mask,
 	ret = irq_chip_set_affinity_parent(d, mask, force);
 	if (ret >= 0) {
 		cpu = cpumask_first_and(mask, cpu_online_mask);
-		nasid = COMPACT_TO_NASID_NODEID(cpu_to_node(cpu));
+		nasid = cpu_to_node(cpu);
 		bridge_write(data->bc, b_int_addr[pin].addr,
 			     (((data->bc->intr_addr >> 30) & 0x30000) |
 			      bit | (nasid << 8)));
diff --git a/arch/mips/sgi-ip27/ip27-hubio.c b/arch/mips/sgi-ip27/ip27-hubio.c
index 6ebb8845a77c..a538d0ceb61d 100644
--- a/arch/mips/sgi-ip27/ip27-hubio.c
+++ b/arch/mips/sgi-ip27/ip27-hubio.c
@@ -25,10 +25,9 @@ static int force_fire_and_forget = 1;
  * @size:	size of the PIO mapping
  *
  **/
-unsigned long hub_pio_map(cnodeid_t cnode, xwidgetnum_t widget,
+unsigned long hub_pio_map(nasid_t nasid, xwidgetnum_t widget,
 			  unsigned long xtalk_addr, size_t size)
 {
-	nasid_t nasid = COMPACT_TO_NASID_NODEID(cnode);
 	unsigned i;
 
 	/* use small-window mapping if possible */
@@ -44,7 +43,7 @@ unsigned long hub_pio_map(cnodeid_t cnode, xwidgetnum_t widget,
 
 	xtalk_addr &= ~(BWIN_SIZE-1);
 	for (i = 0; i < HUB_NUM_BIG_WINDOW; i++) {
-		if (test_and_set_bit(i, hub_data(cnode)->h_bigwin_used))
+		if (test_and_set_bit(i, hub_data(nasid)->h_bigwin_used))
 			continue;
 
 		/*
@@ -171,13 +170,12 @@ static void hub_set_piomode(nasid_t nasid)
  *
  * @hub:	hubinfo structure for our hub
  */
-void hub_pio_init(cnodeid_t cnode)
+void hub_pio_init(nasid_t nasid)
 {
-	nasid_t nasid = COMPACT_TO_NASID_NODEID(cnode);
 	unsigned i;
 
 	/* initialize big window piomaps for this hub */
-	bitmap_zero(hub_data(cnode)->h_bigwin_used, HUB_NUM_BIG_WINDOW);
+	bitmap_zero(hub_data(nasid)->h_bigwin_used, HUB_NUM_BIG_WINDOW);
 	for (i = 0; i < HUB_NUM_BIG_WINDOW; i++)
 		IIO_ITTE_DISABLE(nasid, i);
 
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 59d5375c9021..1dad799758c4 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -41,25 +41,16 @@
 static DECLARE_BITMAP(hub_init_mask, MAX_COMPACT_NODES);
 nasid_t master_nasid = INVALID_NASID;
 
-cnodeid_t	nasid_to_compact_node[MAX_NASIDS];
-nasid_t		compact_to_nasid_node[MAX_COMPACT_NODES];
-cnodeid_t	cpuid_to_compact_node[MAXCPUS];
-
-EXPORT_SYMBOL(nasid_to_compact_node);
-
 struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
 EXPORT_SYMBOL_GPL(sn_cpu_info);
 
-extern void pcibr_setup(cnodeid_t);
-
-static void per_hub_init(cnodeid_t cnode)
+static void per_hub_init(nasid_t nasid)
 {
-	struct hub_data *hub = hub_data(cnode);
-	nasid_t nasid = COMPACT_TO_NASID_NODEID(cnode);
+	struct hub_data *hub = hub_data(nasid);
 
 	cpumask_set_cpu(smp_processor_id(), &hub->h_cpus);
 
-	if (test_and_set_bit(cnode, hub_init_mask))
+	if (test_and_set_bit(nasid, hub_init_mask))
 		return;
 	/*
 	 * Set CRB timeout at 5ms, (< PI timeout of 10ms)
@@ -67,14 +58,14 @@ static void per_hub_init(cnodeid_t cnode)
 	REMOTE_HUB_S(nasid, IIO_ICTP, 0x800);
 	REMOTE_HUB_S(nasid, IIO_ICTO, 0xff);
 
-	hub_rtc_init(cnode);
+	hub_rtc_init(nasid);
 
 #ifdef CONFIG_REPLICATE_EXHANDLERS
 	/*
 	 * If this is not a headless node initialization,
 	 * copy over the caliased exception handlers.
 	 */
-	if (get_compact_nodeid() == cnode) {
+	if (get_nasid() == nasid) {
 		extern char except_vec2_generic, except_vec3_generic;
 		extern void build_tlb_refill_handler(void);
 
@@ -92,15 +83,15 @@ void per_cpu_init(void)
 {
 	int cpu = smp_processor_id();
 	int slice = LOCAL_HUB_L(PI_CPU_NUM);
-	cnodeid_t cnode = get_compact_nodeid();
-	struct hub_data *hub = hub_data(cnode);
+	nasid_t nasid = get_nasid();
+	struct hub_data *hub = hub_data(nasid);
 
 	if (test_and_set_bit(slice, &hub->slice_map))
 		return;
 
 	clear_c0_status(ST0_IM);
 
-	per_hub_init(cnode);
+	per_hub_init(nasid);
 
 	cpu_time_init();
 	install_ipi();
@@ -122,14 +113,6 @@ get_nasid(void)
 			 >> NSRI_NODEID_SHFT);
 }
 
-/*
- * Map the physical node id to a virtual node id (virtual node ids are contiguous).
- */
-cnodeid_t get_compact_nodeid(void)
-{
-	return NASID_TO_COMPACT_NODEID(get_nasid());
-}
-
 extern void ip27_reboot_setup(void);
 
 void __init plat_mem_setup(void)
diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index 37be04975831..5aef06e28a5b 100644
--- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -73,7 +73,7 @@ static void setup_hub_mask(struct hub_irq_data *hd, const struct cpumask *mask)
 	int cpu;
 
 	cpu = cpumask_first_and(mask, cpu_online_mask);
-	nasid = COMPACT_TO_NASID_NODEID(cpu_to_node(cpu));
+	nasid = cpu_to_node(cpu);
 	hd->cpu = cpu;
 	if (!cputoslice(cpu)) {
 		hd->irq_mask[0] = REMOTE_HUB_PTR(nasid, PI_INT_MASK0_A);
@@ -137,7 +137,7 @@ static int hub_domain_alloc(struct irq_domain *domain, unsigned int virq,
 			    handle_level_irq, NULL, NULL);
 
 	/* use CPU connected to nearest hub */
-	hub = hub_data(NASID_TO_COMPACT_NODEID(info->nasid));
+	hub = hub_data(info->nasid);
 	setup_hub_mask(hd, &hub->h_cpus);
 
 	/* Make sure it's not already pending when we connect it. */
diff --git a/arch/mips/sgi-ip27/ip27-klconfig.c b/arch/mips/sgi-ip27/ip27-klconfig.c
index 41171ff0c75e..6cb2160e7689 100644
--- a/arch/mips/sgi-ip27/ip27-klconfig.c
+++ b/arch/mips/sgi-ip27/ip27-klconfig.c
@@ -73,11 +73,6 @@ lboard_t *find_lboard_class(lboard_t *start, unsigned char brd_type)
 	return (lboard_t *)NULL;
 }
 
-cnodeid_t get_cpu_cnode(cpuid_t cpu)
-{
-	return CPUID_TO_COMPACT_NODEID(cpu);
-}
-
 klcpu_t *nasid_slice_to_cpuinfo(nasid_t nasid, int slice)
 {
 	lboard_t *brd;
@@ -102,19 +97,14 @@ klcpu_t *sn_get_cpuinfo(cpuid_t cpu)
 	nasid_t nasid;
 	int slice;
 	klcpu_t *acpu;
-	gda_t *gdap = GDA;
-	cnodeid_t cnode;
 
 	if (!(cpu < MAXCPUS)) {
 		printk("sn_get_cpuinfo: illegal cpuid 0x%lx\n", cpu);
 		return NULL;
 	}
 
-	cnode = get_cpu_cnode(cpu);
-	if (cnode == INVALID_CNODEID)
-		return NULL;
-
-	if ((nasid = gdap->g_nasidtable[cnode]) == INVALID_NASID)
+	nasid = cputonasid(cpu);
+	if (nasid  == INVALID_NASID)
 		return NULL;
 
 	for (slice = 0; slice < CPUS_PER_NODE; slice++) {
diff --git a/arch/mips/sgi-ip27/ip27-klnuma.c b/arch/mips/sgi-ip27/ip27-klnuma.c
index a4f01328de62..ee1c6ff4aa00 100644
--- a/arch/mips/sgi-ip27/ip27-klnuma.c
+++ b/arch/mips/sgi-ip27/ip27-klnuma.c
@@ -38,13 +38,13 @@ void __init setup_replication_mask(void)
 #error Kernel replication works with mapped kernel support. No calias support.
 #endif
 	{
-		cnodeid_t	cnode;
+		nasid_t nasid;
 
-		for_each_online_node(cnode) {
-			if (cnode == 0)
+		for_each_online_node(nasid) {
+			if (nasid == 0)
 				continue;
 			/* Advertise that we have a copy of the kernel */
-			cpumask_set_cpu(cnode, &ktext_repmask);
+			cpumask_set_cpu(nasid, &ktext_repmask);
 		}
 	}
 #endif
@@ -85,7 +85,6 @@ static __init void copy_kernel(nasid_t dest_nasid)
 
 void __init replicate_kernel_text(void)
 {
-	cnodeid_t cnode;
 	nasid_t client_nasid;
 	nasid_t server_nasid;
 
@@ -94,13 +93,12 @@ void __init replicate_kernel_text(void)
 	/* Record where the master node should get its kernel text */
 	set_ktext_source(master_nasid, master_nasid);
 
-	for_each_online_node(cnode) {
-		if (cnode == 0)
+	for_each_online_node(client_nasid) {
+		if (client_nasid == 0)
 			continue;
-		client_nasid = COMPACT_TO_NASID_NODEID(cnode);
 
 		/* Check if this node should get a copy of the kernel */
-		if (cpumask_test_cpu(cnode, &ktext_repmask)) {
+		if (cpumask_test_cpu(client_nasid, &ktext_repmask)) {
 			server_nasid = client_nasid;
 			copy_kernel(server_nasid);
 		}
@@ -115,17 +113,16 @@ void __init replicate_kernel_text(void)
  * data structures on the first couple of pages of the first slot of each
  * node. If this is the case, getfirstfree(node) > getslotstart(node, 0).
  */
-unsigned long node_getfirstfree(cnodeid_t cnode)
+unsigned long node_getfirstfree(nasid_t nasid)
 {
 	unsigned long loadbase = REP_BASE;
-	nasid_t nasid = COMPACT_TO_NASID_NODEID(cnode);
 	unsigned long offset;
 
 #ifdef CONFIG_MAPPED_KERNEL
 	loadbase += 16777216;
 #endif
 	offset = PAGE_ALIGN((unsigned long)(&_end)) - loadbase;
-	if ((cnode == 0) || (cpumask_test_cpu(cnode, &ktext_repmask)))
+	if ((nasid == 0) || (cpumask_test_cpu(nasid, &ktext_repmask)))
 		return TO_NODE(nasid, offset) >> PAGE_SHIFT;
 	else
 		return KDM_TO_PHYS(PAGE_ALIGN(SYMMON_STK_ADDR(nasid, 0))) >> PAGE_SHIFT;
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 9db8692fdece..3e2f39dfbbf5 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -44,23 +44,23 @@ static int is_fine_dirmode(void)
 	return ((LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_REGIONSIZE_MASK) >> NSRI_REGIONSIZE_SHFT) & REGIONSIZE_FINE;
 }
 
-static u64 get_region(cnodeid_t cnode)
+static u64 get_region(nasid_t nasid)
 {
 	if (fine_mode)
-		return COMPACT_TO_NASID_NODEID(cnode) >> NASID_TO_FINEREG_SHFT;
+		return nasid >> NASID_TO_FINEREG_SHFT;
 	else
-		return COMPACT_TO_NASID_NODEID(cnode) >> NASID_TO_COARSEREG_SHFT;
+		return nasid >> NASID_TO_COARSEREG_SHFT;
 }
 
 static u64 region_mask;
 
 static void gen_region_mask(u64 *region_mask)
 {
-	cnodeid_t cnode;
+	nasid_t nasid;
 
 	(*region_mask) = 0;
-	for_each_online_node(cnode) {
-		(*region_mask) |= 1ULL << get_region(cnode);
+	for_each_online_node(nasid) {
+		(*region_mask) |= 1ULL << get_region(nasid);
 	}
 }
 
@@ -111,16 +111,11 @@ static int __init compute_node_distance(nasid_t nasid_a, nasid_t nasid_b)
 {
 	klrou_t *router, *router_a = NULL, *router_b = NULL;
 	lboard_t *brd, *dest_brd;
-	cnodeid_t cnode;
 	nasid_t nasid;
 	int port;
 
 	/* Figure out which routers nodes in question are connected to */
-	for_each_online_node(cnode) {
-		nasid = COMPACT_TO_NASID_NODEID(cnode);
-
-		if (nasid == -1) continue;
-
+	for_each_online_node(nasid) {
 		brd = find_lboard_class((lboard_t *)KL_CONFIG_INFO(nasid),
 					KLTYPE_ROUTER);
 
@@ -176,19 +171,16 @@ static int __init compute_node_distance(nasid_t nasid_a, nasid_t nasid_b)
 
 static void __init init_topology_matrix(void)
 {
-	nasid_t nasid, nasid2;
-	cnodeid_t row, col;
+	nasid_t row, col;
 
 	for (row = 0; row < MAX_COMPACT_NODES; row++)
 		for (col = 0; col < MAX_COMPACT_NODES; col++)
 			__node_distances[row][col] = -1;
 
 	for_each_online_node(row) {
-		nasid = COMPACT_TO_NASID_NODEID(row);
 		for_each_online_node(col) {
-			nasid2 = COMPACT_TO_NASID_NODEID(col);
 			__node_distances[row][col] =
-				compute_node_distance(nasid, nasid2);
+				compute_node_distance(row, col);
 		}
 	}
 }
@@ -196,12 +188,11 @@ static void __init init_topology_matrix(void)
 static void __init dump_topology(void)
 {
 	nasid_t nasid;
-	cnodeid_t cnode;
 	lboard_t *brd, *dest_brd;
 	int port;
 	int router_num = 0;
 	klrou_t *router;
-	cnodeid_t row, col;
+	nasid_t row, col;
 
 	pr_info("************** Topology ********************\n");
 
@@ -216,11 +207,7 @@ static void __init dump_topology(void)
 		pr_cont("\n");
 	}
 
-	for_each_online_node(cnode) {
-		nasid = COMPACT_TO_NASID_NODEID(cnode);
-
-		if (nasid == -1) continue;
-
+	for_each_online_node(nasid) {
 		brd = find_lboard_class((lboard_t *)KL_CONFIG_INFO(nasid),
 					KLTYPE_ROUTER);
 
@@ -254,21 +241,17 @@ static void __init dump_topology(void)
 	}
 }
 
-static unsigned long __init slot_getbasepfn(cnodeid_t cnode, int slot)
+static unsigned long __init slot_getbasepfn(nasid_t nasid, int slot)
 {
-	nasid_t nasid = COMPACT_TO_NASID_NODEID(cnode);
-
 	return ((unsigned long)nasid << PFN_NASIDSHFT) | (slot << SLOT_PFNSHIFT);
 }
 
-static unsigned long __init slot_psize_compute(cnodeid_t node, int slot)
+static unsigned long __init slot_psize_compute(nasid_t nasid, int slot)
 {
-	nasid_t nasid;
 	lboard_t *brd;
 	klmembnk_t *banks;
 	unsigned long size;
 
-	nasid = COMPACT_TO_NASID_NODEID(node);
 	/* Find the node board */
 	brd = find_lboard((lboard_t *)KL_CONFIG_INFO(nasid), KLTYPE_IP27);
 	if (!brd)
@@ -298,7 +281,7 @@ static unsigned long __init slot_psize_compute(cnodeid_t node, int slot)
 
 static void __init mlreset(void)
 {
-	int i;
+	nasid_t nasid;
 
 	master_nasid = get_nasid();
 	fine_mode = is_fine_dirmode();
@@ -321,11 +304,7 @@ static void __init mlreset(void)
 	/*
 	 * Set all nodes' calias sizes to 8k
 	 */
-	for_each_online_node(i) {
-		nasid_t nasid;
-
-		nasid = COMPACT_TO_NASID_NODEID(i);
-
+	for_each_online_node(nasid) {
 		/*
 		 * Always have node 0 in the region mask, otherwise
 		 * CALIAS accesses get exceptions since the hub
@@ -354,7 +333,7 @@ static void __init szmem(void)
 {
 	unsigned long slot_psize, slot0sz = 0, nodebytes;	/* Hack to detect problem configs */
 	int slot;
-	cnodeid_t node;
+	nasid_t node;
 
 	for_each_online_node(node) {
 		nodebytes = 0;
@@ -384,7 +363,7 @@ static void __init szmem(void)
 	}
 }
 
-static void __init node_mem_init(cnodeid_t node)
+static void __init node_mem_init(nasid_t node)
 {
 	unsigned long slot_firstpfn = slot_getbasepfn(node, 0);
 	unsigned long slot_freepfn = node_getfirstfree(node);
@@ -427,7 +406,7 @@ static struct node_data null_node = {
  */
 void __init prom_meminit(void)
 {
-	cnodeid_t node;
+	nasid_t node;
 
 	mlreset();
 	szmem();
diff --git a/arch/mips/sgi-ip27/ip27-nmi.c b/arch/mips/sgi-ip27/ip27-nmi.c
index 3aae388561d9..daf3670d94e7 100644
--- a/arch/mips/sgi-ip27/ip27-nmi.c
+++ b/arch/mips/sgi-ip27/ip27-nmi.c
@@ -17,8 +17,6 @@
 #define NODE_NUM_CPUS(n)	CPUS_PER_NODE
 #endif
 
-#define CNODEID_NONE (cnodeid_t)-1
-
 typedef unsigned long machreg_t;
 
 static arch_spinlock_t nmi_lock = __ARCH_SPIN_LOCK_UNLOCKED;
@@ -152,16 +150,10 @@ void nmi_dump_hub_irq(nasid_t nasid, int slice)
  * Copy the cpu registers which have been saved in the IP27prom format
  * into the eframe format for the node under consideration.
  */
-void nmi_node_eframe_save(cnodeid_t  cnode)
+void nmi_node_eframe_save(nasid_t nasid)
 {
-	nasid_t nasid;
 	int slice;
 
-	/* Make sure that we have a valid node */
-	if (cnode == CNODEID_NONE)
-		return;
-
-	nasid = COMPACT_TO_NASID_NODEID(cnode);
 	if (nasid == INVALID_NASID)
 		return;
 
@@ -178,10 +170,10 @@ void nmi_node_eframe_save(cnodeid_t  cnode)
 void
 nmi_eframes_save(void)
 {
-	cnodeid_t	cnode;
+	nasid_t nasid;
 
-	for_each_online_node(cnode)
-		nmi_node_eframe_save(cnode);
+	for_each_online_node(nasid)
+		nmi_node_eframe_save(nasid);
 }
 
 void
diff --git a/arch/mips/sgi-ip27/ip27-reset.c b/arch/mips/sgi-ip27/ip27-reset.c
index e44a15d4f573..c90228d0d4c2 100644
--- a/arch/mips/sgi-ip27/ip27-reset.c
+++ b/arch/mips/sgi-ip27/ip27-reset.c
@@ -45,8 +45,7 @@ static void ip27_machine_restart(char *command)
 #endif
 #if 0
 	for_each_online_node(i)
-		REMOTE_HUB_S(COMPACT_TO_NASID_NODEID(i), PROMOP_REG,
-							PROMOP_REBOOT);
+		REMOTE_HUB_S(i, PROMOP_REG, PROMOP_REBOOT);
 #else
 	LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
 #endif
@@ -61,8 +60,7 @@ static void ip27_machine_halt(void)
 	smp_send_stop();
 #endif
 	for_each_online_node(i)
-		REMOTE_HUB_S(COMPACT_TO_NASID_NODEID(i), PROMOP_REG,
-							PROMOP_RESTART);
+		REMOTE_HUB_S(i, PROMOP_REG, PROMOP_RESTART);
 	LOCAL_HUB_S(NI_PORT_RESET, NPR_PORTRESET | NPR_LOCALRESET);
 	noreturn;
 }
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 20b81209c6b8..386702abe660 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -31,34 +31,13 @@
  * Takes as first input the PROM assigned cpu id, and the kernel
  * assigned cpu id as the second.
  */
-static void alloc_cpupda(cpuid_t cpu, int cpunum)
+static void alloc_cpupda(nasid_t nasid, cpuid_t cpu, int cpunum)
 {
-	cnodeid_t node = get_cpu_cnode(cpu);
-	nasid_t nasid = COMPACT_TO_NASID_NODEID(node);
-
 	cputonasid(cpunum) = nasid;
-	sn_cpu_info[cpunum].p_nodeid = node;
 	cputoslice(cpunum) = get_cpu_slice(cpu);
 }
 
-static nasid_t get_actual_nasid(lboard_t *brd)
-{
-	klhub_t *hub;
-
-	if (!brd)
-		return INVALID_NASID;
-
-	/* find out if we are a completely disabled brd. */
-	hub  = (klhub_t *)find_first_component(brd, KLSTRUCT_HUB);
-	if (!hub)
-		return INVALID_NASID;
-	if (!(hub->hub_info.flags & KLINFO_ENABLE))	/* disabled node brd */
-		return hub->hub_info.physid;
-	else
-		return brd->brd_nasid;
-}
-
-static int do_cpumask(cnodeid_t cnode, nasid_t nasid, int highest)
+static int do_cpumask(nasid_t nasid, int highest)
 {
 	static int tot_cpus_found = 0;
 	lboard_t *brd;
@@ -72,16 +51,13 @@ static int do_cpumask(cnodeid_t cnode, nasid_t nasid, int highest)
 		acpu = (klcpu_t *)find_first_component(brd, KLSTRUCT_CPU);
 		while (acpu) {
 			cpuid = acpu->cpu_info.virtid;
-			/* cnode is not valid for completely disabled brds */
-			if (get_actual_nasid(brd) == brd->brd_nasid)
-				cpuid_to_compact_node[cpuid] = cnode;
-			if (cpuid > highest)
-				highest = cpuid;
 			/* Only let it join in if it's marked enabled */
 			if ((acpu->cpu_info.flags & KLINFO_ENABLE) &&
 			    (tot_cpus_found != NR_CPUS)) {
+				if (cpuid > highest)
+					highest = cpuid;
 				set_cpu_possible(cpuid, true);
-				alloc_cpupda(cpuid, tot_cpus_found);
+				alloc_cpupda(nasid, cpuid, tot_cpus_found);
 				cpus_found++;
 				tot_cpus_found++;
 			}
@@ -103,16 +79,6 @@ void cpu_node_probe(void)
 	int i, highest = 0;
 	gda_t *gdap = GDA;
 
-	/*
-	 * Initialize the arrays to invalid nodeid (-1)
-	 */
-	for (i = 0; i < MAX_COMPACT_NODES; i++)
-		compact_to_nasid_node[i] = INVALID_NASID;
-	for (i = 0; i < MAX_NASIDS; i++)
-		nasid_to_compact_node[i] = INVALID_CNODEID;
-	for (i = 0; i < MAXCPUS; i++)
-		cpuid_to_compact_node[i] = INVALID_CNODEID;
-
 	/*
 	 * MCD - this whole "compact node" stuff can probably be dropped,
 	 * as we can handle sparse numbering now
@@ -122,10 +88,8 @@ void cpu_node_probe(void)
 		nasid_t nasid = gdap->g_nasidtable[i];
 		if (nasid == INVALID_NASID)
 			break;
-		compact_to_nasid_node[i] = nasid;
-		nasid_to_compact_node[nasid] = i;
-		node_set_online(num_online_nodes());
-		highest = do_cpumask(i, nasid, highest);
+		node_set_online(nasid);
+		highest = do_cpumask(nasid, highest);
 	}
 
 	printk("Discovered %d cpus on %d nodes\n", highest + 1, num_online_nodes());
@@ -162,11 +126,10 @@ static void ip27_send_ipi_single(int destid, unsigned int action)
 	irq += cputoslice(destid);
 
 	/*
-	 * Convert the compact hub number to the NASID to get the correct
-	 * part of the address space.  Then set the interrupt bit associated
-	 * with the CPU we want to send the interrupt to.
+	 * Set the interrupt bit associated with the CPU we want to
+	 * send the interrupt to.
 	 */
-	REMOTE_HUB_SEND_INTR(COMPACT_TO_NASID_NODEID(cpu_to_node(destid)), irq);
+	REMOTE_HUB_SEND_INTR(cpu_to_node(destid), irq);
 }
 
 static void ip27_send_ipi_mask(const struct cpumask *mask, unsigned int action)
@@ -208,23 +171,20 @@ static int ip27_boot_secondary(int cpu, struct task_struct *idle)
 
 static void __init ip27_smp_setup(void)
 {
-	cnodeid_t	cnode;
+	nasid_t nasid;
 
-	for_each_online_node(cnode) {
-		if (cnode == 0)
+	for_each_online_node(nasid) {
+		if (nasid == 0)
 			continue;
-		intr_clear_all(COMPACT_TO_NASID_NODEID(cnode));
+		intr_clear_all(nasid);
 	}
 
 	replicate_kernel_text();
 
 	/*
-	 * Assumption to be fixed: we're always booted on logical / physical
-	 * processor 0.	 While we're always running on logical processor 0
-	 * this still means this is physical processor zero; it might for
-	 * example be disabled in the firmware.
+	 * PROM sets up system, that boot cpu is always first CPU on nasid 0
 	 */
-	alloc_cpupda(0, 0);
+	alloc_cpupda(0, 0, 0);
 }
 
 static void __init ip27_prepare_cpus(unsigned int max_cpus)
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 5631e93ea350..9ca775465a91 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -170,7 +170,7 @@ void cpu_time_init(void)
 	printk("CPU %d clock is %dMHz.\n", smp_processor_id(), cpu->cpu_speed);
 }
 
-void hub_rtc_init(cnodeid_t cnode)
+void hub_rtc_init(nasid_t nasid)
 {
 
 	/*
@@ -178,7 +178,7 @@ void hub_rtc_init(cnodeid_t cnode)
 	 * If this is not the current node then it is a cpuless
 	 * node and timeouts will not happen there.
 	 */
-	if (get_compact_nodeid() == cnode) {
+	if (get_nasid() == nasid) {
 		LOCAL_HUB_S(PI_RT_EN_A, 1);
 		LOCAL_HUB_S(PI_RT_EN_B, 1);
 		LOCAL_HUB_S(PI_PROF_EN_A, 0);
diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index 9b7524362a11..5218b900f855 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -166,14 +166,12 @@ static int xbow_probe(nasid_t nasid)
 	return 0;
 }
 
-static void xtalk_probe_node(cnodeid_t nid)
+static void xtalk_probe_node(nasid_t nasid)
 {
 	volatile u64		hubreg;
-	nasid_t			nasid;
 	xwidget_part_num_t	partnum;
 	widgetreg_t		widget_id;
 
-	nasid = COMPACT_TO_NASID_NODEID(nid);
 	hubreg = REMOTE_HUB_L(nasid, IIO_LLP_CSR);
 
 	/* check whether the link is up */
@@ -201,10 +199,10 @@ static void xtalk_probe_node(cnodeid_t nid)
 
 static int __init xtalk_init(void)
 {
-	cnodeid_t cnode;
+	nasid_t nasid;
 
-	for_each_online_node(cnode)
-		xtalk_probe_node(cnode);
+	for_each_online_node(nasid)
+		xtalk_probe_node(nasid);
 
 	return 0;
 }
-- 
2.16.4

