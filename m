Return-Path: <linux-mips+bounces-15071-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ZH1CIesL2qZEQUAu9opvQ
	(envelope-from <linux-mips+bounces-15071-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 09:40:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE2684471
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 09:40:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="JWp/+HCa";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15071-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15071-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B33C3001F86
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 07:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4B53BBFC5;
	Mon, 15 Jun 2026 07:40:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098513002DC
	for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 07:40:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509250; cv=none; b=YMiKQH2HuyYH3VRMTdBT7CpLpjdC+KehMxqUyBCskzo4tbn1Qob6TZRAj10Z4M4fDUjEuuzpLfe4//cHbrwjFnJHdUzhYZ6fgq/mzC9XvJPeZS0/jMeTGjCR2T9Jir/2qorCE3Hcsl4x/WTxciQ9pLfwU9f6tgijSlyLoinjHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509250; c=relaxed/simple;
	bh=7gTGoROcY88FIx0BKI9qz9m4P1KC5KNO+9LCkMExk6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epfk81Km/VWft3oq6bNIEMlYdTrCmg1ppBawAJ268fvgblZsVLcuZHjRfHLhZzSypRtltbSdMTfTcE6QKkF9oTc6ex9DauSpto5ekequ7s6obbE2vbRAEAe/+fh84Kaoqg5rZU054q6G4GOov6dtLARuMuctUMtQWQOqwW+8Sdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWp/+HCa; arc=none smtp.client-ip=209.85.218.47
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec4639953dso481193366b.1
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 00:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781509247; x=1782114047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gTGoROcY88FIx0BKI9qz9m4P1KC5KNO+9LCkMExk6Q=;
        b=JWp/+HCaUhyEnt2o/PJZ0btNxmB7yrbB5dHGBysqFYgc2VBD60QKSDWlMKZdI73pmN
         2FEqtzYk+DAU/Ns/Hfgp/Fgbzap7TfDGfXylG7kqMhbWktryZ6U0j+DUCrhxLphbhWJG
         Rk3t27QhUM4IlXtzP0BEgoBntsSwFS/3IKw6uaDUUQjBfQ4hH/lCjRuX12jrndjG7Xo0
         +UfCtGpXOSO4AgJ1rGR9a/Smv/NP2aTLYzuUp1bWzHnwV3hTaV/qaArMVdVmxqekd4g7
         xfX5Y/0Z30yLbAqKt1glo/cj0/gBwv72A8CJ6MN8YIdukyBlyYbbQFcBqo2VlYJ2s3X/
         DtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509247; x=1782114047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gTGoROcY88FIx0BKI9qz9m4P1KC5KNO+9LCkMExk6Q=;
        b=NFdZlEWlpW0W3lgDdKZSDm8P7ObrSQB5iW451Iq0m0NQAiAILubIPWwV4HFp/uYSTo
         NyrcOldlBG+QZenI79a3FfiWLgfm0o7/3dX4H6DTQojhkk/xdaX4n3fjOlcS+ZAc0zaz
         xOi4JUzPtUltpAfcqKo8LrRPpvaOU2ySSBMu8W84qsZfAKumdmzmpiMfEGAjSCPsX3Po
         nBkPQXY41wqNBXjcEQm6MWWYKXSHZweuQAD2Ia/aUwQyR9Bn67AUczBQypPYmsUoDhWx
         ZJIKVDzYGcopREL3lflUcW4pwpprhXiSDAsle6k0vqBprqWxNkffoiAAT8ua394FqmDz
         /v9Q==
X-Forwarded-Encrypted: i=1; AFNElJ98aQq0qTEqFDqXpQWRP0xVcKBATSyIu50nNtW17nPcU2LCmAE0zjU+X4ejEV6xYgqRTbKAsi4yye53@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/sIVTyuVdjb+GI9a7GT8ZJO/vZmX/6Q8CGVWAp+sPurfWed+d
	kPmKlK3w3KJ8BZwxFimRm7CYx/FmrOoGclm0QBxpbNPXSwZVbk4yrguI
X-Gm-Gg: Acq92OHopNqR7qd0wp7rY0a1EywcNtYg2bCOetRIMhV4y41SIV79oykgFQ79qqCyuSp
	1cD0H3jO/vkWeuGXjR/2Z3IBMaaRXfryBe8JG1Q+7s7h0A1qQPxz9hWK2C9JeKPbMoJS6tMgA/W
	l7qUnzrwiKGieilxxUac00dcorJSSQhKgH/v5m0u8rj//aAPpoRejlDk2/7k3rslXeksD5L7mz7
	4ckWMNI5D+lTVDtlCFsa9VebmD9fdG7nRHMYj3gHX1G1x/LzGq7WkOLNYl1PJqDCjK5HJzQh+OM
	KWyvgRyCje3nW4cwn23DbzlcO5qBjlvI4iIvQQW4fz0TpemHyPR/TDWOpV02OX+DTCiYwLC5HJE
	Hc5wNobqLBMaPqY9C9vAeGjqYEhP4bmpyMdu4lTT1UwUd6GKztJIHjjEqj8rKABqxZhPkTECla1
	oZ00NbDaSod6YsFHApnA8xR7NLusyO2r9uepDAJZ0scp2Gl2EJ5ETcOHzqqyB2i4A3Z52vv3KFt
	77XoEd7FwhLVYjcMQf3EtAt7w==
X-Received: by 2002:a17:906:ef0d:b0:bee:d554:f332 with SMTP id a640c23a62f3a-bfe282fb76cmr579858166b.16.1781509247059;
        Mon, 15 Jun 2026 00:40:47 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f12e:9401:c875:96a4:7b6f:72fd? ([2001:9e8:f12e:9401:c875:96a4:7b6f:72fd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22544sm413400966b.14.2026.06.15.00.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 00:40:46 -0700 (PDT)
Message-ID: <9cd444b3-aeb0-46bb-a8a3-1526aa8f191a@gmail.com>
Date: Mon, 15 Jun 2026 09:40:45 +0200
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
 <731bd6c4-0f70-45a2-8480-8fed315b82b4@gmail.com>
 <CAAhV-H6Va1VzpvdA-w5fX9KrZQArdX_Bjpg6t+4QNn3jHfgjmA@mail.gmail.com>
 <e9696d4d-7cd0-4d7f-af87-2b4631549475@gmail.com>
 <CAAhV-H5psOJQey+frswdc5Q76UnhCkrHJ_jtqvxHsfmi-dskyw@mail.gmail.com>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <CAAhV-H5psOJQey+frswdc5Q76UnhCkrHJ_jtqvxHsfmi-dskyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15071-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DEE2684471

On 15.06.26 09:30, Huacai Chen wrote:
>> [...]
>>
>>> However, synchronize_rcu() only gets called in the
>>> IS_ENABLED(CONFIG_PREEMPT_RT) case, so I think your configuration
>>> needs PREEMPT_RT, right?
>>>
>>> You said this is the default behavior, but PREEMPT_RT is not enabled by default.
>> The condition where this is added has two parts, see [1]. While PREEMPT_RT
>> isn't active for MIPS, arch_irq_work_has_interrupt gives false for MIPS (since
>> there is no implementation and it falls back to the generic one). This then
>> also calls synchronize_rcu.
> Sorry, this is my mistake, then what's your preemption model? There
> are too many config files for MIPS now.

I'm using PREEMPT_NONE, apparently default for all targets in OpenWrt.

> Huacai
>
>>> Huacai
>>>
>> Best,
>> Jonas
>>
>> [1] https://elixir.bootlin.com/linux/v7.1-rc7/source/kernel/irq_work.c#L291-L302

Best,
Jonas

