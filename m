Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34584591B6
	for <lists+linux-mips@lfdr.de>; Mon, 22 Nov 2021 16:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240080AbhKVP5O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Nov 2021 10:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240059AbhKVP5L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Nov 2021 10:57:11 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D8CC061714
        for <linux-mips@vger.kernel.org>; Mon, 22 Nov 2021 07:54:04 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
        by baptiste.telenet-ops.be with bizsmtp
        id MTu22600J4yPVd601Tu2ug; Mon, 22 Nov 2021 16:54:02 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mpBdq-00EL1u-HG; Mon, 22 Nov 2021 16:54:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mpBdp-00HGmE-Te; Mon, 22 Nov 2021 16:54:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MIPS: CPS: Use bitfield helpers
Date:   Mon, 22 Nov 2021 16:53:58 +0100
Message-Id: <8bd8b1b9a3787e594285addcf2057754540d0a5f.1637593297.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
References: <a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the FIELD_GET() helper, instead of open-coding the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

See "[PATCH 00/17] Non-const bitfield helper conversions"
(https://lore.kernel.org/r/cover.1637592133.git.geert+renesas@glider.be)
for background and more conversions.
---
 arch/mips/include/asm/mips-cps.h | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
index fd43d876892ec4c6..c077e8d100f584f9 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -7,6 +7,7 @@
 #ifndef __MIPS_ASM_MIPS_CPS_H__
 #define __MIPS_ASM_MIPS_CPS_H__
 
+#include <linux/bitfield.h>
 #include <linux/io.h>
 #include <linux/types.h>
 
@@ -112,14 +113,10 @@ static inline void clear_##unit##_##name(uint##sz##_t val)		\
  */
 static inline unsigned int mips_cps_numclusters(void)
 {
-	unsigned int num_clusters;
-
 	if (mips_cm_revision() < CM_REV_CM3_5)
 		return 1;
 
-	num_clusters = read_gcr_config() & CM_GCR_CONFIG_NUM_CLUSTERS;
-	num_clusters >>= __ffs(CM_GCR_CONFIG_NUM_CLUSTERS);
-	return num_clusters;
+	return FIELD_GET(CM_GCR_CONFIG_NUM_CLUSTERS, read_gcr_config());
 }
 
 /**
@@ -169,7 +166,8 @@ static inline unsigned int mips_cps_numcores(unsigned int cluster)
 		return 0;
 
 	/* Add one before masking to handle 0xff indicating no cores */
-	return (mips_cps_cluster_config(cluster) + 1) & CM_GCR_CONFIG_PCORES;
+	return FIELD_GET(CM_GCR_CONFIG_PCORES,
+			 mips_cps_cluster_config(cluster) + 1);
 }
 
 /**
@@ -181,14 +179,11 @@ static inline unsigned int mips_cps_numcores(unsigned int cluster)
  */
 static inline unsigned int mips_cps_numiocu(unsigned int cluster)
 {
-	unsigned int num_iocu;
-
 	if (!mips_cm_present())
 		return 0;
 
-	num_iocu = mips_cps_cluster_config(cluster) & CM_GCR_CONFIG_NUMIOCU;
-	num_iocu >>= __ffs(CM_GCR_CONFIG_NUMIOCU);
-	return num_iocu;
+	return FIELD_GET(CM_GCR_CONFIG_NUMIOCU,
+			 mips_cps_cluster_config(cluster));
 }
 
 /**
@@ -230,7 +225,7 @@ static inline unsigned int mips_cps_numvps(unsigned int cluster, unsigned int co
 
 	mips_cm_unlock_other();
 
-	return (cfg + 1) & CM_GCR_Cx_CONFIG_PVPE;
+	return FIELD_GET(CM_GCR_Cx_CONFIG_PVPE, cfg + 1);
 }
 
 #endif /* __MIPS_ASM_MIPS_CPS_H__ */
-- 
2.25.1

