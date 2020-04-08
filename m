Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09A751A2010
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 13:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgDHLnK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 07:43:10 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17837 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728506AbgDHLnK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 07:43:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586346033; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=BiHazU2c0wcn+qLPQvMMLX7cOXINLPD2iCF3/ro3F5nkaUkxWvOeMMCpJDhqMhuYkcT/1tF92uxbYU9xAiTPxjDibEGA+xliwnlTgd6z4vK1KSt88uW76f0KOuv6ueVNDWAzavQq1fGaxJ1NcJgeydndecE0DMIo5mi1PI6vJMg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586346033; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=pYVNUB1ttBHRdymAcqZFRuHmoAfSO1tLD44WuhiF1vo=; 
        b=GS0Qv+pIjSvcI6DGEZ1WOPzlerhFAG7NOIhBmFjtIVeplvLrWVwwQwVxbzaakQLaq5ETzXByFyzWV+baK6kjcCcbUkyB0GJgisOPVgSCEA7bNVau14Rb60NTYmPOcGYz6wPT/Ntp6gp1UTfnk960eQNuesCRNZPJXWV1Cb/oO6E=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586346033;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=pYVNUB1ttBHRdymAcqZFRuHmoAfSO1tLD44WuhiF1vo=;
        b=Pis0R7CZu7Zo96Wdt+MCw/X+izuHTJ2RZWAQ0KstpmTpGtn2kByrKrVK2CFHXI1S
        ABEZiQDr5G5m4084PplEuyj928CEn7gumLtOYpUTOlUZUpwY3EMkEkAJ0d0YmJNIRav
        4zUBAtv6lvrI1Xe0ptgilRaSJETlV1B4bz757hVY=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586346030606761.6289993098943; Wed, 8 Apr 2020 19:40:30 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Robert Richter <rric@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Peter Xu <peterx@redhat.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408113505.2528103-6-jiaxun.yang@flygoat.com>
Subject: [PATCH 05/12] MIPS: Switch to arch_topology
Date:   Wed,  8 Apr 2020 19:34:15 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Previously, MIPS is using self-defined "globalnumber" in struct
mips_cpuinfo to store topology information. However, it's not friendly
to DeviceTree based systems and lack of cpu_capacity related feature
which can take advantage of multi-cluster system.

Here, we enabled arch_topology for MIPS and adapted some functions
to fit arch_topology structure.
Also, we implmented smp_store_cpu_info to probe CPU's topology information
by "globalnumber" registers in VP ASE or Ebase.CPUNum for legacy systems.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                |  1 +
 arch/mips/include/asm/cpu-info.h | 49 ----------------------------
 arch/mips/include/asm/smp.h      |  2 --
 arch/mips/include/asm/topology.h | 48 +++++++++++++++++++++++++---
 arch/mips/kernel/cpu-probe.c     | 43 -------------------------
 arch/mips/kernel/setup.c         |  1 +
 arch/mips/kernel/smp.c           | 55 ++++----------------------------
 arch/mips/kernel/topology.c      | 42 ++++++++++++++++++++++++
 8 files changed, 93 insertions(+), 148 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 690718b3701a..66b57e9f2b4d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -20,6 +20,7 @@ config MIPS
 =09select CLONE_BACKWARDS
 =09select CPU_NO_EFFICIENT_FFS if (TARGET_ISA_REV < 1)
 =09select CPU_PM if CPU_IDLE
+=09select GENERIC_ARCH_TOPOLOGY if SMP
 =09select GENERIC_ATOMIC64 if !64BIT
 =09select GENERIC_CLOCKEVENTS
 =09select GENERIC_CMOS_UPDATE
diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-i=
nfo.h
index ed7ffe4e63a3..7140a3e61ce3 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -78,8 +78,6 @@ struct cpuinfo_mips {
 =09struct cache_desc=09scache; /* Secondary cache */
 =09struct cache_desc=09tcache; /* Tertiary/split secondary cache */
 =09int=09=09=09srsets; /* Shadow register sets */
-=09int=09=09=09package;/* physical package number */
-=09unsigned int=09=09globalnumber;
 #ifdef CONFIG_64BIT
 =09int=09=09=09vmbits; /* Virtual memory size in bits */
 #endif
@@ -139,53 +137,6 @@ struct proc_cpuinfo_notifier_args {
 =09unsigned long n;
 };
=20
-static inline unsigned int cpu_cluster(struct cpuinfo_mips *cpuinfo)
-{
-=09/* Optimisation for systems where multiple clusters aren't used */
-=09if (!IS_ENABLED(CONFIG_CPU_MIPSR6))
-=09=09return 0;
-
-=09return (cpuinfo->globalnumber & MIPS_GLOBALNUMBER_CLUSTER) >>
-=09=09MIPS_GLOBALNUMBER_CLUSTER_SHF;
-}
-
-static inline unsigned int cpu_core(struct cpuinfo_mips *cpuinfo)
-{
-=09return (cpuinfo->globalnumber & MIPS_GLOBALNUMBER_CORE) >>
-=09=09MIPS_GLOBALNUMBER_CORE_SHF;
-}
-
-static inline unsigned int cpu_vpe_id(struct cpuinfo_mips *cpuinfo)
-{
-=09/* Optimisation for systems where VP(E)s aren't used */
-=09if (!IS_ENABLED(CONFIG_MIPS_MT_SMP) && !IS_ENABLED(CONFIG_CPU_MIPSR6))
-=09=09return 0;
-
-=09return (cpuinfo->globalnumber & MIPS_GLOBALNUMBER_VP) >>
-=09=09MIPS_GLOBALNUMBER_VP_SHF;
-}
-
-extern void cpu_set_cluster(struct cpuinfo_mips *cpuinfo, unsigned int clu=
ster);
-extern void cpu_set_core(struct cpuinfo_mips *cpuinfo, unsigned int core);
-extern void cpu_set_vpe_id(struct cpuinfo_mips *cpuinfo, unsigned int vpe)=
;
-
-static inline bool cpus_are_siblings(int cpua, int cpub)
-{
-=09struct cpuinfo_mips *infoa =3D &cpu_data[cpua];
-=09struct cpuinfo_mips *infob =3D &cpu_data[cpub];
-=09unsigned int gnuma, gnumb;
-
-=09if (infoa->package !=3D infob->package)
-=09=09return false;
-
-=09gnuma =3D infoa->globalnumber & ~MIPS_GLOBALNUMBER_VP;
-=09gnumb =3D infob->globalnumber & ~MIPS_GLOBALNUMBER_VP;
-=09if (gnuma !=3D gnumb)
-=09=09return false;
-
-=09return true;
-}
-
 static inline unsigned long cpu_asid_inc(void)
 {
 =09return 1 << CONFIG_MIPS_ASID_SHIFT;
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index 7990c1c70471..538e73f6bab0 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -21,8 +21,6 @@
 #include <asm/smp-ops.h>
=20
 extern int smp_num_siblings;
-extern cpumask_t cpu_sibling_map[];
-extern cpumask_t cpu_core_map[];
 extern cpumask_t cpu_foreign_map[];
=20
 static inline int raw_smp_processor_id(void)
diff --git a/arch/mips/include/asm/topology.h b/arch/mips/include/asm/topol=
ogy.h
index 0673d2d0f2e6..e2044bbde53d 100644
--- a/arch/mips/include/asm/topology.h
+++ b/arch/mips/include/asm/topology.h
@@ -9,13 +9,51 @@
 #define __ASM_TOPOLOGY_H
=20
 #include <topology.h>
+#include <linux/arch_topology.h>
 #include <linux/smp.h>
=20
-#ifdef CONFIG_SMP
-#define topology_physical_package_id(cpu)=09(cpu_data[cpu].package)
-#define topology_core_id(cpu)=09=09=09(cpu_core(&cpu_data[cpu]))
-#define topology_core_cpumask(cpu)=09=09(&cpu_core_map[cpu])
-#define topology_sibling_cpumask(cpu)=09=09(&cpu_sibling_map[cpu])
+#if defined(CONFIG_SMP)
+static inline bool cpus_are_siblings(int cpua, int cpub)
+{
+=09return cpumask_test_cpu(cpua, topology_sibling_cpumask(cpub));
+}
+
+static inline unsigned int cpu_cluster(int cpu)
+{
+=09return cpu_topology[cpu].package_id;
+}
+
+static inline unsigned int cpu_core(int cpu)
+{
+=09return cpu_topology[cpu].core_id;
+}
+
+static inline unsigned int cpu_vpe_id(int cpu)
+{
+=09int id =3D cpu_topology[cpu].thread_id;
+
+=09/* Uniprocessor system may get -1, but for hardware it's 0 */
+=09if (id =3D=3D -1)
+=09=09return 0;
+
+=09return id;
+}
+
+static inline void cpu_set_cluster(int cpu, unsigned int cluster)
+{
+=09cpu_topology[cpu].package_id =3D cluster;
+}
+
+static inline void cpu_set_core(int cpu, unsigned int core)
+{
+=09cpu_topology[cpu].core_id =3D core;
+}
+
+static inline void cpu_set_vpe_id(int cpu, unsigned int vpe)
+{
+=09cpu_topology[cpu].thread_id =3D vpe;
+}
+
 #endif
=20
 #endif /* __ASM_TOPOLOGY_H */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index f21a2304401f..eead35e5dbfd 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1042,17 +1042,6 @@ static void decode_configs(struct cpuinfo_mips *c)
 =09set_ftlb_enable(c, (mips_ftlb_disabled ? 0 : FTLB_EN) | FTLB_SET_PROB);
=20
 =09mips_probe_watch_registers(c);
-
-#ifndef CONFIG_MIPS_CPS
-=09if (cpu_has_mips_r2_r6) {
-=09=09unsigned int core;
-
-=09=09core =3D get_ebase_cpunum();
-=09=09if (cpu_has_mipsmt)
-=09=09=09core >>=3D fls(core_nvpes()) - 1;
-=09=09cpu_set_core(c, core);
-=09}
-#endif
 }
=20
 /*
@@ -2303,35 +2292,3 @@ void cpu_report(void)
 =09if (cpu_has_msa)
 =09=09pr_info("MSA revision is: %08x\n", c->msa_id);
 }
-
-void cpu_set_cluster(struct cpuinfo_mips *cpuinfo, unsigned int cluster)
-{
-=09/* Ensure the core number fits in the field */
-=09WARN_ON(cluster > (MIPS_GLOBALNUMBER_CLUSTER >>
-=09=09=09   MIPS_GLOBALNUMBER_CLUSTER_SHF));
-
-=09cpuinfo->globalnumber &=3D ~MIPS_GLOBALNUMBER_CLUSTER;
-=09cpuinfo->globalnumber |=3D cluster << MIPS_GLOBALNUMBER_CLUSTER_SHF;
-}
-
-void cpu_set_core(struct cpuinfo_mips *cpuinfo, unsigned int core)
-{
-=09/* Ensure the core number fits in the field */
-=09WARN_ON(core > (MIPS_GLOBALNUMBER_CORE >> MIPS_GLOBALNUMBER_CORE_SHF));
-
-=09cpuinfo->globalnumber &=3D ~MIPS_GLOBALNUMBER_CORE;
-=09cpuinfo->globalnumber |=3D core << MIPS_GLOBALNUMBER_CORE_SHF;
-}
-
-void cpu_set_vpe_id(struct cpuinfo_mips *cpuinfo, unsigned int vpe)
-{
-=09/* Ensure the VP(E) ID fits in the field */
-=09WARN_ON(vpe > (MIPS_GLOBALNUMBER_VP >> MIPS_GLOBALNUMBER_VP_SHF));
-
-=09/* Ensure we're not using VP(E)s without support */
-=09WARN_ON(vpe && !IS_ENABLED(CONFIG_MIPS_MT_SMP) &&
-=09=09!IS_ENABLED(CONFIG_CPU_MIPSR6));
-
-=09cpuinfo->globalnumber &=3D ~MIPS_GLOBALNUMBER_VP;
-=09cpuinfo->globalnumber |=3D vpe << MIPS_GLOBALNUMBER_VP_SHF;
-}
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 8a418783a6bb..b9fefc5dc702 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -784,6 +784,7 @@ void __init setup_arch(char **cmdline_p)
 =09dmi_setup();
