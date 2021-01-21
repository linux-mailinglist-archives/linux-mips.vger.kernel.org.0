Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736132FE1C0
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 06:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbhAUFdw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 00:33:52 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47442 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726753AbhAUFcn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 00:32:43 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeL7GEQlgHXEIAA--.13206S5;
        Thu, 21 Jan 2021 13:31:53 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: [PATCH v2 3/4] MIPS: Fix get_frame_info() handing of function size
Date:   Thu, 21 Jan 2021 13:31:37 +0800
Message-Id: <1611207098-11381-4-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
References: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9DxeL7GEQlgHXEIAA--.13206S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4kJFW3Cr45WFyfAFy5Arb_yoW8AF1fpr
        s8t3WkKr4jqw10grW8JrWkXry5Xrs8GwsIkFZrtFW0q3WkX3W7WF93Xr9YkrWjqrn3u3W8
        uFy5Xr1IyFnFkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
        aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
        Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S
        6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8WwCF04k20xvY0x
        0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
        7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
        C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
        04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
        CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bzPEfUUUUU=
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
index 74d7fd8..adf29f7 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -371,10 +371,8 @@ static inline int is_sp_move_ins(union mips_instruction *ip, int *frame_size)
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
@@ -384,7 +382,9 @@ static int get_frame_info(struct mips_frame_info *info)
 	if (!ip)
 		goto err;
 
-	for (i = 0; i < max_insns; i++) {
+	ip_end = (void *)ip + (info->func_size ? info->func_size : 512);
+
+	while (ip < ip_end) {
 		ip = (void *)ip + last_insn_size;
 
 		if (is_mmips && mm_insn_16bit(ip->halfword[0])) {
-- 
2.1.0

