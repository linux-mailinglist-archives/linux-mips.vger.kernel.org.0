Return-Path: <linux-mips+bounces-7623-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08447A20C89
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 16:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8682E1889F24
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 15:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791271CD1E4;
	Tue, 28 Jan 2025 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0PL73gs"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEC41BE871
	for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2025 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076632; cv=none; b=MtkCnauS5OHu1vnKEQQamO9ou40qq9jrqvqQS5phXlcLinmT/d4ioA7o06vSbhaGrp0yEI+Ok+y/pG+kxKXAUUJUA6Xzrdh2zHFrnYOykqu0CDuRXcqn3xsZ3SZ6FPmWv/9+ig3v6y2FN9enUKj7fWKLdnz2pM0JjD/YZdk5gjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076632; c=relaxed/simple;
	bh=UvGapsP95l0vvTJMVqgJFmhAGiDet7y9SDCjiP7Lsr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PdJomfq0nVoMQzXpPc9ZgkTFt9QptWcEulnc+19jkdZrh1K/dZePCpKpFeKXogtMPN0I0PNkm0Wplq9jLfdMesy215YVzoiI7wfEkjcuQxIJUFQnjnVnDAei/BY/OQ7MR8J7A3IAZZ82FuThBFXX4RFqHmKAQtIpm6Is5GWAXK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0PL73gs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=YgaHt1BjGG/a+d49/WKiHz6AgENMlYHggiszKNlUzeU=;
	b=T0PL73gs3I0G4YCGAfo+nVkNW+ZB64cwqUBrzP9qZaXfnV6HozGOxzX+bRkozQA0+KdYrP
	jMJI3CP2PImmwkKULaZ9+sVcFqWK0sCiJT5URIR/ff31LScXDzdH7DO7+n4yuoqudHThWg
	m0kTxPDYkrQV7TqTYdAMcj0J1mE3kpo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-7mE_cV5NMdKI6UF7JSXxfQ-1; Tue,
 28 Jan 2025 10:03:44 -0500
X-MC-Unique: 7mE_cV5NMdKI6UF7JSXxfQ-1
X-Mimecast-MFC-AGG-ID: 7mE_cV5NMdKI6UF7JSXxfQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B3741800A11;
	Tue, 28 Jan 2025 15:03:39 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id F01681956094;
	Tue, 28 Jan 2025 15:03:34 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:03:12 +0100 (CET)
Date: Tue, 28 Jan 2025 16:03:07 +0100
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
Subject: [PATCH v2 2/4] seccomp: fix the __secure_computing() stub for
 !HAVE_ARCH_SECCOMP_FILTER
Message-ID: <20250128150307.GA15325@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128150228.GA15298@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
will crash or not. This is not consistent/safe, especially considering
that after the previous change __secure_computing(sd) is always called
with sd == NULL.

Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=n, __secure_computing()
has no callers, these architectures use secure_computing_strict(). Yet
it make sense make __secure_computing(NULL) safe in this case.

Note also that with this change we can unexport secure_computing_strict()
and change the current callers to use __secure_computing(NULL).

Fixes: 8cf8dfceebda ("seccomp: Stub for !HAVE_ARCH_SECCOMP_FILTER")
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 include/linux/seccomp.h |  8 ++------
 kernel/seccomp.c        | 14 ++++++++++----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index e45531455d3b..d55949071c30 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -22,8 +22,9 @@
 #include <linux/atomic.h>
 #include <asm/seccomp.h>
 
-#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 extern int __secure_computing(const struct seccomp_data *sd);
+
+#ifdef CONFIG_HAVE_ARCH_SECCOMP_FILTER
 static inline int secure_computing(void)
 {
 	if (unlikely(test_syscall_work(SECCOMP)))
@@ -32,11 +33,6 @@ static inline int secure_computing(void)
 }
 #else
 extern void secure_computing_strict(int this_syscall);
-static inline int __secure_computing(const struct seccomp_data *sd)
-{
-	secure_computing_strict(sd->nr);
-	return 0;
-}
 #endif
 
 extern long prctl_get_seccomp(void);
diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 385d48293a5f..327b7b486f1c 100644
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
@@ -1062,6 +1060,14 @@ void secure_computing_strict(int this_syscall)
 	else
 		BUG();
 }
+int __secure_computing(const struct seccomp_data *sd)
+{
+	int this_syscall = sd ? sd->nr :
+		syscall_get_nr(current, current_pt_regs());
+
+	secure_computing_strict(this_syscall);
+	return 0;
+}
 #else
 
 #ifdef CONFIG_SECCOMP_FILTER
-- 
2.25.1.362.g51ebf55


