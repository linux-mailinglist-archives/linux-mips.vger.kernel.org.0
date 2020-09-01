Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691B625888E
	for <lists+linux-mips@lfdr.de>; Tue,  1 Sep 2020 08:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIAGxa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 02:53:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37284 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbgIAGxa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Sep 2020 02:53:30 -0400
Received: from localhost.localdomain (unknown [182.149.161.99])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj93f701fVdYPAA--.593S2;
        Tue, 01 Sep 2020 14:53:24 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: [PATCH v4] MIPS: add missing MSACSR and upper MSA initialization
Date:   Tue,  1 Sep 2020 14:53:09 +0800
Message-Id: <20200901065309.5952-1-huangpei@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9Dxj93f701fVdYPAA--.593S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWUKFy7Cw1fCF1fKw4rZrb_yoW8Gr15pa
        nrA3Z8Kw4UXFykt3sYya4Fq3y5Wr95trW7Za9rK3yfXan8Wr15W3WxJFZ8JFy2grW0ga10
        g34YvF4UKa92yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb2Nt3UUUU
        U==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In cc97ab235f ("MIPS: Simplify FP context initialization), init_fp_ctx
just initialize the fp/msa context, and own_fp_inatomic just restore 
FCSR and 64bit FP regs from it, but miss MSACSR and upper MSA regs for
MSA, so MSACSR and MSA upper regs's value from previous task on current
cpu can leak into current task and cause unpredictable behavior when MSA
context not initialized.

Fixes: cc97ab235f ("MIPS: Simplify FP context initialization")
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

