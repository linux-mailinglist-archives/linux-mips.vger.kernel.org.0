Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E613567357
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jul 2022 17:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232841AbiGEPuJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jul 2022 11:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbiGEPtm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jul 2022 11:49:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F67365EF;
        Tue,  5 Jul 2022 08:48:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2E3E8B81825;
        Tue,  5 Jul 2022 15:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67223C341CA;
        Tue,  5 Jul 2022 15:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657036111;
        bh=XUFB6Va8O4VOUoTqeJ/SzqmIGXceAjPUgZz79vTlh1E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G94szT3+bFQ+wpJnBwp0DBOJnWEkyAC9OpsGfwqaaGXZ52mMM1e0fQTTrRr23p6XO
         WLqUsWA12m7vCBEqvq1B9sfE/8cirwRjD2dMNaWZLserQN76JvFOx4vxkXpBu7UKXX
         uiONMQD/rbRfNPoolaXP1Etwh0rj356yp+hlBaes6mIZwiv2i7TemISbRgKFzAmN+H
         blCQUYLDtRYUfHM+mZx/NL4F8zp+3NXgNnhqtaerlx+MFrKRHn5Bftnh+3NHU9waAK
         ABvPXtRin8neCNzfKG/9p6oxUmjb5QVTLbsl+ToTfxvdYrMaUIk6l6kVlUbFAyNGZs
         EZG52hwrmYQiw==
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>,
        Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Matthew Wilcox <willy@infradead.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org,
        linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        loongarch@lists.linux.dev
Subject: [PATCH v2 11/15] loongarch: drop definition of PUD_ORDER
Date:   Tue,  5 Jul 2022 18:47:04 +0300
Message-Id: <20220705154708.181258-12-rppt@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705154708.181258-1-rppt@kernel.org>
References: <20220705154708.181258-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

This is the order of the page table allocation, not the order of a PUD.
Since its always hardwired to 0, simply drop it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Huacai Chen <chenhuacai@kernel.org>
---
 arch/loongarch/include/asm/pgalloc.h | 2 +-
 arch/loongarch/include/asm/pgtable.h | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 93e785f46639..4bfeb3c9c9ac 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -90,7 +90,7 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
 
-	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_ORDER);
+	pud = (pud_t *) __get_free_page(GFP_KERNEL);
 	if (pud)
 		pud_init((unsigned long)pud, (unsigned long)invalid_pmd_table);
 	return pud;
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f926537d2233..a97996fefaed 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -22,7 +22,6 @@
 #endif
 
 #define PGD_ORDER		0
-#define PUD_ORDER		0
 
 #if CONFIG_PGTABLE_LEVELS == 2
 #define PGDIR_SHIFT	(PAGE_SHIFT + (PAGE_SHIFT - 3))
@@ -38,7 +37,7 @@
 #define PUD_SHIFT	(PMD_SHIFT + (PAGE_SHIFT - 3))
 #define PUD_SIZE	(1UL << PUD_SHIFT)
 #define PUD_MASK	(~(PUD_SIZE-1))
-#define PGDIR_SHIFT	(PUD_SHIFT + (PAGE_SHIFT + PUD_ORDER - 3))
+#define PGDIR_SHIFT	(PUD_SHIFT + (PAGE_SHIFT - 3))
 #endif
 
 #define PGDIR_SIZE	(1UL << PGDIR_SHIFT)
@@ -48,7 +47,7 @@
 
 #define PTRS_PER_PGD	((PAGE_SIZE << PGD_ORDER) >> 3)
 #if CONFIG_PGTABLE_LEVELS > 3
-#define PTRS_PER_PUD	((PAGE_SIZE << PUD_ORDER) >> 3)
+#define PTRS_PER_PUD	(PAGE_SIZE >> 3)
 #endif
 #if CONFIG_PGTABLE_LEVELS > 2
 #define PTRS_PER_PMD	(PAGE_SIZE >> 3)
-- 
2.34.1

