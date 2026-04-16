Return-Path: <linux-mips+bounces-14177-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPoXOjr74GlloAAAu9opvQ
	(envelope-from <linux-mips+bounces-14177-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:07:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF1D4103D3
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3317D305702D
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 15:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99EF3E4C74;
	Thu, 16 Apr 2026 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="NftkS5tz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4808C3E3C5F;
	Thu, 16 Apr 2026 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351941; cv=none; b=HPThDDyPbsGLC60bpfBioDjbrh+ugsTGd3fD5VOy3OHGbowiOJKOjYPPDaNGieUsqyibxZRjk1PhIz/WUR5Wk4U1ibIhWtwVa3UGtP/CXE/r9vC582R85XpucQK165O/pKijtuApoPNHu6hY+HGLkkptjj2BfI5Spv7fj5nZe+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351941; c=relaxed/simple;
	bh=CmTwc6lZx5Nin0oUCny/HSosoc9TIxZV/AgROqAveRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fr01X6NtIpg9hhlPm72zp0pS2jNu85TCCX4VYU0lMX72zfR4lyMJJG3+dLasCFKylymjYmqcwmQo0QcXa/qvgDn5fWCyfjKHQjNJOTRcVSjwsQjLJYGDsQUqtPTRkzEE1F99LrR2OlHVcnOHLNn4wdkNx6/phaAY8je/VKw6ckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=NftkS5tz; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 09DCCC744F;
	Thu, 16 Apr 2026 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1776351937;
	bh=+VNXsfwo1hWIpxn/gK53LLCns39qj3Tz5b8p/6O9yoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NftkS5tzXrASQNIrqYJxqv7yuKDzVytqt/4J+FFcCxu+RQq5ADLuajrMtGINxGj7T
	 nunbbBVG/b/KD91hn6VinZ1Gof65ZUG0LjUrkVC5N5hq8MeAnWYLXy6tbasbpkNFuM
	 +iB3XJIjf/JzdW7Di0ju9WhAvy4AoDwh0DB+Ui6I=
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
Subject: [PATCH v5 7/7] locking: Add contended_release tracepoint to qrwlock
Date: Thu, 16 Apr 2026 15:05:13 +0000
Message-ID: <f71b196c7877c57d6a1ab615cc1f470476f55938.1776350944.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776350944.git.d@ilvokhin.com>
References: <cover.1776350944.git.d@ilvokhin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14177-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ilvokhin.com:email,ilvokhin.com:dkim,ilvokhin.com:mid]
X-Rspamd-Queue-Id: CEF1D4103D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the contended_release tracepoint to queued rwlocks, using the
same out-of-line traced unlock approach as queued spinlocks.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 include/asm-generic/qrwlock.h | 22 ++++++++++++++++++++++
 kernel/locking/qrwlock.c      | 16 ++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/asm-generic/qrwlock.h b/include/asm-generic/qrwlock.h
index 4b627bafba8b..274c19006125 100644
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
@@ -115,6 +120,17 @@ static __always_inline void __queued_read_unlock(struct qrwlock *lock)
  */
 static inline void queued_read_unlock(struct qrwlock *lock)
 {
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
 	__queued_read_unlock(lock);
 }
 
@@ -129,6 +145,12 @@ static __always_inline void __queued_write_unlock(struct qrwlock *lock)
  */
 static inline void queued_write_unlock(struct qrwlock *lock)
 {
+	/* See comment in queued_read_unlock(). */
+	if (tracepoint_enabled(contended_release)) {
+		queued_write_unlock_traced(lock);
+		return;
+	}
+
 	__queued_write_unlock(lock);
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
-- 
2.52.0


