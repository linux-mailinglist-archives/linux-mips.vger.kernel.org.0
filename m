Return-Path: <linux-mips+bounces-14172-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEyENgD74GlloAAAu9opvQ
	(envelope-from <linux-mips+bounces-14172-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:06:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A7410339
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6DAB303AB2E
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 15:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551963E275E;
	Thu, 16 Apr 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="SzR8ef/b"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD04346777;
	Thu, 16 Apr 2026 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351939; cv=none; b=JpklBAmHHcHHmldP5wQfuMnyy1I0XaHmePw4IJkAcUxrcj+J0rEZPaLMLtCrLUCnkmMjsbe9zyzxnX3cTaqIDtj7mFRlejqKm0IQwptpWMBRSCS6hl/Yw3QGDGGKpxNZm5P8NULuyQkqXL1slmxYywnK8LehhaV8RtjdMXRDebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351939; c=relaxed/simple;
	bh=i7E8mpq7f8n5P0+KymzP1hZ2h3+wJWOS8TlDzMS8yzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZcRfishm6nzjJhQiScrcUBIcsHb/r9wW2Pvo/pH0TEZHPFh6G36gwItiOzKz1f/2am/JY3B6mf+usJfm5dKebzMOdZ716FNDSt47wRtX4mthiLPonBywlBB036nRlQytFYg6kEd3Nzlakg29SRGR+F1wOtzmxhtlCEffWvWjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=SzR8ef/b; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 749ACC7435;
	Thu, 16 Apr 2026 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1776351934;
	bh=FK/OfSY81tq6Km5AQA+377gd2A9PmNkH4LJCplG+lec=;
	h=From:To:Cc:Subject:Date;
	b=SzR8ef/bttplCqAFTmD6PT3OUECvzJmIpp9H46s/VbOQbzw128wChoOs901P3BLVK
	 Kiu3JDTTE+PZw5mBpkx4Qz2OR1D1+ViWFvM44BD3mikj/Z/Dx1Vg07FUonAAzFusjJ
	 Lt+NkxGAgCXpEZJyfnfe6dkzGobgLxZlbNpq8Sto=
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
	"Paul E. McKenney" <paulmck@kernel.org>,
	Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [PATCH v5 0/7] locking: contended_release tracepoint instrumentation
Date: Thu, 16 Apr 2026 15:05:06 +0000
Message-ID: <cover.1776350944.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14172-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ilvokhin.com:dkim,ilvokhin.com:mid]
X-Rspamd-Queue-Id: D87A7410339
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The existing contention_begin/contention_end tracepoints fire on the
waiter side. The lock holder's identity and stack can be captured at
contention_begin time (e.g. perf lock contention --lock-owner), but
this reflects the holder's state when a waiter arrives, not when the
lock is actually released.

This series adds a contended_release tracepoint that fires on the
holder side when a lock with waiters is released. This provides:

- Hold time estimation: when the holder's own acquisition was
  contended, its contention_end (acquisition) and contended_release
  can be correlated to measure how long the lock was held under
  contention.

- The holder's stack at release time, which may differ from what perf lock
  contention --lock-owner captures if the holder does significant work between
  the waiter's arrival and the unlock.

Note: for reader/writer locks, the tracepoint fires for every reader
releasing while a writer is waiting, not only for the last reader.

v4 -> v5:

- Split the combined spinning locks patch into separate qspinlock and                                                   
  qrwlock patches (Paul E. McKenney).                     
- Factor out __queued_read_unlock()/__queued_write_unlock() as a                                                        
  separate preparatory commit, mirroring the queued_spin_release()
  split (Paul E. McKenney).                                                                                             
- Updated binary size numbers for qspinlock-only change.
- Added Acked-by and Reviewed-by tags where appropriate.

v3 -> v4:

- Fix spurious events in __percpu_up_read(): guard with
  rcuwait_active(&sem->writer) to avoid tracing during the RCU grace
  period after a writer releases (Sashiko).
