Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE6D113594A
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731021AbgAIMeX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:23 -0500
Received: from mx2.suse.de ([195.135.220.15]:38038 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730977AbgAIMeM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 57305B2214;
        Thu,  9 Jan 2020 12:34:07 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] MIPS: SGI-IP27: Store cpu speed when scanning for CPUs and use it later
Date:   Thu,  9 Jan 2020 13:33:50 +0100
Message-Id: <20200109123353.5656-14-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remember CPU speed while scanning for available CPUs to avoid
looking it up a second time when printing CPU speed.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/mach-ip27/topology.h |  1 +
 arch/mips/sgi-ip27/ip27-common.h           |  1 -
 arch/mips/sgi-ip27/ip27-init.c             |  3 ++-
 arch/mips/sgi-ip27/ip27-smp.c              |  2 ++
 arch/mips/sgi-ip27/ip27-timer.c            | 19 -------------------
 5 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
index 3c94ffc06a70..d66cc53feab8 100644
--- a/arch/mips/include/asm/mach-ip27/topology.h
+++ b/arch/mips/include/asm/mach-ip27/topology.h
@@ -7,6 +7,7 @@
 
 struct cpuinfo_ip27 {
 	nasid_t		p_nasid;	/* my node ID in numa-as-id-space */
+	unsigned short	p_speed;	/* cpu speed in MHz */
 	unsigned char	p_slice;	/* Physical position on node board */
 };
 
diff --git a/arch/mips/sgi-ip27/ip27-common.h b/arch/mips/sgi-ip27/ip27-common.h
index cdebf1726e4a..ed008a08464c 100644
--- a/arch/mips/sgi-ip27/ip27-common.h
+++ b/arch/mips/sgi-ip27/ip27-common.h
@@ -6,7 +6,6 @@
 extern nasid_t master_nasid;
 
 extern void cpu_node_probe(void);
-extern void cpu_time_init(void);
 extern void hub_rt_clock_event_init(void);
 extern void hub_rtc_init(nasid_t nasid);
 extern void install_cpu_nmi_handler(int slice);
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 9822f7a8ad62..84a78bd1386a 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -83,7 +83,8 @@ void per_cpu_init(void)
 
 	per_hub_init(nasid);
 
-	cpu_time_init();
+	pr_info("CPU %d clock is %dMHz.\n", cpu, sn_cpu_info[cpu].p_speed);
+
 	install_ipi();
 
 	/* Install our NMI handler if symmon hasn't installed one. */
diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 3966716835ea..5d2652a1d35a 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -47,6 +47,8 @@ static int node_scan_cpus(nasid_t nasid, int highest)
 				set_cpu_possible(cpuid, true);
 				cputonasid(cpus_found) = nasid;
 				cputoslice(cpus_found) = acpu->cpu_info.physid;
+				sn_cpu_info[cpus_found].p_speed =
+							acpu->cpu_speed;
 				cpus_found++;
 			}
 			acpu = (klcpu_t *)find_component(brd, (klinfo_t *)acpu,
diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 9cbbf326fe01..61f3565f3645 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -150,25 +150,6 @@ void __init plat_time_init(void)
 	hub_rt_clock_event_init();
 }
 
-void cpu_time_init(void)
-{
-	lboard_t *board;
-	klcpu_t *cpu;
-	int cpuid;
-
-	/* Don't use ARCS.  ARCS is fragile.  Klconfig is simple and sane.  */
-	board = find_lboard(KL_CONFIG_INFO(get_nasid()), KLTYPE_IP27);
-	if (!board)
-		panic("Can't find board info for myself.");
-
-	cpuid = LOCAL_HUB_L(PI_CPU_NUM) ? IP27_CPU0_INDEX : IP27_CPU1_INDEX;
-	cpu = (klcpu_t *) KLCF_COMP(board, cpuid);
-	if (!cpu)
-		panic("No information about myself?");
-
-	printk("CPU %d clock is %dMHz.\n", smp_processor_id(), cpu->cpu_speed);
-}
-
 void hub_rtc_init(nasid_t nasid)
 {
 
-- 
2.24.1

