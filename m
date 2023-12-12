Return-Path: <linux-mips+bounces-695-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1E080F2FC
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 17:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1233B20C91
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 16:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406AE7A226;
	Tue, 12 Dec 2023 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j8SL/s+J"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C6DA8;
	Tue, 12 Dec 2023 08:35:33 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D15CC000E;
	Tue, 12 Dec 2023 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702398932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktTTyr0RlfRgBEvWUnjy95sG7EHyWXVrxSqbNjLTqqU=;
	b=j8SL/s+JKqdFRUq4rxjHbv1Z8aQfOG3Fdr9Qg4doJZaumc4gPtzMh1tBVHQbn00yFNV2i7
	GR3B6rX16ranQs/MUIYpA1L4oT29ig96JQdIPyA5Jx8wwyYZNtMAWXAPERuGvUtPa+bWcp
	FjyamVci/1mfHZCxT7MKIKMK0CDzhdk9S6MO6QBGOvyYhe6c2j1wF4d1/EA7MVfWCAffcq
	B1fo0OTuTSaj+Fy0EdDlx5lppR/4q18dvBGWrNd3ogpopioHf4jBEX8W/cfjEuTeKuLSvN
	MQ7VcP0o9dwkgBRcuD8TUTDSfB60oHRAjSj2AU7fnBsJXyxPv9DreBjcAio+RA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 10/22] MIPS: Avoid unnecessary reservation of exception space
Date: Tue, 12 Dec 2023 17:34:42 +0100
Message-ID: <20231212163459.1923041-11-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231212163459.1923041-1-gregory.clement@bootlin.com>
References: <20231212163459.1923041-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Nowadays we allocate exception base from memblock for r2_r6,
so we don't need to reverse exception space at the start of
the memory for r2_r6 processors.

For older processors the reservation is moved to traps_init
where we have knowledge of exact size we need. We also add
a sanity check to detect possible overlap with kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/traps.h    |  1 -
 arch/mips/kernel/cpu-probe.c     |  5 -----
 arch/mips/kernel/cpu-r3k-probe.c |  2 --
 arch/mips/kernel/traps.c         | 12 +++++++-----
 4 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index 15cde638b4070..d3dddd1c083a9 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -24,7 +24,6 @@ extern void (*board_ebase_setup)(void);
 extern void (*board_cache_error_setup)(void);
 
 extern int register_nmi_notifier(struct notifier_block *nb);
-extern void reserve_exception_space(phys_addr_t addr, unsigned long size);
 extern char except_vec_nmi[];
 
 #define VECTORSPACING 0x100	/* for EI/VI mode */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b406d8bfb15a3..54e8b0fd4a2ab 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1570,7 +1570,6 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_BMIPS3300;
 		__cpu_name[cpu] = "Broadcom BMIPS3300";
 		set_elf_platform(cpu, "bmips3300");
-		reserve_exception_space(0x400, VECTORSPACING * 64);
 		break;
 	case PRID_IMP_BMIPS43XX: {
 		int rev = c->processor_id & PRID_REV_MASK;
@@ -1581,7 +1580,6 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS4380";
 			set_elf_platform(cpu, "bmips4380");
 			c->options |= MIPS_CPU_RIXI;
-			reserve_exception_space(0x400, VECTORSPACING * 64);
 		} else {
 			c->cputype = CPU_BMIPS4350;
 			__cpu_name[cpu] = "Broadcom BMIPS4350";
@@ -1598,7 +1596,6 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS5000";
 		set_elf_platform(cpu, "bmips5000");
 		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
-		reserve_exception_space(0x1000, VECTORSPACING * 64);
 		break;
 	}
 }
@@ -1996,8 +1993,6 @@ void cpu_probe(void)
 	if (cpu == 0)
 		__ua_limit = ~((1ull << cpu_vmbits) - 1);
 #endif
-
-	reserve_exception_space(0, 0x1000);
 }
 
 void cpu_report(void)
diff --git a/arch/mips/kernel/cpu-r3k-probe.c b/arch/mips/kernel/cpu-r3k-probe.c
index be93469c0e0ec..05410b743e571 100644
--- a/arch/mips/kernel/cpu-r3k-probe.c
+++ b/arch/mips/kernel/cpu-r3k-probe.c
@@ -137,8 +137,6 @@ void cpu_probe(void)
 		cpu_set_fpu_opts(c);
 	else
 		cpu_set_nofpu_opts(c);
-
-	reserve_exception_space(0, 0x400);
 }
 
 void cpu_report(void)
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 7e6e6df59e6d7..a6d0ae12b3c4c 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2007,10 +2007,6 @@ unsigned long exception_handlers[32];
 static unsigned long vi_vecbase;
 unsigned long vi_handlers[64];
 
-void reserve_exception_space(phys_addr_t addr, unsigned long size)
-{
-	memblock_reserve(addr, size);
-}
 
 void __init *set_except_vector(int n, void *addr)
 {
@@ -2394,7 +2390,13 @@ void __init trap_init(void)
 	}
 
 	if (!cpu_has_mips_r2_r6) {
-		ebase = CAC_BASE;
+		ebase_pa = 0x0;
+		ebase = CKSEG0ADDR(ebase_pa);
+
+		if (__pa_symbol(_stext) < (ebase_pa + vec_size))
+			pr_err("Insufficient space for exception vectors\n");
+
+		memblock_reserve(ebase_pa, vec_size);
 	} else {
 		vec_size = max(vec_size, PAGE_SIZE);
 		ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
-- 
2.42.0


