Return-Path: <linux-mips+bounces-14176-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKjtMiT74GlloAAAu9opvQ
	(envelope-from <linux-mips+bounces-14176-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:07:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC0410383
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BAD32306F66A
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 15:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484813E3D9C;
	Thu, 16 Apr 2026 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="ZJ0D+hte"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0143E277D;
	Thu, 16 Apr 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351941; cv=none; b=Nc21ufbvGnPzShvsUUqQAKIZCkpoD0eaMYQ1c72PrHpu2lrzQ1dDXgxZUCPTEwlFh5+EmybMRJSocsPbW+l/YDacGU5wLPernzV5uWuDBjF9h8/+JG6dEyXVmMJ28cGh0gt25IcoB5EchIRrwpMUxuFDmxUaB/xx8zsJ45n5RFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351941; c=relaxed/simple;
	bh=Ysq8Olc8I/8z2zi8Kqd4izsQ/k8vcNmLrPYq8SO1vLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1j9QYXHBASxEVgRBBUfZf41Q4tNA77fk/MiagTKQVzGz+o+QASd/SQ26ZxcWEudlHYv+nijiTsZPbURx4pBiI1Y6gQ0L1hq2cd2ndYJsemX1x39Q6k2DlF2C8/ZoONkm1H3QyLQT79vB3Gjss051A+JdgGPBz88jjnjZ4QmkUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=ZJ0D+hte; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 4610CC7445;
	Thu, 16 Apr 2026 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1776351936;
	bh=ntzklD+dlafRxc2qQ7RauvHyr8rVOtuWoe+2Ne6//MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZJ0D+hte6v21FBtB159stP65D5edyBCtOztjwIJ4B83RE+6twBpRXQV/ufulR85Hr
	 xv0/3D8s8xhx7NnpT6mzB1U7KkZNmkDnMtWl880ln3z99TkM6GOfYQhfSwno9ljTG/
	 02QN2PBrMtUtalpoGs3NMaYrhkh3/0jPjrUp+xFQ=
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
Subject: [PATCH v5 5/7] locking: Add contended_release tracepoint to qspinlock
Date: Thu, 16 Apr 2026 15:05:11 +0000
Message-ID: <af285ffefa3fa2f73b73a39e9f06fb176009e047.1776350944.git.d@ilvokhin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14176-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 6AFC0410383
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
  uninlined unlock (common case): +680 bytes  (+0.00%)
  inlined unlock (worst case):    +83659 bytes (+0.21%)

The inlined unlock case could not be achieved through Kconfig options on
x86_64 as PREEMPT_BUILD unconditionally selects UNINLINE_SPIN_UNLOCK on
x86_64. The UNINLINE_SPIN_UNLOCK guards were manually inverted to force
inline the unlock path and estimate the worst case binary size increase.

In practice, configurations with UNINLINE_SPIN_UNLOCK=n have already
opted against binary size optimization, so the inlined worst case is
unlikely to be a concern.

Architectures with fully custom qspinlock implementations (e.g.
PowerPC) are not covered by this change.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 include/asm-generic/qspinlock.h | 18 ++++++++++++++++++
 kernel/locking/qspinlock.c      |  8 ++++++++
 2 files changed, 26 insertions(+)

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


