Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029D6182C81
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2020 10:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCLJdT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Mar 2020 05:33:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34966 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLJdT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Mar 2020 05:33:19 -0400
Received: by mail-pf1-f194.google.com with SMTP id u68so2992102pfb.2
        for <linux-mips@vger.kernel.org>; Thu, 12 Mar 2020 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=KpQk/VuiscHk8dWEgfNGuNgOP8XwoC8+yutoUmH1R7s=;
        b=STVvNQy3mYxdMmLgX1Z11GbONxlPl0iFc1TPL/2tCd+bwoRAtzAscWDG+OIN3xqUEv
         rXcy6PPlpI1i9gsu8M3EysWLHInqp2NnvCjY8OlxrEC3xmVkgn112Avyolu4Ja4bX4O9
         Ix6PUKaMwNlFmiNA0AhP0uEe4R9lOuU0rNDNG4qOczxlrBJzdQ3bEE5OBfhTZHPjXdHQ
         pY7ZNSj8sXzGqhdPNkYTWQKgX0ClhJf14Ld1I6PKYv8Ja1UkvyjqLEQN1Z8pJpFPFquC
         D5Ds/s+XPEnl80iIbjM1EVzpokrAZh4ARsfmXwTXyoc9E3/5LSh9XZA0L6XEKoVj81sl
         Rghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=KpQk/VuiscHk8dWEgfNGuNgOP8XwoC8+yutoUmH1R7s=;
        b=ZrSgF62V8+e5zhK2ACG5iT5hUOVLJZqXjGsAZcCVSZqMNly1fAuHMlRUTWWe/LCV7a
         /lAIg1ECNkuNRA6D6a2P6EG0uouk4HaigrpQatO13wkp+K4lCmeDeJ1YtkCqVmVgqMbB
         /5Ay47SY5qFQcCDa8IpPHWYU19+ritutm+L8lbGl95bWa4bdBgsLa/3JElqZMXB0OejJ
         FgC5fxq9UAhnSE+PgOflv5WFyWZUVu77Ehu74Um+x7+7RZwRpmzI/a4IbpHP0VutQ3Wm
         tgFwYbs7qd+2GGCrkg+rNC9COOSPD6KMK6e3xSUrFQDmFOkWEKe3j4gKnzOVktMXnbWN
         d+WA==
X-Gm-Message-State: ANhLgQ1GrBtB8h0+jxj+9GvKgt764414rEIluFvI7CWEJIZhEqCuPrFz
        4YNdZ0FTF0T6hnU2AKJpUUE=
X-Google-Smtp-Source: ADFU+vscmsVOWUMyCgYXebmmKlCshnsXh1oR623XitwluMl1gB49gI+mtusJjenDCe7wjNboMZszqg==
X-Received: by 2002:a63:340c:: with SMTP id b12mr6698665pga.180.1584005597580;
        Thu, 12 Mar 2020 02:33:17 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id j13sm359286pgn.22.2020.03.12.02.33.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Mar 2020 02:33:17 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH Resend] MIPS: Add __cpu_full_name[] to make CPU names more human-readable
Date:   Thu, 12 Mar 2020 17:40:53 +0800
Message-Id: <1584006053-28887-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In /proc/cpuinfo, we keep "cpu model" as is, since GCC should use it
for -march=native. Besides, we add __cpu_full_name[] to describe the
processor in a more human-readable manner. The full name is displayed
as "model name" in cpuinfo, which is needed by some userspace tools
such as "lscpu" and "gnome-system-monitor".

The CPU frequency in "model name" is the default value (highest), and
there is also a "CPU MHz" whose value can be changed by cpufreq.

This is only used by Loongson now (ICT is dropped in cpu name, and cpu
name can be overwritten by BIOS).

Why drop ICT?
At the beginning, Loongson is designed by ICT, but now all Loongson
processors is designed by "Loongson Technology Corporation Limited"
which is independent from ICT. We have search the code in
https://codesearch.debian.net/, and the result is:

1, GCC searches the "cpu model" in cpuinfo, but it only matches
   "Loongson-2 V0.2" and so on, so drop "ICT" is comfortable;
2, Debian Installer searches the "cpu model" in cpuinfo and matches
   "ICT Loongson", but Yunqiang Su is modifying the code;
3, Valgrind searches the "cpu model" in cpuinfo and matches "ICT
   Loongson", and we are planning to fix it up.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---

Tips: Tiezhu Yang <yangtiezhu@loongson.cn> has send a patch to do the
same thing but need to be improved. We has consulted with each other and
decide to resend my version.

 arch/mips/include/asm/cpu-info.h                   |  2 ++
 arch/mips/include/asm/mach-loongson64/boot_param.h |  1 +
 arch/mips/include/asm/time.h                       |  2 ++
 arch/mips/kernel/cpu-probe.c                       | 30 +++++++++++++++++-----
 arch/mips/kernel/proc.c                            |  6 +++++
 arch/mips/kernel/time.c                            |  2 ++
 arch/mips/loongson64/env.c                         | 13 ++++++++++
 arch/mips/loongson64/smp.c                         |  1 +
 arch/mips/loongson64/smp.h                         |  1 +
 9 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index ed7ffe4..f5e1ce8 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -116,7 +116,9 @@ extern void cpu_probe(void);
 extern void cpu_report(void);
 
 extern const char *__cpu_name[];
