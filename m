Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2633D0830
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 07:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbhGUEkM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Jul 2021 00:40:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59986 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232866AbhGUEkK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Jul 2021 00:40:10 -0400
Received: from ambrosehua-HP-xw6600-Workstation.lan (unknown [222.209.8.152])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH0KarvdgQjoiAA--.15821S3;
        Wed, 21 Jul 2021 13:20:32 +0800 (CST)
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
Date:   Wed, 21 Jul 2021 13:20:23 +0800
Message-Id: <20210721052023.2111877-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721052023.2111877-1-huangpei@loongson.cn>
References: <20210721052023.2111877-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH0KarvdgQjoiAA--.15821S3
X-Coremail-Antispam: 1UD129KBjvJXoW7urW5CrWxWw1UAw4xZr1UZFb_yoW8Jw48pF
        n3CFWkX3y5KryrWa43Jrsagr43J395GayktFW293saq3ZrWF1IqrWktw1DZF45ZFZ5JF4f
        urWagFs8Gr4ayaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfU1sqXDUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

+. According to Documentation/vm/split_page_table_lock, handle failure
of pgtable_pmd_page_ctor

+. Use GFP_KERNEL_ACCOUNT instead of GFP_KERNEL|__GFP_ACCOUNT

+. Adjust coding style

Reported-by: Joshua Kinard <kumba@gentoo.org>
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/include/asm/pgalloc.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index d0cf997b4ba8..139b4050259f 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -59,15 +59,20 @@ do {							\
 
 static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 {
-	pmd_t *pmd = NULL;
+	pmd_t *pmd;
 	struct page *pg;
 
-	pg = alloc_pages(GFP_KERNEL | __GFP_ACCOUNT, PMD_ORDER);
-	if (pg) {
-		pgtable_pmd_page_ctor(pg);
-		pmd = (pmd_t *)page_address(pg);
-		pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
+	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
+	if (!pg)
+		return NULL;
+
+	if (!pgtable_pmd_page_ctor(pg)) {
+		__free_pages(pg, PMD_ORDER);
+		return NULL;
 	}
+
+	pmd = (pmd_t *)page_address(pg);
+	pmd_init((unsigned long)pmd, (unsigned long)invalid_pte_table);
 	return pmd;
 }
 
-- 
2.25.1

