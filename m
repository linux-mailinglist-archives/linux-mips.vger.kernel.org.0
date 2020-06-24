Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0705F206FF7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 11:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389192AbgFXJ0t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 05:26:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34790 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728637AbgFXJ0t (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 05:26:49 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxNupIHPNe6zFJAA--.493S4;
        Wed, 24 Jun 2020 17:26:33 +0800 (CST)
From:   Bibo Mao <maobibo@loongson.cn>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH 3/3] MIPS: Do not call flush_tlb_all when setting pmd entry
Date:   Wed, 24 Jun 2020 17:26:32 +0800
Message-Id: <1592990792-1923-3-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
References: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
X-CM-TRANSID: AQAAf9AxNupIHPNe6zFJAA--.493S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uFykXr17tF1fAw4xWFyxGrg_yoW8Gw1fpr
        srC3Wvqr45Z348t34rZr9Ygr1ayFs5tFW5KF1UAa45X3W5WF1kKF93J348JFy8WrWSk395
        Wr4YqFy5J3yxA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBjb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280
        aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
        Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
        6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVCm-wCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
        6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jca9-UUUUU=
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

