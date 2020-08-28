Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F7D2556FA
	for <lists+linux-mips@lfdr.de>; Fri, 28 Aug 2020 10:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgH1I5c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Aug 2020 04:57:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54106 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728362AbgH1I5b (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Aug 2020 04:57:31 -0400
Received: from localhost.localdomain (unknown [182.149.161.99])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxuuTtxkhfu+MOAA--.19227S2;
        Fri, 28 Aug 2020 16:57:24 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: [PATCH Fixes] MIPS: add missing MSACSR and upper MSA initialization
Date:   Fri, 28 Aug 2020 16:57:06 +0800
Message-Id: <20200828085706.29190-1-huangpei@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9AxuuTtxkhfu+MOAA--.19227S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1fJFWfuw1rCFyDJFy7Jrb_yoWkKFbE93
        WxA34kKr45A3Wqqa9F9rZ8WFyFq3yDWF1S93WvgFWYk34rJry5Ar4Uua4Yvrn5WrsYkrsa
        qr9xGr1v9anrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUP-B_UUUUU=
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
 arch/mips/kernel/traps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 38aa07ccdbcc..cf788591f091 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1287,6 +1287,18 @@ static int enable_restore_fp_context(int msa)
 		err = own_fpu_inatomic(1);
 		if (msa && !err) {
 			enable_msa();
+			/*
+			 * with MSA enabled, userspace can see MSACSR
+			 * and MSA regs, but the values in them are from
+			 * other task before current task, restore them
+			 * from saved fp/msa context
+			 */
+			write_msa_csr(current->thread.fpu.msacsr);
+			/*
+			 * own_fpu_inatomic(1) just restore low 64bit,
+			 * fix the high 64bit
+			 */
+			init_msa_upper();
 			set_thread_flag(TIF_USEDMSA);
 			set_thread_flag(TIF_MSA_CTX_LIVE);
 		}
-- 
2.17.1

