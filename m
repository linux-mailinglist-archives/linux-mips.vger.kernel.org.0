Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4702A3AED
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 04:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgKCDPW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 22:15:22 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47116 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727120AbgKCDPV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Nov 2020 22:15:21 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7387y6BfU3sEAA--.3657S7;
        Tue, 03 Nov 2020 11:15:16 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>, Jun Yi <yijun@loongson.cn>
Subject: [PATCH v2 5/6] MIPS: Loongson64: Make sure the PC address is correct when 3A4000+ CPU hotplug
Date:   Tue,  3 Nov 2020 11:15:05 +0800
Message-Id: <1604373306-3599-6-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx7387y6BfU3sEAA--.3657S7
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF18ZF1DGw4xuF1xKw48Zwb_yoW8Ar4kpa
        sxA3ZFkF45Wr4DZFn5Gry8XF1UAFZIqF97ZFW2vrWruF909w1Y9FyfCr1Fq3WxurykKFyU
        Xr9YkF18CFZruw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j
        6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
        IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8Gw
        CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
        6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
        vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
        vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3fHbUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In loongson3_type3_play_dead(), in order to make sure the PC address is
correct, use lw to read the low 32 bits first, if the result is not zero,
then use ld to read the whole 64 bits, otherwise there maybe exists atomic
problem due to write high 32 bits first and then low 32 bits, like this:

high 32 bits (write done)
                                  -- only read high 32-bits which is wrong
low 32 bits (not yet write done)

This problem is especially for Loongson 3A4000+ CPU due to using Mail_Send
register which can only send 32 bits data one time. Although it is hard to
reproduce, we can do something at the software level to avoid the risks for
3A4000+ CPU, this change has no influence on the other Loongson CPUs.

Signed-off-by: Lu Zeng <zenglu@loongson.cn>
Signed-off-by: Jun Yi <yijun@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: No changes

 arch/mips/loongson64/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 736e98d..e32b46e 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -764,9 +764,10 @@ static void loongson3_type3_play_dead(int *state_addr)
 		"1: li    %[count], 0x100             \n" /* wait for init loop */
 		"2: bnez  %[count], 2b                \n" /* limit mailbox access */
 		"   addiu %[count], -1                \n"
-		"   ld    %[initfunc], 0x20(%[base])  \n" /* get PC via mailbox */
+		"   lw    %[initfunc], 0x20(%[base])  \n" /* get PC (low 32 bits) via mailbox */
 		"   beqz  %[initfunc], 1b             \n"
 		"   nop                               \n"
+		"   ld    %[initfunc], 0x20(%[base])  \n" /* get PC (whole 64 bits) via mailbox */
 		"   ld    $sp, 0x28(%[base])          \n" /* get SP via mailbox */
 		"   ld    $gp, 0x30(%[base])          \n" /* get GP via mailbox */
 		"   ld    $a1, 0x38(%[base])          \n"
-- 
2.1.0

