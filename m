Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533C4230183
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 07:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgG1FOd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 01:14:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:37782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbgG1FOc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 01:14:32 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A319622B45;
        Tue, 28 Jul 2020 05:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595913272;
        bh=hFA2o8it4I/HXbe86IOHmF4tlkZa8gVYSY+0N3aJP/M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M+RZG9ZnotcmsF2PkNa5zM/WFJM3ny9Ao4jVf4GZvFJO9XWUIy1uk0iFGD2FkFtN2
         /+/KrQiOLQR/E4QyReOgoyl9fI+gDphQS1WeTYk5sT9/kd5vjko1vVBIixO3xg+5dl
         6l0zbIn3ds2e3/BzAP/7In9EqpLZsIJvcvdKNYd8=
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org
Subject: [PATCH 14/15] x86/numa: remove redundant iteration over memblock.reserved
Date:   Tue, 28 Jul 2020 08:11:52 +0300
Message-Id: <20200728051153.1590-15-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
regions to set node ID in memblock.reserved and than traverses
memblock.reserved to update reserved_nodemask to include node IDs that were
set in the first loop.

Remove redundant traversal over memblock.reserved and update
reserved_nodemask while iterating over numa_meminfo.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/mm/numa.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 8ee952038c80..4078abd33938 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -498,31 +498,25 @@ static void __init numa_clear_kernel_node_hotplug(void)
 	 * and use those ranges to set the nid in memblock.reserved.
 	 * This will split up the memblock regions along node
 	 * boundaries and will set the node IDs as well.
+	 *
+	 * The nid will also be set in reserved_nodemask which is later
+	 * used to clear MEMBLOCK_HOTPLUG flag.
+	 *
+	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
+	 *   numa_meminfo might not include all memblock.reserved
+	 *   memory ranges, because quirks such as trim_snb_memory()
+	 *   reserve specific pages for Sandy Bridge graphics.
+	 *   These ranges will remain with nid == MAX_NUMNODES. ]
 	 */
 	for (i = 0; i < numa_meminfo.nr_blks; i++) {
 		struct numa_memblk *mb = numa_meminfo.blk + i;
 		int ret;
 
 		ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
+		node_set(mb->nid, reserved_nodemask);
 		WARN_ON_ONCE(ret);
 	}
 
-	/*
-	 * Now go over all reserved memblock regions, to construct a
-	 * node mask of all kernel reserved memory areas.
-	 *
-	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
-	 *   numa_meminfo might not include all memblock.reserved
-	 *   memory ranges, because quirks such as trim_snb_memory()
-	 *   reserve specific pages for Sandy Bridge graphics. ]
-	 */
-	for_each_memblock(reserved, mb_region) {
-		int nid = memblock_get_region_node(mb_region);
-
-		if (nid != MAX_NUMNODES)
-			node_set(nid, reserved_nodemask);
-	}
-
 	/*
 	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
 	 * belonging to the reserved node mask.
-- 
2.26.2

