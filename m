Return-Path: <linux-mips+bounces-14147-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJwYDi/K3mmVIQAAu9opvQ
	(envelope-from <linux-mips+bounces-14147-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 01:13:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2513FEFAB
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 01:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74C5A3016533
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2026 23:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69EA3B19BC;
	Tue, 14 Apr 2026 23:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3PiMs9h"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D9F396B63;
	Tue, 14 Apr 2026 23:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776208311; cv=none; b=HadbW3pKHz3Ggt+HP/IZkHbMZ7gauQOiLO0dHR14C6b8f106IM/cg/VRHN5K6vm9GW/CQ3T/u8oIghUliScCDoyXEgY1SA9Gd/LyLLqGM+zo1CWNgLA/3cZZ8H5nKZnupQRNMhdzkMc+GIudhI85vkKwAQNly/NZlEfq1g3gSz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776208311; c=relaxed/simple;
	bh=R8XiXnmNEFMK4hw6KfSubp/WFYUzB4aHlNAwFNTNhJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txM+xUGknh4ShuUiVd40A7TWt6azY35a9FVgVQrnMyJTwWk4DHvYz/9AdcocEZRKVpNOQTA12v3nE7jj278yxCHhlG2h+OGZHLKspAAbPkrQeH0IIWVgnH6q/exi77+p/Nj71zVGg0gStz+DbMqZNUTBxfGHoWayP4C7qv/IcLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3PiMs9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BED0C19425;
	Tue, 14 Apr 2026 23:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776208311;
	bh=R8XiXnmNEFMK4hw6KfSubp/WFYUzB4aHlNAwFNTNhJ8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=V3PiMs9hgRtUF05cEpSP5akhX3fb2Gfnh4UfyDoeN4U7OGQyYagrx+0aIM88025LN
	 njYj1T8JKNWYcWKEUcV11NVmN+EXo7+055JWUA/o2cnaouBSaXdHbkaLZEjXDKKOpe
	 6sRX1ILrkwQ0Ro3an5LjudM9BoL2W9fsIpcqwtmRcyz1icYqvhmyav3rBqofSfFr14
	 JsXPlB62TIKSFHJ2EvOz/DCP22f4xqPGBthRbAnitCziOwE+31HcTph0fY/8wvGCQy
	 Udx4nhbWP8WaBAtzy2THWRuQ4+RTppkXVmxHUg3ow/PcdD6NTYe7pEeYk4b4DcYDuV
	 40ehIqZB+gbXQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B344FCE13BF; Tue, 14 Apr 2026 16:11:50 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:11:50 -0700
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
Subject: Re: [PATCH v4 4/5] locking: Factor out queued_spin_release()
Message-ID: <d0c4d8da-a9bc-4efd-9a92-553a5cbd2a1c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1774536681.git.d@ilvokhin.com>
 <c15d0462f57722aa9e7bd4fd4ec1b48a0420c442.1774536681.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c15d0462f57722aa9e7bd4fd4ec1b48a0420c442.1774536681.git.d@ilvokhin.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14147-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ilvokhin.com:email]
X-Rspamd-Queue-Id: AB2513FEFAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 03:10:03PM +0000, Dmitry Ilvokhin wrote:
> Introduce queued_spin_release() as an arch-overridable unlock primitive,
> and make queued_spin_unlock() a generic wrapper around it. This is a
> preparatory refactoring for the next commit, which adds
> contended_release tracepoint instrumentation to queued_spin_unlock().
> 
> Rename the existing arch-specific queued_spin_unlock() overrides on
> x86 (paravirt) and MIPS to queued_spin_release().
> 
> No functional change.
> 
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  arch/mips/include/asm/spinlock.h         |  6 +++---
>  arch/x86/include/asm/paravirt-spinlock.h |  6 +++---
>  include/asm-generic/qspinlock.h          | 15 ++++++++++++---
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
> index 6ce2117e49f6..c349162f15eb 100644
> --- a/arch/mips/include/asm/spinlock.h
> +++ b/arch/mips/include/asm/spinlock.h
> @@ -13,12 +13,12 @@
>  
>  #include <asm-generic/qspinlock_types.h>
>  
> -#define	queued_spin_unlock queued_spin_unlock
> +#define	queued_spin_release queued_spin_release
>  /**
> - * queued_spin_unlock - release a queued spinlock
> + * queued_spin_release - release a queued spinlock
>   * @lock : Pointer to queued spinlock structure
>   */
> -static inline void queued_spin_unlock(struct qspinlock *lock)
> +static inline void queued_spin_release(struct qspinlock *lock)
>  {
>  	/* This could be optimised with ARCH_HAS_MMIOWB */
>  	mmiowb();
> diff --git a/arch/x86/include/asm/paravirt-spinlock.h b/arch/x86/include/asm/paravirt-spinlock.h
> index 7beffcb08ed6..ac75e0736198 100644
> --- a/arch/x86/include/asm/paravirt-spinlock.h
> +++ b/arch/x86/include/asm/paravirt-spinlock.h
> @@ -49,9 +49,9 @@ static __always_inline bool pv_vcpu_is_preempted(long cpu)
>  				ALT_NOT(X86_FEATURE_VCPUPREEMPT));
>  }
>  
> -#define queued_spin_unlock queued_spin_unlock
> +#define queued_spin_release queued_spin_release
>  /**
> - * queued_spin_unlock - release a queued spinlock
> + * queued_spin_release - release a queued spinlock
>   * @lock : Pointer to queued spinlock structure
>   *
>   * A smp_store_release() on the least-significant byte.
> @@ -66,7 +66,7 @@ static inline void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
>  	pv_queued_spin_lock_slowpath(lock, val);
>  }
>  
> -static inline void queued_spin_unlock(struct qspinlock *lock)
> +static inline void queued_spin_release(struct qspinlock *lock)
>  {
>  	kcsan_release();
>  	pv_queued_spin_unlock(lock);
> diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
> index bf47cca2c375..df76f34645a0 100644
> --- a/include/asm-generic/qspinlock.h
> +++ b/include/asm-generic/qspinlock.h
> @@ -115,12 +115,12 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
>  }
>  #endif
>  
> -#ifndef queued_spin_unlock
> +#ifndef queued_spin_release
>  /**
> - * queued_spin_unlock - release a queued spinlock
> + * queued_spin_release - release a queued spinlock
>   * @lock : Pointer to queued spinlock structure
>   */
> -static __always_inline void queued_spin_unlock(struct qspinlock *lock)
> +static __always_inline void queued_spin_release(struct qspinlock *lock)
>  {
>  	/*
>  	 * unlock() needs release semantics:
> @@ -129,6 +129,15 @@ static __always_inline void queued_spin_unlock(struct qspinlock *lock)
>  }
>  #endif
>  
> +/**
> + * queued_spin_unlock - unlock a queued spinlock
> + * @lock : Pointer to queued spinlock structure
> + */
> +static __always_inline void queued_spin_unlock(struct qspinlock *lock)
> +{
> +	queued_spin_release(lock);
> +}
> +
>  #ifndef virt_spin_lock
>  static __always_inline bool virt_spin_lock(struct qspinlock *lock)
>  {
> -- 
> 2.52.0
> 

