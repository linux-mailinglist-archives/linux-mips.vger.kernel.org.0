Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1D025029C
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 18:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgHXQeP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 12:34:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:50716 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728123AbgHXQdb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 12:33:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BB1F9AF8A;
        Mon, 24 Aug 2020 16:33:59 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] MIPS: Get rid of CAVIUM_OCTEON_DCACHE_PREFETCH_WAR
Date:   Mon, 24 Aug 2020 18:32:53 +0200
Message-Id: <20200824163257.44533-12-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200824163257.44533-1-tsbogend@alpha.franken.de>
References: <20200824163257.44533-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CAVIUM_OCTEON_DCACHE_PREFETCH_WAR is a check for Octeon model CN6XXXX.
By using the version check we can remove the define.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/cavium-octeon/setup.c                | 2 +-
 arch/mips/include/asm/mach-cavium-octeon/war.h | 3 ---
 arch/mips/mm/uasm.c                            | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 4f34d92b52f9..8a357cb068c2 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1126,7 +1126,7 @@ EXPORT_SYMBOL(prom_putchar);
 
 void __init prom_free_prom_memory(void)
 {
-	if (CAVIUM_OCTEON_DCACHE_PREFETCH_WAR) {
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
 		/* Check for presence of Core-14449 fix.  */
 		u32 insn;
 		u32 *foo;
diff --git a/arch/mips/include/asm/mach-cavium-octeon/war.h b/arch/mips/include/asm/mach-cavium-octeon/war.h
index 616de70e697c..ba6df0a186e9 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/war.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/war.h
@@ -9,7 +9,4 @@
 #ifndef __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 #define __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H
 
-#define CAVIUM_OCTEON_DCACHE_PREFETCH_WAR	\
-	OCTEON_IS_MODEL(OCTEON_CN6XXX)
-
 #endif /* __ASM_MIPS_MACH_CAVIUM_OCTEON_WAR_H */
diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
index c56f129c9a4b..81dd226d6b6b 100644
--- a/arch/mips/mm/uasm.c
+++ b/arch/mips/mm/uasm.c
@@ -394,7 +394,7 @@ I_u2u1u3(_lddir)
 void uasm_i_pref(u32 **buf, unsigned int a, signed int b,
 			    unsigned int c)
 {
-	if (CAVIUM_OCTEON_DCACHE_PREFETCH_WAR && a <= 24 && a != 5)
+	if (OCTEON_IS_MODEL(OCTEON_CN6XXX) && a <= 24 && a != 5)
 		/*
 		 * As per erratum Core-14449, replace prefetches 0-4,
 		 * 6-24 with 'pref 28'.
-- 
2.16.4

