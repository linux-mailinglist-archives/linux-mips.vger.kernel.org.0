Return-Path: <linux-mips+bounces-7622-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DB0A20C84
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 16:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62E243A1DAC
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 15:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EF3BE40;
	Tue, 28 Jan 2025 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="haHy1vFn"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DB11B0F30
	for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2025 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076627; cv=none; b=jaVSDLbOZ1F34YYyVTLb9/TkaAQXxq9lw5HbzQy0qMo7fJtjvurYG0RC38hfIvdllyntRnCEXfQfnSaL7FO51sXAJimZW+6uq+9fIPR6G3loeOfrLp/2JfHlM1ch6+VmzWyJXtjSEIiWBSkW7AzkeTzWAr+BDUJ4UcZU2OelEXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076627; c=relaxed/simple;
	bh=58v7Y4IHyGQ6IurFkuEI0nDvCRNtLFL6CJsMdor0y/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cPSDm0PFxKyTS7ODvxl1lLzD6hxvLriKFvF1XL4rpBSB7s+gIYRnucUhh42OE8WD23uK0p7iFrfpQ5Gmonq5QIePdXOUpQTRztMhnru5kzmlJyrFncXlGjqvmpije1ajmkWQ/9Eakq/3roxGxLoCmvBaSWFsauQ7zx6K+qqDSSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=haHy1vFn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=A7ChX7syTU7kQvpgxC35PjlmcI8srSLydm88ZSnfzAs=;
	b=haHy1vFncl08c3YdCYgw9+T/8s48/j5xYv1Pa8k3orI8vMoRH+SHc/uJfSlwn/ESrTQLDW
	oBRBTf5DhmSr5t1rtxu6AQJJFByiqsRiDiDvgr1MvABdO+ELvNCgPjaLPaIH5LRv0skd37
	nFweXT++FBxEJdhQS4mI0vbFJIgXPKk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-227-zthpiRmcML2MbERzCpKDPA-1; Tue,
 28 Jan 2025 10:03:35 -0500
X-MC-Unique: zthpiRmcML2MbERzCpKDPA-1
X-Mimecast-MFC-AGG-ID: zthpiRmcML2MbERzCpKDPA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECDBF18009C5;
	Tue, 28 Jan 2025 15:03:32 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D6A621800352;
	Tue, 28 Jan 2025 15:03:27 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:03:06 +0100 (CET)
Date: Tue, 28 Jan 2025 16:03:00 +0100
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
Subject: [PATCH v2 1/4] seccomp/mips: change syscall_trace_enter() to use
 secure_computing()
Message-ID: <20250128150300.GA15318@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so syscall_trace_enter()
can just use __secure_computing(NULL) and rely on populate_seccomp_data(sd)
and "sd == NULL" checks in __secure_computing(sd) paths.

With the change above syscall_trace_enter() can just use secure_computing()
and avoid #ifdef + test_thread_flag(TIF_SECCOMP). CONFIG_GENERIC_ENTRY is
not defined, so test_syscall_work(SECCOMP) will check TIF_SECCOMP.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/mips/kernel/ptrace.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index 61503a36067e..f7107479c7fa 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -1326,24 +1326,8 @@ asmlinkage long syscall_trace_enter(struct pt_regs *regs)
 			return -1;
 	}
 
-#ifdef CONFIG_SECCOMP
-	if (unlikely(test_thread_flag(TIF_SECCOMP))) {
-		int ret, i;
-		struct seccomp_data sd;
-		unsigned long args[6];
-
-		sd.nr = current_thread_info()->syscall;
-		sd.arch = syscall_get_arch(current);
-		syscall_get_arguments(current, regs, args);
-		for (i = 0; i < 6; i++)
-			sd.args[i] = args[i];
-		sd.instruction_pointer = KSTK_EIP(current);
-
-		ret = __secure_computing(&sd);
-		if (ret == -1)
-			return ret;
-	}
-#endif
+	if (secure_computing())
+		return -1;
 
 	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
 		trace_sys_enter(regs, regs->regs[2]);
-- 
2.25.1.362.g51ebf55


