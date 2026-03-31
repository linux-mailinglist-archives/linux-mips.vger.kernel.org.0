Return-Path: <linux-mips+bounces-13998-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHnvMkK8y2kpKAYAu9opvQ
	(envelope-from <linux-mips+bounces-13998-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 14:21:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2815036964A
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 14:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEE4A3027966
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 12:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEDC3E1205;
	Tue, 31 Mar 2026 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="E9ChVItp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12826379996;
	Tue, 31 Mar 2026 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774959411; cv=none; b=NkG5PTtjNUH9buVwWYTgi+L8NVc/H9WF+pWlLXH8HFM6JaLFSNqsaNNOK8NYJPFDtjRyjbZB01R61k9EdJLFL8od0xv8y12V7/rZI4zQNlRzOAk4t3mButIBLN/67Bwn7B7i9PJ6Bd88qJw8DZBOtpyM8reJVc4pCYs/V6PgQOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774959411; c=relaxed/simple;
	bh=TakF1Zagv1YgZI7pZAW/GTp7AUkWn9mqkH1+3mQgg+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNYQF9+8fzkn6uaCzH7l6nGpZ/R9dCtETEREX4SDJBsCQHOhYytOJZ1Q55Lb9eXWs0bqy/o2ntyGy7tEeWsyoFF8ykc0pG3mq+Kf09oG47tIj3t9tAfIHFsPAOGLzP/7AxDDR3l9xyzQkTls0MUAUFnuLyU+4f4HT1qAfnnLyg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=E9ChVItp; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id C7DD3BE242;
	Tue, 31 Mar 2026 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1774959407;
	bh=fmOnVSldgMRg/8pGDKo6wUzrYFaZS5iOwP+Hm7ivSzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E9ChVItphVkjUtNNOlIsaXKqbJIKHVd05tZl9VjsTincvkl4+6OIMtozfMyTd9khm
	 wG63Wu+eCzPfC9aBKGIUFKss7uZL7kLRRjZxL80a35fei1ME7K/m2xG6Ft5zImKYdQ
	 nXNrJwdEjYs6yNqfZ5evrY6xy632+Hfb5anmMfN0=
Date: Tue, 31 Mar 2026 12:16:45 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Usama Arif <usama.arif@linux.dev>
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
Subject: Re: [PATCH v4 3/5] locking: Add contended_release tracepoint to
 sleepable locks
Message-ID: <acu7LdegiZ5_-dEW@shell.ilvokhin.com>
References: <d2e5763278812499335b22a013aafb4979e3324b.1774536681.git.d@ilvokhin.com>
 <20260331103451.1070175-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331103451.1070175-1-usama.arif@linux.dev>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13998-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ilvokhin.com:dkim,ilvokhin.com:email,shell.ilvokhin.com:mid]
X-Rspamd-Queue-Id: 2815036964A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 03:34:50AM -0700, Usama Arif wrote:
> On Thu, 26 Mar 2026 15:10:02 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:
> 
> > Add the contended_release trace event. This tracepoint fires on the
> > holder side when a contended lock is released, complementing the
> > existing contention_begin/contention_end tracepoints which fire on the
> > waiter side.
> > 
> > This enables correlating lock hold time under contention with waiter
> > events by lock address.
> > 
> > Add trace_contended_release() calls to the slowpath unlock paths of
> > sleepable locks: mutex, rtmutex, semaphore, rwsem, percpu-rwsem, and
> > RT-specific rwbase locks.
> > 
> > Where possible, trace_contended_release() fires before the lock is
> > released and before the waiter is woken. For some lock types, the
> > tracepoint fires after the release but before the wake. Making the
> > placement consistent across all lock types is not worth the added
> > complexity.
> > 
> > For reader/writer locks, the tracepoint fires for every reader releasing
> > while a writer is waiting, not only for the last reader.
> > 
> > Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
> > ---
> >  include/trace/events/lock.h   | 17 +++++++++++++++++
> >  kernel/locking/mutex.c        |  4 ++++
> >  kernel/locking/percpu-rwsem.c | 11 +++++++++++
> >  kernel/locking/rtmutex.c      |  1 +
> >  kernel/locking/rwbase_rt.c    |  6 ++++++
> >  kernel/locking/rwsem.c        | 10 ++++++++--
> >  kernel/locking/semaphore.c    |  4 ++++
> >  7 files changed, 51 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/trace/events/lock.h b/include/trace/events/lock.h
> > index da978f2afb45..1ded869cd619 100644
> > --- a/include/trace/events/lock.h
> > +++ b/include/trace/events/lock.h
> > @@ -137,6 +137,23 @@ TRACE_EVENT(contention_end,
> >  	TP_printk("%p (ret=%d)", __entry->lock_addr, __entry->ret)
> >  );
> >  
> > +TRACE_EVENT(contended_release,
> > +
> > +	TP_PROTO(void *lock),
> > +
> > +	TP_ARGS(lock),
> > +
> > +	TP_STRUCT__entry(
> > +		__field(void *, lock_addr)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__entry->lock_addr = lock;
> > +	),
> > +
> > +	TP_printk("%p", __entry->lock_addr)
> > +);
> > +
> >  #endif /* _TRACE_LOCK_H */
> >  
> >  /* This part must be outside protection */
> > diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> > index 427187ff02db..6c2c9312eb8f 100644
> > --- a/kernel/locking/mutex.c
> > +++ b/kernel/locking/mutex.c
> > @@ -997,6 +997,9 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
> >  		wake_q_add(&wake_q, next);
> >  	}
> >  
> > +	if (trace_contended_release_enabled() && waiter)
> > +		trace_contended_release(lock);
> > +
> 
> This won't compile? waiter is declared in the if block, so you are using
> it outside scope here.
>

Thanks for the feedback, Usama.

waiter is declared at function scope, right on top. It's also assigned
before the if block, so it's still in scope at the tracepoint.

