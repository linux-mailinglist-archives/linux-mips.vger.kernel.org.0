Return-Path: <linux-mips+bounces-14000-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDSuNNfWy2mILwYAu9opvQ
	(envelope-from <linux-mips+bounces-14000-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 16:14:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 344F336AC53
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 16:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F086030CD5AB
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 14:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2313F8E03;
	Tue, 31 Mar 2026 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jeSL2mHH"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108343E0C75
	for <linux-mips@vger.kernel.org>; Tue, 31 Mar 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966323; cv=none; b=bMJyzEINOXJC6FQ+xGkWlt3RmFntNLFmS8L29Lff9A7yfHNHkuQRspnLDTMSmX22BMGZar1h6klDV3gJC6A14sChsPrp834EXuirXyfycnx8PSVXY14hhkuJ78/P9NbVd9IqjZ2Qg642s5/g6UIzEWq6XJPyDQan4zTEGBjDb+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966323; c=relaxed/simple;
	bh=SEFtJVL8+fOnpDt6n+BLZJiIueQF4OjMlbAULfzAbiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wl9UuW9cnOGHhw1yWFJnJRteS8nhF0odMtXfNwqLHiJqzJUeZ/8hbm62Spe/PfB2WRRT985hB3vG67gzktwrssYkxYQkGpPFRNw35A9ZLVucldud6A/iQnpVq8lSL8h1L17N5DO01vNhv2SLlehnG7iREugtHJTpgr6Uh3J2iLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jeSL2mHH; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <157dc048-4b2f-4170-b9ed-a72f5599e460@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774966309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdPxN9QaNf36x/V2Ie3LXQAiv3fTO3U7y0mPTWEOTDE=;
	b=jeSL2mHHnGMx63cxD4zvGwxlACLsVsl7hBb6An0yUyWU4Keh1E51CS0u318GzzMGMiEsRG
	uYkNEF5p9F59Ki2EdLT+y7fWRrnDmJjgI3VFCB+QP786AS6D1cxHmuDUvO9KE9wZof7vPe
	8vNKYD8P0hSJBsNkzW8Q2/LDRkXOY6E=
Date: Tue, 31 Mar 2026 15:11:15 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/5] locking: Add contended_release tracepoint to
 sleepable locks
Content-Language: en-GB
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, kernel-team@meta.com
References: <d2e5763278812499335b22a013aafb4979e3324b.1774536681.git.d@ilvokhin.com>
 <20260331103451.1070175-1-usama.arif@linux.dev>
 <acu7LdegiZ5_-dEW@shell.ilvokhin.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <acu7LdegiZ5_-dEW@shell.ilvokhin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14000-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,ilvokhin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 344F336AC53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 31/03/2026 15:16, Dmitry Ilvokhin wrote:
> On Tue, Mar 31, 2026 at 03:34:50AM -0700, Usama Arif wrote:
>> On Thu, 26 Mar 2026 15:10:02 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:
>>
>>> Add the contended_release trace event. This tracepoint fires on the
>>> holder side when a contended lock is released, complementing the
>>> existing contention_begin/contention_end tracepoints which fire on the
>>> waiter side.
>>>
>>> This enables correlating lock hold time under contention with waiter
>>> events by lock address.
>>>
>>> Add trace_contended_release() calls to the slowpath unlock paths of
>>> sleepable locks: mutex, rtmutex, semaphore, rwsem, percpu-rwsem, and
>>> RT-specific rwbase locks.
>>>
>>> Where possible, trace_contended_release() fires before the lock is
>>> released and before the waiter is woken. For some lock types, the
>>> tracepoint fires after the release but before the wake. Making the
>>> placement consistent across all lock types is not worth the added
>>> complexity.
>>>
>>> For reader/writer locks, the tracepoint fires for every reader releasing
>>> while a writer is waiting, not only for the last reader.
>>>
>>> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
>>> ---
>>>  include/trace/events/lock.h   | 17 +++++++++++++++++
>>>  kernel/locking/mutex.c        |  4 ++++
>>>  kernel/locking/percpu-rwsem.c | 11 +++++++++++
>>>  kernel/locking/rtmutex.c      |  1 +
>>>  kernel/locking/rwbase_rt.c    |  6 ++++++
>>>  kernel/locking/rwsem.c        | 10 ++++++++--
>>>  kernel/locking/semaphore.c    |  4 ++++
>>>  7 files changed, 51 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/trace/events/lock.h b/include/trace/events/lock.h
>>> index da978f2afb45..1ded869cd619 100644
>>> --- a/include/trace/events/lock.h
>>> +++ b/include/trace/events/lock.h
>>> @@ -137,6 +137,23 @@ TRACE_EVENT(contention_end,
>>>  	TP_printk("%p (ret=%d)", __entry->lock_addr, __entry->ret)
>>>  );
>>>  
>>> +TRACE_EVENT(contended_release,
>>> +
>>> +	TP_PROTO(void *lock),
>>> +
>>> +	TP_ARGS(lock),
>>> +
>>> +	TP_STRUCT__entry(
>>> +		__field(void *, lock_addr)
>>> +	),
>>> +
>>> +	TP_fast_assign(
>>> +		__entry->lock_addr = lock;
>>> +	),
>>> +
>>> +	TP_printk("%p", __entry->lock_addr)
>>> +);
>>> +
>>>  #endif /* _TRACE_LOCK_H */
>>>  
>>>  /* This part must be outside protection */
>>> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
>>> index 427187ff02db..6c2c9312eb8f 100644
>>> --- a/kernel/locking/mutex.c
>>> +++ b/kernel/locking/mutex.c
>>> @@ -997,6 +997,9 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>>>  		wake_q_add(&wake_q, next);
>>>  	}
>>>  
>>> +	if (trace_contended_release_enabled() && waiter)
>>> +		trace_contended_release(lock);
>>> +
>>
>> This won't compile? waiter is declared in the if block, so you are using
>> it outside scope here.
>>
> 
> Thanks for the feedback, Usama.
> 
> waiter is declared at function scope, right on top. It's also assigned
> before the if block, so it's still in scope at the tracepoint.

Ah ok, I was reviewing on top of mm-new branch from today where waiter
is declared in the if block. Probably something changed related to
locking/tracing and its not in mm-new yet.

