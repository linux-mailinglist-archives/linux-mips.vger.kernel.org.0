Return-Path: <linux-mips+bounces-14181-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOvTHw534WkCtgAAu9opvQ
	(envelope-from <linux-mips+bounces-14181-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 01:55:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D45415C23
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 01:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32C103010B90
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 23:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC557384239;
	Thu, 16 Apr 2026 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u01eqPN6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AE537B002;
	Thu, 16 Apr 2026 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776383655; cv=none; b=uZh0LNey33Td9ehg5684IgvV8fjuZhUAJ94T9mp2yOyyPjYahiVWLYruT5JFHnRROn+r02AjByifs3xvWO9XXxOt5B/EdknI2HuIjTiZbq169/chyyYZ8GjtYwGCsODFm7avX60gGTipGVmetbxHJjq9NyBAqFLTP0uEb3jZLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776383655; c=relaxed/simple;
	bh=TXSRIJ/h22avk7murAB6glIED87kidjbJTYSFQI5SwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjxTlIPgKkTVKEeK1dGDlN73FLEttO2reeJJ77zJNyqiXMjWbdIGcssaj+Gcwwk+RikjqOQ5hLpAST/QDDlF6MRWbUxcsFRoylK8MM6sMAX476QMXvv0q1SNgMZlXqEnzHfUvp39itIPj9xfDpGX5XAf2YuSRuRET9XxcX652Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u01eqPN6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFD1C2BCAF;
	Thu, 16 Apr 2026 23:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776383655;
	bh=TXSRIJ/h22avk7murAB6glIED87kidjbJTYSFQI5SwI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=u01eqPN68WSsjD3cD/F6AL+NPCxKGMcCe+WzvehEPA6ul0uV7ztfDDsEJ+a5IcinX
	 UPPadarOwbfuJr8QzuLi2mxLddeRIBJ3bcfV6pHDieviyeDAvnMoG55BhEYB0DhO8l
	 0g8J5C9jfCx+YxBkCqAiO7vYYclrHUVBmGFEzEWPLK8nkf3fgqb77lh+ZBvJ2s7yT5
	 CFIhEwQ5DPGyrxGDnFqdP3YeuOG0l7qRzCsZw+f983jkklXWRSJz9PDgeg+7eD+kfh
	 bfUQIMRk2dAB2NCWcX9Dsbuc1zuPUW9vVsKYuqVLlyyvSsQocAH6Rd2FiPZaUJmybt
	 YeG6PDph5XO0w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C2A87CE08B2; Thu, 16 Apr 2026 16:54:14 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:54:14 -0700
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
Subject: Re: [PATCH v5 5/7] locking: Add contended_release tracepoint to
 qspinlock
Message-ID: <2bc24e26-7b01-4e43-8f96-35334237397b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1776350944.git.d@ilvokhin.com>
 <af285ffefa3fa2f73b73a39e9f06fb176009e047.1776350944.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af285ffefa3fa2f73b73a39e9f06fb176009e047.1776350944.git.d@ilvokhin.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14181-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ilvokhin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1D45415C23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 03:05:11PM +0000, Dmitry Ilvokhin wrote:
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

Much nicer split out!

Acked-by: Paul E. McKenney <paulmck@kernel.org>

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
> +	}
>  	queued_spin_release(lock);
>  }
>  
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

