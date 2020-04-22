Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362451B4794
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 16:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgDVOoh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 10:44:37 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59380 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgDVOoh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Apr 2020 10:44:37 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 936652049C;
        Wed, 22 Apr 2020 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587566665; bh=2QrrPQMNXyaHZFXv5Ije5R/4LJpU1TcycXqfIH3U5dI=;
        h=From:To:Cc:Subject:Date:From;
        b=xK9s/gf9qngTX/oObXxMguv/y31vuDUuOiKBv/qGwnZiSZqDmzmVf7SZ15pJxnKgs
         dxwWbCS8AU4YmhhdP+JSXT5K5rrKVbjOOg6VjDmh5OTixxEUPOqI7S8HW51vflxL8Z
         KCoOq/7UaETZXfRtxQnEBpNjzOFbCmrHxaxMtgIkvXGt1zeTNiFGhSi6k6DU8fhDRH
         xWrOT5+OHesb1sPxgjpBpeTP8DtlZklliu47h2R8PYf/mhW7xs+8ulKvfeb9ygNtEI
         29uEwbeis5qQFjucXZIt0KxG8gdCaxluCKohxwDb+wrrvZjJOzVnV/mk6+HUsJlUTd
         Gg3tC3Jl9lTLA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Paul Cercueil <paul@crapouillou.net>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Kernel: Identify Loongson-2K processors
Date:   Wed, 22 Apr 2020 22:43:44 +0800
Message-Id: <20200422144349.1252775-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson-2K (Loongson64 Reduced) is a family of SoC shipped with
gs264e core.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/cpu.h  |  4 ++++
 arch/mips/kernel/cpu-probe.c | 19 ++++++++++++++++++-
 arch/mips/kernel/idle.c      |  3 ++-
 arch/mips/mm/c-r4k.c         | 12 +++++++++---
 4 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 216a22916740..46c190e78acf 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -250,6 +250,10 @@
 #define PRID_REV_LOONGSON1C		0x0020	/* Same as Loongson-1B */
 #define PRID_REV_LOONGSON2E		0x0002
 #define PRID_REV_LOONGSON2F		0x0003
+#define PRID_REV_LOONGSON2K_R1_0	0x0000
+#define PRID_REV_LOONGSON2K_R1_1	0x0001
+#define PRID_REV_LOONGSON2K_R1_2	0x0002
+#define PRID_REV_LOONGSON2K_R1_3	0x0003
 #define PRID_REV_LOONGSON3A_R1		0x0005
 #define PRID_REV_LOONGSON3B_R1		0x0006
 #define PRID_REV_LOONGSON3B_R2		0x0007
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index f21a2304401f..6de14b527c68 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1935,7 +1935,24 @@ static inline void cpu_probe_cavium(struct cpuinfo_mips *c, unsigned int cpu)
 static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 {
 	switch (c->processor_id & PRID_IMP_MASK) {
-	case PRID_IMP_LOONGSON_64C:  /* Loongson-2/3 */
+	case PRID_IMP_LOONGSON_64R: /* Loongson-64 Reduced */
+		switch (c->processor_id & PRID_REV_MASK) {
+		case PRID_REV_LOONGSON2K_R1_0:
+		case PRID_REV_LOONGSON2K_R1_1:
+		case PRID_REV_LOONGSON2K_R1_2:
+		case PRID_REV_LOONGSON2K_R1_3:
+			c->cputype = CPU_LOONGSON64;
+			__cpu_name[cpu] = "Loongson-2K";
+			set_elf_platform(cpu, "gs264e");
+			set_isa(c, MIPS_CPU_ISA_M64R2);
+			break;
+		}
+		decode_configs(c);
+		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_EXT |
+				MIPS_ASE_LOONGSON_EXT2);
+		break;
+	case PRID_IMP_LOONGSON_64C:  /* Loongson-3 Classic */
 		switch (c->processor_id & PRID_REV_MASK) {
 		case PRID_REV_LOONGSON3A_R2_0:
 		case PRID_REV_LOONGSON3A_R2_1:
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 37f8e78e2869..60d8c2a380fe 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -180,7 +180,8 @@ void __init check_wait(void)
 		break;
 	case CPU_LOONGSON64:
 		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
-				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0))
+				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0) ||
+				(c->processor_id & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R)
 			cpu_wait = r4k_wait;
 		break;
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 36a311348739..378ef5d46bec 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1303,7 +1303,8 @@ static void probe_pcache(void)
 					  c->dcache.linesz;
 		c->dcache.waybit = 0;
 		if ((c->processor_id & (PRID_IMP_MASK | PRID_REV_MASK)) >=
-				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0))
+				(PRID_IMP_LOONGSON_64C | PRID_REV_LOONGSON3A_R2_0) ||
+				(c->processor_id & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R)
 			c->options |= MIPS_CPU_PREFETCH;
 		break;
 
@@ -1629,8 +1630,13 @@ static void __init loongson3_sc_init(void)
 	scache_size = c->scache.sets *
 				  c->scache.ways *
 				  c->scache.linesz;
-	/* Loongson-3 has 4 cores, 1MB scache for each. scaches are shared */
-	scache_size *= 4;
+
+	/* Loongson-3 has 4-Scache banks, while Loongson-2K have only 2 banks */
+	if ((c->processor_id & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R)
+		scache_size *= 2;
+	else
+		scache_size *= 4;
+
 	c->scache.waybit = 0;
 	c->scache.waysize = scache_size / c->scache.ways;
 	pr_info("Unified secondary cache %ldkB %s, linesize %d bytes.\n",
-- 
2.26.0.rc2

