Return-Path: <linux-mips+bounces-6851-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5099E2E55
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 22:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7340CB47C26
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 20:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BBC209F4D;
	Tue,  3 Dec 2024 20:55:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBED209F26;
	Tue,  3 Dec 2024 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733259344; cv=none; b=qW1a6jZB/2VIS4nyscEbSCL2Pm2xq6gOojNlva5iXeBeU/2q/CSx5fN816GUxLJrmp0/CaG1bMDRVVMSggAuabsNBY7TXzpfmqyhIPrvGXfCMEE3Nb6QurQ92CkHt91JDIbyhl5fIV95KQZBWXc0179lxX7F03ekMDu8Vm8a3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733259344; c=relaxed/simple;
	bh=fP7CpZvJRQFUGLpdzElPlV5uhVAV/ahRnZ70kCLG3cI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JsEDeuwxhsHbecmGFloCecqU1RwW/DWafIUmJxnRLUd77p5cUe34+60RELXZ3i2NDMe6z8RsdHiUlfJCtiOLwWeGIgCOA2ZCh1OR/kin4t2bKzcG1b01kJBqrcBYoNBkatPXvnfUqd10ZZrgZbO0EXoAZVD+63sviXYRBl0YrOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279F2C4CECF;
	Tue,  3 Dec 2024 20:55:42 +0000 (UTC)
Date: Tue, 3 Dec 2024 15:55:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Joel Fernandes <joel@joelfernandes.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Paul Burton
 <paulburton@kernel.org>
Subject: Re: [PATCH v2] tracing: Remove definition of trace_*_rcuidle()
Message-ID: <20241203155542.462b1b21@gandalf.local.home>
In-Reply-To: <bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
References: <20241003181629.36209057@gandalf.local.home>
	<bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


[ Adding MIPS maintainers ]

On Tue, 3 Dec 2024 12:39:08 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> Hi Steven,
> 
> On Thu, Oct 03, 2024 at 06:16:29PM -0400, Steven Rostedt wrote:
> > From: Steven Rostedt <rostedt@goodmis.org>
> > 
> > The trace_*_rcuidle() variant of a tracepoint was to handle places where a
> > tracepoint was located but RCU was not "watching". All those locations
> > have been removed, and RCU should be watching where all tracepoints are
> > located. We can now remove the trace_*_rcuidle() variant.
> > 
> > Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > ---  
> 
> This patch triggers backtraces with mips qemu emulations.
> 
> WARNING: CPU: 0 PID: 0 at include/trace/events/preemptirq.h:36 handle_int+0x128/0x178
> RCU not watching for tracepoint
> ...
> Call Trace:
> [<ffffffff8012a89c>] show_stack+0x64/0x158
> [<ffffffff8011e998>] dump_stack_lvl+0xb4/0x128
> [<ffffffff801550f4>] __warn+0xa4/0x1f8
> [<ffffffff80155328>] warn_slowpath_fmt+0xe0/0x1d0
> [<ffffffff801233e8>] handle_int+0x128/0x178
> [<ffffffff80f25ff8>] r4k_wait+0x30/0x40
> [<ffffffff80f26448>] default_idle_call+0xa0/0x330
> [<ffffffff801b6ccc>] do_idle+0xe4/0x1b8
> [<ffffffff801b71c4>] cpu_startup_entry+0x34/0x48
> [<ffffffff80f2689c>] kernel_init+0x0/0x110
> 
> WARNING: CPU: 0 PID: 0 at include/trace/events/preemptirq.h:40 trace_hardirqs_on+0x184/0x240
> RCU not watching for tracepoint
> ...
> Call Trace:
> [<ffffffff8012a89c>] show_stack+0x64/0x158
> [<ffffffff8011e998>] dump_stack_lvl+0xb4/0x128
> [<ffffffff801550f4>] __warn+0xa4/0x1f8
> [<ffffffff80155328>] warn_slowpath_fmt+0xe0/0x1d0
> [<ffffffff8028fb74>] trace_hardirqs_on+0x184/0x240
> [<ffffffff80123030>] restore_partial+0x6c/0x13c
> 
> Bisect log is attached.

