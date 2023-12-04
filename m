Return-Path: <linux-mips+bounces-493-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874E8031E1
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EBE11F20F75
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808DB22F1E;
	Mon,  4 Dec 2023 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSS1hvzZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614D722EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF64C433BD;
	Mon,  4 Dec 2023 11:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691062;
	bh=MEw5iEws7HKPgFQpUkltS5C9/vAjpe2nQRf3pDzn5fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uSS1hvzZm4i02EIQ9K2HWhu2UCDfmYoG+ufH7r0E6aq8OFQKHtwQDjwO+vuLM1fyz
	 WJXn08+guq9RVxGXT0ouuad51aJ5S3sj6Hrvrsf9F3Lmsg60uJa8X7n3ve3YwlUv50
	 NWu6LUjXOqah1bQddwz1DVikGtXxGzGSp1If1AYRyyB2riLMjEagHSlkH/WM2DIgDG
	 bh7vMQN/U1TZ3dJORH5i6RhHJA/yFDFIlyg7Kz5ofMQfULdgbnfHbOJT5wBZqd380T
	 hRMgmGZkEet9eL4M6AzILuHOW5SJnKjcgFCKRCHma6RTwuWpQ5ykn5SRlbu4bW3y1Q
	 vOGuXMbc/wJoA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 12/20] mips: move cache declarations into header
Date: Mon,  4 Dec 2023 12:57:02 +0100
Message-Id: <20231204115710.2247097-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Some of the cache functions are declared only for their callers, e.g.

arch/mips/mm/c-r3k.c:28:15: error: no previous prototype for 'r3k_cache_size' [-Werror=missing-prototypes]
arch/mips/mm/c-r3k.c:63:15: error: no previous prototype for 'r3k_cache_lsize' [-Werror=missing-prototypes]
arch/mips/mm/c-r4k.c:1703:6: error: no previous prototype for 'r4k_cache_init' [-Werror=missing-prototypes]
arch/mips/mm/sc-mips.c:255:5: error: no previous prototype for 'mips_sc_init' [-Werror=missing-prototypes]

Move all the declarations to asm/cache.h and asm/r4kcache.h where they
can be seen by the function definitions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/cache.h    | 6 ++++++
 arch/mips/include/asm/r4kcache.h | 4 ++++
 arch/mips/kernel/cpu-probe.c     | 1 -
 arch/mips/kernel/cpu-r3k-probe.c | 1 -
 arch/mips/mm/c-r4k.c             | 4 ----
 arch/mips/mm/cache.c             | 6 ------
 6 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/mips/include/asm/cache.h b/arch/mips/include/asm/cache.h
index 3424a7908c0f..8b08db3fb17a 100644
--- a/arch/mips/include/asm/cache.h
+++ b/arch/mips/include/asm/cache.h
@@ -17,5 +17,11 @@
 #define __read_mostly __section(".data..read_mostly")
 
 extern void cache_noop(void);
+extern void r3k_cache_init(void);
+extern unsigned long r3k_cache_size(unsigned long);
+extern unsigned long r3k_cache_lsize(unsigned long);
+extern void r4k_cache_init(void);
+extern void octeon_cache_init(void);
+extern void au1x00_fixup_config_od(void);
 
 #endif /* _ASM_CACHE_H */
diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index 431a1c9d53fc..da1cd1bbdbc5 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -24,6 +24,10 @@
 #include <asm/mmzone.h>
 #include <asm/unroll.h>
 
+extern void r5k_sc_init(void);
+extern void rm7k_sc_init(void);
+extern int mips_sc_init(void);
+
 extern void (*r4k_blast_dcache)(void);
 extern void (*r4k_blast_icache)(void);
 
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b406d8bfb15a..de7460c3a72e 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -179,7 +179,6 @@ void __init check_bugs32(void)
 static inline int cpu_has_confreg(void)
 {
 #ifdef CONFIG_CPU_R3000
-	extern unsigned long r3k_cache_size(unsigned long);
 	unsigned long size1, size2;
 	unsigned long cfg = read_c0_conf();
 
diff --git a/arch/mips/kernel/cpu-r3k-probe.c b/arch/mips/kernel/cpu-r3k-probe.c
index be93469c0e0e..0c826f729f75 100644
--- a/arch/mips/kernel/cpu-r3k-probe.c
+++ b/arch/mips/kernel/cpu-r3k-probe.c
@@ -42,7 +42,6 @@ void __init check_bugs32(void)
 static inline int cpu_has_confreg(void)
 {
 #ifdef CONFIG_CPU_R3000
-	extern unsigned long r3k_cache_size(unsigned long);
 	unsigned long size1, size2;
 	unsigned long cfg = read_c0_conf();
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 0619e5296ff3..b45bf026ee55 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1485,10 +1485,6 @@ static void loongson3_sc_init(void)
 	return;
 }
 
-extern int r5k_sc_init(void);
-extern int rm7k_sc_init(void);
-extern int mips_sc_init(void);
-
 static void setup_scache(void)
 {
 	struct cpuinfo_mips *c = &current_cpu_data;
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 7f830634dbe7..e5d19f4a38ba 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -206,19 +206,13 @@ static inline void setup_protection_map(void)
 void cpu_cache_init(void)
 {
 	if (cpu_has_3k_cache) {
-		extern void __weak r3k_cache_init(void);
-
 		r3k_cache_init();
 	}
 	if (cpu_has_4k_cache) {
-		extern void __weak r4k_cache_init(void);
-
 		r4k_cache_init();
 	}
 
 	if (cpu_has_octeon_cache) {
-		extern void __weak octeon_cache_init(void);
-
 		octeon_cache_init();
 	}
 
-- 
2.39.2


