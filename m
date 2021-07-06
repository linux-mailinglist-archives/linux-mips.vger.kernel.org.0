Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEC73BD315
	for <lists+linux-mips@lfdr.de>; Tue,  6 Jul 2021 13:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238113AbhGFLsE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 07:48:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237307AbhGFLgE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Jul 2021 07:36:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE1DA61EF1;
        Tue,  6 Jul 2021 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625570808;
        bh=Nj0Udr4R71nGxE+aMr8O49t+TEjcRM2tKiepHUjqTXA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HtCCJ/am76Dxzq34RE377iA1bDUrZ0OSpkQKhZDda1d/Yw4viKAyYiSqox5G4HAOm
         GQfqnCDii5TBNGbWSXTNXbmJVVVaLI/EYTCGvcFDXSuJ3qbk6R2gbVX336PN/yhHx2
         2pPtV7NA/t+wNuBZzoZGoONru3Zp4u5ez5KS1OwYtZTQVxTsZk1F6izGCDw9M1/Rco
         QamGYSnJ43nzAjYyYdWNOzvP91MWMWPin51253xNIsDZ0L2YNkiCT7y6EikdGjgpZn
         j4venE9Dg5LG3u0iQUSKrJxD/D62cN1xIyurrqEwnUNV0lYYr1I8M0fElQanCDAvlh
         DfCG2wZGrY2lQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Bibo Mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 07/55] hugetlb: clear huge pte during flush function on mips platform
Date:   Tue,  6 Jul 2021 07:25:50 -0400
Message-Id: <20210706112638.2065023-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112638.2065023-1-sashal@kernel.org>
References: <20210706112638.2065023-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Bibo Mao <maobibo@loongson.cn>

[ Upstream commit 33ae8f801ad8bec48e886d368739feb2816478f2 ]

If multiple threads are accessing the same huge page at the same
time, hugetlb_cow will be called if one thread write the COW huge
page. And function huge_ptep_clear_flush is called to notify other
threads to clear the huge pte tlb entry. The other threads clear
the huge pte tlb entry and reload it from page table, the reload
huge pte entry may be old.

This patch fixes this issue on mips platform, and it clears huge
pte entry before notifying other threads to flush current huge
page entry, it is similar with other architectures.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/hugetlb.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
index 982bc0685330..4747a4694669 100644
--- a/arch/mips/include/asm/hugetlb.h
+++ b/arch/mips/include/asm/hugetlb.h
@@ -67,7 +67,13 @@ static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep)
 {
-	flush_tlb_page(vma, addr & huge_page_mask(hstate_vma(vma)));
+	/*
+	 * clear the huge pte entry firstly, so that the other smp threads will
+	 * not get old pte entry after finishing flush_tlb_page and before
+	 * setting new huge pte entry
+	 */
+	huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
+	flush_tlb_page(vma, addr);
 }
 
 static inline int huge_pte_none(pte_t pte)
-- 
2.30.2

