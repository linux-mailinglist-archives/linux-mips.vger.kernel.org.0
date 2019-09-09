Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6AB3AD23E
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2019 05:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbfIIDhn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Sep 2019 23:37:43 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35017 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfIIDhn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Sep 2019 23:37:43 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so8273227pfw.2
        for <linux-mips@vger.kernel.org>; Sun, 08 Sep 2019 20:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t+mv/nO7x3yS1wTngJ1lCWi/U4lG/8/yTsV+AjWK3Hc=;
        b=AO3BgrDjLoh5V4VU2HBa1XJp6DHZv2LmBSHyqbKM2//IeowK1H7L87SAJ5nyHVKSaf
         qeuqOoez4UGfCfXcyv9KafewZnpodhTfNhDKjRsxRZjJPWtnruX1wc75SugRTKVFrHpC
         Z4LtC6np/1n+2Dc5zHPwDWKjwpgwesNRSRqnKsCR2A2j3osvlWkA69H1qmsUWNTJiCX1
         miT58a5nH+nzxn4k+m4Tu2Q0cIrWcvXXkZabb9SYs7RaYp+265wQxJ5KcUaTtWorxi0e
         eB/xYnokD11F7jS0Nd2xWprTR5k85c4htZw1XZ5MIaAswq/r+5g632sWWPQoNfjt1qFW
         igRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=t+mv/nO7x3yS1wTngJ1lCWi/U4lG/8/yTsV+AjWK3Hc=;
        b=dNC+3OS77yxazYcIetxWgyQkKDCXrz2rN7u0OOAgsqwlTSff1N+YMIKwj+rKdOj8z1
         mkP2nFLXqqso5RL1V7/CblkWF2d5aVmu5CQla2BvIIS+fLT1sKiftHu/DxJbqlvQ9lfr
         24kekfuoNMgVMn9UunQU2qBK5jgnrn0+pTl9MH1T+FXg4rfHxi7x9RqhJW6E7bPnExje
         zGt01rbp4RDOp6ejamoJufafJ53i5a3JX04IgpwDk6olhx6ibaD1duBI/+zMph0eRojP
         /OL0/zaupnsheEgAVUzTtgJ2IMPkERZj4v37d0duGFVWKwzoiJa3WJ11bf7nHEKIG9r6
         t4aA==
X-Gm-Message-State: APjAAAW68okJxfqLCWMe4ShrgSYdvrq3HnmcAxTV/FVi1KDNh7K8mEut
        LSB6OwNAmmU/jbZPZAl7rWc=
X-Google-Smtp-Source: APXvYqzVj7r/DGRhd/aiQ6zvlZxAHiwljf0voLSqEwC/XVd4yNhJBImcXJAvhtaBDUfs5eYTCEWz2w==
X-Received: by 2002:a17:90a:3462:: with SMTP id o89mr23175263pjb.2.1568000262077;
        Sun, 08 Sep 2019 20:37:42 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id b24sm13939437pfi.75.2019.09.08.20.37.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 20:37:41 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH V1 2/3] MIPS: Loongson: Add Loongson-3A R4 basic support
Date:   Mon,  9 Sep 2019 11:38:22 +0800
Message-Id: <1568000303-771-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1568000303-771-1-git-send-email-chenhc@lemote.com>
References: <1568000303-771-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All Loongson-3 CPU family:

Code-name         Brand-name       PRId
Loongson-3A R1    Loongson-3A1000  0x6305
Loongson-3A R2    Loongson-3A2000  0x6308
Loongson-3A R2.1  Loongson-3A2000  0x630c
Loongson-3A R3    Loongson-3A3000  0x6309
Loongson-3A R3.1  Loongson-3A3000  0x630d
Loongson-3A R4    Loongson-3A4000  0xc000
Loongson-3B R1    Loongson-3B1000  0x6306
Loongson-3B R2    Loongson-3B1500  0x6307

Features of R4 revision of Loongson-3A:

  - All R2/R3 features, including SFB, V-Cache, FTLB, RIXI, DSP, etc.
  - Support variable ASID bits.
  - Support MSA and VZ extensions.
  - Support CPUCFG (CPU config) and CSR (Control and Status Register)
      extensions.
  - 64 entries of VTLB (classic TLB), 2048 entries of FTLB (8-way
      set-associative).

