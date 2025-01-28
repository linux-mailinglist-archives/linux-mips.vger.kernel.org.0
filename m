Return-Path: <linux-mips+bounces-7624-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA90A20C8A
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 16:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB8C188A201
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 15:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B451AF0B4;
	Tue, 28 Jan 2025 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYmjR9/u"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109E11AE877
	for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2025 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076641; cv=none; b=GZosMccX7nnAW+dltjGyFy52yXNVyGHOgIL+t/k/orr9cwOXY1QBGViNKk2WOPLsbe7BVFVqyWIur0NLZE83s/meyr22OjIPQpIpuYFj0Rha8GpKr4ZPF728aIpBAcL2EPCo/PtzN77vaRxlo/AGIQvxht+D/99QAphz3wcKaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076641; c=relaxed/simple;
	bh=/CRqQN6IGQL8jFnUEydCprKiTRG2FfbNdsjqk0Qji1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YnaJ/U02kc2Lk0kNn/IPlFGfOFMeBQiMROMom1KXEimn6/Hs1uMqkY2fFqO+TuBArwgDkw3TPwqgaoqWEFJ4Jnf/8uGb/ToL4eD9C9y+NfvOHmwfphzse6x2zUdPwf/fggt5OE2pk4anW+Zit2SbPZGUDuEGXtFCN5GtN/mFBJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hYmjR9/u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738076639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=btlJRCMVX8HM/vAtA+YB6/NvVfnBpTstgXDDGM8tc9Y=;
	b=hYmjR9/uVdKFVo0OYJMRIooLtimEq8E8ED5ZqvWVJPF+eiUfbXj4Emqie3ZLQ7HyWCDz8B
	LSgcX4DSAWNpkA/XkCM9P8NV8Pnt5JEV2s+Eeka90MZhNLWoJU7vZDHx5BVijKf9nu9gN/
	7HsAs8xvKOMtsG0ZEAhsBC39d+DA65E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-508-Xwn-8PiVM3S48MNRmEK_wA-1; Tue,
 28 Jan 2025 10:03:55 -0500
X-MC-Unique: Xwn-8PiVM3S48MNRmEK_wA-1
X-Mimecast-MFC-AGG-ID: Xwn-8PiVM3S48MNRmEK_wA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 736EA1801F20;
	Tue, 28 Jan 2025 15:03:53 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.70])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 9380E195608E;
	Tue, 28 Jan 2025 15:03:48 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Jan 2025 16:03:27 +0100 (CET)
Date: Tue, 28 Jan 2025 16:03:21 +0100
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
Subject: [PATCH v2 4/4] seccomp: remove the 'sd' argument from
 __seccomp_filter()
Message-ID: <20250128150321.GA15343@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

After the previous change 'sd' is always NULL.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 kernel/seccomp.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 281e853bae8c..4bd2eb50f77b 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1218,13 +1218,12 @@ static int seccomp_do_user_notification(int this_syscall,
 	return -1;
 }
 
-static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
-			    const bool recheck_after_trace)
+static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 {
 	u32 filter_ret, action;
+	struct seccomp_data sd;
 	struct seccomp_filter *match = NULL;
 	int data;
-	struct seccomp_data sd_local;
 
 	/*
 	 * Make sure that any changes to mode from another thread have
@@ -1232,12 +1231,9 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 	 */
 	smp_rmb();
 
-	if (!sd) {
-		populate_seccomp_data(&sd_local);
-		sd = &sd_local;
-	}
+	populate_seccomp_data(&sd);
 
-	filter_ret = seccomp_run_filters(sd, &match);
+	filter_ret = seccomp_run_filters(&sd, &match);
 	data = filter_ret & SECCOMP_RET_DATA;
 	action = filter_ret & SECCOMP_RET_ACTION_FULL;
 
@@ -1295,13 +1291,13 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 		 * a reload of all registers. This does not goto skip since
 		 * a skip would have already been reported.
 		 */
-		if (__seccomp_filter(this_syscall, NULL, true))
+		if (__seccomp_filter(this_syscall, true))
 			return -1;
 
 		return 0;
 
 	case SECCOMP_RET_USER_NOTIF:
-		if (seccomp_do_user_notification(this_syscall, match, sd))
+		if (seccomp_do_user_notification(this_syscall, match, &sd))
 			goto skip;
 
 		return 0;
@@ -1343,8 +1339,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 	return -1;
 }
 #else
-static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
-			    const bool recheck_after_trace)
+static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 {
 	BUG();
 
@@ -1368,7 +1363,7 @@ int __secure_computing(void)
 		__secure_computing_strict(this_syscall);  /* may call do_exit */
 		return 0;
 	case SECCOMP_MODE_FILTER:
-		return __seccomp_filter(this_syscall, NULL, false);
+		return __seccomp_filter(this_syscall, false);
 	/* Surviving SECCOMP_RET_KILL_* must be proactively impossible. */
 	case SECCOMP_MODE_DEAD:
 		WARN_ON_ONCE(1);
-- 
2.25.1.362.g51ebf55


