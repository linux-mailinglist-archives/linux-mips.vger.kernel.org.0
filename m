Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8125939A881
	for <lists+linux-mips@lfdr.de>; Thu,  3 Jun 2021 19:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbhFCRQG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Jun 2021 13:16:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:42476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233278AbhFCROG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Jun 2021 13:14:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 882ED61417;
        Thu,  3 Jun 2021 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622740248;
        bh=3LvHQp1xxlyxC7ZpjBoqWXgvRjOcDdp7uDfoI2xNWCI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sLZ59pWEYkuhmSAyFvGHDc+xv61j/9kAYvdIE9mEQdHUiG8L1BE2OkkrlyoXBLgEb
         BwuyKmtFXlwlBCh0eIQ8JwR+cn4Ug3RVujg0E0/PiC4nyy4imNqjQtb4uldDwf3Ee8
         Rsl+Lj+i0fOk/FyUIbz2gUBmZ2pboCEM0VZuctON8AjXUTnTEE1Nv9zvtuTLU/ZuTo
         ztBQXZDsQ8GgZ98R/qlfjwpa4HISEmtHU4zKpiNoWB+4ZffATgF5JXVMppzbRx72sR
         oL1DcALF+Ihw2Aln+ZXMNj3P4PpNOgBzAni47IZtUUS+M/7b8c6O70O5Eji4CXcTvK
         FTK9hpVINa6EQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 15/18] MIPS: Fix kernel hang under FUNCTION_GRAPH_TRACER and PREEMPT_TRACER
Date:   Thu,  3 Jun 2021 13:10:26 -0400
Message-Id: <20210603171029.3169669-15-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603171029.3169669-1-sashal@kernel.org>
References: <20210603171029.3169669-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tiezhu Yang <yangtiezhu@loongson.cn>

[ Upstream commit 78cf0eb926cb1abeff2106bae67752e032fe5f3e ]

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
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/lib/mips-atomic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/lib/mips-atomic.c b/arch/mips/lib/mips-atomic.c
index 5530070e0d05..57497a26e79c 100644
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
2.30.2

