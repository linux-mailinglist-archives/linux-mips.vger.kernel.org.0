Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2FD395A8E
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 14:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbhEaMdE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 08:33:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231524AbhEaMcy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 08:32:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C69E61263;
        Mon, 31 May 2021 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622464274;
        bh=nYK9qBjercVj0g6Vv+NGsdd2DIuSrcvW+FH79tlPIOs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MlpI4+NBfpcRnUk2p9WdM+R+zCDdFBYfVK+3zwnxxQnmFLWqhxlf5Ho6ge/LWzGVb
         nZ+AnwUem6PB9mQd6Ze8IALrEJEGGMv74QJYt4ipJN/ZK1nVluMLJTnuuwRWj0PArE
         HQmd6+FDICPHAUZXJ6959+GgXcrfWdc2Hu9pNC5bP29gF2+/QrM6LzjGurbQuBA76P
         1nYK5fZyzlfvijqrcdJHQ0dhWYS9C/2Nf5Nv/z4Y6OTYCZuSEFsvXnyegEUJ0g75DY
         EGGCul/YwrA6HnurFvtxliCuVYhV9+tyqSLHbWwi4AszS83kbrLDUwl7K7YLqJvsdI
         CAHIGrtRqU2YQ==
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: [RFC/RFT PATCH 1/5] s390: make crashk_res resource a child of "System RAM"
Date:   Mon, 31 May 2021 15:29:55 +0300
Message-Id: <20210531122959.23499-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210531122959.23499-1-rppt@kernel.org>
References: <20210531122959.23499-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Commit 4e042af463f8 ("s390/kexec: fix crash on resize of reserved memory")
added a comment that says "crash kernel resource should not be part of the
System RAM resource" but never explained why. As it looks from the code in
the kernel and in kexec there is no actual reason for that.

Keeping crashk_res inline with other resources makes code simpler and
cleaner, and allows future consolidation of the resources setup across
several architectures.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/s390/kernel/setup.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 5aab59ad5688..30430e7c1b03 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -500,6 +500,9 @@ static struct resource __initdata *standard_resources[] = {
 	&code_resource,
 	&data_resource,
 	&bss_resource,
+#ifdef CONFIG_CRASH_DUMP
+	&crashk_res,
+#endif
 };
 
 static void __init setup_resources(void)
@@ -535,7 +538,7 @@ static void __init setup_resources(void)
 
 		for (j = 0; j < ARRAY_SIZE(standard_resources); j++) {
 			std_res = standard_resources[j];
-			if (std_res->start < res->start ||
+			if (!std_res->end || std_res->start < res->start ||
 			    std_res->start > res->end)
 				continue;
 			if (std_res->end > res->end) {
@@ -552,20 +555,6 @@ static void __init setup_resources(void)
 			}
 		}
 	}
-#ifdef CONFIG_CRASH_DUMP
-	/*
-	 * Re-add removed crash kernel memory as reserved memory. This makes
-	 * sure it will be mapped with the identity mapping and struct pages
-	 * will be created, so it can be resized later on.
-	 * However add it later since the crash kernel resource should not be
-	 * part of the System RAM resource.
-	 */
-	if (crashk_res.end) {
-		memblock_add_node(crashk_res.start, resource_size(&crashk_res), 0);
-		memblock_reserve(crashk_res.start, resource_size(&crashk_res));
-		insert_resource(&iomem_resource, &crashk_res);
-	}
-#endif
 }
 
 static void __init setup_ident_map_size(void)
@@ -733,7 +722,7 @@ static void __init reserve_crashkernel(void)
 		diag10_range(PFN_DOWN(crash_base), PFN_DOWN(crash_size));
 	crashk_res.start = crash_base;
 	crashk_res.end = crash_base + crash_size - 1;
-	memblock_remove(crash_base, crash_size);
+	memblock_reserve(crash_base, crash_size);
 	pr_info("Reserving %lluMB of memory at %lluMB "
 		"for crashkernel (System RAM: %luMB)\n",
 		crash_size >> 20, crash_base >> 20,
-- 
2.28.0

