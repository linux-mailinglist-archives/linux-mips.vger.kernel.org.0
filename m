Return-Path: <linux-mips+bounces-15067-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ar4dLv+iL2pZDwUAu9opvQ
	(envelope-from <linux-mips+bounces-15067-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 09:00:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59226683FE0
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 09:00:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HCd2ju4M;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15067-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15067-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9A673003624
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 07:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EF23B42FF;
	Mon, 15 Jun 2026 07:00:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2733B47C9
	for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 07:00:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506814; cv=none; b=HNPmt9+9ADVjYfpOQZBgteCVXry5YFWBGi/ZFEJWuZBYqJtlrmCViQ9h84bWCoTx3ai9d1HLqHUdKqH8ybKbbd+ulbou5taBQL53MfrvyrnuFwvtpgLwxjOV0vYXdqM/yf+hUW9TEX/e06VzgkygQL0jF33ZAGfi8LVyHxsq4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506814; c=relaxed/simple;
	bh=gn2ssXC1ejqemrvTuLo38/1m205JY8o5WvjCLUAl4Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pv9RIvbQAdDPA9L2umxWNv5UpuojvLHIkDkbVExk5WJCCcm1L8vbk3WAmsxpbvx3H+fvdj877yORXKgsPYr/YKrcktR9Bb55hCW7Yv6SXUZqOhG0nc1kkE9lwz4UgVvKzYojQZ2SQ0e6mZaGXZsoEiXtrc0Goq3ol0sDRX4j22I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCd2ju4M; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so22529515e9.0
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 00:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506811; x=1782111611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8w8xq/4mVkW1zPaq+z+yq8eteQWjYrXoGXcozsWmpc=;
        b=HCd2ju4MSe05WVZ7QBJNvt1sn29Aw6eWWAmH2k7qUC+bQYb53gEtEvEuOcKaLZWlOe
         JfWmgb4NJxLA61916hpTSFWc1qCtvZS5R8/CQj0sduFSSEuO0WDdAKjBRAW7MtYINEY6
         0VVSGKZh6nYlij46mLLDeCIADSt15jRSr4lCh9YquPVJVROsdEKaJnuO43vS/fO337PM
         Gm7nhL3xFAlBYllxgAE2HVJlQCHEjEIis5IS6b/URCgq0cDARar9J4tBcQIORFBSCt8d
         6m1CmNzUk9v5i37gDwRZh18jtyuMmwJNVfEyHAQx46/pE41EyYyoa+t59/lnwY9UacTo
         GTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506811; x=1782111611;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8w8xq/4mVkW1zPaq+z+yq8eteQWjYrXoGXcozsWmpc=;
        b=bhEjou3/nusWBCMj2qDx8i9MT0RhjPtQqMKfcnHgHdPmMInlIoeASalyJEfr5/amoo
         WYemSH20IJkgK6KDpID+KOe4dLr2cKpdmVYoMURtkS9f0XQocLOwxgIIkklYiExkaCz9
         5WH/xo+wvYFuUoOc6PY0fD6ndHGs32cgunIPQso916ia2GKxo4+FLvdJZG/+sKZf84vh
         a0x0nzg205aUMgTu9kMiZLNjgBj2YCyuTWNFg62NUjRX8itgAlNE2YwpPLylajhSp0RX
         vhhYQTWl8uKv5j2eqLbFBh0f8mH7yC3UFIURP8UCct2LpZ2pwvLH4RyrwreohnePWlPM
         kxbA==
X-Forwarded-Encrypted: i=1; AFNElJ97gE5k4UfCn7qU8MXmWguNjEpgIH3+tyQhgpxmTmKIZCvuOC3qDSiDIo9RP2Xgq+DDdpEC3ZN1dYOf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvo92bLkmLyikAWhQh1XT6nvocnQYnrzHEGaAUMPzXXk7TUzUl
	LsJtwQs7D2bH7XrG15Q664PPfuolZc0HXTNB/B4S7rTZC2JBlMToPcA7
X-Gm-Gg: Acq92OHPDPzY1bXzjRbtdsHixBgCiggzSfxnPxFrrJzpI5/IjD4R8WmTCfmVMJyU8tC
	+l6vwTLTnR3cxeG9V2G0TgSQBNtaDwcNyEuiP6aqna8c72PyAVp8t/+NpSlQt+hemIy008kgxQV
	/AqmoZwJ3Ji4g71f0e07Gx8BlaZhyyA1KA1Mf2q6VQKhw0sXj7oZxKmBsWvKYIiWcXCPW7Slqm9
	CLjSoKanj0w7qbm6ddvBWFYS5AtmR5ftzxpB96bj8DrQhmWG9/B/8fatzgIYZRYo556QSD4kW4e
	g3Rvu9ICSkhovkXlHJuShmOtuBlZjGLXlRgM9Fk9qmmqYblW0Pp/8yfcaXd87Tizfs9H6DpVMri
	64j7IgXrnOZ0t9bj174WI43rZH7tMjcptfSY5tN1S/SQ4k3fxOoZemP3In7IrD4lGyT9Z54JyNc
	SebwZ+bWunrNaBzd7/3AY5MzwAU4ezM4haCObZ7bLSJszgcswyXu8GBeqNJc9UKza3jQ4Pysyi9
	6QSim6fcNk6ACn9bYxGgko+CA==
X-Received: by 2002:a05:600d:6447:10b0:490:e18f:d108 with SMTP id 5b1f17b1804b1-490ec501b2cmr122824265e9.19.1781506810190;
        Mon, 15 Jun 2026 00:00:10 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f12e:9401:c875:96a4:7b6f:72fd? ([2001:9e8:f12e:9401:c875:96a4:7b6f:72fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a399fsm217664565e9.0.2026.06.15.00.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 00:00:09 -0700 (PDT)
Message-ID: <731bd6c4-0f70-45a2-8480-8fed315b82b4@gmail.com>
Date: Mon, 15 Jun 2026 09:00:08 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, linux-rt-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260608093729.12111-1-jelonek.jonas@gmail.com>
 <CAAhV-H7vJ5YniUD8HhFWBbypNyWTo73M_vzw=Y-MZtR-b_RNfw@mail.gmail.com>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <CAAhV-H7vJ5YniUD8HhFWBbypNyWTo73M_vzw=Y-MZtR-b_RNfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15067-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59226683FE0

Hi Huacai,

sorry for the reply delay.

On 10.06.26 08:05, Huacai Chen wrote:
> [...]
> In theory LoongArch has the same problem, but I cannot reproduce,
> should I enable PREEMPT_RT? Or there are some special configurations?

Sadly I cannot help with that. For MIPS, this seems to be the default
behavior.

> Huacai
>
>> This issue was noticed on several Realtek MIPS switch SoCs (MIPS
>> interAptiv) and came up during kernel bump downstream in OpenWrt from
>> 6.18.33 to 6.18.34, after the backport of the patch to the 6.18 stable
>> branch. The patch also has been backported all the way back to 6.1.
>>
>> Call rcutree_report_cpu_dead() once interrupts are disabled, mirroring the
>> generic CPU-hotplug offline path, so RCU stops waiting on the parked CPUs
>> and grace periods can still complete. MIPS shuts down all CPUs here
>> without going through the CPU-hotplug mechanism, so this report is not
>> otherwise issued. Reporting a dying CPU to RCU outside the regular hotplug
>> offline path is not unprecedented: arm64 does the same in cpu_die_early().
>> There it is an exception for a CPU that was coming online and is aborting
>> bringup, rather than the default shutdown action as on MIPS.
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
>>         while (1);
>>  }
>>
>> --
>> 2.51.0
>>
>>

Best,
Jonas

