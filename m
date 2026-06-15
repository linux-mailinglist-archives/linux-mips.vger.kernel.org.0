Return-Path: <linux-mips+bounces-15069-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /2vlKsqmL2pjEAUAu9opvQ
	(envelope-from <linux-mips+bounces-15069-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 09:16:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 053286841A2
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 09:16:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kWjVpC3W;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15069-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15069-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE0F4300F105
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 07:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F339218EB1;
	Mon, 15 Jun 2026 07:16:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BDD3BBFD5
	for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 07:16:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507784; cv=none; b=pyt5EB0Hy0fUFV8p37SqgX34wgRV61KImIEM4hdTr8xGFuU6ecYPMiita9raS7uqJKwFtO+mtLWcOgsP8PPCWN6PhcRS11Yhfa8AdYweCzYfbTr4Nxs3qflsq5XgnvrW3ptIZSfnuVzJCeWYVKjOwnwFKZSYRsAvLSGi8vP64aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507784; c=relaxed/simple;
	bh=pMkVa6/D2V5ktOGrf4lKmOuLSpOlfMitckdfGHfEAXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDofxGiDYFfad4HhvjOHEIhqB6nJSMsyssNjoOf0BQDMns8whw40anxFDU/NsbW5svK+o3WbpTIJoVNubUN1yYaPubrqOeWgtwhuQKqxsHXNdSqFkpLtih0zuC/m4NjsGxE308vxjKrL/QlZF52tlp0hraTq9+n7xZNIlmoY0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWjVpC3W; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ac357c55so28336935e9.1
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 00:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507781; x=1782112581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMkVa6/D2V5ktOGrf4lKmOuLSpOlfMitckdfGHfEAXs=;
        b=kWjVpC3W3XixNCMfI+ottBHYx6Ct4UnxBrtFmkXzHihZDGxSiOVjUi37TgIov8U8f8
         3pFalL8D8sVh89laF/HDnASgaHJYp2pjES40HFA3b6lHOIOZbYQYvtYDyvKYtOcP9bqv
         34dQui5m3cvmQbm00l4M9jdN+frC2xuh+dfi8a/ucI4tLkTmOu4hGewJdgJYy2nFguC+
         /uoeWHLWbleNxsGAoVnig0g8XqWOcieJJ+aX4ZkwuZ1gQ01KiAG+JrWs1ggpTrGPt7CM
         YgIRgKdzw0+mRZg8GQD8pQpm6lk6rOElApV72jSM63/cvBQq+2LFrcwo0ERU2ioV7iS+
         Mtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507781; x=1782112581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMkVa6/D2V5ktOGrf4lKmOuLSpOlfMitckdfGHfEAXs=;
        b=aAJrIzErjQK4beBSJrjrGhghrC6Y3hfjkKynaMRLts1z5YsmUJDZgf6QFLSA82Mnni
         ICcZzv2JbtwDUoyanYFNvNaHY1GfV9xIWamHk6pJ066CXUGU9rwhgHAVSYmpmGOEBSlP
         xmzXZ/iaVA3MDDopK6v1Y2/bzB1uh7GWAtLwpU4RcPxyenNnCUI4+kOU8nrwqoyJfJ/G
         dr/ksKW6OOekxA8CbkpiU6ckuADodeQ5ujdCYyiPWQOBwb5w6aU4HhkxaUYuMCI/TUn6
         /ev5knRnm6x7t6idlPlKwF2AMJq9ciPnki4x0qIvV2gaAbVwwIz1jA7dxYMMNx20uh9W
         slHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+I/2zGNhExhid4Q1k+/z4kI9lcwZROt0CwdzOkQvqQLFae0NagYkAacU6A4A3SOphV3rUZJ4CGzC6o@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/htHie4Qi+EAxnbWLkboEtPAaML33Pdkk2lwatkOlQnmJTIFx
	QerAOL9sqeRofL31iHN5FxUVhQmWne+B5Ej8khDaRUQtZzQ/BvCc6maq
X-Gm-Gg: Acq92OFpsS5H87X5VY4hK8fAvCPq5M3PKGxy7Hzj7EfNIVYlcHvgp5ohoVhMrQBPtdK
	yQuOnPZhegRHwmU0Isi8XfFpCfIpCIIXMqfkJK5CiUn5w8ZFifPqXgCcwp20Bb2hgXmL/2JgFjB
	7zpoDy1m5Euq3mXf4tUYh2BKKoKQZo2bls7GZwsQgj/RnMMFK8LTcTpRHZCW4MIzFz7vczVCASu
	MmdVcj+DKNMJ1PUKQQZQAsIWNqz5OQLsycGAOKfdxmV/AwPU1TuLNG/SYWRyxMxVyLgtXuXr5SQ
	ZulQ1iUbgvkZAlPZkbySftkPNTM6m9bEQ9nkwCfoQPhEilXUQDZ8WWAs6B5Iyn1eTzZqXoRTxqq
	r3JpnSFi55YSuU0PbhoJ0hkQ81SDz12DNW+jfwJJykSl/rnpecK8MjDHV6GYOOHgMp/XFDBzwOZ
	L2DiOeCGv0TYAl3LRLPBh1Vh2tEXWESe9Fej4Ijn0eQ9fXCyEdqPqwtKJejoxZz/7zvhMW7TLMa
	nEmaWVahU90idv1O7NdngA7Bb7nS4veRi3t
X-Received: by 2002:a05:600d:8653:20b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-490ec4a2984mr118495565e9.3.1781507780666;
        Mon, 15 Jun 2026 00:16:20 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f12e:9401:c875:96a4:7b6f:72fd? ([2001:9e8:f12e:9401:c875:96a4:7b6f:72fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922031b21dsm219645595e9.6.2026.06.15.00.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 00:16:20 -0700 (PDT)
Message-ID: <e9696d4d-7cd0-4d7f-af87-2b4631549475@gmail.com>
Date: Mon, 15 Jun 2026 09:16:19 +0200
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
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <CAAhV-H6Va1VzpvdA-w5fX9KrZQArdX_Bjpg6t+4QNn3jHfgjmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15069-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 053286841A2

Hi Huacai,

On 15.06.26 09:09, Huacai Chen wrote:
> On Mon, Jun 15, 2026 at 3:00 PM Jonas Jelonek <jelonek.jonas@gmail.com> wrote:
>> Hi Huacai,
>>
>> sorry for the reply delay.
>>
>> On 10.06.26 08:05, Huacai Chen wrote:
>>> [...]
>>> In theory LoongArch has the same problem, but I cannot reproduce,
>>> should I enable PREEMPT_RT? Or there are some special configurations?
>> Sadly I cannot help with that. For MIPS, this seems to be the default
>> behavior.
> This patch fixes 91840be8f710, and 91840be8f710 adds synchronize_rcu()
> in irq_work_sync(). Your problem is caused by this synchronize_rcu(),
> right?

Yes it is.

> However, synchronize_rcu() only gets called in the
> IS_ENABLED(CONFIG_PREEMPT_RT) case, so I think your configuration
> needs PREEMPT_RT, right?
>
> You said this is the default behavior, but PREEMPT_RT is not enabled by default.

The condition where this is added has two parts, see [1]. While PREEMPT_RT
isn't active for MIPS, arch_irq_work_has_interrupt gives false for MIPS (since
there is no implementation and it falls back to the generic one). This then
also calls synchronize_rcu.

> Huacai
>

Best,
Jonas

[1] https://elixir.bootlin.com/linux/v7.1-rc7/source/kernel/irq_work.c#L291-L302

