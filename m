Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521D045D8A2
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 12:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhKYLFd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 06:05:33 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35040 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1354889AbhKYLDd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 06:03:33 -0500
Received: from localhost.localdomain (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeNK1bJ9hjVcBAA--.2229S4;
        Thu, 25 Nov 2021 19:00:15 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 2/4] MIPS: tx39: fix tx39_flush_cache_page
Date:   Thu, 25 Nov 2021 18:59:47 +0800
Message-Id: <20211125105949.27147-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211125105949.27147-1-huangpei@loongson.cn>
References: <20211125105949.27147-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxeNK1bJ9hjVcBAA--.2229S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tF13Cw18tr1xCr45Kr48WFg_yoW8Ar48pa
        9Fkan0y3y0ga4ruFyxAwn8tryfK3sxKFW0ya17G3yYka45XF1UKrn3KF90gFy5ArWFyay7
        uFW2yr1UZw4qvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOJPEUUUU
        U
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Indexed cache operation needs KSEG0 address for safety and assumes
no dcache alias nor high memory, since indexed cache instrcution
CAN NOT handle cache alias

The TX39 core based on MIPS R3000A has 4KB Icache(direct mapped) and
1KB Dcache(2-way associate), and TX39 has no High Memory support till
now,  so it is safe to use Index cache instuction with KSEG0 address
assuming no cache alias nor High Memory under 4KB page size on MIPS32

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/mm/c-tx39.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c
index 03dfbb40ec73..c7c3dbfe7756 100644
--- a/arch/mips/mm/c-tx39.c
+++ b/arch/mips/mm/c-tx39.c
@@ -170,6 +170,7 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t *pmdp;
 	pte_t *ptep;
+	unsigned long vaddr = phys_to_virt(pfn_to_phys(pfn));
 
 	/*
 	 * If ownes no valid ASID yet, cannot possibly have gotten
@@ -207,11 +208,14 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
 	/*
 	 * Do indexed flush, too much work to get the (possible) TLB refills
 	 * to work correctly.
+	 *
+	 * Assuming that tx39 family do not support high memory, nor has
+	 * dcache alias, vaddr can index dcache directly and correctly
 	 */
-	if (cpu_has_dc_aliases || exec)
-		tx39_blast_dcache_page_indexed(page);
-	if (exec)
-		tx39_blast_icache_page_indexed(page);
+	if (exec) {
+		tx39_blast_dcache_page_indexed(vaddr);
+		tx39_blast_icache_page_indexed(vaddr);
+	}
 }
 
 static void local_tx39_flush_data_cache_page(void * addr)
-- 
2.20.1

