Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D181624CF3F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 09:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgHUHX5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 03:23:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46562 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727841AbgHUHX5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 03:23:57 -0400
Received: from localhost.localdomain (unknown [222.209.8.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP997dj9fGgoMAA--.14754S4;
        Fri, 21 Aug 2020 15:23:51 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: [PATCH 3/3] Revert "MIPS: Flush wrong invalid FTLB entry for huge page"
Date:   Fri, 21 Aug 2020 15:23:29 +0800
Message-Id: <20200821072329.18006-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821072329.18006-1-huangpei@loongson.cn>
References: <20200821072329.18006-1-huangpei@loongson.cn>
X-CM-TRANSID: AQAAf9DxP997dj9fGgoMAA--.14754S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1fKr4rJrW8Wry5Xr17GFg_yoWrJw1kpr
        9YkF15JrWYyrnxWFykAF9rXF13A3ykG392qrsrKry5Kw4qkF1FgFn5KwnYyrykCFWkZw42
        9w1Yqr98Grn7Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit 0115f6cbf26663c86496bc56eeea293f85b77897.

The fix in 0115f6cbf26663c86496bc56eeea293f85b77897 is two late, since
__update_tlb hit the same problem first. So let __update_tlb fix it

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/mm/tlb-r4k.c | 15 ++++++++++++++-
 arch/mips/mm/tlbex.c   | 25 ++++---------------------
 2 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 38e2894d5fa3..cb8afa326b2c 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -328,6 +328,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	/* this could be a huge page  */
 	if (pmd_huge(*pmdp)) {
 		unsigned long lo;
+		unsigned long entryhi;
 		write_c0_pagemask(PM_HUGE_MASK);
 		ptep = (pte_t *)pmdp;
 		lo = pte_to_entrylo(pte_val(*ptep));
@@ -335,7 +336,19 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 		write_c0_entrylo1(lo + (HPAGE_SIZE >> 7));
 
 		mtc0_tlbw_hazard();
-		if (idx < 0)
+		if (idx >= current_cpu_data.tlbsizevtlb) {
+		/* hit in FTLB.
+		 * Invalid it then tlbwr, since FTLB hold only base page*/
+			entryhi = read_c0_entryhi();
+			write_c0_entryhi(MIPS_ENTRYHI_EHINV);
+			tlb_write_indexed();
+			tlbw_use_hazard();
+			write_c0_entryhi(entryhi);
+
+		}
+
+
+		if (idx < 0 || idx >= current_cpu_data.tlbsizevtlb)
 			tlb_write_random();
 		else
 			tlb_write_indexed();
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 14f8ba93367f..9c4cd08c00d3 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -762,8 +762,7 @@ static void build_huge_update_entries(u32 **p, unsigned int pte,
 static void build_huge_handler_tail(u32 **p, struct uasm_reloc **r,
 				    struct uasm_label **l,
 				    unsigned int pte,
-				    unsigned int ptr,
-				    unsigned int flush)
+				    unsigned int ptr)
 {
 #ifdef CONFIG_SMP
 	UASM_i_SC(p, pte, 0, ptr);
@@ -772,22 +771,6 @@ static void build_huge_handler_tail(u32 **p, struct uasm_reloc **r,
 #else
 	UASM_i_SW(p, pte, 0, ptr);
 #endif
-	if (cpu_has_ftlb && flush) {
-		BUG_ON(!cpu_has_tlbinv);
-
-		UASM_i_MFC0(p, ptr, C0_ENTRYHI);
-		uasm_i_ori(p, ptr, ptr, MIPS_ENTRYHI_EHINV);
-		UASM_i_MTC0(p, ptr, C0_ENTRYHI);
-		build_tlb_write_entry(p, l, r, tlb_indexed);
-
-		uasm_i_xori(p, ptr, ptr, MIPS_ENTRYHI_EHINV);
-		UASM_i_MTC0(p, ptr, C0_ENTRYHI);
-		build_huge_update_entries(p, pte, ptr);
-		build_huge_tlb_write_entry(p, l, r, pte, tlb_random, 0);
-
-		return;
-	}
-
 	build_huge_update_entries(p, pte, ptr);
 	build_huge_tlb_write_entry(p, l, r, pte, tlb_indexed, 0);
 }
@@ -2278,7 +2261,7 @@ static void build_r4000_tlb_load_handler(void)
 		uasm_l_tlbl_goaround2(&l, p);
 	}
 	uasm_i_ori(&p, wr.r1, wr.r1, (_PAGE_ACCESSED | _PAGE_VALID));
-	build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 1);
+	build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
 #endif
 
 	uasm_l_nopage_tlbl(&l, p);
@@ -2334,7 +2317,7 @@ static void build_r4000_tlb_store_handler(void)
 	build_tlb_probe_entry(&p);
 	uasm_i_ori(&p, wr.r1, wr.r1,
 		   _PAGE_ACCESSED | _PAGE_MODIFIED | _PAGE_VALID | _PAGE_DIRTY);
-	build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 1);
+	build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
 #endif
 
 	uasm_l_nopage_tlbs(&l, p);
@@ -2391,7 +2374,7 @@ static void build_r4000_tlb_modify_handler(void)
 	build_tlb_probe_entry(&p);
 	uasm_i_ori(&p, wr.r1, wr.r1,
 		   _PAGE_ACCESSED | _PAGE_MODIFIED | _PAGE_VALID | _PAGE_DIRTY);
-	build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2, 0);
+	build_huge_handler_tail(&p, &r, &l, wr.r1, wr.r2);
 #endif
 
 	uasm_l_nopage_tlbm(&l, p);
-- 
2.17.1

