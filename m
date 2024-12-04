Return-Path: <linux-mips+bounces-6854-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7049E32D4
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 06:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2E54B23D32
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 05:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DD013D51E;
	Wed,  4 Dec 2024 05:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrgiif3C"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7D2500D2;
	Wed,  4 Dec 2024 05:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733288520; cv=none; b=tm23w+22Og2Z26bYri/JS42oZlrAugdaNX3bjx9uBJ5bGuKOjEIffro9tVHFSfO0ZV1YTFur3nQnlHmUVPoAulBVm05/PKV8kKTrUeHsRtpSBOOXEqmogUNIHJLMvqzqen0BSYCkd0nCVThYP6EhAwayIUVQJjpyYSP65ckMj8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733288520; c=relaxed/simple;
	bh=Z2r+meoiww+z2J9ZDDWze7d4oLsTH8tux9nd2txvRIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl//NYlqaVF6Eb3t/AqoapHOQFi5Dbx5LIiiF2EBgYzcGsFv+hD7y8W4JyppOaCtGzNn9RxrToSMp3M+CIK268saALflzs2aHjhx2vS/6V6I+/vVQxgRV7uQHD91ExWCdTO74WV+KGhP1hGBoyU+QJ0eozcujJxgQ20QOSGTmTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrgiif3C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2044DC4CED1;
	Wed,  4 Dec 2024 05:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733288520;
	bh=Z2r+meoiww+z2J9ZDDWze7d4oLsTH8tux9nd2txvRIY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=qrgiif3CtJvXRKiXzEPXN1LmIvWpr5Ot0OqWz6F3PZAFeVA/uP0/1HKREU+YAAPWr
	 do7FIvz8RzjKRCoG/VYabxkwUGuuRNhLC6IrWVYfbUX1niO4d0r4kmN3Ft9fUCZ14M
	 q64Xt6DOjqDDjjERCQIYKnxUJ4PF/MJk9R7c5BN8FsIC65wK5Pi3ZFCtE0+Urcp7bn
	 EyEuwnIVbc3Vp2nMY0BgwiVSxlSfBdsusWiHnbD/SPHSby2WFeUfNLULQ5AGnxTssj
	 TcC9AqzA/jsjCZL/7CbfgAePkZwjOa1UMaejGCr+v9O2V9M7ZKEjFSk/MXQLp+XqfC
	 DwcbF+k28rqYw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 54549CE071A; Tue,  3 Dec 2024 21:01:59 -0800 (PST)
Date: Tue, 3 Dec 2024 21:01:59 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH v2] tracing: Remove definition of trace_*_rcuidle()
Message-ID: <60749a43-17ad-4491-a13f-a2db7b6cb00c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20241003181629.36209057@gandalf.local.home>
 <bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
 <20241203155542.462b1b21@gandalf.local.home>
 <ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
 <20241203220153.3f81f12b@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203220153.3f81f12b@gandalf.local.home>

