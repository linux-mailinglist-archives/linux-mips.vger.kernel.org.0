Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66652132A3
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2020 06:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgGCEMG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Jul 2020 00:12:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56276 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725294AbgGCEMF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Jul 2020 00:12:05 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj98OsP5eRPVOAA--.774S2;
        Fri, 03 Jul 2020 12:11:59 +0800 (CST)
From:   Xingxing Su <suxingxing@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH] MIPS: Do not use smp_processor_id() in preemptible code
Date:   Fri,  3 Jul 2020 12:11:58 +0800
Message-Id: <1593749518-16722-1-git-send-email-suxingxing@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxj98OsP5eRPVOAA--.774S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4kuw17Ar4UKryfXFWDJwb_yoWrXw15pr
        1UXr1UGr48Jr17Jr47try5Jr1UKF45A3W7JF1UJw1YqF1UWr1UJr18tFWUKr1DJry5Jry7
        XryDtw4Utr1UGw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
        AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
        rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
        v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWU
        JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5s
        jjDUUUU
X-CM-SenderInfo: pvx0x0xj0l0wo6or00hjvr0hdfq/1tbiAQAGC13QvL2z8gAAsB
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use preempt_disable() to fix the following bug under CONFIG_DEBUG_PREEMPT.

[   21.915305] BUG: using smp_processor_id() in preemptible [00000000] code: qemu-system-mip/1056
[   21.923996] caller is do_ri+0x1d4/0x690
[   21.927921] CPU: 0 PID: 1056 Comm: qemu-system-mip Not tainted 5.8.0-rc2 #3
[   21.934913] Stack : 0000000000000001 ffffffff81370000 ffffffff8071cd60 a80f926d5ac95694
[   21.942984]         a80f926d5ac95694 0000000000000000 98000007f0043c88 ffffffff80f2fe40
[   21.951054]         0000000000000000 0000000000000000 0000000000000001 0000000000000000
[   21.959123]         ffffffff802d60cc 98000007f0043dd8 ffffffff81f4b1e8 ffffffff81f60000
[   21.967192]         ffffffff81f60000 ffffffff80fe0000 ffff000000000000 0000000000000000
[   21.975261]         fffffffff500cce1 0000000000000001 0000000000000002 0000000000000000
[   21.983331]         ffffffff80fe1a40 0000000000000006 ffffffff8077f940 0000000000000000
[   21.991401]         ffffffff81460000 98000007f0040000 98000007f0043c80 000000fffba8cf20
[   21.999471]         ffffffff8071cd60 0000000000000000 0000000000000000 0000000000000000
[   22.007541]         0000000000000000 0000000000000000 ffffffff80212ab4 a80f926d5ac95694
[   22.015610]         ...
[   22.018086] Call Trace:
[   22.020562] [<ffffffff80212ab4>] show_stack+0xa4/0x138
[   22.025732] [<ffffffff8071cd60>] dump_stack+0xf0/0x150
[   22.030903] [<ffffffff80c73f5c>] check_preemption_disabled+0xf4/0x100
[   22.037375] [<ffffffff80213b84>] do_ri+0x1d4/0x690
[   22.042198] [<ffffffff8020b828>] handle_ri_int+0x44/0x5c
[   24.359386] BUG: using smp_processor_id() in preemptible [00000000] code: qemu-system-mip/1072
[   24.368204] caller is do_ri+0x1a8/0x690
[   24.372169] CPU: 4 PID: 1072 Comm: qemu-system-mip Not tainted 5.8.0-rc2 #3
[   24.379170] Stack : 0000000000000001 ffffffff81370000 ffffffff8071cd60 a80f926d5ac95694
[   24.387246]         a80f926d5ac95694 0000000000000000 98001007ef06bc88 ffffffff80f2fe40
[   24.395318]         0000000000000000 0000000000000000 0000000000000001 0000000000000000
[   24.403389]         ffffffff802d60cc 98001007ef06bdd8 ffffffff81f4b818 ffffffff81f60000
[   24.411461]         ffffffff81f60000 ffffffff80fe0000 ffff000000000000 0000000000000000
[   24.419533]         fffffffff500cce1 0000000000000001 0000000000000002 0000000000000000
[   24.427603]         ffffffff80fe0000 0000000000000006 ffffffff8077f940 0000000000000020
[   24.435673]         ffffffff81460020 98001007ef068000 98001007ef06bc80 000000fffbbbb370
[   24.443745]         ffffffff8071cd60 0000000000000000 0000000000000000 0000000000000000
[   24.451816]         0000000000000000 0000000000000000 ffffffff80212ab4 a80f926d5ac95694
[   24.459887]         ...
[   24.462367] Call Trace:
[   24.464846] [<ffffffff80212ab4>] show_stack+0xa4/0x138
[   24.470029] [<ffffffff8071cd60>] dump_stack+0xf0/0x150
[   24.475208] [<ffffffff80c73f5c>] check_preemption_disabled+0xf4/0x100
[   24.481682] [<ffffffff80213b58>] do_ri+0x1a8/0x690
[   24.486509] [<ffffffff8020b828>] handle_ri_int+0x44/0x5c

Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
---
 arch/mips/kernel/traps.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 7c32c95..a46ce94 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -723,12 +723,14 @@ static int simulate_loongson3_cpucfg(struct pt_regs *regs,
 		perf_sw_event(PERF_COUNT_SW_EMULATION_FAULTS, 1, regs, 0);
 
 		/* Do not emulate on unsupported core models. */
-		if (!loongson3_cpucfg_emulation_enabled(&current_cpu_data))
+		preempt_disable();
+		if (!loongson3_cpucfg_emulation_enabled(&current_cpu_data)) {
+			preempt_enable();
 			return -1;
-
+		}
 		regs->regs[rd] = loongson3_cpucfg_read_synthesized(
 			&current_cpu_data, sel);
-
+		preempt_enable();
 		return 0;
 	}
 
-- 
2.1.0

