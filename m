Return-Path: <linux-mips+bounces-14466-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LT9BbUk+mnyKAMAu9opvQ
	(envelope-from <linux-mips+bounces-14466-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 19:11:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C2C4D1DB1
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 19:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CBCC30633FE
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 17:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C5A4A3411;
	Tue,  5 May 2026 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="zcCtOI/d"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47374A2E23;
	Tue,  5 May 2026 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001003; cv=none; b=V0qWs+VKzckKaQ7HrSc7GvzMcpm+pvFvv7QOTo9LaBTnLZh5ua3OLnR2inqsa/ZAjIfsdNzPzWp/fdGX7k53obp2pZGgQwG5a0zJugfROuJUXHci5NGmleW5EgXxNak6oGAuHv7gASI8zg25v2P8BPjCaMd+h8cS2GsX55DVCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001003; c=relaxed/simple;
	bh=UKN3dov81u2ruVLah9uGMEJqVPN2l4vK0rTvVmk/6uU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piPgnQ3T/kIhAyxB8CAoP6IdTD+5+LddCIq09C8XuMelkKheyi0aBkf0gNaQTWgckcqBewfoR8n1wcRW5Ti/lDnwSFOVbkzzyaCfR+SANmGHjZWSKa1tLY6gUVgkOEEjK9CQlYIUxnXNocWW52cXogeZ/M/MdztQ1SEiacOBKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=zcCtOI/d; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id ECED4CFFF7;
	Tue, 05 May 2026 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1778000994;
	bh=TU6fnwDkVJ/mUD/VZ0OBa0Es886o/JD7esEKomLEV8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zcCtOI/d+ZuvnwEzkIXl5D/JI/z6PvCNTaZw9QKwmjnme0R6jWKnWQL1dqEr7LjZ/
	 zS8X0JF9txAqSbwGjuc0jKcz3Xyfm5r1QknHBbg9XC67GAnznYDi/a5WDrY1ZtkK9V
	 0Uh/RsxUM9enkB10s7cXSbaVULny+m8bSeLRl+is=
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Peter Zijlstra <peterz@infradead.org>,
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
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Dmitry Ilvokhin <d@ilvokhin.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH v6 3/7] locking: Add contended_release tracepoint to sleepable locks
Date: Tue,  5 May 2026 17:09:32 +0000
Message-ID: <81cac7754f10897977094baa1b93779c66d894f8.1777999826.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777999826.git.d@ilvokhin.com>
References: <cover.1777999826.git.d@ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 76C2C4D1DB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14466-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ilvokhin.com:email,ilvokhin.com:dkim,ilvokhin.com:mid]

Add the contended_release trace event. This tracepoint fires on the
holder side when a contended lock is released, complementing the
existing contention_begin/contention_end tracepoints which fire on the
waiter side.

This enables correlating lock hold time under contention with waiter
events by lock address.

Add trace_contended_release()/trace_call__contended_release() calls to
the slowpath unlock paths of sleepable locks: mutex, rtmutex, semaphore,
rwsem, percpu-rwsem, and RT-specific rwbase locks.

Where possible, trace_contended_release() fires before the lock is
released and before the waiter is woken. For some lock types, the
tracepoint fires after the release but before the wake. Making the
placement consistent across all lock types is not worth the added
complexity.

For reader/writer locks, the tracepoint fires for every reader releasing
while a writer is waiting, not only for the last reader.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
---
 include/trace/events/lock.h   | 17 +++++++++++++++++
 kernel/locking/mutex.c        |  4 ++++
 kernel/locking/percpu-rwsem.c | 11 +++++++++++
 kernel/locking/rtmutex.c      |  1 +
 kernel/locking/rwbase_rt.c    |  6 ++++++
 kernel/locking/rwsem.c        | 10 ++++++++--
 kernel/locking/semaphore.c    |  4 ++++
 7 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/lock.h b/include/trace/events/lock.h
index da978f2afb45..1ded869cd619 100644
--- a/include/trace/events/lock.h
+++ b/include/trace/events/lock.h
@@ -137,6 +137,23 @@ TRACE_EVENT(contention_end,
 	TP_printk("%p (ret=%d)", __entry->lock_addr, __entry->ret)
 );
 
+TRACE_EVENT(contended_release,
+
+	TP_PROTO(void *lock),
+
+	TP_ARGS(lock),
+
+	TP_STRUCT__entry(
+		__field(void *, lock_addr)
+	),
+
+	TP_fast_assign(
+		__entry->lock_addr = lock;
+	),
+
+	TP_printk("%p", __entry->lock_addr)
+);
+
 #endif /* _TRACE_LOCK_H */
 
 /* This part must be outside protection */
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 09534628dc01..43b7f7e281a0 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -1023,6 +1023,9 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
 		wake_q_add(&wake_q, next);
 	}
 
+	if (trace_contended_release_enabled() && waiter)
+		trace_call__contended_release(lock);
+
 	if (owner & MUTEX_FLAG_HANDOFF)
 		__mutex_handoff(lock, next);
 
@@ -1220,6 +1223,7 @@ EXPORT_SYMBOL(ww_mutex_lock_interruptible);
 
 EXPORT_TRACEPOINT_SYMBOL_GPL(contention_begin);
 EXPORT_TRACEPOINT_SYMBOL_GPL(contention_end);