Now 64-bit Loongson processors has three types of PRID.IMP: 0x6300 is
the classic one so we call it PRID_IMP_LOONGSON_64C (e.g., Loongson-2E/
2F/3A1000/3B1000/3B1500/3A2000/3A3000), 0x6100 is for some processors
which has reduced capabilities so we call it PRID_IMP_LOONGSON_64R
(e.g., Loongson-2K), 0xc000 is supposed to cover all new processors in
general (e.g., Loongson-3A4000+) so we call it PRID_IMP_LOONGSON_64G.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                                  |  2 +
 arch/mips/include/asm/cpu.h                        |  4 +-
 .../asm/mach-loongson64/kernel-entry-init.h        | 28 +++++--
 arch/mips/kernel/cpu-probe.c                       | 15 +++-
 arch/mips/kernel/idle.c                            |  3 +-
 arch/mips/loongson64/loongson-3/smp.c              | 90 ++++++++++++----------
 arch/mips/mm/c-r4k.c                               |  3 +-
 drivers/platform/mips/cpu_hwmon.c                  | 14 +++-
 8 files changed, 107 insertions(+), 52 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 31c7044..3afcbce 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1378,9 +1378,11 @@ config CPU_LOONGSON3
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
+	select CPU_SUPPORTS_MSA
 	select CPU_HAS_LOAD_STORE_LR
 	select WEAK_ORDERING
 	select WEAK_REORDERING_BEYOND_LLSC
+	select MIPS_ASID_BITS_VARIABLE
 	select MIPS_PGD_C0_CONTEXT
 	select MIPS_L1_CACHE_SHIFT_6
 	select GPIOLIB
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 7fddcb8..81ddb57 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -91,7 +91,9 @@
 #define PRID_IMP_LOONGSON_32	0x4200  /* Loongson-1 */
 #define PRID_IMP_R5432		0x5400
 #define PRID_IMP_R5500		0x5500
-#define PRID_IMP_LOONGSON_64	0x6300  /* Loongson-2/3 */
+#define PRID_IMP_LOONGSON_64R	0x6100  /* Reduced Loongson-2 */
+#define PRID_IMP_LOONGSON_64C	0x6300  /* Classic Loongson-2 and Loongson-3 */
+#define PRID_IMP_LOONGSON_64G	0xc000  /* Generic Loongson-2 and Loongson-3 */
 
 #define PRID_IMP_UNKNOWN	0xff00
 
diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
index b5e288a..b968732 100644
--- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
@@ -30,13 +30,21 @@
 	mtc0	t0, CP0_PAGEGRAIN
 	/* Enable STFill Buffer */
 	mfc0	t0, CP0_PRID
+	/* Loongson-3A R4+ */
+	andi	t1, t0, PRID_IMP_MASK
+	li	t2, PRID_IMP_LOONGSON_64G
+	beq     t1, t2, 1f
+	nop
+	/* Loongson-3A R2/R3 */
 	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
-	slti	t0, (PRID_IMP_LOONGSON_64 | PRID_REV_LOONGSON3A_R2_0)
-	bnez	t0, 1f
+	slti	t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
+	bnez	t0, 2f
+	nop
+1:
 	mfc0	t0, CP0_CONFIG6
 	or	t0, 0x100
 	mtc0	t0, CP0_CONFIG6
-1:
+2:
 	_ehb
 	.set	pop
 #endif
@@ -59,13 +67,21 @@
 	mtc0	t0, CP0_PAGEGRAIN
 	/* Enable STFill Buffer */
 	mfc0	t0, CP0_PRID
+	/* Loongson-3A R4+ */
+	andi	t1, t0, PRID_IMP_MASK
+	li	t2, PRID_IMP_LOONGSON_64G
+	beq     t1, t2, 1f
+	nop
+	/* Loongson-3A R2/R3 */
 	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
-	slti	t0, (PRID_IMP_LOONGSON_64 | PRID_REV_LOONGSON3A_R2_0)
-	bnez	t0, 1f
+	slti	t0, (PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0)
+	bnez	t0, 2f
+	nop
+1:
 	mfc0	t0, CP0_CONFIG6
 	or	t0, 0x100
 	mtc0	t0, CP0_CONFIG6
-1:
+2:
 	_ehb
 	.set	pop
 #endif
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index c2eb392..09b2c67 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1526,7 +1526,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 			     MIPS_CPU_LLSC | MIPS_CPU_BP_GHIST;
 		c->tlbsize = 64;
 		break;
