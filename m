Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6181730A5
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 06:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgB1Fwo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 00:52:44 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42861 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgB1Fwn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 00:52:43 -0500
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1j7YZk-0000f2-S8; Fri, 28 Feb 2020 06:52:40 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1j7YZj-0002uh-Vf; Fri, 28 Feb 2020 06:52:39 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v1] MIPS: reduce print level for cache information
Date:   Fri, 28 Feb 2020 06:52:38 +0100
Message-Id: <20200228055238.11140-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Default printk log level is KERN_WARNING. This makes automatic log
parsing problematic, since we get false positive alarms on not critical
information.

Set all not critical cache related information to KERN_INFO, the same level
as used on most kernel drivers.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/mips/mm/c-octeon.c | 18 +++++++++---------
 arch/mips/mm/c-r3k.c    |  4 ++--
 arch/mips/mm/c-r4k.c    | 20 ++++++++++----------
 arch/mips/mm/c-tx39.c   |  4 ++--
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index 8064821e9805..4baf965e6fe8 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -237,17 +237,17 @@ static void probe_octeon(void)
 	c->dcache.sets = dcache_size / (c->dcache.linesz * c->dcache.ways);
 
 	if (smp_processor_id() == 0) {
-		pr_notice("Primary instruction cache %ldkB, %s, %d way, "
-			  "%d sets, linesize %d bytes.\n",
-			  icache_size >> 10,
-			  cpu_has_vtag_icache ?
+		pr_info("Primary instruction cache %ldkB, %s, %d way, "
+			"%d sets, linesize %d bytes.\n",
+			icache_size >> 10,
+			cpu_has_vtag_icache ?
 				"virtually tagged" : "physically tagged",
-			  c->icache.ways, c->icache.sets, c->icache.linesz);
+			c->icache.ways, c->icache.sets, c->icache.linesz);
 
-		pr_notice("Primary data cache %ldkB, %d-way, %d sets, "
-			  "linesize %d bytes.\n",
-			  dcache_size >> 10, c->dcache.ways,
-			  c->dcache.sets, c->dcache.linesz);
+		pr_info("Primary data cache %ldkB, %d-way, %d sets, "
+			"linesize %d bytes.\n",
+			dcache_size >> 10, c->dcache.ways,
+			c->dcache.sets, c->dcache.linesz);
 	}
 }
 
diff --git a/arch/mips/mm/c-r3k.c b/arch/mips/mm/c-r3k.c
index 15bb8cf59828..780dd2a567c1 100644
--- a/arch/mips/mm/c-r3k.c
+++ b/arch/mips/mm/c-r3k.c
@@ -316,9 +316,9 @@ void r3k_cache_init(void)
 	_dma_cache_wback = r3k_dma_cache_wback_inv;
 	_dma_cache_inv = r3k_dma_cache_wback_inv;
 
-	printk("Primary instruction cache %ldkB, linesize %ld bytes.\n",
+	pr_info("Primary instruction cache %ldkB, linesize %ld bytes.\n",
 		icache_size >> 10, icache_lsize);
-	printk("Primary data cache %ldkB, linesize %ld bytes.\n",
+	pr_info("Primary data cache %ldkB, linesize %ld bytes.\n",
 		dcache_size >> 10, dcache_lsize);
 
 	build_clear_page();
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5f3d0103b95d..3472f6deaf92 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1467,17 +1467,17 @@ static void probe_pcache(void)
 		c->icache.ways = 1;
 	}
 
-	printk("Primary instruction cache %ldkB, %s, %s, linesize %d bytes.\n",
-	       icache_size >> 10,
-	       c->icache.flags & MIPS_CACHE_VTAG ? "VIVT" : "VIPT",
-	       way_string[c->icache.ways], c->icache.linesz);
-
-	printk("Primary data cache %ldkB, %s, %s, %s, linesize %d bytes\n",
-	       dcache_size >> 10, way_string[c->dcache.ways],
-	       (c->dcache.flags & MIPS_CACHE_PINDEX) ? "PIPT" : "VIPT",
-	       (c->dcache.flags & MIPS_CACHE_ALIASES) ?
+	pr_info("Primary instruction cache %ldkB, %s, %s, linesize %d bytes.\n",
+		icache_size >> 10,
+		c->icache.flags & MIPS_CACHE_VTAG ? "VIVT" : "VIPT",
+		way_string[c->icache.ways], c->icache.linesz);
+
+	pr_info("Primary data cache %ldkB, %s, %s, %s, linesize %d bytes\n",
+		dcache_size >> 10, way_string[c->dcache.ways],
+		(c->dcache.flags & MIPS_CACHE_PINDEX) ? "PIPT" : "VIPT",
+		(c->dcache.flags & MIPS_CACHE_ALIASES) ?
 			"cache aliases" : "no aliases",
-	       c->dcache.linesz);
+		c->dcache.linesz);
 }
 
 static void probe_vcache(void)
diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c
index 686867270627..2d479cc7e66b 100644
--- a/arch/mips/mm/c-tx39.c
+++ b/arch/mips/mm/c-tx39.c
@@ -410,9 +410,9 @@ void tx39_cache_init(void)
 	current_cpu_data.icache.waybit = 0;
 	current_cpu_data.dcache.waybit = 0;
 
-	printk("Primary instruction cache %ldkB, linesize %d bytes\n",
+	pr_info("Primary instruction cache %ldkB, linesize %d bytes\n",
 		icache_size >> 10, current_cpu_data.icache.linesz);
-	printk("Primary data cache %ldkB, linesize %d bytes\n",
+	pr_info("Primary data cache %ldkB, linesize %d bytes\n",
 		dcache_size >> 10, current_cpu_data.dcache.linesz);
 
 	build_clear_page();
-- 
2.25.0

