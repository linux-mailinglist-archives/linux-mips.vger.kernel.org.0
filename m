Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB62877B049
	for <lists+linux-mips@lfdr.de>; Mon, 14 Aug 2023 05:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbjHNDxi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Aug 2023 23:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbjHNDxI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Aug 2023 23:53:08 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C220E5B;
        Sun, 13 Aug 2023 20:53:06 -0700 (PDT)
Received: from loongson.cn (unknown [113.200.148.30])
        by gateway (Coremail) with SMTP id _____8BxXesgpdlkv+UXAA--.44201S3;
        Mon, 14 Aug 2023 11:53:04 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxriMdpdlkLVBZAA--.48641S4;
        Mon, 14 Aug 2023 11:53:04 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 2/3] MIPS: Modify the declaration for die()
Date:   Mon, 14 Aug 2023 11:53:00 +0800
Message-Id: <1691985181-28363-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1691985181-28363-1-git-send-email-yangtiezhu@loongson.cn>
References: <1691985181-28363-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf8CxriMdpdlkLVBZAA--.48641S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xw47AFy8GFWfJr48tFW7WrX_yoWkJFXEk3
        W2ya18uw48Gr9ava4rWw4xJFyUG3yUuws7tr18Jas7Jasavr4UCay8CrnrJrWDuw4qvr15
        uF9xtryUAFySkosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
        s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
        cSsGvfJTRUUUb3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
        vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
        w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
        W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
        6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
        xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
        6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
        vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
        Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
        AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAI
        cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
        IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
        Ja73UjIFyTuYvjxU4OzVUUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While at it, modify the die() declaration in ptrace.h to fix
the following checkpatch warnings:

  WARNING: function definition argument 'const char *' should also have an identifier name
  WARNING: function definition argument 'struct pt_regs *' should also have an identifier name

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index daf3cf2..14d2ee9 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -159,7 +159,7 @@ static inline long regs_return_value(struct pt_regs *regs)
 extern asmlinkage long syscall_trace_enter(struct pt_regs *regs, long syscall);
 extern asmlinkage void syscall_trace_leave(struct pt_regs *regs);
 
-extern void die(const char *, struct pt_regs *) __noreturn;
+void die(const char *str, struct pt_regs *regs);
 
 static inline void die_if_kernel(const char *str, struct pt_regs *regs)
 {
-- 
2.1.0