-	case PRID_IMP_LOONGSON_64:  /* Loongson-2/3 */
+	case PRID_IMP_LOONGSON_64C:  /* Loongson-2/3 */
 		switch (c->processor_id & PRID_REV_MASK) {
 		case PRID_REV_LOONGSON2E:
 			c->cputype = CPU_LOONGSON2;
@@ -1903,7 +1903,7 @@ static inline void cpu_probe_cavium(struct cpuinfo_mips *c, unsigned int cpu)
 static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 {
 	switch (c->processor_id & PRID_IMP_MASK) {
-	case PRID_IMP_LOONGSON_64:  /* Loongson-2/3 */
+	case PRID_IMP_LOONGSON_64C:  /* Loongson-2/3 */
 		switch (c->processor_id & PRID_REV_MASK) {
 		case PRID_REV_LOONGSON3A_R2_0:
 		case PRID_REV_LOONGSON3A_R2_1:
@@ -1927,6 +1927,17 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
 		break;
+	case PRID_IMP_LOONGSON_64G:
+		c->cputype = CPU_LOONGSON3;
+		__cpu_name[cpu] = "ICT Loongson-3";
+		set_elf_platform(cpu, "loongson3a");
+		set_isa(c, MIPS_CPU_ISA_M64R2);
+		decode_configs(c);
+		c->options |= MIPS_CPU_FTLB | MIPS_CPU_TLBINV | MIPS_CPU_LDPTE;
+		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
+			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
+		break;
 	default:
 		panic("Unknown Loongson Processor ID!");
 		break;
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index eb2afc0..980d6c3 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -179,7 +179,8 @@ void __init check_wait(void)
 		cpu_wait = r4k_wait;
 		break;
 	case CPU_LOONGSON3:
-		if ((c->processor_id & PRID_REV_MASK) >= PRID_REV_LOONGSON3A_R2_0)
+		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
+				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0))
 			cpu_wait = r4k_wait;
 		break;
 
diff --git a/arch/mips/loongson64/loongson-3/smp.c b/arch/mips/loongson64/loongson-3/smp.c
index ce68cda..e999bb1 100644
--- a/arch/mips/loongson64/loongson-3/smp.c
+++ b/arch/mips/loongson64/loongson-3/smp.c
@@ -450,7 +450,7 @@ static void loongson3_cpu_die(unsigned int cpu)
  * flush all L1 entries at first. Then, another core (usually Core 0) can
  * safely disable the clock of the target core. loongson3_play_dead() is
  * called via CKSEG1 (uncached and unmmaped) */
-static void loongson3a_r1_play_dead(int *state_addr)
+static void loongson3_type1_play_dead(int *state_addr)
 {
 	register int val;
 	register long cpuid, core, node, count;
@@ -512,7 +512,7 @@ static void loongson3a_r1_play_dead(int *state_addr)
 		: "a1");
 }
 
-static void loongson3a_r2r3_play_dead(int *state_addr)
+static void loongson3_type2_play_dead(int *state_addr)
 {
 	register int val;
 	register long cpuid, core, node, count;
@@ -532,27 +532,7 @@ static void loongson3a_r2r3_play_dead(int *state_addr)
 		"   cache 1, 3(%[addr])           \n"
 		"   addiu %[sets], %[sets], -1    \n"
 		"   bnez  %[sets], 1b             \n"
-		"   addiu %[addr], %[addr], 0x40  \n"
-		"   li %[addr], 0x80000000        \n" /* KSEG0 */
-		"2: cache 2, 0(%[addr])           \n" /* flush L1 VCache */
-		"   cache 2, 1(%[addr])           \n"
-		"   cache 2, 2(%[addr])           \n"
-		"   cache 2, 3(%[addr])           \n"
-		"   cache 2, 4(%[addr])           \n"
-		"   cache 2, 5(%[addr])           \n"
-		"   cache 2, 6(%[addr])           \n"
-		"   cache 2, 7(%[addr])           \n"
-		"   cache 2, 8(%[addr])           \n"
-		"   cache 2, 9(%[addr])           \n"
-		"   cache 2, 10(%[addr])          \n"
-		"   cache 2, 11(%[addr])          \n"
-		"   cache 2, 12(%[addr])          \n"
-		"   cache 2, 13(%[addr])          \n"
-		"   cache 2, 14(%[addr])          \n"
-		"   cache 2, 15(%[addr])          \n"
-		"   addiu %[vsets], %[vsets], -1  \n"
-		"   bnez  %[vsets], 2b            \n"
-		"   addiu %[addr], %[addr], 0x40  \n"
+		"   addiu %[addr], %[addr], 0x20  \n"
 		"   li    %[val], 0x7             \n" /* *state_addr = CPU_DEAD; */
 		"   sw    %[val], (%[state_addr]) \n"
 		"   sync                          \n"
@@ -560,8 +540,7 @@ static void loongson3a_r2r3_play_dead(int *state_addr)
 		"   .set pop                      \n"
 		: [addr] "=&r" (addr), [val] "=&r" (val)
 		: [state_addr] "r" (state_addr),
-		  [sets] "r" (cpu_data[smp_processor_id()].dcache.sets),
-		  [vsets] "r" (cpu_data[smp_processor_id()].vcache.sets));
+		  [sets] "r" (cpu_data[smp_processor_id()].dcache.sets));
 
 	__asm__ __volatile__(
 		"   .set push                         \n"
@@ -576,6 +555,8 @@ static void loongson3a_r2r3_play_dead(int *state_addr)
 		"   andi  %[node], %[cpuid], 0xc      \n"
 		"   dsll  %[node], 42                 \n" /* get node id */
 		"   or    %[base], %[base], %[node]   \n"
+		"   dsrl  %[node], 30                 \n" /* 15:14 */
+		"   or    %[base], %[base], %[node]   \n"
 		"1: li    %[count], 0x100             \n" /* wait for init loop */
 		"2: bnez  %[count], 2b                \n" /* limit mailbox access */
 		"   addiu %[count], -1                \n"
@@ -595,7 +576,7 @@ static void loongson3a_r2r3_play_dead(int *state_addr)
 		: "a1");
 }
 
