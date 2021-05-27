Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F55392D37
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 13:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbhE0Lyj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 07:54:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48804 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234215AbhE0Lyi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 07:54:38 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb0MViK9grkUFAA--.5908S2;
        Thu, 27 May 2021 19:52:53 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] MIPS: Loongson64: Make some functions static in smp.c
Date:   Thu, 27 May 2021 19:52:53 +0800
Message-Id: <1622116373-24218-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxb0MViK9grkUFAA--.5908S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW7ArWfKr17Ar4kAryftFb_yoW8CF17pa
        yrAw1jqr43G3WxArsxJFW7ZrW3CrZ8WFWIyF4rAay5Xa90gwnFyFykGa48Zr1qgrW0qas5
        Zw15CrWUGF4xCr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw4l42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jI0P-UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Make some functions static to fix the following sparse warnings:

  arch/mips/loongson64/smp.c:54:5: sparse: sparse: symbol 'ipi_read_clear' was not declared. Should it be static?
  arch/mips/loongson64/smp.c:55:6: sparse: sparse: symbol 'ipi_write_action' was not declared. Should it be static?
  arch/mips/loongson64/smp.c:56:6: sparse: sparse: symbol 'ipi_write_enable' was not declared. Should it be static?
  arch/mips/loongson64/smp.c:57:6: sparse: sparse: symbol 'ipi_clear_buf' was not declared. Should it be static?
  arch/mips/loongson64/smp.c:58:6: sparse: sparse: symbol 'ipi_write_buf' was not declared. Should it be static?

Fixes: fed4955f304e ("MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/loongson64/smp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index 6acde65..09ebe84 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -51,11 +51,11 @@ static uint32_t core0_c0count[NR_CPUS];
 		__wbflush();			\
 	} while (0)
 
-u32 (*ipi_read_clear)(int cpu);
-void (*ipi_write_action)(int cpu, u32 action);
-void (*ipi_write_enable)(int cpu);
-void (*ipi_clear_buf)(int cpu);
-void (*ipi_write_buf)(int cpu, struct task_struct *idle);
+static u32 (*ipi_read_clear)(int cpu);
+static void (*ipi_write_action)(int cpu, u32 action);
+static void (*ipi_write_enable)(int cpu);
+static void (*ipi_clear_buf)(int cpu);
+static void (*ipi_write_buf)(int cpu, struct task_struct *idle);
 
 /* send mail via Mail_Send register for 3A4000+ CPU */
 static void csr_mail_send(uint64_t data, int cpu, int mailbox)
-- 
2.1.0

