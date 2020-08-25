Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06802510CB
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 06:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgHYEih (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 00:38:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47890 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728504AbgHYEih (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Aug 2020 00:38:37 -0400
Received: from localhost.localdomain (unknown [222.209.10.89])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9+_lURf0KkNAA--.17727S3;
        Tue, 25 Aug 2020 12:38:32 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
Date:   Tue, 25 Aug 2020 12:38:06 +0800
Message-Id: <20200825043807.5741-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825043807.5741-1-huangpei@loongson.cn>
References: <20200825043807.5741-1-huangpei@loongson.cn>
X-CM-TRANSID: AQAAf9DxP9+_lURf0KkNAA--.17727S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1fJFWfuw1rCFyDJFy7Jrb_yoWktrgEkw
        17Aw1kKr45Zw1qq39F9rZ8WFy0q3yDWF1S9a1vgFWYk3y8JryYyr4Uua4Yvrn3Wr4rCrsa
        qr9xGr1v9an7KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb-AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
        0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
task on current cpu can leak into current task and cause unpredictable
behavior when MSA context not initialized.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/kernel/traps.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 38aa07ccdbcc..f8334b63e4c8 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1287,6 +1287,14 @@ static int enable_restore_fp_context(int msa)
 		err = own_fpu_inatomic(1);
 		if (msa && !err) {
 			enable_msa();
+			/* with MSA enabled, userspace can see MSACSR 
+			 * and MSA regs, but the values in them are from
+			 * other task before current task, restore them
+			 * from saved fp/msa context */
+			write_msa_csr(current->thread.fpu.msacsr);
+			/* own_fpu_inatomic(1) just restore low 64bit,
+			 * fix the high 64bit */
+			init_msa_upper();
 			set_thread_flag(TIF_USEDMSA);
 			set_thread_flag(TIF_MSA_CTX_LIVE);
 		}
-- 
2.17.1