On Tue, Dec 03, 2024 at 10:01:53PM -0500, Steven Rostedt wrote:
> On Tue, 3 Dec 2024 17:48:33 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > Hmm. If you say so. Note that powerpc has the same or a similar problem.
> > 
> > [    0.142039][    T0] RCU not watching for tracepoint
> > [    0.142488][    T0]
> > [    0.142659][    T0] =============================
> > [    0.142755][    T0] WARNING: suspicious RCU usage
> > [    0.142914][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> > [    0.143082][    T0] -----------------------------
> > [    0.143178][    T0] kernel/notifier.c:586 notify_die called but RCU thinks we're quiescent!
> > 
> > 
> > [    0.152733][    T0] RCU not watching for tracepoint
> > [    0.152770][    T0]
> > [    0.152995][    T0] =============================
> > [    0.153092][    T0] WARNING: suspicious RCU usage
> > [    0.153187][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> > [    0.153301][    T0] -----------------------------
> > [    0.153394][    T0] include/linux/rcupdate.h:850 rcu_read_lock() used illegally while idle!
> > 
> > [    0.165396][    T0] RCU not watching for tracepoint
> > [    0.165540][    T0]
> > [    0.165712][    T0] =============================
> > [    0.165811][    T0] WARNING: suspicious RCU usage
> > [    0.165909][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> > [    0.166026][    T0] -----------------------------
> > [    0.166122][    T0] include/linux/rcupdate.h:878 rcu_read_unlock() used illegally while idle!
> > 
> > and many more.
> 
> Grumble. It's just that one file. I wonder if we could just do a hack like
> this?
> 
> Paul?

Looks plausible to me, though I don't understand why the introduction
of trace() doesn't permit removal of the corresponding current code.
(Or did I miss a previous patch that did just that?)

							Thanx, Paul

> diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
> index 5c03633316a6..58098873efa9 100644
> --- a/kernel/trace/trace_preemptirq.c
> +++ b/kernel/trace/trace_preemptirq.c
> @@ -10,11 +10,42 @@
>  #include <linux/module.h>
>  #include <linux/ftrace.h>
>  #include <linux/kprobes.h>
> +#include <linux/hardirq.h>
>  #include "trace.h"
>  
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/preemptirq.h>
>  
> +/*
> + * Use regular trace points on architectures that implement noinstr
> + * tooling: these calls will only happen with RCU enabled, which can
> + * use a regular tracepoint.
> + *
> + * On older architectures, RCU may not be watching in idle. In that
> + * case, wake up RCU to watch while calling the tracepoint. These
> + * aren't NMI-safe - so exclude NMI contexts:
> + */
> +#ifdef CONFIG_ARCH_WANTS_NO_INSTR
> +#define trace(point, args)	trace_##point(args)
> +#else
> +#define trace(point, args)					\
> +	do {							\
> +		if (trace_##point##_enabled()) {		\
> +			bool exit_rcu = false;			\
> +			if (in_nmi())				\
> +				break;				\
> +			if (!IS_ENABLED(CONFIG_TINY_RCU) &&	\
> +			    is_idle_task(current)) {		\
> +				ct_irq_enter();			\
> +				exit_rcu = true;		\
> +			}					\
> +			trace_##point(args);			\
> +			if (exit_rcu)				\
> +				ct_irq_exit();			\
> +		}						\
> +	} while (0)
> +#endif
> +
>  #ifdef CONFIG_TRACE_IRQFLAGS
>  /* Per-cpu variable to prevent redundant calls when IRQs already off */
>  static DEFINE_PER_CPU(int, tracing_irq_cpu);
> @@ -28,7 +59,7 @@ static DEFINE_PER_CPU(int, tracing_irq_cpu);
>  void trace_hardirqs_on_prepare(void)
>  {
>  	if (this_cpu_read(tracing_irq_cpu)) {
> -		trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>  		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>  		this_cpu_write(tracing_irq_cpu, 0);
>  	}
> @@ -39,7 +70,7 @@ NOKPROBE_SYMBOL(trace_hardirqs_on_prepare);
>  void trace_hardirqs_on(void)
>  {
>  	if (this_cpu_read(tracing_irq_cpu)) {
> -		trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>  		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>  		this_cpu_write(tracing_irq_cpu, 0);
>  	}
> @@ -61,7 +92,7 @@ void trace_hardirqs_off_finish(void)
>  	if (!this_cpu_read(tracing_irq_cpu)) {
>  		this_cpu_write(tracing_irq_cpu, 1);
>  		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> -		trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>  	}
>  
>  }
> @@ -75,7 +106,7 @@ void trace_hardirqs_off(void)
>  	if (!this_cpu_read(tracing_irq_cpu)) {
>  		this_cpu_write(tracing_irq_cpu, 1);
>  		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> -		trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>  	}
>  }
>  EXPORT_SYMBOL(trace_hardirqs_off);
> @@ -86,13 +117,13 @@ NOKPROBE_SYMBOL(trace_hardirqs_off);
>  
>  void trace_preempt_on(unsigned long a0, unsigned long a1)
>  {
> -	trace_preempt_enable(a0, a1);
> +	trace(preempt_enable, TP_ARGS(a0, a1));
>  	tracer_preempt_on(a0, a1);
>  }
>  
>  void trace_preempt_off(unsigned long a0, unsigned long a1)
>  {
> -	trace_preempt_disable(a0, a1);
> +	trace(preempt_disable, TP_ARGS(a0, a1));
>  	tracer_preempt_off(a0, a1);
>  }
>  #endif
> 
> 
> I tested this by forcing x86 to use this code, and it appeared to work.
> 
> -- Steve

