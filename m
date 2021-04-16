Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61C0361D1B
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 12:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241635AbhDPJUt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 16 Apr 2021 05:20:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51438 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241632AbhDPJUs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Apr 2021 05:20:48 -0400
Received: from [127.0.0.1] (unknown [119.4.252.85])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8vBVnlgGakIAA--.8853S2;
        Fri, 16 Apr 2021 17:20:04 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-Mailer: BlackBerry Email (10.3.3.3216)
Message-ID: <20210416092003.5754967.19768.9603@loongson.cn>
Date:   Fri, 16 Apr 2021 17:20:03 +0800
Subject: Re: [PATCH] Revert "MIPS: make userspace mapping young by default".
From:   =?utf-8?b?6buE5rKb?= <huangpei@loongson.cn>
In-Reply-To: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1618562868-91115-1-git-send-email-zhouyanjie@wanyeetech.com>
To:     =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, paul.burton@mips.com,
        paul@crapouillou.net, siyanteng@loongson.cn, ira.weiny@intel.com,
        yangtiezhu@loongson.cn, zhouyanjie@wanyeetech.com,
        jun.jiang@ingenic.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com
X-CM-TRANSID: AQAAf9Dxj8vBVnlgGakIAA--.8853S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw4kJw1kKw4kWFyrGF13XFb_yoW5tF4kpa
        s7Ca4xCrWaq343JryxGw47Aw4rCwsrt3WUXr9ru3WUua97X34kKFnIkry8Zry8ZFZ0yryU
        ZFyUXrs8Ga47CrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjfUeLvtDUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Is there any log about the panic?

  Original Message  
From: 周琰杰 (Zhou Yanjie)
Sent: 2021年4月16日星期五 16:48
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org; linux-kernel@vger.kernel.org; akpm@linux-foundation.org; paul.burton@mips.com; paul@crapouillou.net; siyanteng@loongson.cn; huangpei@loongson.cn; ira.weiny@intel.com; yangtiezhu@loongson.cn; zhouyanjie@wanyeetech.com; jun.jiang@ingenic.com; dongsheng.qiu@ingenic.com; aric.pzqi@ingenic.com; rick.tyliu@ingenic.com; sernia.zhou@foxmail.com
Subject: [PATCH] Revert "MIPS: make userspace mapping young by default".

This reverts commit f685a533a7fab35c5d069dcd663f59c8e4171a75.

It cause kernel panic on Ingenic X1830, so let's revert it.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
arch/mips/mm/cache.c | 31 ++++++++++++++-----------------
1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 7719d63..9cfd432 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -21,7 +21,6 @@
#include <asm/cpu.h>
#include <asm/cpu-features.h>
#include <asm/setup.h>
-#include <asm/pgtable.h>

/* Cache operations. */
void (*flush_cache_all)(void);
@@ -157,31 +156,29 @@ unsigned long _page_cachable_default;
EXPORT_SYMBOL(_page_cachable_default);

#define PM(p)	__pgprot(_page_cachable_default | (p))
-#define PVA(p)	PM(_PAGE_VALID | _PAGE_ACCESSED | (p))

static inline void setup_protection_map(void)
{
protection_map[0] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[1] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[2] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[3] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[4] = PVA(_PAGE_PRESENT);
-	protection_map[5] = PVA(_PAGE_PRESENT);
-	protection_map[6] = PVA(_PAGE_PRESENT);
-	protection_map[7] = PVA(_PAGE_PRESENT);
+	protection_map[1] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[2] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[3] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[4] = PM(_PAGE_PRESENT);
+	protection_map[5] = PM(_PAGE_PRESENT);
+	protection_map[6] = PM(_PAGE_PRESENT);
+	protection_map[7] = PM(_PAGE_PRESENT);

protection_map[8] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-	protection_map[9] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC);
-	protection_map[10] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
+	protection_map[9] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
_PAGE_NO_READ);
-	protection_map[11] = PVA(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
-	protection_map[12] = PVA(_PAGE_PRESENT);
-	protection_map[13] = PVA(_PAGE_PRESENT);
-	protection_map[14] = PVA(_PAGE_PRESENT);
-	protection_map[15] = PVA(_PAGE_PRESENT);
+	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
+	protection_map[12] = PM(_PAGE_PRESENT);
+	protection_map[13] = PM(_PAGE_PRESENT);
+	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
+	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
}

-#undef _PVA
#undef PM

void cpu_cache_init(void)
-- 
2.7.4

