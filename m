Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F36381820
	for <lists+linux-mips@lfdr.de>; Sat, 15 May 2021 13:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhEOLGG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 May 2021 07:06:06 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48308 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233077AbhEOLD1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 15 May 2021 07:03:27 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axrcgpqp9g598WAA--.13691S4;
        Sat, 15 May 2021 19:02:08 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 2/2] MIPS: Fix kernel hang under FUNCTION_GRAPH_TRACER and PREEMPT_TRACER
Date:   Sat, 15 May 2021 19:02:01 +0800
Message-Id: <1621076521-22412-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1621076521-22412-1-git-send-email-yangtiezhu@loongson.cn>
References: <1621076521-22412-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Axrcgpqp9g598WAA--.13691S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy5CF4kArW3uF4ftry3CFg_yoW5XF1Upr
        4Ika4vy3y8XayYg3sFvr18Zr13Xan7t3s2yFyUCayfZws8AF4kXr1xtw18XF1jqr95XayS
        qas7AF4j9a18Z3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8KwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUOXowUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When update the latest mainline kernel with the following three configs,
the kernel hangs during startup:

(1) CONFIG_FUNCTION_GRAPH_TRACER=y
(2) CONFIG_PREEMPT_TRACER=y
(3) CONFIG_FTRACE_STARTUP_TEST=y

When update the latest mainline kernel with the above two configs (1)
and (2), the kernel starts normally, but it still hangs when execute
the following command:

echo "function_graph" > /sys/kernel/debug/tracing/current_tracer

Without CONFIG_PREEMPT_TRACER=y, the above two kinds of kernel hangs
disappeared, so it seems that CONFIG_PREEMPT_TRACER has some influences
with function_graph tracer at the first glance.

I use ejtag to find out the epc address is related with preempt_enable()
in the file arch/mips/lib/mips-atomic.c, because function tracing can
trace the preempt_{enable,disable} calls that are traced, replace them
with preempt_{enable,disable}_notrace to prevent function tracing from
going into an infinite loop, and then it can fix the kernel hang issue.

By the way, it seems that this commit is a complement and improvement of
commit f93a1a00f2bd ("MIPS: Fix crash that occurs when function tracing
is enabled").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Steven Rostedt <rostedt@goodmis.org>
---
 arch/mips/lib/mips-atomic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/lib/mips-atomic.c b/arch/mips/lib/mips-atomic.c
index de03838..a9b72ea 100644
--- a/arch/mips/lib/mips-atomic.c
+++ b/arch/mips/lib/mips-atomic.c
@@ -37,7 +37,7 @@
  */
 notrace void arch_local_irq_disable(void)
 {
-	preempt_disable();
+	preempt_disable_notrace();
 
 	__asm__ __volatile__(
 	"	.set	push						\n"
@@ -53,7 +53,7 @@ notrace void arch_local_irq_disable(void)
 	: /* no inputs */
 	: "memory");
 
-	preempt_enable();
+	preempt_enable_notrace();
 }
 EXPORT_SYMBOL(arch_local_irq_disable);
 
@@ -61,7 +61,7 @@ notrace unsigned long arch_local_irq_save(void)
 {
 	unsigned long flags;
 
-	preempt_disable();
+	preempt_disable_notrace();
 
 	__asm__ __volatile__(
 	"	.set	push						\n"
@@ -78,7 +78,7 @@ notrace unsigned long arch_local_irq_save(void)
 	: /* no inputs */
 	: "memory");
 
-	preempt_enable();
+	preempt_enable_notrace();
 
 	return flags;
 }
@@ -88,7 +88,7 @@ notrace void arch_local_irq_restore(unsigned long flags)
 {
 	unsigned long __tmp1;
 
-	preempt_disable();
+	preempt_disable_notrace();
 
 	__asm__ __volatile__(
 	"	.set	push						\n"
@@ -106,7 +106,7 @@ notrace void arch_local_irq_restore(unsigned long flags)
 	: "0" (flags)
 	: "memory");
 
-	preempt_enable();
+	preempt_enable_notrace();
 }
 EXPORT_SYMBOL(arch_local_irq_restore);
 
-- 
2.1.0

