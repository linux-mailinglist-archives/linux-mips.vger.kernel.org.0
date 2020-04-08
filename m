Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA6081A2282
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 15:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgDHNDr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 09:03:47 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17805 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728890AbgDHNDq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 09:03:46 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586350869; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Z6jEOUS77kXYTA17zYMaQSOhudrNRZwodHH5MWNvpPVo0knsbunTpuih133MSr5kJ82kzvO7RRJxOGopkxfqXnO+PbeD6y5vSFhWxE9GBwhCNdRjfciYZD0jFGxsTf/9648t3VcNa7FWQ4kznNu1nLK4ieDjRzqm4UhKHYKiEos=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586350869; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=iJMOJi3iqApOZtO1dn+J7KAXEon+fb8hkvRSOT6LkVk=; 
        b=P5YCWZzov6I44TpSwGie3IvJKUzOKyFxlelQUeeTmDFZVUas0ZTMbHA8QkjurPUHiE0XtU/1FzNw5npFGN84uHQoN2k29cPq7SDfrQdCT5yFF9bFjCf1EuyeJxAVU8AYo8Tv03XUJYfpIXXvWYvp60TtRhDm8qZn0e5DMwj+DBU=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586350869;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=iJMOJi3iqApOZtO1dn+J7KAXEon+fb8hkvRSOT6LkVk=;
        b=Wg6wKKJR+aOIAb4KENP5YD7zGyVXJ//3gDpgVNLJkPAN/28CTJW7ohKa2TSCiM+E
        kJhpq1XWW2J2ZxSMcwlhSJVrx6u6VuYkPm9rWe5R+WBiYh40Dc3gDSNjPFZ7uDj0yyV
        qMCtBKsGDHLyCC6sS/yIq7E/u7dnogSkK6eIu3Ww=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586350866555709.0712213906505; Wed, 8 Apr 2020 21:01:06 +0800 (CST)
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
Message-ID: <20200408130024.2529220-2-jiaxun.yang@flygoat.com>
Subject: [PATCH 07/12] MIPS: CPS & MT: Switch to new topology interface
Date:   Wed,  8 Apr 2020 20:59:49 +0800
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

Change the parameter of get/set topology ID functions from cpudata
to cpuid.

Also adjust include relationship to prevent conflictions.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mips-cm.h  |  9 ++++---
 arch/mips/include/asm/mips-cps.h |  2 ++
 arch/mips/include/asm/smp-ops.h  |  2 --
 arch/mips/kernel/mips-cm.c       |  4 ++--
 arch/mips/kernel/mips-cpc.c      |  4 ++--
 arch/mips/kernel/pm-cps.c        | 12 +++++-----
 arch/mips/kernel/setup.c         |  1 +
 arch/mips/kernel/smp-cmp.c       |  5 ++--
 arch/mips/kernel/smp-cps.c       | 41 ++++++++++++++++----------------
 arch/mips/kernel/smp-mt.c        |  3 ++-
 10 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-c=
m.h
index aeae2effa123..6bab8f485bcd 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -395,8 +395,8 @@ static inline unsigned int mips_cm_max_vp_width(void)
  */
 static inline unsigned int mips_cm_vp_id(unsigned int cpu)
 {
-=09unsigned int core =3D cpu_core(&cpu_data[cpu]);
-=09unsigned int vp =3D cpu_vpe_id(&cpu_data[cpu]);
+=09unsigned int core =3D cpu_core(cpu);
+=09unsigned int vp =3D cpu_vpe_id(cpu);
=20
 =09return (core * mips_cm_max_vp_width()) + vp;
 }
@@ -451,9 +451,8 @@ static inline void mips_cm_unlock_other(void) { }
  */
 static inline void mips_cm_lock_other_cpu(unsigned int cpu, unsigned int b=
lock)
 {
-=09struct cpuinfo_mips *d =3D &cpu_data[cpu];
-
-=09mips_cm_lock_other(cpu_cluster(d), cpu_core(d), cpu_vpe_id(d), block);
+=09mips_cm_lock_other(cpu_cluster(cpu), cpu_core(cpu),
+=09=09=09=09cpu_vpe_id(cpu), block);
 }
=20
 #endif /* __MIPS_ASM_MIPS_CM_H__ */
diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-=
cps.h
index fd43d876892e..340e367fcf07 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -9,6 +9,8 @@
=20
 #include <linux/io.h>
 #include <linux/types.h>
+#include <linux/smp.h>
+#include <asm/topology.h>
=20
 extern unsigned long __cps_access_bad_size(void)
 =09__compiletime_error("Bad size for CPS accessor");
diff --git a/arch/mips/include/asm/smp-ops.h b/arch/mips/include/asm/smp-op=
s.h
index 65618ff1280c..a58f5b019eb7 100644
--- a/arch/mips/include/asm/smp-ops.h
+++ b/arch/mips/include/asm/smp-ops.h
@@ -13,8 +13,6 @@
=20
 #include <linux/errno.h>
=20
-#include <asm/mips-cps.h>
-
 #ifdef CONFIG_SMP
=20
 #include <linux/cpumask.h>
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index cdb93ed91cde..7dd3b6fd9c1c 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -295,7 +295,7 @@ void mips_cm_lock_other(unsigned int cluster, unsigned =
int core,
 =09=09 * CM 2.5 & older, so have to ensure other VP(E)s don't
 =09=09 * race with us.
 =09=09 */
-=09=09curr_core =3D cpu_core(&current_cpu_data);
+=09=09curr_core =3D cpu_core(smp_processor_id());
 =09=09spin_lock_irqsave(&per_cpu(cm_core_lock, curr_core),
 =09=09=09=09  per_cpu(cm_core_lock_flags, curr_core));
=20
@@ -316,7 +316,7 @@ void mips_cm_unlock_other(void)
 =09unsigned int curr_core;
=20
 =09if (mips_cm_revision() < CM_REV_CM3) {
-=09=09curr_core =3D cpu_core(&current_cpu_data);
+=09=09curr_core =3D cpu_core(smp_processor_id());
 =09=09spin_unlock_irqrestore(&per_cpu(cm_core_lock, curr_core),
 =09=09=09=09       per_cpu(cm_core_lock_flags, curr_core));
 =09} else {
diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 8d2535123f11..13f6f813e82a 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -94,7 +94,7 @@ void mips_cpc_lock_other(unsigned int core)
 =09=09return;
=20
 =09preempt_disable();
-=09curr_core =3D cpu_core(&current_cpu_data);
+=09curr_core =3D cpu_core(smp_processor_id());
 =09spin_lock_irqsave(&per_cpu(cpc_core_lock, curr_core),
 =09=09=09  per_cpu(cpc_core_lock_flags, curr_core));
 =09write_cpc_cl_other(core << __ffs(CPC_Cx_OTHER_CORENUM));
@@ -114,7 +114,7 @@ void mips_cpc_unlock_other(void)
 =09=09/* Systems with CM >=3D 3 lock the CPC via mips_cm_lock_other */
 =09=09return;
=20
-=09curr_core =3D cpu_core(&current_cpu_data);
+=09curr_core =3D cpu_core(smp_processor_id());
 =09spin_unlock_irqrestore(&per_cpu(cpc_core_lock, curr_core),
 =09=09=09       per_cpu(cpc_core_lock_flags, curr_core));
 =09preempt_enable();
diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 9bf60d7d44d3..cd4401bc79d2 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -110,7 +110,7 @@ static void coupled_barrier(atomic_t *a, unsigned onlin=
e)
 int cps_pm_enter_state(enum cps_pm_state state)
 {
 =09unsigned cpu =3D smp_processor_id();
-=09unsigned core =3D cpu_core(&current_cpu_data);
+=09unsigned int core =3D cpu_core(cpu);
 =09unsigned online, left;
 =09cpumask_t *coupled_mask =3D this_cpu_ptr(&online_coupled);
 =09u32 *core_ready_count, *nc_core_ready_count;
@@ -128,7 +128,7 @@ int cps_pm_enter_state(enum cps_pm_state state)
 #if defined(CONFIG_MIPS_MT) || defined(CONFIG_CPU_MIPSR6)
 =09if (cpu_online(cpu)) {
 =09=09cpumask_and(coupled_mask, cpu_online_mask,
-=09=09=09    &cpu_sibling_map[cpu]);
+=09=09=09    topology_sibling_cpumask(cpu));
 =09=09online =3D cpumask_weight(coupled_mask);
 =09=09cpumask_clear_cpu(cpu, coupled_mask);
 =09} else
@@ -145,7 +145,7 @@ int cps_pm_enter_state(enum cps_pm_state state)
 =09=09=09return -EINVAL;
=20
 =09=09core_cfg =3D &mips_cps_core_bootcfg[core];
-=09=09vpe_cfg =3D &core_cfg->vpe_config[cpu_vpe_id(&current_cpu_data)];
+=09=09vpe_cfg =3D &core_cfg->vpe_config[cpu_vpe_id(smp_processor_id())];
 =09=09vpe_cfg->pc =3D (unsigned long)mips_cps_pm_restore;
 =09=09vpe_cfg->gp =3D (unsigned long)current_thread_info();
 =09=09vpe_cfg->sp =3D 0;
@@ -444,7 +444,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 =09=09=09=09/* Halt the VP via the CPC VP_STOP register */
 =09=09=09=09unsigned int vpe_id;
=20
-=09=09=09=09vpe_id =3D cpu_vpe_id(&cpu_data[cpu]);
+=09=09=09=09vpe_id =3D cpu_vpe_id(cpu);
 =09=09=09=09uasm_i_addiu(&p, t0, zero, 1 << vpe_id);
 =09=09=09=09UASM_i_LA(&p, t1, (long)addr_cpc_cl_vp_stop());
 =09=09=09=09uasm_i_sw(&p, t0, 0, t1);
@@ -482,7 +482,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 =09=09* defined by the interAptiv & proAptiv SUMs as ensuring that the
 =09=09*  operation resulting from the preceding store is complete.
 =09=09*/
-=09=09uasm_i_addiu(&p, t0, zero, 1 << cpu_core(&cpu_data[cpu]));
+=09=09uasm_i_addiu(&p, t0, zero, 1 << cpu_core(cpu));
 =09=09uasm_i_sw(&p, t0, 0, r_pcohctl);
 =09=09uasm_i_lw(&p, t0, 0, r_pcohctl);
=20
@@ -636,7 +636,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 static int cps_pm_online_cpu(unsigned int cpu)
 {
 =09enum cps_pm_state state;
-=09unsigned core =3D cpu_core(&cpu_data[cpu]);
+=09unsigned int core =3D cpu_core(cpu);
 =09void *entry_fn, *core_rc;
=20
 =09for (state =3D CPS_PM_NC_WAIT; state < CPS_PM_STATE_COUNT; state++) {
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index b9fefc5dc702..92739120cb09 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -38,6 +38,7 @@
 #include <asm/cpu.h>
 #include <asm/debug.h>
 #include <asm/dma-coherence.h>
+#include <asm/mips-cps.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
 #include <asm/smp-ops.h>
diff --git a/arch/mips/kernel/smp-cmp.c b/arch/mips/kernel/smp-cmp.c
index 76f5824cdb00..9f775195fe0d 100644
--- a/arch/mips/kernel/smp-cmp.c
+++ b/arch/mips/kernel/smp-cmp.c
@@ -21,6 +21,7 @@
 #include <asm/hardirq.h>
 #include <asm/mmu_context.h>
 #include <asm/smp.h>
+#include <asm/mips-cps.h>
 #include <asm/time.h>
 #include <asm/mipsregs.h>
 #include <asm/mipsmtregs.h>
@@ -29,8 +30,6 @@
=20
 static void cmp_init_secondary(void)
 {
-=09struct cpuinfo_mips *c __maybe_unused =3D &current_cpu_data;
-
 =09/* Assume GIC is present */
 =09change_c0_status(ST0_IM, STATUSF_IP2 | STATUSF_IP3 | STATUSF_IP4 |
 =09=09=09=09 STATUSF_IP5 | STATUSF_IP6 | STATUSF_IP7);
@@ -39,7 +38,7 @@ static void cmp_init_secondary(void)
=20
 #ifdef CONFIG_MIPS_MT_SMP
 =09if (cpu_has_mipsmt)
-=09=09cpu_set_vpe_id(c, (read_c0_tcbind() >> TCBIND_CURVPE_SHIFT) &
+=09=09cpu_set_vpe_id(smp_processor_id(), (read_c0_tcbind() >> TCBIND_CURVP=
E_SHIFT) &
 =09=09=09=09  TCBIND_CURVPE);
 #endif
 }
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index dbb3f1fc71ab..cf5875487d71 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -71,9 +71,10 @@ static void __init cps_smp_setup(void)
 =09=09=09=09smp_num_siblings =3D core_vpes;
=20
 =09=09=09for (v =3D 0; v < min_t(int, core_vpes, NR_CPUS - nvpes); v++) {
-=09=09=09=09cpu_set_cluster(&cpu_data[nvpes + v], cl);
-=09=09=09=09cpu_set_core(&cpu_data[nvpes + v], c);
-=09=09=09=09cpu_set_vpe_id(&cpu_data[nvpes + v], v);
+=09=09=09=09cpu_set_cluster(nvpes + v, cl);
+=09=09=09=09cpu_set_core(nvpes + v, c);
+=09=09=09=09cpu_set_vpe_id(nvpes + v, v);
+=09=09=09=09update_siblings_masks(nvpes + v);
 =09=09=09}
=20
 =09=09=09nvpes +=3D core_vpes;
@@ -85,8 +86,8 @@ static void __init cps_smp_setup(void)
=20
 =09/* Indicate present CPUs (CPU being synonymous with VPE) */
 =09for (v =3D 0; v < min_t(unsigned, nvpes, NR_CPUS); v++) {
-=09=09set_cpu_possible(v, cpu_cluster(&cpu_data[v]) =3D=3D 0);
-=09=09set_cpu_present(v, cpu_cluster(&cpu_data[v]) =3D=3D 0);
+=09=09set_cpu_possible(v, cpu_cluster(v) =3D=3D 0);
+=09=09set_cpu_present(v, cpu_cluster(v) =3D=3D 0);
 =09=09__cpu_number_map[v] =3D v;
 =09=09__cpu_logical_map[v] =3D v;
 =09}
@@ -190,8 +191,8 @@ static void __init cps_prepare_cpus(unsigned int max_cp=
us)
 =09}
=20
 =09/* Mark this CPU as booted */
-=09atomic_set(&mips_cps_core_bootcfg[cpu_core(&current_cpu_data)].vpe_mask=
,
-=09=09   1 << cpu_vpe_id(&current_cpu_data));
+=09atomic_set(&mips_cps_core_bootcfg[cpu_core(smp_processor_id())].vpe_mas=
k,
+=09=09   1 << cpu_vpe_id(smp_processor_id()));
=20
 =09return;
 err_out:
@@ -285,16 +286,16 @@ static void boot_core(unsigned int core, unsigned int=
 vpe_id)
=20
 static void remote_vpe_boot(void *dummy)
 {
-=09unsigned core =3D cpu_core(&current_cpu_data);
+=09unsigned int core =3D cpu_core(smp_processor_id());
 =09struct core_boot_config *core_cfg =3D &mips_cps_core_bootcfg[core];
=20
-=09mips_cps_boot_vpes(core_cfg, cpu_vpe_id(&current_cpu_data));
+=09mips_cps_boot_vpes(core_cfg, cpu_vpe_id(smp_processor_id()));
 }
=20
 static int cps_boot_secondary(int cpu, struct task_struct *idle)
 {
-=09unsigned core =3D cpu_core(&cpu_data[cpu]);
-=09unsigned vpe_id =3D cpu_vpe_id(&cpu_data[cpu]);
+=09unsigned int core =3D cpu_core(cpu);
+=09unsigned int vpe_id =3D cpu_vpe_id(cpu);
 =09struct core_boot_config *core_cfg =3D &mips_cps_core_bootcfg[core];
 =09struct vpe_boot_config *vpe_cfg =3D &core_cfg->vpe_config[vpe_id];
 =09unsigned long core_entry;
@@ -302,14 +303,14 @@ static int cps_boot_secondary(int cpu, struct task_st=
ruct *idle)
 =09int err;
=20
 =09/* We don't yet support booting CPUs in other clusters */
-=09if (cpu_cluster(&cpu_data[cpu]) !=3D cpu_cluster(&raw_current_cpu_data)=
)
+=09if (cpu_cluster(cpu) !=3D cpu_cluster(smp_processor_id()))
 =09=09return -ENOSYS;
=20
 =09vpe_cfg->pc =3D (unsigned long)&smp_bootstrap;
 =09vpe_cfg->sp =3D __KSTK_TOS(idle);
 =09vpe_cfg->gp =3D (unsigned long)task_thread_info(idle);
=20
-=09atomic_or(1 << cpu_vpe_id(&cpu_data[cpu]), &core_cfg->vpe_mask);
+=09atomic_or(1 << cpu_vpe_id(cpu), &core_cfg->vpe_mask);
=20
 =09preempt_disable();
=20
@@ -406,10 +407,10 @@ static void cps_shutdown_this_cpu(enum cpu_death deat=
h)
 =09unsigned int cpu, core, vpe_id;
=20
 =09cpu =3D smp_processor_id();
-=09core =3D cpu_core(&cpu_data[cpu]);
+=09core =3D cpu_core(cpu);
=20
 =09if (death =3D=3D CPU_DEATH_HALT) {
-=09=09vpe_id =3D cpu_vpe_id(&cpu_data[cpu]);
+=09=09vpe_id =3D cpu_vpe_id(cpu);
=20
 =09=09pr_debug("Halting core %d VP%d\n", core, vpe_id);
 =09=09if (cpu_has_mipsmt) {
@@ -456,8 +457,8 @@ static int cps_cpu_disable(void)
 =09if (!cps_pm_support_state(CPS_PM_POWER_GATED))
 =09=09return -EINVAL;
=20
-=09core_cfg =3D &mips_cps_core_bootcfg[cpu_core(&current_cpu_data)];
-=09atomic_sub(1 << cpu_vpe_id(&current_cpu_data), &core_cfg->vpe_mask);
+=09core_cfg =3D &mips_cps_core_bootcfg[cpu_core(smp_processor_id())];
+=09atomic_sub(1 << cpu_vpe_id(smp_processor_id()), &core_cfg->vpe_mask);
 =09smp_mb__after_atomic();
 =09set_cpu_online(cpu, false);
 =09calculate_cpu_foreign_map();
@@ -506,7 +507,7 @@ void play_dead(void)
 static void wait_for_sibling_halt(void *ptr_cpu)
 {
 =09unsigned cpu =3D (unsigned long)ptr_cpu;
-=09unsigned vpe_id =3D cpu_vpe_id(&cpu_data[cpu]);
+=09unsigned int vpe_id =3D cpu_vpe_id(cpu);
 =09unsigned halted;
 =09unsigned long flags;
=20
@@ -520,8 +521,8 @@ static void wait_for_sibling_halt(void *ptr_cpu)
=20
 static void cps_cpu_die(unsigned int cpu)
 {
-=09unsigned core =3D cpu_core(&cpu_data[cpu]);
-=09unsigned int vpe_id =3D cpu_vpe_id(&cpu_data[cpu]);
+=09unsigned int core =3D cpu_core(cpu);
+=09unsigned int vpe_id =3D cpu_vpe_id(cpu);
 =09ktime_t fail_time;
 =09unsigned stat;
 =09int err;
diff --git a/arch/mips/kernel/smp-mt.c b/arch/mips/kernel/smp-mt.c
index 5f04a0141068..5eb31b8c8ea0 100644
--- a/arch/mips/kernel/smp-mt.c
+++ b/arch/mips/kernel/smp-mt.c
@@ -21,6 +21,7 @@
 #include <asm/hardirq.h>
 #include <asm/mmu_context.h>
 #include <asm/time.h>
+#include <asm/topology.h>
 #include <asm/mipsregs.h>
 #include <asm/mipsmtregs.h>
 #include <asm/mips_mt.h>
@@ -72,7 +73,7 @@ static unsigned int __init smvp_vpe_init(unsigned int tc,=
 unsigned int mvpconf0,
 =09if (tc !=3D 0)
 =09=09smvp_copy_vpe_config();
=20
-=09cpu_set_vpe_id(&cpu_data[ncpu], tc);
+=09cpu_set_vpe_id(ncpu, tc);
=20
 =09return ncpu;
 }
--=20
2.26.0.rc2


