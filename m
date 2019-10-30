Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBE4E9A89
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2019 11:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbfJ3K61 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Oct 2019 06:58:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:38294 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726150AbfJ3K61 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Oct 2019 06:58:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 55919AD12;
        Wed, 30 Oct 2019 10:58:25 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SGI-IP27: fix exception handler replication
Date:   Wed, 30 Oct 2019 11:58:19 +0100
Message-Id: <20191030105819.11266-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit b3ffcd0d800c ("mips/sgi-ip35: Initial rough-in of minimal platform
definition.") removed generating tlb refill handlers for every CPU, which
was needed for generating per node exception handlers on IP27. Instead
of resurrecting (and fixing) refill handler generation, we simply copy
all exception vectors from the boot node to the other nodes. Also
remove the config option since the memory tradeoff for exception handler
replication is just 8k per node.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip27/Kconfig       |  7 -------
 arch/mips/sgi-ip27/ip27-init.c   | 23 +++++++----------------
 arch/mips/sgi-ip27/ip27-memory.c |  4 ----
 3 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/arch/mips/sgi-ip27/Kconfig b/arch/mips/sgi-ip27/Kconfig
index ef3847e7aee0..e5b6cadbec85 100644
--- a/arch/mips/sgi-ip27/Kconfig
+++ b/arch/mips/sgi-ip27/Kconfig
@@ -38,10 +38,3 @@ config REPLICATE_KTEXT
 	  Say Y here to enable replicating the kernel text across multiple
 	  nodes in a NUMA cluster.  This trades memory for speed.
 
-config REPLICATE_EXHANDLERS
-	bool "Exception handler replication support"
-	depends on SGI_IP27
-	help
-	  Say Y here to enable replicating the kernel exception handlers
-	  across multiple nodes in a NUMA cluster. This trades memory for
-	  speed.
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 8fd3505e2b9c..7a269a088be9 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -64,23 +64,14 @@ static void per_hub_init(nasid_t nasid)
 
 	hub_rtc_init(nasid);
 
-#ifdef CONFIG_REPLICATE_EXHANDLERS
-	/*
-	 * If this is not a headless node initialization,
-	 * copy over the caliased exception handlers.
-	 */
-	if (get_nasid() == nasid) {
-		extern char except_vec2_generic, except_vec3_generic;
-		extern void build_tlb_refill_handler(void);
-
-		memcpy((void *)(CKSEG0 + 0x100), &except_vec2_generic, 0x80);
-		memcpy((void *)(CKSEG0 + 0x180), &except_vec3_generic, 0x80);
-		build_tlb_refill_handler();
-		memcpy((void *)(CKSEG0 + 0x100), (void *) CKSEG0, 0x80);
-		memcpy((void *)(CKSEG0 + 0x180), &except_vec3_generic, 0x100);
-		__flush_cache_all();
+	if (nasid) {
+		/* copy exception handlers from first node to current node */
+		memcpy((void *)NODE_OFFSET_TO_K0(nasid, 0),
+		       (void *)CKSEG0, 0x200);
+		/* switch to node local exception handlers */
+		REMOTE_HUB_S(nasid, PI_CALIAS_SIZE, PI_CALIAS_SIZE_8K);
+		local_flush_icache_range(CKSEG0, CKSEG0 + 0x200);
 	}
-#endif
 }
 
 void per_cpu_init(void)
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index f610fff592a6..563aad5e6398 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -311,11 +311,7 @@ static void __init mlreset(void)
 		 * thinks it is a node 0 address.
 		 */
 		REMOTE_HUB_S(nasid, PI_REGION_PRESENT, (region_mask | 1));
-#ifdef CONFIG_REPLICATE_EXHANDLERS
-		REMOTE_HUB_S(nasid, PI_CALIAS_SIZE, PI_CALIAS_SIZE_8K);
-#else
 		REMOTE_HUB_S(nasid, PI_CALIAS_SIZE, PI_CALIAS_SIZE_0);
-#endif
 
 #ifdef LATER
 		/*
-- 
2.16.4

