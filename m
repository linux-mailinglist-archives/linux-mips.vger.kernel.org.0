Return-Path: <linux-mips+bounces-14919-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L1rBOY+xImr7cAEAu9opvQ
	(envelope-from <linux-mips+bounces-14919-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 13:22:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45258647AF3
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 13:22:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MEdZi5T+;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14919-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14919-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09AAC301808F
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 11:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DA84D2ECA;
	Fri,  5 Jun 2026 11:12:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE564CA279
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 11:12:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657963; cv=none; b=L6gnO5vedouoNPXITudIsHYbtDfv1IN50NhjCRunbR+XBMrzUVKFrL1D3swaImkGfMrj/AWIS4BzDln8cMxvychIYaDqY5LFrIFUG2ELzyb2nv00u5kz/pxesdCV3V4zAfeFEUwZOR0lqXskWGiur0g7CI5YPoURdeS6Mj9CHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657963; c=relaxed/simple;
	bh=lmSjoIiFcS96WgGAMtkcg3q8ByAWa6wPJJAcgkb4idk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbbRRoHhX+weORh0rCxWxca9FY5lEuQ/jzaqTY+bOypGUzO0pyTeOYYR6nAgBiJ7H8k/MynUovzHDqVV5k6tjKlL2Qdls983U4diIHA2wYtKYS1DuDYn5SAbE+Oh38l3f3fnJdOWfCaicDX4R63ENRd/nXw6nf1Br97pZjCn19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEdZi5T+; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490af320e2aso20954145e9.2
        for <linux-mips@vger.kernel.org>; Fri, 05 Jun 2026 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780657960; x=1781262760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XYJSNlNXjYunXNkaUPBK0YBkQKXFISip6sCHWbKA7U=;
        b=MEdZi5T+0Yua08E0OhiMpsbZdriX9IrA5tVi8ZXXtFgO8+ehlBuf3FehdkXuuU2xe1
         G3MfdB9gjfB5Xp9taqF9jjBpTJtsQCD+R8pMUccIy+w4wMKJZpJaGJ6BO4RyVnRkshTK
         /g7tsjeJlDgaupZM8Sc3+SBOlVtb49vo4hOSXjwkULvJyu6CNiXHW/QcOtmj/XZSthWU
         SNcG9rkc5zQIOd7+XnPIBYIStrd+LIb2OLXNXY9Drs5butZ0l553yGx+dw6B5f4Y4Z+m
         HwYwnlLM2P7lp0hYKlRHFZcmFdqtjKJw0WI036LZsmcenn9ftJ5HmWn7ZfMMLynwmhPi
         4Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780657960; x=1781262760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XYJSNlNXjYunXNkaUPBK0YBkQKXFISip6sCHWbKA7U=;
        b=XxC1fgeca+Zenx8LiKq9f/RbUVEUj319guAbgPTCKGoCkO/HWXXh8saZYg3Tkat+TA
         3J4VXx2T1nKGQyFVsGeXjguA5mMKTDSl15x4+9CxAoFtPgYmkBPSBVlBCFL99UmmQHVc
         q3QuSpLBW8zrKfLaMMzEGxR1zKIqEAnV49qwGMCiOdKWjpUjdl/CngdK0g0XLWK8q3Fj
         GmgekQ9g4t77rH9hUph1i0prjAATXdkOzMtCsfSjHqp9ltH+dyOdWFVwNgBnLxgd95BE
         0r2IUqFB5FCPneRwUBd3V1Gb56HTs7pMd2owaUm8T6B6RQe2rBoZvCuz1qaxX4YCI90X
         xC0A==
X-Forwarded-Encrypted: i=1; AFNElJ8Od8cjl/c/WGfv4F2Kz3n8K9Pikjnr56EA0lcJGEkRl32qSfCyJ3Pos+ByKBDjIBDz+mgsJUV/bFYQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxeEAbk4tdJ5Gx3v+GiC3KTwmTftQ0IgcDjJ8L659Omk76u+Mk
	/2uzm+SUWxEw7d8pkrvOBCoFtPVrI/HWrXRJgtl0uc1vDxzAr3RsMCLw
X-Gm-Gg: Acq92OEQ7qpqUKtjz70s9ZG+SXMM8oaIqCauHs6UnBmkpkEUObBpJtWfrv0PVes0jRn
	rVmxVE863xvt/nIZhID849hhI7wMnybfT3itBDJ7qdbyab634d9vuUxjRstOENGFsymSYHvMtfU
	RmkMDf69FDHUy9NTlQFUWjMymjSRT2SihIIPhBAxA2V4k9HWHULvprvFDez6swBxAAjl8kTEWrG
	+vuZs5EOLaGCHUkfQjswtDSwsKj/1FANyHg3z077R6SHM36FndL9D3XU7D1QPDCtPK9CWdWze5D
	V5GwTOBLZtxWJT3x25tyWzGQrXIsKgvjc+QHCvvoXVDeJV8hVmhCRpaw83SoXgwt4NbUf8UhnKS
	m39i9/0UhPYVXsU9m3H9+qBqpC/3gw6Vdom6w0dvZdUxH2t8ZZwD+xa6AfQfoCl3Yh333BHO3Ca
	oL8aPcRdiipNAMryMq8apPFXAUwgEt0eJ8DGEhvchuSCk+8MCTLrFdU8LUjAJKQO2OTYFALJtFl
	cscQ6YaGWz2Ez6RGw==
X-Received: by 2002:a05:600c:674f:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490c25e2dc6mr46150295e9.20.1780657959652;
        Fri, 05 Jun 2026 04:12:39 -0700 (PDT)
Received: from [192.168.255.3] (211-11-142-46.pool.kielnet.net. [46.142.11.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d66c8sm138026905e9.10.2026.06.05.04.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 04:12:39 -0700 (PDT)
Message-ID: <153b976e-ce36-44fe-899a-01fc5877e573@gmail.com>
Date: Fri, 5 Jun 2026 13:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: smp: report dying CPU to RCU in stop_this_cpu()
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@kernel.org>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, linux-rt-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260604182407.3109536-1-jelonek.jonas@gmail.com>
 <20260605064250.q0aRKkon@linutronix.de>
 <02b1e77e-5b7e-41cb-95b6-731ed00d9e74@gmail.com>
 <20260605103418.tH3rlwmO@linutronix.de>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260605103418.tH3rlwmO@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14919-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:tglx@kernel.org,m:jiayuan.chen@linux.dev,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45258647AF3

Hi,

On 05.06.26 12:34, Sebastian Andrzej Siewior wrote:
> Does 
> 	echo 0 > /sys/devices/system/cpu/cpu1/online
>
> lead to the same problem?

Funny, my device doesn't have this 'online' file, neither for the
other CPUs. So it seems this CPU hotplug isn't supported/used here?
Or am I missing a Kconfig option for that?

I'm working on a Realtek RTL931x SoC here, it has MIPS interAptiv
cores. I can provide more information if needed.

> I missed that arm64 has also this but only if the online path fails kind
> of early, see
> 	04e613ded8c26 ("arm64: smp: Tell RCU about CPUs that fail to come online")
>
> so this not the "normal" case but an exception. Mips seems to be doing
> something different here. I am not sure if this is the only thing that
> is missing.
>
>> Best,
>> Jonas
> Sebastian

Best,
Jonas

