Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B41543FB21
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 12:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhJ2LCG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 07:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbhJ2LCF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 07:02:05 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29AFC061745
        for <linux-mips@vger.kernel.org>; Fri, 29 Oct 2021 03:59:36 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:20b9:ea2a:8e1c:8da1])
        by baptiste.telenet-ops.be with bizsmtp
        id BmzY2600c01kgUz01mzYHe; Fri, 29 Oct 2021 12:59:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mgPbg-008ir7-JA; Fri, 29 Oct 2021 12:59:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mgOeP-00FCmn-90; Fri, 29 Oct 2021 11:58:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Markos Chandras <markos.chandras@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mips: cm: Convert to bitfield API to fix out-of-bounds access
Date:   Fri, 29 Oct 2021 11:58:16 +0200
Message-Id: <0471c545117c5fa05bd9c73005cda9b74608a61e.1635501373.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

mips_cm_error_report() extracts the cause and other cause from the error
register using shifts.  This works fine for the former, as it is stored
in the top bits, and the shift will thus remove all non-related bits.
However, the latter is stored in the bottom bits, hence thus needs masking
to get rid of non-related bits.  Without such masking, using it as an
index into the cm2_causes[] array will lead to an out-of-bounds access,
probably causing a crash.

Fix this by using FIELD_GET() instead.  Bite the bullet and convert all
MIPS CM handling to the bitfield API, to improve readability and safety.

Fixes: 3885c2b463f6a236 ("MIPS: CM: Add support for reporting CM cache errors")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only, but assembler output before/after compared.
---
 arch/mips/include/asm/mips-cm.h | 12 ++++++------
 arch/mips/kernel/mips-cm.c      | 21 ++++++++++-----------
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index aeae2effa123d7e2..23c67c0871b17c91 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -11,6 +11,7 @@
 #ifndef __MIPS_ASM_MIPS_CM_H__
 #define __MIPS_ASM_MIPS_CM_H__
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/errno.h>
 
@@ -153,8 +154,8 @@ GCR_ACCESSOR_RO(32, 0x030, rev)
 #define CM_GCR_REV_MINOR			GENMASK(7, 0)
 
 #define CM_ENCODE_REV(major, minor) \
-		(((major) << __ffs(CM_GCR_REV_MAJOR)) | \
-		 ((minor) << __ffs(CM_GCR_REV_MINOR)))
+		(FIELD_PREP(CM_GCR_REV_MAJOR, major) | \
+		 FIELD_PREP(CM_GCR_REV_MINOR, minor))
 
 #define CM_REV_CM2				CM_ENCODE_REV(6, 0)
 #define CM_REV_CM2_5				CM_ENCODE_REV(7, 0)
@@ -362,10 +363,10 @@ static inline int mips_cm_revision(void)
 static inline unsigned int mips_cm_max_vp_width(void)
 {
 	extern int smp_num_siblings;
-	uint32_t cfg;
 
 	if (mips_cm_revision() >= CM_REV_CM3)
-		return read_gcr_sys_config2() & CM_GCR_SYS_CONFIG2_MAXVPW;
+		return FIELD_GET(CM_GCR_SYS_CONFIG2_MAXVPW,
+				 read_gcr_sys_config2());
 
 	if (mips_cm_present()) {
 		/*
@@ -373,8 +374,7 @@ static inline unsigned int mips_cm_max_vp_width(void)
 		 * number of VP(E)s, and if that ever changes then this will
 		 * need revisiting.
 		 */
-		cfg = read_gcr_cl_config() & CM_GCR_Cx_CONFIG_PVPE;
-		return (cfg >> __ffs(CM_GCR_Cx_CONFIG_PVPE)) + 1;
+		return FIELD_GET(CM_GCR_Cx_CONFIG_PVPE, read_gcr_cl_config()) + 1;
 	}
 
 	if (IS_ENABLED(CONFIG_SMP))
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 90f1c3df1f0e495e..b4f7d950c84680d3 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -221,8 +221,7 @@ static void mips_cm_probe_l2sync(void)
 	phys_addr_t addr;
 
 	/* L2-only sync was introduced with CM major revision 6 */
-	major_rev = (read_gcr_rev() & CM_GCR_REV_MAJOR) >>
-		__ffs(CM_GCR_REV_MAJOR);
+	major_rev = FIELD_GET(CM_GCR_REV_MAJOR, read_gcr_rev());
 	if (major_rev < 6)
 		return;
 
@@ -306,13 +305,13 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 	preempt_disable();
 
 	if (cm_rev >= CM_REV_CM3) {
-		val = core << __ffs(CM3_GCR_Cx_OTHER_CORE);
-		val |= vp << __ffs(CM3_GCR_Cx_OTHER_VP);
+		val = FIELD_PREP(CM3_GCR_Cx_OTHER_CORE, core) |
+		      FIELD_PREP(CM3_GCR_Cx_OTHER_VP, vp);
 
 		if (cm_rev >= CM_REV_CM3_5) {
 			val |= CM_GCR_Cx_OTHER_CLUSTER_EN;
-			val |= cluster << __ffs(CM_GCR_Cx_OTHER_CLUSTER);
-			val |= block << __ffs(CM_GCR_Cx_OTHER_BLOCK);
+			val |= FIELD_PREP(CM_GCR_Cx_OTHER_CLUSTER, cluster);
+			val |= FIELD_PREP(CM_GCR_Cx_OTHER_BLOCK, block);
 		} else {
 			WARN_ON(cluster != 0);
 			WARN_ON(block != CM_GCR_Cx_OTHER_BLOCK_LOCAL);
@@ -342,7 +341,7 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 		spin_lock_irqsave(&per_cpu(cm_core_lock, curr_core),
 				  per_cpu(cm_core_lock_flags, curr_core));
 
-		val = core << __ffs(CM_GCR_Cx_OTHER_CORENUM);
+		val = FIELD_PREP(CM_GCR_Cx_OTHER_CORENUM, core);
 	}
 
 	write_gcr_cl_other(val);
@@ -386,8 +385,8 @@ void mips_cm_error_report(void)
 	cm_other = read_gcr_error_mult();
 
 	if (revision < CM_REV_CM3) { /* CM2 */
-		cause = cm_error >> __ffs(CM_GCR_ERROR_CAUSE_ERRTYPE);
-		ocause = cm_other >> __ffs(CM_GCR_ERROR_MULT_ERR2ND);
+		cause = FIELD_GET(CM_GCR_ERROR_CAUSE_ERRTYPE, cm_error);
+		ocause = FIELD_GET(CM_GCR_ERROR_MULT_ERR2ND, cm_other);
 
 		if (!cause)
 			return;
@@ -445,8 +444,8 @@ void mips_cm_error_report(void)
 		ulong core_id_bits, vp_id_bits, cmd_bits, cmd_group_bits;
 		ulong cm3_cca_bits, mcp_bits, cm3_tr_bits, sched_bit;
 
-		cause = cm_error >> __ffs64(CM3_GCR_ERROR_CAUSE_ERRTYPE);
-		ocause = cm_other >> __ffs(CM_GCR_ERROR_MULT_ERR2ND);
+		cause = FIELD_GET(CM3_GCR_ERROR_CAUSE_ERRTYPE, cm_error);
+		ocause = FIELD_GET(CM_GCR_ERROR_MULT_ERR2ND, cm_other);
 
 		if (!cause)
 			return;
-- 
2.25.1

