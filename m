Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF7A1A2DD1
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 05:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgDIDKx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 23:10:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41078 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726521AbgDIDKx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Apr 2020 23:10:53 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx794mko5etI0lAA--.30S2;
        Thu, 09 Apr 2020 11:10:32 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Limit check_bugs32() under CONFIG_32BIT
Date:   Thu,  9 Apr 2020 11:10:29 +0800
Message-Id: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx794mko5etI0lAA--.30S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW8Jr48tr13tr43WryxGrg_yoW8GFy3pF
        sFyw4kJr4UuFyDAa9Yyr1kWryYqr1kGr45KrW0gFWDAF15XF4UGFn3Kr45Jrn7ZryfKa4r
        uF9aqr1ftF4Iyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8
        JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU2FALUUU
        UU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is no need to build and call check_bugs32() under CONFIG_64BIT,
just limit it under CONFIG_32BIT.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/bugs.h | 4 +++-
 arch/mips/kernel/cpu-probe.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
index d72dc6e..5f8d2bf 100644
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -35,7 +35,9 @@ static inline void check_bugs(void)
 	unsigned int cpu = smp_processor_id();
 
 	cpu_data[cpu].udelay_val = loops_per_jiffy;
-	check_bugs32();
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		check_bugs32();
 
 	if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
 		check_bugs64();
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index f21a230..85d7273 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -461,6 +461,7 @@ static inline void cpu_set_mt_per_tc_perf(struct cpuinfo_mips *c)
 		c->options |= MIPS_CPU_MT_PER_TC_PERF_COUNTERS;
 }
 
+#ifdef CONFIG_32BIT
 static inline void check_errata(void)
 {
 	struct cpuinfo_mips *c = &current_cpu_data;
@@ -484,6 +485,7 @@ void __init check_bugs32(void)
 {
 	check_errata();
 }
+#endif /* CONFIG_32BIT */
 
 /*
  * Probe whether cpu has config register by trying to play with
-- 
2.1.0

