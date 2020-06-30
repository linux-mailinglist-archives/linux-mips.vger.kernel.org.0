Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E216320EA90
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 02:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgF3A67 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jun 2020 20:58:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55686 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726175AbgF3A67 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Jun 2020 20:58:59 -0400
Received: from localhost.localdomain (unknown [61.148.244.181])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD2hJjvpekrVMAA--.366S2;
        Tue, 30 Jun 2020 08:58:54 +0800 (CST)
From:   Lichao Liu <liulichao@loongson.cn>
To:     tsbogend@alpha.franken.de, yuanjunqing@loongson.cn,
        chenhc@lemote.com, jiaxun.yang@flygoat.com
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lichao Liu <liulichao@loongson.cn>
Subject: [PATCH] MIPS: Grant pte read permission, even if vma only have VM_WRITE permission.
Date:   Tue, 30 Jun 2020 08:58:45 +0800
Message-Id: <20200630005845.1239974-1-liulichao@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD2hJjvpekrVMAA--.366S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur48Aw1fuF15Zry3Kr1UAwb_yoWrGr4xpa
        4kCryxArWaqry7Zry7Zw17Zw4rAa9IqFW8Xw1Uu3W5ua1fWryktrZIka92va4Du393Cw4U
        Zw4UXr45uw4av37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUka14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
        4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_twCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUr73kUUUUU=
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Background:
a cpu have RIXI feature.

Now, if a vma only have VM_WRITE permission, the vma->vm_page_prot will
set _PAGE_NO_READ. In general case, someone read the vma will trigger
RI exception, then do_page_fault will handle it.

But in the following scene, program will hang.

example scene(a trinity test case):
futex_wake_op() will read uaddr, which is passed from user space.
If a program mmap a vma, which only have VM_WRITE permission,
then call futex, and use an address belonging to the vma as uaddr
argument. futex_wake_op() will read the address after disable
pagefault and set correct __ex_table(return -14 directly),
do_page_fault will find the correct __ex_table, and then return -14.
Then futex_wake_op() will try to fixup this error by call
fault_in_user_writeable(), because the pte have write permission,
so handle_mm_fault will do nothing, and return success.
But the RI bit in pte and tlb entry still exsits.
The program will deadloop:
do_page_fault -> find __ex_table success -> return -14;
futex_wake_op -> call fault_in_user_writeable() to fix the error -> retry;
do_page_fault -> find __ex_table success -> return -14;
futex_wake_op -> call fault_in_user_writeable() to fix the error -> retry;
.....

The first perspective of root cause:
Futex think a pte have write permission will have read permission.
When page fault, it only try to fixup with FAULT_FLAG_WRITE.

The second perspective of root cause:
MIPS platform doesn't grant pte read permission, if vma only have
VM_WRITE permission.But X86 and arm64 will.

Most of the architecture will grant pte read permission, even if
the vma only have VM_WRITE permission.
And if the cpu doesn't have RIXI feature, MIPS platform will
grant pte read permission by set _PAGE_READ.
So I think we should fixup thix problem by grant pte read permission,
even if vma only have VM_WRITE permission.

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

