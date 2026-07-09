Return-Path: <linux-mips+bounces-15670-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2wAQFlpOT2oMeAIAu9opvQ
	(envelope-from <linux-mips+bounces-15670-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:31:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D705A72DB8E
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 09:31:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=rDD9s7hG;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=pb4uTef1;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15670-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15670-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AB4930269F2
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 07:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D473DFC88;
	Thu,  9 Jul 2026 07:28:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CEB3DEAC6;
	Thu,  9 Jul 2026 07:28:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582134; cv=none; b=K18tdWxhgX57EXgeEK4WqDyfeOu1jQ5GdTQG27+hE+mBg+e9sf4Da+E9Fg7GvzJcmqipbJwlxIId0dCJymwMZcy0WK0qNc4Qp+Y9VtjwpL2FDiuQ375NhhZEzMvXwVD6Kv6xzHbNwZc/OuAmjN9Ot9bcLJ0VUWmyWrf9nNjFiQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582134; c=relaxed/simple;
	bh=LCpIL+TiJa4x0hODSCm4HzkhJ8EZgt7n+Zv0hjWJeE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5WNUnboIDk56qjYZwjgnDgj36HY1r5/S9686mfGT4vFxNxEL95x7+HlIHoKa5Hn9YgCeCgQWbmlIQOZzeAEfnZRw5PmyvgaEjuQT/jorFAARZKmkrJKsYZL98vniz/5QWPExQXoKQ7xCuFElLrwdkdB66kUFpeok9AYhkEKFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rDD9s7hG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pb4uTef1; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783582131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEDc4JGwTjnBJM4VIRhBrttWCi4Y5E+6FwHT5lHeL9U=;
	b=rDD9s7hG73npnJwrf1ze4KbiRXsHECqrEVbJPKbC9rVD3q14nK6NCNrTupPeWzDicxaOnq
	DO7S0EicYsa+fE975G7iLLBM2AySOEVTM4rG9u1GHtdb/ZWLT4n6AZ0FRg/SUawylWKiYU
	+9ccjKTqjrP0ZvsrVB7bYGrHVMurwqfFYGRqC46zmXyMblXJ4UrjypEIxugwjxmT6EhtYQ
	6at1o6hL/n0NQTtdC91N2b9KgfS3aw2Q0EZEnSHOxoPLX/A3klgbNWBV47QixnUNvBvL/B
	zTlKL80uxN6mxWeT7I+GbTiMCNGLJZoPTSj2ga1ZbxH1CNdaYGlYgaXStWuMFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783582131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEDc4JGwTjnBJM4VIRhBrttWCi4Y5E+6FwHT5lHeL9U=;
	b=pb4uTef1rxWwc/deB7t9tW+qkccDCM0NpuSxK8Z3gJNrD24D4zoen98TLbfIN+PT2XutAf
	WI+s2vbl2nEfIcBw==
Date: Thu, 09 Jul 2026 09:28:37 +0200
Subject: [PATCH 1/6] futex: Remove dependency on HAVE_GENERIC_VDSO from
 FUTEX_ROBUST_UNLOCK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260709-vdso-have_generic_vdso-v1-1-d2e1061f268b@linutronix.de>
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783582129; l=731;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LCpIL+TiJa4x0hODSCm4HzkhJ8EZgt7n+Zv0hjWJeE4=;
 b=GDuNaoeJV9bx7XMtHyOK+DqoHz39bGabElI5ejbBE4g0jZPRg3tu+qjbmUmYamxNeb8eTt5xD
 fD9xW53BOVCB2FS42W9+VxdhmdovSX5TRlAKRNNXTmjkJAyucR8rl2j
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15670-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:from_mime,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D705A72DB8E

The robust futex unlock functionality has no relation to the generic
vDSO functionality.

Remove the dependency.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 5230d4879b1c..53178ea4bc93 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1857,7 +1857,7 @@ config HAVE_FUTEX_ROBUST_UNLOCK
 	bool
 
 config FUTEX_ROBUST_UNLOCK
-	def_bool FUTEX && HAVE_GENERIC_VDSO && GENERIC_IRQ_ENTRY && RSEQ && HAVE_FUTEX_ROBUST_UNLOCK
+	def_bool FUTEX && GENERIC_IRQ_ENTRY && RSEQ && HAVE_FUTEX_ROBUST_UNLOCK
 
 config EPOLL
 	bool "Enable eventpoll support" if EXPERT

-- 
2.55.0


