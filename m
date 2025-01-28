Return-Path: <linux-mips+bounces-7621-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5DCA20C7B
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 16:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100881889F43
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 15:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599831B042A;
	Tue, 28 Jan 2025 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfPwQC49"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ECF1ACEAF
	for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2025 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076590; cv=none; b=LYPRxs3+LoSTT0DIP3hjTpdTnfbEH41K5AQMmJTV89mpSo3ea0x4hCNorNsID3wlnZL+IStlIpnPMYLzwa4Rs1geMUhICC0CA/u/Ymj7YgqARCTNRnyy0EHIG9rUQMZtGjsY8pJnZDMDVr2Cyc3HUdn8v+QY/cCrBsMHN+HaMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076590; c=relaxed/simple;
	bh=McGmT7c9WIf9IcRhSEcIKyRTRsUkhz2sC4gDJTipyz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRYV6fSpU58gW/6Pitu+pqzjm9k0pR/8aQJGlOs+pouZyAwGsp+kQiYsg1KDFWojkSi946s8CepcUUl5NNNP6TbpngctMEt5lI51QgNEcMLO28JQlJjgrmiS3G80oppxUPvImUJMCUpIKDHQJ8lz9WrdyWP/wrTPz8I3k4zSMCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfPwQC49; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EknPAdcO0/rg2+vOEP6j8OFb71hw/N9FA5gNIK4Ypps=;
	b=NfPwQC49tFNRaPYBofOiO0Xvdnk9kf8dBDgrlQBf6S5Iixv8hvm3codXKgiqKcwICTui1t
	55mSTROubi/5C4K6ofvb26XKHvz3UWGKoibwiFVUH9olOya1jZw2zK5zBySWefr9z4z8MS
	DYpr4YlMrwcEqsyBx3Op6Iw1yNeWTlo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-ydiErNfsMyuFST3JLbQc6A-1; Tue,
 28 Jan 2025 10:03:04 -0500
X-MC-Unique: ydiErNfsMyuFST3JLbQc6A-1
X-Mimecast-MFC-AGG-ID: ydiErNfsMyuFST3JLbQc6A
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D2FB18009D5;
	Tue, 28 Jan 2025 15:03:01 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 1312D1800268;
	Tue, 28 Jan 2025 15:02:55 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:02:34 +0100 (CET)
Date: Tue, 28 Jan 2025 16:02:28 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] seccomp: remove the 'sd' argument from
 __secure_computing()
Message-ID: <20250128150228.GA15298@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hello,

Link to v1: https://lore.kernel.org/all/20250120134409.GA21241@redhat.com/
Only 2/4 was changed, please see interdiff at the end.

I've included the acks I got on 1/4, 3/4, and 4/4 (thanks!).

Oleg.
---

 arch/mips/kernel/ptrace.c           | 20 ++-----------------
 arch/powerpc/kernel/ptrace/ptrace.c |  2 +-
 include/linux/seccomp.h             | 12 ++++--------
 kernel/entry/common.c               |  2 +-
 kernel/seccomp.c                    | 39 ++++++++++++++++++-------------------
 5 files changed, 27 insertions(+), 48 deletions(-)

-------------------------------------------------------------------------------
diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index 6125baa96b76..9b959972bf4a 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -22,8 +22,9 @@
 #include <linux/atomic.h>
 #include <asm/seccomp.h>
 
-#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 extern int __secure_computing(void);
+
+#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 static inline int secure_computing(void)
 {
 	if (unlikely(test_syscall_work(SECCOMP)))
@@ -32,7 +33,6 @@ static inline int secure_computing(void)
 }
 #else
 extern void secure_computing_strict(int this_syscall);
-static inline int __secure_computing(void) { return 0; }
 #endif
 
 extern long prctl_get_seccomp(void);
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 75e293d3c1a1..4bd2eb50f77b 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -29,13 +29,11 @@
 #include <linux/syscalls.h>
 #include <linux/sysctl.h>
 
+#include <asm/syscall.h>
+
 /* Not exposed in headers: strictly internal use only. */
 #define SECCOMP_MODE_DEAD	(SECCOMP_MODE_FILTER + 1)
 
-#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
-#include <asm/syscall.h>
-#endif
-
 #ifdef CONFIG_SECCOMP_FILTER
 #include <linux/file.h>
 #include <linux/filter.h>
@@ -1062,6 +1060,13 @@ void secure_computing_strict(int this_syscall)
 	else
 		BUG();
 }
+int __secure_computing(void)
+{
+	int this_syscall = syscall_get_nr(current, current_pt_regs());
+
+	secure_computing_strict(this_syscall);
+	return 0;
+}
 #else
 
 #ifdef CONFIG_SECCOMP_FILTER


