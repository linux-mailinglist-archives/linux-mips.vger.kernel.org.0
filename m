Return-Path: <linux-mips+bounces-6855-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 365389E3305
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 06:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 032E7164DB6
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 05:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759E6170A23;
	Wed,  4 Dec 2024 05:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kP7hKH+d"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5E944F;
	Wed,  4 Dec 2024 05:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733289393; cv=none; b=CLW4uiKQ2H0ETjK+yXo1qBa18hpX+V+rr9tnhjSPF/WL78oBLd0/0KrIrgRR/9Ajr+lQT1LtB1Gto4iwqX5ai4o4WsvRQEZaGxbL4a8abzQnRiBLRoWUVE9IcB4FbwtBoRyTNtfwCFXwzTgdmKUNeLxoPTmdSiVITQ0F+SbDojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733289393; c=relaxed/simple;
	bh=/OEXixcrQLUuMkXZT+o2PNaXJ2M8qTwmB1zQ0BATdWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FN0wolDtAD/Y5ZBO5OheAN1AGAh6ilXpxA1+Lqie/BoBncCKuNaNl/2LVK2j/ovHqVoP48+tXI1xBVobD4l2DjdZ5JP7sTQPRN8IG4IomgYOfAXa+fIaHLjNhKmyyKRDJH0YyqsRPoJwNEpGWAaMCNnGOW5YxdIBcxQBiP3zqhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kP7hKH+d; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-724e1742d0dso5345562b3a.0;
        Tue, 03 Dec 2024 21:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733289391; x=1733894191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TiSVKQ2PfyDcwyXn0Yjy8e1XU7a4tM+Ymw48rvWbtkI=;
        b=kP7hKH+dYZGkSgLGV7DGD7pAYH7OsbKnK9CX+LDNt2VqEY7q8HLQajNgb1hN2/OVWn
         xYYhocI7vdanQGLg7EE6FqQr2fJVwJFvzR+dXFrSJ8Np+M08Yc9ZuwC5O/54TLVY9DEF
         3NnEpga4p3dJiJR/SJJIdICwShMYVsgHtInMgKiMp+1Ipx2cB4Xvklh+6Jwb2NHrSbCq
         eZwD0WA4oySQ0595YBqIPQLcUfRplRPRqzNnCfxXcSMfYv5MfsapBH56vF4Um09BTYm5
         0lwk3+tAcHOkDT4cM/HioVjFYwIaZ69RZttjGSiFe5aA1FkBOrEie3T058PdBMIOQP15
         LUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733289391; x=1733894191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiSVKQ2PfyDcwyXn0Yjy8e1XU7a4tM+Ymw48rvWbtkI=;
        b=u3JxFvkQyFS2NfQWJTRxx4mpGgjRWspEUmM4GUXuPxQIit98SJCQKeJnGWTSS3lL1m
         2gVakQKZQZHrpdjh3Js4UQMTMMZsXoBhi6SJEzxZG/FjDaCN5T2zc0uiMyUdHDvK10gk
         FXYhMIOmzNgRnARzkiTMZNLH6ymeyelztqL8KmsHV2PtXT2WMNtsIWVuDFcBzu1oRUMg
         cpmL0DxY2PVV3u7hhZuR19Z/4NPe9U2pbQPRJwOgz+gyP2cOGRUFMydmoTxd5XF5nLaS
         M/Af25XCGNx7gE6AUAYQMHz4PNU8x8mBNMwG5GUoN493fkOUYq+zQbr7TgAktH+Wdpad
         heew==
X-Forwarded-Encrypted: i=1; AJvYcCUaey/SYI0yXR7bM6G6QBaote+Q7JmY8NRCtWCvFttfCQ71/c3FhOL3SI/z8RipEwfiEJBrk8N7rumv@vger.kernel.org, AJvYcCUyuxS9HImqxzOvEaPwzj7Uh/PXMJL99XaV3NKc5fW0wVkkdY4eIuLgQrr/xNXa6j4aR1G6HDK/8Z8M7KruuQ4Ng/BV@vger.kernel.org
X-Gm-Message-State: AOJu0YwagrdQ0G4bY4z4REqh+UTm/xUP48Lo4aqDk/qmIRYkvJ64th0Q
	GNP8n6TOmYbwuslvRzbGrc9Rv2+Ji4ft122G8mlXI39io8wAkZxF
X-Gm-Gg: ASbGncv8+s2wSg1EtZIslAkayl6RMK2KTWSCscuTnUQO1iLIfmqbCloW5nxjpOxWPIc
	xNbbvsMfbMdhPHil1LMd8I43y62TpJhQTmT2KaktWzJN++8mYH/bAqMd9UZ6b9Y4HAP6qM/w2w9
	63N1lP8UPyCvoRTattHX/FvBbI+scB2qsNf1p8323AGaWQx3Ed4Knpv0nJfzHCs8RNXVNrXpF9d
	59gtnM+dZKZCy3shRfc/HUd5B19f8nH14CyxMXeVSPjTb3RgBcP7MbtF4nT6iEq44c+Gu82ydz6
	U3jy833iBkBN85hasK6PhHs=
