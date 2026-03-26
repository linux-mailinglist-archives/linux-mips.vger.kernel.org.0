Return-Path: <linux-mips+bounces-13949-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMGvCJ5OxWkU8wQAu9opvQ
	(envelope-from <linux-mips+bounces-13949-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 16:19:58 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3F33773A
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 16:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 750A430125E2
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 15:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6D74014AD;
	Thu, 26 Mar 2026 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="dLLqDI1p"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1123FB7C2;
	Thu, 26 Mar 2026 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537830; cv=none; b=imVhjkXbbOC8k8L4Ny9N/YW+cqZ9lD7uuBqxKknlzTvNOC6bPjWnqruA8XM0RClNw+q24QitYaGh626i9P+n2pgOi5U8COULthTEiO4UICsYsyXssZolz9i8ke1WmRFtXsQpOexScNGKxZVQhJwqhtVw7RT/HLxQQRe5xktThAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537830; c=relaxed/simple;
	bh=ImpOumTXiHhK2E/RRqtjHi28bu7nryXk7tD/1s0FNio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnYZkGy4DMYw+F7RS2e0LVSox5U+FDQ/XN60gUzRqT6QAcPcERHspx7JlG9O3pHihtAJmVQJdN/sidLYdo491y/HYvt0apDS302htnXP8KsSEVOjP6YO7r6Fky5voMdeNnxTFldKyWqCfqSTLwGHwCx4V+YMB0ywYj4m1Bp+jrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=dLLqDI1p; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 9D059BDE1E;
	Thu, 26 Mar 2026 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1774537822;
	bh=vg6orVDTPecMi8OeXzXS8oUaQlC99nRHDPvEe4x4LeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dLLqDI1p21R53wCA8eob+BVI6XwqXJpZuprXjmvBjW/iBsJ7cf+ADApcxOKpwSyya
	 A+lKSNgUYnHa1L7n0SzHyd2w1GjjlxWJLI8NECaewbUXU7VVQTj7a3s0E5eKkMk38Z
	 dNvaBjriNbIT5ix6kJ00hgEddssmRBYJMPY+afno=
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
	Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [PATCH v4 5/5] locking: Add contended_release tracepoint to spinning locks
Date: Thu, 26 Mar 2026 15:10:04 +0000
Message-ID: <81eb8e0cd90b31e761e12721dbacb967281f840f.1774536681.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774536681.git.d@ilvokhin.com>
References: <cover.1774536681.git.d@ilvokhin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13949-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ilvokhin.com:dkim,ilvokhin.com:email,ilvokhin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EA3F33773A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the contended_release tracepoint to queued spinlocks and queued
rwlocks.

Use the arch-overridable queued_spin_release(), introduced in the
previous commit, to ensure the tracepoint works correctly across all
architectures, including those with custom unlock implementations (e.g.
x86 paravirt).

When the tracepoint is disabled, the only addition to the hot path is a
single NOP instruction (the static branch). When enabled, the contention
check, trace call, and unlock are combined in an out-of-line function to
minimize hot path impact, avoiding the compiler needing to preserve the
lock pointer in a callee-saved register across the trace call.

Binary size impact (x86_64, defconfig):
  uninlined unlock (common case): +983 bytes  (+0.00%)
  inlined unlock (worst case):    +58165 bytes (+0.24%)

The inlined unlock case could not be achieved through Kconfig options on
x86_64 as PREEMPT_BUILD unconditionally selects UNINLINE_SPIN_UNLOCK on
x86_64. The UNINLINE_SPIN_UNLOCK guards were manually inverted to force
inline the unlock path and estimate the worst case binary size increase.

Architectures with fully custom qspinlock implementations (e.g.
PowerPC) are not covered by this change.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 include/asm-generic/qrwlock.h   | 48 +++++++++++++++++++++++++++------
 include/asm-generic/qspinlock.h | 18 +++++++++++++
 kernel/locking/qrwlock.c        | 16 +++++++++++
 kernel/locking/qspinlock.c      |  8 ++++++
 4 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/include/asm-generic/qrwlock.h b/include/asm-generic/qrwlock.h
index 75b8f4601b28..e24dc537fd66 100644
--- a/include/asm-generic/qrwlock.h
+++ b/include/asm-generic/qrwlock.h
@@ -14,6 +14,7 @@
 #define __ASM_GENERIC_QRWLOCK_H
 
 #include <linux/atomic.h>
+#include <linux/tracepoint-defs.h>
 #include <asm/barrier.h>
 #include <asm/processor.h>
 
@@ -35,6 +36,10 @@
  */
 extern void queued_read_lock_slowpath(struct qrwlock *lock);
 extern void queued_write_lock_slowpath(struct qrwlock *lock);
+extern void queued_read_unlock_traced(struct qrwlock *lock);
+extern void queued_write_unlock_traced(struct qrwlock *lock);
+
+DECLARE_TRACEPOINT(contended_release);
 
 /**
  * queued_read_trylock - try to acquire read lock of a queued rwlock
@@ -102,10 +107,16 @@ static inline void queued_write_lock(struct qrwlock *lock)
 }
 
 /**
- * queued_read_unlock - release read lock of a queued rwlock
+ * queued_rwlock_is_contended - check if the lock is contended
  * @lock : Pointer to queued rwlock structure
+ * Return: 1 if lock contended, 0 otherwise
  */
-static inline void queued_read_unlock(struct qrwlock *lock)
+static inline int queued_rwlock_is_contended(struct qrwlock *lock)
+{
+	return arch_spin_is_locked(&lock->wait_lock);
+}
+
+static __always_inline void __queued_read_unlock(struct qrwlock *lock)
 {
 	/*
 	 * Atomically decrement the reader count
@@ -114,22 +125,43 @@ static inline void queued_read_unlock(struct qrwlock *lock)
 }
 
 /**
- * queued_write_unlock - release write lock of a queued rwlock
+ * queued_read_unlock - release read lock of a queued rwlock
  * @lock : Pointer to queued rwlock structure
  */
-static inline void queued_write_unlock(struct qrwlock *lock)
+static inline void queued_read_unlock(struct qrwlock *lock)
+{
+	/*
+	 * Trace and unlock are combined in the traced unlock variant so
+	 * the compiler does not need to preserve the lock pointer across
+	 * the function call, avoiding callee-saved register save/restore
+	 * on the hot path.
+	 */
+	if (tracepoint_enabled(contended_release)) {
+		queued_read_unlock_traced(lock);
+		return;
+	}
+
+	__queued_read_unlock(lock);
+}
+
+static __always_inline void __queued_write_unlock(struct qrwlock *lock)
 {
 	smp_store_release(&lock->wlocked, 0);
 }
 
 /**
- * queued_rwlock_is_contended - check if the lock is contended
+ * queued_write_unlock - release write lock of a queued rwlock
  * @lock : Pointer to queued rwlock structure
- * Return: 1 if lock contended, 0 otherwise
  */
-static inline int queued_rwlock_is_contended(struct qrwlock *lock)
+static inline void queued_write_unlock(struct qrwlock *lock)
 {
-	return arch_spin_is_locked(&lock->wait_lock);
+	/* See comment in queued_read_unlock(). */
+	if (tracepoint_enabled(contended_release)) {
+		queued_write_unlock_traced(lock);
+		return;
+	}
+
+	__queued_write_unlock(lock);
 }
 
 /*
diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index df76f34645a0..915a4c2777f6 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -41,6 +41,7 @@
 
 #include <asm-generic/qspinlock_types.h>
 #include <linux/atomic.h>
+#include <linux/tracepoint-defs.h>
 
 #ifndef queued_spin_is_locked
 /**
@@ -129,12 +130,29 @@ static __always_inline void queued_spin_release(struct qspinlock *lock)
 }
 #endif
 
+DECLARE_TRACEPOINT(contended_release);
+
+extern void queued_spin_release_traced(struct qspinlock *lock);
+
 /**
  * queued_spin_unlock - unlock a queued spinlock
  * @lock : Pointer to queued spinlock structure
+ *
+ * Generic tracing wrapper around the arch-overridable
+ * queued_spin_release().
  */
 static __always_inline void queued_spin_unlock(struct qspinlock *lock)
 {
+	/*
+	 * Trace and release are combined in queued_spin_release_traced() so
+	 * the compiler does not need to preserve the lock pointer across the
+	 * function call, avoiding callee-saved register save/restore on the
+	 * hot path.
+	 */
+	if (tracepoint_enabled(contended_release)) {
+		queued_spin_release_traced(lock);
+		return;
+	}
 	queued_spin_release(lock);
 }
 
diff --git a/kernel/locking/qrwlock.c b/kernel/locking/qrwlock.c
index d2ef312a8611..5f7a0fc2b27a 100644
--- a/kernel/locking/qrwlock.c
+++ b/kernel/locking/qrwlock.c
@@ -90,3 +90,19 @@ void __lockfunc queued_write_lock_slowpath(struct qrwlock *lock)
 	trace_contention_end(lock, 0);
 }
 EXPORT_SYMBOL(queued_write_lock_slowpath);
+
+void __lockfunc queued_read_unlock_traced(struct qrwlock *lock)
+{
+	if (queued_rwlock_is_contended(lock))
+		trace_contended_release(lock);
+	__queued_read_unlock(lock);
+}
+EXPORT_SYMBOL(queued_read_unlock_traced);
+
+void __lockfunc queued_write_unlock_traced(struct qrwlock *lock)
+{
+	if (queued_rwlock_is_contended(lock))
+		trace_contended_release(lock);
+	__queued_write_unlock(lock);
+}
+EXPORT_SYMBOL(queued_write_unlock_traced);
diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index af8d122bb649..c72610980ec7 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -104,6 +104,14 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
 #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
 #endif
 
+void __lockfunc queued_spin_release_traced(struct qspinlock *lock)
+{
+	if (queued_spin_is_contended(lock))
+		trace_contended_release(lock);
+	queued_spin_release(lock);
+}
+EXPORT_SYMBOL(queued_spin_release_traced);
+
 #endif /* _GEN_PV_LOCK_SLOWPATH */
 
 /**
-- 
2.52.0


