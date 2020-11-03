Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A06D2A3AF2
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 04:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgKCDPN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 22:15:13 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47024 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725974AbgKCDPN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Nov 2020 22:15:13 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7387y6BfU3sEAA--.3657S5;
        Tue, 03 Nov 2020 11:15:09 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 3/6] MIPS: Loongson64: Set IPI_Enable register per core by itself
Date:   Tue,  3 Nov 2020 11:15:03 +0800
Message-Id: <1604373306-3599-4-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx7387y6BfU3sEAA--.3657S5
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUCw1xXr17ZFWUCry5twb_yoW8Xrykp3
        yIv3WUKr4UWw18Aws5Jay5Zr1Fyr98XayxAa1xtF4rZ3s8ua4YqF48Ka4UJa47AFWvq3W3
        u3sagr47GFyrC3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8GwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUjD7-UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, for example, core 1 sets Core[0, 1, 2, 3]_IPI_Enalbe
register and core 2, 3 do the same thing on the 1-way Loongson64 platform,
this is not necessary. Set IPI_Enable register per core by itself to avoid
duplicate operations and make the logic more clear.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: No changes

 arch/mips/loongson64/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e744e1b..7d58853 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -348,8 +348,7 @@ static void loongson3_init_secondary(void)
 	/* Set interrupt mask, but don't enable */
 	change_c0_status(ST0_IM, imask);
 
-	for (i = 0; i < num_possible_cpus(); i++)
-		loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(i)]);
+	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(cpu)]);
 
 	per_cpu(cpu_state, cpu) = CPU_ONLINE;
 	cpu_set_core(&cpu_data[cpu],
@@ -420,6 +419,7 @@ static void __init loongson3_smp_setup(void)
 	ipi_status0_regs_init();
 	ipi_en0_regs_init();
 	ipi_mailbox_buf_init();
+	loongson3_ipi_write32(0xffffffff, ipi_en0_regs[cpu_logical_map(0)]);
 	cpu_set_core(&cpu_data[0],
 		     cpu_logical_map(0) % loongson_sysconf.cores_per_package);
 	cpu_data[0].package = cpu_logical_map(0) / loongson_sysconf.cores_per_package;
-- 
2.1.0

