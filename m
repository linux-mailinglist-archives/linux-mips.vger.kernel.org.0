Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E9C2F2F1A
	for <lists+linux-mips@lfdr.de>; Tue, 12 Jan 2021 13:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387982AbhALMa2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Jan 2021 07:30:28 -0500
Received: from mail.loongson.cn ([114.242.206.163]:34332 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387535AbhALMaH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 Jan 2021 07:30:07 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx6L0dlv1fsycDAA--.5569S6;
        Tue, 12 Jan 2021 20:29:19 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: [PATCH 4/4] MIPS: Add is_jr_ra_ins() to end the loop early
Date:   Tue, 12 Jan 2021 20:29:17 +0800
Message-Id: <1610454557-25867-5-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9Dx6L0dlv1fsycDAA--.5569S6
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW8Wr15ur1kWr15Jr1xuFg_yoW8CFy3pF
        43AFZYkr4rKr93GrZ3Ja95JFy3trs5uwsxKFW7trW0qwn8Wry5ZFySkr9ak3ykGr98K3W8
        WFyYyr4jkwnrA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28C
        jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI
        8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E
        87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6ryUMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
        xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
        IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYe6wtUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For those leaf functions, they are likely to have no stack operations.
Add is_jr_ra_ins() to determine whether jr ra has been touched before
the frame_size is found. Without this patch, the get frame_size operation
may be out of range and get the frame_size from the next nested function.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/process.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index bef8f8d..9e6f194 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -205,6 +205,36 @@ struct mips_frame_info {
 #define J_TARGET(pc,target)	\
 		(((unsigned long)(pc) & 0xf0000000) | ((target) << 2))
 
+static inline int is_jr_ra_ins(union mips_instruction *ip)
+{
+#ifdef CONFIG_CPU_MICROMIPS
+	/*
+	 * jr16 ra
+	 * jr ra
+	 */
+	if (mm_insn_16bit(ip->word >> 16)) {
+		if (ip->mm16_r5_format.opcode == mm_pool16c_op &&
+		    ip->mm16_r5_format.rt == mm_jr16_op &&
+		    ip->mm16_r5_format.imm == 31)
+			return 1;
+		return 0;
+	}
+
+	if (ip->r_format.opcode == mm_pool32a_op &&
+	    ip->r_format.func == mm_pool32axf_op &&
+	    ((ip->u_format.uimmediate >> 6) & GENMASK(9,0)) == mm_jalr_op &&
+            ip->r_format.rs == 31)
+		return 1;
+	return 0;
+#else
+	if (ip->r_format.opcode == spec_op &&
+	    ip->r_format.func == jr_op &&
+	    ip->r_format.rs == 31)
+		return 1;
+	return 0;
+#endif
+}
+
 static inline int is_ra_save_ins(union mips_instruction *ip, int *poff)
 {
 #ifdef CONFIG_CPU_MICROMIPS
@@ -417,7 +447,9 @@ static int get_frame_info(struct mips_frame_info *info)
 			last_insn_size = 4;
 		}
 
-		if (!info->frame_size) {
+		if (is_jr_ra_ins(ip)) {
+			break;
+		} else if (!info->frame_size) {
 			is_sp_move_ins(&insn, &info->frame_size);
 			continue;
 		} else if (!saw_jump && is_jump_ins(ip)) {
-- 
2.1.0

