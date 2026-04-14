Return-Path: <linux-mips+bounces-14146-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NRgDpnJ3mmVIQAAu9opvQ
	(envelope-from <linux-mips+bounces-14146-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 01:11:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD083FEF70
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 01:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB7E5303D321
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 23:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044073AE195;
	Tue, 14 Apr 2026 23:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBelCepT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B9B26F293;
	Tue, 14 Apr 2026 23:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776208170; cv=none; b=qvPa0Dmd2Aosq44PtFhYfkhmeKDB1i7pL+qKmOurkMu88ThrBipmh+XHmfpAFnld662UsH36aamgzktyApczJAG0VGnBX31uRmvtGkTsMDXRYZZG99PWSc0o+xSRM+n7dTicQIkbG8eIXCNDVgb1L15Cwjne41DYIOnDgBiHDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776208170; c=relaxed/simple;
	bh=m0W/Ernt03ORrUvvuWlaV+yJl5KaCu8uMNwKRgnc1JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdqAxGJ/15T2adqQiMymz/Kn0o4o174jffktMJw8yi3qRMCdlKfIS3xglpz1ve9MJfL0W4tx590wsa2fj/wAm7kraLeJbiQPP1+zRUd8szWA/UcpjKAI2HWtMhGYdwo2Dwsf4MKqmeiOJ+BIimk9o3yG4tVhX/Xj19YYbxd2KTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBelCepT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6918DC19425;
	Tue, 14 Apr 2026 23:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776208170;
	bh=m0W/Ernt03ORrUvvuWlaV+yJl5KaCu8uMNwKRgnc1JU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=qBelCepTc9lFdVUgh+o5h1aXWx6734PGrt1TsMYUW8hNHRDFGGvbQBnbL7dkpco6k
	 FOWMq2sxkQ//wmRKXPFKM2vXXv6BS3Sv3GEPKQgc9sNlUbSKK0Z3Ea5TZwC/uq1yAx
	 XmarXC3/Ng/MOmZpZtC2AlgJFzmvc9Ns3XgKRXeNVliCghDA1lZzITubKE4U5WMow4
	 aLNVnwqvUSMw7gjHi2mEqYtiDu3lfqxpFZHxsZI966VlBMLNFolgMJDx3pPmVkSeKs
	 jkTzJ9lwTV80UFCo9VCmOvVlg94JahYcn8tZKQTzVofGTAOdvXmkjGvWtz5BmsTKPW
	 7sluvHMU/cwXg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0224ECE13BF; Tue, 14 Apr 2026 16:09:29 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:09:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
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
Message-ID: <2d2a6584-2b75-44e9-953e-e6244ff2abc9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1774536681.git.d@ilvokhin.com>
 <d2e5763278812499335b22a013aafb4979e3324b.1774536681.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2e5763278812499335b22a013aafb4979e3324b.1774536681.git.d@ilvokhin.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14146-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[paulmck@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulmck@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ilvokhin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8AD083FEF70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 03:10:02PM +0000, Dmitry Ilvokhin wrote:
> Add the contended_release trace event. This tracepoint fires on the
> holder side when a contended lock is released, complementing the
> existing contention_begin/contention_end tracepoints which fire on the
> waiter side.
> 
> This enables correlating lock hold time under contention with waiter
> events by lock address.
> 
> Add trace_contended_release() calls to the slowpath unlock paths of
> sleepable locks: mutex, rtmutex, semaphore, rwsem, percpu-rwsem, and
> RT-specific rwbase locks.
> 
> Where possible, trace_contended_release() fires before the lock is
> released and before the waiter is woken. For some lock types, the
> tracepoint fires after the release but before the wake. Making the
> placement consistent across all lock types is not worth the added
> complexity.
> 
> For reader/writer locks, the tracepoint fires for every reader releasing
> while a writer is waiting, not only for the last reader.
> 
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Looks plausible:

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  include/trace/events/lock.h   | 17 +++++++++++++++++
>  kernel/locking/mutex.c        |  4 ++++
>  kernel/locking/percpu-rwsem.c | 11 +++++++++++
>  kernel/locking/rtmutex.c      |  1 +
>  kernel/locking/rwbase_rt.c    |  6 ++++++
>  kernel/locking/rwsem.c        | 10 ++++++++--
>  kernel/locking/semaphore.c    |  4 ++++
>  7 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/include/trace/events/lock.h b/include/trace/events/lock.h
> index da978f2afb45..1ded869cd619 100644
> --- a/include/trace/events/lock.h
> +++ b/include/trace/events/lock.h
> @@ -137,6 +137,23 @@ TRACE_EVENT(contention_end,
>  	TP_printk("%p (ret=%d)", __entry->lock_addr, __entry->ret)
>  );
>  
> +TRACE_EVENT(contended_release,
> +
> +	TP_PROTO(void *lock),
> +
> +	TP_ARGS(lock),
> +
> +	TP_STRUCT__entry(
> +		__field(void *, lock_addr)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->lock_addr = lock;
> +	),
> +
> +	TP_printk("%p", __entry->lock_addr)
> +);
> +
>  #endif /* _TRACE_LOCK_H */
>  
>  /* This part must be outside protection */
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index 427187ff02db..6c2c9312eb8f 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -997,6 +997,9 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>  		wake_q_add(&wake_q, next);
>  	}
>  
> +	if (trace_contended_release_enabled() && waiter)
> +		trace_contended_release(lock);
> +
>  	if (owner & MUTEX_FLAG_HANDOFF)
>  		__mutex_handoff(lock, next);
>  
> @@ -1194,6 +1197,7 @@ EXPORT_SYMBOL(ww_mutex_lock_interruptible);
>  
>  EXPORT_TRACEPOINT_SYMBOL_GPL(contention_begin);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(contention_end);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(contended_release);
>  
>  /**
>   * atomic_dec_and_mutex_lock - return holding mutex if we dec to 0
> diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
> index f3ee7a0d6047..46b5903989b8 100644
> --- a/kernel/locking/percpu-rwsem.c
> +++ b/kernel/locking/percpu-rwsem.c
> @@ -263,6 +263,9 @@ void percpu_up_write(struct percpu_rw_semaphore *sem)
>  {
>  	rwsem_release(&sem->dep_map, _RET_IP_);
>  
> +	if (trace_contended_release_enabled() && wq_has_sleeper(&sem->waiters))
> +		trace_contended_release(sem);
> +
>  	/*
>  	 * Signal the writer is done, no fast path yet.
>  	 *
> @@ -292,6 +295,14 @@ EXPORT_SYMBOL_GPL(percpu_up_write);
>  void __percpu_up_read(struct percpu_rw_semaphore *sem)
>  {
>  	lockdep_assert_preemption_disabled();
> +	/*
> +	 * After percpu_up_write() completes, rcu_sync_is_idle() can still
> +	 * return false during the grace period, forcing readers into this
> +	 * slowpath. Only trace when a writer is actually waiting for
> +	 * readers to drain.
> +	 */
> +	if (trace_contended_release_enabled() && rcuwait_active(&sem->writer))
> +		trace_contended_release(sem);
>  	/*
>  	 * slowpath; reader will only ever wake a single blocked
>  	 * writer.
> diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
> index ccaba6148b61..3db8a840b4e8 100644
> --- a/kernel/locking/rtmutex.c
> +++ b/kernel/locking/rtmutex.c
> @@ -1466,6 +1466,7 @@ static void __sched rt_mutex_slowunlock(struct rt_mutex_base *lock)
>  		raw_spin_lock_irqsave(&lock->wait_lock, flags);
>  	}
>  
> +	trace_contended_release(lock);
>  	/*
>  	 * The wakeup next waiter path does not suffer from the above
>  	 * race. See the comments there.
> diff --git a/kernel/locking/rwbase_rt.c b/kernel/locking/rwbase_rt.c
> index 82e078c0665a..74da5601018f 100644
> --- a/kernel/locking/rwbase_rt.c
> +++ b/kernel/locking/rwbase_rt.c
> @@ -174,6 +174,8 @@ static void __sched __rwbase_read_unlock(struct rwbase_rt *rwb,
>  static __always_inline void rwbase_read_unlock(struct rwbase_rt *rwb,
>  					       unsigned int state)
>  {
> +	if (trace_contended_release_enabled() && rt_mutex_owner(&rwb->rtmutex))
> +		trace_contended_release(rwb);
>  	/*
>  	 * rwb->readers can only hit 0 when a writer is waiting for the
>  	 * active readers to leave the critical section.
> @@ -205,6 +207,8 @@ static inline void rwbase_write_unlock(struct rwbase_rt *rwb)
>  	unsigned long flags;
>  
>  	raw_spin_lock_irqsave(&rtm->wait_lock, flags);
> +	if (trace_contended_release_enabled() && rt_mutex_has_waiters(rtm))
> +		trace_contended_release(rwb);
>  	__rwbase_write_unlock(rwb, WRITER_BIAS, flags);
>  }
>  
> @@ -214,6 +218,8 @@ static inline void rwbase_write_downgrade(struct rwbase_rt *rwb)
>  	unsigned long flags;
>  
>  	raw_spin_lock_irqsave(&rtm->wait_lock, flags);
> +	if (trace_contended_release_enabled() && rt_mutex_has_waiters(rtm))
> +		trace_contended_release(rwb);
>  	/* Release it and account current as reader */
>  	__rwbase_write_unlock(rwb, WRITER_BIAS - 1, flags);
>  }
> diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
> index bf647097369c..602d5fd3c91a 100644
> --- a/kernel/locking/rwsem.c
> +++ b/kernel/locking/rwsem.c
> @@ -1387,6 +1387,8 @@ static inline void __up_read(struct rw_semaphore *sem)
>  	rwsem_clear_reader_owned(sem);
>  	tmp = atomic_long_add_return_release(-RWSEM_READER_BIAS, &sem->count);
>  	DEBUG_RWSEMS_WARN_ON(tmp < 0, sem);
> +	if (trace_contended_release_enabled() && (tmp & RWSEM_FLAG_WAITERS))
> +		trace_contended_release(sem);
>  	if (unlikely((tmp & (RWSEM_LOCK_MASK|RWSEM_FLAG_WAITERS)) ==
>  		      RWSEM_FLAG_WAITERS)) {
>  		clear_nonspinnable(sem);
> @@ -1413,8 +1415,10 @@ static inline void __up_write(struct rw_semaphore *sem)
>  	preempt_disable();
>  	rwsem_clear_owner(sem);
>  	tmp = atomic_long_fetch_add_release(-RWSEM_WRITER_LOCKED, &sem->count);
> -	if (unlikely(tmp & RWSEM_FLAG_WAITERS))
> +	if (unlikely(tmp & RWSEM_FLAG_WAITERS)) {
> +		trace_contended_release(sem);
>  		rwsem_wake(sem);
> +	}
>  	preempt_enable();
>  }
>  
> @@ -1437,8 +1441,10 @@ static inline void __downgrade_write(struct rw_semaphore *sem)
>  	tmp = atomic_long_fetch_add_release(
>  		-RWSEM_WRITER_LOCKED+RWSEM_READER_BIAS, &sem->count);
>  	rwsem_set_reader_owned(sem);
> -	if (tmp & RWSEM_FLAG_WAITERS)
> +	if (tmp & RWSEM_FLAG_WAITERS) {
> +		trace_contended_release(sem);
>  		rwsem_downgrade_wake(sem);
> +	}
>  	preempt_enable();
>  }
>  
> diff --git a/kernel/locking/semaphore.c b/kernel/locking/semaphore.c
> index 74d41433ba13..35ac3498dca5 100644
> --- a/kernel/locking/semaphore.c
> +++ b/kernel/locking/semaphore.c
> @@ -230,6 +230,10 @@ void __sched up(struct semaphore *sem)
>  		sem->count++;
>  	else
>  		__up(sem, &wake_q);
> +
> +	if (trace_contended_release_enabled() && !wake_q_empty(&wake_q))
> +		trace_contended_release(sem);
> +
>  	raw_spin_unlock_irqrestore(&sem->lock, flags);
>  	if (!wake_q_empty(&wake_q))
>  		wake_up_q(&wake_q);
> -- 
> 2.52.0
> 