- Fix possible use-after-free in semaphore up(): move
  trace_contended_release() inside the sem->lock critical section
  (Sashiko).
- Fix build failure with CONFIG_PARAVIRT_SPINLOCKS=y: introduce
  queued_spin_release() as the arch-overridable unlock primitive,
  so queued_spin_unlock() can be a generic tracing wrapper. Convert
  x86 (paravirt) and MIPS overrides (Sashiko).
- Add EXPORT_TRACEPOINT_SYMBOL_GPL(contended_release) for module
  support (Sashiko).
- Split spinning locks patch: factor out queued_spin_release() as a
  separate preparatory commit (Sashiko).
- Make read unlock tracepoint behavior consistent across all
  reader/writer lock types: fire for every reader releasing while
  a writer is waiting (rwsem, rwbase_rt were previously last-reader
  only).

v2 -> v3:

- Added new patch: extend contended_release tracepoint to queued spinlocks
  and queued rwlocks (marked as RFC, requesting feedback). This is prompted by
  Matthew Wilcox's suggestion to try to come up with generic instrumentation,
  instead of instrumenting each "special" lock manually. See [1] for the
  discussion.
- Reworked tracepoint placement to fire before the lock is released and
  before the waiter is woken where possible, for consistency with
  spinning locks where there is no explicit wake (inspired by Usama Arif's
  suggestion).
- Remove unnecessary linux/sched.h include from trace/events/lock.h.

RFC -> v2:

- Add trace_contended_release_enabled() guard before waiter checks that
  exist only for the tracepoint (Steven Rostedt).
- Rename __percpu_up_read_slowpath() to __percpu_up_read() (Peter
  Zijlstra).
- Add extern for __percpu_up_read() (Peter Zijlstra).
- Squashed tracepoint introduction and usage commits (Masami Hiramatsu).

v4: https://lore.kernel.org/all/cover.1774536681.git.d@ilvokhin.com/
v3: https://lore.kernel.org/all/cover.1773858853.git.d@ilvokhin.com/
v2: https://lore.kernel.org/all/cover.1773164180.git.d@ilvokhin.com/
RFC: https://lore.kernel.org/all/cover.1772642407.git.d@ilvokhin.com/

[1]: https://lore.kernel.org/all/aa7G1nD7Rd9F4eBH@casper.infradead.org/

Dmitry Ilvokhin (7):
  tracing/lock: Remove unnecessary linux/sched.h include
  locking/percpu-rwsem: Extract __percpu_up_read()
  locking: Add contended_release tracepoint to sleepable locks
  locking: Factor out queued_spin_release()
  locking: Add contended_release tracepoint to qspinlock
  locking: Factor out __queued_read_unlock()/__queued_write_unlock()
  locking: Add contended_release tracepoint to qrwlock

 arch/mips/include/asm/spinlock.h         |  6 ++--
 arch/x86/include/asm/paravirt-spinlock.h |  6 ++--
 include/asm-generic/qrwlock.h            | 38 ++++++++++++++++++++++--
 include/asm-generic/qspinlock.h          | 33 ++++++++++++++++++--
 include/linux/percpu-rwsem.h             | 15 ++--------
 include/trace/events/lock.h              | 18 ++++++++++-
 kernel/locking/mutex.c                   |  4 +++
 kernel/locking/percpu-rwsem.c            | 29 ++++++++++++++++++
 kernel/locking/qrwlock.c                 | 16 ++++++++++
 kernel/locking/qspinlock.c               |  8 +++++
 kernel/locking/rtmutex.c                 |  1 +
 kernel/locking/rwbase_rt.c               |  6 ++++
 kernel/locking/rwsem.c                   | 10 +++++--
 kernel/locking/semaphore.c               |  4 +++
 14 files changed, 167 insertions(+), 27 deletions(-)

-- 
2.52.0


