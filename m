Return-Path: <linux-mips+bounces-14467-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHIsOMAk+mkzKQMAu9opvQ
	(envelope-from <linux-mips+bounces-14467-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 19:11:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E77284D1DCF
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 19:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FEEF302854E
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 17:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D424ADD90;
	Tue,  5 May 2026 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="lt719uei"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43A4A33F4;
	Tue,  5 May 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001004; cv=none; b=mBBy/8hV66YFRb8+bl2q8mbyrhGEzIY00uuVcjR6VsGYFjdOes2vccXw9LScRxUYvkHDZT8qFFgJqK9pdbHJwVO3/HOJK/s15abFkj9O3FoxL5hcdW4spB5Q19uYjDLLfMHOSI+FrYvMTDmC41K1odMKWA3wCwUbShoBvo9rZ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001004; c=relaxed/simple;
	bh=mraJN1NbsGD/dzKMa2w2GJIg2A7ETfaDkmweFrXmhjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OERVQ9QsR8Yw2lxAXsCV1RLrfYxBOz/npKfxV91/7xY5CqIpm0FJvIeQXDoFakj0Y1EL3VZiKARRN1kB7jWx0W7OSkqOYAiSVUqOowIqcTlsBYzDY/FHk9PskFYgKRezlv0gjiy5noezW/9evif8rWZkHFKjZYV0vnNIOashFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=lt719uei; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 388DFD0005;
	Tue, 05 May 2026 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1778000995;
	bh=HNQRtWDHTSdHuulO3xaZF7TbUmQJOtiaHzb+LTQXOgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lt719ueizrhf62Y1Z7/DZbnmjEx0GJ0GjDpQhigoaaIbE/RpBOAJkHGdfOMuYyBjk
	 4l56I3tj+XiqaPZPebIxNQMWRr+l90s8NGj8CwP7j64JI9O3RyLiI7Cd4dIRMRt2Pg
	 WnkSFzXSeAx6cbAJJHStQMGcmpN8eYCWX+ayIshY=
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
Subject: [PATCH v6 6/7] locking: Factor out __queued_read_unlock()/__queued_write_unlock()
Date: Tue,  5 May 2026 17:09:35 +0000
Message-ID: <8e88613c73f0603c4440ba3a62eb604a5dddc57b.1777999826.git.d@ilvokhin.com>
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
X-Rspamd-Queue-Id: E77284D1DCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-14467-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ilvokhin.com:email,ilvokhin.com:dkim,ilvokhin.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

This is a preparatory refactoring for the next commit, which adds
contended_release tracepoint instrumentation and needs to call the
unlock from both traced and non-traced paths.

No functional change.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
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


