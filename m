Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F83252F04
	for <lists+linux-mips@lfdr.de>; Wed, 26 Aug 2020 14:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730022AbgHZMxt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Aug 2020 08:53:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33724 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729999AbgHZMxs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 Aug 2020 08:53:48 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx+MVIW0ZfSj4OAA--.1019S2;
        Wed, 26 Aug 2020 20:53:28 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Loongson: Fix complie errors without CONFIG_SMP
Date:   Wed, 26 Aug 2020 20:53:27 +0800
Message-Id: <1598446407-8845-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx+MVIW0ZfSj4OAA--.1019S2
X-Coremail-Antispam: 1UD129KBjvJXoWfGryUKw15ZryDAry5JF17GFg_yoWkZw4rpF
        srAr1kGF48WryUArZ5A39Y9ry3Xwn5GrW2y3yj9ry3u3ZIq3WUJrs3Kr1avr18JF4vk3Wx
        WFZxWr1fWr12yw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU6wZcUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Machine as follows,
[    0.000000] MIPS: machine is loongson,loongson64c-4core-ls7a

If SMP if off, error as follows:

0x0:
In file included from ./include/linux/gfp.h:9:0,
                 from ./include/linux/xarray.h:14,
                 from ./include/linux/radix-tree.h:18,
                 from ./include/linux/fs.h:15,
                 from ./include/linux/compat.h:17,
                 from arch/mips/kernel/asm-offsets.c:12:
./include/linux/topology.h: In function ‘numa_node_id’:
./include/linux/topology.h:119:2: error: implicit declaration of function ‘cpu_logical_map’ [-Werror=implicit-function-declaration]
  return cpu_to_node(raw_smp_processor_id());
  ^
In uniprocessor machines cpu_to_node(cpu) values 0.

arch/mips/include/asm/mach-loongson64/topology.h -> 0x0

And then errors follows,

0x1:
In file included from ./arch/mips/include/asm/mach-loongson64/topology.h:5:0,
                 from ./arch/mips/include/asm/topology.h:11,
                 from ./include/linux/topology.h:36,
                 from ./include/linux/gfp.h:9,
                 from ./include/linux/xarray.h:14,
                 from ./include/linux/radix-tree.h:18,
                 from ./include/linux/fs.h:15,
                 from ./include/linux/compat.h:17,
                 from arch/mips/kernel/asm-offsets.c:12:
./arch/mips/include/asm/smp.h:28:44: error: macro "raw_smp_processor_id" passed 1 arguments, but takes just 0
 static inline int raw_smp_processor_id(void)
                                            ^
