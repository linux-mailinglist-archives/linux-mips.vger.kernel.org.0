Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A05135945
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730985AbgAIMeM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:38030 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730969AbgAIMeL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 5152DB2210;
        Thu,  9 Jan 2020 12:34:06 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] MIPS: SGI-IP27: Use specific get_region_shift
Date:   Thu,  9 Jan 2020 13:33:47 +0100
Message-Id: <20200109123353.5656-11-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

IP35 has a different way to find out regions, so we move the IP27
implementation to IP27 specific file.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/sn0/hubni.h |  8 +++++++
 arch/mips/sgi-ip27/ip27-memory.c     | 36 ++++++++++------------------
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/arch/mips/include/asm/sn/sn0/hubni.h b/arch/mips/include/asm/sn/sn0/hubni.h
index b73c4bee65f2..b8253142cb83 100644
--- a/arch/mips/include/asm/sn/sn0/hubni.h
+++ b/arch/mips/include/asm/sn/sn0/hubni.h
@@ -250,6 +250,14 @@ typedef union	hubni_port_error_u {
 #define NI_LLP_CB_MAX		0xff
 #define NI_LLP_SN_MAX		0xff
 
+static inline int get_region_shift(void)
+{
+	if (LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_REGIONSIZE_MASK)
+		return NASID_TO_FINEREG_SHFT;
+
+	return NASID_TO_COARSEREG_SHFT;
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_SGI_SN0_HUBNI_H */
diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
index 0ef2181db8d0..db3759e551b3 100644
--- a/arch/mips/sgi-ip27/ip27-memory.c
+++ b/arch/mips/sgi-ip27/ip27-memory.c
@@ -25,6 +25,7 @@
 #include <asm/sections.h>
 
 #include <asm/sn/arch.h>
+#include <asm/sn/agent.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/sn_private.h>
 
@@ -36,31 +37,18 @@ struct node_data *__node_data[MAX_NUMNODES];
 
 EXPORT_SYMBOL(__node_data);
 
-static int fine_mode;
-
-static int is_fine_dirmode(void)
-{
-	return ((LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_REGIONSIZE_MASK) >> NSRI_REGIONSIZE_SHFT) & REGIONSIZE_FINE;
-}
-
-static u64 get_region(nasid_t nasid)
-{
-	if (fine_mode)
-		return nasid >> NASID_TO_FINEREG_SHFT;
-	else
-		return nasid >> NASID_TO_COARSEREG_SHFT;
-}
-
-static u64 region_mask;
-
-static void gen_region_mask(u64 *region_mask)
+static u64 gen_region_mask(void)
 {
+	int region_shift;
+	u64 region_mask;
 	nasid_t nasid;
 
-	(*region_mask) = 0;
-	for_each_online_node(nasid) {
-		(*region_mask) |= 1ULL << get_region(nasid);
-	}
+	region_shift = get_region_shift();
+	region_mask = 0;
+	for_each_online_node(nasid)
+		region_mask |= BIT_ULL(nasid >> region_shift);
+
+	return region_mask;
 }
 
 #define rou_rflag	rou_flags
@@ -280,10 +268,10 @@ static unsigned long __init slot_psize_compute(nasid_t nasid, int slot)
 
 static void __init mlreset(void)
 {
+	u64 region_mask;
 	nasid_t nasid;
 
 	master_nasid = get_nasid();
-	fine_mode = is_fine_dirmode();
 
 	/*
 	 * Probe for all CPUs - this creates the cpumask and sets up the
@@ -296,7 +284,7 @@ static void __init mlreset(void)
 	init_topology_matrix();
 	dump_topology();
 
-	gen_region_mask(&region_mask);
+	region_mask = gen_region_mask();
 
 	setup_replication_mask();
 
-- 
2.24.1

