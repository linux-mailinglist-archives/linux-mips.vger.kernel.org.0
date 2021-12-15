Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77E5475475
	for <lists+linux-mips@lfdr.de>; Wed, 15 Dec 2021 09:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240890AbhLOIpX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Dec 2021 03:45:23 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38808 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240892AbhLOIpU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Dec 2021 03:45:20 -0500
Received: from localhost.localdomain (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxrNwUq7lh0P4AAA--.1916S4;
        Wed, 15 Dec 2021 16:45:14 +0800 (CST)
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
Subject: [PATCH 2/4] MIPS: tx39: adjust tx39_flush_cache_page
Date:   Wed, 15 Dec 2021 16:44:58 +0800
Message-Id: <20211215084500.24444-3-huangpei@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215084500.24444-1-huangpei@loongson.cn>
References: <20211215084500.24444-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxrNwUq7lh0P4AAA--.1916S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1xCrW8XFW3uF1DAw1fZwb_yoW8Cr4Dp3
        yUAwn7K3y8Wr4Duay3X39rtw1Fg34DtFW0va17KryYv3W5XF1DKrn5Gw15KF15ArZYvay7
        uw4UAr1UZan5Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUjCzuDUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Indexed cache operation actually uses KSEG0/CKSEG0 (AKA physical
address, see INDEX_BASE in arch/mips/include/asm/r4kcache.h) to
index cache line, so it CAN NOT handle cache alias(cache alias
is first introduced into MIPS by R4000, indexing cache line with
virtual address).

It is said, on "32-Bit TX System TX39 Family TMPR3911/3912", P86,

•Translation Look-aside Buffer (TLB) (4 Kbyte Page size, 32 Entries)
•4Kbyte instruction cache (I-cache)
	•16 bytes (4 words) per line (256 lines total)
	•physical address tag per cache line
	•single valid bit per cache line
	•direct-mapped
•1 Kbyte data cache (D-cache)
	•4bytes (1 word) per line (128 lines total)
	•physical address tag per cache line
	•write-through
	•two-way set associate

We can assume there is NO cache alias on TX39's R3900 core

Anyway, remove checking for cpu_has_dc_aliases, since tx39_*indexed
can not index cache alias, nor there is cache alias on R3900

More info about TX3911/3912, see
https://pdf1.alldatasheet.com/datasheet-pdf/view/211951/TOSHIBA/TMPR
3912.html

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/mm/c-tx39.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c
index 03dfbb40ec73..c2ecdde0371d 100644
--- a/arch/mips/mm/c-tx39.c
+++ b/arch/mips/mm/c-tx39.c
@@ -207,11 +207,12 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
 	/*
 	 * Do indexed flush, too much work to get the (possible) TLB refills
 	 * to work correctly.
+	 *
 	 */
-	if (cpu_has_dc_aliases || exec)
+	if (exec) {
 		tx39_blast_dcache_page_indexed(page);
-	if (exec)
 		tx39_blast_icache_page_indexed(page);
+	}
 }
 
 static void local_tx39_flush_data_cache_page(void * addr)
-- 
2.20.1