./arch/mips/include/asm/smp.h:29:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 {
 ^
./arch/mips/include/asm/smp.h:38:0: warning: "raw_smp_processor_id" redefined
 #define raw_smp_processor_id raw_smp_processor_id
 ^
In file included from ./arch/mips/include/asm/cpu-type.h:12:0,
                 from ./arch/mips/include/asm/timex.h:19,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:73,
                 from ./include/linux/compat.h:10,
                 from arch/mips/kernel/asm-offsets.c:12:
./include/linux/smp.h:160:0: note: this is the location of the previous definition
 #define raw_smp_processor_id()   0
 ^

0x2:
In file included from ./arch/mips/include/asm/mach-loongson64/topology.h:5:0,
                 from ./arch/mips/include/asm/topology.h:11,
                 from ./include/linux/topology.h:36,
                 from ./include/linux/gfp.h:9,
                 from ./include/linux/xarray.h:14,
                 from ./include/linux/radix-tree.h:18,
                 from ./include/linux/fs.h:15,
                 from ./include/linux/compat.h:17,
                 from arch/mips/kernel/asm-offsets.c:12:
./arch/mips/include/asm/smp.h:42:29: error: ‘CONFIG_MIPS_NR_CPU_NR_MAP’ undeclared here (not in a function)
 extern int __cpu_number_map[CONFIG_MIPS_NR_CPU_NR_MAP];
                             ^

0x3:
./arch/mips/include/asm/smp.h:69:20: error: redefinition of ‘smp_send_reschedule’
 static inline void smp_send_reschedule(int cpu)
                    ^
In file included from ./arch/mips/include/asm/cpu-type.h:12:0,
                 from ./arch/mips/include/asm/timex.h:19,
                 from ./include/linux/timex.h:65,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:73,
                 from ./include/linux/compat.h:10,
                 from arch/mips/kernel/asm-offsets.c:12:
./include/linux/smp.h:167:20: note: previous definition of ‘smp_send_reschedule’ was here
 static inline void smp_send_reschedule(int cpu) { }
                    ^
In file included from ./arch/mips/include/asm/mach-loongson64/topology.h:5:0,
                 from ./arch/mips/include/asm/topology.h:11,
                 from ./include/linux/topology.h:36,
                 from ./include/linux/gfp.h:9,
                 from ./include/linux/xarray.h:14,
                 from ./include/linux/radix-tree.h:18,
                 from ./include/linux/fs.h:15,
                 from ./include/linux/compat.h:17,
                 from arch/mips/kernel/asm-offsets.c:12:
./arch/mips/include/asm/smp.h: In function ‘smp_send_reschedule’:

0x4:
./arch/mips/include/asm/smp.h:73:8: error: dereferencing pointer to incomplete type
  mp_ops->send_ipi_single(cpu, SMP_RESCHEDULE_YOURSELF);
        ^
./arch/mips/include/asm/smp.h: In function ‘kexec_nonboot_cpu’:
./arch/mips/include/asm/smp.h:99:15: error: dereferencing pointer to incomplete type
  return mp_ops->kexec_nonboot_cpu();
               ^
./arch/mips/include/asm/smp.h:99:2: warning: ‘return’ with a value, in function returning void
  return mp_ops->kexec_nonboot_cpu();
  ^
./arch/mips/include/asm/smp.h: In function ‘kexec_nonboot_cpu_func’:
./arch/mips/include/asm/smp.h:106:15: error: dereferencing pointer to incomplete type
  return mp_ops->kexec_nonboot_cpu;
               ^
./arch/mips/include/asm/smp.h: In function ‘arch_send_call_function_single_ipi’:
./arch/mips/include/asm/smp.h:128:8: error: dereferencing pointer to incomplete type
  mp_ops->send_ipi_single(cpu, SMP_CALL_FUNCTION);
        ^
./arch/mips/include/asm/smp.h: In function ‘arch_send_call_function_ipi_mask’:
./arch/mips/include/asm/smp.h:135:8: error: dereferencing pointer to incomplete type
  mp_ops->send_ipi_mask(mask, SMP_CALL_FUNCTION);
        ^

For 0x2, CONFIG_MIPS_NR_CPU_NR_MAP can't depend on SMP,
otherwise its ranges not include 1.

arch/mips/Kconfig -> 0x2

For 0x1, 0x3, 0x4 can be fixed by checking CONFIG_SMP,
arch/mips/include/asm/smp.h -> 0x1, 0x3, 0x4

After fix them, errors as follows,

0x5:
mm/percpu.o: In function `setup_per_cpu_areas':
(.init.text+0xa00): multiple definition of `setup_per_cpu_areas'
arch/mips/mm/init.o:(.init.text+0xa8): first defined here

Normally, setup_per_cpu_areas is defined at arch/mips/mm/init.c
with CONFIG_HAVE_SETUP_PER_CPU_AREA. mm/percpu.c defines it with
CONFIG_SMP && !CONFIG_HAVE_SETUP_PER_CPU_AREA || !CONFIG_SMP.
Obviously, !CONFIG_SMP causes the multiple definition.

arch/mips/mm/init.c -> 0x5

New errors as follows,

0x6:
mm/page_alloc.o: In function `get_page_from_freelist':
page_alloc.c:(.text+0x4734): undefined reference to `node_reclaim_distance'
page_alloc.c:(.text+0x473c): undefined reference to `node_reclaim_distance'

mm/page_alloc.c -> 0x6

Now, it can complie right and loongson3-llsc-check returns success.
And it can start success.

Origin(use SMP): $ lscpu
Architecture:          mips64
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
NUMA node(s):          1
Model name:            Loongson-3A R3 (Loongson-3A3000) @ 1450MHz
CPU max MHz:           1450.0000
CPU min MHz:           725.0000
L1d cache:             64K
L1i cache:             64K
L2 cache:              256K
L3 cache:              2048K
NUMA node0 CPU(s):     0-3

Now(not use SMP): $ lscpu
Architecture:          mips64
Byte Order:            Little Endian
CPU(s):                1
On-line CPU(s) list:   0
Thread(s) per core:    1
Core(s) per socket:    1
Socket(s):             1
NUMA node(s):          1
L1d cache:             64K
L1i cache:             64K
L2 cache:              2048K
NUMA node0 CPU(s):     0

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/Kconfig                                |  2 +-
 arch/mips/include/asm/mach-loongson64/topology.h |  4 ++++
 arch/mips/include/asm/smp.h                      | 20 ++++++++++++++++++++
 arch/mips/mm/init.c                              |  2 +-
 mm/page_alloc.c                                  |  6 +++---
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a..c3b2864 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2876,7 +2876,7 @@ config MIPS_NR_CPU_NR_MAP_1024
 
 config MIPS_NR_CPU_NR_MAP
 	int
-	depends on SMP
+	default 1 if !SMP
 	default 1024 if MIPS_NR_CPU_NR_MAP_1024
 	default NR_CPUS if !MIPS_NR_CPU_NR_MAP_1024
 
diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
index 3414a1f..2157fe1 100644
--- a/arch/mips/include/asm/mach-loongson64/topology.h
+++ b/arch/mips/include/asm/mach-loongson64/topology.h
@@ -4,7 +4,11 @@
 
 #ifdef CONFIG_NUMA
 
+#ifdef CONFIG_SMP
 #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
+#else
+#define cpu_to_node(cpu)	0
+#endif
 
 extern cpumask_t __node_cpumask[];
 #define cpumask_of_node(node)	(&__node_cpumask[node])
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index 5d9ff61..8ea3733 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -25,6 +25,7 @@ extern cpumask_t cpu_sibling_map[];
 extern cpumask_t cpu_core_map[];
 extern cpumask_t cpu_foreign_map[];
 
+#ifdef CONFIG_SMP
 static inline int raw_smp_processor_id(void)
 {
 #if defined(__VDSO__)
@@ -36,6 +37,7 @@ static inline int raw_smp_processor_id(void)
 #endif
 }
 #define raw_smp_processor_id raw_smp_processor_id
+#endif
 
 /* Map from cpu id to sequential logical cpu number.  This will only
    not be idempotent when cpus failed to come on-line.	*/
@@ -66,12 +68,14 @@ extern void calculate_cpu_foreign_map(void);
  * it goes straight through and wastes no time serializing
  * anything. Worst case is that we lose a reschedule ...
  */
+#ifdef CONFIG_SMP
 static inline void smp_send_reschedule(int cpu)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
 
 	mp_ops->send_ipi_single(cpu, SMP_RESCHEDULE_YOURSELF);
 }
+#endif
 
 #ifdef CONFIG_HOTPLUG_CPU
 static inline int __cpu_disable(void)
@@ -92,6 +96,8 @@ extern void play_dead(void);
 #endif
 
 #ifdef CONFIG_KEXEC
+
+#ifdef CONFIG_SMP
 static inline void kexec_nonboot_cpu(void)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
@@ -105,6 +111,15 @@ static inline void *kexec_nonboot_cpu_func(void)
 
 	return mp_ops->kexec_nonboot_cpu;
 }
+#else /* CONFIG_SMP */
+static inline void kexec_nonboot_cpu(void) { }
+
+static inline void *kexec_nonboot_cpu_func(void)
+{
+	return NULL;
+}
+#endif /* CONFIG_SMP */
+
 #endif
 
 /*
@@ -121,6 +136,7 @@ int mips_smp_ipi_allocate(const struct cpumask *mask);
  */
 int mips_smp_ipi_free(const struct cpumask *mask);
 
+#ifdef CONFIG_SMP
 static inline void arch_send_call_function_single_ipi(int cpu)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
@@ -134,5 +150,9 @@ static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 
 	mp_ops->send_ipi_mask(mask, SMP_CALL_FUNCTION);
 }
+#else /* CONFIG_SMP */
+static inline void arch_send_call_function_single_ipi(int cpu) { }
+static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask) { }
+#endif /* CONFIG_SMP */
 
 #endif /* __ASM_SMP_H */
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 6c7bbfe..867bff2 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -513,7 +513,7 @@ void __ref free_initmem(void)
 		free_initmem_default(POISON_FREE_INITMEM);
 }
 
-#ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
+#if defined(CONFIG_HAVE_SETUP_PER_CPU_AREA) && defined(CONFIG_SMP)
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0e2bab4..45a891c 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3635,18 +3635,18 @@ bool zone_watermark_ok_safe(struct zone *z, unsigned int order,
 								free_pages);
 }
 
-#ifdef CONFIG_NUMA
+#if defined(CONFIG_NUMA) && defined(CONFIG_SMP)
 static bool zone_allows_reclaim(struct zone *local_zone, struct zone *zone)
 {
 	return node_distance(zone_to_nid(local_zone), zone_to_nid(zone)) <=
 				node_reclaim_distance;
 }
-#else	/* CONFIG_NUMA */
+#else	/* CONFIG_NUMA && CONFIG_SMP */
 static bool zone_allows_reclaim(struct zone *local_zone, struct zone *zone)
 {
 	return true;
 }
-#endif	/* CONFIG_NUMA */
+#endif	/* CONFIG_NUMA && CONFIG_SMP */
 
 /*
  * The restriction on ZONE_DMA32 as being a suitable zone to use to avoid
-- 
2.1.0

