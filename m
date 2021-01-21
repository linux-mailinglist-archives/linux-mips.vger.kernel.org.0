Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210022FE21A
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 06:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbhAUDcA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Jan 2021 22:32:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52118 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387713AbhAUBgV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Jan 2021 20:36:21 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxS+Qb2ghg7lgIAA--.13363S2;
        Thu, 21 Jan 2021 09:34:19 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 1/2] MIPS: mm: Add prototype for function __update_cache
Date:   Thu, 21 Jan 2021 09:34:34 +0800
Message-Id: <20210121013435.450471-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxS+Qb2ghg7lgIAA--.13363S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4kWF13ZryUWFyDZw1DZFb_yoW8XF4xpF
        ZrC3Z7JrW5Ww1IyFy5Ar9Fvr4fJa98Kayav3y2yry0v3Wag3W8XF93Gwn8Ary8XFWvya1x
        urWYqry5Xr4Syr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
        0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdb18UUU
        UU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds a prototype to fix error at W=1:

arch/mips/mm/cache.c:129:6: error: no previous prototype
for '__update_cache' [-Werror=missing-prototypes]

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/include/asm/pgtable.h | 2 +-
 arch/mips/mm/cache.c            | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 4d3ab682d093..804889b70965 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -64,6 +64,7 @@ struct vm_area_struct;
 #define __S111 __pgprot(0)
 
 extern unsigned long _page_cachable_default;
+extern void __update_cache(unsigned long address, pte_t pte);
 
 /*
  * ZERO_PAGE is a global shared page that is always zero; used
@@ -224,7 +225,6 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
 static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep, pte_t pteval)
 {
-	extern void __update_cache(unsigned long address, pte_t pte);
 
 	if (!pte_present(pteval))
 		goto cache_sync_done;
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 23b16bfd97b2..27f4228dd24e 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -21,6 +21,7 @@
 #include <asm/cpu.h>
 #include <asm/cpu-features.h>
 #include <asm/setup.h>
+#include <asm/pgtable.h>
 
 /* Cache operations. */
 void (*flush_cache_all)(void);
-- 
2.27.0

