Return-Path: <linux-mips+bounces-6853-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8017A9E31AF
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 04:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 439672813FD
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 03:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942023A1B5;
	Wed,  4 Dec 2024 03:01:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719B32CA9;
	Wed,  4 Dec 2024 03:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733281314; cv=none; b=QoZgXp97Sjg3RusgasU+oLlub3akxzNKtALGBl7NHUryn/awngJwcO2ubCZiPhH4NIunWq3/aQuEtxfsciM/c9fCHl/uU5Ls22VT8KwrMRPd1wcDDhUl7wmiRQ1dzefE4LCPILF7nr2HxNdAGh+XSaheNsKG46nqUfcPHQvaec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733281314; c=relaxed/simple;
	bh=b0z7pjDYB3g0PL82pvzT/L1Mbt9JFeLuWFLQfcBWLCU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lCXE6hnkcYI7n4jv6ihYRg8dnVOA6MdkqzPaqIjnSijhk9rz8wuKwdjCrP/OlcS/tkjz1atwg0MVjOhc2U3x5H6aRjXr7BzV8ChaAfUJLB3FJMvJNmLR49378krg7vge4bHIz487KW4Jv+wMN84GYGLG/fqGui+MdIJ9DlaQ6YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925EFC4CEDC;
	Wed,  4 Dec 2024 03:01:52 +0000 (UTC)
Date: Tue, 3 Dec 2024 22:01:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Joel Fernandes <joel@joelfernandes.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Paul Burton
 <paulburton@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] tracing: Remove definition of trace_*_rcuidle()
Message-ID: <20241203220153.3f81f12b@gandalf.local.home>
In-Reply-To: <ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
References: <20241003181629.36209057@gandalf.local.home>
	<bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
	<20241203155542.462b1b21@gandalf.local.home>
	<ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Dec 2024 17:48:33 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> Hmm. If you say so. Note that powerpc has the same or a similar problem.
> 
> [    0.142039][    T0] RCU not watching for tracepoint
> [    0.142488][    T0]
> [    0.142659][    T0] =============================
> [    0.142755][    T0] WARNING: suspicious RCU usage
> [    0.142914][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> [    0.143082][    T0] -----------------------------
> [    0.143178][    T0] kernel/notifier.c:586 notify_die called but RCU thinks we're quiescent!
> 
> 
> [    0.152733][    T0] RCU not watching for tracepoint
> [    0.152770][    T0]
> [    0.152995][    T0] =============================
> [    0.153092][    T0] WARNING: suspicious RCU usage
> [    0.153187][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> [    0.153301][    T0] -----------------------------
> [    0.153394][    T0] include/linux/rcupdate.h:850 rcu_read_lock() used illegally while idle!
> 
> [    0.165396][    T0] RCU not watching for tracepoint
> [    0.165540][    T0]
> [    0.165712][    T0] =============================
> [    0.165811][    T0] WARNING: suspicious RCU usage
> [    0.165909][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> [    0.166026][    T0] -----------------------------
> [    0.166122][    T0] include/linux/rcupdate.h:878 rcu_read_unlock() used illegally while idle!
> 
> and many more.

Grumble. It's just that one file. I wonder if we could just do a hack like
this?

Paul?

diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
index 5c03633316a6..58098873efa9 100644
--- a/kernel/trace/trace_preemptirq.c
+++ b/kernel/trace/trace_preemptirq.c
@@ -10,11 +10,42 @@
 #include <linux/module.h>
 #include <linux/ftrace.h>
 #include <linux/kprobes.h>
+#include <linux/hardirq.h>
 #include "trace.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/preemptirq.h>
 
+/*
+ * Use regular trace points on architectures that implement noinstr
+ * tooling: these calls will only happen with RCU enabled, which can
+ * use a regular tracepoint.
+ *
+ * On older architectures, RCU may not be watching in idle. In that
+ * case, wake up RCU to watch while calling the tracepoint. These
+ * aren't NMI-safe - so exclude NMI contexts:
+ */
+#ifdef CONFIG_ARCH_WANTS_NO_INSTR
+#define trace(point, args)	trace_##point(args)
+#else
+#define trace(point, args)					\
+	do {							\
+		if (trace_##point##_enabled()) {		\
+			bool exit_rcu = false;			\
+			if (in_nmi())				\
+				break;				\
+			if (!IS_ENABLED(CONFIG_TINY_RCU) &&	\
+			    is_idle_task(current)) {		\
+				ct_irq_enter();			\
+				exit_rcu = true;		\
+			}					\
+			trace_##point(args);			\
+			if (exit_rcu)				\
+				ct_irq_exit();			\
+		}						\
+	} while (0)
+#endif
+
 #ifdef CONFIG_TRACE_IRQFLAGS
 /* Per-cpu variable to prevent redundant calls when IRQs already off */
 static DEFINE_PER_CPU(int, tracing_irq_cpu);
@@ -28,7 +59,7 @@ static DEFINE_PER_CPU(int, tracing_irq_cpu);
 void trace_hardirqs_on_prepare(void)
 {
 	if (this_cpu_read(tracing_irq_cpu)) {
-		trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
+		trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
 		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
 		this_cpu_write(tracing_irq_cpu, 0);
 	}
@@ -39,7 +70,7 @@ NOKPROBE_SYMBOL(trace_hardirqs_on_prepare);
 void trace_hardirqs_on(void)
 {
 	if (this_cpu_read(tracing_irq_cpu)) {
-		trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
+		trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
 		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
 		this_cpu_write(tracing_irq_cpu, 0);
 	}
@@ -61,7 +92,7 @@ void trace_hardirqs_off_finish(void)
 	if (!this_cpu_read(tracing_irq_cpu)) {
 		this_cpu_write(tracing_irq_cpu, 1);
 		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
-		trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
+		trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
 	}
 
 }
@@ -75,7 +106,7 @@ void trace_hardirqs_off(void)
 	if (!this_cpu_read(tracing_irq_cpu)) {
 		this_cpu_write(tracing_irq_cpu, 1);
 		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
-		trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
+		trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
 	}
 }
 EXPORT_SYMBOL(trace_hardirqs_off);
@@ -86,13 +117,13 @@ NOKPROBE_SYMBOL(trace_hardirqs_off);
 
 void trace_preempt_on(unsigned long a0, unsigned long a1)
 {
-	trace_preempt_enable(a0, a1);
+	trace(preempt_enable, TP_ARGS(a0, a1));
 	tracer_preempt_on(a0, a1);
 }
 
 void trace_preempt_off(unsigned long a0, unsigned long a1)
 {
-	trace_preempt_disable(a0, a1);
+	trace(preempt_disable, TP_ARGS(a0, a1));
 	tracer_preempt_off(a0, a1);
 }
 #endif


I tested this by forcing x86 to use this code, and it appeared to work.

-- Steve

