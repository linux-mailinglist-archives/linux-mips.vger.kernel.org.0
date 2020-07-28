Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E824E23012C
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 07:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgG1FMe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 01:12:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbgG1FMe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 01:12:34 -0400
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B6452070A;
        Tue, 28 Jul 2020 05:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595913153;
        bh=4DNtFGpQ7uDaB3zOvxrPIrzPc60FGUwiPzAlH9TywcA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m3WIeA90qkRvl2gsmAfQuDGwJAbJi5UUCCAg4LmaseT2GduhfCilwi3H3N+JLaGfy
         J6liV31fxMOs5Q3H2ZjqTO28omsPhlPG1oCTgC9Eu3s2MLIy3PimP/FPxYL28QvZkd
         olHKuwsJqS/tqZjOOqJgFqsJsJs1UbU0Wq3HadR8=
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
Subject: [PATCH 02/15] dma-contiguous: simplify cma_early_percent_memory()
Date:   Tue, 28 Jul 2020 08:11:40 +0300
Message-Id: <20200728051153.1590-3-rppt@kernel.org>
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

The memory size calculation in cma_early_percent_memory() traverses
memblock.memory rather than simply call memblock_phys_mem_size(). The
comment in that function suggests that at some point there should have been
call to memblock_analyze() before memblock_phys_mem_size() could be used.
As of now, there is no memblock_analyze() at all and
memblock_phys_mem_size() can be used as soon as cold-plug memory is
registerd with memblock.

Replace loop over memblock.memory with a call to memblock_phys_mem_size().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 kernel/dma/contiguous.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 15bc5026c485..1992afd8ca7b 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -73,16 +73,7 @@ early_param("cma", early_cma);
 
 static phys_addr_t __init __maybe_unused cma_early_percent_memory(void)
 {
-	struct memblock_region *reg;
-	unsigned long total_pages = 0;
-
-	/*
-	 * We cannot use memblock_phys_mem_size() here, because
-	 * memblock_analyze() has not been called yet.
-	 */
-	for_each_memblock(memory, reg)
-		total_pages += memblock_region_memory_end_pfn(reg) -
-			       memblock_region_memory_base_pfn(reg);
+	unsigned long total_pages = PHYS_PFN(memblock_phys_mem_size());
 
 	return (total_pages * CONFIG_CMA_SIZE_PERCENTAGE / 100) << PAGE_SHIFT;
 }
-- 
2.26.2

