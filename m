Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A41C2A3D51
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 08:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgKCHMT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 02:12:19 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37310 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727957AbgKCHMS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 02:12:18 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79PGAqFfIKEEAA--.12977S7;
        Tue, 03 Nov 2020 15:12:13 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>, Jun Yi <yijun@loongson.cn>
Subject: [PATCH v3 5/6] MIPS: Loongson64: SMP: Fix up play_dead jump indicator
Date:   Tue,  3 Nov 2020 15:12:04 +0800
Message-Id: <1604387525-23400-6-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx79PGAqFfIKEEAA--.12977S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw15ZF4kJF18WFW8tFWrXwb_yoW8Gw45p3
        srAw12kF45GF1UuFn5G348AFyUJ398XF97AFsF9w1rC3s09w1Y9FySkr1rX34fWFykKa4U
        Xryqk34UCFW2yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_JrI_JrylYx0Ec7CjxVAajcxG14v26r1j6r4UMcIj6I8E87Iv67AKxVW8
        JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5c
        I20VAGYxC7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
        JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
        kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x0JUasjbUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In play_dead function, the whole 64-bit PC mailbox was used as a indicator
to determine if the master core had written boot jump information.

However, after we introduced CSR mailsend, the hardware will not guarante
an atomic write for the 64-bit PC mailbox. Thus we have to use the lower
32-bit which is written at the last as the jump indicator instead.

Signed-off-by: Lu Zeng <zenglu@loongson.cn>
Signed-off-by: Jun Yi <yijun@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: No changes
v3: Update the commit message and comment

 arch/mips/loongson64/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 736e98d..aa0cd72 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -764,9 +764,10 @@ static void loongson3_type3_play_dead(int *state_addr)
 		"1: li    %[count], 0x100             \n" /* wait for init loop */
 		"2: bnez  %[count], 2b                \n" /* limit mailbox access */
 		"   addiu %[count], -1                \n"
-		"   ld    %[initfunc], 0x20(%[base])  \n" /* get PC via mailbox */
+		"   lw    %[initfunc], 0x20(%[base])  \n" /* check lower 32-bit as jump indicator */
 		"   beqz  %[initfunc], 1b             \n"
 		"   nop                               \n"
+		"   ld    %[initfunc], 0x20(%[base])  \n" /* get PC (whole 64-bit) via mailbox */
 		"   ld    $sp, 0x28(%[base])          \n" /* get SP via mailbox */
 		"   ld    $gp, 0x30(%[base])          \n" /* get GP via mailbox */
 		"   ld    $a1, 0x38(%[base])          \n"
-- 
2.1.0

