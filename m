Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50BE8119452
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 22:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbfLJVNo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 16:13:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:40322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729039AbfLJVNn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 10 Dec 2019 16:13:43 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92C0E20828;
        Tue, 10 Dec 2019 21:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576012421;
        bh=Sjk26Xenb9gbjd6XEYt8Eux0fap3BLo0eMdUgQ6sgSQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RlSB+Iav79jcb2mRKhWWJeHfO64A4fduM8LZN/PQjC0el4ePC1rRyNa+YvnHD8Jzh
         yVii0D3IuJcVrtAjRLnaT1EL9W4adDpIbM5S/0w+pp/PPCWJeEQbX5zt902nsaAidu
         zHFi+hkPKueEaTofAVZFZenQrCJaCpNLUYdwM2gs=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 336/350] mips: fix build when "48 bits virtual memory" is enabled
Date:   Tue, 10 Dec 2019 16:07:21 -0500
Message-Id: <20191210210735.9077-297-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

[ Upstream commit 3ed6751bb8fa89c3014399bb0414348499ee202a ]

With CONFIG_MIPS_VA_BITS_48=y the build fails miserably:

  CC      arch/mips/kernel/asm-offsets.s
In file included from arch/mips/include/asm/pgtable.h:644,
                 from include/linux/mm.h:99,
                 from arch/mips/kernel/asm-offsets.c:15:
include/asm-generic/pgtable.h:16:2: error: #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
 #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
  ^~~~~
include/asm-generic/pgtable.h:390:28: error: unknown type name 'p4d_t'; did you mean 'pmd_t'?
 static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
                            ^~~~~
                            pmd_t

[ ... more such errors ... ]

scripts/Makefile.build:99: recipe for target 'arch/mips/kernel/asm-offsets.s' failed
make[2]: *** [arch/mips/kernel/asm-offsets.s] Error 1

This happens because when CONFIG_MIPS_VA_BITS_48 enables 4th level of the
page tables, but neither pgtable-nop4d.h nor 5level-fixup.h are included to
cope with the 5th level.

Replace #ifdef conditions around includes of the pgtable-nop{m,u}d.h with
explicit CONFIG_PGTABLE_LEVELS and add include of 5level-fixup.h for the
case when CONFIG_PGTABLE_LEVELS==4

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/pgtable-64.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 93a9dce31f255..813dfe5f45a59 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -18,10 +18,12 @@
 #include <asm/fixmap.h>
 
 #define __ARCH_USE_5LEVEL_HACK
-#if defined(CONFIG_PAGE_SIZE_64KB) && !defined(CONFIG_MIPS_VA_BITS_48)
+#if CONFIG_PGTABLE_LEVELS == 2
 #include <asm-generic/pgtable-nopmd.h>
-#elif !(defined(CONFIG_PAGE_SIZE_4KB) && defined(CONFIG_MIPS_VA_BITS_48))
+#elif CONFIG_PGTABLE_LEVELS == 3
 #include <asm-generic/pgtable-nopud.h>
+#else
+#include <asm-generic/5level-fixup.h>
 #endif
 
 /*
@@ -216,6 +218,9 @@ static inline unsigned long pgd_page_vaddr(pgd_t pgd)
 	return pgd_val(pgd);
 }
 
+#define pgd_phys(pgd)		virt_to_phys((void *)pgd_val(pgd))
+#define pgd_page(pgd)		(pfn_to_page(pgd_phys(pgd) >> PAGE_SHIFT))
+
 static inline pud_t *pud_offset(pgd_t *pgd, unsigned long address)
 {
 	return (pud_t *)pgd_page_vaddr(*pgd) + pud_index(address);
-- 
2.20.1

