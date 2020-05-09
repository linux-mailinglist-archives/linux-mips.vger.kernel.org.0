Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F1D1CBE53
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2020 09:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbgEIHNE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 May 2020 03:13:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44596 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728471AbgEIHNE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 May 2020 03:13:04 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf93sV7ZeMnUyAA--.1S4;
        Sat, 09 May 2020 15:12:47 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 2/2] MIPS: Loongson: Reduce possible loop times and add log in do_thermal_timer()
Date:   Sat,  9 May 2020 15:12:44 +0800
Message-Id: <1589008364-2294-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1589008364-2294-1-git-send-email-yangtiezhu@loongson.cn>
References: <1589008364-2294-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxf93sV7ZeMnUyAA--.1S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4UGr1UuF15Kr43JFWUArb_yoW8GF4kpr
        WfG34YyF48Ww4qq3WUta1j9FW5Gw1DKry7uFy7CwnYyFs8XryaqFyUtFyFyr9rGr4kX3WU
        Zr1SvFnxWa17uF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUU1rW3UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Once the temperature of any CPUs is too high, it can power off immediately,
no need to check the rest of CPUs, and it is better to print a log before
power off, this is useful when analysis the abnormal issues.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2:
  - Reduce possible loop times in do_thermal_timer()
  - Modify the patch subject and update the commit message

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