I'm guessing MIPS needs to implement something like what arm64 did with:

 7cd1ea1010acb ("arm64: entry: fix non-NMI kernel<->kernel transitions")

Because we do not want to bring back the trace_*_rcuidle() crap.

-- Steve

> 
> Guenter
> 
> ---
> # bad: [f6420e2ee9caa3ecf226d0db22572db0d9451977] Merge branch 'fixes-v6.13' into testing
> # good: [adc218676eef25575469234709c2d87185ca223a] Linux 6.12
> git bisect start 'f6420e2ee9ca' 'v6.12'
> # good: [6e95ef0258ff4ee23ae3b06bf6b00b33dbbd5ef7] Merge tag 'bpf-next-6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
> git bisect good 6e95ef0258ff4ee23ae3b06bf6b00b33dbbd5ef7
> # good: [071b34dcf71523a559b6c39f5d21a268a9531b50] Merge tag 'sound-6.13-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> git bisect good 071b34dcf71523a559b6c39f5d21a268a9531b50
> # good: [8a07b2623e7ff04856f8d4470d002675049b2065] Merge tag 'drm-misc-next-2024-10-31' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
> git bisect good 8a07b2623e7ff04856f8d4470d002675049b2065
> # bad: [80739fd00c7ea1315d362ce889bef499452913ef] Merge tag 'mfd-next-6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd
> git bisect bad 80739fd00c7ea1315d362ce889bef499452913ef
> # good: [e175800137f588688ac6aae30ce491e098f30c45] Merge tag 'exynos-drm-next-for-v6.13-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next
> git bisect good e175800137f588688ac6aae30ce491e098f30c45
> # good: [ade5add00da20de40f63d097345bddea24d924f4] Merge tag 'amd-drm-next-6.13-2024-11-15' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
> git bisect good ade5add00da20de40f63d097345bddea24d924f4
> # bad: [06afb0f36106ecb839c5e2509905e68c1e2677de] Merge tag 'trace-v6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
> git bisect bad 06afb0f36106ecb839c5e2509905e68c1e2677de
> # good: [f1db825805d48cee6826b7dc082a04112c1f0c8d] Merge tag 'trace-ring-buffer-v6.13' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
> git bisect good f1db825805d48cee6826b7dc082a04112c1f0c8d
> # bad: [61c6fefa92bb4ed7a34163b94f6ffac628237a29] bpf: decouple BPF link/attach hook and BPF program sleepable semantics
> git bisect bad 61c6fefa92bb4ed7a34163b94f6ffac628237a29
> # bad: [cdb537ac417938408ee819992f432c410f2d01a2] tracing/perf: Add might_fault check to syscall probes
> git bisect bad cdb537ac417938408ee819992f432c410f2d01a2
> # bad: [e53244e2c8931f9e80c1841293aea86ef8ad32a3] tracepoint: Remove SRCU protection
> git bisect bad e53244e2c8931f9e80c1841293aea86ef8ad32a3
> # good: [49e4154f4b16345da5e219b23ed9737a6e735bc1] tracing: Remove TRACE_EVENT_FL_FILTERED logic
> git bisect good 49e4154f4b16345da5e219b23ed9737a6e735bc1
> # bad: [48bcda6848232667f13b4e97588de488c83c37d4] tracing: Remove definition of trace_*_rcuidle()
> git bisect bad 48bcda6848232667f13b4e97588de488c83c37d4
> # good: [4a8840af5f53f2902eba91130fae650879f18e7a] tracepoints: Use new static branch API
> git bisect good 4a8840af5f53f2902eba91130fae650879f18e7a
> # first bad commit: [48bcda6848232667f13b4e97588de488c83c37d4] tracing: Remove definition of trace_*_rcuidle()


