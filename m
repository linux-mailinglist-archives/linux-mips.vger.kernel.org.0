Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B5929E5AA
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 09:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgJ2IEx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 04:04:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58484 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726491AbgJ2IDk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Oct 2020 04:03:40 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JJd5pfmHcCAA--.10240S7;
        Thu, 29 Oct 2020 16:03:36 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>, Jun Yi <yijun@loongson.cn>
Subject: [PATCH 5/6] MIPS: Loongson64: Make sure the PC address is correct when 3A4000+ CPU hotplug
Date:   Thu, 29 Oct 2020 16:03:00 +0800
Message-Id: <1603958581-4723-6-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_9JJd5pfmHcCAA--.10240S7
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF18ZF1DGw4xuF1xKw48Zwb_yoW8Ar1fpa
        9xA3ZFkF45Wr4DZFn5Gry8XF15AFZaqF97ZFW2vrWruas09w1Y9F1fCr1Fq3WxurykKFyU
        Wr9YkF18CFZruw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnLvKUUUUU
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
 arch/mips/loongson64/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 33597d2..e486bbf 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -731,9 +731,10 @@ static void loongson3_type3_play_dead(int *state_addr)
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

