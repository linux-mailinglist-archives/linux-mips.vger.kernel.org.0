Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6E22F2F13
	for <lists+linux-mips@lfdr.de>; Tue, 12 Jan 2021 13:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731468AbhALMaH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Jan 2021 07:30:07 -0500
Received: from mail.loongson.cn ([114.242.206.163]:34330 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730630AbhALMaH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 Jan 2021 07:30:07 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx6L0dlv1fsycDAA--.5569S5;
        Tue, 12 Jan 2021 20:29:19 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: [PATCH 3/4] MIPS: Fix get_frame_info() handing of function size
Date:   Tue, 12 Jan 2021 20:29:16 +0800
Message-Id: <1610454557-25867-4-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9Dx6L0dlv1fsycDAA--.5569S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4kJFW3Cr45WFyfAFy5Arb_yoW8AF1fpr
        s8t3WkKr40qw10g348JrWkXFy5Xws8GwsIkFZrJFW0q3WkXr1xWF93WFyFkrWjqrn3u3W8
        uFyYvr1IkFnFkaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
        6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
        4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6ryUMxAIw28IcxkI7V
        AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
        r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
        IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
        w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYeVbPUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[1]: Commit b6c7a324df37b ("MIPS: Fix get_frame_info() handling of
                            microMIPS function size")
[2]: Commit 2b424cfc69728 ("MIPS: Remove function size check in
                            get_frame_info()")

First patch added a constant to check the number of iterations against.
Second patch fixed the situation that info->func_size is zero.

However, func_size member became useless after the second commit. Without
ip_end, the get frame_size operation may be out of range although KALLSYMS
enabled. Thus, check func_size first. Then make ip_end be the sum of ip
and a constant (512) if func_size is equal to 0. Otherwise make ip_end be
the sum of ip and func_size.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/process.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 94dfdf4..bef8f8d 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -390,10 +390,8 @@ static inline int is_sp_move_ins(union mips_instruction *ip, int *frame_size)
 static int get_frame_info(struct mips_frame_info *info)
 {
 	bool is_mmips = IS_ENABLED(CONFIG_CPU_MICROMIPS);
-	union mips_instruction insn, *ip;
-	const unsigned int max_insns = 128;
+	union mips_instruction insn, *ip, *ip_end;
 	unsigned int last_insn_size = 0;
-	unsigned int i;
 	bool saw_jump = false;
 
 	info->pc_offset = -1;
@@ -403,7 +401,9 @@ static int get_frame_info(struct mips_frame_info *info)
 	if (!ip)
 		goto err;
 
-	for (i = 0; i < max_insns; i++) {
+	ip_end = (void *)ip + (info->func_size ? info->func_size : 512);
+
+	while(ip < ip_end) {
 		ip = (void *)ip + last_insn_size;
 
 		if (is_mmips && mm_insn_16bit(ip->halfword[0])) {
-- 
2.1.0

