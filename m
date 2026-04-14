Return-Path: <linux-mips+bounces-14148-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKVDLL7L3mnnIQAAu9opvQ
	(envelope-from <linux-mips+bounces-14148-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 01:20:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF653FEFED
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 01:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DEAC30239AD
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 23:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F0138A299;
	Tue, 14 Apr 2026 23:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dr1H9aPW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8981358367;
	Tue, 14 Apr 2026 23:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776208827; cv=none; b=HdseBldzfA1IG8a9EQ49w+0rkIgoynosSYjcb4j0+HI1Yt4600Amv26MG3JJ2NJRwfNpL+dKjOc85/F0b879wUSXI8+kqZRRZSarvcjIHt/XxUK97u1b7blXiXdht+y0CJjfNoyyLWqQVgKOjbFho1+vQS/glm2JooTBfrOwFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776208827; c=relaxed/simple;
	bh=hKC8Rq5NfJNZWW7OdEl3J1osacHazL7oouQZKOMFRnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyPjUpMWTCdbJwaGnPUbSe4KakhS+nutxw5gxhrGBY17XKdgq1G5Ksc7dKDPcBOP4DFdfJM7QaX4cxmzXIzkoNMTTZUcDbiZ+4bjXM4c+Wyf7xyxV7mALNBhByQQXGut3kbh6qszEFJSFIGL2u6Bttupkp+jtuQP3cWju7j6SCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dr1H9aPW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A8AC19425;
	Tue, 14 Apr 2026 23:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776208827;
	bh=hKC8Rq5NfJNZWW7OdEl3J1osacHazL7oouQZKOMFRnM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Dr1H9aPWj8lP+ZM1jtp+jHMcbG37rN6rK6GTAbADb7vRIrIUZcg/cFXZIMoDEgMuB
	 22O5uanPHclLc5ci5ycIRepqK4T1IUjYD110E4S88wp19FND3ZEcXDKNPJALRjNX3f
	 ZU3oQMGHqaRnymhESqVuhgS1xd6nbP5RxFf25yRDyPhd193/F7LUp2q2g3C8OVzJuD
	 T87eAtW28GXdVtUnzm4++bOL/fk/kz+ccBGv5sncSZzIQpW0xxffWjD6Z3eM5F3YkJ
	 nk73mP07aE+kCNZP11DJnXLomg87Yd3/ZPa5ouxuAimKxZaz434j/8wRZGu4equQnR
	 spGbw0Uru4ykA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C71C8CE13BF; Tue, 14 Apr 2026 16:20:26 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:20:26 -0700
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
Subject: Re: [PATCH v4 5/5] locking: Add contended_release tracepoint to
 spinning locks
Message-ID: <8d98d9f4-ccab-4864-b406-d3eb684cab45@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1774536681.git.d@ilvokhin.com>
 <81eb8e0cd90b31e761e12721dbacb967281f840f.1774536681.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81eb8e0cd90b31e761e12721dbacb967281f840f.1774536681.git.d@ilvokhin.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14148-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ilvokhin.com:email]