+EXPORT_TRACEPOINT_SYMBOL_GPL(contended_release);
 
 /**
  * atomic_dec_and_mutex_lock - return holding mutex if we dec to 0
diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
index f3ee7a0d6047..f7e152c40d6d 100644
--- a/kernel/locking/percpu-rwsem.c
+++ b/kernel/locking/percpu-rwsem.c
@@ -263,6 +263,9 @@ void percpu_up_write(struct percpu_rw_semaphore *sem)
 {
 	rwsem_release(&sem->dep_map, _RET_IP_);
 
+	if (trace_contended_release_enabled() && wq_has_sleeper(&sem->waiters))
+		trace_call__contended_release(sem);
+
 	/*
 	 * Signal the writer is done, no fast path yet.
 	 *
@@ -292,6 +295,14 @@ EXPORT_SYMBOL_GPL(percpu_up_write);
 void __percpu_up_read(struct percpu_rw_semaphore *sem)
 {
 	lockdep_assert_preemption_disabled();
+	/*
+	 * After percpu_up_write() completes, rcu_sync_is_idle() can still
+	 * return false during the grace period, forcing readers into this
+	 * slowpath. Only trace when a writer is actually waiting for
+	 * readers to drain.
+	 */
+	if (trace_contended_release_enabled() && rcuwait_active(&sem->writer))
+		trace_call__contended_release(sem);
 	/*
 	 * slowpath; reader will only ever wake a single blocked
 	 * writer.
diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 69759fde7d10..9a4c3bee50ac 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1470,6 +1470,7 @@ static void __sched rt_mutex_slowunlock(struct rt_mutex_base *lock)
 		raw_spin_lock_irqsave(&lock->wait_lock, flags);
 	}
 
+	trace_contended_release(lock);
 	/*
 	 * The wakeup next waiter path does not suffer from the above
 	 * race. See the comments there.
diff --git a/kernel/locking/rwbase_rt.c b/kernel/locking/rwbase_rt.c
index 82e078c0665a..2835c9ef9b3f 100644
--- a/kernel/locking/rwbase_rt.c
+++ b/kernel/locking/rwbase_rt.c
@@ -174,6 +174,8 @@ static void __sched __rwbase_read_unlock(struct rwbase_rt *rwb,
 static __always_inline void rwbase_read_unlock(struct rwbase_rt *rwb,
 					       unsigned int state)
 {
+	if (trace_contended_release_enabled() && rt_mutex_owner(&rwb->rtmutex))
+		trace_call__contended_release(rwb);
 	/*
 	 * rwb->readers can only hit 0 when a writer is waiting for the
 	 * active readers to leave the critical section.
@@ -205,6 +207,8 @@ static inline void rwbase_write_unlock(struct rwbase_rt *rwb)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&rtm->wait_lock, flags);
+	if (trace_contended_release_enabled() && rt_mutex_has_waiters(rtm))
+		trace_call__contended_release(rwb);
 	__rwbase_write_unlock(rwb, WRITER_BIAS, flags);
 }
 
@@ -214,6 +218,8 @@ static inline void rwbase_write_downgrade(struct rwbase_rt *rwb)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&rtm->wait_lock, flags);
+	if (trace_contended_release_enabled() && rt_mutex_has_waiters(rtm))
+		trace_call__contended_release(rwb);
 	/* Release it and account current as reader */
 	__rwbase_write_unlock(rwb, WRITER_BIAS - 1, flags);
 }
diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index bf647097369c..b9c180ac1eee 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -1387,6 +1387,8 @@ static inline void __up_read(struct rw_semaphore *sem)
 	rwsem_clear_reader_owned(sem);
 	tmp = atomic_long_add_return_release(-RWSEM_READER_BIAS, &sem->count);
 	DEBUG_RWSEMS_WARN_ON(tmp < 0, sem);
+	if (trace_contended_release_enabled() && (tmp & RWSEM_FLAG_WAITERS))
+		trace_call__contended_release(sem);
 	if (unlikely((tmp & (RWSEM_LOCK_MASK|RWSEM_FLAG_WAITERS)) ==
 		      RWSEM_FLAG_WAITERS)) {
 		clear_nonspinnable(sem);
@@ -1413,8 +1415,10 @@ static inline void __up_write(struct rw_semaphore *sem)
 	preempt_disable();
 	rwsem_clear_owner(sem);
 	tmp = atomic_long_fetch_add_release(-RWSEM_WRITER_LOCKED, &sem->count);
-	if (unlikely(tmp & RWSEM_FLAG_WAITERS))
+	if (unlikely(tmp & RWSEM_FLAG_WAITERS)) {
+		trace_contended_release(sem);
 		rwsem_wake(sem);
+	}
 	preempt_enable();
 }
 
@@ -1437,8 +1441,10 @@ static inline void __downgrade_write(struct rw_semaphore *sem)
 	tmp = atomic_long_fetch_add_release(
 		-RWSEM_WRITER_LOCKED+RWSEM_READER_BIAS, &sem->count);
 	rwsem_set_reader_owned(sem);
-	if (tmp & RWSEM_FLAG_WAITERS)
+	if (tmp & RWSEM_FLAG_WAITERS) {
+		trace_contended_release(sem);
 		rwsem_downgrade_wake(sem);
+	}
 	preempt_enable();
 }
 
diff --git a/kernel/locking/semaphore.c b/kernel/locking/semaphore.c
index 74d41433ba13..233730c25933 100644
--- a/kernel/locking/semaphore.c
+++ b/kernel/locking/semaphore.c
@@ -230,6 +230,10 @@ void __sched up(struct semaphore *sem)
 		sem->count++;
 	else
 		__up(sem, &wake_q);
+
+	if (trace_contended_release_enabled() && !wake_q_empty(&wake_q))
+		trace_call__contended_release(sem);
+
 	raw_spin_unlock_irqrestore(&sem->lock, flags);
 	if (!wake_q_empty(&wake_q))
 		wake_up_q(&wake_q);
-- 
2.52.0


