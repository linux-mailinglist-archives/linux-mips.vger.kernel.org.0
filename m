Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9AD43D0768
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhGUDDT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 23:03:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44832 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231363AbhGUDDS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 23:03:18 -0400
Received: from ambrosehua-HP-xw6600-Workstation.lan (unknown [222.209.8.152])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxquDnl_dglzMiAA--.20549S2;
        Wed, 21 Jul 2021 11:43:48 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH] MIPS: check return value of pgtable_pmd_page_ctor
Date:   Wed, 21 Jul 2021 11:43:35 +0800
Message-Id: <20210721034335.2015914-1-huangpei@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxquDnl_dglzMiAA--.20549S2
X-Coremail-Antispam: 1UD129KBjvJXoWrur1UAF4fXw4fAw1UKw1UAwb_yoW8JryrpF
        s3CFWkW3y5G34rWa43JrsY9r43J395GayktFW2934Sq3ZxWF1IqF97J3srZF45XFZ5JF4f
        urWSqF47Gr4ayw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUjQBMtUUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+. According to Documentation/vm/split_page_table_lock, handle failure
of pgtable_pmd_page_ctor

+. use GFP_KERNEL_ACCOUNT instead of GFP_KERNEL|__GFP_ACCOUNT

Reported-by: Joshua Kinard <kumba@gentoo.org>
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/include/asm/pgalloc.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index d0cf997b4ba8..5c9597a6c60c 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -62,11 +62,15 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 	pmd_t *pmd = NULL;
 	struct page *pg;
 
-	pg = alloc_pages(GFP_KERNEL | __GFP_ACCOUNT, PMD_ORDER);
+	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
 	if (pg) {
-		pgtable_pmd_page_ctor(pg);
-		pmd = (pmd_t *)page_address(pg);
-		pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
+		if(pgtable_pmd_page_ctor(pg)) {
+			pmd = (pmd_t *)page_address(pg);
+			pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
+		} else {
+			__free_pages(pg, PMD_ORDER);
+		}
+
 	}
 	return pmd;
 }
-- 
2.25.1

