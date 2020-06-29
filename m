Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9674920E637
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 00:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404060AbgF2VpS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jun 2020 17:45:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49520 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727123AbgF2Shn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:43 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9566flezmRMAA--.4772S2;
        Mon, 29 Jun 2020 21:15:39 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Bibo Mao <maobibo@loongson.cn>
Subject: [PATCH 1/2] hugetlb: clear huge pte during flush function on mips platform
Date:   Mon, 29 Jun 2020 21:15:32 +0800
Message-Id: <1593436533-8645-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxn9566flezmRMAA--.4772S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWDGFWfKw4rAr17Ary3XFb_yoW8XF4kpF
        WDCwn5G3ykGr9IkF1xZ34kK3y3tw4qgaySyFyrKF4FywnxXw4UKF97WFWUAw4kZrZ5ta18
        uF4jqr4kAFsFvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE-syl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Bibo Mao <maobibo@loongson.cn>

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
---
 arch/mips/include/asm/hugetlb.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
index 10e3be87..c214440 100644
--- a/arch/mips/include/asm/hugetlb.h
+++ b/arch/mips/include/asm/hugetlb.h
@@ -46,7 +46,13 @@ static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
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
 
 #define __HAVE_ARCH_HUGE_PTE_NONE
-- 
1.8.3.1

