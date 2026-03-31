Return-Path: <linux-mips+bounces-13997-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCCaGPOky2kUJwYAu9opvQ
	(envelope-from <linux-mips+bounces-13997-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 12:41:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6DE368311
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 12:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2650302802F
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 10:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0D63A5428;
	Tue, 31 Mar 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p33ibMJl"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513BC346FB5
	for <linux-mips@vger.kernel.org>; Tue, 31 Mar 2026 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953315; cv=none; b=RwKNDhkJO0+uwk77Ij9pnLSy6f/DwiZ5PGHL9sANVL6HHgIei2mhMC0qnSvldIJENdUv8vdywRYtqTt+gkotYdE11ky3SL9agGc6WScWyoV9XUY7QPDhdnnsi5r46qqVXx24V4vgLn06yQtKzMCnozz+Tk2nEnynmwt/zIt2jcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953315; c=relaxed/simple;
	bh=muUGB/hVsXba530bq091OpV1HBQwDeWHgy3f9fXku+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXUhhJEPMAYGsA8SxnpAuunCUgE9dncH1MQTZnu4GzcEmV4PIQ43aRrKCU3qlBakDvSlQNb9JcFqi1GAR92EYp886i4zIl6DNe8Cnv9oBbAqlZ1TiTBATI1s5VPlOiUmyTiaLSDisqx6qtD9hkzxkrMi4NABDEdPDN13EXzJE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p33ibMJl; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774953301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eGoJpSFt6qPU5Tj1tCTJazBok4fp1H7/lxXOEKF1LAE=;
	b=p33ibMJltLANQa/bsMRalz0WLn9BlHm8C+vEC5ite7qjEZ0cbDSZL23LJhIXOh4mWTMMG4
	TBKLq9j8Mz6GbrKJDMbOx9Su5uRTDWM/gjU81JtLwKyzFf6t4mVUaxKYeCN9VzzuGjwlZt
	rIOn5+Mdz2haHATDFp1JJcwSMAvzAHM=
From: Usama Arif <usama.arif@linux.dev>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v4 3/5] locking: Add contended_release tracepoint to sleepable locks
Date: Tue, 31 Mar 2026 03:34:50 -0700
Message-ID: <20260331103451.1070175-1-usama.arif@linux.dev>
In-Reply-To: <d2e5763278812499335b22a013aafb4979e3324b.1774536681.git.d@ilvokhin.com>
References: 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13997-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,ilvokhin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF6DE368311
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 15:10:02 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:

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

This won't compile? waiter is declared in the if block, so you are using
it outside scope here.


