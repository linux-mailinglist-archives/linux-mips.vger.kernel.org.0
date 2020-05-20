Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E39D1DA9AD
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 07:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgETFMn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 01:12:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:32966 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726439AbgETFMn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 01:12:43 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv2tGvMRe2Nc2AA--.105S2;
        Wed, 20 May 2020 13:12:38 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: SGI-IP27: Remove not used includes and comment in ip27-timer.c
Date:   Wed, 20 May 2020 13:12:37 +0800
Message-Id: <1589951557-21800-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxv2tGvMRe2Nc2AA--.105S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gry3Xw1kCw47CF1xKw13CFg_yoWDAFXEkw
        4akw4UW34rZr43A3ZxWwn3A3WYvw17J3WxZrnYvFnIya4DJFyUWw48t34DArWY9anY9r4F
        9F4jyry8CwsxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4r
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUOnmRUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 0ce5ebd24d25 ("mfd: ioc3: Add driver for SGI IOC3 chip"),
the related includes and comment about ioc3 are not used any more in
ip27-timer.c, remove them.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/sgi-ip27/ip27-timer.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 11ffb3e..115b1d9 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -21,7 +21,6 @@
 #include <asm/time.h>
 #include <asm/pgtable.h>
 #include <asm/sgialib.h>
-#include <asm/sn/ioc3.h>
 #include <asm/sn/klconfig.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/addrs.h>
@@ -31,10 +30,6 @@
 
 #define TICK_SIZE (tick_nsec / 1000)
 
-/* Includes for ioc3_init().  */
-#include <asm/sn/types.h>
-#include <asm/pci/bridge.h>
-
 static int rt_next_event(unsigned long delta, struct clock_event_device *evt)
 {
 	unsigned int cpu = smp_processor_id();
-- 
2.1.0

