Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E54403607
	for <lists+linux-mips@lfdr.de>; Wed,  8 Sep 2021 10:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348066AbhIHIYz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Sep 2021 04:24:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47932 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240561AbhIHIYx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Sep 2021 04:24:53 -0400
Received: from localhost.localdomain (unknown [89.187.161.160])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxdObycjhhWo4BAA--.1985S3;
        Wed, 08 Sep 2021 16:23:42 +0800 (CST)
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
Date:   Wed,  8 Sep 2021 16:22:24 +0800
Message-Id: <20210908082224.922157-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908082224.922157-1-huangpei@loongson.cn>
References: <20210908082224.922157-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxdObycjhhWo4BAA--.1985S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WF17tF47XFWxGw4xury5XFb_yoW8ZF1rpF
        47Gw45KrWFgrW7C3ZxX39rur13Jas2yay8XF47Ka4Y9wnIgF13WF1rJFWxXF1YqFWkGa15
        W3yqgay5WFn8u3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU86wZUUUU
        U
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Borrow from ARM64

MIPS64 CPU has enough direct mapped memory space to access all
physical memory. In case of no cache alias, bypass both kmap_atomic
and kmap_coherent for better real-time performance.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/mm/init.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 19347dc6bbf8..d9923fd9ed3b 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -171,21 +171,34 @@ void copy_user_highpage(struct page *to, struct page *from,
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
+		    page_mapcount(from) && !Page_dcache_dirty(from)) {
+			vfrom = kmap_coherent(from, vaddr);
+			copy_page(vto, vfrom);
+			kunmap_coherent();
+		} else {
+			vfrom = kmap_atomic(from);
+			copy_page(vto, vfrom);
+			kunmap_atomic(vfrom);
+		}
+		if ((!cpu_has_ic_fills_f_dc) ||
+		      pages_do_alias((unsigned long)vto, vaddr & PAGE_MASK))
+			flush_data_cache_page((unsigned long)vto);
+		kunmap_atomic(vto);
 	}
-	if ((!cpu_has_ic_fills_f_dc) ||
-	    pages_do_alias((unsigned long)vto, vaddr & PAGE_MASK))
-		flush_data_cache_page((unsigned long)vto);
-	kunmap_atomic(vto);
 	/* Make sure this page is cleared on other CPU's too before using it */
 	smp_wmb();
 }
-- 
2.25.1

