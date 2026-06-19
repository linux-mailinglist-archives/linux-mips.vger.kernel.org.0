Return-Path: <linux-mips+bounces-15148-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xIgZNXr1NGo9lQYAu9opvQ
	(envelope-from <linux-mips+bounces-15148-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 09:53:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6906A4752
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 09:53:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PkvNMFll;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15148-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15148-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A87D93026AB9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 07:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFC234C9AF;
	Fri, 19 Jun 2026 07:53:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38BB1FA859
	for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2026 07:53:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855606; cv=none; b=PyIgNIbNkPCZBha53oYZUDN6gScH4aKWhkD6McbhLQvrJ1wqCyJT/Qq1JK2zX0v0dkwhJA1f/px4t46t8HQFXSO69v4wd5IZrp/wSBFtv76egRmpoGocG8bNBU0BPwlJEzHFncmte5cEJVddt0gB+TrRwtqnpG8Je5CKAR9zwpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855606; c=relaxed/simple;
	bh=pX91VZCWjtVn5XntwhIUKqRT2u2/AIqeQRmuIFxuWiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rnt7VwG6DVAPNVmOyg+jDDSdao+k8LIrxuaGbNApHa94UV9Uu+GX0jb+pLCUlRQhvCewK/FwnWMEXuiyMqVHdkBRWtApv9a9sM9Qz2C1sF/sQ04LIVgT3s2zXKOjReQJ2CxGfhfXydNW/EDu5WJMuqCZ3x3kAcRkHLMA9qddz/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkvNMFll; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4629d80fa08so1770385f8f.3
        for <linux-mips@vger.kernel.org>; Fri, 19 Jun 2026 00:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855604; x=1782460404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pX91VZCWjtVn5XntwhIUKqRT2u2/AIqeQRmuIFxuWiE=;
        b=PkvNMFllKGIedUb0Bm4nByFfWNXN+yPpPnOB5OBzqSj41TPUcJaRUjVD/BIu/IcAe4
         M/am1Vm1FzjapfXqM/XhGZdpoEVJKgh00OihjuuU1bNsK6CKmLp/LO7zILR/RZL/bh+N
         kz/GjVcWdYKyCDYWdwytS+3obKrsZhcbjhvjPO9TWUM6HN/SQITp2/ER/T1nMcL7oWYU
         fqOTjX4GkBx3QxgM7t2w4kqXLdrYOw6cGqRHiMS3GH+kB8BsvkIXWZbKPxQet1jAev52
         YvuPd0DlHSZnbxSMGkf9wZsGNHIljjPGFLTIHVU7fzVBR8qLsqDal6PAux3e4RJqSLpJ
         MzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855604; x=1782460404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pX91VZCWjtVn5XntwhIUKqRT2u2/AIqeQRmuIFxuWiE=;
        b=DmAkmnk65wLpn4TOm2fSVIFZJVkl/H9TDmbtAMY6SYWl0gLjk9CWjappeh3HiTBsmB
         CrCtmNriucmik9UZjXvlZjv2TjczPVlyMCHggWQEpaJvJ6Vk24AxAwAsDXfe1bVdd4pY
         EVG3VlBRFQ6NzBp7J4OCEJSMckX8CeHyna1IzI40mAxF76s2mMDbsDmNMDF8Dn0tC8tP
         VZpsUt4OXXJVDyGbGuoupaqnwX2dqckJvcjGXG0BesONlgHSV4vmrlR3AVdR7bkN4tx3
         SUc1eiWIVVcDODwWi91MA7wLRVJermRg1Iem20hfu5u6WKvbNDbFDSRk5McO9DaehbJ+
         v5zw==
X-Forwarded-Encrypted: i=1; AFNElJ/6Elvif+shvF/WTgMk0betNZooB0txjabSW8R+jqFYAFheb4b/TYZNBKSQCI3KrFdxlMFb1I26TobC@vger.kernel.org
X-Gm-Message-State: AOJu0Yza90bnL1H74f2BK/qhLakAEYzWn/UdI8gJSxz3k89RiH22VmK2
	9OeSIXUct3SgKHqIfZYlg7UdxLJA23S/SUmU7eGr20jtBsId0fmTwww9
X-Gm-Gg: AfdE7ckeCoKdhjRn0SeV6DvgbZXz+c1ItmUUyKwX0/W/1IGM+wroiFAXdZdqKlTNO2J
	T//JZ3Rnhbg4w9RB1lYFiCgbCQ30ogjb8q+b3uGSJ6BHezjt4+rsBG6RXPTe3rsEyRNmw5W+F2y
	dZJ3tGrz6XxQaM/Huc3pxHnjjs51YhVqh0B9xl5H48rGD8L/OqvgSHrGxBHwUqkjqkNR5bQFKzt
	PrgQVs0QD89i5MINdIS7jGMMP3lmM8ijcYaKLMDu88/xJ/eRU277RLvKFtlaT7GgP+q/RL15hr9
	v4DsF+SYrVDXWlLgRGc7QwQMeu/x5GJ4VCfta7v1AHRt30EzmZcLtBkIaTGlgMjjBPQFwDTc1sc
	voTSTV7ACXEfTEsI+IWAEZWEvdr2r82DyBu057XUaiawJkNcBkSiwZXG7sgv+qTLAq1tvgAr4bl
	vNsTDVYXT8r4l1c66hfe2krhuVHBRDolYwMGONiYQA1O0unpGi7LDYSKuTYOvNNAimCmo9V1IWk
	cvixfapGfB1ofE=
X-Received: by 2002:adf:e5d0:0:b0:460:6a8f:5d36 with SMTP id ffacd0b85a97d-465085353bfmr3214856f8f.22.1781855603755;
        Fri, 19 Jun 2026 00:53:23 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f106:a001:409c:b132:5c19:42ef? ([2001:9e8:f106:a001:409c:b132:5c19:42ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46508a04b55sm5915595f8f.5.2026.06.19.00.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 00:53:22 -0700 (PDT)
Message-ID: <7130ff1c-7c6e-4a82-868b-7f6c60c98e7d@gmail.com>
Date: Fri, 19 Jun 2026 09:53:20 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, linux-rt-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260608093729.12111-1-jelonek.jonas@gmail.com>
 <20260619074323.IIq-0qan@linutronix.de>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260619074323.IIq-0qan@linutronix.de>
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15148-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:chenhuacai@kernel.org,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jelonekjonas@gmail.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D6906A4752

Hi,

On 19.06.26 09:43, Sebastian Andrzej Siewior wrote:
> On 2026-06-08 09:37:29 [+0000], Jonas Jelonek wrote:
>> smp_send_stop() parks all secondary CPUs in stop_this_cpu(). The function
>> marks the CPU offline for the scheduler via set_cpu_online(false) but
>> never informs RCU, so RCU keeps expecting a quiescent state from CPUs
>> that are now spinning forever with interrupts disabled.
> …
>> Fixes: 91840be8f710 ("irq_work: Fix use-after-free in irq_work_single() on PREEMPT_RT")
>> CC: stable@vger.kernel.org
>> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> Sorry for being late.
>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> Sebastian

Thanks to both of you. The patch has been accepted and merged already
(silently) [1]. But I appreciate your reviews a lot.

Best,
Jonas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=9f3f3bdc6d9dac1a5a8262ee7ad0f2ff1527a7e7

