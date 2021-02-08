Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80241312A64
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 07:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhBHGEY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 01:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhBHGEY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 01:04:24 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6538C06174A
        for <linux-mips@vger.kernel.org>; Sun,  7 Feb 2021 22:03:41 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id w18so9011273pfu.9
        for <linux-mips@vger.kernel.org>; Sun, 07 Feb 2021 22:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3PDP8GGfLsAWCQt3FtzlS+RKaWMHIg/94ZwB90jcKMI=;
        b=xCnD5KxbiGHBeWRmOn84tMPS20okqVJF8KxCM8HRIj/PKFQ2RgLvkybrtN4p5SK7DF
         QsaWSiXhQYHNrAm1nkSAzb40fYKejlK2mUq+UIFLPnvOWNZgtFG5lT4kmBh21wh3Q0UF
         iftYpP0ennVw1bC+p9qdNIQRQZKJ9LF7u4UTm90SJAZtvfGKtP+tjjngEf4vneT89+/z
         hXkJWon3Zod/bB7Li+wVQSEZhwNLZBulqGUq4vW60DQITCIvfbjiVXy8ip9gSxqx6of/
         PjfYU8jv0MYP4mrr0BDjIVXY/0pcf0lmCe4ETffh2Yg9yBEfYdD8M6TQdBnnoztjJeGT
         6GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3PDP8GGfLsAWCQt3FtzlS+RKaWMHIg/94ZwB90jcKMI=;
        b=GwUzxxNbyf5F7YdhnD99PIEICtVButOi7lKjQ/Cey51MbO9rKCBa9OGhGM5nGONj0S
         B68n9n2rlUL3IoHEFHf4QjdPSsJqQl7GvdllRqNTAkZ5C3k5ohn2abWg5TdamPqb9HuG
         UY+0WgyfZ+VycKSPORZj7K1YAovDpDwnxbJstxzBzSludrzet2PPeyz4zvL9KQLthj+n
         ArsN2Fdaa0OaO7va1GdpN4EfOPO4nR1c18McT1TPoS8BtxIU6dmuf5LxvgNjs/TDd+Bn
         g84t1es9/yW1emVqhua+IHWZ/VT4m0V7DvTr65yxlXz6vZysXXkJ6hhXAl7kIHgQ+vAx
         s0RQ==
X-Gm-Message-State: AOAM530uPYNo52HFw9pKhgfZfnO/YBP90N5E8EN0Cf6mz0DN/X3PNwhX
        o0UoGul8Nqs91WbDeJ/svuigoQ==
X-Google-Smtp-Source: ABdhPJytXMtVjpc2uU+qOnjQ5DXDwqXRfsLrGiyf5yeUiKYCWo58FWQ7vVhMIviDhTV4XG4XDXlOaA==
X-Received: by 2002:a63:1626:: with SMTP id w38mr15344487pgl.278.1612764221223;
        Sun, 07 Feb 2021 22:03:41 -0800 (PST)
Received: from localhost.localdomain ([2600:3c01::f03c:91ff:fe03:4f59])
        by smtp.gmail.com with ESMTPSA id y5sm14806018pfp.42.2021.02.07.22.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 22:03:39 -0800 (PST)
From:   hev <r@hev.cc>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangrui <wangrui@loongson.cn>, hev <r@hev.cc>
Subject: [RFC PATCH v2] MIPS: tlbex: Avoid access invalid address when pmd is modifying
Date:   Mon,  8 Feb 2021 14:03:19 +0800
Message-Id: <20210208060319.1142280-1-r@hev.cc>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: wangrui <wangrui@loongson.cn>

When modifying pmd through THP, invalid address access may occurs in the tlb
handler. Because the tlb handler loads value of pmd twice, one is used for huge
page testing and the other is used to load pte. So these two values may be
different:

   CPU 0: (app)                     CPU 1: (khugepaged)
1:                                  scan hit: set pmd to invalid_pmd_table
                                    (pmd_clear)
2: tlb invalid: handle_tlbl,
   load pmd for huge page testing,
   is not a huge page
3:                                  collapsed: set pmd to huge page
4: handle_tlbl: load pmd again for
   load pte(as base address), the
   value of pmd is not an address,
   access invalid address!

This patch avoids the inconsistency of two memory loads by reusing the result
of one load.

