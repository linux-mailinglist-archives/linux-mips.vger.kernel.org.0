Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749E12DA758
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 06:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgLOFIN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 00:08:13 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55824 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725960AbgLOFIM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Dec 2020 00:08:12 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax2cmPRNhf9IUAAA--.1409S2;
        Tue, 15 Dec 2020 13:07:27 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wei Li <liwei391@huawei.com>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: No need to check CPU 0 in cps_cpu_disable()
Date:   Tue, 15 Dec 2020 13:07:26 +0800
Message-Id: <1608008846-27206-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Ax2cmPRNhf9IUAAA--.1409S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1UXFW3ArW3CF4kGw1xKrg_yoWktFgEkr
        WfAr1kGr1rAw1avr93Wr4SgFy5J34SgFWY9w1Iq34jy3y7Jr1kZayDJFW5Xrn5WFZavFWS
        qan8ur4vgF129jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GrWl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeHUDDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 9cce844abf07 ("MIPS: CPU#0 is not hotpluggable"),
c->hotpluggable is 0 for CPU 0 and it will not generate a control
file in sysfs for this CPU:

[root@linux loongson]# cat /sys/devices/system/cpu/cpu0/online
cat: /sys/devices/system/cpu/cpu0/online: No such file or directory
[root@linux loongson]# echo 0 > /sys/devices/system/cpu/cpu0/online
bash: /sys/devices/system/cpu/cpu0/online: Permission denied

So no need to check CPU 0 in cps_cpu_disable(), just remove it.

Reported-by: liwei (GF) <liwei391@huawei.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

cps_cpu_disable() is not done in the early similar patch,
sorry for that.

 arch/mips/kernel/smp-cps.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 8b027c7..bcd6a94 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -451,9 +451,6 @@ static int cps_cpu_disable(void)
 	unsigned cpu = smp_processor_id();
 	struct core_boot_config *core_cfg;
 
-	if (!cpu)
-		return -EBUSY;
-
 	if (!cps_pm_support_state(CPS_PM_POWER_GATED))
 		return -EINVAL;
 
-- 
2.1.0

