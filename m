Return-Path: <linux-mips+bounces-14464-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O/aCI8k+mnyKAMAu9opvQ
	(envelope-from <linux-mips+bounces-14464-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 19:10:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C80504D1D6C
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 19:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43F79304BF0E
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 17:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB444A2E3D;
	Tue,  5 May 2026 17:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="sWU2rOJr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB964A2E16;
	Tue,  5 May 2026 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001002; cv=none; b=sNhgnYmF62jvSUXez4JR4MFW/4Txp0ICHwfa1wyrGDiTjf9K2sdnD1cY8LpcS2G0ZBNFSFt1oUhgAZAwID8wpbr10gF0afyWjMA4Uc44vX8wuBgHG9BCTy4q0Z7pL7h8B9+wSjoPeEGQJWSMweB+ZXjupSXhlKBdrBW4DLzketk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001002; c=relaxed/simple;
	bh=nkS2FNHvuD93wdW/3Ky4EndgW9Xd2ntRYc4kP5U6umY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9h72AtWklIqcKh3qcHIEpGlDfjYdTo+b+ozRPd/eEZnLe4/sVPL4fmgQLzOgXbGbrWs2floNeTSPB6CLx1AcBZ+Wbul+N/EFoUIh4JiFEEpwJv04m7hdcEIKSCu/xk2YroIv2kVpO3lrSdxeT4c6Xb2NFgHz7++9y46kkLvSnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=sWU2rOJr; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 8367ACFFF3;
	Tue, 05 May 2026 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1778000993;
	bh=Jiq9HHreSKv9gJ1OxNDx05z/LXXiM1SwacfPI7vtSKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sWU2rOJrbDjkjTDizt2f9U5ELWqEaXAc5QmT9jVUAdoxkMtiiOnFCeUpOz6Z+KEGX
	 0SGGytVFpYd8E/QFVq933R0++oX41r40I8M6oQeN7FEE8k4o5N+4nxr6ZIgiZbqxxR
	 nQ05tef5x5Wsdba66GspFDa0eZI8GtHF/1JeTlVk=
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
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v6 2/7] locking/percpu-rwsem: Extract __percpu_up_read()
Date: Tue,  5 May 2026 17:09:31 +0000
Message-ID: <0a30ed3ffebe5753aabc083bbe93cc123227da76.1777999826.git.d@ilvokhin.com>
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
X-Rspamd-Queue-Id: C80504D1D6C
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
	TAGGED_FROM(0.00)[bounces-14464-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Move the percpu_up_read() slowpath out of the inline function into a new
__percpu_up_read() to avoid binary size increase from adding a
tracepoint to an inlined function.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
Acked-by: Usama Arif <usama.arif@linux.dev>
---
 include/linux/percpu-rwsem.h  | 15 +++------------
 kernel/locking/percpu-rwsem.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/linux/percpu-rwsem.h b/include/linux/percpu-rwsem.h
index c8cb010d655e..39d5bf8e6562 100644
--- a/include/linux/percpu-rwsem.h
+++ b/include/linux/percpu-rwsem.h
@@ -107,6 +107,8 @@ static inline bool percpu_down_read_trylock(struct percpu_rw_semaphore *sem)
 	return ret;
 }
 
+extern void __percpu_up_read(struct percpu_rw_semaphore *sem);
+
 static inline void percpu_up_read(struct percpu_rw_semaphore *sem)
 {
 	rwsem_release(&sem->dep_map, _RET_IP_);
@@ -118,18 +120,7 @@ static inline void percpu_up_read(struct percpu_rw_semaphore *sem)
 	if (likely(rcu_sync_is_idle(&sem->rss))) {
 		this_cpu_dec(*sem->read_count);
 	} else {
-		/*
-		 * slowpath; reader will only ever wake a single blocked
-		 * writer.
-		 */
-		smp_mb(); /* B matches C */
-		/*
-		 * In other words, if they see our decrement (presumably to
-		 * aggregate zero, as that is the only time it matters) they
-		 * will also see our critical section.
-		 */
-		this_cpu_dec(*sem->read_count);
-		rcuwait_wake_up(&sem->writer);
+		__percpu_up_read(sem);
 	}
 	preempt_enable();
 }
diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
index ef234469baac..f3ee7a0d6047 100644
--- a/kernel/locking/percpu-rwsem.c
+++ b/kernel/locking/percpu-rwsem.c
@@ -288,3 +288,21 @@ void percpu_up_write(struct percpu_rw_semaphore *sem)
 	rcu_sync_exit(&sem->rss);
 }
 EXPORT_SYMBOL_GPL(percpu_up_write);
+
+void __percpu_up_read(struct percpu_rw_semaphore *sem)
+{
+	lockdep_assert_preemption_disabled();
+	/*
+	 * slowpath; reader will only ever wake a single blocked
+	 * writer.
+	 */
+	smp_mb(); /* B matches C */
+	/*
+	 * In other words, if they see our decrement (presumably to
+	 * aggregate zero, as that is the only time it matters) they
+	 * will also see our critical section.
+	 */
+	this_cpu_dec(*sem->read_count);
+	rcuwait_wake_up(&sem->writer);
+}
+EXPORT_SYMBOL_GPL(__percpu_up_read);
-- 
2.52.0


