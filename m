Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856272B8C9F
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 08:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgKSHxM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 02:53:12 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35090 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726096AbgKSHxJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 02:53:09 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxutBdJLZf7JcSAA--.29651S4;
        Thu, 19 Nov 2020 15:53:03 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 2/2] MIPS: Loongson64: Fix wrong scache size when execute lscpu
Date:   Thu, 19 Nov 2020 15:53:01 +0800
Message-Id: <1605772381-25535-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1605772381-25535-1-git-send-email-yangtiezhu@loongson.cn>
References: <1605772381-25535-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9AxutBdJLZf7JcSAA--.29651S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WF4UtF13Gr43WryDWw48Zwb_yoW8uFyUpr
        W7Zas7Jr48uw17Crs8uFW8WFWrAr98Jas7Xay2yryUC398Zr1UXr4kXFWYkFW7ZFWrAF4S
        9r9rXrs7CF4j9aDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUU1rW3UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As the user manual and code comment said, Loongson-3 has 4-scache banks,
while Loongson-2K has only 2 banks, so we should multiply the number of
scache banks, this multiply operation should be done by c->scache.sets
instead of scache_size, otherwise we will get the wrong scache size when
execute lscpu. For example, the scache size should be 8192K instead of
2048K on the Loongson 3A3000 and 3A4000 platform, we can see the related
info in the following boot message:

[loongson@linux ~]$ dmesg | grep "Unified secondary cache"
[    0.000000] Unified secondary cache 8192kB 16-way, linesize 64 bytes.
[    4.061909] Unified secondary cache 8192kB 16-way, linesize 64 bytes.
[    4.125629] Unified secondary cache 8192kB 16-way, linesize 64 bytes.
[    4.188379] Unified secondary cache 8192kB 16-way, linesize 64 bytes.

E.g. without this patch:

[loongson@linux ~]$ cat /sys/devices/system/cpu/cpu*/cache/index2/size
2048K
2048K
2048K
2048K
[loongson@linux ~]$ lscpu | grep "L2 cache"
L2 cache:              2048K

With this patch:

[loongson@linux ~]$ cat /sys/devices/system/cpu/cpu*/cache/index2/size
8192K
8192K
8192K
8192K
[loongson@linux ~]$ lscpu | grep "L2 cache"
L2 cache:              8192K

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/mm/c-r4k.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 9cede7c..9952176 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1623,15 +1623,13 @@ static void __init loongson3_sc_init(void)
 	c->scache.sets = 64 << ((config2 >> 8) & 15);
 	c->scache.ways = 1 + (config2 & 15);
 
-	scache_size = c->scache.sets *
-				  c->scache.ways *
-				  c->scache.linesz;
-
 	/* Loongson-3 has 4-Scache banks, while Loongson-2K have only 2 banks */
 	if ((c->processor_id & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R)
-		scache_size *= 2;
+		c->scache.sets *= 2;
 	else
-		scache_size *= 4;
+		c->scache.sets *= 4;
+
+	scache_size = c->scache.sets * c->scache.ways * c->scache.linesz;
 
 	c->scache.waybit = 0;
 	c->scache.waysize = scache_size / c->scache.ways;
-- 
2.1.0