-static void loongson3b_play_dead(int *state_addr)
+static void loongson3_type3_play_dead(int *state_addr)
 {
 	register int val;
 	register long cpuid, core, node, count;
@@ -615,7 +596,27 @@ static void loongson3b_play_dead(int *state_addr)
 		"   cache 1, 3(%[addr])           \n"
 		"   addiu %[sets], %[sets], -1    \n"
 		"   bnez  %[sets], 1b             \n"
-		"   addiu %[addr], %[addr], 0x20  \n"
+		"   addiu %[addr], %[addr], 0x40  \n"
+		"   li %[addr], 0x80000000        \n" /* KSEG0 */
+		"2: cache 2, 0(%[addr])           \n" /* flush L1 VCache */
+		"   cache 2, 1(%[addr])           \n"
+		"   cache 2, 2(%[addr])           \n"
+		"   cache 2, 3(%[addr])           \n"
+		"   cache 2, 4(%[addr])           \n"
+		"   cache 2, 5(%[addr])           \n"
+		"   cache 2, 6(%[addr])           \n"
+		"   cache 2, 7(%[addr])           \n"
+		"   cache 2, 8(%[addr])           \n"
+		"   cache 2, 9(%[addr])           \n"
+		"   cache 2, 10(%[addr])          \n"
+		"   cache 2, 11(%[addr])          \n"
+		"   cache 2, 12(%[addr])          \n"
+		"   cache 2, 13(%[addr])          \n"
+		"   cache 2, 14(%[addr])          \n"
+		"   cache 2, 15(%[addr])          \n"
+		"   addiu %[vsets], %[vsets], -1  \n"
+		"   bnez  %[vsets], 2b            \n"
+		"   addiu %[addr], %[addr], 0x40  \n"
 		"   li    %[val], 0x7             \n" /* *state_addr = CPU_DEAD; */
 		"   sw    %[val], (%[state_addr]) \n"
 		"   sync                          \n"
@@ -623,7 +624,8 @@ static void loongson3b_play_dead(int *state_addr)
 		"   .set pop                      \n"
 		: [addr] "=&r" (addr), [val] "=&r" (val)
 		: [state_addr] "r" (state_addr),
-		  [sets] "r" (cpu_data[smp_processor_id()].dcache.sets));
+		  [sets] "r" (cpu_data[smp_processor_id()].dcache.sets),
+		  [vsets] "r" (cpu_data[smp_processor_id()].vcache.sets));
 
 	__asm__ __volatile__(
 		"   .set push                         \n"
@@ -638,8 +640,6 @@ static void loongson3b_play_dead(int *state_addr)
 		"   andi  %[node], %[cpuid], 0xc      \n"
 		"   dsll  %[node], 42                 \n" /* get node id */
 		"   or    %[base], %[base], %[node]   \n"
-		"   dsrl  %[node], 30                 \n" /* 15:14 */
-		"   or    %[base], %[base], %[node]   \n"
 		"1: li    %[count], 0x100             \n" /* wait for init loop */
 		"2: bnez  %[count], 2b                \n" /* limit mailbox access */
 		"   addiu %[count], -1                \n"
@@ -661,30 +661,42 @@ static void loongson3b_play_dead(int *state_addr)
 
 void play_dead(void)
 {
-	int *state_addr;
+	int prid_imp, prid_rev, *state_addr;
 	unsigned int cpu = smp_processor_id();
 	void (*play_dead_at_ckseg1)(int *);
 
 	idle_task_exit();
-	switch (read_c0_prid() & PRID_REV_MASK) {
+
+	prid_imp = read_c0_prid() & PRID_IMP_MASK;
+	prid_rev = read_c0_prid() & PRID_REV_MASK;
+
+	if (prid_imp == PRID_IMP_LOONGSON_64G) {
+		play_dead_at_ckseg1 =
+			(void *)CKSEG1ADDR((unsigned long)loongson3_type3_play_dead);
+		goto out;
+	}
+
+	switch (prid_rev) {
 	case PRID_REV_LOONGSON3A_R1:
 	default:
 		play_dead_at_ckseg1 =
-			(void *)CKSEG1ADDR((unsigned long)loongson3a_r1_play_dead);
+			(void *)CKSEG1ADDR((unsigned long)loongson3_type1_play_dead);
+		break;
+	case PRID_REV_LOONGSON3B_R1:
+	case PRID_REV_LOONGSON3B_R2:
+		play_dead_at_ckseg1 =
+			(void *)CKSEG1ADDR((unsigned long)loongson3_type2_play_dead);
 		break;
 	case PRID_REV_LOONGSON3A_R2_0:
 	case PRID_REV_LOONGSON3A_R2_1:
 	case PRID_REV_LOONGSON3A_R3_0:
 	case PRID_REV_LOONGSON3A_R3_1:
 		play_dead_at_ckseg1 =
-			(void *)CKSEG1ADDR((unsigned long)loongson3a_r2r3_play_dead);
-		break;
-	case PRID_REV_LOONGSON3B_R1:
-	case PRID_REV_LOONGSON3B_R2:
-		play_dead_at_ckseg1 =
-			(void *)CKSEG1ADDR((unsigned long)loongson3b_play_dead);
+			(void *)CKSEG1ADDR((unsigned long)loongson3_type3_play_dead);
 		break;
 	}
+
+out:
 	state_addr = &per_cpu(cpu_state, cpu);
 	mb();
 	play_dead_at_ckseg1(state_addr);
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 89b9c85..4bf9906 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1267,7 +1267,8 @@ static void probe_pcache(void)
 					  c->dcache.ways *
 					  c->dcache.linesz;
 		c->dcache.waybit = 0;
-		if ((prid & PRID_REV_MASK) >= PRID_REV_LOONGSON3A_R2_0)
+		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
+				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0))
 			c->options |= MIPS_CPU_PREFETCH;
 		break;
 
diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
index a7f184b..15ca8bf 100644
--- a/drivers/platform/mips/cpu_hwmon.c
+++ b/drivers/platform/mips/cpu_hwmon.c
@@ -9,6 +9,7 @@
 #include <loongson.h>
 #include <boot_param.h>
 #include <loongson_hwmon.h>
+#include <loongson_regs.h>
 
 /*
  * Loongson-3 series cpu has two sensors inside,
@@ -18,10 +19,17 @@
  */
 int loongson3_cpu_temp(int cpu)
 {
-	u32 reg, prid_rev;
+	u32 reg, prid_imp, prid_rev;
 
-	reg = LOONGSON_CHIPTEMP(cpu);
+	prid_imp = read_c0_prid() & PRID_IMP_MASK;
 	prid_rev = read_c0_prid() & PRID_REV_MASK;
+
+	if (prid_imp == PRID_IMP_LOONGSON_64G) {
+		reg = (csr_readl(LOONGSON_CSR_CPUTEMP) & 0xff);
+		goto out;
+	}
+
+	reg = LOONGSON_CHIPTEMP(cpu);
 	switch (prid_rev) {
 	case PRID_REV_LOONGSON3A_R1:
 		reg = (reg >> 8) & 0xff;
@@ -37,6 +45,8 @@ int loongson3_cpu_temp(int cpu)
 		reg = (reg & 0xffff)*731/0x4000 - 273;
 		break;
 	}
+
+out:
 	return (int)reg * 1000;
 }
 
-- 
2.7.0

