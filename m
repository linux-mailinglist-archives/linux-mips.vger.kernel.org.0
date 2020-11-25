Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A55662C3D66
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 11:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbgKYKLj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 05:11:39 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39664 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728940AbgKYKLj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Nov 2020 05:11:39 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxStDTLb5fEIAWAA--.36103S2;
        Wed, 25 Nov 2020 18:11:31 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: No need to check CPU 0 in {loongson3,bmips,octeon}_cpu_disable()
Date:   Wed, 25 Nov 2020 18:11:30 +0800
Message-Id: <1606299090-14013-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxStDTLb5fEIAWAA--.36103S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4ruw47Gw45JFyDXrW7XFb_yoW8ZF1xpw
        40y3WDtrW0gF1UAasYkry8XrWUAFn8G3yfCayjk3y5Zas8Xr1jvFn3t3WrXry8WFWF9a4F
        9FyFvr48Ka1xCw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUgXocUUUUU=
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

So no need to check CPU 0 in {loongson3,bmips,octeon}_cpu_disable(),
just remove them.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/cavium-octeon/smp.c | 3 ---
 arch/mips/kernel/smp-bmips.c  | 3 ---
 arch/mips/loongson64/smp.c    | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
index 076db9a..66ce552 100644
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -290,9 +290,6 @@ static int octeon_cpu_disable(void)
 {
 	unsigned int cpu = smp_processor_id();
 
-	if (cpu == 0)
-		return -EBUSY;
-
 	if (!octeon_bootloader_entry_addr)
 		return -ENOTSUPP;
 
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 1dbfb5a..359b176 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -362,9 +362,6 @@ static int bmips_cpu_disable(void)
 {
 	unsigned int cpu = smp_processor_id();
 
-	if (cpu == 0)
-		return -EBUSY;
-
 	pr_info("SMP: CPU%d is offline\n", cpu);
 
 	set_cpu_online(cpu, false);
diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index aa0cd72..b8c1fc3 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -544,9 +544,6 @@ static int loongson3_cpu_disable(void)
 	unsigned long flags;
 	unsigned int cpu = smp_processor_id();
 
-	if (cpu == 0)
-		return -EBUSY;
-
 	set_cpu_online(cpu, false);
 	calculate_cpu_foreign_map();
 	local_irq_save(flags);
-- 
2.1.0