+extern const char *__cpu_full_name[];
 #define cpu_name_string()	__cpu_name[raw_smp_processor_id()]
+#define cpu_full_name_string()	__cpu_full_name[raw_smp_processor_id()]
 
 struct seq_file;
 struct notifier_block;
diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 8c286be..1d69e4c 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -58,6 +58,7 @@ struct efi_cpuinfo_loongson {
 	u16 reserved_cores_mask;
 	u32 cpu_clock_freq; /* cpu_clock */
 	u32 nr_cpus;
+	char cpuname[64];
 } __packed;
 
 #define MAX_UARTS 64
diff --git a/arch/mips/include/asm/time.h b/arch/mips/include/asm/time.h
index e855a36..3ba2bc0 100644
--- a/arch/mips/include/asm/time.h
+++ b/arch/mips/include/asm/time.h
@@ -22,6 +22,8 @@ extern spinlock_t rtc_lock;
  */
 extern void plat_time_init(void);
 
+extern unsigned int mips_cpu_frequency;
+
 /*
  * mips_hpt_frequency - must be set if you intend to use an R4k-compatible
  * counter as a timer interrupt source.
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6ab6b03..dec98dd 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1544,32 +1544,44 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		switch (c->processor_id & PRID_REV_MASK) {
 		case PRID_REV_LOONGSON2E:
 			c->cputype = CPU_LOONGSON2EF;
-			__cpu_name[cpu] = "ICT Loongson-2";
+			__cpu_name[cpu] = "Loongson-2";
 			set_elf_platform(cpu, "loongson2e");
 			set_isa(c, MIPS_CPU_ISA_III);
 			c->fpu_msk31 |= FPU_CSR_CONDX;
+			__cpu_full_name[cpu] = "Loongson-2E";
 			break;
 		case PRID_REV_LOONGSON2F:
 			c->cputype = CPU_LOONGSON2EF;
-			__cpu_name[cpu] = "ICT Loongson-2";
+			__cpu_name[cpu] = "Loongson-2";
 			set_elf_platform(cpu, "loongson2f");
 			set_isa(c, MIPS_CPU_ISA_III);
 			c->fpu_msk31 |= FPU_CSR_CONDX;
+			__cpu_full_name[cpu] = "Loongson-2F";
 			break;
 		case PRID_REV_LOONGSON3A_R1:
 			c->cputype = CPU_LOONGSON64;
-			__cpu_name[cpu] = "ICT Loongson-3";
+			__cpu_name[cpu] = "Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R1);
+			__cpu_full_name[cpu] = "Loongson-3A R1 (Loongson-3A1000)";
 			c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 				MIPS_ASE_LOONGSON_EXT);
 			break;
 		case PRID_REV_LOONGSON3B_R1:
+			c->cputype = CPU_LOONGSON64;
+			__cpu_name[cpu] = "Loongson-3";
+			set_elf_platform(cpu, "loongson3b");
+			set_isa(c, MIPS_CPU_ISA_M64R1);
+			__cpu_full_name[cpu] = "Loongson-3B R1 (Loongson-3B1000)";
+			c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
+				MIPS_ASE_LOONGSON_EXT);
+			break;
 		case PRID_REV_LOONGSON3B_R2:
 			c->cputype = CPU_LOONGSON64;
-			__cpu_name[cpu] = "ICT Loongson-3";
+			__cpu_name[cpu] = "Loongson-3";
 			set_elf_platform(cpu, "loongson3b");
 			set_isa(c, MIPS_CPU_ISA_M64R1);
+			__cpu_full_name[cpu] = "Loongson-3B R2 (Loongson-3B1500)";
 			c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 				MIPS_ASE_LOONGSON_EXT);
 			break;
@@ -1923,16 +1935,18 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		case PRID_REV_LOONGSON3A_R2_0:
 		case PRID_REV_LOONGSON3A_R2_1:
 			c->cputype = CPU_LOONGSON64;
-			__cpu_name[cpu] = "ICT Loongson-3";
+			__cpu_name[cpu] = "Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
+			__cpu_full_name[cpu] = "Loongson-3A R2 (Loongson-3A2000)";
 			break;
 		case PRID_REV_LOONGSON3A_R3_0:
 		case PRID_REV_LOONGSON3A_R3_1:
 			c->cputype = CPU_LOONGSON64;
-			__cpu_name[cpu] = "ICT Loongson-3";
+			__cpu_name[cpu] = "Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
+			__cpu_full_name[cpu] = "Loongson-3A R3 (Loongson-3A3000)";
 			break;
 		}
 
@@ -1944,9 +1958,10 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		break;
 	case PRID_IMP_LOONGSON_64G:
 		c->cputype = CPU_LOONGSON64;
-		__cpu_name[cpu] = "ICT Loongson-3";
+		__cpu_name[cpu] = "Loongson-3";
 		set_elf_platform(cpu, "loongson3a");
 		set_isa(c, MIPS_CPU_ISA_M64R2);
+		__cpu_full_name[cpu] = "Loongson-3A R4 (Loongson-3A4000)";
 		decode_configs(c);
 		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
@@ -2112,6 +2127,7 @@ EXPORT_SYMBOL(__ua_limit);
 #endif
 
 const char *__cpu_name[NR_CPUS];
+const char *__cpu_full_name[NR_CPUS];
 const char *__elf_platform;
 
 void cpu_probe(void)
diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index f8d3671..97b66ed 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -15,6 +15,7 @@
 #include <asm/mipsregs.h>
 #include <asm/processor.h>
 #include <asm/prom.h>
+#include <asm/time.h>
 
 unsigned int vced_count, vcei_count;
 
@@ -63,6 +64,11 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, fmt, __cpu_name[n],
 		      (version >> 4) & 0x0f, version & 0x0f,
 		      (fp_vers >> 4) & 0x0f, fp_vers & 0x0f);
+	if (__cpu_full_name[n])
+		seq_printf(m, "model name\t\t: %s\n", __cpu_full_name[n]);
+	if (mips_cpu_frequency)
+		seq_printf(m, "CPU MHz\t\t\t: %u.%02u\n",
+		      mips_cpu_frequency / 1000000, (mips_cpu_frequency / 10000) % 100);
 	seq_printf(m, "BogoMIPS\t\t: %u.%02u\n",
 		      cpu_data[n].udelay_val / (500000/HZ),
 		      (cpu_data[n].udelay_val / (5000/HZ)) % 100);
diff --git a/arch/mips/kernel/time.c b/arch/mips/kernel/time.c
index 37e9413..240581e 100644
--- a/arch/mips/kernel/time.c
+++ b/arch/mips/kernel/time.c
@@ -50,6 +50,8 @@ EXPORT_SYMBOL(perf_irq);
  * 2) calculate a couple of cached variables for later usage
  */
 
