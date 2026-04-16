Return-Path: <linux-mips+bounces-14182-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGdfDN924WkCtgAAu9opvQ
	(envelope-from <linux-mips+bounces-14182-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 01:55:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A265C415C13
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 01:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 861F6300852C
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 23:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B4538F259;
	Thu, 16 Apr 2026 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCqhKot0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C02ECE86;
	Thu, 16 Apr 2026 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776383702; cv=none; b=AIrM/Hj9ZKbZ9jU1CHBK2SD5sr0CZXixE/9dwpo5o7G8/LlmF4wmJGGgS/nxO532s0PznrGIJS1kBZnuw7pL/wwOvEUAXNAjl9gaPT6eDKgqSpesOPNhkU20LGO9O5LYGdDLznBVEpnWytEuRvkLvpo2c6oU1ZV0h2owuEOU17U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776383702; c=relaxed/simple;
	bh=VTowxyWg+zn9j8jiuGeLbEeSc6Y2b6QIg8VcHWlfoL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUlgFILoWaMXXzqvlFvRV9OxiOtD2LS2OwbdnaLMSzjsvR5iDPJcHhlfEAzrqTBoh/zqjoe1Gfke5HdQvNDK19sWY07GENI2ujhbmIr0bZm7vu/CkRES09Nqo8T8sIW8NlFEgfqv0HbC/YcZNh9s7W8JJghsNV2HBQoAlD9B3Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCqhKot0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16048C2BCAF;
	Thu, 16 Apr 2026 23:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776383702;
	bh=VTowxyWg+zn9j8jiuGeLbEeSc6Y2b6QIg8VcHWlfoL8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=dCqhKot02DjEDRVLSZr9RuE7g9LL4Qrx848zBV/INJJfrG4sVFSC6GWQkW4UyxuYy
	 ogGiJ25N7Trul2F0hQcRp3pEI0zdZ7ZvO14S9J9pk55q9bmZXOYo0Nqi7iJ6rABh2w
	 jjBFC7EGmcZoZ1sCA3gfdq3ZwDvx2mt2wTlsOzWK1UeuggY0d+J+1jf/veyDtH6CH5
	 +7tqt12j7Uvvhs5gD9SrntZFo299kcV0JGXHsJEUViiZPAepLW9nz0bKSNuFTmsPmM
	 xqm9iuh+bNCp6Y4awDa+oF9EZCOIXckdVMTpYDRr+S6ZXLsNVHJkjGW+sk3+74stuC
	 WRMGCLsr1REmQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A524FCE08B2; Thu, 16 Apr 2026 16:55:01 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:55:01 -0700
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
Subject: Re: [PATCH v5 6/7] locking: Factor out
 __queued_read_unlock()/__queued_write_unlock()
Message-ID: <6445a6da-158f-40f1-ada0-fd5628b127da@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <cover.1776350944.git.d@ilvokhin.com>
 <eabc9de3347ca042eb0593c9b81c8e48254a4874.1776350944.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eabc9de3347ca042eb0593c9b81c8e48254a4874.1776350944.git.d@ilvokhin.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14182-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ilvokhin.com:email]
X-Rspamd-Queue-Id: A265C415C13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 03:05:12PM +0000, Dmitry Ilvokhin wrote:
> This is a preparatory refactoring for the next commit, which adds
> contended_release tracepoint instrumentation and needs to call the
> unlock from both traced and non-traced paths.
> 
> No functional change.
> 
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  include/asm-generic/qrwlock.h | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/include/asm-generic/qrwlock.h b/include/asm-generic/qrwlock.h
> index 75b8f4601b28..4b627bafba8b 100644
> --- a/include/asm-generic/qrwlock.h
> +++ b/include/asm-generic/qrwlock.h
> @@ -101,16 +101,26 @@ static inline void queued_write_lock(struct qrwlock *lock)
>  	queued_write_lock_slowpath(lock);
>  }
>  
> +static __always_inline void __queued_read_unlock(struct qrwlock *lock)
> +{
> +	/*
> +	 * Atomically decrement the reader count
> +	 */
> +	(void)atomic_sub_return_release(_QR_BIAS, &lock->cnts);
> +}
> +
>  /**
>   * queued_read_unlock - release read lock of a queued rwlock
>   * @lock : Pointer to queued rwlock structure
>   */
>  static inline void queued_read_unlock(struct qrwlock *lock)
>  {
> -	/*
> -	 * Atomically decrement the reader count
> -	 */
> -	(void)atomic_sub_return_release(_QR_BIAS, &lock->cnts);
> +	__queued_read_unlock(lock);
> +}
> +
> +static __always_inline void __queued_write_unlock(struct qrwlock *lock)
> +{
> +	smp_store_release(&lock->wlocked, 0);
>  }
>  
>  /**
> @@ -119,7 +129,7 @@ static inline void queued_read_unlock(struct qrwlock *lock)
>   */
>  static inline void queued_write_unlock(struct qrwlock *lock)
>  {
> -	smp_store_release(&lock->wlocked, 0);
> +	__queued_write_unlock(lock);
>  }
>  
>  /**
> -- 
> 2.52.0
> 

