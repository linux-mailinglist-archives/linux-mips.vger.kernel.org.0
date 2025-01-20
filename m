Return-Path: <linux-mips+bounces-7549-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733EA16DA7
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 14:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7F1E168DF1
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D601DFD8;
	Mon, 20 Jan 2025 13:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJkeUgq7"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF578827
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380724; cv=none; b=G3m1gHGppkD51AVvD1G8ZFrT/tEALmTH98neZFpfbaFWxfmP6b4B+zUBaOksqI2bzmzYJ+dCuXtyd+i3mWB7vlKzKSA1N4ZaCUZC9nFFYKuMom88wWUXpPr3Ay6MuCLN5Iw40ABjsgcT2f0TesBYq5jFBozvJPSu8twDMwrOJEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380724; c=relaxed/simple;
	bh=WHif1f2CmE3SxIwCOjxfKNhPKp5wycfBkkl6qyNpyoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nDhDn/13+4mWNa6Lh+avpjLQynncTDzumB5WHbybWnBMtASCMXKDy9ehc0YA+Pmr3Z2/B/7Pjq4hcTHO+ZGaH3q5yNQCu/eSyTUnhyKOQHv5LPY/hglmH5eJz5o6udrKUj0ZEPJ8S4Maf54EqW+l2kh8b7KEI1SWUwhFXk7rxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJkeUgq7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=Ga7QCRtOcrnYtWlk07C9MgkwegAMWWghsqDjUI+PWno=;
	b=QJkeUgq7P00sqV9lxtrrztPQ9bHd+ahRs8D4iE8RKYIjFlP7Dj0px8xz9iJhMtCMFx87LW
	x3uVMU9jS8PlVz6IriEjoDirF6MIzYCbbl0WO3HJhccqvuEuH2c6wDkaHGvTpgt403QQFP
	7R83aU+JChtqkWPULagIubmFqxjxVk4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-158-DhGEK2dkPqquqBt9d-3q1Q-1; Mon,
 20 Jan 2025 08:45:19 -0500
X-MC-Unique: DhGEK2dkPqquqBt9d-3q1Q-1
X-Mimecast-MFC-AGG-ID: DhGEK2dkPqquqBt9d-3q1Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20C0B1955DDB;
	Mon, 20 Jan 2025 13:45:17 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AF8B619560A3;
	Mon, 20 Jan 2025 13:45:11 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:44:52 +0100 (CET)
Date: Mon, 20 Jan 2025 14:44:45 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] seccomp/mips: change syscall_trace_enter() to use
 secure_computing()
Message-ID: <20250120134445.GA21268@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134409.GA21241@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

arch/mips/Kconfig selects HAVE_ARCH_SECCOMP_FILTER so syscall_trace_enter()
can just use __secure_computing(NULL) and rely on populate_seccomp_data(sd)
and "sd == NULL" checks in __secure_computing(sd) paths.

With the change above syscall_trace_enter() can just use secure_computing()
and avoid #ifdef + test_thread_flag(TIF_SECCOMP). CONFIG_GENERIC_ENTRY is
not defined, so test_syscall_work(SECCOMP) will check TIF_SECCOMP.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
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


