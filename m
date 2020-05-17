Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A301D6E00
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 01:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgEQXYv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 19:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgEQXYv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 May 2020 19:24:51 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AE2C061A0C
        for <linux-mips@vger.kernel.org>; Sun, 17 May 2020 16:24:51 -0700 (PDT)
From:   Joshua Kinard <kumba@gentoo.org>
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v3 3/3] MIPS: SGI-IP30: Reorder the macros in war.h
Date:   Sun, 17 May 2020 19:24:39 -0400
Message-Id: <f711663ca44acbe6848fda185e34dcbbba1d5954.1589753297.git.kumba@gentoo.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <677e22b32c5beb082885ba41f3dd1006660ee69f.1589753297.git.kumba@gentoo.org>
References: <677e22b32c5beb082885ba41f3dd1006660ee69f.1589753297.git.kumba@gentoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Joshua Kinard <kumba@gentoo.org>

Fix the ordering of the macros in arch/mips/mach-ip30/war.h to match
those in arch/mips/mach-ip27/war.h.

Signed-off-by: Joshua Kinard <kumba@gentoo.org>
---
 arch/mips/include/asm/mach-ip30/war.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip30/war.h b/arch/mips/include/asm/mach-ip30/war.h
index ad3352d3d203..a1fa0c1f5300 100644
--- a/arch/mips/include/asm/mach-ip30/war.h
+++ b/arch/mips/include/asm/mach-ip30/war.h
@@ -8,18 +8,17 @@
 #define R4600_V1_INDEX_ICACHEOP_WAR	0
 #define R4600_V1_HIT_CACHEOP_WAR	0
 #define R4600_V2_HIT_CACHEOP_WAR	0
-#define MIPS_CACHE_SYNC_WAR		0
 #define BCM1250_M3_WAR			0
 #define SIBYTE_1956_WAR			0
 #define MIPS4K_ICACHE_REFILL_WAR	0
-#define MIPS34K_MISSED_ITLB_WAR		0
+#define MIPS_CACHE_SYNC_WAR		0
 #define TX49XX_ICACHE_INDEX_INV_WAR	0
 #define ICACHE_REFILLS_WORKAROUND_WAR	0
-
 #ifdef CONFIG_CPU_R10000
 #define R10000_LLSC_WAR			1
 #else
 #define R10000_LLSC_WAR			0
 #endif
+#define MIPS34K_MISSED_ITLB_WAR		0
 
 #endif /* __ASM_MIPS_MACH_IP30_WAR_H */
-- 
2.26.2

