Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B83E3E3404
	for <lists+linux-mips@lfdr.de>; Sat,  7 Aug 2021 10:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbhHGIEz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 7 Aug 2021 04:04:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33616 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231543AbhHGIEz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 7 Aug 2021 04:04:55 -0400
Received: from ambrosehua-HP-xw6600-Workstation.lan (unknown [125.69.44.6])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH0KNPg5h_bEsAA--.26836S2;
        Sat, 07 Aug 2021 16:04:34 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        linux-rt-users@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH] MIPS: simplify copy_user_high_page for MIPS64 w/o cache alias
Date:   Sat,  7 Aug 2021 16:04:29 +0800
Message-Id: <20210807080429.3323711-1-huangpei@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH0KNPg5h_bEsAA--.26836S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF17AF1UKFWUKr1UGr1Dtrb_yoW8ur13pF
        43Gw45KrWFgrW7C3Z3Xwsrury3Jas2yay8XF47Ka4Y9wnxWFy3XF1fXFW0qF1YqrWkGa15
        W3yqgay5GF1Du3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
        MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
        VFxhVjvjDU0xZFpf9x0JUhdbbUUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Borrow from ARM64

MIPS64 CPU has enough direct mapped memory space to access all
physical memory. In case of no cache alias, bypass both k*map_atomic
and k*map_coherent for better real-time performance.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/mm/init.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 19347dc6bbf8..1f5bdd18ae7c 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -171,22 +171,35 @@ void copy_user_highpage(struct page *to, struct page *from,
 {
 	void *vfrom, *vto;
 
-	vto = kmap_atomic(to);
-	if (cpu_has_dc_aliases &&
-	    page_mapcount(from) && !Page_dcache_dirty(from)) {
-		vfrom = kmap_coherent(from, vaddr);
+	if (IS_ENABLED(CONFIG_64BIT) && !cpu_has_dc_aliases) {
+		vfrom = page_address(from);
+		vto   = page_address(to);
 		copy_page(vto, vfrom);
-		kunmap_coherent();
+		/*
+		 * even without cache alias, still need to maintain
+		 * coherence between icache and dcache
+		 */
+		if (!cpu_has_ic_fills_f_dc)
+			flush_data_cache_page((unsigned long)vto);
+
 	} else {
-		vfrom = kmap_atomic(from);
-		copy_page(vto, vfrom);
-		kunmap_atomic(vfrom);
+		vto = kmap_atomic(to);
+		if (cpu_has_dc_aliases &&
+				page_mapcount(from) && !Page_dcache_dirty(from)) {
+			vfrom = kmap_coherent(from, vaddr);
+			copy_page(vto, vfrom);
+			kunmap_coherent();
+		} else {
+			vfrom = kmap_atomic(from);
+			copy_page(vto, vfrom);
+			kunmap_atomic(vfrom);
+		}
+		if ((!cpu_has_ic_fills_f_dc) ||
+				pages_do_alias((unsigned long)vto, vaddr & PAGE_MASK))
+			flush_data_cache_page((unsigned long)vto);
+		kunmap_atomic(vto);
+		/* Make sure this page is cleared on other CPU's too before using it */
 	}
-	if ((!cpu_has_ic_fills_f_dc) ||
-	    pages_do_alias((unsigned long)vto, vaddr & PAGE_MASK))
-		flush_data_cache_page((unsigned long)vto);
-	kunmap_atomic(vto);
-	/* Make sure this page is cleared on other CPU's too before using it */
 	smp_wmb();
 }
 
-- 
2.25.1