+unsigned int mips_cpu_frequency;
+EXPORT_SYMBOL_GPL(mips_cpu_frequency);
 unsigned int mips_hpt_frequency;
 EXPORT_SYMBOL_GPL(mips_hpt_frequency);
 
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 0daeb7b..29cf27c 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -14,6 +14,7 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 #include <linux/export.h>
+#include <asm/time.h>
 #include <asm/bootinfo.h>
 #include <loongson.h>
 #include <boot_param.h>
@@ -21,6 +22,7 @@
 
 u32 cpu_clock_freq;
 EXPORT_SYMBOL(cpu_clock_freq);
+char cpu_full_name[64];
 struct efi_memory_map_loongson *loongson_memmap;
 struct loongson_system_configuration loongson_sysconf;
 
@@ -37,6 +39,7 @@ const char *get_system_type(void)
 
 void __init prom_init_env(void)
 {
+	char freq[12];
 	struct boot_params *boot_p;
 	struct loongson_params *loongson_p;
 	struct system_loongson *esys;
@@ -119,6 +122,10 @@ void __init prom_init_env(void)
 	loongson_sysconf.nr_nodes = (loongson_sysconf.nr_cpus +
 		loongson_sysconf.cores_per_node - 1) /
 		loongson_sysconf.cores_per_node;
+	if (!strncmp(ecpu->cpuname, "Loongson", 8))
+		strncpy(cpu_full_name, ecpu->cpuname, sizeof(cpu_full_name));
+	if (cpu_full_name[0] == 0)
+		strncpy(cpu_full_name, __cpu_full_name[0], sizeof(cpu_full_name));
 
 	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
 	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
@@ -154,5 +161,11 @@ void __init prom_init_env(void)
 	if (loongson_sysconf.nr_sensors)
 		memcpy(loongson_sysconf.sensors, esys->sensors,
 			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
+	mips_cpu_frequency = cpu_clock_freq;
 	pr_info("CpuClock = %u\n", cpu_clock_freq);
+
+	/* Append default cpu frequency with round-off */
+	sprintf(freq, " @ %uMHz", (cpu_clock_freq + 500000) / 1000000);
+	strncat(cpu_full_name, freq, sizeof(cpu_full_name));
+	__cpu_full_name[0] = cpu_full_name;
 }
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index de8e074..ef6b83c 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -384,6 +384,7 @@ static void loongson3_init_secondary(void)
 		initcount = core0_c0count[cpu] + i/2;
 
 	write_c0_count(initcount);
+	__cpu_full_name[cpu] = cpu_full_name;
 }
 
 static void loongson3_smp_finish(void)
diff --git a/arch/mips/loongson64/smp.h b/arch/mips/loongson64/smp.h
index 957bde8..6112d9d 100644
--- a/arch/mips/loongson64/smp.h
+++ b/arch/mips/loongson64/smp.h
@@ -3,6 +3,7 @@
 #define __LOONGSON_SMP_H_
 
 /* for Loongson-3 smp support */
+extern char cpu_full_name[64];
 extern unsigned long long smp_group[4];
 
 /* 4 groups(nodes) in maximum in numa case */
-- 
2.7.0

