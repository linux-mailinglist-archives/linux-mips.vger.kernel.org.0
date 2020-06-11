Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8A91F652A
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2020 11:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgFKJ7h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Jun 2020 05:59:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43274 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726802AbgFKJ7g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Jun 2020 05:59:36 -0400
Received: from localhost.localdomain (unknown [61.148.243.64])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxP+h+AOJetuFAAA--.1372S2;
        Thu, 11 Jun 2020 17:59:30 +0800 (CST)
From:   Lichao Liu <liulichao@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     yuanjunqing@loongson.cn, linux-mips@vger.kernel.org,
        Lichao Liu <liulichao@loongson.cn>
Subject: [PATCH] MIPS:Loongson-2EF:disable fix-loongson3-llsc in compiler
Date:   Thu, 11 Jun 2020 17:59:24 +0800
Message-Id: <20200611095924.29910-1-liulichao@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9AxP+h+AOJetuFAAA--.1372S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1fuFykGr17CF1fJw1fWFg_yoW5CFWxp3
        y3AwsxGrWrZrs2v3sxC3y8Wr4SyrW8JF4jvr43JrWUu3sxKF1vyr1ktFZaq3ZrCr47Za47
        ZF40krsruanrArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0VyxDUUUU
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Firstly, Loongson-2EF support ll/sc instructions, but
doesn't need fix-loongson3-llsc compile option.

Secondly, fix-loongson3-llsc will cause kernel startup
fail at futex_init, because compiler will add 'sync' before
'll', which will affect __ex_table.
futex_init will pass NULL uaddr parameter to
futex_atomic_cmpxchg_inatomic.
futex_atomic_cmpxchg_inatomic will access uaddr directly,
which will cause page fault exception, the exception should be
handled by __ex_table's nextinsn if the exception insn exsit in
__ex_table. Because __ex_table is affected by compiler,
the exception can not be handled, and
futex_atomic_cmpxchg_inatomic will crash.

Error code as below:
__ex_table.insn = 1b, which is 'sync' compiled with
fix-loongson3-llsc, but the actual exception instrction is ll.
So, do_page_fault will not find the correct inst in __ex_table, and
can not handle this exception.

        "1: "user_ll("%1", "%3")"               \n"
        "   bne %1, %z4, 3f             \n"
        "   .set    pop                 \n"
        "   move    $1, %z5                 \n"
        "   .set    "MIPS_ISA_ARCH_LEVEL"           \n"
        "2: "user_sc("$1", "%2")"               \n"
        "   beqz    $1, 1b                  \n"
        "3: " __SYNC_ELSE(full, loongson3_war, __WEAK_LLSC_MB) "\n"
        "   .insn                       \n"
        "   .set    pop                 \n"
        "   .section .fixup,\"ax\"              \n"
        "4: li  %0, %6                  \n"
        "   j   3b                  \n"
        "   .previous                   \n"
        "   .section __ex_table,\"a\"           \n"
        "   "__UA_ADDR "\t1b, 4b                \n"
        "   "__UA_ADDR "\t2b, 4b                \n"
        "   .previous

Signed-off-by: Lichao Liu <liulichao@loongson.cn>
---
 arch/mips/loongson2ef/Platform | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/loongson2ef/Platform b/arch/mips/loongson2ef/Platform
index cdad3c1a9a18..4ab55f1123a0 100644
--- a/arch/mips/loongson2ef/Platform
+++ b/arch/mips/loongson2ef/Platform
@@ -8,6 +8,28 @@ cflags-$(CONFIG_CPU_LOONGSON2E) += \
 	$(call cc-option,-march=loongson2e,-march=r4600)
 cflags-$(CONFIG_CPU_LOONGSON2F) += \
 	$(call cc-option,-march=loongson2f,-march=r4600)
+#
+# Some versions of binutils, not currently mainline as of 2019/02/04, support
+# an -mfix-loongson3-llsc flag which emits a sync prior to each ll instruction
+# to work around a CPU bug (see __SYNC_loongson3_war in asm/sync.h for a
+# description).
+#
+# We disable this in order to prevent the assembler meddling with the
+# instruction that labels refer to, ie. if we label an ll instruction:
+#
+# 1: ll v0, 0(a0)
+#
+# ...then with the assembler fix applied the label may actually point at a sync
+# instruction inserted by the assembler, and if we were using the label in an
+# exception table the table would no longer contain the address of the ll
+# instruction.
+#
+# Avoid this by explicitly disabling that assembler behaviour. If upstream
+# binutils does not merge support for the flag then we can revisit & remove
+# this later - for now it ensures vendor toolchains don't cause problems.
+#
+cflags-$(CONFIG_CPU_LOONGSON2EF)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+
 # Enable the workarounds for Loongson2f
 ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
   ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-nop,),)
-- 
2.17.1

