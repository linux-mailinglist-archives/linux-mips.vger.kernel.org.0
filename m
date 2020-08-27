Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEF925401D
	for <lists+linux-mips@lfdr.de>; Thu, 27 Aug 2020 10:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgH0IDU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Aug 2020 04:03:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48450 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726851AbgH0IDQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Aug 2020 04:03:16 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr928aEdfv4kOAA--.81S2;
        Thu, 27 Aug 2020 16:03:09 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: perf: Fix wrong check condition of Loongson event IDs
Date:   Thu, 27 Aug 2020 16:03:08 +0800
Message-Id: <1598515388-3604-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxr928aEdfv4kOAA--.81S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF45trW3tryfKryfuw45ZFb_yoW8Jw13pr
        4UuanIgwnrKw12gay5Zan7Xw45Grn5ua9rWayUG3W5Aw45Z3s5XanrZFn8tr1fXrnIka47
        XayxKr47Za4qkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r43
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUb6wCDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

According to the user's manual chapter 8.2.1 of Loongson 3A2000 CPU [1]
and 3A3000 CPU [2], we should take some event IDs such as 274, 358, 359
and 360 as valid in the check condition, otherwise they are recognized
as "not supported", fix it.

[1] http://www.loongson.cn/uploadfile/cpu/3A2000/Loongson3A2000_user2.pdf
[2] http://www.loongson.cn/uploadfile/cpu/3A3000/Loongson3A3000_3B3000user2.pdf

Fixes: e9dfbaaeef1c ("MIPS: perf: Add hardware perf events support for new Loongson-3")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/kernel/perf_event_mipsxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index efce5de..011eb6bb 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -1898,8 +1898,8 @@ static const struct mips_perf_event *mipsxx_pmu_map_raw_event(u64 config)
 				(base_id >= 64 && base_id < 90) ||
 				(base_id >= 128 && base_id < 164) ||
 				(base_id >= 192 && base_id < 200) ||
-				(base_id >= 256 && base_id < 274) ||
-				(base_id >= 320 && base_id < 358) ||
+				(base_id >= 256 && base_id < 275) ||
+				(base_id >= 320 && base_id < 361) ||
 				(base_id >= 384 && base_id < 574))
 				break;
 
-- 
2.1.0

