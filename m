Return-Path: <linux-mips+bounces-6852-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C855E9E30E7
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 02:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B8B428474B
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 01:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E06EEB5;
	Wed,  4 Dec 2024 01:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4z49waU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF94C7D;
	Wed,  4 Dec 2024 01:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733276918; cv=none; b=EyH+dFC7yZ0W36w/OH5voS2CAzx52z/+d3AGMm+eZJJhF0TIfGPcqGROLZg+Gdi2yEHDWLwg7wQ/xISUaR5OMSSo1C4N0RiK7JLjWLbofUZQYd1mphiQTfS6JqEjwK7FywLVW/K7iX2izEA5bb4Udv4FD0d+Y00MuKv2sz5tSWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733276918; c=relaxed/simple;
	bh=3pjtowpKrh0YSfozh7R7j96Wh4jRmbhZXmGJmEA0ncU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAegBZ5yFUSmL6bIhli1eNFViprOWOuuQtISQFyuZC4xhyRi0WBOf9E0HFGPEf5upsPtIocRx+CDszPqM6q8Sm1Epad//4UKCuQV3Ayaju0ihkiRMSp/wc++d4rzkMnV0skpH9enRnTCT32kdE9n/3qqBXLe7wAp7nkiFLASzm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4z49waU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21578cfad81so27706845ad.3;
        Tue, 03 Dec 2024 17:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733276916; x=1733881716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VWMFkUbU8nMs3P/7Pvk5rqKwkEvGE0cqpRQ+FtWH2hs=;
        b=Y4z49waUfxAl8UJcyrmsI+nHlQ4OhfB5FLek860xdrWvoFlLHq9RaG+xNpQa0vaJnr
         GTsQ1fzwBslsOxlwFobdURR7Tr65dxNMi0VuY4rqfD3c+Mka27kjGzbveigXBJnnmshZ
         khQvyWPOubB7DCkZAGKeT5p5PXtqRN+sshno6H+JkPIRH/y6nDlGqGpr5ZpqufTt0k2Y
         1Ed4iz1DiFpS2t4r/cqp4669SJxOblE0KV7tPOMmba++HJTeWvFib5Lx/PhzrIeIu56w
         x5S1R8aN1+PLvq2ymftVnQ6IHIoFxq0j1tKCQ28nw5Ll5j81tUAzixdTmdTcKO2RTH7E
         gVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733276916; x=1733881716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWMFkUbU8nMs3P/7Pvk5rqKwkEvGE0cqpRQ+FtWH2hs=;
        b=hZSE3XsvPcFKTmLLJMT8L1oYTButs9wVwBG99P+GweHenuhLmSjAaDHwJVnOXjZ1iy
         prTDqi0l3kZZrxrhqm9Zhr1d5nHbSeMp2MaI2VxExqtPAtk4VwTURTggLDcQGKgBkhd3
         /CEY7pAB65rW4c8fR5zVo62plMnTxdrGKL5eWrs5sudFN19dnPIyL4DQ/tMigTsQ6e/A
         OvE+dKMLiA5p2Ab6Lf0HdOGx2pBWgWAsBiJ4+EMnetmyoUGqLQc3VEz6Omilx5YrLJZv
         jtoMNLGJs10CCxJg0TpH4C6FmkGnYbAzB9HGnquxw981NVE3BmsAJUm6t90VwZItcrbz
         ZXeA==
X-Forwarded-Encrypted: i=1; AJvYcCV68yFcl/d54rbzcrKiL32UsUHVX4GFPKaIMsTTIBbvKlnKJdHZTX3FszRBKU4FWwv3fVVJ7qDZnGbL@vger.kernel.org, AJvYcCXGak0k4YA+aZvUeYp/7karkCgcyxhZAyHY0GYHnEj5ZMC2W7zu9tV7EZeiJjo3wCUPNaZWGY3sdddFMJRHMbg25vMV@vger.kernel.org
X-Gm-Message-State: AOJu0YxPA4ORjDJ5/w7wbo5UdKpq5DPT2jbXwRcHdxjmL9hspLp4RHt7
	npUCXbur+O7MOHHKixamzmb2ybQ05qFD3l8NZXBZ55jV23Ny/6aB
X-Gm-Gg: ASbGncv2j5ihpMxMKf+ZwcEcEpqYEjCyq9VpVVka5pJzoCyA/b3BVSDGoag2wx2ReWg
	rqvl2XTKBOZMmPHw0Kq8GR2DvFgRkLfWzMKDeKwf1RexaygnLehU7TvEim8NPvxZoAYgQ6P4vAz
	+r/PztKaYtNVGxRCtEQo8zcCmUKaqdgOUFUcONOy4z3920XFSmqOwcxj3PLSnsLTKLEjaPghm2C
	zgRrbD9rurkGizHYUeLBhbpGiL7rYsUhx1GjIScVSiRQsw7IKdpbGbsIb7Dj1JndF1gYTQa4C4W
	HWO/FPS2FRrpCjeybpeGlvE=