Signed-off-by: hev <r@hev.cc>
Signed-off-by: wangrui <wangrui@loongson.cn>
---
 arch/mips/mm/tlbex.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index a7521b8f7658..cfb98290ce06 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -720,14 +720,14 @@ static void build_huge_tlb_write_entry(u32 **p, struct uasm_label **l,
  * Check if Huge PTE is present, if so then jump to LABEL.
  */
 static void
-build_is_huge_pte(u32 **p, struct uasm_reloc **r, unsigned int tmp,
-		  unsigned int pmd, int lid)
+build_is_huge_pte(u32 **p, struct uasm_reloc **r, unsigned int out,
+		  unsigned int tmp, unsigned int pmd, int lid)
 {
-	UASM_i_LW(p, tmp, 0, pmd);
+	UASM_i_LW(p, out, 0, pmd);
 	if (use_bbit_insns()) {
-		uasm_il_bbit1(p, r, tmp, ilog2(_PAGE_HUGE), lid);
+		uasm_il_bbit1(p, r, out, ilog2(_PAGE_HUGE), lid);
 	} else {
-		uasm_i_andi(p, tmp, tmp, _PAGE_HUGE);
+		uasm_i_andi(p, tmp, out, _PAGE_HUGE);
 		uasm_il_bnez(p, r, tmp, lid);
 	}
 }
@@ -1103,7 +1103,6 @@ EXPORT_SYMBOL_GPL(build_update_entries);
 struct mips_huge_tlb_info {
 	int huge_pte;
 	int restore_scratch;
-	bool need_reload_pte;
 };
 
 static struct mips_huge_tlb_info
@@ -1118,7 +1117,6 @@ build_fast_tlb_refill_handler (u32 **p, struct uasm_label **l,
 
 	rv.huge_pte = scratch;
 	rv.restore_scratch = 0;
-	rv.need_reload_pte = false;
 
 	if (check_for_high_segbits) {
 		UASM_i_MFC0(p, tmp, C0_BADVADDR);
@@ -1323,7 +1321,6 @@ static void build_r4000_tlb_refill_handler(void)
 	} else {
 		htlb_info.huge_pte = K0;
 		htlb_info.restore_scratch = 0;
-		htlb_info.need_reload_pte = true;
 		vmalloc_mode = refill_noscratch;
 		/*
 		 * create the plain linear handler
@@ -1349,19 +1346,21 @@ static void build_r4000_tlb_refill_handler(void)
 #endif
 
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
-		build_is_huge_pte(&p, &r, K0, K1, label_tlb_huge_update);
+		build_is_huge_pte(&p, &r, K0, K1, K1, label_tlb_huge_update);
+#else
+		UASM_i_LW(&p, K0, 0, K1);
 #endif
 
-		build_get_ptep(&p, K0, K1);
-		build_update_entries(&p, K0, K1);
+		GET_CONTEXT(&p, K1); /* get context reg */
+		build_adjust_context(&p, K1);
+		UASM_i_ADDU(&p, K0, K0, K1); /* add in offset */
+		build_update_entries(&p, K1, K0);
 		build_tlb_write_entry(&p, &l, &r, tlb_random);
 		uasm_l_leave(&l, p);
 		uasm_i_eret(&p); /* return from trap */
 	}
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	uasm_l_tlb_huge_update(&l, p);
-	if (htlb_info.need_reload_pte)
-		UASM_i_LW(&p, htlb_info.huge_pte, 0, K1);
 	build_huge_update_entries(&p, htlb_info.huge_pte, K1);
 	build_huge_tlb_write_entry(&p, &l, &r, K0, tlb_random,
 				   htlb_info.restore_scratch);
@@ -2065,14 +2064,15 @@ build_r4000_tlbchange_handler_head(u32 **p, struct uasm_label **l,
 	 * instead contains the tlb pte. Check the PAGE_HUGE bit and
 	 * see if we need to jump to huge tlb processing.
 	 */
-	build_is_huge_pte(p, r, wr.r1, wr.r2, label_tlb_huge_update);
+	build_is_huge_pte(p, r, wr.r3, wr.r1, wr.r2, label_tlb_huge_update);
+#else
+	UASM_i_LW(p, wr.r3, 0, wr.r2);
 #endif
 
 	UASM_i_MFC0(p, wr.r1, C0_BADVADDR);
-	UASM_i_LW(p, wr.r2, 0, wr.r2);
 	UASM_i_SRL(p, wr.r1, wr.r1, PAGE_SHIFT + PTE_ORDER - PTE_T_LOG2);
 	uasm_i_andi(p, wr.r1, wr.r1, (PTRS_PER_PTE - 1) << PTE_T_LOG2);
-	UASM_i_ADDU(p, wr.r2, wr.r2, wr.r1);
+	UASM_i_ADDU(p, wr.r2, wr.r3, wr.r1);
 
 #ifdef CONFIG_SMP
 	uasm_l_smp_pgtable_change(l, *p);
-- 
2.30.0

