Return-Path: <linux-mips+bounces-6856-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB109E34C2
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 09:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3628285DC1
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 08:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012DD199E80;
	Wed,  4 Dec 2024 07:50:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0336119992C;
	Wed,  4 Dec 2024 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298626; cv=none; b=WbyMs6+uBE1wgIGv8xxdAMFHC4/VvrpQnUE6j2O22EPd1IzTWk+v4iy012UCwQvhYs6DbpS/u0+Jt7Az4i8pZ63lBhqm+Xe6Uk5NgrHsoVosH5v67Sxw8rNUu1eysNYXOSFeoApSU0kuJ5r1X2q56IWISBQbc5jC+j6oGWwUeUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298626; c=relaxed/simple;
	bh=24BPxbAHaOsdPbN2q/MSLmquC0QCEOYzuCN5qeAyt4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dELiPgMkHJEMk/NfXCJcvCckpBN27rrcr/la/6wduy45e37Ufml7jTAZSxs4NvT8ZUveuRRnORI6PbgWgLMw5eOWmcLZvFP3kqwcSqzJ7MYrsMV183ZI+yOyTywXPgWJaMokV/deQ/whpMr15ZqrfkeIpkfjEEPRUZI0YXi1Yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85ba9c6eecdso637011241.3;
        Tue, 03 Dec 2024 23:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733298622; x=1733903422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAc/Z0g+Y8N+a3vrMkKX5hyw1r5JDjIVFxXD5SaEmo8=;
        b=c1H4hwrgn/YwkXcrRA2pakSCpcCyjS8+uTn5Lm1IWdi3N/TWm2apzc8PCAwC8zz6L5
         lmXIOoPKoAhtNJt36FVzvmYPZMNUEAgGBgsl+5WzFai6QbkSuKJT53h9JefAW8DkDf2f
         S8Q96PChscnvFqG4EQNERJJOknYxbz63I5B4X9D/2p/I2nHmjAbxYM8d2+y3l8KyC4Mv
         q1VCSCJiwMQE18Eszl+D59pDq6xC9Rcomyf14z5vN23uM1HBw7/gM3fLZruzqEY/3WeP
         YFsfGFxxTvyo0EpbGys1EH3W6E8gSTE4YJMuA5TrRf/CH2eVjwdnEjPmIGDbjxKwFNPi
         ZRkw==
X-Forwarded-Encrypted: i=1; AJvYcCU0N7cpoyMDoYrcX3UgjTSGc7bJW69pPtmRyEsZm0CQACjf8m7ReihTEVWlHX70jpY0TQHQjfcWsIp3Oe8=@vger.kernel.org, AJvYcCUdFh0towYT2UE2yw6CXmOHxqY42J4COsirf/4n3h6W+awZ4JZ0E77akM6PQhnIWBRJwzYamJOLJpmk9A==@vger.kernel.org, AJvYcCWE2jws1uZd3q1kZFhuVuk6tNowCbkkAFTxOKiZbyD5er1o7K4P8OktEZOj09kUZyHrqm4ribkIKQILRdIx26LoHUcA@vger.kernel.org, AJvYcCWXpU/jaPhI5/Pj4Dl+m2xy/randV3tfa5KPrvIc1TqglylMn50dLV19LP3IUZfQ1yah+4B2wEf4klUCp2ZEvj/j2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD7NnrcEXcCrnpmC7XfFQa6O1msMQqFoEj+BjVYuWTeqQfIcOC
	6csU7KlbXwgOfU6JPzcSSda9HzvtN1NWkjSlQQjaNBmwqyOQY1GmFmoWXEft
X-Gm-Gg: ASbGnctQiGbx84CNYO3TA9bKkQ9YapgmlmBpQHoohOawt4dOuPZsHyHrWMcz8uZttP3
	jJr6O7a+GCoGvej963Q9WM0I5YkNjU3duCDmG42NnI3rwFJ0f9NCiaskbkrR+kqenYgANChyFf9
	qDhZNo/NvZ941UmCTa7Mxo4QdD8fzlMMeL/SvN0NDz0jUTBwF1u1QMPEJcGveriZ4cL9aZuciB+
	NLX1RwGX6FAReTyXzUMzs8e5D/ok+ot0ZA8DDjwlI9l0PBN4LQHjGZkragK29vCnY0FMbCQ9TWB
	VmL/o4Ui+BSW
X-Google-Smtp-Source: AGHT+IGvXZN6NZ6DCUjVgSjGgOwL6hxcoN/Isc5o4V5nvCkZpRIPRAw8CcCX7KNSIMX6GFZ9E0YgGQ==
X-Received: by 2002:a05:6102:943:b0:4af:605:ebc0 with SMTP id ada2fe7eead31-4af973acbcfmr7961248137.22.1733298622414;
        Tue, 03 Dec 2024 23:50:22 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af590e5540sm2351844137.8.2024.12.03.23.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 23:50:21 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85ba9c6eecdso636996241.3;
        Tue, 03 Dec 2024 23:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5BhlOH3sGy2gK+Bu0gVSvUVa8LyCtOdyOJW2jntI1T+aN+f4Zjz/ispKh8B+sOPs6t1+IQwVUjxrtKT63iqvIapq/@vger.kernel.org, AJvYcCXJIUiLR16bT/TasVUVP3LqHAxY4QAsLbL2WYVfKRHoXm/fMUfriCoja9UkKfJ8NjtzpfWQUhjxTbOV2uY=@vger.kernel.org, AJvYcCXgloqvl8W6cIt8yUHT8XwL/jkcJSi8+ZDbIpqyB5P3VKupbMPaFzkc8ScUHC8WWdorLzBCN34l8BsFtoOXnJMSQ8I=@vger.kernel.org, AJvYcCXvg2phjjO8+U2l+w1mUgB1MX7Adoc3AB9S7gMguz3zMUYGQ8nc3877FvqEBVsbVu3WaclawURlJLKc0g==@vger.kernel.org
