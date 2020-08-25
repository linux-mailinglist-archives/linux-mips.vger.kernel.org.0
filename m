Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 811922510CA
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 06:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgHYEih (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 00:38:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47908 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728567AbgHYEig (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Aug 2020 00:38:36 -0400
Received: from localhost.localdomain (unknown [222.209.10.89])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9+_lURf0KkNAA--.17727S4;
        Tue, 25 Aug 2020 12:38:33 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: [PATCH] Revert "MIPS: Flush wrong invalid FTLB entry for huge page"
Date:   Tue, 25 Aug 2020 12:38:07 +0800
Message-Id: <20200825043807.5741-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825043807.5741-1-huangpei@loongson.cn>
References: <20200825043807.5741-1-huangpei@loongson.cn>
X-CM-TRANSID: AQAAf9DxP9+_lURf0KkNAA--.17727S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1xWw47Ww13Ar15KF47XFb_yoWruFy8pr
        9YkF15JrW5tr17WF18AF9rXF13C3ykG397trsrKry5K390gFn5KFn5KwnYyr97CFWkZw42
        9w1Yvr98GFn7Aw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9l14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
        8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
        xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
        AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
        cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
        4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8BMNUUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit 0115f6cbf26663c86496bc56eeea293f85b77897.

The problem fixed in 0115f6cbf26663c86496bc56eeea293f85b77897 is that
it is expected to replace a base page mapping entry in FTLB with a
huge page mapping entry using tlbwi, but doing it is not permitted by
hardware.

The same problem is hit by __update_tlb from do_page_fault first, but it
DOES NOT work it out, and cause another TLB Invalid and give
0115f6cbf26663c86496bc56eeea293f85b77897 the chane to fix it. Let
__update_tlb fix it and remove this extra TLB Invalid exception.

Move the fix from handle_tlb[lms] to __update_tlb, and now huge page
fault path only take 1 TLB Miss plus 1 TLB Invalid, instead of 1 TLB Miss
plus 2 TLB Invalid

Whether fixed by 0115f6cbf26663c86496bc56eeea293f85b77897 or by __update_tlb,
the root cause is TLB Miss handler writes invalid mapping entry into TLB
without checking _PAGE_PRESENT, and this can not be fixed unless letting
CP0 Entrylo0 & Entrylo1 map one page instead of two, like mapping Huge Page

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

