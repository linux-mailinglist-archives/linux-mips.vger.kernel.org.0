Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3947F312AF9
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 08:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhBHHAt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 02:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbhBHHAs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 02:00:48 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7DCC061756
        for <linux-mips@vger.kernel.org>; Sun,  7 Feb 2021 23:00:07 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id a16so7301470plh.8
        for <linux-mips@vger.kernel.org>; Sun, 07 Feb 2021 23:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNRv8k6T0vBYlyhZIRyRPb4BuPfIieDbmWY2ldyixB8=;
        b=SjP9dKcmPla2h1iYVwAGQWqSums2uN5uE551KlJ2TcysQfW7QsRxa47uUWppdHen1q
         PDz7x+rhsKT1kRlyCy6hXrfDmamj/fIpgzm3aBPP2Jo22LzkF0x3i8ZkTsMCOX74A5Ax
         GXaEYL1bA3R/2CusE/j5Bja6PAzgONqYCOhEc66RVFo/u8wI4a56VOmNoP1iL2d0C+M3
         mshP80rNTkpCci7lpJ23Rp3ayQIW1TvPzgCYZ9PoF/I5wk5XxSeZksO9qgqadk3b979P
         Kbm3h5o2HbLFTaRZ76N/WbdTyf0RygPeUDsWTOB1vWBelAFD+ljuTv3o0DxKfwAdeGGw
         gp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hNRv8k6T0vBYlyhZIRyRPb4BuPfIieDbmWY2ldyixB8=;
        b=O6hXEsaTQxb1saGa2dA1GBbmoGf1uQ2BfpWTFC3Z9R4d4+geZgI5KiDj4XwU4Dvckz
         IGxVSf9IdbZS9OwU3UfEeLNGId0zwByl60wtPbEqLsNUpYggsT6Wz+W54M8YMT9CKhAW
         7U6TYJD75LbY6A27hq8DwHIuTv+z3V1HNOJOM0+ozO9WfvhH8sAk9lWqg3ahg32jE6H6
         xZda1T2RG/HJ1QJJlDeHNXez4rFAymx23szBDVjBsXJG04KPAe+OsLd1hDhgXa/O3Q02
         Au39MMM7xYqe0G6ovNG18bje+ikSXpLMfDJ+TQF278/4Tt0krd/jM+ixxyrsR6gRpD+r
         4tKQ==
X-Gm-Message-State: AOAM533Bz3Lll+M16U0cPQR9tNfrfq8Mfl+uJYi4KG71Cr1nXjkwVKd5
        QhAKRilm3l1ViKBre9pq61+4RQ==
X-Google-Smtp-Source: ABdhPJz5iOI11iKqIwhP3lnkZN0LSvNjQUaTQhXkiSH6QiIV810ZZGoe8V9dQgqafS6UK969boo/JQ==
X-Received: by 2002:a17:90a:1542:: with SMTP id y2mr16173763pja.123.1612767607146;
        Sun, 07 Feb 2021 23:00:07 -0800 (PST)
Received: from localhost.localdomain ([2600:3c01::f03c:91ff:fe03:4f59])
        by smtp.gmail.com with ESMTPSA id o14sm18506882pgr.44.2021.02.07.23.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 23:00:06 -0800 (PST)
From:   hev <r@hev.cc>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangrui <wangrui@loongson.cn>, hev <r@hev.cc>
Subject: [RFC PATCH v3] MIPS: tlbex: Avoid access invalid address when pmd is modifying
Date:   Mon,  8 Feb 2021 14:59:47 +0800
Message-Id: <20210208065947.1314870-1-r@hev.cc>
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
 arch/mips/mm/tlbex.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index a7521b8f7658..5842074502ad 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -723,11 +723,10 @@ static void
 build_is_huge_pte(u32 **p, struct uasm_reloc **r, unsigned int tmp,
 		  unsigned int pmd, int lid)
 {
-	UASM_i_LW(p, tmp, 0, pmd);
 	if (use_bbit_insns()) {
-		uasm_il_bbit1(p, r, tmp, ilog2(_PAGE_HUGE), lid);
+		uasm_il_bbit1(p, r, pmd, ilog2(_PAGE_HUGE), lid);
 	} else {
-		uasm_i_andi(p, tmp, tmp, _PAGE_HUGE);
+		uasm_i_andi(p, tmp, pmd, _PAGE_HUGE);
 		uasm_il_bnez(p, r, tmp, lid);
 	}
 }
@@ -1103,7 +1102,6 @@ EXPORT_SYMBOL_GPL(build_update_entries);
 struct mips_huge_tlb_info {
 	int huge_pte;
 	int restore_scratch;
-	bool need_reload_pte;
 };
 
 static struct mips_huge_tlb_info
@@ -1118,7 +1116,6 @@ build_fast_tlb_refill_handler (u32 **p, struct uasm_label **l,
 
 	rv.huge_pte = scratch;
 	rv.restore_scratch = 0;
-	rv.need_reload_pte = false;
 
 	if (check_for_high_segbits) {
 		UASM_i_MFC0(p, tmp, C0_BADVADDR);
@@ -1323,7 +1320,6 @@ static void build_r4000_tlb_refill_handler(void)
 	} else {
 		htlb_info.huge_pte = K0;
 		htlb_info.restore_scratch = 0;
-		htlb_info.need_reload_pte = true;
 		vmalloc_mode = refill_noscratch;
 		/*
 		 * create the plain linear handler
@@ -1348,11 +1344,14 @@ static void build_r4000_tlb_refill_handler(void)
 		build_get_pgde32(&p, K0, K1); /* get pgd in K1 */
 #endif
 
+		UASM_i_LW(&p, K0, 0, K1);
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
-		build_is_huge_pte(&p, &r, K0, K1, label_tlb_huge_update);
+		build_is_huge_pte(&p, &r, K1, K0, label_tlb_huge_update);
 #endif
 
-		build_get_ptep(&p, K0, K1);
+		GET_CONTEXT(&p, K1); /* get context reg */
+		build_adjust_context(&p, K1);
+		UASM_i_ADDU(&p, K1, K0, K1); /* add in offset */
 		build_update_entries(&p, K0, K1);
 		build_tlb_write_entry(&p, &l, &r, tlb_random);
 		uasm_l_leave(&l, p);
@@ -1360,8 +1359,6 @@ static void build_r4000_tlb_refill_handler(void)
 	}
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	uasm_l_tlb_huge_update(&l, p);
-	if (htlb_info.need_reload_pte)
-		UASM_i_LW(&p, htlb_info.huge_pte, 0, K1);
 	build_huge_update_entries(&p, htlb_info.huge_pte, K1);
 	build_huge_tlb_write_entry(&p, &l, &r, K0, tlb_random,
 				   htlb_info.restore_scratch);
@@ -2059,20 +2056,20 @@ build_r4000_tlbchange_handler_head(u32 **p, struct uasm_label **l,
 	build_get_pgde32(p, wr.r1, wr.r2); /* get pgd in ptr */
 #endif
 
+	UASM_i_LW(p, wr.r3, 0, wr.r2);
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 	/*
 	 * For huge tlb entries, pmd doesn't contain an address but
 	 * instead contains the tlb pte. Check the PAGE_HUGE bit and
 	 * see if we need to jump to huge tlb processing.
 	 */
-	build_is_huge_pte(p, r, wr.r1, wr.r2, label_tlb_huge_update);
+	build_is_huge_pte(p, r, wr.r1, wr.r3, label_tlb_huge_update);
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