X-Received: by 2002:a05:6102:358b:b0:4af:5eb5:843f with SMTP id
 ada2fe7eead31-4af9726c842mr6165984137.15.1733298621087; Tue, 03 Dec 2024
 23:50:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003181629.36209057@gandalf.local.home> <bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
 <20241203155542.462b1b21@gandalf.local.home> <ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
 <20241203220153.3f81f12b@gandalf.local.home>
In-Reply-To: <20241203220153.3f81f12b@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 08:50:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKDbBwUg=YcAPX-ES3+GWpm2ZmFZMczOhEFepfWdB0UQ@mail.gmail.com>
Message-ID: <CAMuHMdWKDbBwUg=YcAPX-ES3+GWpm2ZmFZMczOhEFepfWdB0UQ@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Remove definition of trace_*_rcuidle()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	Paul Burton <paulburton@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Wed, Dec 4, 2024 at 4:31=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
> On Tue, 3 Dec 2024 17:48:33 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
>
> > Hmm. If you say so. Note that powerpc has the same or a similar problem=
.
> >
> > [    0.142039][    T0] RCU not watching for tracepoint
> > [    0.142488][    T0]
> > [    0.142659][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    0.142755][    T0] WARNING: suspicious RCU usage
> > [    0.142914][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> > [    0.143082][    T0] -----------------------------
> > [    0.143178][    T0] kernel/notifier.c:586 notify_die called but RCU =
thinks we're quiescent!
> >
> >
> > [    0.152733][    T0] RCU not watching for tracepoint
> > [    0.152770][    T0]
> > [    0.152995][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    0.153092][    T0] WARNING: suspicious RCU usage
> > [    0.153187][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> > [    0.153301][    T0] -----------------------------
> > [    0.153394][    T0] include/linux/rcupdate.h:850 rcu_read_lock() use=
d illegally while idle!
> >
> > [    0.165396][    T0] RCU not watching for tracepoint
> > [    0.165540][    T0]
> > [    0.165712][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    0.165811][    T0] WARNING: suspicious RCU usage
> > [    0.165909][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
> > [    0.166026][    T0] -----------------------------
> > [    0.166122][    T0] include/linux/rcupdate.h:878 rcu_read_unlock() u=
sed illegally while idle!
> >
> > and many more.
>
> Grumble. It's just that one file. I wonder if we could just do a hack lik=
e
> this?

Thanks, this fixes the issue during ARM s2ram, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
> +#define trace(point, args)     trace_##point(args)
> +#else
> +#define trace(point, args)                                     \
> +       do {                                                    \
> +               if (trace_##point##_enabled()) {                \
> +                       bool exit_rcu =3D false;                  \
> +                       if (in_nmi())                           \
> +                               break;                          \
> +                       if (!IS_ENABLED(CONFIG_TINY_RCU) &&     \
> +                           is_idle_task(current)) {            \
> +                               ct_irq_enter();                 \
> +                               exit_rcu =3D true;                \
> +                       }                                       \
> +                       trace_##point(args);                    \
> +                       if (exit_rcu)                           \
> +                               ct_irq_exit();                  \
> +               }                                               \
> +       } while (0)
> +#endif
> +
>  #ifdef CONFIG_TRACE_IRQFLAGS
>  /* Per-cpu variable to prevent redundant calls when IRQs already off */
>  static DEFINE_PER_CPU(int, tracing_irq_cpu);
> @@ -28,7 +59,7 @@ static DEFINE_PER_CPU(int, tracing_irq_cpu);
>  void trace_hardirqs_on_prepare(void)
>  {
>         if (this_cpu_read(tracing_irq_cpu)) {
> -               trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
> +               trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>                 tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>                 this_cpu_write(tracing_irq_cpu, 0);
>         }
> @@ -39,7 +70,7 @@ NOKPROBE_SYMBOL(trace_hardirqs_on_prepare);
>  void trace_hardirqs_on(void)
>  {
>         if (this_cpu_read(tracing_irq_cpu)) {
> -               trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
> +               trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>                 tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>                 this_cpu_write(tracing_irq_cpu, 0);
>         }
> @@ -61,7 +92,7 @@ void trace_hardirqs_off_finish(void)
>         if (!this_cpu_read(tracing_irq_cpu)) {
>                 this_cpu_write(tracing_irq_cpu, 1);
>                 tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> -               trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
> +               trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>         }
>
>  }
> @@ -75,7 +106,7 @@ void trace_hardirqs_off(void)
>         if (!this_cpu_read(tracing_irq_cpu)) {
>                 this_cpu_write(tracing_irq_cpu, 1);
>                 tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> -               trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
> +               trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>         }
>  }
>  EXPORT_SYMBOL(trace_hardirqs_off);
> @@ -86,13 +117,13 @@ NOKPROBE_SYMBOL(trace_hardirqs_off);
>
>  void trace_preempt_on(unsigned long a0, unsigned long a1)
>  {
> -       trace_preempt_enable(a0, a1);
> +       trace(preempt_enable, TP_ARGS(a0, a1));
>         tracer_preempt_on(a0, a1);
>  }
>
>  void trace_preempt_off(unsigned long a0, unsigned long a1)
>  {
> -       trace_preempt_disable(a0, a1);
> +       trace(preempt_disable, TP_ARGS(a0, a1));
>         tracer_preempt_off(a0, a1);
>  }
>  #endif

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

