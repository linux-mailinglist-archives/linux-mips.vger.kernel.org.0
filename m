Return-Path: <linux-mips+bounces-6889-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 845739E516B
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 10:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07B1518803F6
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 09:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C7D1D2F54;
	Thu,  5 Dec 2024 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="i/UaASKS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD2C2391A4;
	Thu,  5 Dec 2024 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733391166; cv=none; b=gBGUywnWWuhZ4L3c6Qb+TgEXm8qmovbRvgy5TwEQKBR2d6aaBGCI3kTJ3BlUBTJJEsNyKfxjrQFfEGfRBRPn/EHMQqS+1KEwRHwct4cnM+2Om1N34tRX3wH5wKm7OjPOyt29zPvgmZ0Fne97dWL3btErP4JInOTZv4PZet9P9a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733391166; c=relaxed/simple;
	bh=ykpGI7/7XbRD3iJhq8FhOIZ6PUAW5EEEMoBDU5tKsV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AErPvsI9yrxe3fO7YVA+Gcti0aeJPhxrCeprAE16urODXGBaavIC/ZM6DNyD1azA0vgNJvj2UGT5+27dycETJ4OI2ajWX77tpNErhxiNOAHMx21H/lgj2bw6WDa1niiitt6QtnZN1T7gTYj2hHOMMENpzfye/uWcmBlpqW5Oy3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=i/UaASKS; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B56pThl001983;
	Thu, 5 Dec 2024 09:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=60RIvD
	UpT9S2Rm4TbMmqWTeMBYTo514g8EBdwknaRXA=; b=i/UaASKSeAMDruDOSS5qhp
	W41mCMoqA6naB8gl2w/btSJK0wqsufpTqrnp9qugqIPogqZxKjTFoqZQT5M8PKbz
	QNIMbzrLgAH3mll8DEvgamnKRyw/Z5+diz08H+x14sKO4IMqHa13cGm4P4jv2L4U
	qh+JIVNnfgytosKqIxfRXfgTNUzDYl8JIj+xy3JPd81FIbgtOAYFCVD24pnro11k
	ptRPhaNYX8oIVFq8kcIz6AlNRA/rC336x/0qrGOSCsIdszTwTLpngosg819GCBBF
	A49gzbrxsVxWodOvrQYlgVXLohxZfy48Mlq/OIUl4BbTWBmrGv8jFkSA7tjTo1Fg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437r4pvrft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 09:32:09 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B556ReB005235;
	Thu, 5 Dec 2024 09:32:08 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43a2kxqw0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 09:32:08 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B59W8fv29753932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 09:32:08 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E0765804E;
	Thu,  5 Dec 2024 09:32:08 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF3655803F;
	Thu,  5 Dec 2024 09:32:00 +0000 (GMT)
Received: from [9.43.63.110] (unknown [9.43.63.110])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Dec 2024 09:32:00 +0000 (GMT)
Message-ID: <eb8d6fbc-4c87-44cc-b69a-4a397ebc2e67@linux.ibm.com>
Date: Thu, 5 Dec 2024 15:01:58 +0530
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
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        "Paul E. McKenney"
 <paulmck@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
References: <20241003181629.36209057@gandalf.local.home>
 <bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
 <20241203155542.462b1b21@gandalf.local.home>
 <ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
 <20241203220153.3f81f12b@gandalf.local.home>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20241203220153.3f81f12b@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o04zhgZjbHsTW8kusHOZJFA4pxD-_NVG
X-Proofpoint-ORIG-GUID: o04zhgZjbHsTW8kusHOZJFA4pxD-_NVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412050066



On 12/4/24 8:31 AM, Steven Rostedt wrote:
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

Below patch fixes the issue in powerpc
Tested-by: Madhavan Srinivasan <maddy@linux.ibm.com>

Thanks
maddy

> Paul?
> 
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
> 
> 


