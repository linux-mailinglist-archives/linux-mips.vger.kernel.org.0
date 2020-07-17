Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BD72238C8
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 11:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgGQJzv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 05:55:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43444 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726557AbgGQJzt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Jul 2020 05:55:49 -0400
Received: from localhost.localdomain (unknown [124.64.17.181])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb2eZdRFfU1YAAA--.393S2;
        Fri, 17 Jul 2020 17:55:44 +0800 (CST)
From:   Lichao Liu <liulichao@loongson.cn>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, Lichao Liu <liulichao@loongson.cn>
Subject: [PATCH] MIPS: Grant pte read permission, even if vma only have VM_WRITE permission.
Date:   Fri, 17 Jul 2020 17:55:36 +0800
Message-Id: <20200717095536.45011-1-liulichao@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb2eZdRFfU1YAAA--.393S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr13XrWxtF1UAw15XFWxtFb_yoW8Cw47pa
        s7C34xA3yaqry3AryxZwnrAw4rCFsFqFyjqw1UC3W5Z3yfZ34ktrn8CF97ZryDua9akw40
        v3WUXr4rWan2vrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If a page can be written, then it can definitely be read.

Signed-off-by: Lichao Liu <liulichao@loongson.cn>
---
 arch/mips/mm/cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index ad6df1cea866..72b60c44a962 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -160,7 +160,7 @@ static inline void setup_protection_map(void)
 	if (cpu_has_rixi) {
 		protection_map[0]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
 		protection_map[1]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[2]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+		protection_map[2]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
 		protection_map[3]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
 		protection_map[4]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
 		protection_map[5]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
@@ -169,7 +169,7 @@ static inline void setup_protection_map(void)
 
 		protection_map[8]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
 		protection_map[9]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[10] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE | _PAGE_NO_READ);
+		protection_map[10] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
 		protection_map[11] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
 		protection_map[12] = __pgprot(_page_cachable_default | _PAGE_PRESENT);
 		protection_map[13] = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-- 
2.25.1

