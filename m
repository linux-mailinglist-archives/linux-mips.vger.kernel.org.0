Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC9B135959
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbgAIMev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:37974 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729143AbgAIMeJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C4E60B2208;
        Thu,  9 Jan 2020 12:34:03 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] MIPS: SGI-IP27: use cpu physid already present while scanning for CPUs
Date:   Thu,  9 Jan 2020 13:33:39 +0100
Message-Id: <20200109123353.5656-3-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

By using cpu physid already present when scanning for CPUs
get_cpu_slice() is unsued and can be removed together with two
other then used functions.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/arch.h     |  1 -
 arch/mips/include/asm/sn/klconfig.h |  4 ---
 arch/mips/sgi-ip27/ip27-klconfig.c  | 51 -----------------------------
 arch/mips/sgi-ip27/ip27-smp.c       | 26 +++++----------
 4 files changed, 8 insertions(+), 74 deletions(-)

diff --git a/arch/mips/include/asm/sn/arch.h b/arch/mips/include/asm/sn/arch.h
index f7d3273d9599..f8b34d34d872 100644
--- a/arch/mips/include/asm/sn/arch.h
+++ b/arch/mips/include/asm/sn/arch.h
@@ -26,6 +26,5 @@
 #define INVALID_PARTID		(partid_t)-1
 
 extern nasid_t get_nasid(void);
-extern int get_cpu_slice(cpuid_t);
 
 #endif /* _ASM_SN_ARCH_H */
diff --git a/arch/mips/include/asm/sn/klconfig.h b/arch/mips/include/asm/sn/klconfig.h
index 467c313d5767..117f85e4bef5 100644
--- a/arch/mips/include/asm/sn/klconfig.h
+++ b/arch/mips/include/asm/sn/klconfig.h
@@ -889,10 +889,6 @@ typedef union {
 extern lboard_t *find_lboard(lboard_t *start, unsigned char type);
 extern klinfo_t *find_component(lboard_t *brd, klinfo_t *kli, unsigned char type);
 extern klinfo_t *find_first_component(lboard_t *brd, unsigned char type);
-extern klcpu_t *nasid_slice_to_cpuinfo(nasid_t, int);
 extern lboard_t *find_lboard_class(lboard_t *start, unsigned char brd_class);
 
-
-extern klcpu_t *sn_get_cpuinfo(cpuid_t cpu);
-
 #endif /* _ASM_SN_KLCONFIG_H */
diff --git a/arch/mips/sgi-ip27/ip27-klconfig.c b/arch/mips/sgi-ip27/ip27-klconfig.c
index 6cb2160e7689..81a1646e609a 100644
--- a/arch/mips/sgi-ip27/ip27-klconfig.c
+++ b/arch/mips/sgi-ip27/ip27-klconfig.c
@@ -72,54 +72,3 @@ lboard_t *find_lboard_class(lboard_t *start, unsigned char brd_type)
 	/* Didn't find it. */
 	return (lboard_t *)NULL;
 }
-
-klcpu_t *nasid_slice_to_cpuinfo(nasid_t nasid, int slice)
-{
-	lboard_t *brd;
-	klcpu_t *acpu;
-
-	if (!(brd = find_lboard((lboard_t *)KL_CONFIG_INFO(nasid), KLTYPE_IP27)))
-		return (klcpu_t *)NULL;
-
-	if (!(acpu = (klcpu_t *)find_first_component(brd, KLSTRUCT_CPU)))
-		return (klcpu_t *)NULL;
-
-	do {
-		if ((acpu->cpu_info.physid) == slice)
-			return acpu;
-	} while ((acpu = (klcpu_t *)find_component(brd, (klinfo_t *)acpu,
-								KLSTRUCT_CPU)));
-	return (klcpu_t *)NULL;
-}
-
-klcpu_t *sn_get_cpuinfo(cpuid_t cpu)
-{
-	nasid_t nasid;
-	int slice;
-	klcpu_t *acpu;
-
-	if (!(cpu < MAXCPUS)) {
-		printk("sn_get_cpuinfo: illegal cpuid 0x%lx\n", cpu);
-		return NULL;
-	}
-
-	nasid = cputonasid(cpu);
-	if (nasid  == INVALID_NASID)
-		return NULL;
-
-	for (slice = 0; slice < CPUS_PER_NODE; slice++) {
-		acpu = nasid_slice_to_cpuinfo(nasid, slice);
-		if (acpu && acpu->cpu_info.virtid == cpu)
-			return acpu;
-	}
-	return NULL;
-}
-
-int get_cpu_slice(cpuid_t cpu)
-{
-	klcpu_t *acpu;
-
-	if ((acpu = sn_get_cpuinfo(cpu)) == NULL)
-		return -1;
-	return acpu->cpu_info.physid;
-}
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index faa0244c8b0c..de3711e9b1ba 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -29,22 +29,11 @@
 
 #include "ip27-common.h"
 
-/*
- * Takes as first input the PROM assigned cpu id, and the kernel
- * assigned cpu id as the second.
- */
-static void alloc_cpupda(nasid_t nasid, cpuid_t cpu, int cpunum)
-{
-	cputonasid(cpunum) = nasid;
-	cputoslice(cpunum) = get_cpu_slice(cpu);
-}
-
-static int do_cpumask(nasid_t nasid, int highest)
+static int node_scan_cpus(nasid_t nasid, int highest)
 {
-	static int tot_cpus_found = 0;
+	static int cpus_found;
 	lboard_t *brd;
 	klcpu_t *acpu;
-	int cpus_found = 0;
 	cpuid_t cpuid;
 
 	brd = find_lboard((lboard_t *)KL_CONFIG_INFO(nasid), KLTYPE_IP27);
@@ -55,13 +44,13 @@ static int do_cpumask(nasid_t nasid, int highest)
 			cpuid = acpu->cpu_info.virtid;
 			/* Only let it join in if it's marked enabled */
 			if ((acpu->cpu_info.flags & KLINFO_ENABLE) &&
-			    (tot_cpus_found != NR_CPUS)) {
+			    (cpus_found != NR_CPUS)) {
 				if (cpuid > highest)
 					highest = cpuid;
 				set_cpu_possible(cpuid, true);
-				alloc_cpupda(nasid, cpuid, tot_cpus_found);
+				cputonasid(cpus_found) = nasid;
+				cputoslice(cpus_found) = acpu->cpu_info.physid;
 				cpus_found++;
-				tot_cpus_found++;
 			}
 			acpu = (klcpu_t *)find_component(brd, (klinfo_t *)acpu,
 								KLSTRUCT_CPU);
@@ -87,7 +76,7 @@ void cpu_node_probe(void)
 		if (nasid == INVALID_NASID)
 			break;
 		node_set_online(nasid);
-		highest = do_cpumask(nasid, highest);
+		highest = node_scan_cpus(nasid, highest);
 	}
 
 	printk("Discovered %d cpus on %d nodes\n", highest + 1, num_online_nodes());
@@ -180,7 +169,8 @@ static void __init ip27_smp_setup(void)
 	/*
 	 * PROM sets up system, that boot cpu is always first CPU on nasid 0
 	 */
-	alloc_cpupda(0, 0, 0);
+	cputonasid(0) = 0;
+	cputoslice(0) = LOCAL_HUB_L(PI_CPU_NUM);
 }
 
 static void __init ip27_prepare_cpus(unsigned int max_cpus)
-- 
2.24.1

