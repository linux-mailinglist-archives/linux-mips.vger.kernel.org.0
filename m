Return-Path: <linux-mips+bounces-14175-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLBHJJr74GlloAAAu9opvQ
	(envelope-from <linux-mips+bounces-14175-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:09:14 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FD410457
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 17:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F38F3143D26
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2026 15:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313723E3D93;
	Thu, 16 Apr 2026 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="D5DQ6guF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1083E3141;
	Thu, 16 Apr 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351941; cv=none; b=nZaX4LXkXe56Bm0we1PH3Y7mx2xacM12+/hfirC0T3orbNdNt2bBEqUUCGvo0IlLKxLYCztUJvXGfqGwuypi82NDCZn9tNEI6Md8zpF30+a9E5B0HSIhLzIZJ9k6ULsAl75o2tf5HfK3rg+UpbdWPy7bMrZqoHiKQNWnvhpXwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351941; c=relaxed/simple;
	bh=1//1gpUQ+YOXooIwXf8hc5fY5X87ufQRlK9LsUNDHCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3eHO0JKowNvvmfjJO5vF6HnaaKFSq27aurev2L9FlU1hOV8ASdTDhi1F9zD4YTPTLP11w1PPF1mPH1VR8MVv5uXetqr8R3hHWEe1vYCqpf06zqvUP+S5JarNQu9XeSumG67yXI/gj3tliwA7UgX/jA79KHHbwV5Qw4AzTN+CHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=D5DQ6guF; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id A14B2C7449;
	Thu, 16 Apr 2026 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1776351936;
	bh=D8xulR7JjCNqJss+1hEV+Wl86yGJuhLSBNqNTNYuFwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D5DQ6guF7Ywnq+T4TcmGaOvR9vQeJOZ5qbphM7VEVdzCduoknOLynXGcqMXroOQUD
	 Sy/KkZXeMb1oW4Rc6STD5g6Ymo5SiON6w8WYKu6yeJpskapDA5zGG5U4OYXtNR31Jl
	 29TqDiToONSpxM/rdWX86C2ZYc/cO7sAuVqOo4oI=
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
Subject: [PATCH v5 6/7] locking: Factor out __queued_read_unlock()/__queued_write_unlock()
Date: Thu, 16 Apr 2026 15:05:12 +0000
Message-ID: <eabc9de3347ca042eb0593c9b81c8e48254a4874.1776350944.git.d@ilvokhin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14175-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 382FD410457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a preparatory refactoring for the next commit, which adds
contended_release tracepoint instrumentation and needs to call the
unlock from both traced and non-traced paths.

No functional change.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 include/asm-generic/qrwlock.h | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/asm-generic/qrwlock.h b/include/asm-generic/qrwlock.h
index 75b8f4601b28..4b627bafba8b 100644
--- a/include/asm-generic/qrwlock.h
+++ b/include/asm-generic/qrwlock.h
@@ -101,16 +101,26 @@ static inline void queued_write_lock(struct qrwlock *lock)
 	queued_write_lock_slowpath(lock);
 }
 
+static __always_inline void __queued_read_unlock(struct qrwlock *lock)
+{
+	/*
+	 * Atomically decrement the reader count
+	 */
+	(void)atomic_sub_return_release(_QR_BIAS, &lock->cnts);
+}
+
 /**
  * queued_read_unlock - release read lock of a queued rwlock
  * @lock : Pointer to queued rwlock structure
  */
 static inline void queued_read_unlock(struct qrwlock *lock)
 {
-	/*
-	 * Atomically decrement the reader count
-	 */
-	(void)atomic_sub_return_release(_QR_BIAS, &lock->cnts);
+	__queued_read_unlock(lock);
+}
+
+static __always_inline void __queued_write_unlock(struct qrwlock *lock)
+{
+	smp_store_release(&lock->wlocked, 0);
 }
 
 /**
@@ -119,7 +129,7 @@ static inline void queued_read_unlock(struct qrwlock *lock)
  */
 static inline void queued_write_unlock(struct qrwlock *lock)
 {
-	smp_store_release(&lock->wlocked, 0);
+	__queued_write_unlock(lock);
 }
 
 /**
-- 
2.52.0


