Return-Path: <linux-mips+bounces-14572-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD4FC7SdBGr3LwIAu9opvQ
	(envelope-from <linux-mips+bounces-14572-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 17:50:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2F15367B0
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 17:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7C48300D752
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 15:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9F4480962;
	Wed, 13 May 2026 15:41:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB2546AF1A;
	Wed, 13 May 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686876; cv=none; b=Se4qK3F0QzzQYTxdEVZ5E/XWB5UXo1I6O2BTagejpwWUATii3VnUxln/X3d5LCkReES68pIgLhOP5LUBtdOzEAYy9FmHHOH3DvOfdxeZP2/rgvgGAwo/acqXFr/qAIkwqRAGXOmxEG1NyPz5+K3xjHI4SxkAgX8TdgueUilU4Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686876; c=relaxed/simple;
	bh=/xber48vB80zIRYc3VM97SI50KrhgHv6SCvWeIfyJME=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eq5CyP4BJ6w5CQGSVhGYIvcYKseBw94XIDcNXh7hZfcW0U7GsnmW9luinw8w0ManFJmjz4aOMZ7DbwGgjA6w7xz0K+jbwprr4X7nYDpq3YyQm/zUIO8UMj7Toyvgryq1yJtYdMdssk66a+4qGJLMMC1dlEIJQzsKCqbaMbY4Uwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 30AA61C0099;
	Wed, 13 May 2026 15:41:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 70F3620018;
	Wed, 13 May 2026 15:40:59 +0000 (UTC)
Date: Wed, 13 May 2026 11:41:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, Dennis Zhou
 <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
 <cl@gentwo.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, kernel-team@meta.com, "Paul E.
 McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v6 5/7] locking: Add contended_release tracepoint to
 qspinlock
Message-ID: <20260513114102.50f4ca68@gandalf.local.home>
In-Reply-To: <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
References: <cover.1777999826.git.d@ilvokhin.com>
	<5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: s3m5tohn5d1ca1w6py7xa3hske61ei5e
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18mkuP/bq6vr3q95KTV/OT7JouORwDcItM=
X-HE-Tag: 1778686859-354629
X-HE-Meta: U2FsdGVkX18OJHEBOrij1GY8MS3sNjKIeD5DPV0GB4D09g1fBle5KDCGhtreToxizLc5krdFdkETIQWCa5/Hf0PvTLoKCOr5zRyt/jzDf/p3FNCOAhqeRP64XRpaugSerSyM2sv2BlpGQmwShdn04U1ogmRGA89WGF4eP6wKngOVgmT7Ln69KfPv5Rpqf0EA0hyoXySTEuVqSccmmhPMlBxgCxvgaqB8m61aJ3j0VHiZvViunQ318cdNLbJJYF9qfW7SiRuqzbe+P40V73WCi4xweZLJQFmJowvjZCJKGlsahpOOABmLiD/FtqXlvH5lm2EbeOXqqKRVJquH8ZVFaS97/QIwZaZ3hJKzj5kkJZobg0ALrj721lldn38bGC5bsDPlQm8tfvk+YKr4xnbbug==
X-Rspamd-Queue-Id: BF2F15367B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-mips@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14572-lists,linux-mips=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gandalf.local.home:mid,ilvokhin.com:email]
X-Rspamd-Action: no action

On Tue,  5 May 2026 17:09:34 +0000
Dmitry Ilvokhin <d@ilvokhin.com> wrote:

> Use the arch-overridable queued_spin_release(), introduced in the
> previous commit, to ensure the tracepoint works correctly across all

Remove the ", introduced in the previous commit," That's useless in git
change logs.

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
>   uninlined unlock (common case): +680 bytes  (+0.00%)
>   inlined unlock (worst case):    +83659 bytes (+0.21%)
> 
> The inlined unlock case could not be achieved through Kconfig options on
> x86_64 as PREEMPT_BUILD unconditionally selects UNINLINE_SPIN_UNLOCK on
> x86_64. The UNINLINE_SPIN_UNLOCK guards were manually inverted to force
> inline the unlock path and estimate the worst case binary size increase.
> 
> In practice, configurations with UNINLINE_SPIN_UNLOCK=n have already
> opted against binary size optimization, so the inlined worst case is
> unlikely to be a concern.
> 
> Architectures with fully custom qspinlock implementations (e.g.
> PowerPC) are not covered by this change.
> 
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> ---
>  include/asm-generic/qspinlock.h | 18 ++++++++++++++++++
>  kernel/locking/qspinlock.c      |  8 ++++++++
>  2 files changed, 26 insertions(+)
> 
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

Get rid of the "return;". What does it save you? It just makes it that you
need to duplicate the code. Even though it's a one liner, it can cause bugs
in the future if this changes. You could call the function:

  do_trace_queued_spin_release_traced(lock);


> +	}
>  	queued_spin_release(lock);
>  }
>  
> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
> index af8d122bb649..649fdca69288 100644
> --- a/kernel/locking/qspinlock.c
> +++ b/kernel/locking/qspinlock.c
> @@ -104,6 +104,14 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
>  #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
>  #endif
>  
> +void __lockfunc queued_spin_release_traced(struct qspinlock *lock)
> +{
> +	if (queued_spin_is_contended(lock))
> +		trace_call__contended_release(lock);
> +	queued_spin_release(lock);

And then remove the duplicate call of "queued_spin_release()" here.

-- Steve

> +}
> +EXPORT_SYMBOL(queued_spin_release_traced);
> +
>  #endif /* _GEN_PV_LOCK_SLOWPATH */
>  
>  /**