X-Google-Smtp-Source: AGHT+IFILtpn/jNg+rd3c6MXQvf9CUvihinloLibivPid/BUZsmwD+2tZd5X0mC0qVGCgF8QpOsXIA==
X-Received: by 2002:a17:902:d512:b0:215:4a4e:9270 with SMTP id d9443c01a7336-215bd255800mr52254075ad.52.1733276916230;
        Tue, 03 Dec 2024 17:48:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153f8133b8sm82515885ad.283.2024.12.03.17.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 17:48:35 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
Date: Tue, 3 Dec 2024 17:48:33 -0800
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
 Paul Burton <paulburton@kernel.org>
References: <20241003181629.36209057@gandalf.local.home>
 <bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
 <20241203155542.462b1b21@gandalf.local.home>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241203155542.462b1b21@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/24 12:55, Steven Rostedt wrote:
> 
> [ Adding MIPS maintainers ]
> 
> On Tue, 3 Dec 2024 12:39:08 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> Hi Steven,
>>
>> On Thu, Oct 03, 2024 at 06:16:29PM -0400, Steven Rostedt wrote:
>>> From: Steven Rostedt <rostedt@goodmis.org>
>>>
>>> The trace_*_rcuidle() variant of a tracepoint was to handle places where a
>>> tracepoint was located but RCU was not "watching". All those locations
>>> have been removed, and RCU should be watching where all tracepoints are
>>> located. We can now remove the trace_*_rcuidle() variant.
>>>
>>> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>>> ---
>>
>> This patch triggers backtraces with mips qemu emulations.
>>
>> WARNING: CPU: 0 PID: 0 at include/trace/events/preemptirq.h:36 handle_int+0x128/0x178
>> RCU not watching for tracepoint
>> ...
>> Call Trace:
>> [<ffffffff8012a89c>] show_stack+0x64/0x158
>> [<ffffffff8011e998>] dump_stack_lvl+0xb4/0x128
>> [<ffffffff801550f4>] __warn+0xa4/0x1f8
>> [<ffffffff80155328>] warn_slowpath_fmt+0xe0/0x1d0
>> [<ffffffff801233e8>] handle_int+0x128/0x178
>> [<ffffffff80f25ff8>] r4k_wait+0x30/0x40
>> [<ffffffff80f26448>] default_idle_call+0xa0/0x330
>> [<ffffffff801b6ccc>] do_idle+0xe4/0x1b8
>> [<ffffffff801b71c4>] cpu_startup_entry+0x34/0x48
>> [<ffffffff80f2689c>] kernel_init+0x0/0x110
>>
>> WARNING: CPU: 0 PID: 0 at include/trace/events/preemptirq.h:40 trace_hardirqs_on+0x184/0x240
>> RCU not watching for tracepoint
>> ...
>> Call Trace:
>> [<ffffffff8012a89c>] show_stack+0x64/0x158
>> [<ffffffff8011e998>] dump_stack_lvl+0xb4/0x128
>> [<ffffffff801550f4>] __warn+0xa4/0x1f8
>> [<ffffffff80155328>] warn_slowpath_fmt+0xe0/0x1d0
>> [<ffffffff8028fb74>] trace_hardirqs_on+0x184/0x240
>> [<ffffffff80123030>] restore_partial+0x6c/0x13c
>>
>> Bisect log is attached.
> 
> I'm guessing MIPS needs to implement something like what arm64 did with:
> 
>   7cd1ea1010acb ("arm64: entry: fix non-NMI kernel<->kernel transitions")
> 
> Because we do not want to bring back the trace_*_rcuidle() crap.
> 

Hmm. If you say so. Note that powerpc has the same or a similar problem.

[    0.142039][    T0] RCU not watching for tracepoint
[    0.142488][    T0]
[    0.142659][    T0] =============================
[    0.142755][    T0] WARNING: suspicious RCU usage
[    0.142914][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
[    0.143082][    T0] -----------------------------
[    0.143178][    T0] kernel/notifier.c:586 notify_die called but RCU thinks we're quiescent!


[    0.152733][    T0] RCU not watching for tracepoint
[    0.152770][    T0]
[    0.152995][    T0] =============================
[    0.153092][    T0] WARNING: suspicious RCU usage
[    0.153187][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
[    0.153301][    T0] -----------------------------
[    0.153394][    T0] include/linux/rcupdate.h:850 rcu_read_lock() used illegally while idle!

[    0.165396][    T0] RCU not watching for tracepoint
[    0.165540][    T0]
[    0.165712][    T0] =============================
[    0.165811][    T0] WARNING: suspicious RCU usage
[    0.165909][    T0] 6.13.0-rc1-00058-ge75ce84aa5d3 #1 Not tainted
[    0.166026][    T0] -----------------------------
[    0.166122][    T0] include/linux/rcupdate.h:878 rcu_read_unlock() used illegally while idle!

and many more.

Guenter


