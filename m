Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC931A227E
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 15:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgDHND1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 09:03:27 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17868 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728877AbgDHND1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 09:03:27 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586350837; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=CNTU47fQERVmRseYdTvPW4iDk4wtDzfI8G6KDFW5Acrlv3reV1+nTCadNJGuOYUXuYh4+AEDVEHOkmUnDYCe4OJJKGVrDvzs4Qe7XfDaIL7F6r0aMGvg+6Xnq+j9agZ0TuvTq+jI8pVspVn/89QJK3PzcRCzY39VSgROLflvByw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586350837; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=vYhLojl6vl4ywO3XmADviLh5o4y3XTv8xzj+M3OtVkQ=; 
        b=jzQ4bEdSTUs6KhH11LuD8CqZQYg9iKy5DzMPUsQ+IwQLgf5Mki16RQHZhtpAkBs8xNcX3v1X68ZzzY70lNnu7zkhgwSUXHmO2qdhX1Cd+eEhnNvDDNH1t5V+slUBKB+KrPET/pJ7JoqU4avLj9GVACl2T3V4/CkgMl2aKKNQugc=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586350837;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=vYhLojl6vl4ywO3XmADviLh5o4y3XTv8xzj+M3OtVkQ=;
        b=QZlSRLor5ye10lda7Hm6z7Z4ZCbWaC/icJpmPb7aBLwch/l3FD2cdWSd9/CMNzFn
        +OZzjqrAN/HT2jU9qHg5i2/k+VZqLHNAjFc+5OVOUMAXMP6sgHwhNKEh9FWtSYxU0cq
        aHpDSBlZ1hVfbg7rXZoEkaDiFx3fJpEuzeKGvgBw=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586350832335802.4494337653545; Wed, 8 Apr 2020 21:00:32 +0800 (CST)
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
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Richard Fontana <rfontana@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408130024.2529220-1-jiaxun.yang@flygoat.com>
Subject: [PATCH 06/12] MIPS: Kernel: Switch to new topology interface
Date:   Wed,  8 Apr 2020 20:59:48 +0800
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

Adapt topology functions to new interface in various of kernel
parts like perf, proc.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cacheinfo.c         | 5 +++--
 arch/mips/kernel/perf_event_mipsxx.c | 4 ++--
 arch/mips/kernel/proc.c              | 8 ++++----
 arch/mips/mm/c-r4k.c                 | 4 ++--
 arch/mips/mm/context.c               | 4 ++--
 arch/mips/oprofile/op_model_mipsxx.c | 4 ++--
 6 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
index 47312c529410..582c866b294f 100644
--- a/arch/mips/kernel/cacheinfo.c
+++ b/arch/mips/kernel/cacheinfo.c
@@ -3,6 +3,7 @@
  * MIPS cacheinfo support
  */
 #include <linux/cacheinfo.h>
+#include <asm/topology.h>
=20
 /* Populates leaf and increments to next leaf */
 #define populate_cache(cache, leaf, c_level, c_type)=09=09\
@@ -62,10 +63,10 @@ static void fill_cpumask_siblings(int cpu, cpumask_t *c=
pu_map)
 static void fill_cpumask_cluster(int cpu, cpumask_t *cpu_map)
 {
 =09int cpu1;
-=09int cluster =3D cpu_cluster(&cpu_data[cpu]);
+=09int cluster =3D cpu_topology[cpu].package_id;
=20
 =09for_each_possible_cpu(cpu1)
-=09=09if (cpu_cluster(&cpu_data[cpu1]) =3D=3D cluster)
+=09=09if (cpu_topology[cpu1].package_id =3D=3D cluster)
 =09=09=09cpumask_set_cpu(cpu1, cpu_map);
 }
=20
diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_e=
vent_mipsxx.c
index 128fc9999c56..e9ed3526bad0 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -127,7 +127,7 @@ static DEFINE_RWLOCK(pmuint_rwlock);
 =09=09=09 0 : (smp_processor_id() & MIPS_CPUID_TO_COUNTER_MASK))
 #else
 #define vpe_id()=09(cpu_has_mipsmt_pertccounters ? \
-=09=09=09 0 : cpu_vpe_id(&current_cpu_data))
+=09=09=09 0 : cpu_vpe_id(smp_processor_id()))
 #endif
=20
 /* Copied from op_model_mipsxx.c */
@@ -343,7 +343,7 @@ static void mipsxx_pmu_enable_event(struct hw_perf_even=
t *evt, int idx)
 =09=09 */
 =09=09cpu =3D (event->cpu >=3D 0) ? event->cpu : smp_processor_id();
