Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC411FF007
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2020 12:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgFRK5N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Jun 2020 06:57:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41896 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727037AbgFRK5M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Jun 2020 06:57:12 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_2p4SOteeDZGAA--.8839S2;
        Thu, 18 Jun 2020 18:56:57 +0800 (CST)
From:   Bibo Mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Silsby <dansilsby@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: Do not flush tlb when setting pmd entry
Date:   Thu, 18 Jun 2020 18:56:55 +0800
Message-Id: <1592477815-836-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dx_2p4SOteeDZGAA--.8839S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFykXr17tF1fAw4xWFyxGrg_yoW8XF47pr
        srC3Wvqr45Z348tryruryvgr1ayF4ktFW5KF1UAa45X3W5WF1kKF93J34UJF18XrWfC395
        WF4YqFy5JrWxA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
        3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
        WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
        k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8IzuJUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Function set_pmd_at is to set pmd entry, if tlb entry need to
be flushed, there exists pmdp_huge_clear_flush alike function
before set_pmd_at is called. So it is not necessary to call
flush_tlb_all in this function.

In these scenarios, tlb for the pmd range needs to be flushed:
1. privilege degrade such as wrprotect is set on the pmd entry
2. pmd entry is cleared
3. there is exception if set_pmd_at is issued by dup_mmap, since
flush_tlb_mm is called for parent process, it is not necessary
to flush tlb in function copy_huge_pmd.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
v2:
- add the same operation on mips32 system
- update changelog description
---
 arch/mips/mm/pgtable-32.c | 1 -
 arch/mips/mm/pgtable-64.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/mm/pgtable-32.c b/arch/mips/mm/pgtable-32.c
index bd4b065..61891af 100644
--- a/arch/mips/mm/pgtable-32.c
+++ b/arch/mips/mm/pgtable-32.c
@@ -45,7 +45,6 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		pmd_t *pmdp, pmd_t pmd)
 {
 	*pmdp = pmd;
-	flush_tlb_all();
 }
 #endif /* defined(CONFIG_TRANSPARENT_HUGEPAGE) */
 
diff --git a/arch/mips/mm/pgtable-64.c b/arch/mips/mm/pgtable-64.c
index 183ff9f..7536f78 100644
--- a/arch/mips/mm/pgtable-64.c
+++ b/arch/mips/mm/pgtable-64.c
@@ -100,7 +100,6 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		pmd_t *pmdp, pmd_t pmd)
 {
 	*pmdp = pmd;
-	flush_tlb_all();
 }
 
 void __init pagetable_init(void)
-- 
1.8.3.1