X-Google-Smtp-Source: AGHT+IGX989wplE8HsEQ8r7Ee7F5kaeGY4Fr1jrJ68LF/WXa96nNbnBvFj8oZ9kYRfVYzhqLBOnOxg==
X-Received: by 2002:a17:902:ec91:b0:215:8ab4:d00b with SMTP id d9443c01a7336-215bd10ebf5mr65555715ad.30.1733289390705;
        Tue, 03 Dec 2024 21:16:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm78774575ad.19.2024.12.03.21.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 21:16:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5be5b6ec-549d-418e-afc6-4e3f24caa495@roeck-us.net>
Date: Tue, 3 Dec 2024 21:16:26 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tracing: Remove definition of trace_*_rcuidle()
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
References: <20241003181629.36209057@gandalf.local.home>
 <bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
 <20241203155542.462b1b21@gandalf.local.home>
 <ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
 <20241203220153.3f81f12b@gandalf.local.home>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241203220153.3f81f12b@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/24 19:01, Steven Rostedt wrote:
> On Tue, 3 Dec 2024 17:48:33 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> Hmm. If you say so. Note that powerpc has the same or a similar problem.
>>
>> [    0.142039][    T0] RCU not watching for tracepoint
>> [    0.142488][    T0]
>> [    0.142659][    T0] =============================
>> [    0.142755][    T0] WARNING: suspicious RCU usage
>> [    0.142914][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
>> [    0.143082][    T0] -----------------------------
>> [    0.143178][    T0] kernel/notifier.c:586 notify_die called but RCU thinks we're quiescent!
>>
>>
>> [    0.152733][    T0] RCU not watching for tracepoint
>> [    0.152770][    T0]
>> [    0.152995][    T0] =============================
>> [    0.153092][    T0] WARNING: suspicious RCU usage
>> [    0.153187][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
>> [    0.153301][    T0] -----------------------------
>> [    0.153394][    T0] include/linux/rcupdate.h:850 rcu_read_lock() used illegally while idle!
>>
>> [    0.165396][    T0] RCU not watching for tracepoint
>> [    0.165540][    T0]
>> [    0.165712][    T0] =============================
>> [    0.165811][    T0] WARNING: suspicious RCU usage
>> [    0.165909][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
>> [    0.166026][    T0] -----------------------------
>> [    0.166122][    T0] include/linux/rcupdate.h:878 rcu_read_unlock() used illegally while idle!
>>
>> and many more.
> 
> Grumble. It's just that one file. I wonder if we could just do a hack like
> this?
> 

The code below fixes the problem for both mips and powerpc.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> Paul?
> 
> diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
> index 5c03633316a6..58098873efa9 100644
> --- a/kernel/trace/trace_preemptirq.c
> +++ b/kernel/trace/trace_preemptirq.c
> @@ -10,11 +10,42 @@
>   #include <linux/module.h>
>   #include <linux/ftrace.h>
>   #include <linux/kprobes.h>
> +#include <linux/hardirq.h>
>   #include "trace.h"
>   
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/preemptirq.h>
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
>   #ifdef CONFIG_TRACE_IRQFLAGS
>   /* Per-cpu variable to prevent redundant calls when IRQs already off */
>   static DEFINE_PER_CPU(int, tracing_irq_cpu);
> @@ -28,7 +59,7 @@ static DEFINE_PER_CPU(int, tracing_irq_cpu);
>   void trace_hardirqs_on_prepare(void)
>   {
>   	if (this_cpu_read(tracing_irq_cpu)) {
> -		trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>   		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>   		this_cpu_write(tracing_irq_cpu, 0);
>   	}
> @@ -39,7 +70,7 @@ NOKPROBE_SYMBOL(trace_hardirqs_on_prepare);
>   void trace_hardirqs_on(void)
>   {
>   	if (this_cpu_read(tracing_irq_cpu)) {
> -		trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_enable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>   		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>   		this_cpu_write(tracing_irq_cpu, 0);
>   	}
> @@ -61,7 +92,7 @@ void trace_hardirqs_off_finish(void)
>   	if (!this_cpu_read(tracing_irq_cpu)) {
>   		this_cpu_write(tracing_irq_cpu, 1);
>   		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> -		trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>   	}
>   
>   }
> @@ -75,7 +106,7 @@ void trace_hardirqs_off(void)
>   	if (!this_cpu_read(tracing_irq_cpu)) {
>   		this_cpu_write(tracing_irq_cpu, 1);
>   		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> -		trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_disable, TP_ARGS(CALLER_ADDR0, CALLER_ADDR1));
>   	}
>   }
>   EXPORT_SYMBOL(trace_hardirqs_off);
> @@ -86,13 +117,13 @@ NOKPROBE_SYMBOL(trace_hardirqs_off);
>   
>   void trace_preempt_on(unsigned long a0, unsigned long a1)
>   {
> -	trace_preempt_enable(a0, a1);
> +	trace(preempt_enable, TP_ARGS(a0, a1));
>   	tracer_preempt_on(a0, a1);
>   }
>   
>   void trace_preempt_off(unsigned long a0, unsigned long a1)
>   {
> -	trace_preempt_disable(a0, a1);
> +	trace(preempt_disable, TP_ARGS(a0, a1));
>   	tracer_preempt_off(a0, a1);
>   }
>   #endif
> 
> 
> I tested this by forcing x86 to use this code, and it appeared to work.
> 
> -- Steve


