Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9584AC9E65
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 14:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfJCM1e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Oct 2019 08:27:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:37854 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727242AbfJCM1e (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Oct 2019 08:27:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id ED4A2AD49;
        Thu,  3 Oct 2019 12:27:32 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: SGI-IP27: remove not used stuff inherited from IRIX
Date:   Thu,  3 Oct 2019 14:27:23 +0200
Message-Id: <20191003122724.12239-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Most of the SN/SN0 header files are inherited from IRIX header files,
but not all of that stuff is useful for Linux. Remove not used parts.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/arch.h     | 8 --------
 arch/mips/include/asm/sn/sn0/arch.h | 2 --
 arch/mips/include/asm/sn/types.h    | 3 ---
 3 files changed, 13 deletions(-)

diff --git a/arch/mips/include/asm/sn/arch.h b/arch/mips/include/asm/sn/arch.h
index 3f1fb1454749..97fa2b6440a1 100644
--- a/arch/mips/include/asm/sn/arch.h
+++ b/arch/mips/include/asm/sn/arch.h
@@ -19,8 +19,6 @@
 
 #define cputonasid(cpu)		(sn_cpu_info[(cpu)].p_nasid)
 #define cputoslice(cpu)		(sn_cpu_info[(cpu)].p_slice)
-#define makespnum(_nasid, _slice)					\
-		(((_nasid) << CPUS_PER_NODE_SHFT) | (_slice))
 
 #define INVALID_NASID		(nasid_t)-1
 #define INVALID_CNODEID		(cnodeid_t)-1
@@ -47,12 +45,6 @@ extern nasid_t compact_to_nasid_node[MAX_COMPACT_NODES];
  * will continue to work.  Don't use the arrays above directly.
  */
 
-#define NASID_TO_REGION(nnode)		\
-    ((nnode) >> \
-     (is_fine_dirmode() ? NASID_TO_FINEREG_SHFT : NASID_TO_COARSEREG_SHFT))
-
-extern cnodeid_t nasid_to_compact_node[MAX_NASIDS];
-extern nasid_t compact_to_nasid_node[MAX_COMPACT_NODES];
 extern cnodeid_t cpuid_to_compact_node[MAXCPUS];
 
 #define NASID_TO_COMPACT_NODEID(nnode)	(nasid_to_compact_node[nnode])
diff --git a/arch/mips/include/asm/sn/sn0/arch.h b/arch/mips/include/asm/sn/sn0/arch.h
index 425a67e6a947..ea8a6983f6a4 100644
--- a/arch/mips/include/asm/sn/sn0/arch.h
+++ b/arch/mips/include/asm/sn/sn0/arch.h
@@ -66,7 +66,5 @@
 #define SLOT_MIN_MEM_SIZE	(32*1024*1024)
 
 #define CPUS_PER_NODE		2	/* CPUs on a single hub */
-#define CPUS_PER_NODE_SHFT	1	/* Bits to shift in the node number */
-#define CPUS_PER_SUBNODE	2	/* CPUs on a single hub PI */
 
 #endif /* _ASM_SN_SN0_ARCH_H */
diff --git a/arch/mips/include/asm/sn/types.h b/arch/mips/include/asm/sn/types.h
index 6d24d4e8b9ed..f9d0bc2007c3 100644
--- a/arch/mips/include/asm/sn/types.h
+++ b/arch/mips/include/asm/sn/types.h
@@ -12,13 +12,10 @@
 #include <linux/types.h>
 
 typedef unsigned long	cpuid_t;
-typedef unsigned long	cnodemask_t;
 typedef signed short	nasid_t;	/* node id in numa-as-id space */
 typedef signed short	cnodeid_t;	/* node id in compact-id space */
 typedef signed char	partid_t;	/* partition ID type */
 typedef signed short	moduleid_t;	/* user-visible module number type */
-typedef signed short	cmoduleid_t;	/* kernel compact module id type */
-typedef unsigned char	clusterid_t;	/* Clusterid of the cell */
 
 typedef dev_t		vertex_hdl_t;	/* hardware graph vertex handle */
 
-- 
2.16.4

