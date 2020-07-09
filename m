Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776D52196EC
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 05:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgGIDzj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 23:55:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49390 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726245AbgGIDzi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Jul 2020 23:55:38 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxqdQplQZfXJUAAA--.714S4;
        Thu, 09 Jul 2020 11:55:34 +0800 (CST)
From:   Zhi Li <lizhi01@loongson.cn>
To:     chenhc@lemote.com, jiaxun.yang@flygoat.com,
        tsbogend@alpha.franken.de, lixuefeng@loongson.cn
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v3 2/3] MIPS: Loongson: Reduce possible loop times and add log in do_thermal_timer()
Date:   Thu,  9 Jul 2020 11:55:20 +0800
Message-Id: <1594266921-28971-3-git-send-email-lizhi01@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
References: <1594266921-28971-1-git-send-email-lizhi01@loongson.cn>
X-CM-TRANSID: AQAAf9CxqdQplQZfXJUAAA--.714S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw48KFWrur4UKF17Xw48tFb_yoW8GF17pr
        WfG34YvF48Ww4qv3WUtayj9FW3Gw1DKry7uFyxCwnYyan8X3sIqFyUJ3WFyr97GF4rX3W7
        ZrnavFnxua17uF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
        C7MxkF7I0En4kS14v26r126r1DMxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRhXoxUUUUU=
X-CM-SenderInfo: xol2xxqqr6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tiezhu Yang <yangtiezhu@loongson.cn>

Once the temperature of any CPUs is too high, it can power off immediately,
no need to check the rest of CPUs, and it is better to print a log before
power off, this is useful when analysis the abnormal issues.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Zhi Li <lizhi01@loongson.cn>
---
 drivers/platform/mips/cpu_hwmon.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
index fa42b13..c9f35e5 100644
--- a/drivers/platform/mips/cpu_hwmon.c
+++ b/drivers/platform/mips/cpu_hwmon.c
@@ -153,18 +153,17 @@ static struct delayed_work thermal_work;
 
 static void do_thermal_timer(struct work_struct *work)
 {
-	int i, value, temp_max = 0;
+	int i, value;
 
 	for (i = 0; i < nr_packages; i++) {
 		value = loongson3_cpu_temp(i);
-		if (value > temp_max)
-			temp_max = value;
+		if (value > CPU_THERMAL_THRESHOLD) {
+			pr_emerg("Power off due to high temp: %d\n", value);
+			orderly_poweroff(true);
+		}
 	}
 
-	if (temp_max <= CPU_THERMAL_THRESHOLD)
-		schedule_delayed_work(&thermal_work, msecs_to_jiffies(5000));
-	else
-		orderly_poweroff(true);
+	schedule_delayed_work(&thermal_work, msecs_to_jiffies(5000));
 }
 
 static int __init loongson_hwmon_init(void)
-- 
2.1.0

