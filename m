Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924B22B8C9D
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 08:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgKSHxJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 02:53:09 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35082 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726039AbgKSHxJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 02:53:09 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxutBdJLZf7JcSAA--.29651S3;
        Thu, 19 Nov 2020 15:53:02 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 1/2] MIPS: Remove cpu_has_6k_cache and cpu_has_8k_cache in cpu_cache_init()
Date:   Thu, 19 Nov 2020 15:53:00 +0800
Message-Id: <1605772381-25535-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1605772381-25535-1-git-send-email-yangtiezhu@loongson.cn>
References: <1605772381-25535-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9AxutBdJLZf7JcSAA--.29651S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF17GrWxKw1UGryDGFyDKFg_yoW8XFyDpa
        9rCw1kKFWrWrs8Gas3Jr17Jr4fJa4qkayI9w1jkryUZ3Z8uF1UJr4kCF4rZFykJFW0vayf
        uF1Sga4UW3W7C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjwL03UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since commit 02cf2119684e ("Cleanup the mess in cpu_cache_init."),
cpu_has_6k_cache and cpu_has_8k_cache have no user, r6k_cache_init()
and r8k_cache_init() are not defined for over 15 years, just remove
them.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/cpu-features.h |  2 --
 arch/mips/mm/cache.c                 | 10 ----------
 2 files changed, 12 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index f2e216e..336e02b 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -115,8 +115,6 @@
 #ifndef cpu_has_3k_cache
 #define cpu_has_3k_cache	__isa_lt_and_opt(1, MIPS_CPU_3K_CACHE)
 #endif
-#define cpu_has_6k_cache	0
-#define cpu_has_8k_cache	0
 #ifndef cpu_has_4k_cache
 #define cpu_has_4k_cache	__isa_ge_or_opt(1, MIPS_CPU_4K_CACHE)
 #endif
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 3e81ba0..ed99cde 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -203,21 +203,11 @@ void cpu_cache_init(void)
 
 		r3k_cache_init();
 	}
-	if (cpu_has_6k_cache) {
-		extern void __weak r6k_cache_init(void);
-
-		r6k_cache_init();
-	}
 	if (cpu_has_4k_cache) {
 		extern void __weak r4k_cache_init(void);
 
 		r4k_cache_init();
 	}
-	if (cpu_has_8k_cache) {
-		extern void __weak r8k_cache_init(void);
-
-		r8k_cache_init();
-	}
 	if (cpu_has_tx39_cache) {
 		extern void __weak tx39_cache_init(void);
 
-- 
2.1.0