=20
 =09resource_init();
+=09init_cpu_topology();
 =09plat_smp_setup();
=20
 =09cpu_cache_init();
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 48d84d5fcc36..4896d6ecc719 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -34,6 +34,7 @@
 #include <asm/mips-cps.h>
 #include <asm/mmu_context.h>
 #include <asm/time.h>
+#include <asm/topology.h>
 #include <asm/setup.h>
 #include <asm/maar.h>
=20
@@ -47,10 +48,6 @@ EXPORT_SYMBOL(__cpu_logical_map);
 int smp_num_siblings =3D 1;
 EXPORT_SYMBOL(smp_num_siblings);
=20
-/* representing the TCs (or siblings in Intel speak) of each logical CPU *=
/
-cpumask_t cpu_sibling_map[NR_CPUS] __read_mostly;
-EXPORT_SYMBOL(cpu_sibling_map);
-
 /* representing the core map of multi-core chips of each logical CPU */
 cpumask_t cpu_core_map[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(cpu_core_map);
@@ -65,12 +62,6 @@ static DECLARE_COMPLETION(cpu_running);
 cpumask_t cpu_foreign_map[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(cpu_foreign_map);
=20
-/* representing cpus for which sibling maps can be computed */
-static cpumask_t cpu_sibling_setup_map;
-
-/* representing cpus for which core maps can be computed */
-static cpumask_t cpu_core_setup_map;
-
 cpumask_t cpu_coherent_mask;
=20
 #ifdef CONFIG_GENERIC_IRQ_IPI
@@ -78,37 +69,6 @@ static struct irq_desc *call_desc;
 static struct irq_desc *sched_desc;
 #endif
=20
-static inline void set_cpu_sibling_map(int cpu)
-{
-=09int i;
-
-=09cpumask_set_cpu(cpu, &cpu_sibling_setup_map);
-
-=09if (smp_num_siblings > 1) {
-=09=09for_each_cpu(i, &cpu_sibling_setup_map) {
-=09=09=09if (cpus_are_siblings(cpu, i)) {
-=09=09=09=09cpumask_set_cpu(i, &cpu_sibling_map[cpu]);
-=09=09=09=09cpumask_set_cpu(cpu, &cpu_sibling_map[i]);
-=09=09=09}
-=09=09}
-=09} else
-=09=09cpumask_set_cpu(cpu, &cpu_sibling_map[cpu]);
-}
-
-static inline void set_cpu_core_map(int cpu)
-{
-=09int i;
-
-=09cpumask_set_cpu(cpu, &cpu_core_setup_map);
-
-=09for_each_cpu(i, &cpu_core_setup_map) {
-=09=09if (cpu_data[cpu].package =3D=3D cpu_data[i].package) {
-=09=09=09cpumask_set_cpu(i, &cpu_core_map[cpu]);
-=09=09=09cpumask_set_cpu(cpu, &cpu_core_map[i]);
-=09=09}
-=09}
-}
-
 /*
  * Calculate a new cpu_foreign_map mask whenever a
  * new cpu appears or disappears.
@@ -131,7 +91,7 @@ void calculate_cpu_foreign_map(void)
=20
 =09for_each_online_cpu(i)
 =09=09cpumask_andnot(&cpu_foreign_map[i],
-=09=09=09       &temp_foreign_map, &cpu_sibling_map[i]);
+=09=09=09       &temp_foreign_map, topology_sibling_cpumask(i));
 }
=20
 const struct plat_smp_ops *mp_ops;
@@ -177,7 +137,7 @@ void mips_smp_send_ipi_mask(const struct cpumask *mask,=
 unsigned int action)
 =09=09=09if (cpus_are_siblings(cpu, smp_processor_id()))
 =09=09=09=09continue;
=20
-=09=09=09core =3D cpu_core(&cpu_data[cpu]);
+=09=09=09core =3D cpu_core(cpu);
=20
 =09=09=09while (!cpumask_test_cpu(cpu, &cpu_coherent_mask)) {
 =09=09=09=09mips_cm_lock_other_cpu(cpu, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
@@ -340,6 +300,8 @@ asmlinkage void start_secondary(void)
 =09mips_clockevent_init();
 =09mp_ops->init_secondary();
 =09cpu_report();
+=09cpu =3D smp_processor_id();
+=09store_cpu_topology(cpu);
 =09maar_init();
=20
 =09/*
@@ -349,7 +311,6 @@ asmlinkage void start_secondary(void)
=20
 =09calibrate_delay();
 =09preempt_disable();
-=09cpu =3D smp_processor_id();
 =09cpu_data[cpu].udelay_val =3D loops_per_jiffy;
=20
 =09cpumask_set_cpu(cpu, &cpu_coherent_mask);
@@ -363,9 +324,6 @@ asmlinkage void start_secondary(void)
 =09/* The CPU is running and counters synchronised, now mark it online */
 =09set_cpu_online(cpu, true);
=20
-=09set_cpu_sibling_map(cpu);
-=09set_cpu_core_map(cpu);
-
 =09calculate_cpu_foreign_map();
=20
 =09/*
@@ -411,8 +369,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 =09init_new_context(current, &init_mm);
 =09current_thread_info()->cpu =3D 0;
 =09mp_ops->prepare_cpus(max_cpus);
-=09set_cpu_sibling_map(0);
-=09set_cpu_core_map(0);
+=09store_cpu_topology(0);
 =09calculate_cpu_foreign_map();
 #ifndef CONFIG_HOTPLUG_CPU
 =09init_cpu_present(cpu_possible_mask);
diff --git a/arch/mips/kernel/topology.c b/arch/mips/kernel/topology.c
index cd3e1f82e1a5..112482de8187 100644
--- a/arch/mips/kernel/topology.c
+++ b/arch/mips/kernel/topology.c
@@ -31,3 +31,45 @@ static int __init topology_init(void)
 }
=20
 subsys_initcall(topology_init);
+
+#if defined(CONFIG_SMP)
+void store_cpu_topology(unsigned int cpuid)
+{
+=09struct cpu_topology *cpuid_topo =3D &cpu_topology[cpuid];
+
+=09if (cpuid_topo->package_id !=3D -1)
+=09=09goto topology_populated;
+
+=09if (cpu_has_vp) {
+=09=09u32 gn =3D read_c0_globalnumber();
+
+=09=09cpuid_topo->thread_id =3D (gn & MIPS_GLOBALNUMBER_VP) >>
+=09=09=09=09=09MIPS_GLOBALNUMBER_VP_SHF;
+=09=09cpuid_topo->core_id =3D (gn & MIPS_GLOBALNUMBER_CORE) >>
+=09=09=09=09=09MIPS_GLOBALNUMBER_CORE_SHF;
+=09=09cpuid_topo->package_id =3D (gn & MIPS_GLOBALNUMBER_CLUSTER) >>
+=09=09=09=09=09MIPS_GLOBALNUMBER_CLUSTER_SHF;
+=09} else {
+=09=09int hwid;
+
+=09=09if (cpu_has_mips_r2_r6)
+=09=09=09hwid =3D get_ebase_cpunum();
+=09=09else
+=09=09=09hwid =3D cpuid; /* Assume hwid =3D cpuid */
+
+=09=09if (smp_num_siblings =3D=3D 1)
+=09=09=09cpuid_topo->thread_id =3D -1;
+=09=09else
+=09=09=09cpuid_topo->thread_id =3D hwid % smp_num_siblings;
+
+=09=09cpuid_topo->core_id =3D hwid / smp_num_siblings;
+=09=09/* Platform code will handle multi-cluster case */
+=09=09cpuid_topo->package_id =3D 0;
+=09}
+
+topology_populated:
+=09update_siblings_masks(cpuid);
+=09pr_info("Topology: CPU %d: cluster: %d, core: %d, vpe: %d\n", cpuid,
+=09=09cpu_cluster(cpuid), cpu_core(cpuid), cpu_vpe_id(cpuid));
+}
+#endif
--=20
2.26.0.rc2


