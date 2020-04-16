Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C0D1AC7EA
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 17:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502031AbgDPPBE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 11:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728735AbgDPPAV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 11:00:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7ACC061A0C;
        Thu, 16 Apr 2020 08:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=bgRf1Uon3bhynYCtMF0JFozpZiDwfnV+XNl7ui4zcKc=; b=PnGlSsf/3h+gLhETAXIz83xh76
        92LP1eK3+R69IgSvsgyecXfyvI0R8cqeBSpTIZP9vngHmdRegLqNnlHxvnQKIVrc0uLo7Rs1h27wa
        HRxyTLQsnSCflWBPDiT2w7GMtRZoLdqmXaerpYdcG9svv3DisiZs38sGSTeEZELPpIujCwnnBm6EM
        jennkZsaeaRY9BikT3ZIiQN2aq7/zWcV+hsc8VEdH/AX8UwEvl7Iq/FxgZCJC2C+/Y299DruBeNmU
        2QLryLwonZZw3+4YtE8MUaYnxC1VlPxcrfIPt3xlmj5xiCizxjVqc9K8toPk5vKUHDwu0t5n2BeIH
        2qwuGjDg==;
Received: from [2001:4bb8:184:4aa1:c70:4a89:bc61:2] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jP602-000228-Mg; Thu, 16 Apr 2020 15:00:19 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 2/7] MIPS: remove cpu_has_64bit_addresses
Date:   Thu, 16 Apr 2020 17:00:06 +0200
Message-Id: <20200416150011.820984-3-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200416150011.820984-1-hch@lst.de>
References: <20200416150011.820984-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This macro is identical to CONFIG_64BIT, and using a Kconfig variable
for the only places that checks them (the ioremap implementation) will
simplify later patches in this series.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/cpu-features.h                        | 6 ------
 arch/mips/include/asm/io.h                                  | 4 ++--
 arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h    | 1 -
 arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h    | 1 -
 .../include/asm/mach-lantiq/falcon/cpu-feature-overrides.h  | 1 -
 .../include/asm/mach-ralink/mt7620/cpu-feature-overrides.h  | 1 -
 .../include/asm/mach-ralink/mt7621/cpu-feature-overrides.h  | 1 -
 .../include/asm/mach-ralink/rt288x/cpu-feature-overrides.h  | 1 -
 .../include/asm/mach-ralink/rt305x/cpu-feature-overrides.h  | 1 -
 .../include/asm/mach-ralink/rt3883/cpu-feature-overrides.h  | 1 -
 arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h  | 1 -
 11 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index de44c92b1c1f..400b123cb6da 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -435,9 +435,6 @@
 # ifndef cpu_has_64bit_gp_regs
 # define cpu_has_64bit_gp_regs		0
 # endif
-# ifndef cpu_has_64bit_addresses
-# define cpu_has_64bit_addresses	0
-# endif
 # ifndef cpu_vmbits
 # define cpu_vmbits 31
 # endif
@@ -456,9 +453,6 @@
 # ifndef cpu_has_64bit_gp_regs
 # define cpu_has_64bit_gp_regs		1
 # endif
-# ifndef cpu_has_64bit_addresses
-# define cpu_has_64bit_addresses	1
-# endif
 # ifndef cpu_vmbits
 # define cpu_vmbits cpu_data[0].vmbits
 # define __NEED_VMBITS_PROBE
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index cf1f2a4a2418..7be323ed2bfd 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -166,7 +166,7 @@ static inline void __iomem * __ioremap_mode(phys_addr_t offset, unsigned long si
 
 #define __IS_LOW512(addr) (!((phys_addr_t)(addr) & (phys_addr_t) ~0x1fffffffULL))
 
-	if (cpu_has_64bit_addresses) {
+	if (IS_ENABLED(CONFIG_64BIT)) {
 		u64 base = UNCAC_BASE;
 
 		/*
@@ -275,7 +275,7 @@ static inline void iounmap(const volatile void __iomem *addr)
 
 #define __IS_KSEG1(addr) (((unsigned long)(addr) & ~0x1fffffffUL) == CKSEG1)
 
-	if (cpu_has_64bit_addresses ||
+	if (IS_ENABLED(CONFIG_64BIT) ||
 	    (__builtin_constant_p(addr) && __IS_KSEG1(addr)))
 		return;
 
diff --git a/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
index 95a0b580909d..a54f20d956a2 100644
--- a/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ath25/cpu-feature-overrides.h
@@ -56,6 +56,5 @@
 #define cpu_has_64bits			0
 #define cpu_has_64bit_zero_reg		0
 #define cpu_has_64bit_gp_regs		0
-#define cpu_has_64bit_addresses		0
 
 #endif /* __ASM_MACH_ATH25_CPU_FEATURE_OVERRIDES_H */
diff --git a/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h
index e7c972fccd9f..79ab3ad9fee8 100644
--- a/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h
@@ -45,7 +45,6 @@
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
 #define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses 0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h b/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h
index f03c1c42dd90..10226976f7b7 100644
--- a/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-lantiq/falcon/cpu-feature-overrides.h
@@ -46,7 +46,6 @@
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
 #define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h
index 6ea5908f0c11..c4579f1705c2 100644
--- a/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/mt7620/cpu-feature-overrides.h
@@ -45,7 +45,6 @@
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
 #define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h
index e06f517b2588..168359a0a58d 100644
--- a/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h
@@ -46,7 +46,6 @@
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
 #define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h
index 9c069646d0bd..fdaf8c9182bc 100644
--- a/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/rt288x/cpu-feature-overrides.h
@@ -44,7 +44,6 @@
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
 #define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	16
 #define cpu_icache_line_size()	16
diff --git a/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h
index 2e423fd15384..7a385fe784a6 100644
--- a/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/rt305x/cpu-feature-overrides.h
@@ -44,7 +44,6 @@
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
 #define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h
index 7cee0e232580..0a61910f6521 100644
--- a/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ralink/rt3883/cpu-feature-overrides.h
@@ -43,7 +43,6 @@
 #define cpu_has_64bits		0
 #define cpu_has_64bit_zero_reg	0
 #define cpu_has_64bit_gp_regs	0
-#define cpu_has_64bit_addresses	0
 
 #define cpu_dcache_line_size()	32
 #define cpu_icache_line_size()	32
diff --git a/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h b/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h
index bc46179fdf40..8539ccfb69b7 100644
--- a/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-rc32434/cpu-feature-overrides.h
@@ -54,7 +54,6 @@
 #define cpu_has_64bits			0
 #define cpu_has_64bit_zero_reg		0
 #define cpu_has_64bit_gp_regs		0
-#define cpu_has_64bit_addresses		0
 
 #define cpu_has_inclusive_pcaches	0
 
-- 
2.25.1

