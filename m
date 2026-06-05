Return-Path: <linux-mips+bounces-14912-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DTxlJt90ImqoXgEAu9opvQ
	(envelope-from <linux-mips+bounces-14912-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 09:03:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC229645BF8
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 09:03:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EQIGjZpy;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14912-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14912-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F6503000A62
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 06:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFF1380FC1;
	Fri,  5 Jun 2026 06:56:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B4E33F8CA
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 06:56:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642590; cv=none; b=urNNCvaa5YoSBnb9D5E+JngwHhgOtxy63yDL63vmtcFlRL57EGmPHERQOguIV0+WyGR86MZ5MljgxrUqfBw6OShyPyWdbXf/8YOghNhYVInewvD37ow4hMzziy1XPZzwgmB9NPvjPjmcV3FMAve5/gCHZ9gnot/p8BkkRT+oy98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642590; c=relaxed/simple;
	bh=ZDvo2JB+1+eOw28zDMz66JG84t71fIwb6lfT3Y+53hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mC/6doD1N8PL1f/n+ai/+FQg4fE307uS9eUmUESlSb4ARj6/CjDRuacNPMP4ZzJiTqm9Em0RtZeef7pONYvXnlnHM/337V0gPxuchqDNEtYnblcRItU89/X3CmLKdR/vEV0lmQN86goaymrCXjr7La8b29krGqJpame3ZPUtnwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQIGjZpy; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1105550f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 23:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780642587; x=1781247387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCTmNu4jgb4r7pFyMhscOVe9W8lUl5WIYLcG+5Yn3NU=;
        b=EQIGjZpyoAPkkcw+DI2ludlABPF7YBAfaO5u5q9WUzEwR9Au3BAIBfNI5JiymA3yHS
         e4LLgDW54CbO71ZclsAExlKkkSB3Fv1CAY5YMahFyx0u+nGmbIkSh35qGFGI5RTGXfal
         9jszspuhlcxaLz4yHDy6I425umatBDOqUhWpxfW+jwrK3G7HN54ls+o3ieiNZFlveti6
         kpEZB+dAHhK6tVjkx5EGGSbyjpRHkczD7tr6FowAm8r8tnmkpkUx8l7ygL9QjjRt1EB8
         R58ZS+9XSWHua2tiYtLLmE2CX+uOgqz+D3jg3rcCigECa5duPegtbObKCP/jlCPjFNKU
         aFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780642587; x=1781247387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCTmNu4jgb4r7pFyMhscOVe9W8lUl5WIYLcG+5Yn3NU=;
        b=CR0kGpSD/u9ycLllSwBrZU/FA8yVT4/BHzfLmIx6Mpemj8KswDT0sLOJMnU2gml/h4
         7BfSdTOiNd+cipfE2y2Iz6dDkkEqjpDhxh56aza8RzXcYvyBYXdFDUYTkBItDDFMVlbK
         BpiZnWdt3rt4Iz4raHFU2BFP3+EzkDO8kHAO5aYKeSkFbcqmCtmH4O0jkEvS0YFAe0JR
         P9jHkqrtUjl+0yss/1PkNcSU6qhVnk7zcWuI2lPmIcBA9b83Ls+qgYkzKl5sdmXhpqqX
         Cj0WG2Wgkuot1bJM3+FyslUAldXYIiLHMCVNLINk5/ABOXe7iGjCQ/MuuhDgyyBROEvM
         YAew==
X-Forwarded-Encrypted: i=1; AFNElJ/GVGKl4Rk8iEIIGEI77P7qVndQhBmY0VB1JqndIi311kLW6HZnSXKhIGklCgkB6xbrVr23GQxXN9f+@vger.kernel.org
X-Gm-Message-State: AOJu0YwS7R7a3L9TrEBTggs60TcpNnWA8K3qJkPnYpQZsn+2bHvTPihN
	hGawNL/uAGhz7ldL0xwAIeNpvTOPpsjmwAYyIbftKNAXzkDEpfHc1Iy4
X-Gm-Gg: Acq92OGzuT6vN8wuEZsBu6lQ+Dyq7GUqgHTkufXb+NFQJEJ2Uge2DOLqhz31M65e+/4
	itR58fdr/NKb8qVXfTeW7aWPY+QF0hnmvxYKQiw8HG5m/ibusC9YfJEiXZlIz0kVs3okcEGjWVf
	7DaDXl2fUehmq0VthUHngGlSkdpc25QI+pYuVVS/f9V1bpe9zpES0BYZSO1OVz6nPuavZx1bkJS
	RjMskSqIMTZI1kujEjgLKJaGltLOtGI/IWwBkk85fXNQcIfGVak22EVqsgOg52w3lzu5UGHwm31
	OxYS+Z8obAHY86sx/KVUSDDD+wYMpFifMmDVjHcozG3G//77ACF694D6VEiMi4xA0gyT9cYt+Q9
	sRgaUPT3w7jwK2SThEpTocOBWlXQCXNbWSgEZxrW6ExOvVOsAa1EF+UgTzl9hMwHw0iIb2uP492
	r/b5rx6gA0m4R/nV8SaMHNzlXwy7UEKOfdbvOMan9n123ebx230AJJXuuPyYC78Pv3h6I2q9kCb
	XRLt8RO1IMcdgDVMj8d4992c+aFJqaXABDG
X-Received: by 2002:adf:e006:0:20b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-46030658bc5mr2487297f8f.29.1780642586855;
        Thu, 04 Jun 2026 23:56:26 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f133:a901:840b:2bf2:919c:cec5? ([2001:9e8:f133:a901:840b:2bf2:919c:cec5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm22537060f8f.2.2026.06.04.23.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 23:56:26 -0700 (PDT)
Message-ID: <e009fc98-73b7-4d3a-9b0b-7b6d37570dc5@gmail.com>
Date: Fri, 5 Jun 2026 08:56:25 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, linux-rt-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
 <CAAhV-H6khmNSNLOpVzV2B9qmRVAZkY6w8nYVrJC6QBP5CrFd3w@mail.gmail.com>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <CAAhV-H6khmNSNLOpVzV2B9qmRVAZkY6w8nYVrJC6QBP5CrFd3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14912-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chenhuacai@kernel.org,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC229645BF8

Hi Huacai,

On 05.06.26 05:01, Huacai Chen wrote:
> Hi, Jonas,
>
> On Fri, Jun 5, 2026 at 2:25 AM Jonas Jelonek <jelonek.jonas@gmail.com> wrote:
>> smp_send_stop() parks all secondary CPUs in stop_this_cpu(). The function
>> marks the CPU offline for the scheduler via set_cpu_online(false) but
>> never informs RCU, so RCU keeps expecting a quiescent state from CPUs
>> that are now spinning forever with interrupts disabled.
>>
>> As long as nothing waits for an RCU grace period after smp_send_stop()
>> this is harmless, which is why it went unnoticed. Since commit
>> 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT")
>> however, irq_work_sync() calls synchronize_rcu() on architectures without
>> an irq_work self-IPI, i.e. where arch_irq_work_has_interrupt() returns
>> false. That is the asm-generic default used by MIPS. Any irq_work_sync()
>> issued in the reboot/shutdown path after smp_send_stop() then blocks on
>> a grace period that can never complete, hanging the reboot:
>>
>>   WARNING: CPU: 0 PID: 15 at kernel/irq_work.c:144 irq_work_queue_on
>>   ...
>>   rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>>   rcu: Offline CPU 1 blocking current GP.
>>   rcu: Offline CPU 2 blocking current GP.
>>   rcu: Offline CPU 3 blocking current GP.
>>
>> This issue popped up during kernel bump downstream in OpenWrt from
>> 6.18.33 to 6.18.34, since the suspected change has been backported to
>> 6.18 stable branch [1].
> Now 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single()
> on PREEMPT_RT") has been backported to as early as 6.1 LTS.

Yes, as also pointed out by Sebastian I should adjust this paragraph
to be more accurate.

>> Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring the
>> generic CPU-hotplug offline path (and arm64's stop handling), so RCU stops
>> waiting on the parked CPUs and grace periods can still complete.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.18.y&id=18c0456ea2615b1a743a6db739c74411c3b42bc6
>>
>> Fixes: 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT")
>> CC: stable@vger.kernel.org
>> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
>>
>> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
>> index 4868e79f3b30..0f28b4a62e72 100644
>> --- a/arch/mips/kernel/smp.c
>> +++ b/arch/mips/kernel/smp.c
>> @@ -20,6 +20,7 @@
>>  #include <linux/sched/mm.h>
>>  #include <linux/cpumask.h>
>>  #include <linux/cpu.h>
>> +#include <linux/rcupdate.h>
>>  #include <linux/err.h>
>>  #include <linux/ftrace.h>
>>  #include <linux/irqdomain.h>
>> @@ -422,6 +423,7 @@ static void stop_this_cpu(void *dummy)
>>         set_cpu_online(smp_processor_id(), false);
>>         calculate_cpu_foreign_map();
>>         local_irq_disable();
>> +       rcutree_report_cpu_dead();
> I'm not sure but maybe it is better to before local_irq_disable()?

rcutree_report_cpu_dead() starts with lockdep_assert_irqs_disabled() so
it needs IRQs disabled already.

> Huacai
>>         while (1);
>>  }
>>
>> --
>> 2.51.0
>>
>>

Best,
Jonas

