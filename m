Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534341E04F6
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 04:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388739AbgEYCxY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 May 2020 22:53:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40800 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388398AbgEYCxX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 May 2020 22:53:23 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj974MsteoL84AA--.426S5;
        Mon, 25 May 2020 10:52:42 +0800 (CST)
From:   Bibo Mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: [PATCH v6 4/4] MIPS: mm: add page valid judgement in function pte_modify
Date:   Mon, 25 May 2020 10:52:40 +0800
Message-Id: <1590375160-6997-4-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj974MsteoL84AA--.426S5
X-Coremail-Antispam: 1UD129KBjvdXoWrtFW8AryxtFWfuw43ur4DJwb_yoWDWwbEkw
        47Zw4fCr95JF13uFW7A3Z5Jry2ga4Uu3Wqva4xJw1ayFyqgr45CFW8WryUArZ8uFsFyr40
        qa95G347CF47KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbgxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r1rM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CE
        w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6x
        kF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
        aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
        1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
        5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZV
        WrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
        1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
        v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
        07j138nUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If original PTE has _PAGE_ACCESSED bit set, and new pte has no
_PAGE_NO_READ bit set, we can add _PAGE_SILENT_READ bit to enable
page valid bit.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/mips/include/asm/pgtable.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 0743087..dfe79f4 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -529,8 +529,11 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #else
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
-	return __pte((pte_val(pte) & _PAGE_CHG_MASK) |
-		     (pgprot_val(newprot) & ~_PAGE_CHG_MASK));
+	pte_val(pte) &= _PAGE_CHG_MASK;
+	pte_val(pte) |= pgprot_val(newprot) & ~_PAGE_CHG_MASK;
+	if ((pte_val(pte) & _PAGE_ACCESSED) && !(pte_val(pte) & _PAGE_NO_READ))
+		pte_val(pte) |= _PAGE_SILENT_READ;
+	return pte;
 }
 #endif
 
-- 
1.8.3.1

