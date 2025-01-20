Return-Path: <linux-mips+bounces-7552-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5A2A16DB1
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 14:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98BB7168C33
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 13:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006FC1E1049;
	Mon, 20 Jan 2025 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="frcv4X/u"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB91E1C16
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380747; cv=none; b=pRH4T7sEm8M4dFGOH1TY+VdjxP8Zt3ZE1d4hFQr0dSSouTLJrCi6QSzgSl1PVNeBK66eWahj571hE9ZpMF4dK6YYSGq8s5xi91Zg4rG8rMLsAPaxJJBEF0UNvKrM2Z0qxccAuldV7EpXaDxyUymDxMRjIifvXl023PHAs5kXdNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380747; c=relaxed/simple;
	bh=m6lBuiJiZTJ5oH6fmhz8BBqdF09sFJ9n+qTcFvOk+mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hkDLJ3SqHynPo/PwYZ10X835A23yd2wjlpr9shQJD/2MNJNXGFYGge6Hdljd55jOY/RuVoLDvarNsaakIi7EL9TLh1jNKrYyUxeaqSIoHQqSj/eCLNa73vmSEqzM8xzVUO7bWcQ9PMiEUwHHnL5nFbiBCrzPeZ2w0MhoyCc+yuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=frcv4X/u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=vfOTmMY2VnDeaFEXs43JEC9lE4+T6jIeb61gvtSteOc=;
	b=frcv4X/uRDbhz5unS74OsgImT3UJZoYUtQrRWywnDqM2HNyU9RfVAAeQnf8r/UjHgDZoFv
	HCrSV4W4JP1o4uEnmvGjrvw73R3Juez7PjZ6ATO5sgZ5enwZAezLx8393bOEguC0GD4QpH
	UcRCszqwhrhE6dT/udY71I7cBdMo/qU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-fqR8ZUFLPRugcQokSWegpg-1; Mon,
 20 Jan 2025 08:45:38 -0500
X-MC-Unique: fqR8ZUFLPRugcQokSWegpg-1
X-Mimecast-MFC-AGG-ID: fqR8ZUFLPRugcQokSWegpg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 773751954196;
	Mon, 20 Jan 2025 13:45:36 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id EA41619560A3;
	Mon, 20 Jan 2025 13:45:31 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:45:11 +0100 (CET)
Date: Mon, 20 Jan 2025 14:45:05 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] seccomp: remove the 'sd' argument from __seccomp_filter()
Message-ID: <20250120134505.GA21290@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

After the previous change 'sd' is always NULL.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/seccomp.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index c29dfe82139e..75e293d3c1a1 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1213,13 +1213,12 @@ static int seccomp_do_user_notification(int this_syscall,
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
@@ -1227,12 +1226,9 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
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
 
@@ -1290,13 +1286,13 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
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
@@ -1338,8 +1334,7 @@ static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
 	return -1;
 }
 #else
-static int __seccomp_filter(int this_syscall, const struct seccomp_data *sd,
-			    const bool recheck_after_trace)
+static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 {
 	BUG();
 
@@ -1363,7 +1358,7 @@ int __secure_computing(void)
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