X-Rspamd-Queue-Id: 2FF653FEFED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 03:10:04PM +0000, Dmitry Ilvokhin wrote:
> Extend the contended_release tracepoint to queued spinlocks and queued
> rwlocks.
> 
> Use the arch-overridable queued_spin_release(), introduced in the
> previous commit, to ensure the tracepoint works correctly across all
> architectures, including those with custom unlock implementations (e.g.
> x86 paravirt).
> 
> When the tracepoint is disabled, the only addition to the hot path is a
> single NOP instruction (the static branch). When enabled, the contention
> check, trace call, and unlock are combined in an out-of-line function to
> minimize hot path impact, avoiding the compiler needing to preserve the
> lock pointer in a callee-saved register across the trace call.
> 
> Binary size impact (x86_64, defconfig):
>   uninlined unlock (common case): +983 bytes  (+0.00%)
>   inlined unlock (worst case):    +58165 bytes (+0.24%)
> 
> The inlined unlock case could not be achieved through Kconfig options on
> x86_64 as PREEMPT_BUILD unconditionally selects UNINLINE_SPIN_UNLOCK on
> x86_64. The UNINLINE_SPIN_UNLOCK guards were manually inverted to force
> inline the unlock path and estimate the worst case binary size increase.
> 
> Architectures with fully custom qspinlock implementations (e.g.
> PowerPC) are not covered by this change.
> 
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
> ---
>  include/asm-generic/qrwlock.h   | 48 +++++++++++++++++++++++++++------
>  include/asm-generic/qspinlock.h | 18 +++++++++++++
>  kernel/locking/qrwlock.c        | 16 +++++++++++
>  kernel/locking/qspinlock.c      |  8 ++++++
>  4 files changed, 82 insertions(+), 8 deletions(-)
> 
> diff --git a/include/asm-generic/qrwlock.h b/include/asm-generic/qrwlock.h
> index 75b8f4601b28..e24dc537fd66 100644
> --- a/include/asm-generic/qrwlock.h
> +++ b/include/asm-generic/qrwlock.h
> @@ -14,6 +14,7 @@
>  #define __ASM_GENERIC_QRWLOCK_H
>  
>  #include <linux/atomic.h>
> +#include <linux/tracepoint-defs.h>
>  #include <asm/barrier.h>
>  #include <asm/processor.h>
>  
> @@ -35,6 +36,10 @@
>   */
>  extern void queued_read_lock_slowpath(struct qrwlock *lock);
>  extern void queued_write_lock_slowpath(struct qrwlock *lock);
> +extern void queued_read_unlock_traced(struct qrwlock *lock);
> +extern void queued_write_unlock_traced(struct qrwlock *lock);
> +
> +DECLARE_TRACEPOINT(contended_release);
>  
>  /**
>   * queued_read_trylock - try to acquire read lock of a queued rwlock
> @@ -102,10 +107,16 @@ static inline void queued_write_lock(struct qrwlock *lock)
>  }
>  
>  /**
> - * queued_read_unlock - release read lock of a queued rwlock
> + * queued_rwlock_is_contended - check if the lock is contended
>   * @lock : Pointer to queued rwlock structure
> + * Return: 1 if lock contended, 0 otherwise
>   */
> -static inline void queued_read_unlock(struct qrwlock *lock)
> +static inline int queued_rwlock_is_contended(struct qrwlock *lock)
> +{
> +	return arch_spin_is_locked(&lock->wait_lock);
> +}
> +
> +static __always_inline void __queued_read_unlock(struct qrwlock *lock)
>  {
>  	/*
>  	 * Atomically decrement the reader count
> @@ -114,22 +125,43 @@ static inline void queued_read_unlock(struct qrwlock *lock)
>  }
>  
>  /**
> - * queued_write_unlock - release write lock of a queued rwlock
> + * queued_read_unlock - release read lock of a queued rwlock
>   * @lock : Pointer to queued rwlock structure
>   */
> -static inline void queued_write_unlock(struct qrwlock *lock)
> +static inline void queued_read_unlock(struct qrwlock *lock)
> +{
> +	/*
> +	 * Trace and unlock are combined in the traced unlock variant so
> +	 * the compiler does not need to preserve the lock pointer across
> +	 * the function call, avoiding callee-saved register save/restore
> +	 * on the hot path.
> +	 */
> +	if (tracepoint_enabled(contended_release)) {
> +		queued_read_unlock_traced(lock);
> +		return;
> +	}
> +
> +	__queued_read_unlock(lock);
> +}

Shouldn't this refactoring be its own separate patch, similar to 4/5?

That would probably clean up this diff a bit.

> +
> +static __always_inline void __queued_write_unlock(struct qrwlock *lock)
>  {
>  	smp_store_release(&lock->wlocked, 0);
>  }
>  
>  /**
> - * queued_rwlock_is_contended - check if the lock is contended
> + * queued_write_unlock - release write lock of a queued rwlock
>   * @lock : Pointer to queued rwlock structure
> - * Return: 1 if lock contended, 0 otherwise
>   */
> -static inline int queued_rwlock_is_contended(struct qrwlock *lock)
> +static inline void queued_write_unlock(struct qrwlock *lock)
>  {
> -	return arch_spin_is_locked(&lock->wait_lock);
> +	/* See comment in queued_read_unlock(). */
> +	if (tracepoint_enabled(contended_release)) {
> +		queued_write_unlock_traced(lock);
> +		return;
> +	}
> +
> +	__queued_write_unlock(lock);

And the same here, so one patch for interposing __queued_read_unlock()
and another for interposing __queued_write_unlock().

>  }
>  
>  /*
> diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
> index df76f34645a0..915a4c2777f6 100644
> --- a/include/asm-generic/qspinlock.h
> +++ b/include/asm-generic/qspinlock.h
> @@ -41,6 +41,7 @@
>  
>  #include <asm-generic/qspinlock_types.h>
>  #include <linux/atomic.h>
> +#include <linux/tracepoint-defs.h>
>  
>  #ifndef queued_spin_is_locked
>  /**
> @@ -129,12 +130,29 @@ static __always_inline void queued_spin_release(struct qspinlock *lock)
>  }
>  #endif
>  
> +DECLARE_TRACEPOINT(contended_release);
> +
> +extern void queued_spin_release_traced(struct qspinlock *lock);
> +
>  /**
>   * queued_spin_unlock - unlock a queued spinlock
>   * @lock : Pointer to queued spinlock structure
> + *
> + * Generic tracing wrapper around the arch-overridable
> + * queued_spin_release().
>   */
>  static __always_inline void queued_spin_unlock(struct qspinlock *lock)
>  {
> +	/*
> +	 * Trace and release are combined in queued_spin_release_traced() so
> +	 * the compiler does not need to preserve the lock pointer across the
> +	 * function call, avoiding callee-saved register save/restore on the
> +	 * hot path.
> +	 */
> +	if (tracepoint_enabled(contended_release)) {
> +		queued_spin_release_traced(lock);
> +		return;
> +	}
>  	queued_spin_release(lock);
>  }
>  
> diff --git a/kernel/locking/qrwlock.c b/kernel/locking/qrwlock.c
> index d2ef312a8611..5f7a0fc2b27a 100644
> --- a/kernel/locking/qrwlock.c
> +++ b/kernel/locking/qrwlock.c

And is it possible to have one patch for qspinlock and another for qrwlock?
It *looks* like it should be.

							Thanx, Paul

> @@ -90,3 +90,19 @@ void __lockfunc queued_write_lock_slowpath(struct qrwlock *lock)
>  	trace_contention_end(lock, 0);
>  }
>  EXPORT_SYMBOL(queued_write_lock_slowpath);
> +
> +void __lockfunc queued_read_unlock_traced(struct qrwlock *lock)
> +{
> +	if (queued_rwlock_is_contended(lock))
> +		trace_contended_release(lock);
> +	__queued_read_unlock(lock);
> +}
> +EXPORT_SYMBOL(queued_read_unlock_traced);
> +
> +void __lockfunc queued_write_unlock_traced(struct qrwlock *lock)
> +{
> +	if (queued_rwlock_is_contended(lock))
> +		trace_contended_release(lock);
> +	__queued_write_unlock(lock);
> +}
> +EXPORT_SYMBOL(queued_write_unlock_traced);
> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
> index af8d122bb649..c72610980ec7 100644
> --- a/kernel/locking/qspinlock.c
> +++ b/kernel/locking/qspinlock.c
> @@ -104,6 +104,14 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
>  #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
>  #endif
>  
> +void __lockfunc queued_spin_release_traced(struct qspinlock *lock)
> +{
> +	if (queued_spin_is_contended(lock))
> +		trace_contended_release(lock);
> +	queued_spin_release(lock);
> +}
> +EXPORT_SYMBOL(queued_spin_release_traced);
> +
>  #endif /* _GEN_PV_LOCK_SLOWPATH */
>  
>  /**
> -- 
> 2.52.0
> 

