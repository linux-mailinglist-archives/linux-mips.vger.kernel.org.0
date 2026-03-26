Return-Path: <linux-mips+bounces-13957-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Eg5DbNyxWkU+QQAu9opvQ
	(envelope-from <linux-mips+bounces-13957-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 18:53:55 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB9A3398C0
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 18:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF94430A5203
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 17:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827883A4F3A;
	Thu, 26 Mar 2026 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="cWmsQBbi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BC13A5453;
	Thu, 26 Mar 2026 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547239; cv=none; b=FoYD+nVKT8jiQw+/IlQUUlmAGfcK4bIl9fxJXOn2BeS3j3nmhcoUwwVHEaHvVoBigJ+uh50Uyq58F+RvBaA/6RmM+PsldltMU5HVFgHeBICilmgNRmotGogsEIFxwGxvqGodSsGt/dPtqA7OPgUEmFzdps9zLGsnK1+bCt0L+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547239; c=relaxed/simple;
	bh=Q2u1dQxxb/Sxo8KGbrkkNNPYUTk6JEf6lIj8E/mw8C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFsIHL94He1YXy03EXpWwKpqUDjK0b/YeBR+meb7ZmqoMe7bRI4KJLB9jnjvihk8k/gHZmS+Jk4h7n4N2oDptcue/iN42033Z/fR86yjc9iBYVtIk+QhEyx1FIEgFCKevphU0HqdE4YgL7iOF8lBJ8vymwN2Qo29ZQZ1gpYrFXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=cWmsQBbi; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 4D7D7BDE5F;
	Thu, 26 Mar 2026 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1774547232;
	bh=HajYBUhAMQvYpmUDUOrZF12EybtGDD0VRMp/h9GItuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cWmsQBbibf2QgNdBv+y0h3RK2/59H9eydWIBxQQ/Q8ag2qRAQ1v6K0wUCTXAFnYQx
	 slWOiGujhroPzV8XedWtDbXU5Ie8M9N7hNJgF5VHtUliCz64Aj4glFbHKvCamgE00C
	 9Yl24qMjjoDzdp8XtlZnmEmNqNuRTSb/jAa5mVMo=
Date: Thu, 26 Mar 2026 17:47:08 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v4 0/5] locking: contended_release tracepoint
 instrumentation
Message-ID: <acVxHOXgbPXeT6A8@shell.ilvokhin.com>
References: <cover.1774536681.git.d@ilvokhin.com>
 <acVW6eFGwqACD91Y@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acVW6eFGwqACD91Y@casper.infradead.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13957-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.ilvokhin.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ilvokhin.com:dkim]
X-Rspamd-Queue-Id: DFB9A3398C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 03:55:21PM +0000, Matthew Wilcox wrote:
> On Thu, Mar 26, 2026 at 03:09:59PM +0000, Dmitry Ilvokhin wrote:
> > The existing contention_begin/contention_end tracepoints fire on the
> > waiter side. The lock holder's identity and stack can be captured at
> > contention_begin time (e.g. perf lock contention --lock-owner), but
> > this reflects the holder's state when a waiter arrives, not when the
> > lock is actually released.
> > 
> > This series adds a contended_release tracepoint that fires on the
> > holder side when a lock with waiters is released. This provides:
> > 
> > - Hold time estimation: when the holder's own acquisition was
> >   contended, its contention_end (acquisition) and contended_release
> >   can be correlated to measure how long the lock was held under
> >   contention.
> > 
> > - The holder's stack at release time, which may differ from what perf lock
> >   contention --lock-owner captures if the holder does significant work between
> >   the waiter's arrival and the unlock.
> 
> As someone who's not an expert in this area (so please use short words
> to explain it to me), why do we want to know how long this holder took
> to release the lock from when it became contended?
> 
> I understand why we want to know how long any given waiter had to wait
> to gain the lock (but we already have tracepoints which show that).

I think the simplest way to think about it is the following. Waiter time
is the symptom, while holder time is the cause.

The waiter-side contention_begin/contention_end tells us how long a
waiter waited, but that time can span multiple holders.

If a waiter waited 10 ms, we can not tell whether one holder held the
lock for 10 ms or five holders held it for 2 ms each. These need
different treatments: the first means shrink the critical section, the
second means reduce lock frequency or split the lock. Today we can not
distinguish between these cases from waiter-side data alone.

> 
> I also don't understand why we want to know the holder's stack at
> release time.  The stack at contention-begin time will include
> the point at which the lock was acquired which should be correlated
> with where the lock was released.
> 
> Perhaps examples might help me understand why we want this?

Holder's stack allows us to understand who exactly waiters were waiting
for to release the lock.

The stack at contention_begin time does not always include the holder's
stack. The --lock-owner feature works by reading the owner field from
the lock struct, but it only supports mutex and rwsem. For spinlocks,
queued rwlocks, semaphores, and several others, the waiter has no
visibility into the holder whatsoever.

contended_release fires in the holder's context, so we get the holder's
stack at release time. For spinlocks, this is the only way to get any
holder-side information.

Original motivation was zone lock contention (a spinlock) in Meta
production workloads. We could see waiters were blocked, but had no way
to identify the holders or what they were doing.

