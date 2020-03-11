Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E87C31810CE
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 07:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgCKGdz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 02:33:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35630 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725976AbgCKGdz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 02:33:55 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL91IhmheiG8ZAA--.7S2;
        Wed, 11 Mar 2020 14:33:46 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Loongson: Add model name to /proc/cpuinfo
Date:   Wed, 11 Mar 2020 14:33:34 +0800
Message-Id: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxL91IhmheiG8ZAA--.7S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw4xur1DJry8GFWrWFyUZFb_yoW7ZrWxpa
        18Ca93Gr48KryDK3s3Jry09ryYvw1fJFZruay7tayUZasaqF15X397tF1FyrnFyFyjvw1f
        ZrZa9r4a9FW8uwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUU38nUUUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, when execute command "cat /proc/cpuinfo" or "lscpu",
it can not get cpu type and frequency directly because the model name is
not exist, so add it.

E.g. without this patch:

[loongson@localhost ~]$ lscpu
Architecture:          mips64
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
L1d cache:             64K
L1i cache:             64K
L2 cache:              2048K
NUMA node0 CPU(s):     0-3

With this patch:

[loongson@localhost ~]$ lscpu
Architecture:          mips64
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Model name:            Loongson-3A R3 (Loongson-3A3000) @ 1449MHz
L1d cache:             64K
L1i cache:             64K
L2 cache:              2048K
NUMA node0 CPU(s):     0-3

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/cpu-info.h |  1 +
 arch/mips/kernel/cpu-probe.c     | 27 +++++++++++++++++++++++----
 arch/mips/kernel/proc.c          |  4 ++++
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index ed7ffe4..50e924e 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -115,6 +115,7 @@ extern struct cpuinfo_mips cpu_data[];
 extern void cpu_probe(void);
 extern void cpu_report(void);
 
+extern const char *__model_name[];
 extern const char *__cpu_name[];
 #define cpu_name_string()	__cpu_name[raw_smp_processor_id()]
 
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6ab6b03..3ae40cc 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1548,6 +1548,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 			set_elf_platform(cpu, "loongson2e");
 			set_isa(c, MIPS_CPU_ISA_III);
 			c->fpu_msk31 |= FPU_CSR_CONDX;
+			__model_name[cpu] = "Loongson-2E";
 			break;
 		case PRID_REV_LOONGSON2F:
 			c->cputype = CPU_LOONGSON2EF;
@@ -1555,23 +1556,37 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 			set_elf_platform(cpu, "loongson2f");
 			set_isa(c, MIPS_CPU_ISA_III);
 			c->fpu_msk31 |= FPU_CSR_CONDX;
+			__model_name[cpu] = "Loongson-2F";
 			break;
 		case PRID_REV_LOONGSON3A_R1:
 			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R1);
-			c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
-				MIPS_ASE_LOONGSON_EXT);
+			c->ases |= (MIPS_ASE_LOONGSON_MMI |
+				    MIPS_ASE_LOONGSON_CAM |
+				    MIPS_ASE_LOONGSON_EXT);
+			__model_name[cpu] = "Loongson-3A R1 (Loongson-3A1000)";
 			break;
 		case PRID_REV_LOONGSON3B_R1:
+			c->cputype = CPU_LOONGSON64;
+			__cpu_name[cpu] = "ICT Loongson-3";
+			set_elf_platform(cpu, "loongson3b");
+			set_isa(c, MIPS_CPU_ISA_M64R1);
+			c->ases |= (MIPS_ASE_LOONGSON_MMI |
+				    MIPS_ASE_LOONGSON_CAM |
+				    MIPS_ASE_LOONGSON_EXT);
+			__model_name[cpu] = "Loongson-3B R1 (Loongson-3B1000)";
+			break;
 		case PRID_REV_LOONGSON3B_R2:
 			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3b");
 			set_isa(c, MIPS_CPU_ISA_M64R1);
-			c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
-				MIPS_ASE_LOONGSON_EXT);
+			c->ases |= (MIPS_ASE_LOONGSON_MMI |
+				    MIPS_ASE_LOONGSON_CAM |
+				    MIPS_ASE_LOONGSON_EXT);
+			__model_name[cpu] = "Loongson-3B R2 (Loongson-3B1500)";
 			break;
 		}
 
@@ -1926,6 +1941,7 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
+			__model_name[cpu] = "Loongson-3A R2 (Loongson-3A2000)";
 			break;
 		case PRID_REV_LOONGSON3A_R3_0:
 		case PRID_REV_LOONGSON3A_R3_1:
@@ -1933,6 +1949,7 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
+			__model_name[cpu] = "Loongson-3A R3 (Loongson-3A3000)";
 			break;
 		}
 
@@ -1952,6 +1969,7 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
+		__model_name[cpu] = "Loongson-3A R4 (Loongson-3A4000)";
 		break;
 	default:
 		panic("Unknown Loongson Processor ID!");
@@ -2111,6 +2129,7 @@ u64 __ua_limit;
 EXPORT_SYMBOL(__ua_limit);
 #endif
 
+const char *__model_name[NR_CPUS];
 const char *__cpu_name[NR_CPUS];
 const char *__elf_platform;
 
diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index f8d3671..5fc74e6 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -15,6 +15,7 @@
 #include <asm/mipsregs.h>
 #include <asm/processor.h>
 #include <asm/prom.h>
+#include <asm/time.h>
 
 unsigned int vced_count, vcei_count;
 
@@ -63,6 +64,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, fmt, __cpu_name[n],
 		      (version >> 4) & 0x0f, version & 0x0f,
 		      (fp_vers >> 4) & 0x0f, fp_vers & 0x0f);
+	if (__model_name[n])
+		seq_printf(m, "model name\t\t: %s @ %uMHz\n",
+		      __model_name[n], mips_hpt_frequency / 500000);
 	seq_printf(m, "BogoMIPS\t\t: %u.%02u\n",
 		      cpu_data[n].udelay_val / (500000/HZ),
 		      (cpu_data[n].udelay_val / (5000/HZ)) % 100);
-- 
2.1.0

