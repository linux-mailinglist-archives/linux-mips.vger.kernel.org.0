Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175F523014A
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 07:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgG1FNO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 01:13:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbgG1FNN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 01:13:13 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B649522B45;
        Tue, 28 Jul 2020 05:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595913193;
        bh=w0NUYCkRPztxWdauIZ7iYp1zOp1jLcG8AD5t4PqIxsg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YAjIiROU+83p25BDNEgIN9KISlKJXThut30Rs4cNno1O6shiBCHaHk29LQKLS7Ax5
         Ejyf6BAz+viwYwWWCNj69uR3Ffj9ovcm+78DaXms94OZuxA4yw2XiA7huGDx/Xn9eG
         FxVpJAd03+F3yNWhAm0fZShWCJUQp1/pDjBxfrnc=
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
Subject: [PATCH 06/15] powerpc: fadamp: simplify fadump_reserve_crash_area()
Date:   Tue, 28 Jul 2020 08:11:44 +0300
Message-Id: <20200728051153.1590-7-rppt@kernel.org>
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

fadump_reserve_crash_area() reserves memory from a specified base address
till the end of the RAM.

Replace iteration through the memblock.memory with a single call to
memblock_reserve() with appropriate  that will take care of proper memory
reservation.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 78ab9a6ee6ac..2446a61e3c25 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1658,25 +1658,7 @@ int __init fadump_reserve_mem(void)
 /* Preserve everything above the base address */
 static void __init fadump_reserve_crash_area(u64 base)
 {
-	struct memblock_region *reg;
-	u64 mstart, msize;
-
-	for_each_memblock(memory, reg) {
-		mstart = reg->base;
-		msize  = reg->size;
-
-		if ((mstart + msize) < base)
-			continue;
-
-		if (mstart < base) {
-			msize -= (base - mstart);
-			mstart = base;
-		}
-
-		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
-			(msize >> 20), mstart);
-		memblock_reserve(mstart, msize);
-	}
+	memblock_reserve(base, memblock_end_of_DRAM() - base);
 }
 
 unsigned long __init arch_reserved_kernel_pages(void)
-- 
2.26.2

