Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7865C4429ED
	for <lists+linux-mips@lfdr.de>; Tue,  2 Nov 2021 09:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhKBI6F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 04:58:05 -0400
Received: from m15111.mail.126.com ([220.181.15.111]:39058 "EHLO
        m15111.mail.126.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhKBI6E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Nov 2021 04:58:04 -0400
X-Greylist: delayed 1812 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Nov 2021 04:58:04 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yYK7j
        4zSR3tU5Nj9zPzz1aeMvcwXiqLMsS3fqcTDIo0=; b=FyTEuFR5OddJJXvGzdYLC
        hl/50cqBbzP5rucXIXGTH0R7PC3oLBn7067f7YYykbRQJwygiFfOa0aEdLfqFW0B
        N/zMo0noiv0rc6Pe7A7QyUmbBMy9RLZLZDRQYQksd25Y5k2G57LCV1Z4DKvHjfp9
        TK7mJ4l8y1/qjVfyLixPnE=
Received: from pek-lpd-ccm5.wrs.com (unknown [60.247.85.82])
        by smtp1 (Coremail) with SMTP id C8mowADX5XHI9YBh3wm5CQ--.38969S2;
        Tue, 02 Nov 2021 16:24:53 +0800 (CST)
From:   Zhaolong Zhang <zhangzl2013@126.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexander Lobakin <alobakin@pm.me>,
        Yanteng Si <siyanteng@loongson.cn>, linux-mips@vger.kernel.org,
        Zhaolong Zhang <zhangzl2013@126.com>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] mips: fix HUGETLB function without THP enabled
Date:   Tue,  2 Nov 2021 16:24:37 +0800
Message-Id: <20211102082437.3319235-1-zhangzl2013@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowADX5XHI9YBh3wm5CQ--.38969S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4DKr15tw1rtr13Jry3XFb_yoW5CFy5pF
        Z3AF48uw4UtFnrJay3trnYqry3Xr4kXayDtr17Ga1DX3WUKw40gF4vgw4avrn5XrWkZFWx
        AFZ0gayj9rsrJw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UeMKtUUUUU=
X-Originating-IP: [60.247.85.82]
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbiaRU-z1pEDpurlwAAs7
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ltp test futex_wake04 without THP enabled leads to below bt:
  [<ffffffff80a03728>] BUG+0x0/0x8
  [<ffffffff80a0624c>] internal_get_user_pages_fast+0x81c/0x820
  [<ffffffff8093ac18>] get_futex_key+0xa0/0x480
  [<ffffffff8093b074>] futex_wait_setup+0x7c/0x1a8
  [<ffffffff8093b2c0>] futex_wait+0x120/0x228
  [<ffffffff8093dbe8>] do_futex+0x140/0xbd8
  [<ffffffff8093e78c>] sys_futex+0x10c/0x1c0
  [<ffffffff808703d0>] syscall_common+0x34/0x58

Move pmd_write() and pmd_page() from TRANSPARENT_HUGEPAGE scope to
MIPS_HUGE_TLB_SUPPORT scope, because both THP and HUGETLB will need
them.

Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
---
 arch/mips/include/asm/pgtable.h | 40 +++++++++++++++++----------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 804889b70965..1fcf4be5cd20 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -86,10 +86,12 @@ extern void paging_init(void);
  */
 #define pmd_phys(pmd)		virt_to_phys((void *)pmd_val(pmd))
 
+#ifndef CONFIG_MIPS_HUGE_TLB_SUPPORT
 #define __pmd_page(pmd)		(pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT))
 #ifndef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_page(pmd)		__pmd_page(pmd)
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE  */
+#endif /* CONFIG_MIPS_HUGE_TLB_SUPPORT */
 
 #define pmd_page_vaddr(pmd)	pmd_val(pmd)
 
@@ -416,6 +418,25 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	pte_val(pte) |= _PAGE_HUGE;
 	return pte;
 }
+
+#define pmd_write pmd_write
+static inline int pmd_write(pmd_t pmd)
+{
+	return !!(pmd_val(pmd) & _PAGE_WRITE);
+}
+
+static inline unsigned long pmd_pfn(pmd_t pmd)
+{
+	return pmd_val(pmd) >> _PFN_SHIFT;
+}
+
+static inline struct page *pmd_page(pmd_t pmd)
+{
+	if (pmd_val(pmd) & _PAGE_HUGE)
+		return pfn_to_page(pmd_pfn(pmd));
+
+	return pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT);
+}
 #endif /* CONFIG_MIPS_HUGE_TLB_SUPPORT */
 
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
@@ -591,12 +612,6 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		       pmd_t *pmdp, pmd_t pmd);
 
-#define pmd_write pmd_write
-static inline int pmd_write(pmd_t pmd)
-{
-	return !!(pmd_val(pmd) & _PAGE_WRITE);
-}
-
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	pmd_val(pmd) &= ~(_PAGE_WRITE | _PAGE_SILENT_WRITE);
@@ -677,19 +692,6 @@ static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
 /* Extern to avoid header file madness */
 extern pmd_t mk_pmd(struct page *page, pgprot_t prot);
 
-static inline unsigned long pmd_pfn(pmd_t pmd)
-{
-	return pmd_val(pmd) >> _PFN_SHIFT;
-}
-
-static inline struct page *pmd_page(pmd_t pmd)
-{
-	if (pmd_trans_huge(pmd))
-		return pfn_to_page(pmd_pfn(pmd));
-
-	return pfn_to_page(pmd_phys(pmd) >> PAGE_SHIFT);
-}
-
 static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 {
 	pmd_val(pmd) = (pmd_val(pmd) & (_PAGE_CHG_MASK | _PAGE_HUGE)) |
-- 
2.27.0

