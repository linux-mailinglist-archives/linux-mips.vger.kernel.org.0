Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40609135943
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730981AbgAIMeL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:38022 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730963AbgAIMeL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8110DB220B;
        Thu,  9 Jan 2020 12:34:05 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] MIPS: SGI-IP27: Move get_nasid() to a IP27 specific file
Date:   Thu,  9 Jan 2020 13:33:43 +0100
Message-Id: <20200109123353.5656-7-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

get_nasid() will be different for SGI-IP35, therefore move IP27
implementation to IP27 specific file.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/sn/arch.h    |  6 ------
 arch/mips/include/asm/sn/sn0/hub.h | 10 ++++++++++
 arch/mips/sgi-ip27/ip27-init.c     | 10 ----------
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/sn/arch.h b/arch/mips/include/asm/sn/arch.h
index afe9fcf36198..9a9682543e89 100644
--- a/arch/mips/include/asm/sn/arch.h
+++ b/arch/mips/include/asm/sn/arch.h
@@ -25,10 +25,4 @@
 #define INVALID_MODULE		(moduleid_t)-1
 #define INVALID_PARTID		(partid_t)-1
 
-#ifndef __ASSEMBLY__
-
-extern nasid_t get_nasid(void);
-
-#endif
-
 #endif /* _ASM_SN_ARCH_H */
diff --git a/arch/mips/include/asm/sn/sn0/hub.h b/arch/mips/include/asm/sn/sn0/hub.h
index 82cadd785b9c..c84adde36d41 100644
--- a/arch/mips/include/asm/sn/sn0/hub.h
+++ b/arch/mips/include/asm/sn/sn0/hub.h
@@ -47,6 +47,16 @@
 	and	\res, NSRI_NODEID_MASK
 	dsrl	\res, NSRI_NODEID_SHFT
 	.endm
+#else
+
+/*
+ * get_nasid() returns the physical node id number of the caller.
+ */
+static inline nasid_t get_nasid(void)
+{
+	return (nasid_t)((LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_NODEID_MASK)
+			 >> NSRI_NODEID_SHFT);
+}
 #endif
 
 #endif /* _ASM_SN_SN0_HUB_H */
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 484db3b73b7d..a2da78bc9f76 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -94,16 +94,6 @@ void per_cpu_init(void)
 	enable_percpu_irq(IP27_HUB_PEND1_IRQ, IRQ_TYPE_NONE);
 }
 
-/*
- * get_nasid() returns the physical node id number of the caller.
- */
-nasid_t
-get_nasid(void)
-{
-	return (nasid_t)((LOCAL_HUB_L(NI_STATUS_REV_ID) & NSRI_NODEID_MASK)
-			 >> NSRI_NODEID_SHFT);
-}
-
 void __init plat_mem_setup(void)
 {
 	u64 p, e, n_mode;
-- 
2.24.1

