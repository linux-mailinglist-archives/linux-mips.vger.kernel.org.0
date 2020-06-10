Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0DF1F5453
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 14:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgFJMN3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 08:13:29 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:53460 "EHLO
        mail-m975.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbgFJMN2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 08:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JJhsv
        FYwW+8tEWWr/oiMmbCKVPyMC4y0gNIMmx5KF+c=; b=MnUAft4oj05Sj+PgR67JH
        pGD5zfdf9iIZRKNMRh683qj4kjFPW5bd6ArAKOtiFbvj9CKn7qcyj9m5K2jowom1
        amYuhRMaesbgqE5nsAP4LGH54smYx6Pi/qdxLgV39HPh+zz2GVak8ljXHhSLG/24
        HXmJMXQbrUsrgKYraHkADE=
Received: from localhost.localdomain (unknown [114.242.249.96])
        by smtp5 (Coremail) with SMTP id HdxpCgCX2lxNzuBekc1XBw--.277S4;
        Wed, 10 Jun 2020 20:13:20 +0800 (CST)
From:   YuanJunQing <yuanjunqing66@163.com>
To:     tsbogend@alpha.franken.de
Cc:     yszhou4tech@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, liulichao@loongson.cn,
        YuanJunQing <yuanjunqing66@163.com>
Subject: [PATCH] mips/ftrace: Fix stack backtrace in unwind_stack_by_address()
Date:   Wed, 10 Jun 2020 20:12:54 +0800
Message-Id: <20200610121254.1780-1-yuanjunqing66@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgCX2lxNzuBekc1XBw--.277S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF4xXrWUuFyktFW5CFWDCFg_yoW5Gw18pr
        ZIk3ZxtrWkXa12kryfur18Wry5JrykZa42kry7Jry5Z3ZxXF13XryI93WDKr1DJrW0ka4f
        ury7trsrurZ0vaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmiiDUUUUU=
X-Originating-IP: [114.242.249.96]
X-CM-SenderInfo: h1xd0ypxqtx0rjwwqiywtou0bp/xtbBzwA-XFaD7e0wIAAAsp
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Calling the unwind_stack_by_address() function for stack backtrace
will fail, when we use "echo function: stacktrace > set_ftrace_filter".

The stack backtrace as follows:
           <...>-3102  [001] ...2    63.557737: <stack trace>
 => 0
 => 0
 => 0
 => 0
 => 0
 => 0
 => 0
 => 0
 =>
          <idle>-0     [000] .N.2    63.558793: <stack trace>

The reason is that when performing stack backtrace, the "ftrace_call"
and "ftrace_graph_call" global symbols in ftrace_caller() are
treated as functions.

If CONFIG_FUNCTION_GRAPH_TRACER is defined, the value in the "ra"
register is the address of ftrace_graph_call when the stack
backtrace back to ftrace_caller(). ”ftrace_graph_call“ is a global
symbol, and the value of "ofs" is set to zero when the
kallsyms_lookup_size_offset() is called. Otherwise, the value
in the "ra" register is the address of ftrace_call+8. "ftrace_call"
is the global symbol, and return one when the get_frame_info() is called.

Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
---
 arch/mips/kernel/process.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index b2a797557825..ac4fe79bc5bc 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -53,6 +53,8 @@
 #include <asm/inst.h>
 #include <asm/stacktrace.h>
 #include <asm/irq_regs.h>
+#include <linux/ftrace.h>
+#include <generated/asm-offsets.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
 void arch_cpu_idle_dead(void)
@@ -569,6 +571,13 @@ unsigned long notrace unwind_stack_by_address(unsigned long stack_page,
 	 * Return ra if an exception occurred at the first instruction
 	 */
 	if (unlikely(ofs == 0)) {
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+		extern void ftrace_graph_call(void);
+		if ((pc == (unsigned long)ftrace_graph_call)) {
+			pc = ((unsigned long *)(*sp))[PT_R31/sizeof(long)];
+			*sp += PT_SIZE;
+		} else
+#endif
 		pc = *ra;
 		*ra = 0;
 		return pc;
@@ -583,16 +592,23 @@ unsigned long notrace unwind_stack_by_address(unsigned long stack_page,
 	if (*sp < low || *sp + info.frame_size > high)
 		return 0;
 
-	if (leaf)
+	if (leaf) {
 		/*
 		 * For some extreme cases, get_frame_info() can
 		 * consider wrongly a nested function as a leaf
 		 * one. In that cases avoid to return always the
 		 * same value.
 		 */
+#ifdef CONFIG_DYNAMIC_FTRACE
+		if (info.func == (void *)ftrace_call) {
+			pc = ((unsigned long *)(*sp))[PT_R31/sizeof(long)];
+			info.frame_size = PT_SIZE;
+		} else
+#endif
 		pc = pc != *ra ? *ra : 0;
-	else
+	} else {
 		pc = ((unsigned long *)(*sp))[info.pc_offset];
+	}
 
 	*sp += info.frame_size;
 	*ra = 0;
-- 
2.17.1

