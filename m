Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229422FE1EC
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 06:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbhAUFdu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 00:33:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47458 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726731AbhAUFcn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 00:32:43 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeL7GEQlgHXEIAA--.13206S6;
        Thu, 21 Jan 2021 13:31:54 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: [PATCH v2 4/4] MIPS: Add is_jr_ra_ins() to end the loop early
Date:   Thu, 21 Jan 2021 13:31:38 +0800
Message-Id: <1611207098-11381-5-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
References: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9DxeL7GEQlgHXEIAA--.13206S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXF47ZF1ktr15Jr18Xw1UJrb_yoW5Jw4xpr
        43Ars3Gr1rJr13Jr1fJ395Jry5Jrs5JrsxtFW7trW8Wwn8CryUZr1fAr1FyrWUJryUKw18
        GFy5Ar1UGr1DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
        jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI
        8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2
        z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0V
        AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1l
        Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8WwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bYKZAUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For those leaf functions, they are likely to have no stack operations.
Add is_jr_ra_ins() to determine whether jr ra has been touched before
the frame_size is found. Without this patch, the get frame_size operation
may be out of range and get the frame_size from the next nested function.

There is no POOL32A format in uapi/asm/inst.h, so some bits here use the
format of r_format instead.
e.g.
---------------------------------------------------------------------
|    format      |  31:26  | 25:21 | 20:16 |    15:6    |    5:0    |
-----------------+---------+-------+-------+------------+------------
| pool32a_format | pool32a |  rt   |  rs   |   jalrc    | pool32axf |
-----------------+---------+-------+-------+------------+------------
|    r_format    |  opcode |  rs   |  rt   | rd:5, re:5 |    func   |
---------------------------------------------------------------------

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
v2:
- microMIPS: ip->r_format.rs -> ip->r_format.rt

 arch/mips/kernel/process.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index adf29f7..592f02e 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -186,6 +186,36 @@ struct mips_frame_info {
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
+	    ((ip->u_format.uimmediate >> 6) & GENMASK(9, 0)) == mm_jalr_op &&
+	    ip->r_format.rt == 31)
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
@@ -398,7 +428,9 @@ static int get_frame_info(struct mips_frame_info *info)
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

