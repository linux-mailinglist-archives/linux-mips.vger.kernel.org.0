Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A55E13593E
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730951AbgAIMeJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:37972 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729485AbgAIMeJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 72B21B2205;
        Thu,  9 Jan 2020 12:34:03 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] MIPS: SGI-IP27: use nodemask instead of cpumask
Date:   Thu,  9 Jan 2020 13:33:38 +0100
Message-Id: <20200109123353.5656-2-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replication is done on a per node basis, so the use of cpumask
was a misusage here.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip27/ip27-klnuma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-klnuma.c b/arch/mips/sgi-ip27/ip27-klnuma.c
index ee1c6ff4aa00..af7b98c39dce 100644
--- a/arch/mips/sgi-ip27/ip27-klnuma.c
+++ b/arch/mips/sgi-ip27/ip27-klnuma.c
@@ -20,7 +20,7 @@
 #include <asm/sn/mapped_kernel.h>
 #include <asm/sn/sn_private.h>
 
-static cpumask_t ktext_repmask;
+static nodemask_t ktext_repmask;
 
 /*
  * XXX - This needs to be much smarter about where it puts copies of the
@@ -30,8 +30,8 @@ static cpumask_t ktext_repmask;
 void __init setup_replication_mask(void)
 {
 	/* Set only the master cnode's bit.  The master cnode is always 0. */
-	cpumask_clear(&ktext_repmask);
-	cpumask_set_cpu(0, &ktext_repmask);
+	nodes_clear(ktext_repmask);
+	node_set(0, ktext_repmask);
 
 #ifdef CONFIG_REPLICATE_KTEXT
 #ifndef CONFIG_MAPPED_KERNEL
@@ -44,7 +44,7 @@ void __init setup_replication_mask(void)
 			if (nasid == 0)
 				continue;
 			/* Advertise that we have a copy of the kernel */
-			cpumask_set_cpu(nasid, &ktext_repmask);
+			node_set(nasid, ktext_repmask);
 		}
 	}
 #endif
@@ -98,7 +98,7 @@ void __init replicate_kernel_text(void)
 			continue;
 
 		/* Check if this node should get a copy of the kernel */
-		if (cpumask_test_cpu(client_nasid, &ktext_repmask)) {
+		if (node_isset(client_nasid, ktext_repmask)) {
 			server_nasid = client_nasid;
 			copy_kernel(server_nasid);
 		}
@@ -122,7 +122,7 @@ unsigned long node_getfirstfree(nasid_t nasid)
 	loadbase += 16777216;
 #endif
 	offset = PAGE_ALIGN((unsigned long)(&_end)) - loadbase;
-	if ((nasid == 0) || (cpumask_test_cpu(nasid, &ktext_repmask)))
+	if ((nasid == 0) || (node_isset(nasid, ktext_repmask)))
 		return TO_NODE(nasid, offset) >> PAGE_SHIFT;
 	else
 		return KDM_TO_PHYS(PAGE_ALIGN(SYMMON_STK_ADDR(nasid, 0))) >> PAGE_SHIFT;
-- 
2.24.1