=20
-=09=09ctrl =3D M_PERFCTL_VPEID(cpu_vpe_id(&cpu_data[cpu]));
+=09=09ctrl =3D M_PERFCTL_VPEID(cpu_vpe_id(smp_processor_id()));
 =09=09ctrl |=3D M_TC_EN_VPE;
 =09=09cpuc->saved_ctrl[idx] |=3D ctrl;
 =09=09pr_debug("Enabling perf counter for CPU%d\n", cpu);
diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index f8d36710cd58..e8795b262ca2 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -138,14 +138,14 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 =09=09      cpu_data[n].srsets);
 =09seq_printf(m, "kscratch registers\t: %d\n",
 =09=09      hweight8(cpu_data[n].kscratch_mask));
-=09seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
-=09seq_printf(m, "core\t\t\t: %d\n", cpu_core(&cpu_data[n]));
+=09seq_printf(m, "package\t\t\t: %d\n", cpu_cluster(n));
+=09seq_printf(m, "core\t\t\t: %d\n", cpu_core(n));
=20
 #if defined(CONFIG_MIPS_MT_SMP) || defined(CONFIG_CPU_MIPSR6)
 =09if (cpu_has_mipsmt)
-=09=09seq_printf(m, "VPE\t\t\t: %d\n", cpu_vpe_id(&cpu_data[n]));
+=09=09seq_printf(m, "VPE\t\t\t: %d\n", cpu_vpe_id(n));
 =09else if (cpu_has_vp)
-=09=09seq_printf(m, "VP\t\t\t: %d\n", cpu_vpe_id(&cpu_data[n]));
+=09=09seq_printf(m, "VP\t\t\t: %d\n", cpu_vpe_id(n));
 #endif
=20
 =09sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 36a311348739..851559ef0bc3 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -547,7 +547,7 @@ static inline int has_valid_asid(const struct mm_struct=
 *mm, unsigned int type)
 =09if (cpu_has_mmid)
 =09=09return cpu_context(0, mm) !=3D 0;
=20
-=09/* cpu_sibling_map[] undeclared when !CONFIG_SMP */
+=09/* topology_sibling_cpumask undeclared when !CONFIG_SMP */
 #ifdef CONFIG_SMP
 =09/*
 =09 * If r4k_on_each_cpu does SMP calls, it does them to a single VPE in
@@ -555,7 +555,7 @@ static inline int has_valid_asid(const struct mm_struct=
 *mm, unsigned int type)
 =09 * Otherwise we need to worry about all present CPUs.
 =09 */
 =09if (r4k_op_needs_ipi(type))
-=09=09mask =3D &cpu_sibling_map[smp_processor_id()];
+=09=09mask =3D topology_sibling_cpumask(smp_processor_id());
 #endif
 =09for_each_cpu(i, mask)
 =09=09if (cpu_context(i, mm))
diff --git a/arch/mips/mm/context.c b/arch/mips/mm/context.c
index b25564090939..ad2d8b7f464b 100644
--- a/arch/mips/mm/context.c
+++ b/arch/mips/mm/context.c
@@ -241,12 +241,12 @@ void check_switch_mmu_context(struct mm_struct *mm)
 =09 * increase then we need to invalidate any TLB entries for our MMID
 =09 * that we might otherwise pick up from a sibling.
 =09 *
-=09 * We ifdef on CONFIG_SMP because cpu_sibling_map isn't defined in
+=09 * We ifdef on CONFIG_SMP because topology_sibling_cpumask isn't define=
d in
 =09 * CONFIG_SMP=3Dn kernels.
 =09 */
 #ifdef CONFIG_SMP
 =09if (cpu_has_shared_ftlb_entries &&
-=09    cpumask_intersects(&tlb_flush_pending, &cpu_sibling_map[cpu])) {
+=09    cpumask_intersects(&tlb_flush_pending, topology_sibling_cpumask(cpu=
))) {
 =09=09/* Ensure we operate on the new MMID */
 =09=09mtc0_tlbw_hazard();
=20
diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_m=
odel_mipsxx.c
index a537bf98912c..0129dfcf5d55 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -37,9 +37,9 @@ static int perfcount_irq;
=20
 #ifdef CONFIG_MIPS_MT_SMP
 #define WHAT=09=09(MIPS_PERFCTRL_MT_EN_VPE | \
-=09=09=09 M_PERFCTL_VPEID(cpu_vpe_id(&current_cpu_data)))
+=09=09=09 M_PERFCTL_VPEID(cpu_vpe_id(smp_processor_id())))
 #define vpe_id()=09(cpu_has_mipsmt_pertccounters ? \
-=09=09=090 : cpu_vpe_id(&current_cpu_data))
+=09=09=090 : cpu_vpe_id(smp_processor_id()))
=20
 /*
  * The number of bits to shift to convert between counters per core and
--=20
2.26.0.rc2


